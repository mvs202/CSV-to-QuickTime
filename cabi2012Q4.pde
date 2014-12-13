// Data Animation Generator, v2
// Written by Michael Schade, (c)2013 
import java.util.*;  
// get data from http://mvjantzen.com/cabi/cabixmlbuild.php
// add White House manually: 38.896494, -77.038947, 31210
String[] stopName = {"White House","20th & Bell St","18th & Eads St.","20th & Crystal Dr","15th & Crystal Dr","Aurora Hills Community Ctr/18th & Hayes St","Pentagon City Metro / 12th & S Hayes St","S Joyce & Army Navy Dr","Crystal City Metro / 18th & Bell St","12th & Army Navy Dr","27th & Crystal Dr","S Glebe & Potomac Ave","23rd & Crystal Dr","26th & S Clark St","19th St & Pennsylvania Ave NW","14th & V St NW","11th & Kenyon St NW","16th & Harvard St NW","Adams Mill & Columbia Rd NW","14th & Harvard St NW","Calvert & Biltmore St NW","Lamont & Mt Pleasant NW","4th & M St SW","15th & P St NW","14th & R St NW","14th & Rhode Island Ave NW","20th & E St NW","21st & I St NW","Georgia & New Hampshire Ave NW","14th St & Spring Rd NW","John McCormack Dr & Michigan Ave NE","5th & K St NW","19th & East Capitol St SE","Park Rd & Holmead Pl NW","Good Hope & Naylor Rd SE","Connecticut Ave & Newark St NW / Cleveland Park","Randle Circle & Minnesota Ave SE","Minnesota Ave Metro/DOES","Nannie Helen Burroughs & Minnesota Ave NE","Anacostia Metro","Good Hope Rd & MLK Ave SE","19th & E Street NW","4th & W St NE","10th & U St NW","Georgia Ave and Fairmont St NW","1st & N St  SE","20th St & Florida Ave NW","7th & T St NW","22nd & Eads St","M St & New Jersey Ave SE","Massachusetts Ave & Dupont Circle NW","1st & M St NE","21st & M St NW","17th & K St NW","3rd & H St NW","3rd & D St SE","Potomac & Pennsylvania Ave SE","14th & D St SE","17th & Corcoran St NW","Van Ness Metro / UDC","Florida Ave & R St NW","8th & Eye St SE / Barracks Row","Ward Circle / American University","Idaho Ave & Newark St NW [on 2nd District patio]","14th St Heights / 14th & Crittenden St NW","Anacostia Library","Pennsylvania & Minnesota Ave SE","Eastern Market / 7th & North Carolina Ave SE","14th St & New York Ave NW","Benning Branch Library","USDA / 12th & Independence Ave SW","Georgetown Harbor / 30th St NW","12th & Newton St NE","US Dept of State / Virginia Ave & 21st St NW","L'Enfant Plaza / 7th & C St SW","10th St & Constitution Ave NW","Kennedy Center","Eastern Market Metro / Pennsylvania Ave & 7th St SE","18th & M St NW","Tenleytown / Wisconsin Ave & Albemarle St NW","13th & H St NE","5th & F St NW","New York Ave & 15th St NW","Convention Center / 7th & M St NW","Harvard St & Adams Mill Rd NW","19th & L St NW","C & O Canal & Wisconsin Ave NW","6th & Water St SW / SW Waterfront","D St & Maryland Ave NE","34th St & Wisconsin Ave NW","13th St & New York Ave NW","8th & H St NW","10th & Monroe St NE","Eckington Pl & Q St NE","6th & H St NE","3rd & H St NE","Bladensburg Rd & Benning Rd NE","4th & East Capitol St NE","Lincoln Park / 13th & East Capitol St NE ","Branch & Pennsylvania Ave SE","13th & D St NE","New Hampshire Ave & T St NW","Metro Center / 12th & G St NW","14th & D St NW / Ronald Reagan Building","8th & F St NW / National Portrait Gallery","17th & K St NW / Farragut Square","20th & O St NW / Dupont South","4th & D St NW / Judiciary Square","19th St & Constitution Ave NW","37th & O St NW / Georgetown University","11th & H St NE","25th St & Pennsylvania Ave NW","Columbus Circle / Union Station","North Capitol St & F St NW","11th & M St NW","36th & Calvert St NW / Glover Park","14th & G St NW","Potomac Ave & 35th St S","Ohio Dr & West Basin Dr SW / MLK & FDR Memorials","11th & F St NW","23rd & E St NW ","Lynn & 19th St North","Rosslyn Metro / Wilson Blvd & Ft Myer Dr","Clarendon Blvd & Pierce St","Wilson Blvd & N Uhle St","N Rhodes & 16th St N","Fairfax Village","21st St & Constitution Ave NW","Wilson Blvd & N Edgewood St","Columbia Rd & Belmont St NW","17th & Rhode Island Ave NW","Thomas Circle","Wilson Blvd & Franklin Rd","Clarendon Blvd & N Fillmore St","Clarendon Metro / Wilson Blvd & N Highland St","18th St & Pennsylvania Ave NW","Maryland & Independence Ave SW","4th & E St SW","3rd & G St SE","7th & R St NW / Shaw Library","9th & Upshur St NW","1st & Rhode Island Ave NW","Columbia Rd & Georgia Ave NW","California St & Florida Ave NW","Benning Rd & East Capitol St NE / Benning Rd Metro","3000 Connecticut Ave NW / National Zoo","Anacostia Ave & Benning Rd NE / River Terrace ","M St & Pennsylvania Ave NW","15th St & Massachusetts Ave SE","Congress Heights Metro","N Quincy St & Glebe Rd","Wilson Blvd & N Oakland St","N Veitch  & 20th St N","11th & K St NW","Fairfax Dr & Wilson Blvd","Key Blvd & N Quinn St","1st & K St SE","39th & Calvert St NW / Stoddert","1st & Washington Hospital Center NW","Virginia Square Metro / N Monroe St & 9th St N","Central Library / N Quincy St & 10th St N","Washington Blvd & 10th St N","Jefferson Dr & 14th St SW","Smithsonian / Jefferson Dr & 12th St SW","George Mason Dr & Wilson Blvd","6th St & Indiana Ave NW","N Veitch & Key Blvd","N Adams St & Lee Hwy","15th & N Scott St","Washington Blvd & 7th St N","Ballston Metro / N Stuart & 9th St N","N Randolph St & Fairfax Dr","Jefferson Memorial","Good Hope Rd & 14th St SE","Glebe Rd & 11th St N","N Quincy St & Wilson Blvd","Fairfax Dr & Kenmore St","Gallaudet / 8th St & Florida Ave NE","20th & L St NW","12th & L St NW","21st St & Pennsylvania Ave NW","19th & K St NW","Prince St & Union St","Market Square / King St & Royal St","Saint Asaph St & Pendleton  St","King St & Patrick St","15th & K St NW","Commerce St & Fayette St","Henry St & Pendleton St","Braddock Rd Metro","King St Metro","24th & N St NW","10th & E St NW","22nd & I St NW / Foggy Bottom","Utah St & 11th St N ","Barton St & 10th St N","Arlington Blvd & N Queen St","Lincoln Memorial","20th St & Virginia Ave NW","5th St & Massachusetts Ave NW","39th & Veazey St NW","Fessenden St & Wisconsin Ave NW","M St & Delaware Ave NE","Columbia Pike & S Courthouse Rd","Walter Reed Community Center / Walter Reed Dr & 16th St S","28th St S & S Meade St","18th St & Wyoming Ave NW","5th & Kennedy St NW","Georgia Ave & Emerson St NW","14th & Upshur St NW","14th St & Colorado Ave NW","S Troy St & 26th St S","S Four Mile Run Dr & S Shirlington Rd","S Oakland St & Columbia Pike","S Abingdon St & 36th St S","S Arlington Mill Dr & Campbell Ave","S Kenmore & 24th St S","13th St & Eastern Ave","Wisconsin Ave & O St NW","S George Mason Dr & 13th St S","Connecticut & Nebraska Ave NW","17th St & Massachusetts Ave NW","15th & Euclid St  NW","8th & East Capitol St NE","New Jersey Ave & R St NW","15th & East Capitol St NE","8th & F St NE","18th St & Rhode Island Ave NE","15th & F St NE","12th & Irving St NE","34th St & Minnesota Ave SE","Alabama & MLK Ave SE","Pleasant St & MLK Ave SE","Neal St & Trinidad Ave NE","12th & U St NW","S George Mason Dr & Four Mile Run","S Stafford & 34th St S","N Pershing Dr & Wayne St","Columbia Pike & S Orme St","3rd St & Pennsylvania Ave SE","8th & D St NW","3rd & Elm St NW","Rhode Island Ave & V St NE","Constitution Ave & 2nd St NW/DOL","Washington & Independence Ave SW/HHS","Independence Ave & L'Enfant Plaza SW/DOE","Hamlin & 7th St NE","Columbia Pike & S Walter Reed Dr","Columbia Pike & S Dinwiddie St / Arlington Mill Community Center","Pershing & N George Mason Dr","Fenton St & New York Ave ","Bethesda Ave & Arlington Rd","Montgomery Ave & Waverly St ","Fallsgrove Blvd & Fallsgrove Dr","Traville Gateway Dr & Gudelsky Dr","Norfolk Ave & Fairmont St","E Montgomery Ave & Maryland Ave","Cordell & Norfolk Ave","Frederick Ave & Horners Ln","Philadelphia & Maple Ave","Maple & Ritchie Ave","Silver Spring Metro/Colesville Rd & Wayne Ave","Montgomery & East Ln","Friendship Hts Metro/Wisconsin Ave & Wisconsin Cir","14th & Belmont St NW","3rd & Tingey St SE","10th & Florida Ave NW","Potomac Ave & 8th St SE","Crabbs Branch Way & Redland Rd","Fallsgrove Dr & W Montgomery Ave","Monroe St & Monroe Pl","Needwood Rd & Eagles Head Ct","East West Hwy & Blair Mill Rd","Crabbs Branch Way & Calhoun Pl","47th & Elm St","Garland Ave & Walden Rd","Montgomery College/W Campus Dr & Mannakee St","Fenton St & Gist Ave","Carroll & Westmoreland Ave","Carroll & Ethan Allen Ave","Battery Ln & Trolley Trail","Norfolk & Rugby Ave","Offutt Ln & Chevy Chase Dr","Broschart & Blackwell Rd","Taft St & E Gude Dr","Fleet St & Ritchie Pkwy","Piccard & W Gude Dr","Ripley & Bonifant St","Georgia Ave & Spring St","Fenton St & Ellsworth Dr ","King Farm Blvd & Pleasant Dr","King Farm Blvd & Piccard Dr","Calvert St & Woodley Pl NW","New Jersey Ave & N St NW/Dunbar HS","Nannie Helen Burroughs Ave & 49th St NE","Deanwood Rec Center","Hains Point/Buckeye & Ohio Dr SW","Arlington Blvd & Fillmore St","Long Bridge Park/Long Bridge Dr & 6th St S","Old Georgetown Rd & Southwick St","Friendship Blvd & Willard Ave","North Capitol St & G Pl NE","31st & Woodrow St S","Washington Blvd & Walter Reed Dr ","TJ Cmty Ctr / 2nd St & S Old Glebe Rd","Connecticut Ave & Tilden St NW","Medical Center Dr & Key West Ave","Shady Grove Hospital","Veterans Pl & Pershing Dr ","Rockville Metro East","1st & H St NW","Fort Totten Metro","Takoma Metro","Rhode Island Ave Metro","Rolfe St & 9th St S","Shirlington Transit Center / S Quincy & Randolph St","Shady Grove Metro West","River Rd & Landy Ln","Rockville Metro West","Bethesda Metro","Iwo Jima Memorial/N Meade & 14th St N","34th & Water St NW","Duke St & John Carlyle St","Lee Hwy & N Cleveland St","Arlington Blvd & S George Mason Dr/NFATC","MLK Library/9th & G St NW","Lee Hwy & N Scott St","New Hampshire Ave & 24th St NW","Eisenhower Ave & Mill Race Ln","Potomac Greens Dr & Slaters Ln","Ballenger Ave & Dulaney St","Mount Vernon Ave & E Nelson Ave","Mount Vernon Ave & E Del Ray Ave","Monroe Ave & Leslie Ave","Mount Vernon Ave & Kennedy St","Court House Metro / 15th & N Uhle St ","Washington Adventist U / Flower Ave & Division St","6th & S Ball St","McKinley St & Connecticut Ave NW","15th & L St NW","17th & G St NW","Spring St & Second Ave","18th & R St NW","S Joyce & 16th St S","Union Market/6th St & Neal Pl NE","N Nelson St & Lee Hwy","21st St N & N Pierce St"};
float[] lats = {38.896494,38.8561,38.85725,38.8564,38.86017,38.857866,38.862303,38.8637,38.8573,38.8629,38.848441,38.8426,38.8533,38.850688,38.9003,38.9176,38.929464,38.926088,38.922925,38.9268,38.923203,38.9319,38.8767,38.90985,38.912682,38.9086,38.8963,38.9008,38.936043,38.9375,38.9346,38.90304,38.8896,38.9308,38.8601,38.934267,38.878,38.897063,38.901385,38.862669,38.867373,38.8952,38.919077,38.9172,38.9249,38.8743,38.9154,38.9155,38.854132,38.8763,38.9101,38.9057,38.90534,38.90276,38.899408,38.8851,38.8803,38.884,38.9121,38.944551,38.9126,38.8792,38.938736,38.934751,38.947774,38.865784,38.873057,38.886952,38.899632,38.894,38.887237,38.9022212,38.933668,38.894919,38.886266,38.893028,38.895184,38.884,38.904742,38.947607,38.9003,38.897222,38.8991,38.90572,38.927872,38.903407,38.90375,38.87675,38.894758,38.916442,38.900283,38.8997,38.932514,38.910972,38.899972,38.900412,38.900413,38.889955,38.890461,38.8692,38.894832,38.91554,38.898364,38.894514,38.896891,38.902061,38.908905,38.895344,38.8923,38.90774,38.899983,38.903827,38.89696,38.897446,38.905607,38.922581,38.898069,38.844015,38.88412,38.897857,38.896104,38.897315,38.8946,38.893648,38.891696,38.892164,38.86559,38.892459,38.889,38.920669,38.906602,38.9059,38.8904,38.8881,38.88786,38.89968,38.887299,38.88412,38.881185,38.912719,38.9418,38.915417,38.928156,38.917761,38.889935,38.930282,38.896544,38.905126,38.88732,38.844711,38.876393,38.8815,38.896923,38.90268,38.885801,38.896015,38.87861,38.922649,38.928743,38.882788,38.88397,38.884734,38.888553,38.888767,38.87887,38.894573,38.893241,38.89593,38.89054,38.880834,38.881044,38.882629,38.879819,38.866611,38.883921,38.880151,38.884616,38.90509,38.903584,38.903819,38.901539,38.902204,38.803124,38.804718,38.810743,38.805317,38.902,38.805648,38.811456,38.814577,38.805767,38.9066,38.895914,38.90088,38.883669,38.884961,38.889365,38.888251,38.894722,38.90093,38.943837,38.954812,38.905707,38.863833,38.857803,38.846222,38.918809,38.956595,38.949662,38.942016,38.956432,38.847977,38.8444,38.860789,38.835213,38.84232,38.848454,38.987,38.90849,38.854691,38.955016,38.908142,38.92333,38.889988,38.912659,38.889908,38.897274,38.927095,38.897195,38.928644,38.884085,38.843222,38.863897,38.903732,38.916787,38.852248,38.834108,38.880705,38.867262,38.887378,38.894851,38.917622,38.918155,38.892275,38.88731,38.887312,38.927497,38.862478,38.856319,38.871822,38.985404,38.981103,38.983838,39.096312,39.093783,38.988562,39.084125,38.98954,39.094772,38.98128,38.983627,38.99521,38.983525,38.961763,38.921074,38.87501,38.920387,38.876737,39.120045,39.099376,39.083705,39.123513,38.990249,39.107709,38.982456,39.000578,39.095661,38.989724,38.975,38.977933,38.992375,38.990639,38.977093,39.102099,39.094103,39.076331,39.102212,38.992679,38.999388,38.997033,39.114688,39.110314,38.923583,38.90706,38.898536,38.908473,38.878433,38.873755,38.86646,38.999634,38.96115,38.899703,38.837666,38.873219,38.869418,38.941154,39.103091,39.097636,38.997445,39.085394,38.900358,38.952369,38.975219,38.920682,38.866471,38.839912,39.119765,38.964992,39.084379,38.984691,38.88992,38.903582,38.804378,38.894941,38.869442,38.898404,38.897612,38.901755,38.801111,38.82175,38.802677,38.820064,38.82595,38.820932,38.833077,38.890612,38.986743,38.864702,38.96497,38.90381,38.89841,38.997653,38.912648,38.859254,38.908008,38.895929,38.898984};
float[] lngs = {-77.038947,-77.0512,-77.05332,-77.0492,-77.049593,-77.05949,-77.059936,-77.0633,-77.0511,-77.0528,-77.051516,-77.0502,-77.0498,-77.05152,-77.0429,-77.0321,-77.027822,-77.036536,-77.042581,-77.0322,-77.047637,-77.0388,-77.0178,-77.034438,-77.031681,-77.0323,-77.045,-77.047,-77.024649,-77.0328,-76.9955,-77.019027,-76.9769,-77.0315,-76.9672,-77.057979,-76.9607,-76.947446,-76.941877,-76.994637,-76.988039,-77.0436,-77.000648,-77.0259,-77.0222,-77.0057,-77.0446,-77.0222,-77.053703,-77.0037,-77.0444,-77.0056,-77.046774,-77.03863,-77.015289,-77.0023,-76.9862,-76.9861,-77.0387,-77.063896,-77.0135,-76.9953,-77.087171,-77.074647,-77.032818,-76.9784,-76.971015,-76.996806,-77.031686,-76.947974,-77.028226,-77.059219,-76.991016,-77.046587,-77.022241,-77.026013,-77.054845,-76.995397,-77.041606,-77.079382,-76.9882,-77.019347,-77.0337,-77.022264,-77.043358,-77.043648,-77.06269,-77.02127,-76.997114,-77.0682,-77.029822,-77.023086,-76.992889,-77.00495,-76.998347,-77.001949,-76.982872,-77.000349,-76.988355,-76.9599,-76.987633,-77.03818,-77.027869,-77.031617,-77.022916,-77.038322,-77.04478,-77.016106,-77.0436,-77.071652,-76.991383,-77.053485,-77.00493,-77.009888,-77.027137,-77.070334,-77.031823,-77.050537,-77.04657,-77.026975,-77.049882,-77.070993,-77.072305,-77.076701,-77.0846,-77.079375,-76.952103,-77.046567,-77.0925,-77.04368,-77.038785,-77.0325,-77.0889,-77.09308,-77.094875,-77.041539,-77.018939,-77.017445,-77.001828,-77.022155,-77.0251,-77.012289,-77.02344,-77.04062,-76.93723,-77.055599,-76.96012,-77.056887,-76.983569,-76.987823,-77.107735,-77.10396,-77.086502,-77.02674,-77.097745,-77.078107,-77.006004,-77.077271,-77.012457,-77.103148,-77.10783,-77.093485,-77.032429,-77.02858,-77.1207,-77.01994,-77.086045,-77.089006,-77.08095,-77.091129,-77.111768,-77.109366,-77.037413,-76.985238,-77.116817,-77.107673,-77.10108,-76.9941,-77.044789,-77.0284,-77.046564,-77.04337,-77.040363,-77.043363,-77.044664,-77.049883,-77.03353,-77.05293,-77.050276,-77.052808,-77.06072,-77.05152,-77.026064,-77.048911,-77.113905,-77.08777,-77.077294,-77.049426,-77.045128,-77.018677,-77.077078,-77.082426,-77.003041,-77.080319,-77.086733,-77.069275,-77.041571,-77.019815,-77.027333,-77.032652,-77.032947,-77.075104,-77.085931,-77.09586,-77.094295,-77.089555,-77.084918,-77.029417,-77.063586,-77.100555,-77.069956,-77.038359,-77.0352,-76.995193,-77.017669,-76.983326,-76.994749,-76.978924,-76.983575,-76.990955,-76.957461,-76.999388,-76.990037,-76.987211,-77.028139,-77.105022,-77.087323,-77.08596,-77.072315,-77.001955,-77.02324,-77.01597,-77.004746,-77.013917,-77.01397,-77.025762,-76.997194,-77.086599,-77.11153,-77.107906,-77.023082,-77.097426,-77.09221,-77.192672,-77.202501,-77.096539,-77.151291,-77.098029,-77.145213,-77.011336,-77.006311,-77.02918,-77.095367,-77.085998,-77.031887,-77.0024,-77.025672,-76.994468,-77.156985,-77.188014,-77.149443,-77.15741,-77.02935,-77.152072,-77.091991,-77.00149,-77.159048,-77.023854,-77.01121,-77.006472,-77.100104,-77.100239,-77.094589,-77.200322,-77.132954,-77.141378,-77.177091,-77.029457,-77.031555,-77.025608,-77.171487,-77.182669,-77.050046,-77.015231,-76.931862,-76.933099,-77.03023,-77.089233,-77.04826,-77.109647,-77.088659,-77.008911,-77.09482,-77.082104,-77.095596,-77.062036,-77.196442,-77.196636,-77.023894,-77.145803,-77.012108,-77.002721,-77.016855,-76.995876,-77.076131,-77.087083,-77.166093,-77.103381,-77.146866,-77.094537,-77.071301,-77.067786,-77.060866,-77.09169,-77.104503,-77.024281,-77.080851,-77.051084,-77.068952,-77.047494,-77.063562,-77.057619,-77.058541,-77.053096,-77.059821,-77.084801,-77.000035,-77.048672,-77.075946,-77.034931,-77.039624,-77.034499,-77.041834,-77.063275,-76.996985,-77.105246,-77.078317};
int[] stations = {31210,31000,31001,31002,31003,31004,31005,31006,31007,31008,31009,31010,31011,31012,31100,31101,31102,31103,31104,31105,31106,31107,31108,31201,31202,31203,31204,31205,31400,31401,31502,31600,31601,31602,31700,31305,31702,31703,31704,31801,31802,31206,31500,31111,31207,31209,31110,31109,31013,31208,31200,31603,31212,31213,31604,31605,31606,31607,31214,31300,31503,31608,31301,31302,31402,31804,31805,31610,31216,31705,31217,31215,31501,31220,31218,31219,31211,31613,31221,31303,31611,31620,31222,31223,31112,31224,31225,31609,31612,31226,31227,31228,31504,31505,31615,31616,31617,31618,31619,31701,31622,31229,31230,31231,31232,31233,31234,31621,31235,31236,31614,31237,31623,31624,31266,31304,31238,31052,31240,31262,31260,31014,31015,31016,31017,31018,31706,31261,31019,31113,31239,31241,31020,31021,31022,31242,31243,31244,31625,31245,31404,31506,31115,31116,31707,31307,31708,31246,31626,31806,31035,31033,31029,31263,31023,31027,31628,31306,31507,31024,31025,31026,31247,31248,31036,31264,31028,31030,31031,31032,31037,31034,31249,31803,31038,31039,31040,31508,31250,31251,31252,31253,31041,31042,31043,31044,31254,31045,31046,31047,31048,31255,31256,31257,31049,31050,31051,31258,31259,31265,31308,31309,31627,31053,31054,31055,31114,31403,31405,31406,31407,31056,31057,31058,31059,31060,31061,32006,31312,31062,31310,31267,31117,31629,31509,31630,31631,31510,31632,31511,31709,31800,31807,31512,31268,31063,31064,31065,31066,31269,31270,31118,31513,31271,31272,31633,31514,31067,31068,31069,32001,32002,32003,32004,32005,32000,32007,32008,32009,32010,32011,32012,32013,32014,31119,31634,31120,31635,32015,32016,32017,32018,32019,32020,32021,32022,32023,32024,32025,32026,32027,32028,32029,32030,32031,32032,32033,32034,32035,32036,32037,32038,31121,31636,31710,31711,31273,31070,31071,32039,32040,31637,31072,31073,31074,31313,32041,32042,32043,32044,31638,31515,31408,31516,31075,31076,32045,32046,32047,32048,31077,31314,31081,31079,31078,31274,31080,31275,31082,31083,31084,31085,31086,31087,31088,31089,32049,31090,31315,31276,31277,32050,31278,31091,31517,31092,31093};
Boolean[] stationInUse = new Boolean[stations.length];
Boolean[] stationInFocus = new Boolean[stations.length];
//ArrayList<Integer>[] recentRegRides = (ArrayList<Integer>[])new ArrayList[stations.length];
float minLng;  // left
float maxLng;  // right
float minLat;  // bottom
float maxLat;  // top
int swidth;
int sheight;
int tickCount = 0;
int histogramWidth;
String movieTitle; 
int[] groupA;   
int[] groupB; 
int[] into; 
int[] within; 
int[] outof; 
PImage bg;
color c1;  
color c1t;
color c2;  
color c2t;
List<CaBiTrip> validTrips;
color enteringColor = color(109, 197, 58, 153);   
color stayingColor = color(246, 93, 85, 153);
color leavingColor = color(8, 170, 245, 153);  
color enteringColorSolid;   
color stayingColorSolid;   
color leavingColorSolid;   
int maxBusiest = 0;
int[][] tripRiders;
int[][] tripRidersCas;
int mostRidersPerStation;
int maxRidersPerRoute = 0;
int displayMethod; 
int CHARCOAL = 0;
int CLUSTER = 1;
int RIDERTYPE = 2;
  
