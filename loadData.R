 #################### obs length #############################################
    # Set up length data as data frame
    lengths <- fread(paste0("lengthData/length_", scenario, ".csv"))

    if (lengths$length[1] > 30)
        lengths$length <- lengths$length / 10


    realmaxLength <- max(lengths$length, na.rm = TRUE)

    print(realmaxLength)


#################### Agnes Pred Length #############################################
    # Retrieve predicted lengths
    predsAgnes <- fread(paste0("../AgnesCodeRepo/Results/", scenario, ".csv"))


#################### Alex Pred Length #############################################
    # Retrieve predicted lengths
    predsAlex <- fread(paste0("../ForageFishModelRepo/Results/", scenario, ".csv"))

#################### test #############################################
    # Retrieve predicted lengths
    predsTest <- fread(paste0("../ForageFishModelRepo/Results/", scenario, "_test.csv"))
