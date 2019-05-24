<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="X1(3:0)" />
        <signal name="X0(3:0)" />
        <signal name="Y(3:0)" />
        <signal name="S" />
        <signal name="Clk_1MHz_in" />
        <signal name="Clk_1MHz_out" />
        <port polarity="Input" name="X1(3:0)" />
        <port polarity="Input" name="X0(3:0)" />
        <port polarity="Output" name="Y(3:0)" />
        <port polarity="Input" name="S" />
        <port polarity="Input" name="Clk_1MHz_in" />
        <port polarity="Output" name="Clk_1MHz_out" />
        <blockdef name="mux4">
            <timestamp>2014-3-31T10:50:18</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="mux4" name="XLXI_1">
            <blockpin signalname="S" name="S" />
            <blockpin signalname="X0(3:0)" name="X0(3:0)" />
            <blockpin signalname="X1(3:0)" name="X1(3:0)" />
            <blockpin signalname="Y(3:0)" name="Y(3:0)" />
        </block>
        <block symbolname="buf" name="XLXI_5">
            <blockpin signalname="Clk_1MHz_in" name="I" />
            <blockpin signalname="Clk_1MHz_out" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1152" y="1184" name="XLXI_1" orien="R0">
        </instance>
        <branch name="X1(3:0)">
            <wire x2="1024" y1="704" y2="704" x1="496" />
            <wire x2="1024" y1="704" y2="1024" x1="1024" />
            <wire x2="1152" y1="1024" y2="1024" x1="1024" />
        </branch>
        <branch name="X0(3:0)">
            <wire x2="1024" y1="1488" y2="1488" x1="496" />
            <wire x2="1152" y1="1152" y2="1152" x1="1024" />
            <wire x2="1024" y1="1152" y2="1488" x1="1024" />
        </branch>
        <iomarker fontsize="28" x="496" y="1488" name="X0(3:0)" orien="R180" />
        <branch name="Y(3:0)">
            <wire x2="2080" y1="1024" y2="1024" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="2080" y="1024" name="Y(3:0)" orien="R0" />
        <iomarker fontsize="28" x="496" y="704" name="X1(3:0)" orien="R180" />
        <iomarker fontsize="28" x="512" y="1088" name="S" orien="R180" />
        <branch name="S">
            <wire x2="832" y1="1088" y2="1088" x1="512" />
            <wire x2="1152" y1="1088" y2="1088" x1="832" />
        </branch>
        <branch name="Clk_1MHz_in">
            <wire x2="1216" y1="1808" y2="1808" x1="512" />
        </branch>
        <branch name="Clk_1MHz_out">
            <wire x2="2096" y1="1808" y2="1808" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="512" y="1808" name="Clk_1MHz_in" orien="R180" />
        <iomarker fontsize="28" x="2096" y="1808" name="Clk_1MHz_out" orien="R0" />
        <instance x="1216" y="1840" name="XLXI_5" orien="R0" />
    </sheet>
</drawing>