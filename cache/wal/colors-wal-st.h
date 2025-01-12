const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#090a11", /* black   */
  [1] = "#62667A", /* red     */
  [2] = "#5F6982", /* green   */
  [3] = "#737489", /* yellow  */
  [4] = "#8B7D80", /* blue    */
  [5] = "#827E92", /* magenta */
  [6] = "#9B8B9C", /* cyan    */
  [7] = "#e5ccc6", /* white   */

  /* 8 bright colors */
  [8]  = "#a08e8a",  /* black   */
  [9]  = "#62667A",  /* red     */
  [10] = "#5F6982", /* green   */
  [11] = "#737489", /* yellow  */
  [12] = "#8B7D80", /* blue    */
  [13] = "#827E92", /* magenta */
  [14] = "#9B8B9C", /* cyan    */
  [15] = "#e5ccc6", /* white   */

  /* special colors */
  [256] = "#090a11", /* background */
  [257] = "#e5ccc6", /* foreground */
  [258] = "#e5ccc6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
