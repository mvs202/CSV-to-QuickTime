// Trip Data Animation Generator
// Written by Michael Schade, (c)2013
// This program requires two files for input:
// (1) a file that shows trip history data
// (2) a file that lists stations , including latitude and longitude
import java.util.Calendar;
import java.text.*;

// change these 4 values to the boundaries of the screen
float minLng = -77.158883;  // west
float maxLng = -76.899047;  // east
float minLat = 38.803113;  // south
float maxLat = 38.95482;  // north 
// change these 2 values to the desired width and height of the movie
int screenWidth = 480;
int screenHeight = 360;
// subtract a margin for the histogram
int histogramHeight = screenHeight - 100;
// the next 2 values are used to transfer lat/lng degrees into pixels
float xscale = screenWidth/(maxLng - minLng);
float yscale = screenHeight/(maxLat - minLat);
// the "activity" variables are used to build the histogram
int[] activity = new int[histogramHeight];
int maxActivity = 0;  
// use a map for the background of the animation
PImage backgroundImage;
// keep a list of all stations
Station[] stations; 
  
public class Station {
  public float lat;
  public float lng;
  public String id;    
  public Station (String latitude, String longitude, String stationID) {
    lat = parseFloat(latitude);
    lng = parseFloat(longitude);
    id = stationID;
    }
  }
  
public class Trip {
  public int startStation;
  public int startTime;
  public int endStation;
  public int endTime; 
  public char riderType; 
  public Trip (int station1, int time1, int station2, int time2, char rider) {
    startStation = station1;
    startTime = time1; 
    endStation = station2;
    endTime = time2; 
    riderType = rider;  
    }
  }

float latToY(float lat) {
  // convert latitude degrees to y value in pixels (vertical)
  return screenHeight - (lat - minLat)*yscale;
  }
  
float lngToX(float lng) {
  // convert longitude degrees to x value in pixels (horizontal)
  return (lng - minLng)*xscale;
  }
  
void drawBackground() { 
  // draw map and al the stations
  background(backgroundImage); 
  stroke(255);
  fill(255);  
  for (int rs = 0; rs < stations.length; rs++)  
    ellipse(lngToX(stations[rs].lng), latToY(stations[rs].lat), 3, 3);
  }    
  
void drawOverlay(int level, String day, String time, String labek) {  
  // draw histogram
  int x = screenWidth - 112;
  int y = 75;
  stroke(223, 223, 223);
  for (int h = 0; h < level; h++)   
    line(x, y + h, x + 104.0*activity[h]/maxActivity, y + h); 
  textSize(22);
  fill(0,0,0);  
  text(day, x+1, 51);  
  text(time, x+1, 71);  
  text(labek, x+1, level + 96); 
  fill(255, 255, 0);  
  text(day, x, 50);  
  text(time, x, 70);  
  text(labek, x, level + 95); 
  }    

int dateToMinutes(String d) {  
  // convert a text description into the number of minutes since 1/1/1970
  Calendar cal = Calendar.getInstance();
  SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm");
  try {
    cal.setTime(sdf.parse(d));
    }  
  catch (ParseException e) { 
    println("PARSE ERROR");  
    return 0;
    } 
  return round(cal.getTimeInMillis()/60000);
  }
  
int stationIndex(String value) {
  // input: the name of a station
  // output: its position in the main array
  for (int i=0; i<stations.length; i++) 
    if (stations[i].id.equals(value))
      return i;
  println("ERROR: Can't find station " + value);
  return -1; 
  } 
  
void drawCircle(float x, float y, color dotColor, boolean blended) {
  if (blended) {
    // use a more transparent methos
    PGraphics tempPage = createGraphics(13, 13, JAVA2D);
    tempPage.beginDraw();
    tempPage.background(0);
    tempPage.noStroke();
    tempPage.fill(dotColor);  
    tempPage.ellipse(7,7, 13, 13);
    tempPage.endDraw();
    blend(tempPage, 0, 0, 13, 13, round(x), round(y), 13, 13, ADD);
    }
  else {
    // draw circles on top of each other
    fill(dotColor); 
    ellipse(x, y, 11, 11);
    }
  }      
  
void showBounds() {
  // find the boundary for all stations
  float minLng = 180.0;  // west
  float maxLng = -180.0;  // east
  float minLat = 90.0; // south
  float maxLat = -90.0; // north
  for (int i = 0; i < stations.length; i++) {  
    minLng = min(minLng, stations[i].lng);
    maxLng = max(maxLng, stations[i].lng);
    minLat = min(minLat, stations[i].lat);
    maxLat = max(maxLat, stations[i].lat);
    }
  println("float minLng = " + minLng + ";  // west");
  println("float maxLng = " + maxLng + ";  // east");
  println("float minLat = " + minLat + ";  // south");
  println("float maxLat = " + maxLat + ";  // north");
  println("http://mvjantzen.com/tools/map.php?width=" + screenWidth + "&height=" + screenHeight + 
    "&top=" + maxLat + "&left=" + minLng + "&bottom=" + minLat + "&right=" + maxLng);
  }
  
