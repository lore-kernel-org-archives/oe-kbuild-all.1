Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011034.outbound.protection.outlook.com [52.103.68.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C42904
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 18:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739645040; cv=fail; b=ac2z1t+fZMbyT//4gcTCI16HzMmUi41aju7f8jQvzMEOf4dtCATMk1QN93jGB8Y+XjuYZEHdvQLTmvy+YuAI3voaX0T9zD5tw0irSw46H8YGflEkRuNVVrMw7aFbTdvr79LUGy+qEl7OG6ey3wTvQO4dIPGDDz749r7M+Fj8cg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739645040; c=relaxed/simple;
	bh=OmS6oHBs5NxBV0TVHWGn3VgprCAoLKjEtHtrPy9Fsig=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s73jUwOFNp3fNg9pDLTNcVxwz0vWfxn1Cep5IEuMC8WW//cMSR14UrYIfJqStz5+FKSocxBNkQLkKw5ZIqp8Lbp5qRIN2koYVMJDd128ZcjOxuwcNG3zoy60+YZPTvIJEmppstRTMOgPtead/C24LIJDyIHzcpyH03mrfXQLgiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=DlEsFWvB; arc=fail smtp.client-ip=52.103.68.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="DlEsFWvB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcuhEd33TMCyX+e8xvZQpNO3ge43NgamCgU9V1Gc/uN+SHUOa0WuObd7J+YsKLuVy6o9f99bXOBqJyL6crp/2DhM3i/9q6BO5O0DqVHZczByErtW1riYSM6QtJntywyvG3A2iA3+1FSd0J/LmyVfvE4+oXLv0Frnx9k5i16TLYAj7o9gtDeTQkKncjkcJ4jzcjqhjpP50ZmxoiSmkQQzP7juhj2+krEYhWyEv9wD+QCG2zqkY/nHAMDIkpCLNDdREPu97Mx7EhmtVcEW+kZu2wH8iaOcn6g8jP3f4WDpUeY1D+QUkajn8/T+NEl84KdB6bXhyQ03fvOtIopIipM+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvGuLpDaarMqJxz2RjHvIhcQUqp8PodAh3/RjEYQVtk=;
 b=U1BwJ7Y34ob6am2if8EbusKe8gsiViWdgcA4VLgyy0hQhQ+QfVf3CuvNUo43IchLG1Xl+oJ/WgS67L+PvYe/pl4CVwf//NSGXMmByB8/5SoIKzeOY/etm7w2jXSWobIf3cGnJgg+6YowDc0/5Ash7820xo8nsHYbd6FN6vUU7vxJcEL+eNEyE5puo7PfkRieiyhAGul0UTEww8Nu6MDtz6FAU9kBX6WovOSXLwfDESVM2q3/Gkk40pr2RBVdUi1RFTNZ65S0EA6LVFYWR8mCW7EXCkayBq3keV34UVLAFHmGKrQrNQO0ab72YVUTlccqeTfy/UskxRrfgKSMDXmo6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvGuLpDaarMqJxz2RjHvIhcQUqp8PodAh3/RjEYQVtk=;
 b=DlEsFWvB2mErlqTdLHRhhsXhxSjchjJTEdkOHQHdkgfCP5PKaOpSC95MyUqBtL5wuvnhBQSeSLL2F6PPCWpsj8bFAqYqNGjerOp7LL79LMN2/lu4s1hATduk7TFZcn/OHC437Dx0f/65hS/E0f1G7AFXQUeJCODPkD/2GGYop9M87y3bDqGob5Fw0SLpR9kv9DnvFXKBn2LGB8W9yhckEjgeF11dWYeZNwb7BWF3hsy3U1nqDc/tmnMkAkvncgYRJCKyH/rQNmdO+QGEnYDzjlK3Nvukn4tcxtd0OHR5Up6R9pdao4lXYAlVfvaaD85ZWSTHUGWhKAoUU02hUEpgcA==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by MA0PR01MB7817.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:2b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sat, 15 Feb
 2025 18:43:48 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.016; Sat, 15 Feb 2025
 18:43:48 +0000
From: Aditya Garg <gargaditya08@live.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Jiri
 Kosina <jikos@kernel.org>
Subject: Re: [linux-next:master 1810/4011] drivers/hid/hid-appletb-kbd.c:405
 appletb_kbd_probe() warn: inconsistent indenting
Thread-Topic: [linux-next:master 1810/4011] drivers/hid/hid-appletb-kbd.c:405
 appletb_kbd_probe() warn: inconsistent indenting
Thread-Index: AQHbf6p5k9yFTQA1F0CdI0gOQ/kKYrNIs7SA
Date: Sat, 15 Feb 2025 18:43:48 +0000
Message-ID: <95066B70-F91B-4A93-B016-DFDD13F4A61D@live.com>
References: <202502152006.fBBCdEr3-lkp@intel.com>
In-Reply-To: <202502152006.fBBCdEr3-lkp@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|MA0PR01MB7817:EE_
x-ms-office365-filtering-correlation-id: c61a12f2-3331-4002-652b-08dd4df0af5c
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|7092599003|15080799006|19110799003|8060799006|8062599003|102099032|1602099012|440099028|3412199025|4302099013|10035399004|41001999003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ykF/4Tsk2WJCzC+Nr19wcBoaOU2UGgj4KPhUF/uyYNUWmBK8e4z0ErncKHCg?=
 =?us-ascii?Q?szc3f9TmG4U2UsuXZq5xTfooBNq6elS1ce5MLbUSNXClqbyTNK/1jt+fcosC?=
 =?us-ascii?Q?nI9llZ1axOi89Gvy/Ey4UiOBoCHg99NNOgr0+F/ABuQnZzwAIVDQ79f/OQ9E?=
 =?us-ascii?Q?e9dOOdd0AMBWv/DZ68ryhlq30Mlj67VLZ4S/CfWeAxru5G6ogxHpLrH6IY8q?=
 =?us-ascii?Q?IybWJ+JNL+9hB5t6XMiQ/0kdcKg5bxD+dWUDvtemFPYnx5q74E9clbJcmOHJ?=
 =?us-ascii?Q?Qhwp3J47abKtoTDmdS7UpF3Tyaxp5BMDTzXSX3UFoSLOmE+ghNsSFE0dBY2r?=
 =?us-ascii?Q?e8wgg5YuGIGvQFVxOYtDnYTg1tuCJW6TUXzMIcflL06WStdqZLxcu1gaiT9T?=
 =?us-ascii?Q?AupnUijJmEHkEumPPWpJbBco1kDamAuCSdcdA+TN2VuDaxJjWfsdLOT+q2Ps?=
 =?us-ascii?Q?l8t9Y79kRJgYsadanuTr9WKZg6sQt9lm+dvSwHluB2bbx0i61xLK991mjeb1?=
 =?us-ascii?Q?ZVXbYFS+ExHscW7s2C9yQhJkAJ7s/bjLQ2pnDx0yTLw4gHuFJlvR9K84kb3v?=
 =?us-ascii?Q?AN43sKVANdJpYksnVKjRTN0uUHdqiwJUcSMFxJPh8RDqwZ3X021dfUjtO5/N?=
 =?us-ascii?Q?J4wC1oUyrgPNwBkn/mK/RPO4x0DA6bJAVsmv/IRzk9RAr/HKnxpUqnaJrZk5?=
 =?us-ascii?Q?w8RBpVeoIFrGKMEGJ2+07pLoyi4/JSGKiXcoEuIBZ1w3FD+7tgEOTN5hCdgO?=
 =?us-ascii?Q?m2xX/5aFWAcOCJuPduxGGZXkD/XnjZA7+sVbBmJb7UvJZX9xTseNDq4djSwz?=
 =?us-ascii?Q?Vx6Q2+FJ/9m2YPa2+fTLPWhS4HYkbtt6OHYzI7tJut3dT3uhVuLanhQ0Z1kd?=
 =?us-ascii?Q?DpllAyAKi2YBPsyEmY4q0a5ZiqZ3nzDVrG/yPCXRNFmqvdgroMgjdyEsIAJr?=
 =?us-ascii?Q?MY7xemFP3XQ9jRzFtZe0OWGNO+LzhauILmWH+xcUV2+gK6b6IwaMdR0a7EZZ?=
 =?us-ascii?Q?erQX7PJuqId1C2D4yLuBPDwzOnBLC0QaaMHjUBP0cnLcfWVEwdgHW7ulmP6a?=
 =?us-ascii?Q?rKhVSLTOdhFouEQu3LviBAKc9AhfJVXxCcraQWP4lyogrxCsUlTNct9sxhEF?=
 =?us-ascii?Q?cuKjzrmnYrCrjevQ59ImJ8m5Q/cdfa0B3oyLurrMA6LwlcDNd7zwkjlVR9jL?=
 =?us-ascii?Q?azi+9pftcEfuYqRfDKhOHFVPYE8+FFdBS3SiDS9HHMIIO2YRXmXBiDqX53s?=
 =?us-ascii?Q?=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?60+w5sOtF4qcb3gLySsmVoGv1wGSqwG99GCDXN8v7NuOi2zrRwj0D5SyVI23?=
 =?us-ascii?Q?OOQWemX73ousksBBA+FZX9En5t4HtUeK6dS/znl8X1hvUNmP9R/gr9fxHBxr?=
 =?us-ascii?Q?9dLtuamdMdl1IUyqGoqjWLbCKPZbledXzjN9TTRZCpJdT/oIiA1ja9NKjHiV?=
 =?us-ascii?Q?L7EcK7JzY3djP54yPBF0dSQZC5OgJtIvDmgso+RCtFgp2s5+ji8heTwZo0GY?=
 =?us-ascii?Q?s0iIQNfBZtDY2mcyaQwfuEBRjqHlCMmyNgKVXzCqhsX8OVh5eccESo4qjstV?=
 =?us-ascii?Q?uzSJGwW4ATNqhcMNUCGti6oTFD1cemD9IujpCVvTkxLhmXH5gXWltwDdQclR?=
 =?us-ascii?Q?57GNSLWhhJqz5GLrSf7cro3OsAiDVi1aDCZFOTIvDu5akpRTzdB3m1dtzvhs?=
 =?us-ascii?Q?Sp4Xvz/PDa27xH1IhR4IRwI7tjX51Q3V8QA5v0g9ymfXvkoOJS5xx9EufaQG?=
 =?us-ascii?Q?QtDtp8U+iCf0qu+0V5fr/LJxbwSoZ13Skg2zMrvoEkoI/R2X2AGd+/2YqLPv?=
 =?us-ascii?Q?+1EYU1GzhCu4vgnkwQMh6tLYNMYJlBsiTgUNj++z6uw+ZIEF2uzPmQ3zMH16?=
 =?us-ascii?Q?nEUdTHTJZ0+uCvq9sCo2YgeAk/IJVyRSxDqKHZfDEto6TR54/MBWlyvQwfsz?=
 =?us-ascii?Q?KHahkah5fYqj2owejJn/D+Fg0PcC9htPW2wRjo9tWI+Fp0TqsfW3ZYfLayEd?=
 =?us-ascii?Q?hAuroG6Fq87kXR2RIHAU5ThLPIw5UX8vdCQJ/7lR6lg2/LVH/0TCGGny6n2J?=
 =?us-ascii?Q?1IH+aBkXhyyu1nUmPJmukK2Z0iirdEpBMl2c1xPGCrqbBgSQmLblAaFHEM32?=
 =?us-ascii?Q?5fqQM2mcFiIM4tiOmLmteWIKZxFO7Wv35nDA4X8SRzbS6nCNISjAcGajiskG?=
 =?us-ascii?Q?q/c4YG7uwA5zx408eOFBwkf9i1+HYsPYc+A09zg8EcO7vuGOtCYOvW6JDEyT?=
 =?us-ascii?Q?a83rWrnz5P+EmSrF6v7uyyqEIApslxH6WOCy5/K6K77nJRqJTeb7ljlwrOlv?=
 =?us-ascii?Q?vVNHseKUZ0j2PI0uK3cJm+STLrwX7KcZ/FQPRuaN7Q5DMWLKYr2uucgDYkYO?=
 =?us-ascii?Q?qX/tYIR0SgmKIK+bpKjQJ6AzseZGxT0o5YrGZV9BDO1E0xtz/KHUSWjW1O52?=
 =?us-ascii?Q?2BWSzCFoKRCABYozvvcCAEsGTrmyyJSkrOCiJhJDEwLXKLtfRjlSHxa/Pv9T?=
 =?us-ascii?Q?bTW4H8d5UJVFtglBGxlh2EG2+5/dVdbFDT1OviZIgGfy1z0UNGi1OTshxGsb?=
 =?us-ascii?Q?pa2rNUNJvMUqRLy2CIDAoVYztskBRIrgEDcU/uRfempkKNVWPAdCW9S4JUR3?=
 =?us-ascii?Q?zTNwzNcaLCBfcIzc46lur+co?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <030F910591CE374387544106DF118452@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c61a12f2-3331-4002-652b-08dd4df0af5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2025 18:43:48.5755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7817

Fixes sent here:

https://lore.kernel.org/linux-input/21F8BD96-7E20-463A-A997-4FBCF0934D87@li=
ve.com/T/#u

> smatch warnings:
> drivers/hid/hid-appletb-kbd.c:405 appletb_kbd_probe() warn: inconsistent =
indenting
> drivers/hid/hid-appletb-kbd.c:406 appletb_kbd_probe() warn: passing zero =
to 'dev_err_probe'
>=20
> vim +405 drivers/hid/hid-appletb-kbd.c
>=20
>   371=20
>   372 static int appletb_kbd_probe(struct hid_device *hdev, const struct =
hid_device_id *id)
>   373 {
>   374 struct appletb_kbd *kbd;
>   375 struct device *dev =3D &hdev->dev;
>   376 struct hid_field *mode_field;
>   377 int ret;
>   378=20
>   379 ret =3D hid_parse(hdev);
>   380 if (ret)
>   381 return dev_err_probe(dev, ret, "HID parse failed\n");
>   382=20
>   383 mode_field =3D hid_find_field(hdev, HID_OUTPUT_REPORT,
>   384    HID_GD_KEYBOARD, HID_USAGE_MODE);
>   385 if (!mode_field)
>   386 return -ENODEV;
>   387=20
>   388 kbd =3D devm_kzalloc(dev, sizeof(*kbd), GFP_KERNEL);
>   389 if (!kbd)
>   390 return -ENOMEM;
>   391=20
>   392 kbd->mode_field =3D mode_field;
>   393=20
>   394 ret =3D hid_hw_start(hdev, HID_CONNECT_HIDINPUT);
>   395 if (ret)
>   396 return dev_err_probe(dev, ret, "HID hw start failed\n");
>   397=20
>   398 ret =3D hid_hw_open(hdev);
>   399 if (ret) {
>   400 dev_err_probe(dev, ret, "HID hw open failed\n");
>   401 goto stop_hw;
>   402 }
>   403=20
>   404 kbd->backlight_dev =3D backlight_device_get_by_name("appletb_backli=
ght");
>> 405 if (!kbd->backlight_dev)
>> 406 dev_err_probe(dev, ret, "Failed to get backlight device\n");
>   407 else {
>   408 backlight_device_set_brightness(kbd->backlight_dev, 2);
>   409 timer_setup(&kbd->inactivity_timer, appletb_inactivity_timer, 0);
>   410 mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(applet=
b_tb_dim_timeout * 1000));
>   411 }
>   412=20
>   413 kbd->inp_handler.event =3D appletb_kbd_inp_event;
>   414 kbd->inp_handler.connect =3D appletb_kbd_inp_connect;
>   415 kbd->inp_handler.disconnect =3D appletb_kbd_inp_disconnect;
>   416 kbd->inp_handler.name =3D "appletb";
>   417 kbd->inp_handler.id_table =3D appletb_kbd_input_devices;
>   418 kbd->inp_handler.match =3D appletb_kbd_match_internal_device;
>   419 kbd->inp_handler.private =3D kbd;
>   420=20
>   421 ret =3D input_register_handler(&kbd->inp_handler);
>   422 if (ret) {
>   423 dev_err_probe(dev, ret, "Unable to register keyboard handler\n");
>   424 goto close_hw;
>   425 }
>   426=20
>   427 ret =3D appletb_kbd_set_mode(kbd, appletb_tb_def_mode);
>   428 if (ret) {
>   429 dev_err_probe(dev, ret, "Failed to set touchbar mode\n");
>   430 goto close_hw;
>   431 }
>   432=20
>   433 hid_set_drvdata(hdev, kbd);
>   434=20
>   435 return 0;
>   436=20
>   437 close_hw:
>   438 hid_hw_close(hdev);
>   439 stop_hw:
>   440 hid_hw_stop(hdev);
>   441 return ret;
>   442 }
>   443=20
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

