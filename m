Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0584011184
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 07:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707116962; cv=fail; b=rKoBNh3t/t+ipMPu6QIcjkYANWONhFvQ+WESst4Z1+c9KjQLRNfhrvDwTX0JOaAqMgM4UApz+5wgWY242ptG5j0LYh96a0iGMUB4IpfBqeqRPpN9FnHktW3G/zzl8S9RYZWqq+h9hHuL1+yw/LN4WXayMgZui0Us3rAGYFYiWVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707116962; c=relaxed/simple;
	bh=/tLwkWAApmYZdURNTvnDvrUzxfG+Lmlz638jsdWRhDM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r8f/kh04qN4iYnC0NSNQWKB6OBikODs5xh97yUjAB17VSMboC4qREPKPnD4AMAJF8Rc1qb2azXVvJNDMCo3vIUTAwK868hm/MiKrtpgpSzuvSHwqmXaowYQmu02DggXaoW2CBvAI3n6JUl2IYgxXOv/xl5AVLKR4/ayflwQv8Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqHww0W1; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqHww0W1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707116960; x=1738652960;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/tLwkWAApmYZdURNTvnDvrUzxfG+Lmlz638jsdWRhDM=;
  b=gqHww0W1+l7PEldjJowrmpQGTbpWIPc7ZKZKOsuJUoPU5JE5J785fKqZ
   dGD0Qt06q0nWzXU6fzheWIS6OnueAOAJQaGK6uaLtbaI+bMixR43NjXuF
   x536OA6A8WDDYv0J47JaQRhASzQ4oXLp/CUp5gEUnHaB4Niyb/8hg+CES
   9JpSG8O8jIuktFViPD/RO+nF/TuK7J5qM/6iZ9B7b/K+43IZKogwRhjD8
   g/FXHVOCEQQHBfjHbe9V9VGzfJXlCHjehhRDcGTSE8IqD0iRZgCePmxqP
   qGcqFXNtmPMeuKcP939wJaIHydMPvkkZAARZugymCdnehkC2J9nHBSvRh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="357487"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="357487"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 23:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="645155"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2024 23:09:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 23:09:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 23:09:18 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 23:09:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cse8cqZ2SPPoiPmBHPY1O5wbgot4uAmDRXZCt+arBNiZHjxkbXUTEOG/CENiZ8q/EyxgwkSptnEVz8MlaB7d5IW5ahzJz53TI2Gyn7ChwvZ6zcTktbfNWGKzIjkXvk3qt97rYH1rLEUqt8NFF0Xw7wcwd3uV0N/tiUcrqyyTpUl92y1/Yjn3FZFQuebX/arvdJYZLMjUnXje+i9xxxNff2zTyHE5yE5ffZSB8FXIatBXEiuddDPXJNdMm9yNLzd7/8dPp8Zf84PGjln7PmDAMKeunm4c59JHAEH4yuwoQY9EIKP4o4aip5OyHfDLF2y5gkPM+j1wjZFw51dTWnf0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTwvsOZZkEH8aHuGbCBO0zOI5Y3h1ZndE2tOOb1+L9I=;
 b=lhhzkuW4TDzIvbh5iafoUv0A6VKSqn4f+p5UgLM/3Zk1D/9TNLFmqWWOmzeCzn3aojtWezlI2P4heMEMlhRcYyYeyYPNlg5lR2ieJIAC3Idm3aIpSW9h6+z30KrhCKfhW6yhqUSEptuhRY+WsMKKS/IKxWpJx6quMIdb23IfIsRSBMxU9hFJGwqBd8VxpIGSwQsOuO35zve6ImO/DP/TZA9hx2b054G+oMNt/9P4P0k/UALsz7Z74iEQeTvi4IikMSwu3vH0EEN0W/7oN4wJPaOFxkVmGTAoB9T9iX+NJOucI93upCfoSNksvNjWp9Zwf0g4WjwyUkLDgnr0l6yfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9)
 by CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 07:09:16 +0000
