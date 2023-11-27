#' Generate a class schedule for arbitrary students using their grades (ages)
#'
#' @param student_grades A vector containing student grades. Note that the output
#' returns a dataframe with rows in the same order as these student grades.
#' @param mean_class_size A numeric describing the desired mean class size.
#' @param schedule_length A numeric describing the number of time units in a day, 
#' where a time unit is usually the length of a lunch (equivalent to a class in
#' periods and splits blocks into two 'classes') 
#' @param block A vector of numeric vectors describing which time units should 
#' be grouped together as a single unit for scheduling purposes, e.g. c(c(1,2), 
#' c(3,4)). Defaults to FALSE for period scheduling.
#' @param lunch_pds A numeric vector which describes which of the above time periods
#' are used for lunches.
schedule_generator <- function(student_grades, mean_class_size,
                               schedule_length = 9, block = FALSE, 
                               lunch_pds = c(4, 5, 6)) {
    
}
    
#' Import a schedule from a .csv file containing student schedules and parses
#' it into a format compatible with this system.
#' 
#' @param file A .csv file structured so that the first column contains an 
#' ID for the student, and the remaining columns represent classes
#' (or classrooms) in which the student is in during the specific period of time.
#' @returns Returns a parsed data frame.
import_schedule_from_csv <- function(file) {
    
}