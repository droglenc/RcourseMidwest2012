/* Miscellaneous declarations for the date-related functions below                              */
var months = new Array('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');

function fourdigits(number)	{
  return (number < 1000) ? number + 1900 : number;
}

/* Function to write the last modified date.                                                     */
function lastModified() {
  var dateObj = new Date(document.lastModified)
  document.write("Last modified on " + dateObj.getDate() + "-" + months[dateObj.getMonth()] + "-" + fourdigits(dateObj.getYear()));
}


/* Places the header banner at the top of the page                                                */
function pbanr(home) {
  var pobj;
  pobj = "<div id='banner'>";
  pobj = pobj + "Introduction to R Using Basic Fisheries Methods";
  pobj = pobj + "</div>";
  pobj = pobj + "<div id='banner2'>";
  pobj = pobj + "Midwest Fish and Wildlife Conference, Wichita, KS, 9Dec12"
  pobj = pobj + "</div>"; 
  document.write(pobj);
}


/* Places various objects into the footer.                                                        */
function pfoot(home) {
  var pobj
  pobj = "<div id='comments'><a href='mailto: dogle@northland.edu'>Comments / Questions?</a></div>"
  pobj = pobj + "<div id='ftrtag'><a href='" + home + "index.html'>Course Home</a></div>"
  pobj = pobj + "<div id='lastmod'><SCRIPT>lastModified()</script></div>"
  document.write(pobj);
}