public class CaBiTrip { 
  public int bikeoutStation;
  public int bikeinStation;
  public int bikeoutTime;
  public int bikeinTime;
  public Boolean isRegistered; 
  public CaBiTrip(int stationA, int stationB, int timeA, int timeB, Boolean r) { 
    bikeoutStation = stationA;
    bikeinStation = stationB;
    bikeoutTime = timeA;
    bikeinTime = timeB;
    if (bikeinTime < bikeoutTime) bikeinTime += 60*060*24;  // bike was returned the next day
    isRegistered = r;
    }     
  }
  
public class cabiCircle implements Comparable<cabiCircle> { 
  public float x, y;
  public int radius;  
  public Boolean selected;
  public cabiCircle(float X, float Y, int R, Boolean B) {
    x = X;
    y = Y;
    radius = R;
    selected = B;
    }
  @Override public int compareTo(cabiCircle that) {  // so that "sort" function will work
    if (this.radius < that.radius) return -1;
    if (this.radius > that.radius) return 1;
    return 0;
    }     
  }

float toY(float lat) {
  return sheight - sheight*(lat - minLat)/(maxLat - minLat);
  }

float toX(float lng) {
  return swidth*(lng - minLng)/(maxLng - minLng);
  } 

void drawBackground() {
  int radius;
  int traffic;
  if (displayMethod == CHARCOAL) {
    cabiCircle[] circles = new cabiCircle[stations.length];
    strokeWeight(3);
    fill(241, 89, 42);
    int busiestStation = 0;
    int[] tripsToFromStation = new int[stations.length];
    for (int i = 0; i < stations.length; i++) {
      tripsToFromStation[i] = 0;
      for (int j = 0; j < stations.length; j++) {
        traffic = tripRiders[i][j] + tripRidersCas[i][j] + tripRiders[j][i] + tripRidersCas[j][i];
        tripsToFromStation[i] += traffic;
        }
      busiestStation = max(busiestStation, tripsToFromStation[i]);
      } 
    for (int rs = 0; rs < stations.length; rs++) {  
      radius = 10 + round(5*84*tripsToFromStation[rs]/2572);  // 2572 = maxBusiest > busiestStation  
      circles[rs] = new cabiCircle(toX(lngs[rs]), toY(lats[rs]), radius, stationInFocus[rs]);
      }
    Arrays.sort(circles);  // so the smaller circles are drawn on top of the larger circles
    for (int rs = stations.length - 1; rs >= 0; rs--) {
      if (circles[rs].selected) {
        stroke(0);
        fill(255);
        }
      else {
        stroke(85);
        fill(170);
        }
      ellipse(circles[rs].x, circles[rs].y, circles[rs].radius, circles[rs].radius);  
      }
    maxBusiest = max(maxBusiest, busiestStation);
    } 
  else {
  strokeWeight(3);
  fill(241, 89, 42);
  int busiestStation = 0;
  int[] tripsToFromStation = new int[stations.length];
  for (int i = 0; i < stations.length; i++) {
    tripsToFromStation[i] = 0;
    for (int j = 0; j < stations.length; j++) {
      traffic = tripRiders[i][j] + tripRidersCas[i][j] + tripRiders[j][i] + tripRidersCas[j][i];
      tripsToFromStation[i] += traffic;
      }
    busiestStation = max(busiestStation, tripsToFromStation[i]);
    }
  for (int rs = 0; rs < stations.length; rs++) { 
    if (stationInFocus[rs]) 
      radius = 9;
    else
      radius = 6;
    if (stationInUse[rs]) {
      stroke(0, 255);
      fill(255, 255); 
      }
    else {  
      stroke(0, 159);
      fill(255, 159); 
      }
    ellipse(toX(lngs[rs]), toY(lats[rs]), radius, radius);
    } 
  maxBusiest = max(maxBusiest, busiestStation);
    }
  }   
  
