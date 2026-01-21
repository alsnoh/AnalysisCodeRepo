 #################### obs length #############################################
    # Set up length data as data frame
    lengths <- fread(paste0("lengthData/length_", scenario, ".csv"))

    if (lengths$length[1] > 30)
        lengths$length <- lengths$length / 10


    realmaxLength <- max(lengths$length, na.rm = TRUE)

    print(realmaxLength)


#################### Agnes Pred Length #############################################
    # Retrieve predicted lengths
    predLengthsAgnes <- fread(paste0("../AgnesCodeRepo/Results/", scenario, ".csv"))



#################### Alex Pred Length #############################################
    # Retrieve predicted lengths
    predLengths <- fread(paste0("../ForageFishModelRepo/Results/", scenario, ".csv"))
