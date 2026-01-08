Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2A92F260C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 02:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767839476; cv=fail; b=NeO8vZI5kI+xRnTQBHRLplIT0Qwp2RVLjJS6/0KC0D/CK76tGKS6dzfqoN7O4pI1F0JQsYUMLfM90eYl59abWPNQVTFePV9Z7WehrtFx3STdrJWJRwUSVlL7vnh66Cx4rLXnKV76ClpdGH1B+cJcNcNgSxN0MdxMLHq/99ll5kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767839476; c=relaxed/simple;
	bh=sUy6YzEKlBWXi2SL9rHnfFBvowG9nl5PL+KtS9wPAus=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YnKSg59lEXmNI1shTmTxLZ7b8pgLdU9tDKZL3iOqAj7ufb5ssmF4qTviiAiCcf4+il+InwTwM3PACQBHoO82q51Ww+Y1pzYMo8PTDYdGhAhHvbHwf6XXqcYEtZKndENxSQucS6CvW7X0CunLmWacaZlHZi5BTLGO1sJ3RXGGv5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGXCx2k6; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGXCx2k6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767839474; x=1799375474;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sUy6YzEKlBWXi2SL9rHnfFBvowG9nl5PL+KtS9wPAus=;
  b=lGXCx2k6sfwBNcop0s9VVbGiC5LR9eJ88Z3WZui174HfIY5az4tepxk2
   qbo7ahbG0Vv7e8BWKw/3oOTqreqJCQM8Yrvcsmz8lP5FzNvoj5WWhwPFT
   YEl9q57erCZFv3xGEo3YLQYd/ftwhufUJpGN7cCOIuOa18ocYZOP134tF
   vRki+6nRStJTJqO2PLn7O3V3hTO0w7qYFrmundUJ1TDfnOBgNBycxlY1h
   XSi341VIob/CPwcXbPT8iF7hbfvXQwJwdMZje6RRrz5s3WeycSEY0cVlB
   HDy5KSYd7rBbnzhl2Xl9J+Symv0TOugxRAHbq5DwvgStpb1/kJ1AQv12O
   w==;