Boolean EastoftheRiver(int x) {
  return (x >= 31700 && x <= 31807);
  }
  
Boolean Virginia(int x) {
  return (x >= 31000 && x <= 31077);
  }
  
Boolean isCrystalCity(int x) {
  return (x >= 31000 && x <= 31003) || x == 31007 || (x >= 31009 && x <= 31013) || x == 31052;
  }
  
Boolean isGreaterCrystalCity(int x) {
  return (x >= 31000 && x <= 31013) || x == 31052 || x == 31071 || x == 31090 || x == 31091;
  }
  
Boolean inZone(int x) { 
  return isGreaterCrystalCity(x);
  //return true;
  //return (x == 31109 || x == 31245);  // Jefferson Memorial
  //return ((x >= 31000 && x <= 31040) || (x >= 31049 && x <= 31077));  // Arlington
  //return (x == 31249);  // Jefferson Memorial
  //return (x == 31247);  // Jefferson Dr & 14th St SW
  //return (x == 31258);  //Lincoln Memorial
  //return (x == 31217 || x == 31235 || x == 31243 || x == 31247 || x == 31248 || x == 31240 || x == 31249 || x == 31258 || x == 31261 || x == 31271 || x == 31273 || x == 31633 || x == 31272);
  }

void drawHistogram(int frame) {
  textAlign(RIGHT); 
  textSize(16); 
  strokeText(movieTitle, swidth - 10, sheight - 56);
  textSize(14);
  strokeText("Jan 1 - Sep 30, 2014", swidth - 10, sheight - 37); 
  if (displayMethod == CHARCOAL) { 
    textSize(28);
    strokeText(toHHMM(frame), swidth - 10, sheight - 9); 
    }
  int scale = 36;
  strokeWeight(1);
  int midpoint;
  int midpoint2;
  int baseline = sheight - 15;
  int leftEdge = 20;
  for (int h = 0; h < tickCount; h = h+1) {
    stroke(c1);
    midpoint = baseline - groupA[h]/scale;
    line(leftEdge + h, baseline, leftEdge + h, midpoint);
    stroke(c2);
    line(leftEdge + h, midpoint - 1, leftEdge + h, midpoint - 1 - groupB[h]/scale);
    }
  for (int h = 0; h < 0*tickCount; h = h+1) {
    stroke(leavingColorSolid);
    midpoint = baseline - outof[h]/scale;
    midpoint2 = midpoint - within[h]/scale;
    line(leftEdge + h, baseline, leftEdge + h, midpoint);
    stroke(stayingColorSolid);
    line(leftEdge + h, midpoint - 1, leftEdge + h, midpoint2);
    stroke(enteringColorSolid);
    line(leftEdge + h, midpoint2 - 1, leftEdge + h, midpoint2 - into[h]/scale);
    }
  textSize(12);
  textAlign(CENTER);
  strokeText(toHHMM(frame), leftEdge + tickCount, sheight - 3);
  // now draw the key
  textAlign(RIGHT); 
  strokeText(str(groupA[tickCount - 1]), swidth - 82, sheight - 4); // should be from current data, not histogram - FIX
  strokeText(str(groupB[tickCount - 1]), swidth - 82, sheight - 20); 
  fill(c1); 
  noStroke();
  rect(swidth - 80, sheight - 17, 70, 14, 3);
  fill(c2); 
  rect(swidth - 80, sheight - 32, 70, 14, 3);
  fill(255); 
  textAlign(CENTER);
  text("registered", swidth - 45, sheight - 5);   
  text("casual", swidth - 45, sheight - 21); 
   /*
  strokeText(movieTitle, swidth - 10, sheight - 69);
  textSize(12);
  strokeText("Jul 1 - Sep 30, 2014", swidth - 10, sheight - 52); 
  textAlign(RIGHT); 
  strokeText(str(into[tickCount - 1]), swidth - 118, sheight - 36);  
  strokeText(str(within[tickCount - 1]), swidth - 118, sheight - 20);  
  strokeText(str(outof[tickCount - 1]), swidth - 118, sheight - 4); 
  int totalTrips = into[tickCount - 1] + within[tickCount - 1] + outof[tickCount - 1];
  if (totalTrips > 0) {
    strokeText("(" + str(round(100.0*into[tickCount - 1]/totalTrips)) + "%)", swidth - 82, sheight - 36);  
    strokeText("(" + str(round(100.0*within[tickCount - 1]/totalTrips)) + "%)", swidth - 82, sheight - 20);  
    strokeText("(" + str(round(100.0*outof[tickCount - 1]/totalTrips)) + "%)", swidth - 82, sheight - 4); 
    }
  noStroke();
  fill(enteringColorSolid); 
  rect(swidth - 80, sheight - 47, 70, 14, 3);
  fill(stayingColorSolid); 
  rect(swidth - 80, sheight - 32, 70, 14, 3);
  fill(leavingColorSolid); 
  rect(swidth - 80, sheight - 17, 70, 14, 3);
  fill(255); 
  textAlign(CENTER);
  text("entering", swidth - 45, sheight - 36);   
  text("within", swidth - 45, sheight - 21); 
  text("leaving", swidth - 45, sheight - 5); 
  */
  }

