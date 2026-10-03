Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3820E42902A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038689; cv=fail; b=UcF9mSgYfmuMyXJ4QHXqGJdVWVh0Fgdb2mCRlsxG2M1SyedQR42DiEzEj6Ss5PEG2HDW6Z7H6gLi1ME7TlTfyonPFWazr1ny8zoJa+urPDczxB1D63//u/eBHzz/0kjMXTr9EpROqghUcXrrn3uXneFm2FxyQtOv3cRH1eSB63k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038689; c=relaxed/simple;
	bh=p8A2TGzGskoZ0KmIxbaQE6Hqa+veIfCZm8txRhg/wWg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=tGBnC4GJIi5spLRtwrPrOYQvOFpnZRureOaXoAryFlJvEBMIHOD2K2aef0UKot82+27fvqGPpBsnx6n7FWiW42J6dzd8Sex2CTmVvNq+GpdJQgn8p+54s0acro0m4ZWnpe6P3/MPtcId4LOqkzYlaSUetIohWHhkqVvzpnwfnoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyI82Stl; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyI82Stl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038688; x=1822574688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8A2TGzGskoZ0KmIxbaQE6Hqa+veIfCZm8txRhg/wWg=;
  b=fyI82Stla21pmX2NmfFe5ScjFbgZkK7AylBCWu6ySWknMKfFxe+C9t+b
   VMq5w11LK7Ml/E/29RdjCx4x6MNqFC/a7wXvHKG+F/BUBbMwHhbhXnUcO
   NUnDOqRaUxM8JW+oT7MXiblr57qqhOQTLshFYaAmaGGJgsql797RtlWl6
   OZur16AgXm8vokOXZf1bsQvXEWtC44BUoxYtawzNulxgsJPfeqc1WPtez
   ZzNACHoZCeLpOJh5uWbQ37jUnIcrPU9xgdpwDbpLF/R4TcgCKPsE4kzSA
   NjuAtqAdlRRmDmpvjh5OwnzGqpaFh2KZRMLw6Pl/11etjybeh1FGQz5oN
   g==;
X-CSE-ConnectionGUID: BX6qGQ+4TdOgA04zYgHDIA==
X-CSE-MsgGUID: kwCqdN71S3mGYBiZqucGOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91641591"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="91641591"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:44:47 -0700
X-CSE-ConnectionGUID: LLlTTfQ1TlKTo9Zn74CB1Q==
X-CSE-MsgGUID: UIzmIIVGTaKRZaxW7Gzw8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276006889"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:44:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:44:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:44:46 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:44:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXqGeFVsjHIHVEttK/mhYwI2XQ7J/3NI4uY5Cv9PQRjPLW726yxzefjU7xWc7wbXPSNLERC/7+0Oxlt4l4EE7BDeDNE+0oF8JL8/v4IJcknxFD9/O0ScFChL6/oy60aaW4j2DTk4yqt5f7E2ZKDfBOq2Xsu8AkQnL3fGrhOJOiiE+yq9LWq6PQONECEHRXCEBzus0rA3ch/pXwv27aX6hlZkSNaGfHxL87gGHBXCGL93mgCtkHHGJQc/3qxPK58ymboxdZ4R2bRDJxugaj/bT6QXWbDMqxhrf/ePKH95ng7BnUqe/woOzvsn8Qw6oZMea8KhM5mCiPpTNsGuFu8Wxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ev0bHyWZ1jk4DF3X5BSZaCg/mXDzUP+odXx0S/pzfns=;
 b=LkVJ6dT028LI59Pyc8+E00P7ohwEJcnpZwyJrMM0aSJaDP8RtFxx2jDIjjoBjiDiErxCQJzJTk+tLc5IMDQWj5Li+Yj0ewFztBKQ8kp016oqabzxoeeldg4p82ehma2JWaFnddr2w1HxB7CzUKja0ClPZVI3cAWSBCwH+viFOUhuexaWYdyv2pvQSBmhAU5LDLM/6GS4F/D1uyyCMexm36q1yevNzV3RVjIa3Il/lDuHOLq/Y58Bj+sD232geb9YcVXrIwCtKsaR8yEmc0qWniO60yNx3kOk4rztPLI9emWwa3JqMR42z4O19SnFwKfCTf7G7VtPYidis34hBOB0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:44:02 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:44:02 +0000
Date: Sat, 3 Oct 2026 22:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Ayupov <aaupov@fb.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c:51:20:
 warning: initialization discards 'const' qualifier from pointer target type
