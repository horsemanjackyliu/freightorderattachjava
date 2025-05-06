sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'freightorderattachjavaui5/test/integration/FirstJourney',
		'freightorderattachjavaui5/test/integration/pages/FreightOrderList',
		'freightorderattachjavaui5/test/integration/pages/FreightOrderObjectPage',
		'freightorderattachjavaui5/test/integration/pages/FreightOrderItemObjectPage'
    ],
    function(JourneyRunner, opaJourney, FreightOrderList, FreightOrderObjectPage, FreightOrderItemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('freightorderattachjavaui5') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheFreightOrderList: FreightOrderList,
					onTheFreightOrderObjectPage: FreightOrderObjectPage,
					onTheFreightOrderItemObjectPage: FreightOrderItemObjectPage
                }
            },
            opaJourney.run
        );
    }
);