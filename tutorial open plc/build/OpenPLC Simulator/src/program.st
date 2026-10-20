PROGRAM main
  VAR
    start : BOOL;
    stop : BOOL;
    motor : BOOL;
    ms : BOOL;
    h : BOOL;
    i : BOOL;
    u : BOOL;
    b : BOOL;
    k : BOOL;
    y : BOOL;
    q : BOOL;
    f : BOOL;
    c : BOOL;
    d : BOOL;
    x : BOOL;
    v : BOOL;
    r : BOOL;
    a : BOOL;
    sw : BOOL;
    q1 : BOOL;
    qa : BOOL;
    qb : BOOL;
    qc : BOOL;
    sa : BOOL;
    sb : BOOL;
    sw1 : BOOL;
    sw2 : BOOL;
    sw3 : BOOL;
    q2 : BOOL;
    q0 : BOOL;
    CTD0 : CTD;
    CTD1 : CTD;
    CTU0 : CTU;
    box_sensor : BOOL;
    CTU1 : CTU;
    stop2 : BOOL;
    CTU2 : CTU;
    st : BOOL;
    CTU3 : CTU;
    system_run : BOOL;
    conveyor : BOOL;
    CTU4 : CTU;
    CTU5 : CTU;
    batch_reset : BOOL;
  END_VAR

  system_run := (start OR system_run) AND NOT(stop);
  IF batch_reset OR system_run THEN
    conveyor := TRUE; (*set*)
  END_IF;
  CTU5(CU := box_sensor, R := batch_reset, PV := 3);
  IF CTU5.q OR stop THEN
    conveyor := FALSE; (*reset*)
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 1);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION
