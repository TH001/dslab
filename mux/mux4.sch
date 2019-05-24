<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="X0(3:0)" />
        <signal name="X0(3)" />
        <signal name="X0(2)" />
        <signal name="X0(1)" />
        <signal name="X1(3:0)" />
        <signal name="Y(3:0)" />
        <signal name="X1(3)" />
        <signal name="X1(2)" />
        <signal name="X1(1)" />
        <signal name="Y(3)" />
        <signal name="Y(2)" />
        <signal name="Y(1)" />
        <signal name="S" />
        <signal name="X1(0)" />
        <signal name="X0(0)" />
        <signal name="Y(0)" />
        <port polarity="Input" name="X0(3:0)" />
        <port polarity="Input" name="X1(3:0)" />
        <port polarity="Output" name="Y(3:0)" />
        <port polarity="Input" name="S" />
        <blockdef name="mux2">
            <timestamp>2013-4-8T20:1:27</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <block symbolname="mux2" name="XLXI_1">
            <blockpin signalname="S" name="S" />
            <blockpin signalname="X0(3)" name="X0" />
            <blockpin signalname="X1(3)" name="X1" />
            <blockpin signalname="Y(3)" name="Y" />
        </block>
        <block symbolname="mux2" name="XLXI_2">
            <blockpin signalname="S" name="S" />
            <blockpin signalname="X0(2)" name="X0" />
            <blockpin signalname="X1(2)" name="X1" />
            <blockpin signalname="Y(2)" name="Y" />
        </block>
        <block symbolname="mux2" name="XLXI_3">
            <blockpin signalname="S" name="S" />
            <blockpin signalname="X0(1)" name="X0" />
            <blockpin signalname="X1(1)" name="X1" />
            <blockpin signalname="Y(1)" name="Y" />
        </block>
        <block symbolname="mux2" name="XLXI_4">
            <blockpin signalname="S" name="S" />
            <blockpin signalname="X0(0)" name="X0" />
            <blockpin signalname="X1(0)" name="X1" />
            <blockpin signalname="Y(0)" name="Y" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1376" y="528" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1376" y="816" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1376" y="1104" name="XLXI_3" orien="R0">
        </instance>
        <branch name="X0(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="496" type="branch" />
            <wire x2="1168" y1="496" y2="496" x1="1088" />
            <wire x2="1376" y1="496" y2="496" x1="1168" />
        </branch>
        <branch name="X0(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="784" type="branch" />
            <wire x2="1168" y1="784" y2="784" x1="1088" />
            <wire x2="1376" y1="784" y2="784" x1="1168" />
        </branch>
        <branch name="X0(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="1072" type="branch" />
            <wire x2="1168" y1="1072" y2="1072" x1="1088" />
            <wire x2="1376" y1="1072" y2="1072" x1="1168" />
        </branch>
        <branch name="X1(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="368" type="branch" />
            <wire x2="1168" y1="368" y2="368" x1="1088" />
            <wire x2="1376" y1="368" y2="368" x1="1168" />
        </branch>
        <branch name="X1(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="656" type="branch" />
            <wire x2="1168" y1="656" y2="656" x1="1088" />
            <wire x2="1376" y1="656" y2="656" x1="1168" />
        </branch>
        <branch name="X1(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="944" type="branch" />
            <wire x2="1168" y1="944" y2="944" x1="1088" />
            <wire x2="1376" y1="944" y2="944" x1="1168" />
        </branch>
        <branch name="Y(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="368" type="branch" />
            <wire x2="1808" y1="368" y2="368" x1="1760" />
            <wire x2="1888" y1="368" y2="368" x1="1808" />
        </branch>
        <branch name="Y(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="656" type="branch" />
            <wire x2="1808" y1="656" y2="656" x1="1760" />
            <wire x2="1888" y1="656" y2="656" x1="1808" />
        </branch>
        <branch name="Y(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="944" type="branch" />
            <wire x2="1808" y1="944" y2="944" x1="1760" />
            <wire x2="1888" y1="944" y2="944" x1="1808" />
        </branch>
        <iomarker fontsize="28" x="672" y="496" name="X1(3:0)" orien="R180" />
        <iomarker fontsize="28" x="672" y="1008" name="S" orien="R180" />
        <iomarker fontsize="28" x="672" y="1152" name="X0(3:0)" orien="R180" />
        <branch name="X1(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="752" y="496" type="branch" />
            <wire x2="752" y1="496" y2="496" x1="672" />
            <wire x2="912" y1="496" y2="496" x1="752" />
        </branch>
        <branch name="X0(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="832" y="1152" type="branch" />
            <wire x2="832" y1="1152" y2="1152" x1="672" />
            <wire x2="976" y1="1152" y2="1152" x1="832" />
        </branch>
        <iomarker fontsize="28" x="2208" y="512" name="Y(3:0)" orien="R0" />
        <branch name="Y(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2096" y="512" type="branch" />
            <wire x2="2096" y1="512" y2="512" x1="1984" />
            <wire x2="2208" y1="512" y2="512" x1="2096" />
        </branch>
        <branch name="S">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="752" y="1008" type="branch" />
            <wire x2="752" y1="1008" y2="1008" x1="672" />
            <wire x2="1280" y1="1008" y2="1008" x1="752" />
            <wire x2="1376" y1="1008" y2="1008" x1="1280" />
            <wire x2="1280" y1="1008" y2="1296" x1="1280" />
            <wire x2="1376" y1="1296" y2="1296" x1="1280" />
            <wire x2="1376" y1="432" y2="432" x1="1280" />
            <wire x2="1280" y1="432" y2="720" x1="1280" />
            <wire x2="1376" y1="720" y2="720" x1="1280" />
            <wire x2="1280" y1="720" y2="1008" x1="1280" />
        </branch>
        <instance x="1376" y="1392" name="XLXI_4" orien="R0">
        </instance>
        <branch name="X1(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="1232" type="branch" />
            <wire x2="1168" y1="1232" y2="1232" x1="1088" />
            <wire x2="1376" y1="1232" y2="1232" x1="1168" />
        </branch>
        <branch name="X0(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1168" y="1360" type="branch" />
            <wire x2="1168" y1="1360" y2="1360" x1="1088" />
            <wire x2="1376" y1="1360" y2="1360" x1="1168" />
        </branch>
        <branch name="Y(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="1232" type="branch" />
            <wire x2="1808" y1="1232" y2="1232" x1="1760" />
            <wire x2="1888" y1="1232" y2="1232" x1="1808" />
        </branch>
    </sheet>
</drawing>