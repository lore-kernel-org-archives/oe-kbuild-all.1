Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E6523EAB0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 03:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789012138; cv=fail; b=QRvqdHskhPfvW/zDI8UBRYW9XU/Ai6F44hJLZGCSnkvfMEsUDGWdfYTfVDsNk65A1nw7dR8pzc9iCZBae8BP1gx7hPhJhZefOinp8TQDys6BSJk4LTypaNsnTo4x/MQBMy9Y70ed8x2+srR1+zudBuHHFxVXZC+7jr06tDvk9zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789012138; c=relaxed/simple;
	bh=JMsHQ67S2WzoxAbppThhiF3D7EUa3eyioZ0E9yXzU44=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZuE6PmFefFj7Yzx4TAmuumn470OQz92tktG3nn6eshjE/Kx7HlsubpKHHx4RoWSidc1fQVXjbbbtf3lTB112nVKRoJGRMXPEhCWi3V9UKZYqAXvb1/PtZ8CkHPJUUga1sTSDHAH1RWUhBOSZLv6z5zHwuKeoGZi74742u/jefUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d14/nJWs; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d14/nJWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789012137; x=1820548137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JMsHQ67S2WzoxAbppThhiF3D7EUa3eyioZ0E9yXzU44=;
  b=d14/nJWsFNB5g7fHyR5mfV4qgANshCcSeE3K0J0hhDGw9JYJ3OFTbskc
   aHjSErqnP2hqfn1jd6450+Wo4h1Jurq0xHsqHCHbEktOjfzhl1FZVnw7R
   nDE/0GyQ34NMOsxf6hF1yDgxGtURbJPOH0oevKbjpla2aRh16XrSQ/eZo
   gsfdF3d93oTuJlxQANG8eJIlMtwwhYcQL5F/x+n3i4W2L8qgc5S+2f2vM
   6Kc8s9lyNqDbj2gCdvvgmk3qscttcXjjnLuwCnnWuWcZYGTmJNpLj2O0D
   JjYKrzzJQqeKX10pnKq38OWc5R0c8/vJqR4vD9tEYe4zSi4MXD2roQ5hP
   g==;
X-CSE-ConnectionGUID: npaJTcdhQsCWSs7yDqF2Uw==
X-CSE-MsgGUID: WFlPKE3iTu6KOdeHRrkUWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="112224493"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="112224493"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 20:48:57 -0700
X-CSE-ConnectionGUID: gvGbjZUAQ5myRJQlGxbYzg==
X-CSE-MsgGUID: kNF0vFL9RLWk7rPtgGmXBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="267818386"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 20:48:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 20:48:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 20:48:56 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 20:48:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaRYbJleZZZ6gVTp/1l1Fhf1eojI2cavVTbSvIjdSWNIb+nnNWiUaJLexvLmFSZqFPsrRTLet1AWVXB7FS/fr4v6/LrfT1zXvk2C0QcjbSbx7as4dcqlsB4MR+1JEnO/Ie+afMj+KG7ZU0DHIeJ+KlWNOAGNc3KMbtmiS0wg0rcKpvuV/FwfmHnwWMc4CmzBcJQQYVK8aUzyMkNTUWiX2aXIDzFl/Wb2RWQCztzqzUvBnC2xgXuceOYAf+T6+BwckgEP7Ft8E7eb7nAjf8BKFnM6ThKxJoaXDTkfQpiKeNf30tEeMIsDlvNq/GoIYNAOQ8y0RKXj2fSkM0l3YVSLrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMiA/ZteUnCjFiBob78G+SLnEktNaUMZmCtEwMauGsE=;
 b=C8FqiQBZ1wovcPj2HufPXnMm1FnQ/ZmEAQObGpxq0HsHg4m3d9wVC/FD840/ibCW4/z80l90H+x2C2nL64bLgKoD1X3l7hXqopY2C9dPYyImH4HS8Thekpo/G/YYrVe8ogfUTfDtVTiwP2tkEgejqkyZHsZEoTOWvG34uvFLb/bt5YTHFrlDgxpifRAD3ICx815WSAVVwlMWUUaHZbpj434Re7G7SRk8tgzRJHfNJABealS97CCsY7n3JZ9yOJFCoXs2BlCGcN6fKYknFDlfDAbVuUjAsuuLmkLE0baA6EgqMb2bC4AKtqYEekr9oRvD9XCES5sHj/7fFzNC70gX7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by SJ0PR11MB4864.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 03:48:45 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0382.014; Thu, 10 Sep 2026
 03:48:45 +0000
