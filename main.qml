import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "Battery Details Simulation"

    property real totalCapacity: 20.0 // Battery total capacity in Ah
    property real voltage: 15.0 // Current voltage in volts
    property int percentage: 100 // Remaining battery percentage
    property real currentDraw: 15.0 // Average current in Amps
    property real remainingTime: 0.0 // Remaining flight time in minutes

    function calculateRemainingTime() {
        // Calculate remaining time using the formula: T_rem = (C_rem / I_avg) * 60
        let remainingCapacity = totalCapacity * (percentage / 100.0); // Remaining capacity in Ah
        remainingTime = (remainingCapacity / currentDraw) * 60.0; // Time in minutes
    }

    function simulateBatteryUpdate() {
        // Simulate battery updates
        percentage = Math.max(percentage - Math.floor(Math.random() * 10), 0); // Reduce percentage randomly
        voltage = (percentage / 100.0) * 15.0; // Simulated voltage
        calculateRemainingTime(); // Update remaining time
    }

    // Initial Calculation
    Component.onCompleted: calculateRemainingTime();

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Battery Details"
            font.pixelSize: 20
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            text: `Voltage: ${voltage.toFixed(2)} V`
            font.pixelSize: 16
        }

        Text {
            text: `Remaining Percentage: ${percentage} %`
            font.pixelSize: 16
        }

        Text {
            text: `Remaining Time: ${remainingTime.toFixed(2)} min`
            font.pixelSize: 16
        }

        Button {
            text: "Simulate Update"
            onClicked: simulateBatteryUpdate()
        }
    }
}
