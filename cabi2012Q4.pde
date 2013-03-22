// Trip Data Animation Generator, v2
// Written by Michael Schade, (c)2013
// This program requires two files for input:
// (1) a file that shows trip history data
// (2) a file that lists stations , including latitude and longitude
import java.util.Calendar;
import java.text.*;

// CHANGE these 4 values to the boundaries of the screen 
float minLng = -77.158883;  // west
float maxLng = -76.899047;  // east
float minLat = 38.803113;  // south
float maxLat = 38.95482;  // north 
// CHANGE these 2 values to the desired width and height of the movie
int screenWidth = 480;
int screenHeight = 360;
// CHANGE the vertical margin for the histogram
int histogramHeight = screenHeight - 180;
// the next 2 values are used to transfer lat/lng degrees into pixels
float xscale = screenWidth/(maxLng - minLng);
float yscale = screenHeight/(maxLat - minLat);
// the "activity" variables are used to build the histogram
int[] localActivity = new int[histogramHeight];
int[] globalActivity = new int[histogramHeight];
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

float latToY(double lat) {
  float f = (float)lat;
  // convert latitude degrees to y value in pixels (vertical)
  return screenHeight - (f - minLat)*yscale;
  }
  
float lngToX(double lng) {
  float f = (float)lng;
  // convert longitude degrees to x value in pixels (horizontal)
  return (f - minLng)*xscale;
  }
  
void drawBackground() { 
  // draw map and al the stations
  background(backgroundImage); 
  stroke(255);
  fill(255);  
  for (int rs = 0; rs < stations.length; rs++)  
    ellipse(lngToX(stations[rs].lng), latToY(stations[rs].lat), 3, 3);
  }    
  
