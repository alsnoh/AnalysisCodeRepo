 #################### obs length #############################################
    # Set up length data as data frame
    lengths <- fread(paste0("../ForageFishModelRepo/data/lengthData/length_", scenario, ".csv"))

    if (lengths$length[1] > 30)
        lengths$length <- lengths$length / 10

    # Consider just year and length data (cm)
    lengths <- data.frame(year = lengths$year, length = lengths$length)

    realmaxLength <- max(lengths$length, na.rm = TRUE)

    print(realmaxLength)


#################### Agnes Pred Length #############################################
    # Retrieve predicted lengths
    predLengthsAgnes <- fread(paste0("../ForageFishModelRepo/AgnesModelResults/", scenario, ".csv"))

    # Consider just year and length data (cm)
    predLengthsAgnes <- data.frame(year = predLengthsAgnes$year, length = predLengthsAgnes$Length, jd = predLengthsAgnes$JulianDay)


#################### Alex Pred Length #############################################
    # Retrieve predicted lengths
    predLengths <- fread(paste0("../ForageFishModelRepo/Results/", scenario, ".csv"))

    # Consider just year and length data (cm)
    predLengths <- data.frame(year = predLengths$year, length = predLengths$length, jd = predLengths$jd)