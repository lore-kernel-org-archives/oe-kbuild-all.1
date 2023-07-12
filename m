Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFF6A4A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 03:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689131788; x=1720667788;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SZOEKXcAu7H9jADYhOaHIgAtKvBhYNnXJioqtpd56XI=;
  b=nqEiRV/vhE3FLrxuC7j8wIn/xCaPnLeCAr/vSfTq3i5kGNpmyXoYOiBb
   H4o60x9G+cAedXRAadp6eI22oz5ZxmtKB7ikdf8w4pkyzdGvR0/sh0se7
   fjDokimaSoALTsmDZGqyir4/IV/TDqh08VlmhvX8pYc21hMqqDNwgIXlY
   oFYxO/vjKd6lLsuUDVherE7aBlrNUxbifkRZJK5v9h6OhTkl+Qyz8KAOZ
   Gs+i91I5CWA3ZKAieDoqzj5MpFs7X1HilG9xDMrG4Hy5O/7+2hC00AJy6
   QGHV2ml8IbE0aXdkcCtRquRPQQ0GbiFLuQ13qzFLn3WZn+2fSiRTAZ4Zm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="430916013"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="430916013"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 20:16:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="811424252"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="811424252"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2023 20:16:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 20:16:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 11 Jul 2023 20:16:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 11 Jul 2023 20:16:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 11 Jul 2023 20:16:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fl06rgfZhHpXMprM+V/je98IzhVqktBpW2zkPGaMYj69+CyTUrqTFJEMLzsa4NF9kKDUyTpKSoJztkFUiApqHe/rD2K/Js41xXoaGDAw64oXhXe4viT40y6RwO//c2rkbSIF6rUGrISBj+COikbbvsIsoW3DyhzTpnthDrixljFRWmXfnsLkuiumL6iP9Xr30X02QWW8QEtiVY2TUHLehTRLOUBe4unr17/6VAP5M/KzCs152RukmPNgJGC2+QFM13Wz4k9P0Ncyonexe8UwvgVcEQCdK6OMc73W5XBIPxCn2Wr+Bnp5drGJ0Tjl3xA0CmRlFcb2ny6wCqxZetIj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLZmz7eVBAbxcvSo2z+dDga47yUAbm+nB2tddVd60CA=;
 b=CNLNt8R3YCOZOYpCZK+/ZNrztDrrzqD5rHcG04sMhHfyeRpDqKw68CXp8t9Z3zUwBxS2iicaOJWpKOZZ4j+evEcq9zgOGsvNuT2/pdt7QbLW+83aJM5qe6rOMRiErgTywlqkNcPotxZgZZBUECij6OpWhKqgnFMwgJ71iWYai2ob/mfGIDtvZYQlKqaXNUHNKvVc/sNhcp7qvZD5DX2mGrGSRJoL9zqFx6Wqmb9wKGkjB26auMIPr/ozo3iQLZ+xLKozr1bZ5KDypJscMbujc2BTD1rx/joTfv48/87C+ecjmJrkhclEuHmquQ58sDpdJL5HBA/Nh6N26yud45xi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN7PR11MB2868.namprd11.prod.outlook.com (2603:10b6:406:a9::21)
 by SA0PR11MB4703.namprd11.prod.outlook.com (2603:10b6:806:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Wed, 12 Jul
 2023 03:16:24 +0000
Received: from BN7PR11MB2868.namprd11.prod.outlook.com
 ([fe80::d57f:3f8c:f033:56b5]) by BN7PR11MB2868.namprd11.prod.outlook.com
 ([fe80::d57f:3f8c:f033:56b5%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 03:16:24 +0000
From: "Babu, Ramesh" <ramesh.babu@intel.com>
To: lkp <lkp@intel.com>, "Pan, Kris" <kris.pan@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
CC: "Singh, Guneshwor O" <guneshwor.o.singh@intel.com>
Subject: RE: [intel-lts:4.19/android_s 3778/30000]
 drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not
 used
Thread-Topic: [intel-lts:4.19/android_s 3778/30000]
 drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not
 used
Thread-Index: AQHZs/7mzVCobVekYkmiNwBQv0vIOq+1dX4g
Date: Wed, 12 Jul 2023 03:16:24 +0000
Message-ID: <BN7PR11MB2868E160D27BA3F01BF8FC5AF536A@BN7PR11MB2868.namprd11.prod.outlook.com>
References: <202307112109.JFKojOmi-lkp@intel.com>
In-Reply-To: <202307112109.JFKojOmi-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR11MB2868:EE_|SA0PR11MB4703:EE_
x-ms-office365-filtering-correlation-id: 18383093-a297-4ee8-f667-08db82865fbd
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QijFNZR6oclmmXpdeo41Bur7qdIWCHQz1vPYqsB1PhQ2GJ2X03YdVz6M9ej9gzC+NNecy7g9g7C00/mkMEoFXxLg7s9kVOnhPkt3AWU4vcPT93uicVSmCddl2Wmxp8MxnCADsg51cxJm3HN3gzVSp++B8xGTst6dMSUMgiUB1A9fIbOCzzz4rUMUJAHWZWX1wZ8MK2PBOzPp9cY5ExrHopVVsxZTaT2B/mZpAsdfbg2R8gxcReROUpgYPgKZqV771S6Q/8IYvJivAhLi2vhJ8hvYt7tTupvnRKcBqpO3oyFtNSDi88qX8AMQcc/Q1TkbLqbElgDsVntaDbzTEUnwib5F1mty/uCO2fIQlQ0MvKKifEtJs+/O1qa9Y9+CNpbgIevwVUPSongyy9CGwP45vUSnknopss8l4uLS0Qj4XVebcfXzvp1cpFCrgwnfSJizWu175UuzZS2kcoXwj5RxLoImS4YM3qK8UO+SNlUWZVJYiY/2Z31/tzv95vxVbr2tR/o1cV82PPeWcrW7z1+OSnixGfuTaiB/OC4SvvGr2gCMKtlzjQ6fuAxnEHTqBkqWqEDroIsXaU+hQzYu0LcgUmVQGvPwBw8YO1vUY4Rz0DZ1dWArV7U6xHEA2+OjJDPYpIHXhQ8SVpyImLYvTXXUyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2868.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(76116006)(478600001)(7696005)(110136005)(71200400001)(26005)(53546011)(6506007)(107886003)(186003)(9686003)(966005)(2906002)(66946007)(41300700001)(66476007)(5660300002)(4326008)(316002)(66446008)(52536014)(8936002)(66556008)(122000001)(38100700002)(64756008)(8676002)(82960400001)(86362001)(38070700005)(83380400001)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m0wmy1SBJU4RKB4c/7y59HK6Doz/T3sl+O5YsPNeqlK9DovaEPMB18vt77bn?=
 =?us-ascii?Q?Uby4l5MbqayfbEQnVlNsfKp6rQ/6+Sitv4EiEz8ufMYu0JHl3g1X4ed7+RWL?=
 =?us-ascii?Q?TdsPD4LDmweJhFBtb7VGZmKSC33iJlSuPGASL93psrCr85UyFJm34DsOYyVV?=
 =?us-ascii?Q?9jw0SxZqiV9gHVV6c+u8gP5KY1x9QQ60znq2T5DOi5XI4ZCTr2o9AzOdMqld?=
 =?us-ascii?Q?oXCPQSyBogGkOo6os9KWSbeWq1MPmXEwVEWguL91EDv8zarhPxDJKjwz0tPZ?=
 =?us-ascii?Q?CUn+RI2dtbva8/jpUOqx8t5esD6vIIb7HLlA/8qzM6A5Jd0uKZ1x3f4cc5Mr?=
 =?us-ascii?Q?ZKm4SLg/lf0xXNSMThdE9lfWla3PTNfkRrDvzG5IUoLm9kv2PIhJyXiXtMeF?=
 =?us-ascii?Q?Qa7dcqmOH01CK8jn9R1kfeOG+JY/0Rfk3EURFqu0Wj1/A3ohyW/WaREFAuBb?=
 =?us-ascii?Q?CcRg6x8U8cl+l11+JlrcRtU2KXN3BjVJ7Avqdp5Lxu9J3lTuVLiEbbZ9nP41?=
 =?us-ascii?Q?W6OOjFIIrq2uPXTo4GRaEld5dRD0MkABCiPcpqa/lMnGf4qX4ZcrujTx8l4U?=
 =?us-ascii?Q?Ujn7EVPynZQeImN0Ca8lxZxTwA/OGfmEVTXKMMXlGMnUdB5kv8p+os4Z7LsO?=
 =?us-ascii?Q?N1MT2cZ0SGGQihGBfRE38HohXPutbVkOvGbQ9AF+xlbMSCAAge+4a2KQT6Nr?=
 =?us-ascii?Q?zn1Sy7C1+38m5p+l5jp5cgTIJ3XyED6slXQ97pd9l0buqQ/zPiUm3MdY4q9/?=
 =?us-ascii?Q?FLGG5B6GAAKFcS0RbmaeChMeBPZsB2/zxSNqcy8w+im8wyd13WUKhr8TEYs7?=
 =?us-ascii?Q?djaRYwmriy6jcXNxzgSACWfyw/2bWsmyQXb2siQ/ccxHWrZDRwwIIcBCt4PH?=
 =?us-ascii?Q?fkYENQwtCH31dq1kRuw3Ts9Zd0K6qOupZ1Y1NBNRXjiqVnafHFXKeb6cDjXz?=
 =?us-ascii?Q?Ci3Ht9PY7pc3whyfYRiccA4buY7ot7NkdYykdv9F5N36jN8YFuXdnwjgAxof?=
 =?us-ascii?Q?cKIX5f7hzLiFc+T+IN8x8XE3jQBKAPtdypD5oU3pdmAQ3YniN7VRDE2Hi6Yw?=
 =?us-ascii?Q?YHSq689qfhnbaEY978C5ZyS1QZs4Kn/sW2s9jnMs+Gt10vUsnmDI7/rySXV2?=
 =?us-ascii?Q?i53V/NuTUFA6LD51zcfcT7e/k1ZPOMxtmttD4dKI4GkwVSFb0o1qzZV7hQVd?=
 =?us-ascii?Q?3y8Z1HoxANGnyEVta6i4rSXOTNAcW3v56QXQvkYQ0uVZwH8m/piKLyukrqxm?=
 =?us-ascii?Q?MTYvIGI2ZOQ+TmmRSIIZKfsuX3ihAnpHeW2k23ZZWtDrBb3dCQCF3NekMAg3?=
 =?us-ascii?Q?s7xTsPfvAriZJXLlBkaRXaKGdWYgcCw5EvjEiUmEGZzzAxy/wmjYJf6VHcbd?=
 =?us-ascii?Q?6MXwbJH7O8g01FYes3CS2WDnr+HxpSdh/SyQFISV2zGEst+E3VX4dg4Wtjl7?=
 =?us-ascii?Q?j8bsI+gVG1Ya6OUbIs8kKVq/972woQOLiniGMNw02CE7hePtHAJ97/IPKmqB?=
 =?us-ascii?Q?dliynzBKKgXOh1RImIYpgZCRUacUwoxwdbY6HHeH86GHeJO4WgesJMIKsZHb?=
 =?us-ascii?Q?MM7LLoWtCYNLf3h0q0JK/B73n/Ukfqhwn4hWgeqM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2868.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18383093-a297-4ee8-f667-08db82865fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 03:16:24.6236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ATKWV5mj/7YlipVqgYNJpaCc8JDbI37sWpeUfECFlYP6EFb3LmGESBzs6TYWlRDNvZHW3A4HF+vrC+fLIetjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4703
X-OriginatorOrg: intel.com

Hi

Sorry for top posting. I don't work on this module any more. It's been more=
 than 6 years that we wrote this code,
so don't have context and required set up to fix this.
Please assign this to someone appropriate.

Thanks
Ramesh

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, July 11, 2023 7:21 PM
To: Babu, Ramesh <ramesh.babu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev; Pan, Kris <kris.pan@intel.com>; Singh, G=
uneshwor O <guneshwor.o.singh@intel.com>
Subject: [intel-lts:4.19/android_s 3778/30000] drivers/mfd/arizona-i2c.c:11=
5:40: warning: 'micd_ctp_ranges' defined but not used

Hi Ramesh,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   d86cf6f06c9415a617dd1a1e3c9dc081a3cf0f8f
commit: 90f1d221943f2adfc6a62813733d6dc0347ab20c [3778/30000] ASoC: mfd: In=
tel changes for WM8281 integration on K4.0
config: i386-randconfig-i013-20230711 (https://download.01.org/0day-ci/arch=
ive/20230711/202307112109.JFKojOmi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307112109.J=
FKojOmi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307112109.JFKojOmi-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but=
 not used [-Wunused-const-variable=3D]
     115 | static const struct arizona_micd_range micd_ctp_ranges[] =3D {
         |                                        ^~~~~~~~~~~~~~~


vim +/micd_ctp_ranges +115 drivers/mfd/arizona-i2c.c

   113=09
   114	/***********WM8280 Codec Driver platform data*************/
 > 115	static const struct arizona_micd_range micd_ctp_ranges[] =3D {
   116		{ .max =3D  11, .key =3D BTN_0 },
   117		{ .max =3D  28, .key =3D BTN_1 },
   118		{ .max =3D  54, .key =3D BTN_2 },
   119		{ .max =3D 100, .key =3D BTN_3 },
   120		{ .max =3D 186, .key =3D BTN_4 },
   121		{ .max =3D 430, .key =3D BTN_5 },
   122	};
   123=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
