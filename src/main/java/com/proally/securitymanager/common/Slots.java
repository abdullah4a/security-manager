package com.proally.securitymanager.common;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Slots {
    LocalDateTime start = LocalDateTime.parse("2019-09-08T13:00:00");
    LocalDateTime stop = LocalDateTime.parse("2019-09-08T16:00:00");
    List<LocalDateTime> slots = new ArrayList<>();
}