X-CSE-ConnectionGUID: zyk6BGpRT3ORXO74R9Hq4g==
X-CSE-MsgGUID: waAuV6FCRJy4i5TpmLkhnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72850405"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="72850405"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 18:31:14 -0800
X-CSE-ConnectionGUID: aQw1eSdPQV+46iTPTwzU4Q==
X-CSE-MsgGUID: OOK3rx5yT4+jeQAnZCmWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="202286485"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 18:31:14 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 18:31:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 18:31:12 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 18:31:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rqwb5ijIK/5/M4kc+1EE2Y/k+LHjImZ3c1idNDSTiIUqH933mKzoAPsL9KKIHDUR+Rgh3Kkk1qJFn+dDBwGa3rCc4TI3KnoElqYvVEgsPFCM1vngIGUkAbddgbbC9iimBieUG7Yl5b7Bt81UMZZpuc1oEpqa2Yj6xRy9OvzgAgZ68tRoQGybkzejyzINRHvajz3Z9j33CovikIlUvXW2xPxlHYr0nJHrK4GmSVzRVsJFCVEQTWfJJCuWCoFGQOu+HGUbQWvD+1n38+WYEhHCPX5obzCSHKAqu4eD35Ivjq1OERQwXmXAsWKbt6v19M/5sQfYEt3eVCzD+id1Ei+gLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IB5dp3qEAKeseyxWQfsmuw3zZak4fYQxGOQh9TtqUDE=;
 b=TPEEgfScw0QH2BUoort05vkY5e+0xgvu9VjH5JV80M+9tILEjCiHNH+tMCA310DfTNHFowzgte8UbaIiecLrzH5f/X/SMnZ48ctswH224XqRSKhBYhkSlFHRE6bFbDj0B3hXO/oYVhaH0mW2KByltH8jYbvCGXwMAridqcg52XHAnDIbTMs9KEbpezVJltTE5Doa9q3mdElKdI2i01CqZDjODaa/wKKxgx1wg1g/pWUJFmFDzmdn1chg6RwlFdK9pNzBeytfrF6m52rUIQllSi482C04ngOBKCmnFircgNmUboidV0YXtdtTbVb/PzDjzmvdepYfR2Sy5S6Aq5Ajeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA4PR11MB9010.namprd11.prod.outlook.com (2603:10b6:208:564::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 8 Jan
 2026 02:31:10 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 02:31:10 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Joerg Roedel <joerg.roedel@amd.com>
Subject: RE: ERROR: modpost: "__pt_no_sw_bit"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Thread-Topic: ERROR: modpost: "__pt_no_sw_bit"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Thread-Index: AQHcc5pQhVZNJRjzq0y2CS83MzLOibVE3PgwgABceoCAAmsb4A==
Date: Thu, 8 Jan 2026 02:31:10 +0000
Message-ID: <BN9PR11MB5276C1D60A1E75ECF872E9948C85A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <202512230720.9y9DtWIo-lkp@intel.com>
 <BL1PR11MB5271B4C385F1205E98B8535B8C87A@BL1PR11MB5271.namprd11.prod.outlook.com>
 <20260106132821.GA293394@nvidia.com>
In-Reply-To: <20260106132821.GA293394@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA4PR11MB9010:EE_
x-ms-office365-filtering-correlation-id: e1028cc7-4817-4857-b017-08de4e5dfc85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|13003099007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?7CDfq8qVEheKxm/jSpWGnZwD5NlQVo6rGID/LzD+TyAKWGudY0tsI5gDvsUm?=
 =?us-ascii?Q?4HxjXVgOfviulpRhwhWafJEwSxKeNNeM7qjInF5Gd5e1JYWHWVxBApONS0/r?=
 =?us-ascii?Q?IwHWorsAErgn81VrKLGYXsarPibLsl26UuUH295EUD5sQFuPv0r1Hh9YxLLJ?=
 =?us-ascii?Q?av3Ac1Lu6rm2IAq4wXTl4Spj6aLBVtPPJ4INgESca7q/y38afVw1vqengwV7?=
 =?us-ascii?Q?v/MlvYHjoxAjg69hwS92lfQfdDYw7gUYyvJ/OSht4v+/CDwACPND59cS39kW?=
 =?us-ascii?Q?hv2jWejL4yPgbXDHArBmb/B2MbW93sApByA8qlJgjjqiREI6Ua/B+1rXqH0T?=
 =?us-ascii?Q?KZ8Z0LiLnisJ9M2bZVME2YwvWDF8lpR3sMlPxMiQGJf7jeUC18/3buUIy8hR?=
 =?us-ascii?Q?GN2X/Gcv5eMNJw2ib7oNJY68VSUuE4c1cwxqs1HyZ7mrjGkB8U7/i/CmglKM?=
 =?us-ascii?Q?Ojbqd/GQuutRbXex+dhAZZRJlvEQj0SYGm5HM3Wpjch0v7KmIpJwwhCcxSqD?=
 =?us-ascii?Q?O7VFNSr+ZBFAlcPatzhmED1jgb/Q/a+SqiLSsHCTrZcgBrJCgW0JyGwYQjsr?=
 =?us-ascii?Q?H897liLeBisRPA4WOXx5STc0Vh2dsp8O4JaWSD5AVgFaEFjxDCAg1vMHT1JG?=
 =?us-ascii?Q?6iGXDYPH0S7d+dQ3CH6xQhkh7/NzgILeB2GUjTHR8Razofp8asb8In8O9N/e?=
 =?us-ascii?Q?De58lIipFjBEhIOqWmq9IZQtOxTS7RJcj5Fx/F8kMzCQIB3ecvJn2uYiRDKa?=
 =?us-ascii?Q?rupF74aQUI3psZNPSDPn10wk59rp8lIaxrwp20uezpnVu44o3k4iIPL+6ipz?=
 =?us-ascii?Q?foZjctxniLvNo21DNfZC9fi0yua7DcE23RtfFuVBkjxXNr5Ys8F7Ixamvruq?=
 =?us-ascii?Q?FuXq9Vo+yxM4hmLLH9zUHuQoFPL6eRTmV2AwU/ZVEtg0waqqj2wU/xuMRNzV?=
 =?us-ascii?Q?WJTFwsWuqU8y18aalJ6T11u4HrWHV1tM00HjWtHQZEJiRYfFp8bJ8fy/m4/k?=
 =?us-ascii?Q?uael1C0bJSRm/803zgOfV7ZjgyjLux0Ut/HO8uwiRr970pAAzijYtaATILBR?=
 =?us-ascii?Q?Dm9C2/9WoJQ236sEq1VS4umjUba3/P7vXMgdkLmQapDqSQJGbwsQ3R63o6yH?=
 =?us-ascii?Q?xhjLVUT7W31AprKv1lnFCHv4FJk22WfE3pSPTlmInMirHrwps0DtZasLgwIn?=
 =?us-ascii?Q?sOCAQ3/GhknHmiEmVwf3OKcXPd3tgfA/yiAljAfGpL7qp2QHAbWEEp0HtuiD?=
 =?us-ascii?Q?UHjNQzmZnaSlW38td5oIeDmQqabrPAGKsvrvjMQ2fPhw3nt4ZbJxXbdspGMR?=
 =?us-ascii?Q?BGeuBS/spEd6Fa7JY9aMIkOqVkibpwhzxzrEe2oOOGazbyw7JGCahuxq+ZBS?=
 =?us-ascii?Q?CUKM/8gNL+57T10A2HiGpw8BaU6hAaxd2niB1LdGnr89i1SgcHSiy16JQCch?=
 =?us-ascii?Q?Kc0ppqsjMM5VPuXW9TRCgqfZj8ATA9RLQNotqhEad4Ba1NcWqoIxb9QGjafy?=
 =?us-ascii?Q?tBrCOJ8fmiUDfKKks/BdggaXhTHDQvCLFV80carLsKsOLGd/f8Pwtn+cWQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BVq5vNc5tvLRVXPGn8eg/M0eW/il6yAuWh3nVb+Wq7qnxhm7VfBzMStKQARD?=
 =?us-ascii?Q?ZPfdiIkmJi26EKYIQ1QC001t0oKfP9OBd9ytLQZs/uJoAr4/1ObAEn9RaW0P?=
 =?us-ascii?Q?QXOBQNtjgwvzNaLhXDHysha/hBjm0Yrafmy5DrZXExfHay1l/DtLXF3SNY89?=
 =?us-ascii?Q?/Xa7Eu/ht1mzN7MOohfN3tCxHUvGS7R/7Ke/fxTrJ4kU5ZYVunYPz2qr+ah9?=
 =?us-ascii?Q?3/yO5w+TEb9nDWeDbRZbRtS4+vN0oUgzL95eEVUwVXiyGGPdB/xJZzz/2ZxY?=
 =?us-ascii?Q?IjpPDipAWPzmsSHIQ/9zLRgDx+eUSE6PJJxZpAZsMcPAkqIyZ5u9rui30yeS?=
 =?us-ascii?Q?4A7rXYvJ8gfsu8fvSyYFGuTzg5bFK1YHEENR9EMivmxcTAqUOKUTZLHqiq6s?=
 =?us-ascii?Q?cJ+Suhtkri9WFzEzc6O8OHvxqe9DLH7DCu7QQ3sd6VbMFMDmFrqbFxvd+dF/?=
 =?us-ascii?Q?diFQwWLwiVWlprZGHRpbU13TD/6U83dOd+dtzHZxZjHDepFwyGNe84Uatyto?=
 =?us-ascii?Q?qgtFUjxFs+/Py3QocR4HO7stp6RiRa0QYC3jKnjzAUMWEO0O8p0wWJIXewJO?=
 =?us-ascii?Q?6ga+18evNJ5Unsxv0UBpnHZAmkLezG7cBXu2P264yh/BrRlyxPzeZ/AgBbKQ?=
 =?us-ascii?Q?PnLjGJtjhyqRyU9xoYxnJLHBysTBdKbL9vXSYS7gPEHMdTaIZnFr/85pohmF?=
 =?us-ascii?Q?FNN0seowxqg+r3ygO35XCXFC3jLuo+6DnoERshhzRnsubKI6jfnDm2MsVl0y?=
 =?us-ascii?Q?U03tgzM+/hzRiD7pucXT5PAaGWkeXvfvKvU8mIt8nF3cXU2JIVRFJUgrdqmZ?=
 =?us-ascii?Q?muMJ/dvIvbsDmvuteA2oA/j5Oli4nnlZoOlruD3fiXObBr1YNe4V3QFf418P?=
 =?us-ascii?Q?MbzSDTtsQa5XZFMsZ2CTYX/QCyOfRZkGJAhQORyDCh2B0qaldAcAuVX1pzHl?=
 =?us-ascii?Q?Qax+7UPw+Xfc2I/CaDrmlRquWlKQ2OHW/iFtDfCnb6USY5qpLExOHadqqjGA?=
 =?us-ascii?Q?co2bz6A3AxL78cnQPnarkeFekwRdEvky4BdQewoIKqSi49Y9PZ1zUy9o6B+F?=
 =?us-ascii?Q?2sYGQaTM5wvf/PfTsFF+oBbD/UP1fJLNkJTgnNtZYl46a70zsQ0F9eM9f/G1?=
 =?us-ascii?Q?sw11voAZ3BX0r2RCv7Id9j0nJkeB9go3Iv8JoXK11H/eME4juSD7QoFfYFhT?=
 =?us-ascii?Q?iDoLXUnUM0Bf3uAVKTqlPICo6ENRm9V094Gdoc8dilLEw6z7wjb31MvCSeYu?=
 =?us-ascii?Q?sh3Q6hso5OrLzOCNRsjey9Is3WlEo3JigFfLKGNu0ZkZKT3OU7455Bc7knJQ?=
 =?us-ascii?Q?ihBx3JrZXymv0Z8m6nqoXMeaN4pa9aflJaQgDEQ9wiNe5FLotyCm1MBOtwHm?=
 =?us-ascii?Q?ctmLi2Scw8du/14s94xgalvngIMaR+6p+mBjXQpGdgpYoi99ssGK3ZgU4KcH?=
 =?us-ascii?Q?pEJo6lj0oCOKYQJrERTd2t6/2DbxMPmkuhUjAgI+ofcx8SVqfcL/w+EK+3Gd?=
 =?us-ascii?Q?WocmF/YZ5Xgyz1Pb1lbfS2hMvyY4dWRTXbnuo9mu77gv+F7t2Mb08cSXdnmo?=
 =?us-ascii?Q?V0r6L1eHETgt7mlPOWSJJSQc4wbvLP+8qbzN9lrbkxMbaTIp60bBpEJQMF7V?=
 =?us-ascii?Q?QGZz+vP1UunvRTuigW/oOdSZcgVmbxNPbus7ZBzIser4oiLBDjUM4q3SZqAX?=
 =?us-ascii?Q?Tz0kh7X+YLT8atg7hEi75AOxWiuiaNJ1YS3KT1LVm70JqY5mL7PfEweZpv7A?=
 =?us-ascii?Q?dc4D0MOr0Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1028cc7-4817-4857-b017-08de4e5dfc85
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 02:31:10.8485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IXRVvgBcdfQ/t3nLFF1Bd5sW/q+0UYhz0UKeJOgoc+eWYpLAWzJXqCOmh3Ay7oWzfKJwadwj9NsT0VmlSeX4fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9010
X-OriginatorOrg: intel.com

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Tuesday, January 6, 2026 9:28 PM
>=20
> On Tue, Jan 06, 2026 at 08:09:27AM +0000, Tian, Kevin wrote:
> > > From: lkp <lkp@intel.com>
> > > Sent: Tuesday, December 23, 2025 7:25 AM
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git
> > > master
> > > head:   b927546677c876e26eba308550207c2ddf812a43
> > > commit: efa03dab7ce4ed786b131f412440e2fd45fba11f iommupt: Flush
> the
> > > CPU cache after any writes to the page table
> > > date:   7 weeks ago
> > > config: powerpc64-randconfig-r051-20251223
> > > (https://download.01.org/0day-
> > > ci/archive/20251223/202512230720.9y9DtWIo-lkp@intel.com/config)
> > > compiler: powerpc64-linux-gcc (GCC) 8.5.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> > > ci/archive/20251223/202512230720.9y9DtWIo-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version
> of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202512230720.9y9DtWIo=
-
> > > lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > >
> > > >> ERROR: modpost: "__pt_no_sw_bit"
> > > [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
> > >
> >
> > Jason, are you deliberately leaving it undefined to catch config which
> shouldn't
> > compile generic_pt in, or is it indeed a bug?
>=20
> I think this was already fixed:

I pulled rc4. still can observe the error.

>=20
> https://lore.kernel.org/all/0-v1-63a2cffb09da+4486-
> iommufd_gcc_bounds_jgg@nvidia.com/
>=20

that seems to fix an out-of-bound selftest error. Not about this one?