Message-ID: <asEUrK7etR9jtb3f@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH8P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::9) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9a65fe-f5a1-4044-24db-08df215cc472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|3023799007|56012099006|260925022911599003|260925021911599003|260925021311599003|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: vvKue9mgQGEb0zjOMVgkC0Wd9EsN/f7H9ThsReo3irstm+i3uOqgPzor/i6ASKWo6yP2pl/Jc/aM0BrK+z9nW4Ktd3PVmfJPSZcgjIodwnCEkmp/1FTHZJ53pfPhsVZwJw+SThbZ/culonLOwW+6yBFQji8KW1Qmx/yaYJtWlP9f/CXOSokmYJcN7+cZOqMSW3Q0xyevg50eVeDa+ckvx6KcwZGlMXth/DApHq2pVe0KHYGXeXDm9ZIYkabgbIPKPxw6OqVzo6Ab5L/u4Fe5QgY5v9Ypaoqzz5+bjsw6FC/4ShV0aaKZt1ucS/F8ZVc78eXQkmmWS5B5epnLRKaPiStHsVgILImU7TmKvBCiZ6UY8wVG85I0fjNquk4wB8EcUiFOBtgXik7lFDEhAxKxb4wv7bRq8wIueUi/3gAd+tbmcd5BBzlLK/pGm07d+sMWevKgekvQRkcFAovXc+CSoe0GqarDEl3EeFyNInEg3mAWVhYFpIv9A2evWU6PFbDg3QVBqGkf/917i/VJ/dovUmLT0fXwCWCMZNvssQpxLgKdJTCTT5G38OPKFdbBG5bkGdSzF3z+qw4EcBAMVZYXcKc/3up3lKmzQxKPFOZbcn8KyhHDJy9pfNZRCUpKbABG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(3023799007)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eph73KDBJ7ZlAcCEvSB2wEmPmkrwDtrVjYdDy3vuGOQR6XwAk7JeEykxHGCl?=
 =?us-ascii?Q?j4zPkoEs6Akszo6Bbla0+2uGoKhC/T00m56RmG1R8kWcCQyDHhwd8XcjN7es?=
 =?us-ascii?Q?ncRD/9qy8wEtubWyQ34oQcLB4vXhQdBy2pHBkG3usNs/Pw/LLKB0w0xDLW3p?=
 =?us-ascii?Q?5oQ59AT3nthkk4SRSou8M29xiOo9vxfNCew7GTrxgoSPuofeOelu/Dp79LvD?=
 =?us-ascii?Q?3to6Lxy3KU1fBEH0N5pxOuecqdJ2I1P710C//1sgsB3AKYfDqj6fvFonrsdS?=
 =?us-ascii?Q?9o0gwRwQcB6Q2/THvXtd6u2/PYd8TM7Z0ixMmWmxFN1/L4jzH5xt7QJKhVSk?=
 =?us-ascii?Q?dMyKFIE168goET7xjkBJ5vpzbEDJCLJr7TGprcqHM7RN6nWm71FQSn5gbB4f?=
 =?us-ascii?Q?GXi7uZpSLRPsjKskGrSA48TLnT5U8JI9Bh3Z7DtBS6rNTeWyYFkjtjKUtdIU?=
 =?us-ascii?Q?3EczpTh/ZvgU8tYv2DaDzSVWRTEkPnhrZmYIkdNDmFiL9H5J4EueaPVM8TOs?=
 =?us-ascii?Q?1+B6Dagv4ft9XQxupxjEmNnzH1AAL0qwwVBMYqP/aMxnwVM7/eFC1Q1g388I?=
 =?us-ascii?Q?V+CRE3mPr5AV1z0RHTQE7NirSycLoEdNpqpABZD30bQYkIVSP5IzA72PC70b?=
 =?us-ascii?Q?pEf/nik6Q1dCJGS49W0Bty1CIJRaKNJiciKJcei2ZbwfK+Wdw/UnJZ1tyKoz?=
 =?us-ascii?Q?KJ2eWdHg4t3oITNadx56rxjioSAKNmvD18bnvitFCQb99rRFDENyK9Hvfd/u?=
 =?us-ascii?Q?bPneUPJfSUfg/STGWS5QUg3TfbojYHp/YMrMHErikg4wGtIyP8Un2rBKhiud?=
 =?us-ascii?Q?If/Qp6k86D2gFZzzl6niFByCeEuxpzyQUeHLpuy40JzZ70zR+LzffV+Bc7Kj?=
 =?us-ascii?Q?eLO8k+7btJVwQLT8/tHbm8slfOQ45AU6DIsNIAhD+TMYcf92se73OlcUPGzo?=
 =?us-ascii?Q?Eay0oblxyhsousB1/rZ3pK0P2RCzWLlO11FU2rCDUUevGgZ1InBeCoTDf7tL?=
 =?us-ascii?Q?VrOTG3QGvR+0y3HP+jJUz3GiysDTa5tX2Hq3yuCrHBbeFnCJo2R6gRdQONvX?=
 =?us-ascii?Q?w7561r/Q4WCbM9ljGi9hBQowsO9m0NEpawPQjbYv9ZraAuuVWpW1wX+hqzSY?=
 =?us-ascii?Q?qx1WTuIfcqUCbmGNaiVGiuN3+ZS6irZO5Zr3c8BLT+4o6souugQEdm4ZV2ZJ?=
 =?us-ascii?Q?N5s38mMA5FMDP9wmrJLjO9NQdz2EVx3vEDWRnNDEbnpXiDnMZw3zb9DdJf+c?=
 =?us-ascii?Q?maYxpcKfgdB4Zm4w5PjHx/ogIZ9QHGYIpr4yko5Xdyc7VrvA2Br2+Stk/Rst?=
 =?us-ascii?Q?q32t/RXd6gyUsqbXxm3sjj7nr87HYQ1i34kukEBaPFZluwhKydCGDUKevbAp?=
 =?us-ascii?Q?Ut5Kpb2IbQyQf6XQY/wWOG8zYrL+EAvO+R3cOSw63AZa6kfWf9kkssH6ZpOC?=
 =?us-ascii?Q?a27GvGnHAg1JkaNIpJs81YNy43J+RGiFBFdJoixyl47e1y/gY791w/rcwTTm?=
 =?us-ascii?Q?X+HrCqQmWoI1w4K3CsQgadt8VHP8TZLMOAmP1Xur0F+yGgID38gp1fYDR9Lw?=
 =?us-ascii?Q?LjO9Aa5Ie3cMOy3Jza0sxQkRIxwIPKkHG/PtBNT4tJZhp4nYQEkjtIejDMRd?=
 =?us-ascii?Q?2uQHqiN7U3gqm9B+dt+H8QoBG3/SVB80SJfLSzR4rJ3v7pSiS6xVDGyhQq/B?=
 =?us-ascii?Q?6qnkwQTBt3UXjFAaK/kARwuWSmHx7vj1d1TxXwoQXY+TtXvTdv9rwU3tvXsQ?=
 =?us-ascii?Q?NCVnDSjCTA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Ey2dVTteHqR3nCNL2tSp78I4FvJM80F0rxAfVyZw7QMzkDq6rlXdmmPt84RXs+AXExVnOWsqBQw9oMycDG9MHy5HVXHWNeqDneA9QpZa1Q31wlssibr53Eqz8wW6rQ6w0pIHxJiRHjqGvAMd9ZPZWJ0JuF/b4uJig5vTQVXnoY6drZbQ76L79aXdSVoLWJs6d9+Fz1GVN+dHAaYLElbUIIOxA50H9oxzFU5JURhAoj1KBD/oOY2QanbFV96eyxO296WR1/aQlVV6OZbtojsDa5pZKa/zil1KkqVFAOd/CbhFQpbe3N3c/ccvGD6xR6J1mxHhFAyEhI8/L1g0MoI7tQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9a65fe-f5a1-4044-24db-08df215cc472
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:44:02.7308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CYP6D0Icov++EzG4jd4wcXIyBknDq6n2uY+uHyuww4qR/xLh9iIsSnvhmtvB0Enq3QeAh0mcR+tjVb/916COg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Amir-Ayupov/coresight-Add-pmu_pulse-extout_pulse/20260930-233744
head:   2906079546bf3a56f4104268fc0912c780570e93
commit: 2906079546bf3a56f4104268fc0912c780570e93 coresight: Add pmu_pulse/extout_pulse
config: arm64-randconfig-1002-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020947.8oXLgX2C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020947.8oXLgX2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610020947.8oXLgX2C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c:51:20: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     .feat_ref_names = pmu_pulse_ref_names,
                       ^~~~~~~~~~~~~~~~~~~


vim +/const +51 drivers/hwtracing/coresight/coresight-cfg-pmu-pulse.c

2906079546bf3a Amir Ayupov 2026-09-30  45  
2906079546bf3a Amir Ayupov 2026-09-30  46  struct cscfg_config_desc pmu_pulse_etm4x = {
2906079546bf3a Amir Ayupov 2026-09-30  47  	.name = "pmu_pulse",
2906079546bf3a Amir Ayupov 2026-09-30  48  	.description = "Pulse ETM external output 1 on every traced cycle for the PMU\n"
2906079546bf3a Amir Ayupov 2026-09-30  49  	"to count as TRCEXTOUT1\n",
2906079546bf3a Amir Ayupov 2026-09-30  50  	.nr_feat_refs = ARRAY_SIZE(pmu_pulse_ref_names),
2906079546bf3a Amir Ayupov 2026-09-30 @51  	.feat_ref_names = pmu_pulse_ref_names,
2906079546bf3a Amir Ayupov 2026-09-30  52  };
2906079546bf3a Amir Ayupov 2026-09-30  53  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