Received: from CY8PR11MB7135.namprd11.prod.outlook.com
 ([fe80::35fa:d871:39a8:6357]) by CY8PR11MB7135.namprd11.prod.outlook.com
 ([fe80::35fa:d871:39a8:6357%6]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 07:09:10 +0000
From: "Wang, Yu1" <yu1.wang@intel.com>
To: lkp <lkp@intel.com>, Shuo Liu <shuo.a.liu@intel.com>, "Li, Fei1"
	<fei1.li@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Pan,
 Kris" <kris.pan@intel.com>, Zhao Yakui <yakui.zhao@intel.com>, "Sun, Victor"
	<victor.sun@intel.com>
Subject: RE: [intel-lts:4.19/android_s 2641/30000]
 drivers/vhm/vhm_ioeventfd.c:287:5: error: no previous prototype for function
 'acrn_ioeventfd'
Thread-Topic: [intel-lts:4.19/android_s 2641/30000]
 drivers/vhm/vhm_ioeventfd.c:287:5: error: no previous prototype for function
 'acrn_ioeventfd'
Thread-Index: AQHaV/6diIBRJfKKF0ufBxeUDEolMbD7VDLA
Date: Mon, 5 Feb 2024 07:09:10 +0000
Message-ID: <CY8PR11MB7135BA7BD719A95D992B5B58C3472@CY8PR11MB7135.namprd11.prod.outlook.com>
References: <202402051429.k6XmQ15I-lkp@intel.com>
In-Reply-To: <202402051429.k6XmQ15I-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7135:EE_|CY8PR11MB7897:EE_
x-ms-office365-filtering-correlation-id: aa92aa15-7506-47e3-cbdd-08dc26195a0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k6xAnZ4T42GWblFZuTelRNvaLIj/FtC8oA+4wzN/ocqOjCtSnXGjUauqzSH8d1+50q23iAOeqVBo1CvT34pyUgS6JEpXOF1pxX/R4RH/p2VEremg4I3GiGuUnuzCrqkRmA7mbh1N0/ZovhtYFDGzqUINDticE+Q1iNmg6UAf67gKBTEN1VEfLITSCybRySW9ZJhYhnlM/uwmq4PERPmv0rMjsZ+DzSoPw7cVijbiiTRGtKupfTip01msEBKiltiTaHEj9DR6oqWUNzXktwgyKL0NQA++CT90H/RpUgnKMQo3VYxC8Y1Y81pGQQMB+pOuZB9mVNjtUPvcFGNznIOpRqUL1n31PonsJQ4eowYa+Pp+lDr/CQo/SHmJjODPlPXlNtqQA3PGgnfO276Ard0q1HCBXGySE8uGzo0K+r8cTuc3OIA7uh4MUWG1yVRMqGed5ikAf9OpAqV9EundfmDH5haFs58dGGcsYrHDPW64cmK6wZ4oAj4n6Q58WCqH3YHgDNoKcYQT3FHsKsElTmXf2Cdt7oN/IBRHy3bhoxbsFSqbmopp1JDvaejhtePYrT/Z2wEEMSt0fzPZ8A5hgJp/UBLwZ5B0jJHuwabeaWFvp9y6ZN0lBqVyrerLGK0jaPDV7gHA0rSbcnkHh3p9j0t26w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7135.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(83380400001)(66446008)(82960400001)(4326008)(38100700002)(122000001)(8936002)(8676002)(966005)(66476007)(52536014)(64756008)(478600001)(54906003)(76116006)(66946007)(316002)(6636002)(66556008)(110136005)(107886003)(2906002)(26005)(71200400001)(9686003)(7696005)(5660300002)(53546011)(6506007)(38070700009)(86362001)(33656002)(55016003)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bbiKzWul97SZZr6RISVxqKhv8QiNxj1dsTX4UW1lZAVjVXeKpk/maxfT7MGs?=
 =?us-ascii?Q?ItO3tD2D7E2ZrKHHgaaxd9hFLiNIwYINqQfJhHGtcAuNZoiOn9CYJ6c/58rE?=
 =?us-ascii?Q?NtT+fG8QHdZGzZGhPSroRicBrxwiUtIfF1cdrCbI9S6ARjx8gt5fhE5B/QUN?=
 =?us-ascii?Q?lNNNGaoXsjBkUGjabljNVWrWISfpL3U+Sgi11qA7Xj/LhJAzmshXBe4TMqVG?=
 =?us-ascii?Q?sxCBU1R63nQ+bOcmrUo8EVgqe2x41qswLyCjY93RBbJx0fpVokEN9BWMCBz3?=
 =?us-ascii?Q?iv7dDMXOIor1Ly9r3Im67Tiijv9xQx40HXmiKUfeGH9yfZBRRXfATAH7tYVJ?=
 =?us-ascii?Q?r4oSJDDOfq81ufCEih+ZdgIoCy7J9qY6WGArZ3E7wom1ITYlj9qYwuudwY+D?=
 =?us-ascii?Q?R0MVqNQ46jrBlJ5/Wl7agvAaySv5tbWjLayNXJ6weCz89av66xRV2ymysGjZ?=
 =?us-ascii?Q?HR8MdXx1/lYvAkq2Ecy0AJHbkW4x0ky5ir8ZUqnjLcu+068JKzUTMCPOqHTE?=
 =?us-ascii?Q?QbdIKcIALs4zncz/Vyvk7ISLLCy5bXTZiT7a2H8TraM7ZoZ8b2bz8gof3UvH?=
 =?us-ascii?Q?Dxaka9+8NFKYAXW78PD8HcaqIHi+VwEScI8/J2+GBI1wHdDIi3OzBWCIeT9U?=
 =?us-ascii?Q?MVBO9gzmYDJ5M68cJvwLBPLw075lw8eXnAJj8JwZUGhdcGSAUHp8zSDfPO4Z?=
 =?us-ascii?Q?VvR5TOr5Q2uYHGyxq4J+MHMFDHGis5Wjc2aJcl/HT1d0DLU9S/iFagjOvuh9?=
 =?us-ascii?Q?Cv3xByCKd6jJ4sNQTI+RKBiA8Ys8z1AR1Xj9ktwdHtyZuyBDs8SxNsF5OBI1?=
 =?us-ascii?Q?0sYmcUdLquNCmLOqqWwgXhimqy9M56lQZG3hfyMQJlI5O8ul8Wzi0uqzPtwf?=
 =?us-ascii?Q?MBmU3VZIm2+hXOMzKnPq8RYRtghHIm35wifG2OjZTmwJQCwAyQ5AnZZbg+h1?=
 =?us-ascii?Q?/tVYJ2PAATtgzMf/nxsgYPkHzlasLMY31FZj1UyKPxBp6vS8Zy6CV5/H1kEU?=
 =?us-ascii?Q?Pj9WjxXLYn9EPR1fToxFHHgbjaTK/aAwcQxsSBY3cWcsoZ06Ko/cQCsussPF?=
 =?us-ascii?Q?vdQx1BTWm6EcJLeUQec2oHKTC41fvY6BkTmRecAS7i4+/SjCXqtvZ18569D1?=
 =?us-ascii?Q?El5REQ51VRdTekvy/PDyd9pdsNa7dS6bdbnCqOUth+NSwKcYI8LYkOPzE3pV?=
 =?us-ascii?Q?fTGGvgD+jAU6XXsPLEWZ/xr4uzJXMqQ2ZaNFG4RiFpZq32SQniNEXKxvFc8S?=
 =?us-ascii?Q?x1A/qFhxEpG0gHleURv2HErWFTUYX4Do63HXwFR9zEHgnVUSwcg/H25ol156?=
 =?us-ascii?Q?D/xSH41UsCG+5+WhuUPbSx338ZHSGN+olF7wr75HjorCb5/mCwaAE1RQimeW?=
 =?us-ascii?Q?/USwinTsKaFAplzF8ZjCVx+Pc7wxFFIqCKcpdg4g47QrO6fjLwmBmlkBIGib?=
 =?us-ascii?Q?8bHQV3Y5BFzOhefPxFPh1UtgDQmj6Iw3xR25hfWI1yFOvwKYhVXUtVZz1m3K?=
 =?us-ascii?Q?gqerV3RqWVZQffJs5PICBWMviiXUjYdd+NH4qjQBO98Qk9NRW2/83ORiZTPe?=
 =?us-ascii?Q?JQEfYjyn8Jyj8y5shMEINtn1y9ZwoZbA0fnMb22V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa92aa15-7506-47e3-cbdd-08dc26195a0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 07:09:10.6545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Shl/6Po5XFtJeTWJNWHYdvSdYFILNKkNTV7wpPwL1C7Z1FfaUrAoLoFFDZ8EP6PNIuO347eyvlmUe8OQhhWlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
X-OriginatorOrg: intel.com

+Fei to help. Shuo and Yahui have left Intel.

> -----Original Message-----
> From: lkp <lkp@intel.com>
> Sent: Monday, February 5, 2024 2:43 PM
> To: Shuo Liu <shuo.a.liu@intel.com>
> Cc: oe-kbuild-all@lists.linux.dev; Pan, Kris <kris.pan@intel.com>; Wang, =
Yu1
> <yu1.wang@intel.com>; Zhao Yakui <yakui.zhao@intel.com>
> Subject: [intel-lts:4.19/android_s 2641/30000]
> drivers/vhm/vhm_ioeventfd.c:287:5: error: no previous prototype for
> function 'acrn_ioeventfd'
>=20
> tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
> head:   f2b228e8331cfde18e95b9fdeb61f16ae51d0c48
> commit: 7f8e6dad0b3be85a4b5e193de231eb063cfadd8e [2641/30000] vhm:
> add ioeventfd support for ACRN hypervisor service module
> config: x86_64-allmodconfig (https://download.01.org/0day-
> ci/archive/20240205/202402051429.k6XmQ15I-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project
> 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20240205/202402051429.k6XmQ15I-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202402051429.k6XmQ15I-lkp@intel.
> | com/
>=20
> All errors (new ones prefixed by >>):
>=20
> >> drivers/vhm/vhm_ioeventfd.c:287:5: error: no previous prototype for
> >> function 'acrn_ioeventfd' [-Werror,-Wmissing-prototypes]
>      287 | int acrn_ioeventfd(uint16_t vmid, struct acrn_ioeventfd *args)
>          |     ^
>    drivers/vhm/vhm_ioeventfd.c:287:1: note: declare 'static' if the funct=
ion is
> not intended to be used outside of this translation unit
>      287 | int acrn_ioeventfd(uint16_t vmid, struct acrn_ioeventfd *args)
>          | ^
>          | static
> >> drivers/vhm/vhm_ioeventfd.c:398:5: error: no previous prototype for
> >> function 'acrn_ioeventfd_init' [-Werror,-Wmissing-prototypes]
>      398 | int acrn_ioeventfd_init(uint16_t vmid)
>          |     ^
>    drivers/vhm/vhm_ioeventfd.c:398:1: note: declare 'static' if the funct=
ion is
> not intended to be used outside of this translation unit
>      398 | int acrn_ioeventfd_init(uint16_t vmid)
>          | ^
>          | static
> >> drivers/vhm/vhm_ioeventfd.c:455:6: error: no previous prototype for
> >> function 'acrn_ioeventfd_deinit' [-Werror,-Wmissing-prototypes]
>      455 | void acrn_ioeventfd_deinit(uint16_t vmid)
>          |      ^
>    drivers/vhm/vhm_ioeventfd.c:455:1: note: declare 'static' if the funct=
ion is
> not intended to be used outside of this translation unit
>      455 | void acrn_ioeventfd_deinit(uint16_t vmid)
>          | ^
>          | static
>    3 errors generated.
>=20
>=20
> vim +/acrn_ioeventfd +287 drivers/vhm/vhm_ioeventfd.c
>=20
>    286
>  > 287	int acrn_ioeventfd(uint16_t vmid, struct acrn_ioeventfd *args)
>    288	{
>    289		struct vhm_ioeventfd_info *info =3D NULL;
>    290		int ret;
>    291
>    292		info =3D get_ioeventfd_info_by_vm(vmid);
>    293		if (!info)
>    294			return -ENOENT;
>    295
>    296		if (args->flags & ACRN_IOEVENTFD_FLAG_DEASSIGN)
>    297			ret =3D acrn_deassign_ioeventfd(info, args);
>    298		else
>    299			ret =3D acrn_assign_ioeventfd(info, args);
>    300
>    301		put_ioeventfd_info(info);
>    302		return ret;
>    303	}
>    304
>    305	static struct acrn_vhm_ioeventfd *vhm_ioeventfd_match(
>    306			struct vhm_ioeventfd_info *info,
>    307			u64 addr, u64 data, int length, int type)
>    308	{
>    309		struct acrn_vhm_ioeventfd *p =3D NULL;
>    310
>    311		/*
>    312		 * Same addr/type/data will be treated as hit, otherwise
> ignore.
>    313		 *   Register PIO[0x100~0x107] with data 0x10 as ioeventfd A,
> later
>    314		 *   request PIO[0x100~0x103] with data 0x10 will hit A.
>    315		 */
>    316		list_for_each_entry(p, &info->ioeventfds, list) {
>    317			if (p->type =3D=3D type &&
>    318				p->addr =3D=3D addr &&
>    319				(p->wildcard || p->data =3D=3D data))
>    320				return p;
>    321		}
>    322
>    323		return NULL;
>    324	}
>    325
>    326	static int acrn_ioeventfd_dispatch_ioreq(int client_id,
>    327			unsigned long *ioreqs_map)
>    328	{
>    329		struct vhm_request *req;
>    330		struct acrn_vhm_ioeventfd *p;
>    331		struct vhm_ioeventfd_info *info;
>    332		u64 addr;
>    333		u64 val;
>    334		int size;
>    335		int vcpu;
>    336
>    337		info =3D get_ioeventfd_info_by_client(client_id);
>    338		if (!info)
>    339			return -EINVAL;
>    340
>    341		/* get req buf */
>    342		if (!info->req_buf) {
>    343			info->req_buf =3D acrn_ioreq_get_reqbuf(info-
> >vhm_client_id);
>    344			if (!info->req_buf) {
>    345				pr_err("Failed to get req_buf for client %d\n",
>    346						info->vhm_client_id);
>    347				put_ioeventfd_info(info);
>    348				return -EINVAL;
>    349			}
>    350		}
>    351
>    352		while (1) {
>    353			vcpu =3D find_first_bit(ioreqs_map, info->vcpu_num);
>    354			if (vcpu =3D=3D info->vcpu_num)
>    355				break;
>    356			req =3D &info->req_buf[vcpu];
>    357			if (atomic_read(&req->processed) =3D=3D
> REQ_STATE_PROCESSING &&
>    358				req->client =3D=3D client_id) {
>    359				if (req->type =3D=3D REQ_MMIO) {
>    360					if (req->reqs.mmio_request.direction
> =3D=3D
>    361							REQUEST_READ) {
>    362						/* reading does nothing and
> return 0 */
>    363						req-
> >reqs.mmio_request.value =3D 0;
>    364						goto next_ioreq;
>    365					}
>    366					addr =3D req-
> >reqs.mmio_request.address;
>    367					size =3D req->reqs.mmio_request.size;
>    368					val =3D req->reqs.mmio_request.value;
>    369				} else {
>    370					if (req->reqs.pio_request.direction =3D=3D
>    371							REQUEST_READ) {
>    372						/* reading does nothing and
> return 0 */
>    373						req->reqs.pio_request.value
> =3D 0;
>    374						goto next_ioreq;
>    375					}
>    376					addr =3D req-
> >reqs.pio_request.address;
>    377					size =3D req->reqs.pio_request.size;
>    378					val =3D req->reqs.pio_request.value;
>    379				}
>    380
>    381				mutex_lock(&info->ioeventfds_lock);
>    382				p =3D vhm_ioeventfd_match(info, addr, val,
> size,
>    383						req->type);
>    384				if (p)
>    385					eventfd_signal(p->eventfd, 1);
>    386				mutex_unlock(&info->ioeventfds_lock);
>    387
>    388	next_ioreq:
>    389				atomic_set(&req->processed,
> REQ_STATE_COMPLETE);
>    390				acrn_ioreq_complete_request(client_id,
> vcpu);
>    391			}
>    392		}
>    393
>    394		put_ioeventfd_info(info);
>    395		return 0;
>    396	}
>    397
>  > 398	int acrn_ioeventfd_init(uint16_t vmid)
>    399	{
>    400		int ret =3D 0;
>    401		char name[16];
>    402		struct vm_info vm_info;
>    403		struct vhm_ioeventfd_info *info;
>    404
>    405		info =3D get_ioeventfd_info_by_vm(vmid);
>    406		if (info) {
>    407			put_ioeventfd_info(info);
>    408			return -EEXIST;
>    409		}
>    410
>    411		info =3D kzalloc(sizeof(struct vhm_ioeventfd_info),
> GFP_KERNEL);
>    412		if (!info)
>    413			return -ENOMEM;
>    414		snprintf(name, sizeof(name), "ioeventfd-%hu", vmid);
>    415		info->vhm_client_id =3D acrn_ioreq_create_client(vmid,
>    416				acrn_ioeventfd_dispatch_ioreq, name);
>    417		if (info->vhm_client_id < 0) {
>    418			pr_err("Failed to create ioeventfd client for ioreq!\n");
>    419			ret =3D -EINVAL;
>    420			goto fail;
>    421		}
>    422
>    423		ret =3D vhm_get_vm_info(vmid, &vm_info);
>    424		if (ret < 0) {
>    425			pr_err("Failed to get vm info for vmid %d\n", vmid);
>    426			goto client_fail;
>    427		}
>    428
>    429		info->vcpu_num =3D vm_info.max_vcpu;
>    430
>    431		ret =3D acrn_ioreq_attach_client(info->vhm_client_id, 0);
>    432		if (ret < 0) {
>    433			pr_err("Failed to attach vhm client %d!\n",
>    434					info->vhm_client_id);
>    435			goto client_fail;
>    436		}
>    437		mutex_init(&info->ioeventfds_lock);
>    438		info->vmid =3D vmid;
>    439		info->refcnt =3D 1;
>    440		INIT_LIST_HEAD(&info->ioeventfds);
>    441
>    442		mutex_lock(&vhm_ioeventfds_mutex);
>    443		list_add(&info->list, &vhm_ioeventfd_clients);
>    444		mutex_unlock(&vhm_ioeventfds_mutex);
>    445
>    446		pr_info("ACRN vhm ioeventfd init done!\n");
>    447		return 0;
>    448	client_fail:
>    449		acrn_ioreq_destroy_client(info->vhm_client_id);
>    450	fail:
>    451		kfree(info);
>    452		return ret;
>    453	}
>    454
>  > 455	void acrn_ioeventfd_deinit(uint16_t vmid)
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