String toHHMM(int seconds) {
  int hours = floor(seconds/3600);
  seconds -= hours*3600;
  int mins = floor(seconds/60);
  String hh;
  String mm;
  if (hours < 10) 
    hh = "0" + str(hours);
  else
    hh = str(hours);
  if (mins < 10) 
    mm = "0" + str(mins);
  else
    mm = str(mins);
  return hh + ":" + mm;
  }

int timeToSeconds(String time) { 
  String[] daytime = split(time, " ");
  String[] mdy = split(daytime[0], "/"); 
  String[] hm = split(daytime[1], ":");
  if (hm.length < 2)
    return -1;
  return 3600*parseInt(hm[0]) + 60*parseInt(hm[1]);
  } 

void partialBezier(float t0, float t1, float x1, float y1, float bx1, float by1, float bx2, float by2, float x2, float y2) {  
  float u0 = 1.0 - t0;
  float u1 = 1.0 - t1;
  float qxa =  x1*u0*u0 + bx1*2*t0*u0 + bx2*t0*t0;
  float qxb =  x1*u1*u1 + bx1*2*t1*u1 + bx2*t1*t1;
  float qxc = bx1*u0*u0 + bx2*2*t0*u0 +  x2*t0*t0;
  float qxd = bx1*u1*u1 + bx2*2*t1*u1 +  x2*t1*t1;
  float qya =  y1*u0*u0 + by1*2*t0*u0 + by2*t0*t0;
  float qyb =  y1*u1*u1 + by1*2*t1*u1 + by2*t1*t1;
  float qyc = by1*u0*u0 + by2*2*t0*u0 +  y2*t0*t0;
  float qyd = by1*u1*u1 + by2*2*t1*u1 +  y2*t1*t1;
  float xa = qxa*u0 + qxc*t0;
  float xb = qxa*u1 + qxc*t1;
  float xc = qxb*u0 + qxd*t0;
  float xd = qxb*u1 + qxd*t1;
  float ya = qya*u0 + qyc*t0;
  float yb = qya*u1 + qyc*t1;
  float yc = qyb*u0 + qyd*t0;
  float yd = qyb*u1 + qyd*t1; 
  bezier(xa, ya, xb, yb, xc, yc, xd, yd); 
  }
  
