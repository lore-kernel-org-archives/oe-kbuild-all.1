Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4B336923F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787489713; cv=fail; b=oUWArNetV5qIq3MusP95M0+ROUGh+TyeA+WJceNClp2tlis1/6oqdr3zkZtBmwRFFsd5GzEJWm7hVNXURamKSMPuQtiXztObZ0VmtIpfMDvpu8SQ/eJuO/lejNZYmtiERYh5d5VbU+pWG7m7LbCy76MYXED5LdSTFMB8tEOOYV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787489713; c=relaxed/simple;
	bh=7IAEa96gRGVRZj8bGSxLE6a1DCTk7S54wBRkUIgdNJU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ONqCqUqiETvjy651sUKDutX2hlI7x7wmeZh7bowk5Glsp97wwPiQ4L0tljXIhFLgx+e+UEFZXritkiCuUwJEhy8TJUwoFlqitSG+UX5eAJ1BkuaUHDaUShxOwWeiC+4B7khrV0mRVPDdJoCxzn8W6QOGxGf4pM8nSmycIyEVfXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIRYzJtr; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIRYzJtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787489712; x=1819025712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7IAEa96gRGVRZj8bGSxLE6a1DCTk7S54wBRkUIgdNJU=;
  b=EIRYzJtrFNf2w51SZ5Wh1rWa1qjYC6h+vUxkbokExgcm9TIr0gE/f8Id
   JIPwQbzhXtIKN4gKy6rH2EkhwxNGsirnCOQzfYUcr0B6l6D7E+uSmTxhv
   BPtLWQ5Mqye29wSfw+i3sWjeIH72gpbcRhRCEED83b1VWuJyVGN77WwFe
   x97XDhoLW70dy/6C2E+UxffiWW3QtSxPve9CV4wEwcSDEXhBro786b4cc
   L2mHTcZMYOXOLMUO4fft37i6k4nND7ig7gON2QDQj+TBcGsBq915q3EmG
   EcjBbaOOgUJ3CzSM6pqKZsva9OuYAGj10bmTWf8ykwhUMOA4hifM3GNLr
   g==;
X-CSE-ConnectionGUID: iQRcCEMMTq6DhleZbLaySA==
X-CSE-MsgGUID: yzgTe0kKQ0ycWTmBFXBjAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="113497693"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="113497693"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:55:11 -0700
X-CSE-ConnectionGUID: sMuUqjwSSPKpFNdq65Jw8A==
X-CSE-MsgGUID: acUoe7iQTiyXbtQTDuabNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260607150"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:55:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:55:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:55:10 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhOiDfCkPbIlxPlFFsvExQCihnsBNnmRXESbJ5FhHppJ1VOTZpalZOEqd7aiY8VU0QRRMBpIKfc96HTQkA9wY7RPug/p8XM/elT64EpddMCVP46CTf2ZUr0v03Myf8Y7Y2FF96JmXw70Hj8EFPbO8kEJcsMhhMog/k3n040Q8105GQUWUnTTDWD6UxmoZ+KpZnvEqO2GV06cI3sM+WmuCXOOXWXZ97eudVX8rq72d+CALjO/jDUnKoER8i5IihJ55cux41QURb0rgeRxKrH5zs1uBgeCYGC9EGQOGJFzCx86xxpx4H+ETLDVU5znSx7btO4P08kIlpHjpVK8i+ixKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVhFwYWp7LmPb8MikFA217+i+Hi4uV+m53dB3u+HkH4=;
 b=bUiVZsd8HNqw23Z+uFNtVvYLjjX0zN0sRNfnDxF20c0pnY+rZqdt5a7hmpArJwcLAI65ut2EwkGVUHpo8cNePuD6eKb5yyrt+01WqUi5jo14oxv9TcRFZ/61mnJU4ewwb698mUUiI7e7dU05ZeTbh8+QsQsHKHBL9siQ4w6jLsHXqEBoZX9kbtV/cmCyJQfGPylTkq4oDMoUXQletGFJhRyLo/TGrBhDT7D9SFkP3/gh0dsXcZ3JFSP+XAnzVQClXb3hbR53T4rzbGbXO2rEKG1qzcb5b8j37u1664ccbvxI6WgKCbENeC5NO+rAgx5GkjlxKa6Qc1iZWZp2nVjT2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:55:07 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:55:07 +0000
Date: Sun, 23 Aug 2026 20:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/nvme/host/sysfs.c:357:30: sparse: sparse: symbol
 'nvme_ns_diag_attr_group' was not declared. Should it be static?
