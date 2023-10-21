







Map<String, String> calculateMenstrualPhase(DateTime date,int periodLength,int cycleLength,DateTime periodStartDate) {
  // Calculate the day within the cycle
  int dayInCycle = date.difference(periodStartDate).inDays + 1;

  // Calculate the day until the next period starts
  int daysUntilNextPeriod = cycleLength - (dayInCycle % cycleLength);

  // Initialize pregnancyChance with a default value
  String pregnancyChance = "Low";

  // Determine the phase based on the day in the cycle
  String phase;
  if (dayInCycle <= periodLength) {
    phase = "Menstruation Phase";
  } else if (dayInCycle <= cycleLength) {
    phase = "Follicular Phase";
  } else {
    int lutealPhaseDay = dayInCycle - cycleLength;
    if (lutealPhaseDay <= 5) {
      phase = "Early Luteal Phase";
    } else if (lutealPhaseDay <= 10) {
      phase = "Mid Luteal Phase";
    } else {
      phase = "Late Luteal Phase";
    }

    // Update pregnancyChance based on the phase
    if (phase == "Menstruation Phase") {
      pregnancyChance = "Low";
    } else if (phase == "Follicular Phase") {
      pregnancyChance = "Low";
    } else if (phase == "Early Luteal Phase") {
      pregnancyChance = "Low";
    } else if (phase == "Mid Luteal Phase") {
      pregnancyChance = "Medium";
    } else if (phase == "Late Luteal Phase") {
      pregnancyChance = "High";
    }
  }

  // Determine the ovulation phase type
  String ovulationPhaseType;
  if (dayInCycle == (cycleLength - periodLength + 1)) {
    ovulationPhaseType = "Ovulation";
  } else {
    ovulationPhaseType = "Not Ovulation";
  }

  return {
    "phase": phase,
    "pregnancyChance": pregnancyChance,
    "daysUntilNextPeriod": daysUntilNextPeriod.toString(),
    "ovulationPhaseType": ovulationPhaseType
  };
}