void drawOverlay(int level, String day, String time, int bikes1, int bikes2) {  
  // draw histogram
  int x = 10;
  int y = 72; 
  stroke(223, 128, 0);
  for (int h = 0; h < level; h++)   
    line(x, y + h, x + 104.0*globalActivity[h]/maxActivity, y + h); 
  stroke(223, 223, 223);
  for (int h = 0; h < level; h++)   
    line(x, y + h, x + 104.0*localActivity[h]/maxActivity, y + h); 
  textSize(22); 
  fill(0,0,0);  
  text(day, x+1, y - 24);  
  text(time, x+1, y - 4); 
  text(bikes1, x, y + level + 19);  
  fill(223, 223, 0);  
  text(day, x+1, y - 25);  
  text(time, x+1, y - 5); 
  text(bikes1, x, y + level + 20);   
  text(bikes1+"/"+bikes2, x+1, y + level + 21); 
  fill(223, 128, 0);   
  text(bikes1+"/"+bikes2, x, y + level + 20);  
  fill(223, 223, 0);  
  text(day, x, y - 25);  
  text(time, x, y - 5);  
  text(bikes1+"/", x, y + level + 20); 
  fill(223, 223, 223);   
  text(bikes1, x, y + level + 20); 
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
  
String clock(double time) {    
  Calendar cal = Calendar.getInstance();   
  cal.setTimeInMillis((long)time*60000);
  return String.format("%02d:%02d", cal.get(Calendar.HOUR_OF_DAY), cal.get(Calendar.MINUTE));
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
  
void drawCircle(float x, float y, color dotColor, boolean blended, int radius) {
  int di = radius*2 - 1; 
  if (blended) {
    // use a more transparent methos
    PGraphics tempPage = createGraphics(di, di, JAVA2D);
    tempPage.beginDraw();
    tempPage.background(0);
    tempPage.noStroke();
    tempPage.fill(dotColor);  
    tempPage.ellipse(radius, radius, di, di);
    tempPage.endDraw();
    blend(tempPage, 0, 0, di, di, round(x) - radius, round(y) - radius, di, di, ADD);
    }
  else {
    // draw circles on top of each other
    fill(dotColor); 
    ellipse(x, y, di, di);
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
  /** use this code if the station list is in CSV format
  String stationList[] = loadStrings("stationList.csv");
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
  // CHANGE background image for your custom map
  // see "Made-to-Order Mapmaking" http://www.mvjantzen.com/blog/?p=3266
   backgroundImage = loadImage("cabiregion2.png"); 
  // CHANGE to show which column the value is stored in (1st column = 0)
  int startDate = 1;   
  int endDate = 3;   
  int startTerminal = 2;   
  int endTerminal = 4;   
  int subscriberType = 6;    
  // CHANGE to set start and end dtae/times for the animation
  int start = dateToMinutes("10/5/2012 16:00");
  int end = dateToMinutes("10/5/2012 16:10");
  // CHANGE to assign animation speed (in minutes)
  double frameInterval = 0.2;  // 0.2 = every 12 seconds
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
  int localActivityLevel;  
  int globalActivityLevel;  
  double p;  // portion between two end points; 0 to 1
  Calendar cal = Calendar.getInstance(); 
  String folder = "frames" + cal.get(Calendar.HOUR) + "-" + cal.get(Calendar.MINUTE) + "/";  
  println("Time range: " + start + " to " + end); 
  int frame = 0;
  noStroke(); 
  // CHANGE either assign the histogram's max value, or calculate it using the code below
  maxActivity = 307; 
  // if you don't know the max level, uncomment the code below
  /**
  for (double t = startTime; t <= endTime; t += frameInterval) { 
    globalActivityLevel = 0; 
    for (int i = 0; i < topTrip; i++)  
      if (t >= trips[i].startTime && t <= trips[i].endTime)     
        globalActivityLevel++;   
    maxActivity = max(maxActivity, globalActivityLevel);
    }
  println("Max activity: " + maxActivity); 
  **/  
  // "t" loops through each frame in the animation
  float pf;
  double startTime = (double)start;
  double endTime = (double)end; 
  for (double t = startTime; t <= endTime; t += frameInterval) { 
    double timeFactor = (t - startTime)/(endTime - startTime);  
    println((int)100*timeFactor + "%");  // show progress in console
    drawBackground();
    globalActivityLevel = 0; 
    localActivityLevel = 0; 
    color c2;
    for (int i = 0; i < topTrip; i++) {  // loop through all trips
      double ds = (double)trips[i].startTime;
      double de = (double)trips[i].endTime; 
      if (t >= ds && t <= de) {  
        int s1 = trips[i].startStation;  
        int s2 = trips[i].endStation;  
        double tripFactor = (t - ds)/(de - ds);
        float xPos = lngToX(stations[s1].lng + (stations[s2].lng - stations[s1].lng)*tripFactor);
        float yPos = latToY(stations[s1].lat + (stations[s2].lat - stations[s1].lat)*tripFactor); 
        if (xPos >= -5 && xPos < screenWidth + 5 && yPos >= -5 && yPos < screenHeight + 5) {
          drawCircle(xPos, yPos, 
            (trips[i].riderType == 'R') ? color(0, 0, 255, 191) : color(0, 255, 0, 191),
            false, 5);
          localActivityLevel++;  
          } 
        globalActivityLevel++;  
        } 
      }    
    if (floor((float)histogramHeight*(float)timeFactor) == nextLine) { 
      globalActivity[nextLine] = globalActivityLevel;
      localActivity[nextLine] = localActivityLevel;
      nextLine++;
      }  
    drawOverlay(nextLine - 1, 
      "10.5.12", clock(t),
      localActivityLevel, globalActivityLevel);
      //str(globalActivityLevel) + " bike" + ((globalActivityLevel == 1) ? "" : "s"));
    saveFrame(folder + "image-" + nf(frame++, 5) + ".png");
    }  
  println("Complete!");
  }

void draw() {  // Add window's pixels to movie 
  } 