Message-ID: <202608221628.h6bPNaUQ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0005.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::8)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: ed11250a-a6fa-46a6-a71f-08df0115c20d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: ZgOcfosHR8QGehsrxz7ws7HfN5OHPmTkDW131g2uMvnXQpo3M43oAqa+vVbVORYnj/Z+fhoGy8+m2er7DfrzRyOpaKVNYsO1mnSBe6lG0wLmI3TbjROEJo0T+S10epeWUtaA1mZ4hxnGJBU4N2kIOTnFEPyUlcoPXkyjNuRKKPm3y3JWNvIpQNRBCUTN0B+XOjiG3eiIMFvLklSSVOKE35DxI0FFMGUz33MWGHqXCDgfzMIG1wqZjefL4hwlWH/aCl1eXkcTgPDIeUTM3JJvhXCKUjqMFu1V92T2ztIT5JYtG/KFr2xtiGuaAUDBfg071X8SaNE2gAlIgTa8/8b2kfY0F/KKw3muB3ogKYSnQo4LZceJ/puPx186o82B1cOUl9Meotg5lflV3ZOgeseVVdFOjshf3P1bMCIWBlRLIGiKuyFlqOJwCVApPLSP2f+Iwb7427nCWTBl2smtSmlvWa+R8OZCGVLyShTvrUG0v6svSIURj1uI8wOVjNBJVwA8SgmwFImNJHnLLsNPsvs3gExVUan6x3kRs82RORMB7CmMb8RIGSsqV7C4txIGhZVjKUvhM0mlW5z+z/ekY5VT/BHZCeyS5rjv1PTZhTqIB5AWjdLajQQcO/42d7PXaWaPez9M6Q7uggwt7/05Rnwppx5eMsggd7EemWK+x+qmJys=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3ZsZ0TIcsJ10s5oGBGWhF1OCcTurghxxBjxjN219SOQvz33rVP9HfcA65Lnj?=
 =?us-ascii?Q?D7w6J7wKfImrJBObbgFNS2eIxDOZISE92MHLcx11DbVf4k/v0xl9DPHy/MBo?=
 =?us-ascii?Q?XgDiEYLl0vlzpSmGZTTNLE26tqCpxO3uUCQiBteRlH7ZiiO+5pcxdssjDfuv?=
 =?us-ascii?Q?9lttHiT4CrplucgBMNljyFizTB/uDCQiYVLU9HEwQxF3kzScYVrYXpf8Z7cM?=
 =?us-ascii?Q?R4bZl1exydP9OC4GLRyjt8sDVP5x2KgzLGNMS4U/FA2T8h7FQRZQiXXeY5bD?=
 =?us-ascii?Q?pafpDXwOsGFD6Bdwr7H2LBqtMUvRAW8LomzEWWmKbS400ApLOLVM7EkwNaFG?=
 =?us-ascii?Q?/7jaKVzsgW+1FQGSl3TMQM7stlS61AEcGZefU8Pb2rh7thM4zdkQKBfjTgjF?=
 =?us-ascii?Q?LAzWZzoN2L1Udk2kfwUQLGzCV2c4bhtD4hE7nXMPhcjNYjD9vNVTavUL68kV?=
 =?us-ascii?Q?qZE0Xk1ZDQRJbA7x/Jf/gYg4wP0JXNGBqVrqBLlUn2GWM4S/owJvzxGEuwvU?=
 =?us-ascii?Q?7k4WwHASmb1FhDeHatxXncIm3V9MJgxQnxoaMn9bukiMiY0t/x6M3yxPzBdS?=
 =?us-ascii?Q?DIkvWbTryiKFnAeyzZdsgwVQX3wUH5CfyinvXLlxZxbs5q6GcQWjTw+yCb+e?=
 =?us-ascii?Q?XEqtxY5ik80hboKpfpylsbd8tKF7qJGrI/2XmOsPkycUT3aNHZ1oVdyT7YDf?=
 =?us-ascii?Q?Y/uw9BHheBWbqxB6VqHqRYppBbqFLOpTGourNc/d7jmAJjAJgqbvDp6ZZWsM?=
 =?us-ascii?Q?9N8efu+sOmhXUXEIknVZ/xxjT3Vh/CbebMXvIalb5ddlwHuDhpV2hisrhFLf?=
 =?us-ascii?Q?CzAZ+2SOlK7g+9aiL/DyVLzprftDAYn8+6SqfwrGrisitzBqV67MiVwSgrFb?=
 =?us-ascii?Q?PeVZO+MP4b6viTss181MDey3dj7c2nKV/9HF8H09weQhHfwPF9kwgkF85aRw?=
 =?us-ascii?Q?L0V2HijCM+aFSthY0N8bT8Nm6QUL5eX1dQXoPfaRMSBQH/9qm8buVc8vpSHK?=
 =?us-ascii?Q?KtsEvW1PyPA1E7h5xEuDq6vzg2/qMV7TZaFtxk6OdmAnv4vrWthadiNF0dus?=
 =?us-ascii?Q?CSXLAKWMwZW1Ll/LK8n801sUjtBwX5VPjcfH6zqAIS6c95WKsMv5WR094mB/?=
 =?us-ascii?Q?1JkuVB8u1zq6XjjwmU+5H/4uiflwYZ31pZPasZcCVSv5VXM7p2CODY2+Dj+r?=
 =?us-ascii?Q?Cl9hKZY1L7LV6jpsiPF/2GKShIc6SU09E0gekATiV0vFxrEkPpLkqYdZyH4U?=
 =?us-ascii?Q?Osy6s8jZBzxdARPX45wzY/KiQdor+nmeVO+isJI5b6DvQD+yGSL67TokZ4ck?=
 =?us-ascii?Q?QNm2RWb35lm0R7B35Kr3ein9RpYk2qlW0pUJcxRu7BgsH6b0fHMK1iNt0HM/?=
 =?us-ascii?Q?dyrgufO/ax/AnUFVs74x20FTjupv3NInxRbvlNU6Oz3YpCJPvjx1US0LXzmj?=
 =?us-ascii?Q?tUG8+G99+rFgNPAjWBACsiXk/k9RFT3Ck2dKqoOtYTaJrj3ORHWBYVUGGwuM?=
 =?us-ascii?Q?KBQoukg7yzSVtxU16ti6GMZO0kTD3g0LmE+dW4J0Qx8kyxCWgUNfE7C/X+OC?=
 =?us-ascii?Q?MNhJry7U4Tj8tiTgSkbxXutWC9pVVT5q7Z1O3IHdu23CEIX04vwNabPLnKiI?=
 =?us-ascii?Q?eW4tpeKcGsKKkzHBKJeD+6+59mLYIRJZqbit57FCmZp0zD4Sx9a9laOgrXbz?=
 =?us-ascii?Q?/uk8QBVRyCGLS6nU9qZEbWxzH6V51L082ufMYIqtQX7uWluPvRc9L+BW6XDM?=
 =?us-ascii?Q?bmd8CZXGmg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 1oxw2OoPtqv+qOtdBHWSaD9tTKSXcFUYLEFiRjQBpsHrRSOkydPBL64zhu/pEVV2yQLTiNG8utyKDugllNwEgAPvgcrHCmraG40QLt03v1bfCbG9j3PW8n8ys4JKCtcLbbF/toUips05Hag2KRmCo37DddFRvCXVzMLMGe6adTcFzOkRtuXQ5wUhOo33QyDxRk5335iiEtK1DQjpTTBLnu794vh67YUeGr8TqUKiB6bEM17ETrF2tBQTsB/ZEVMCNc5jKzknIwX4vRmdGgUIb04hh5aOzzOZVgDbK3Oe9Z2RXdHgOtK3OZv5NHv3Pb/B4Kw7B6ZmT9RBl40WCaeicg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed11250a-a6fa-46a6-a71f-08df0115c20d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:55:07.4403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NldZDC67zGlIwKGn1ZBbyDDE9dVggMpTdWg/Fj++ctAnt3y1ggCmqz4/4eFp70cNSVScRVP+VMzeRVqYiqjePA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   32fbb9061c7aac9d3b2343d85e199cedf31e1f67
commit: 37afebc79a11bd889fe8e0a98c9ae034c3cff323 [1/1] nvme: add diag attribute group under sysfs
config: i386-randconfig-r122-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221628.h6bPNaUQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221628.h6bPNaUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 37afebc79a11 ("nvme: add diag attribute group under sysfs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221628.h6bPNaUQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/sysfs.c:357:30: sparse: sparse: symbol 'nvme_ns_diag_attr_group' was not declared. Should it be static?

vim +/nvme_ns_diag_attr_group +357 drivers/nvme/host/sysfs.c

   356	
 > 357	const struct attribute_group nvme_ns_diag_attr_group = {
   358		.name		= "diag",
   359		.attrs		= nvme_ns_diag_attrs,
   360		.is_visible	= nvme_ns_diag_attrs_are_visible,
   361	};
   362	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
