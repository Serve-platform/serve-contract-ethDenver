pragma circom 2.1.2;

template IsZero() {
    signal input in;
    signal output out;

    signal inv;

    inv <-- in!=0 ? 1/in : 0;

    out <== -in*inv +1;
    in*out === 0;
}

template IsEqual() {
    signal input in[2];
    signal output out;

    component isz = IsZero();

    in[1] - in[0] ==> isz.in;

    isz.out ==> out;
}

template TupleCheck (k) {
    signal input address;
    signal input sig;
    signal output result;

    var tuple[k][2] = [
        [1446911596554066059610921290265946649894917611949, 3140810159800518965573553362119509149250967706356960495712936222202556563153203392767243554917021596924797791111156753123257805726124837309647071167668346395],
        [129394504787394156839024801174952106571260817630, 1531896711308536241544546582608225427830825404683664401989536476492282206425121566647262573921005672797713343728018510663447825596479793807942021926279037723],
        [1446911596554066059610921290265946649894917611949, 31408101598005189655735533621195091492509677063569],
        [129394504787394156839024801174952106571260817630, 15318967113085362415445465826082254278308254046836]
    ];

    component compare[k];
    signal address_equal[k];
    component compare2[k];
    signal sig_equal[k];
    signal num_equal[k];
    for (var i=0; i < k; i++) {
        compare[i] = IsEqual();
        compare[i].in[0] <== address;
        compare[i].in[1] <== tuple[i][0];
        address_equal[i] <== compare[i].out;

        compare2[i] = IsEqual();
        compare2[i].in[0] <== sig;
        compare2[i].in[1] <== tuple[i][1];
        sig_equal[i] <== compare2[i].out;

        num_equal[i] <== address_equal[i] * sig_equal[i];
    }

    var resultVar = 0;
    for (var i=0; i < k; i++) {
        resultVar += num_equal[i];
    }
    result <== resultVar;
}

component main { public [ address ] } = TupleCheck(4);