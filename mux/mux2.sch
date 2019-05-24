<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_15" />
        <signal name="Y" />
        <signal name="X1" />
        <signal name="X0" />
        <signal name="S" />
        <signal name="XLXN_19" />
        <signal name="XLXN_16" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="XLXN_23" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <port polarity="Output" name="Y" />
        <port polarity="Input" name="X1" />
        <port polarity="Input" name="X0" />
        <port polarity="Input" name="S" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="and2" name="XLXI_3">
            <blockpin signalname="X0" name="I0" />
            <blockpin signalname="XLXN_19" name="I1" />
            <blockpin signalname="XLXN_16" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="S" name="I0" />
            <blockpin signalname="X1" name="I1" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_5">
            <blockpin signalname="XLXN_16" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="Y" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_6">
            <blockpin signalname="S" name="I" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1232" y="912" name="XLXI_3" orien="R0" />
        <instance x="864" y="688" name="XLXI_6" orien="R0" />
        <branch name="Y">
            <wire x2="2352" y1="592" y2="592" x1="2192" />
        </branch>
        <branch name="X1">
            <wire x2="1216" y1="400" y2="400" x1="640" />
        </branch>
        <branch name="X0">
            <wire x2="1232" y1="848" y2="848" x1="640" />
        </branch>
        <iomarker fontsize="28" x="640" y="848" name="X0" orien="R180" />
        <iomarker fontsize="28" x="640" y="656" name="S" orien="R180" />
        <branch name="S">
            <wire x2="784" y1="656" y2="656" x1="640" />
            <wire x2="864" y1="656" y2="656" x1="784" />
            <wire x2="1216" y1="464" y2="464" x1="784" />
            <wire x2="784" y1="464" y2="656" x1="784" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="1136" y1="656" y2="656" x1="1088" />
            <wire x2="1136" y1="656" y2="784" x1="1136" />
            <wire x2="1232" y1="784" y2="784" x1="1136" />
        </branch>
        <instance x="1936" y="688" name="XLXI_5" orien="R0" />
        <branch name="XLXN_15">
            <wire x2="1920" y1="432" y2="432" x1="1472" />
            <wire x2="1920" y1="432" y2="560" x1="1920" />
            <wire x2="1936" y1="560" y2="560" x1="1920" />
        </branch>
        <iomarker fontsize="28" x="2352" y="592" name="Y" orien="R0" />
        <branch name="XLXN_16">
            <wire x2="1680" y1="816" y2="816" x1="1488" />
            <wire x2="1936" y1="624" y2="624" x1="1680" />
            <wire x2="1680" y1="624" y2="816" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="640" y="400" name="X1" orien="R180" />
        <instance x="1216" y="528" name="XLXI_4" orien="R0" />
    </sheet>
</drawing>