void gradientBezier(float x1, float y1, float midx, float midy, float x2, float y2) {  
  stroke(255,0,0,40); partialBezier(0.0, 0.0833, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(250,0,0,48); partialBezier(0.0833, 0.1667, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(245,0,0,56); partialBezier(0.1667, 0.25, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(240,0,0,64); partialBezier(0.25, 0.3333, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(235,0,0,72); partialBezier(0.3333, 0.4167, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(230,0,0,80); partialBezier(0.4167, 0.5, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(225,0,0,88); partialBezier(0.5, 0.5833, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(220,0,0,96); partialBezier(0.5833, 0.6667, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(215,0,0,104); partialBezier(0.6667, 0.75, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(210,0,0,112); partialBezier(0.75, 0.8333, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(205,0,0,120); partialBezier(0.8333, 0.9167, x1, y1, midx,midy,midx,midy, x2, y2);
  stroke(200,0,0,128); partialBezier(0.9167, 1.0, x1, y1, midx,midy,midx,midy, x2, y2);
  }
  
void strokeText(String message, int x, int y) { 
  fill(255); 
  text(message, x-2, y); 
  text(message, x, y-2); 
  text(message, x+2, y); 
  text(message, x, y+2); 
  fill(0); 
  text(message, x, y); 
  } 

void getStats() {
  CaBiTrip trip;
  int[] tripsPerStation = new int[stations.length]; 
  int[] casualTripsPerStation = new int[stations.length]; 
  int totalTrips = 0;
  int totalCasualTrips = 0;
  for (int i = 0; i < tripsPerStation.length; i++) {
    tripsPerStation[i] = 0;
    casualTripsPerStation[i] = 0;
    }
  for (int t = 0; t < validTrips.size(); t++) { 
    trip = validTrips.get(t);
    if (!trip.isRegistered) {
      casualTripsPerStation[trip.bikeoutStation]++;
      casualTripsPerStation[trip.bikeinStation]++;
      }
    tripsPerStation[trip.bikeoutStation]++;
    tripsPerStation[trip.bikeinStation]++;
    }
  println("trips (to and from) per station:");
  for (int i = 0; i < tripsPerStation.length; i++) {
    println(tripsPerStation[i] + ": " + stopName[i]);
    //println(round(1000.0*casualTripsPerStation[i]/tripsPerStation[i])/10.0 + ": " + stopName[i] + " (" + tripsPerStation[i] + ")");
    totalTrips += tripsPerStation[i];
    totalCasualTrips += casualTripsPerStation[i];
    }
  println(round(1000.0*totalCasualTrips/totalTrips)/10.0 + ": TOTAL (" + totalTrips + ")");
  println("***********************************");
  }

void setBoundary(String background, float south, float west, float north, float east, int w, int h, List<Integer> validStations, String s) {  
  bg = loadImage(background); 
  minLng = west;  // left
  maxLng = east;  // right
  minLat = south;  // bottom
  maxLat = north;   // top
  swidth = w;
  sheight = h; 
  for (int i = 0; i < stationInFocus.length; i++) 
    stationInFocus[i] = validStations.contains(stations[i]);
  movieTitle = s; 
  }

void setDatasource(String csvFile, int outStation, int inStation, int outTime, int inTime, int reg) {
  String trips[];
  int stationA;
  int stationB;
  int outId;
  int inId;
  trips = loadStrings(csvFile);
  int newCount = 0;
  for (int t = 1; t < trips.length; t++) {
    String[] cols = split(trips[t], ",");
    stationA = 0;
    stationB = 0;
    outId = parseInt(cols[outStation]);
    inId = parseInt(cols[inStation]);
    if (outId != 32901 && outId != 32900 && inId != 32901 && inId != 32900) {  // skip warehouse trips
      while (stationA < stations.length && stations[stationA] != outId) stationA++;
      while (stationB < stations.length && stations[stationB] != inId) stationB++; 
      if (stationA >= stations.length || stationB >= stations.length)
        println("ERROR: BAD STATION: " + trips[t]);
      else if ((stationInFocus[stationA] || stationInFocus[stationB])) {
        validTrips.add(new CaBiTrip(stationA, stationB, timeToSeconds(cols[outTime]), timeToSeconds(cols[inTime]), cols[reg].equals("Registered")));
        newCount++; 
        }  
      }
    }
  println(newCount + " trips added from " + csvFile);
  }
  
List<Integer> crystalCity() {
  List<Integer> list = new ArrayList<Integer>(stations.length);
  int id;
  for (int i = 0; i < stations.length; i++) {
    id = stations[i];
    if ((id >= 31000 && id <= 31003) || id == 31007 || (id >= 31009 && id <= 31013) || id == 31052)
      list.add(id); 
    }
  return list;
  }
  
List<Integer> all() {
  List<Integer> list = new ArrayList<Integer>(stations.length); 
  for (int i = 0; i < stations.length; i++) 
    list.add(stations[i]);  
  return list;
  }
  
List<Integer> greaterCrystalCity() {
  List<Integer> list = new ArrayList<Integer>(stations.length);
  int id;
  for (int i = 0; i < stations.length; i++) {
    id = stations[i]; 
    if ((id >= 31000 && id <= 31013) || id == 31052 || id == 31071 || id == 31090 || id == 31091)
      list.add(id); 
    }
  return list;
  }
  
List<Integer> arlington() {
  List<Integer> list = new ArrayList<Integer>(stations.length);
  int id;
  for (int i = 0; i < stations.length; i++) {
    id = stations[i]; 
    if ((id >= 31000 && id <= 31040) || (id >= 31049 && id <= 31080) || (id >= 31089 && id <= 31090))
      list.add(id); 
    }
  return list;
  } 
  
List<Integer> centerForTotalHealth() {
  List<Integer> list = new ArrayList<Integer>(stations.length);
  list.add(31616); 
  list.add(31623); 
  return list;
  }
  
List<Integer> q7th() {
  List<Integer> list = new ArrayList<Integer>(stations.length);
  list.add(31109); 
  list.add(31245); 
  list.add(31509); 
  return list;
  }
  
List<Integer> lincoln() {
  List<Integer> list = new ArrayList<Integer>(stations.length);
  list.add(31258);  
  return list;
  }
  
List<Integer> jefferson() {
  List<Integer> list = new ArrayList<Integer>(stations.length);
  list.add(31249);  
  return list;
  }
  
List<Integer> virg20th() {
  List<Integer> list = new ArrayList<Integer>(stations.length);
  list.add(31204);  
  list.add(31206);  
  list.add(31220);  
  list.add(31259);  
  return list;
  }
  
List<Integer> rosslyn() {
  List<Integer> list = new ArrayList<Integer>(stations.length);
  list.add(31014); 
  list.add(31015); 
  /*
  list.add(31016);
  list.add(31018); 
  list.add(31027);
  list.add(31031);   
  list.add(31051); 
  list.add(31077); 
  list.add(31080); 
  list.add(31093); 
  */
  return list;
  }

color blend(color A, color B, float factor) {  
  // factor = 0.0: all A
  // factor = 0.5: half A + half B
  // factor = 1.0: all B
  return color(red(A) + round(factor*(red(B) - red(A))), 
               green(A) + round(factor*(green(B) - green(A))), 
               blue(A) + round(factor*(blue(B) - blue(A))), 
               alpha(A) + round(factor*(alpha(B) - alpha(A))));   
  }

void findBusiestRoutes() { 
  for (int i = 0; i < stations.length; i++) {
    if (stationInFocus[i]) { 
      for (int j = 0; j < stations.length; j++) 
      mostRidersPerStation = max(mostRidersPerStation, tripRiders[i][j] + tripRidersCas[i][j]); 
      }
    }
  }

void setStrokeWeight(int totalRiders) {
  }

void animateTraffic() {  
  int currentUsage;
  int lastFrame = 24*60*60; 
  int secondsPerFrame = 600;  // 60 or 240 or whatever
  int[] balances = new int[stations.length];
  int[] maxTraffic = new int[stations.length];
  int[] totalTraffic = new int[stations.length];
  for (int i = 0; i < stations.length; i++) {
    balances[i] = 0;
    maxTraffic[i] = 0;
    totalTraffic[i] = 0;
    }
  // do the math in advance for all possible station pairs
  int frameCount = 0;
  Calendar cal = Calendar.getInstance(); 
  String folder = "frames" + cal.get(Calendar.HOUR) + "-" + cal.get(Calendar.MINUTE) + "/";  
  int imageNo = 0;
  int maxMallBikes = 0;
  int maxOtherBikes = 0;
  float[] stationX = new float[stations.length];
  float[] stationY = new float[stations.length];
  for (int i = 0; i < stations.length; i++) {
    stationX[i] = toX(lngs[i]);
    stationY[i] = toY(lats[i]);
    }
  float[][] tripControlX = new float[stations.length][stations.length];
  float[][] tripControlY = new float[stations.length][stations.length];
  for (int i = 0; i < stations.length; i++) {
    for (int j = 0; j < stations.length; j++) {
      float dx = stationX[i] - stationX[j];
      float dy = stationY[i] - stationY[j]; 
      float bezierBulge = (float) Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2))/16;  // 16 is arbitrary!
      float theta = (float) (Math.atan2(dy, dx) + Math.PI/2);  // shifted 90 degrees 
      tripControlX[i][j] = (stationX[i] + stationX[j])/2 + bezierBulge*((float) Math.cos(theta));
      tripControlY[i][j] = (stationY[i] + stationY[j])/2 + bezierBulge*((float) Math.sin(theta)); 
      }
    }
  float midx, midy;
  int regRiders;
  int casRiders;
  int totalRiders;
  int ridersLeaving;
  int ridersStaying;
  int ridersEntering;
  color halfAndHalf = blend(c1t, c2t, 0.5);
  tripRiders = new int[stations.length][stations.length];
  tripRidersCas = new int[stations.length][stations.length];
  //
  // draw each frame of the animation
  //
  println("processing " + validTrips.size() + " trips"); 
  println("============================="); 
  for (int frame = 0; frame <= lastFrame; frame += secondsPerFrame) {
    regRiders = 0; casRiders = 0; 
    ridersLeaving = 0; ridersStaying = 0; ridersEntering = 0; 
    // initialize station-pair count to zero
    for (int i = 0; i < stations.length; i++) {
      for (int j = 0; j < stations.length; j++) {
        tripRiders[i][j] = 0; 
        tripRidersCas[i][j] = 0;
        }
      stationInUse[i] = false;
      }
    // count riders for each station-pair
    CaBiTrip trip;
    for (int t = 0; t < validTrips.size(); t++) { 
      trip = validTrips.get(t);
      if (frame > trip.bikeoutTime - 60 && frame < trip.bikeinTime + 60) {
        if (trip.isRegistered) {
          tripRiders[trip.bikeoutStation][trip.bikeinStation]++;
          regRiders++;
          }
        else {
          tripRidersCas[trip.bikeoutStation][trip.bikeinStation]++;
          casRiders++;
          }
        stationInUse[trip.bikeinStation] = true;
        stationInUse[trip.bikeinStation] = true; 
        }
      }
    background(bg);
    noFill();  
    findBusiestRoutes();
    // draw all of the bezier curves, behind the other objects
    int xx = 0;
    for (int i = 0; i < stations.length; i++) {
      for (int j = 0; j < stations.length; j++) {
        if (i != j)  { 
          midx = tripControlX[i][j];
          midy = tripControlY[i][j];
          totalRiders = tripRiders[i][j] + tripRidersCas[i][j];
          if (totalRiders > 0 && mostRidersPerStation > 0) { 
            regRiders += tripRiders[i][j];
            casRiders += tripRidersCas[i][j];
  if (displayMethod == CHARCOAL) {
    strokeWeight(3); 
    stroke(0,0,0, min(255, floor(256.0*5*totalRiders/192)));  // FIX: pre-calculate max val
    }
  else if (displayMethod == CLUSTER) { 
    strokeWeight(totalRiders); 
    if (stationInFocus[i] && stationInFocus[j]) {  // trips is between two valid stations
      stroke(stayingColor);
      ridersStaying += totalRiders;
      }
    else if (stationInFocus[i]) {
      stroke(leavingColor);
      ridersLeaving += totalRiders;
      }
    else {
      stroke(enteringColor);
      ridersEntering += totalRiders;
      }
    }
  else {
    strokeWeight(totalRiders); 
    stroke(blend(c1t, c2t, (float)tripRidersCas[i][j]/totalRiders));  
    } 
            bezier(stationX[i], stationY[i], midx,midy,midx,midy, stationX[j], stationY[j]); 
            } 
          }
        }
      }
    //println(": " +  xx);
    drawBackground();  // draw stations
    stroke(0,0,0, 127);
    strokeWeight(2);
    fill(241, 241, 42); 
    // draw approximate rider positions, on top of bezier curves
    for (int t = 0; t < validTrips.size(); t++) { 
      trip = validTrips.get(t);
      if (frame >= trip.bikeoutTime - 15 && frame <= trip.bikeinTime + 15) {  
        float scale = (float)(frame -  trip.bikeoutTime)/(float)(trip.bikeinTime -  trip.bikeoutTime);  
        // determine the color
        if (min(frame, trip.bikeinTime) - trip.bikeoutTime < 1800)  // under 30-min time limit, but don't turn red after bikein
          fill(255, 255, 255, 255);
        else if (trip.isRegistered)
          fill(c1t);
        else  
          fill(c2t);
        if (trip.isRegistered) 
          stroke(c1t); 
        else
          stroke(c2t); 
         
        /*
        if (min(frame, trip.bikeinTime) - trip.bikeoutTime < 1800)  // under 30-min time limit, but don't turn red after bikein
          fill(255, 255, 255, 255);
        else if (stationInFocus[trip.bikeoutStation] && stationInFocus[trip.bikeinStation])  
          fill(stayingColor);  
        else if (stationInFocus[trip.bikeoutStation])  
          fill(leavingColor);  
        else  
          fill(enteringColor);  
        if (stationInFocus[trip.bikeoutStation] && stationInFocus[trip.bikeinStation])  
          stroke(stayingColor);  
        else if (stationInFocus[trip.bikeoutStation])  
          stroke(leavingColor);  
        else  
          stroke(enteringColor);  
          */
        if (frame <= trip.bikeoutTime)
          ellipse(stationX[trip.bikeoutStation], stationY[trip.bikeoutStation], 4, 4);
        else if (frame >= trip.bikeinTime) 
          ellipse(stationX[trip.bikeinStation], stationY[trip.bikeinStation], 4, 4);
        else {   
          midx = tripControlX[trip.bikeoutStation][trip.bikeinStation];
          midy = tripControlY[trip.bikeoutStation][trip.bikeinStation];
          float x = bezierPoint(stationX[trip.bikeoutStation], midx, midx, stationX[trip.bikeinStation], scale);
          float y = bezierPoint(stationY[trip.bikeoutStation], midy, midy, stationY[trip.bikeinStation], scale); 
          ellipse(x, y, 5, 5); 
          }
        } 
      } 
    if (floor((float)histogramWidth*frame/lastFrame) >= tickCount && tickCount < histogramWidth - 1) { 
      // add a column to the histogram
      groupA[tickCount] = regRiders;
      groupB[tickCount] = casRiders;
      into[tickCount] = ridersEntering;
      within[tickCount] = ridersStaying;
      outof[tickCount] = ridersLeaving;
      tickCount++;  
      println(100*frame/lastFrame + "%"); 
      } 
    maxMallBikes = max(maxMallBikes, regRiders);
    maxOtherBikes = max(maxOtherBikes, casRiders); 
    frameCount++;
    drawHistogram(frame); 
    saveFrame(folder + "image-" + nf(imageNo++, 5) + ".png"); 
    //imageNo++;
    for (int i = 0; i < stations.length; i++) {
      currentUsage = 0;
      for (int j = 0; j < stations.length; j++) {
        currentUsage += tripRiders[i][j] + tripRidersCas[i][j];
        }
      totalTraffic[i] += currentUsage;
      maxTraffic[i] = max(maxTraffic[i], currentUsage);
      }
    } 
  for (int i = 0; i < stations.length; i++)  
    if (totalTraffic[i] > 0 && totalTraffic[i]/imageNo > 0)
      println(maxTraffic[i]/(totalTraffic[i]/imageNo) + " (" + maxTraffic[i] + " / " + (totalTraffic[i]/imageNo) + ") " + stopName[i]);
  }

void animateBalances() {  
  // do the math in advance for all possible station pairs
  int radius;
  int frameCount = 0;
  Calendar cal = Calendar.getInstance(); 
  String folder = "frames" + cal.get(Calendar.HOUR) + "-" + cal.get(Calendar.MINUTE) + "/";  
  int imageNo = 0;
  int maxMallBikes = 0;
  int maxOtherBikes = 0;
  float[] stationX = new float[stations.length];
  float[] stationY = new float[stations.length];
  for (int i = 0; i < stations.length; i++) {
    stationX[i] = toX(lngs[i]);
    stationY[i] = toY(lats[i]);
    }
  float[][] tripControlX = new float[stations.length][stations.length];
  float[][] tripControlY = new float[stations.length][stations.length];
  for (int i = 0; i < stations.length; i++) {
    for (int j = 0; j < stations.length; j++) {
      float dx = stationX[i] - stationX[j];
      float dy = stationY[i] - stationY[j]; 
      float bezierBulge = (float) Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2))/16;  // 16 is arbitrary!
      float theta = (float) (Math.atan2(dy, dx) + Math.PI/2);  // shifted 90 degrees 
      tripControlX[i][j] = (stationX[i] + stationX[j])/2 + bezierBulge*((float) Math.cos(theta));
      tripControlY[i][j] = (stationY[i] + stationY[j])/2 + bezierBulge*((float) Math.sin(theta)); 
      }
    }
  float midx, midy;
  int lastFrame = 24*60*60;
  int regRiders;
  int casRiders;
  int totalRiders;
  int[][] tripRiders = new int[stations.length][stations.length];
  int[][] tripRidersCas = new int[stations.length][stations.length];
  //
  // draw each frame of the animation
  //
  println("processing " + validTrips.size() + " trips"); 
  println("============================="); 
  for (int frame = 0; frame <= lastFrame; frame += 60) { 
  for (int rs = 0; rs < stations.length; rs++) { 
    if (stationInFocus[rs]) 
      radius = 9;
    else
      radius = 7;
    if (stationInUse[rs]) {
      stroke(0, 255);
      fill(255, 255); 
      }
    else {  
      stroke(0, 159);
      fill(255, 159); 
      }
    ellipse(toX(lngs[rs]), toY(lats[rs]), radius, radius);
    } 
    CaBiTrip trip;
    background(bg);
    noFill();  
    // draw all of the bezier curves, behind the other objects
    for (int i = 0; i < stations.length; i++) 
      for (int j = 0; j < stations.length; j++) {
        if (i != j)  { 
          midx = tripControlX[i][j];
          midy = tripControlY[i][j];
          totalRiders = tripRiders[i][j] + tripRidersCas[i][j];
          if (totalRiders > 0) { 
            strokeWeight(totalRiders); 
            stroke(blend(c1t, c2t, (float)tripRidersCas[i][j]/totalRiders));  
            bezier(stationX[i], stationY[i], midx,midy,midx,midy, stationX[j], stationY[j]); 
            } 
          }
        }
    drawBackground();  // draw stations
    stroke(0,0,0, 127);
    strokeWeight(2);
    fill(241, 241, 42); 
    for (int t = 0; t < validTrips.size(); t++) { 
      trip = validTrips.get(t);
      if (frame >= trip.bikeoutTime - 15 && frame <= trip.bikeinTime + 15) {  
        float scale = (float)(frame -  trip.bikeoutTime)/(float)(trip.bikeinTime -  trip.bikeoutTime);  
        // determine the color
        if (min(frame, trip.bikeinTime) - trip.bikeoutTime < 1800)  // under 30-min time limit, but don't turn red after bikein
          fill(255, 255, 255, 255);
        else if (trip.isRegistered)
          fill(c1t);
        else  
          fill(c2t);
        if (trip.isRegistered) 
          stroke(c1t); 
        else
          stroke(c2t); 
        if (frame <= trip.bikeoutTime)
          ellipse(stationX[trip.bikeoutStation], stationY[trip.bikeoutStation], 4, 4);
        else if (frame >= trip.bikeinTime) 
          ellipse(stationX[trip.bikeinStation], stationY[trip.bikeinStation], 4, 4);
        else {   
          midx = tripControlX[trip.bikeoutStation][trip.bikeinStation];
          midy = tripControlY[trip.bikeoutStation][trip.bikeinStation];
          float x = bezierPoint(stationX[trip.bikeoutStation], midx, midx, stationX[trip.bikeinStation], scale);
          float y = bezierPoint(stationY[trip.bikeoutStation], midy, midy, stationY[trip.bikeinStation], scale); 
          ellipse(x, y, 5, 5); 
          }
        } 
      }  
    println(100*frame/lastFrame + "%");   
    frameCount++;
    drawHistogram(frame);
    saveFrame(folder + "image-" + nf(imageNo++, 5) + ".png");
    } 
  }

void setColors(color colorA, color colorB) {  
  c1 = colorA;  
  c1t = color(red(colorA), green(colorA), blue(colorA), 102);
  c2 = colorB;  
  c2t = color(red(colorB), green(colorB), blue(colorB), 102);
  }

void setup() {
  validTrips = new ArrayList<CaBiTrip>(2000000);  // guess 2 million records
  displayMethod = RIDERTYPE;
  enteringColorSolid = color(red(enteringColor), green(enteringColor), blue(enteringColor), 204);   
  stayingColorSolid = color(red(stayingColor), green(stayingColor), blue(stayingColor), 204);   
  leavingColorSolid = color(red(leavingColor), green(leavingColor), blue(leavingColor), 204);     
  // Pick the background image and set the lat/lng boundaries:
  // configure(background image, S:bottom, W:left, N:top, E:right, width, height); 
  setBoundary("arlington-dc-600x400.png", 38.8299, -77.1335, 38.9099, -76.9791, 600, 450, all(), "Capital Bikeshare"); 
  setBoundary("cabionthemall.png", 38.8730, -77.0557, 38.8997, -77.0043, 600, 450, all(), "Capital Bikeshare"); 
  setBoundary("rosslyn640x480.png", 38.8895, -77.0841, 38.9055, -77.0567, 640, 480, rosslyn(), "Rosslyn (Arlington, VA)");
  setBoundary("nwrectangle600x450.png", 38.8862, -77.0533, 38.9012, -77.0275, 600, 450, all(), "Capital Bikeshare");
  setBoundary("greatercrystalcity600x450.png", 38.8390, -77.0805, 38.8689, -77.0291, 600, 450, all(), "Capital Bikeshare");
  setBoundary("caohillne680x510.png", 38.8893, -77.0214, 38.9063, -76.9922, 680, 510, centerForTotalHealth(), "Kaiser Permanente Center for Total Health"); 
  setBoundary("dc-va-600x450.jpg", 38.7990, -77.1604, 38.9591, -76.8861, 600, 450, all(), "Capital Bikeshare");  
  setBoundary("arlingtonarea600x450.png", 38.8047, -77.1436, 38.9247, -76.9379, 600, 450, all(), "Capital Bikeshare"); 
  setBoundary("shaw640x480.png", 38.9050, -77.0357, 38.9210, -77.0082, 640, 480, q7th(), "Wonder Bread Factory"); 
  setBoundary("dc-cc450x600.png", 38.8318, -77.0861, 38.9119, -77.0090, 450, 600, all(), "Capital Bikeshare"); 
  setBoundary("dc-core800x600.png", 38.8404, -77.1031, 38.9204, -76.9659, 800, 600, all(), "Capital Bikeshare"); 
  setBoundary("dc-core800x600.png", 38.8469, -77.1031, 38.9270, -76.9659, 800, 600, all(), "Capital Bikeshare"); 
  setBoundary("crystalcity480x320.png", 38.8369, -77.0904, 38.8795, -77.0082, 480, 320, greaterCrystalCity(), "Crystal City"); 
  setBoundary("lincoln640x480.png", 38.8750, -77.0725, 38.9070, -77.0177, 640, 480, lincoln(), "Lincoln Memorial"); 
  setBoundary("washington440x660.png", 38.7851, -77.2243, 39.1370, -76.9228, 440, 660, all(), "Capital Bikeshare");
  setBoundary("jeffersonmemorial640x480.png", 38.8644, -77.0719, 38.8964, -77.0171, 640, 480, jefferson(), "Jefferson Memorial"); 
  //setDatasource("/Users/michael/mvjantzen.com/cabi/data/2011-4th-quarter.csv", 4, 7, 2, 5, 9);
  setDatasource("/Users/michael/mvjantzen.com/cabi/data/2014-1st-quarter.csv", 3, 6, 1, 4, 8);
  setDatasource("/Users/michael/mvjantzen.com/cabi/data/2014-Q2-Trips-History-Data.csv", 3, 6, 1, 4, 8);
  setDatasource("/Users/michael/mvjantzen.com/cabi/data/2014-Q3-Trips-History-Data.csv", 3, 6, 1, 4, 8);
  setColors(color(93,110,182), color(201, 62, 103));
  //getStats();
  histogramWidth = 300; 
  groupA = new int[histogramWidth];    
  groupB = new int[histogramWidth]; 
  into = new int[histogramWidth]; 
  within = new int[histogramWidth]; 
  outof = new int[histogramWidth]; 
  size(swidth, sheight, JAVA2D);
  println("============================="); 
  animateTraffic();  
  println("maxBusiest = " + maxBusiest);
  println("maxRidersPerRoute = " + maxRidersPerRoute);
  println("!!!"); 
  }

void draw() {   
  }