void setup() {  
  String[] cols;
  int topTrip = 0;  // number of trips we've got stored in trips[]
  size(screenWidth, screenHeight);  // set size of drawing area
  backgroundImage = loadImage("cabiregion2.png"); 
  XML[] children = loadXML("http://capitalbikeshare.com/data/stations/bikeStations.xml").getChildren("station");
  stations = new Station[children.length + 2];
  String stationName;
  for (int i = 0; i < children.length; i++) {  
    stationName = children[i].getChild("name").getContent();
    if (stationName.equals("7th & F St NW / National Portrait Gallery")) 
      stationName = "8th & F St NW / National Portrait Gallery";
    stations[i] = new Station(children[i].getChild("lat").getContent(),
      children[i].getChild("long").getContent(),
      stationName);    
    }
  stations[children.length] = new Station("38.896544", "-77.038862", "White House [17th & State Pl NW]"); 
  stations[children.length + 1] = new Station("38.900343", "-77.032058", "McPherson Square - 14th & H St NW"); 
  //showBounds();
  /**
  String stationList[] = loadStrings("betterthanxml.csv");
  stations = new Station[stationList.length];
  for (int i = 0; i < stationList.length; i++) {
    cols = split(stationList[i], ",");
    stations[i] = new Station(cols[2], cols[3], cols[0]);
    }
  **/
  println("There are " + stations.length + " stations."); 
  String tripHistory[] = loadStrings("2012-4th-quarter.csv");
  println("There are " + tripHistory.length + " trips."); 
  Trip trips[] = new Trip[tripHistory.length]; 
  int t1, t2;
  // these next variables show which column the value is stored in
  int startDate = 1;   
  int endDate = 3;   
  int startTerminal = 2;   
  int endTerminal = 4;   
  int subscriberType = 6;    
  // go through each line in file and put data in an array
  for (int i = 0; i < tripHistory.length; i++) {
    cols = split(tripHistory[i], ",");
    t1 = dateToMinutes(cols[startDate]);
    t2 = dateToMinutes(cols[endDate]);
    if (t1 != t2 && 
        !cols[startTerminal].equals(cols[endTerminal]) && 
        !cols[startTerminal].equals("") && 
        !cols[endTerminal].equals("") && 
        !cols[startTerminal].equals("1714 Warehouse ") && 
        !cols[endTerminal].equals("1714 Warehouse ")) {
      trips[topTrip] = new Trip(stationIndex(cols[startTerminal]), t1,
        stationIndex(cols[endTerminal]), t2,
        (cols[subscriberType].equals("Casual")) ? 'C': 'R'); 
      topTrip++;
      }
    }    
  int nextLine = 0; 
  int activityLevel;  
  float p;  // portion between two end points; 0 to 1
  int start = dateToMinutes("10/5/2012 00:00");
  int end = dateToMinutes("10/5/2012 23:59");
  Calendar cal = Calendar.getInstance(); 
  String folder = "frames" + cal.get(Calendar.HOUR) + "-" + cal.get(Calendar.MINUTE) + "/";  
  println("Time range: " + start + " to " + end); 
  int frame = 0;
  noStroke(); 
  maxActivity = 307;
  // if you don't know the max level, uncomment the code below
  /**
  for (int t = start; t < end; t+=1) {
    activityLevel = 0; 
    for (int i = 0; i < topTrip; i++)  
      if (t >= trips[i].startTime && t <= trips[i].endTime)     
        activityLevel++;   
    maxActivity = max(maxActivity, activityLevel);
    }
  println("Max activity: " + maxActivity); 
  **/  
  // "t" loops through each frame in the animation
  // t+=1 means we have a new frame for every minute
  for (int t = start; t < end; t+=1) {
    println(100*(t - start)/(end - start) + "%, t = " + t);  // show progress in console
    drawBackground();
    activityLevel = 0; 
    for (int i = 0; i < topTrip; i++) {  // loop through all trips
      if (t >= trips[i].startTime && t <= trips[i].endTime) {  
        p = float(t - trips[i].startTime)/float(trips[i].endTime - trips[i].startTime); 
        int s1 = trips[i].startStation;  
        int s2 = trips[i].endStation;  
        drawCircle(lngToX(stations[s1].lng + (stations[s2].lng - stations[s1].lng)*p),
                   latToY(stations[s1].lat + (stations[s2].lat - stations[s1].lat)*p),
                   (trips[i].riderType == 'R') ? color(int(255*p), 0, 255, 191) : color(int(255*p), 255, 00, 191), 
                   false);
        activityLevel++;  
        }
      }    
    if (int(float(histogramHeight)*(t - start)/(end - start)) == nextLine) { 
      activity[nextLine] = activityLevel;
      nextLine++;
      }
    int clock = t - start;  // assume starting at midnight 
    int hour = floor(clock/60); 
    int min = clock % 60;  
    drawOverlay(nextLine - 1, 
      "10.5.12", 
      ((hour < 10) ? " " : "") + hour + ":" + ((min < 10) ? "0" : "") + min, 
      str(activityLevel) + " bike" + ((activityLevel == 1) ? "" : "s"));
    saveFrame(folder + "image-" + nf(frame++, 5) + ".png");
    }  
  }

void draw() {  // Add window's pixels to movie 
  } 
