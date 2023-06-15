

#AgeMean

nrow(subset(FollowupData,FollowupData$ageMean == 27 & FollowupData$extend == "Yes"))
nrow(subset(FollowupData,FollowupData$ageMean == 34.5 & FollowupData$extend == "Yes"))
nrow(subset(FollowupData,FollowupData$ageMean == 44.5 & FollowupData$extend == "Yes"))
nrow(subset(FollowupData,FollowupData$ageMean == 52 & FollowupData$extend == "Yes"))

nrow(subset(FollowupData,FollowupData$ageMean == 27 & FollowupData$extend == "Yes"))/nrow(subset(FollowupData,FollowupData$ageMean == 27))
nrow(subset(FollowupData,FollowupData$ageMean == 34.5 & FollowupData$extend == "Yes"))/nrow(subset(FollowupData,FollowupData$ageMean == 34.5))
nrow(subset(FollowupData,FollowupData$ageMean == 44.5 & FollowupData$extend == "Yes"))/nrow(subset(FollowupData,FollowupData$ageMean == 44.5))
nrow(subset(FollowupData,FollowupData$ageMean == 52 & FollowupData$extend == "Yes"))/nrow(subset(FollowupData,FollowupData$ageMean == 52))

nrow(subset(fbdata,fbdata$ageMean == 27 & fbdata$extend == "Yes"))/nrow(subset(fbdata,fbdata$ageMean == 27))
nrow(subset(fbdata,fbdata$ageMean == 34.5 & fbdata$extend == "Yes"))/nrow(subset(fbdata,fbdata$ageMean == 34.5))
nrow(subset(fbdata,fbdata$ageMean == 44.5 & fbdata$extend == "Yes"))/nrow(subset(fbdata,fbdata$ageMean == 44.5))
nrow(subset(fbdata,fbdata$ageMean == 52 & fbdata$extend == "Yes"))/nrow(subset(fbdata,fbdata$ageMean == 52))
#AdType
fbphotoPostY <- nrow(subset(fbdata,fbdata$adType == "Photo Post" & fbdata$extend == "Yes"))
fbphotoPostY/nrow(subset(fbdata,fbdata$adType == "Photo Post"))

fbLinkY <- nrow(subset(fbdata,fbdata$adType == "Link Post" & fbdata$extend == "Yes"))
fbLinkY/nrow(subset(fbdata,fbdata$adType == "Link Post"))

fdphotoPostY <- nrow(subset(FollowupData,FollowupData$adType == "Photo Post" & FollowupData$extend == "Yes"))
fdphotoPostY/nrow(subset(FollowupData,FollowupData$adType == "Photo Post"))

fdLinkPostY <- nrow(subset(FollowupData,FollowupData$adType == "Link Post" & FollowupData$extend == "Yes"))
fdLinkPostY/nrow(subset(FollowupData,FollowupData$adType == "Link Post"))

nrow(subset(FollowupData,FollowupData$adType == "Photo Post" & FollowupData$extend == "Yes"))
nrow(subset(FollowupData,FollowupData$adType == "Link Post" & FollowupData$extend == "Yes"))