Date: Thu, 10 Sep 2026 11:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android17-6.18-kminext 2/2] /usr/bin/ld:
 tools/testing/selftests/vfio/lib/vfio_pci_driver.o:undefined reference to
 `dsa_ops'
Message-ID: <aqIolm0w+s/yTbMS@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0032.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::20) To PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|SJ0PR11MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: a718022f-1b6e-4761-bd41-08df0eee69c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: foxYe0JQUWo85lxDeBSEABJ+OlG/cgSfSo+jiQX9TdAN1/exbA2i+0PD7IRc88tg6aTHxr4uEescZGLF0f5RnHlRx0mW/1h4ZxKYIkypDdH3gIO9gZdID8fKLPHOz3S70rTilPhpaSrZ3MxQN4/4uQI9tKhHu9WxVuxGmumy8so4yardrbX6d74HWVq+6Cz9ITj/UPbXTiJWGrB9/AB1ilRwBjweiaJQ7JlJ0Zakr9e6wS40jKQ6P9s1mHEklxCpTn9YrLdLMeULKDffGTyqRoDjyKJRd6xWCJKxDv7pqyREAW00AcVSC+4ib6uHjfTct1b8m0Z1DehiYNEwiXudNEQ6l34+ErKCJLNIs4LOKxeTU15AbcSSk3h/kIIlWn/9gxqhLFge2tkMynGJyjs1XKUfXw5f+kFtpyh0adHpRvNYyf9Q1CvkSTelnNHfmjuaoiFOHhGaOT+oTO3sypwjYRGyBCOuDWFBL+x4qK/TakDkmFD4P6diXrhpJHRYQnkuBFbqlIO9/NyvY7hcnJE1P4260O1mn72bTDhrMF/zhct54221Up1jl5lmr98lTFpbyUfxC+VOt701vJ0ClxQc8a13fMJq6KrwSdVEbdsGT+MHBrbYQ1oB5HE/gm72nq1y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EzGvssBMliQwdFGgf4CvmL1UuEsRvif9dYaDiYa9OukkY/M9jXZtHkowLTYI?=
 =?us-ascii?Q?rdHHpDddqVbWc1flX4H5WAuSRqY5YmJX7ahsiX/ptRGFA9qbYM/EPDwUrfap?=
 =?us-ascii?Q?HVH3O3OSdqD5PmrQuWSwdAh0sELtSiiRLLHitOiMIhRSmvoOKzEye0JmNpGa?=
 =?us-ascii?Q?gSQFxIA7rLgRvZGfe2LvABvHPifqzj1oPHjErCmCCpZ474k4r7Ggm+9z20E6?=
 =?us-ascii?Q?Y/GibBxDSfMd0ADHbL5bfZFKNdTtM8qFWxjvigZGYdbT7lm9ujSPWuCl4f09?=
 =?us-ascii?Q?cDedI+SDligh11eTkGQ/OHhwgPHIfGu+gSS3NkwxuzL6hDTvk3+QhTRdfvqr?=
 =?us-ascii?Q?Jydj7d3e2ZK5eLed1oxBncVcdCjYrIN3UOX+3ky+lOMEl+0yc62N+XcPvoj9?=
 =?us-ascii?Q?nnU+n31Tr0hMSwUCXUZ6z4Pf1Dy550S7lwqIxf07zV+MwyyljXN4d77D68bG?=
 =?us-ascii?Q?sCIRuK+nr9OBUVK4B1WfXp/JraeuwkPP7eu/G7ceomzdSJz5glvXf1jIRMQH?=
 =?us-ascii?Q?9pA2qE2FWHfLKw3w8fdu1kOO74q53lgGNvKRXxmEXeGLmrkLfjDiybmv5RxF?=
 =?us-ascii?Q?aZDxA8+SuLYNrvEcxTVPRZ8I5He6011bgpQ2JwDT/9gax+gVMILX40Laiyhe?=
 =?us-ascii?Q?/tlaRLKC0FT3My5DFaxixov9IU5S0n5JzOFafJPe989ljOmi+hiA4FSODlTi?=
 =?us-ascii?Q?xkwbej3vtOFKKVHBw/QIzPJ7BL9HpOcRRrBGpMW3wCCe75kmAGKu8G4BUiRQ?=
 =?us-ascii?Q?huuAHuLBoC0WAW1EB3W1cSmCacvQNGuHCwDbUBFwskSrspX+eK5ensVSa+Ud?=
 =?us-ascii?Q?nQvdsCqSnRqTW0la0hYSEwMJ6OPxpdZGIF5RwXtsoARg4G7QAhUxFQK6piIc?=
 =?us-ascii?Q?chLj9VlfOWoBGpdJ5l99V4eNkPVTJRS5eRNRs0inqGaOMeaHfpRCr4Jkpe1b?=
 =?us-ascii?Q?Y162L3yg2v+txh4a0tcEK8Jgfe6U7qRjNHY6wYCSCz5N1KkMgK3EjhLbEQ4n?=
 =?us-ascii?Q?hYaFLmKTedYkwD3lVa0Vy5k3Zr4vSqDN741jBCBLkKbrBXIVMNOY3g02hHPC?=
 =?us-ascii?Q?qK+Ide3pRuuT/xF62ojWuc252sxAz9qnnrHjSKpUPI0ppcE6GeHfVTBSoX14?=
 =?us-ascii?Q?x5RfXzOPKUFqe8U2egKF7a+3MID0gCXHmrKrboyql3/VWYXwa23MWW8OB9ju?=
 =?us-ascii?Q?QWiYipcsV4aGOF3ObrteVfe1yvOANGSqgUv27X6oBZhPaKPCQTujZGY0eYdj?=
 =?us-ascii?Q?mLGpwdG4SbBiHIFfEj67okurfd5D76Aojmfr3Cs9hAuOn3sPOg+9c7oYr4JS?=
 =?us-ascii?Q?u+UX/XrPeAbembSbtEdKaimpSbvWu7QpYHCU1eein8tfHS0K0Oii3DDa7s8b?=
 =?us-ascii?Q?xGxF44kQzIsMNmezylQQJklOMUertx5Bee8BZoYk2T87sDBlVTntrWLMySKT?=
 =?us-ascii?Q?CwvMn1UngJ7SLFH4HzMTb/BDE5hJUZ+uzznGyGZaqkUsL4oWNX/Udm2a0r1o?=
 =?us-ascii?Q?7MEePjnG6gETNzWj578KSSCrgDCqXjJmYoTvNQGpyD01XMVpk/NoYyuEnfpc?=
 =?us-ascii?Q?1jSovF3oujiHvU0zbfHsJlH0HxSFwx7Ui+VYyeLoHfiUNPTUrLSk0XXPGiLv?=
 =?us-ascii?Q?mS3XMjVkP3t2M+I9n9usTjfSl/uNm0WvhnWg3m8nD2ZKIVwvpUqUSfzN6w4e?=
 =?us-ascii?Q?/15ll4UN7rlge58VV2eQ3eI7Y4aMu+J927qApHgBMbuD/+wMGye5/DNEZcT1?=
 =?us-ascii?Q?pzCAtD8uUQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: dtaB0MLSt3p6lZSmLjB/rSrtacgvlS4KKMN0nx01rIi4B0ppe85PqHbuQQLb3k2nbi4+GfT/a8vYUwutU+/I0YkQvt21rAivCIMGmRDbcAt0EL7QMbHLAleVWJh13W6VxyYyJoGSjx0fscuh5Oan4ncut6XS1m32ME1re64byp4dOEWIVAvsHBf7TuyfkVASecCOcWCtsUBQo9zsW2KBxS+T9i+LQQ3k6ysca5FRfzwWTcRcFjU3yANDkn90PtoLTWxDZJb9jLQsKEtywsT5KUINSp4la5QYAdMwd85IeGgcds6u+lQoV5vFJxzusrJpyT6i6HB4CSXXjqVYJwXSRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a718022f-1b6e-4761-bd41-08df0eee69c1
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 03:48:45.3535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4LACrqwk/NCmS4zXRV9JVRIas2lN3+b2WrFD4VZpcsnArkcmk1PAemSJeCeS1Jr6DSY6Ul10Is91HVZgHJzBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
X-OriginatorOrg: intel.com

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   c0a35f3366299626497a612a9fdb7e01c77eb7f3
commit: 35b05bd96204bc40a2ca8620bad1a5d139c20060 [2/2] vfio: selftests: Add driver for Intel DSA
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260908/202609081524.wAHII2nm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081524.wAHII2nm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35b05bd96204 ("vfio: selftests: Add driver for Intel DSA")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609081524.wAHII2nm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: tools/testing/selftests/vfio/lib/vfio_pci_driver.o:(.data.rel+0x0): undefined reference to `dsa_ops'
   /usr/bin/ld: tools/testing/selftests/vfio/lib/vfio_pci_driver.o:(.data.rel+0x8): undefined reference to `ioat_ops'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

