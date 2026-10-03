Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589CC30ACEE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038296; cv=fail; b=r0iKBHOVAhnZLNhnzmTCWWj0cNA8DEtcbCD6baGZ0X81sk3z7zcD2sVzn9vyMb8BJM60HnMT6sVRBIC3jT/N2zMbtVYf21zBS2TnWnYZluulckzzujqDn+Txp1K8fIMs8ddOaD5nrYDbpLa6Zucofh2/bnUgPQcry16T3lnRm+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038296; c=relaxed/simple;
	bh=AsluRh7gyIBKg8vdVMSkFrzNE5yyQRVlMXXPHB0NCt8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=D95v9RlU1BfG5eEnIJclazTWZLFo34gaxik9MxAKVnGHmx84elnnGkkxQ9eXv8kDgE8ORZDpht76QL0D3WBvpDpXTjI+qRhaoD8jedA0AGC9Si6ihozaf1If+WT6cCezUAtaurJY8AcZBxmcZvXt63hUhi5wL1voELF4rox0SpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/i0nC1b; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/i0nC1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038294; x=1822574294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AsluRh7gyIBKg8vdVMSkFrzNE5yyQRVlMXXPHB0NCt8=;
  b=l/i0nC1bYDdcc1z/LOcHE95yoGDUTosivAjDkoDt/pSvNtSIIXxfjTIr
   D1PFCQhStKYqeaUAV2Ex7i9zz9aoFR3W4nvV3iZUZ+poeU9OrwexxJjcE
   Tz30TXowsezgx05IMc/kHtktkeVy6IbmG+3QV4Xe3gBbVatiM07BLtU6N
   eRs5K8ZCi4EoHB2gshEFZ+fDYUzf+d6njmjLZrgZV/G/nhSiBXExhD+qr
   DbjI9hxKv7m/cX/e68MhWZmNY5mi4E9Xq7nfNJyteiYTW2R6mcK/EKz2Q
   7xojwrKIwhCXWOq1mV4adRrvvycYBO2OzChf284qQ5WJQ9q1H1jU7AaPB
   A==;
X-CSE-ConnectionGUID: tfsMYxhDTImgncenxGhM9w==
X-CSE-MsgGUID: jLl+T3NqQuOIapW+RYVgsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="79336548"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="79336548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:38:13 -0700
X-CSE-ConnectionGUID: WMmmT/L/TjebTIuHLlGosQ==
X-CSE-MsgGUID: tv33mZwrShORVd26/sZrOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276530620"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:38:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:38:12 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:38:12 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:38:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AseQyCto71Cw7P9EEKFSeFByM3sCFrGiK+qwmU18XjZ0uOdS20/gIXfiskUYm4w0QkR9iwFtudOkB5gVa8018Xh3+n9ElKpfknjEZ0o5HklBL6McZ3CR+c3edymCnyEVM/3s6m8OXlOZ0eyxzr73lVsAdHqX4vNs6Uz8ZhCOa+tYx7GXrep1G3E4igH+2FPQ7RfWf6hhaTIUedU2rnbkCwMbVnZ8+9OiCylv0GcSLkP7laNt6Mtqk6w6eoKa3/PvDF6e6Jor/zsvhfEKJF/uNmJzwRjRMIHhtuyNEqCM8hv69kUvn0Dashskx5ApDPOi1Aadivs4fchHduN2Lfcqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw+qrjx7sdK5HqFh61BLKjfSON7k9ypwIWoQBewZDsA=;
 b=R03zmHGBaeCXIO/pSEsCzFcHXL3ykP5UXQoke3XfIiVISy3BYHw4VUihufskUVzX9opM1rKS18zUNdAKVcOv9KGEkh1hP+NP55jD6xn4fwYhOEfAERmL+0STxwJ0ZMdKUa4YODYvJrbDnJTXU0A7534k51Akz2caxz/WXnQvTTz25LFXZwzAEgk9hTCllciTKBsB1XoTphAd1YwqWoNY88pUu1QbL05cwF7y6I8f/6EGpHC4Zy82d97ZeAyRlaivjVbkyCQnBCgyHAwlqNPAQ8+QMjQ4cvC3d9XF4zdU13Wvg66i9aBzEP2QnZHJe7vBBDBv5PD+b+b1IapzVfMBLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Sat, 3 Oct
 2026 14:38:05 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:38:05 +0000
Date: Sat, 3 Oct 2026 22:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/iommu/generic_pt/shrinker.c:117:undefined reference to
 `iommu_put_pages_list'
Message-ID: <asETRja9vF5q0hn5@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a007c8b-f279-4eb6-3fdb-08df215bef7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: L2ladgFKCOpAjo5Q5qofy736M4TjLHRAYPR+qIWlS9ICkSMEsobzObHMwt1Mhf96l8Tbu+BDjzALGkEfIFYzcrdjpEHFnmzLcZKT1EM22mRFaBcvou6ehQGsGil+43w6lLBlESw/XUZkQVKYw1sYX3axhA5nOydX7a0IUYCLgjjyGI58A20DaSQrRzZX25nGVdaLsCCDPTNVt4RtyS9mPmnPuEEfwqzzH9kZkPzgCTEHeX3svK+AVbSyAnBxBUT1M5Fbs2POuq37bnGHVzkHsX9QxrAuJH3A8p9MxN165JdjIaYUrmPTEXpYZpZjt1cFxp0xTqKA0UYO+cEN6IZSBnj+xPAs+ymCgdEGjHvuRTqFbfJmrMm/j/diOnleodMDp/KY58Eoy+Ti6hVpZhKxCzaifkijFJ9/TjXJDW7I7meycf5eYkFW3SWstsdfNBZoB+Cupp0V5WN/a83udEQEh5DqyY4q4T7f5Uk/P4rwd3K7SFip1YbE+U58K2YaYFf1g5WCSJGXu6lmLbNijueQF4L8bzmrULvpyeTe9zI7138qKx5pW3kDfPYXbu2lUsRgio7Ae9ppM33bYrBe8j6WTEL8GXZB/HpsjzD/NODAF525tty2/Qthga6pmCAc8TdO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fCCmHcqckO7yps7lXIhFpgJ6UqJVgGHdAsF1DvztdWewYfV+7pKn1Bgr/jT6?=
 =?us-ascii?Q?zeez3VL4vHSmvE0TLvBWIGOkz79nTx8NEAouXeunThLugQddJhye4AnrMCDs?=
 =?us-ascii?Q?rRFF5mY6Vj5ZqXPdE7Okh931wO39ECwTgMz1qoYAJClrw6IZ9u6D0eJ1owT9?=
 =?us-ascii?Q?ZYExyRGfGopu9sE3qFMcTMUQYbgfjedO1bSEgVXj5uZfj8xHMEfcWSxEL9oy?=
 =?us-ascii?Q?BrWTdJZgORRf3Xnb2X+iaJKvs09URF0eNk227tnRn8lhujucpucp79j8QtKE?=
 =?us-ascii?Q?QpwNKpB0HyhwpsiWfy6Va9uaHBqnOaeEKIAQAul32Wqc3PODerXFhilRiBwH?=
 =?us-ascii?Q?frpV+xTSMito2MrtbWiaHw6xPbgutKY9A3BTfo/vAFTO+NiPJlXkUI9twqaT?=
 =?us-ascii?Q?tlBLP0bprdbF2aYjyUmP1XEEVPK1yX74KgCl48pprORG7U0plY3SlKeoHS91?=
 =?us-ascii?Q?VMUxfF4upU/Pj5CzF0gfvnExmZI4L/GZoK/aSc3ulPZSESjXx5istsRwrTdr?=
 =?us-ascii?Q?mbehusx/YD4x5sX6NaKBcURGFyhI93JsvpkbPfx84AngKPAtzB3pLCzI1AWb?=
 =?us-ascii?Q?JXOYGD8uDRdk/rclgJE6UtAf07CWDsf2S8VO9gp14eXBaDIA723hJVo1nUBz?=
 =?us-ascii?Q?tGm7srJCo3BPUtUKobZ1Rvck+s4MTngDx+3CP+wLSrX6Wdv1P+jZk6tjtDZy?=
 =?us-ascii?Q?b+2xd3bIEJGeqwCrz8PY6dpFhu/5UcVGyGLSZKuNpqwg5F4DpDl7NMmnHRWJ?=
 =?us-ascii?Q?zMDb/FkodhNuCwH0YouS1RkmWqD8ZYG3b976xUAFjAG3AYoAhxfGQ5KoXt8L?=
 =?us-ascii?Q?nnzog242H8D0/dwqLo+YrarCgGb+Ay7VPhQRlCDPHbOXQfIBOm465Tpb5VeA?=
 =?us-ascii?Q?rGTTVTO2QPQcb2Hl9hu1IwAbv1cmmnQRbw2dp17dO0/qUHkQEACvfraz1Zx4?=
 =?us-ascii?Q?styiWmjbHVpN+kvAW02DyCjeESXWxaskvNYsa2sa3xKeMT2JBr5XxEiCLsIr?=
 =?us-ascii?Q?Soa2lcbNL7E+eq4zk/0UPK5Uk9d8oOklA9KqeCutCZMxvChYBDN/NdjMRba3?=
 =?us-ascii?Q?14/zjSeuktU458AUv/lDrm7wVfbOXZ6hv0HiLztXsJv2EGE/Q3zW8LV3P32j?=
 =?us-ascii?Q?zx1/h0fRmgYCB7Pzl89ugAtqyC2hmS4TnqBFC0D8wwcIm+STrPgRPa49Y5DA?=
 =?us-ascii?Q?F2Vjd25oduoGRUXopVHkQoIkTFP2PyNTuAg3a8bN6kOtCahSRWaIRVuSDpxK?=
 =?us-ascii?Q?yqMSDp9Vv+LEqjsp1i1sy9i9Y7CuE2xpZbpa+W0WpIljJtr86Va0IZH59BbY?=
 =?us-ascii?Q?D7tEK5zryUXmHCjbPXtABYw06EIbbXvMACXAd2JO3jKR4oUVbEJ63jp5DUEd?=
 =?us-ascii?Q?rW0iemGzE7Pb1TCLCdAabfnlseUNjmINgN/cjv3jA+7jW4NC/cETbd4S+QGa?=
 =?us-ascii?Q?Nujgoczs1M2Yj2BO5TYW04vEaJ7IxrjEnDql2/xFxXNm5KJKamJuybwurpbj?=
 =?us-ascii?Q?IzadsfsWOsxB6QofKNHKwkvIFYvaOeHbIAArvBHinZWoTDVZKRk0DA7//J9c?=
 =?us-ascii?Q?uPn5REkkfMsoxJr6zEHpRdPlBH6aT8n61apWQtVp7N/qGk9lJlIl5DyarrNN?=
 =?us-ascii?Q?4geAGUdjHQCpaxk4bmn0BUSOtMQRL8dBevHN+Oq55jXkTDUbArjZ4yXi4w3L?=
 =?us-ascii?Q?bahUu27A42TRNDK4EM64aj9tSDxIv0W4zNrllb+x4I3FXxzhv9p95kcPgBHt?=
 =?us-ascii?Q?mfUE1Q/Y5g=3D=3D?=
X-Exchange-RoutingPolicyChecked: bX+06kNfTn+jYePui0wsFqH24mku3VUXfVOmiCPbyTax4B7ldlIoUkDZTFA1rClDuc6P7B5zJW0sVArRkh0Ercqg/0yUBJdrGXCTu77slNDWTnpMKIUj4eqDNpvyC4ybkUgCwFhYY9/hviLAkerKWcqTVvgHdCFVISStePJRq8HrSfeAQeLzJSz5gLPhYNDo3Vy8wI8jB8vf7SCygSPfIf65ixLL0nTbivT0vmSdIcOBQ1sFbM55r+N58b0N6q/XeZ5jIs6jdrjl7SYUSG1bm/iOGSq8fvI/PxqjW8DKZ6P+t+8BvD/Wwc1eSI9mpGuOwkelftwartcDr8a42dLGig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a007c8b-f279-4eb6-3fdb-08df215bef7f
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:38:05.4535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4zFDDOjklBQPcIxAYFWSIl5xRxyQqxpyWrfPkhbH078BJELf9FMIeqfnqN3SrG8SDr8hRrBvNsNkTbUFNIzDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/iommu-Add-reclaim_list-xarray-to-struct-iommu_domain/20261001-230215
head:   27fca47089358dfe3840aa0b0c9795b3963c21b9
commit: 500ec14f96dbb4ca3ad2c39349b778c8a25fe0b7 iommupt: Introduce lockless page table shrinker
config: x86_64-buildonly-randconfig-1005-20261002 (https://download.01.org/0day-ci/archive/20261003/202610030757.zvLnZqhW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030757.zvLnZqhW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030757.zvLnZqhW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `generic_pt_shrinker_scan':
>> drivers/iommu/generic_pt/shrinker.c:117:(.text+0xc394f1): undefined reference to `iommu_put_pages_list'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]


vim +117 drivers/iommu/generic_pt/shrinker.c

500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   56  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   57  static unsigned long generic_pt_shrinker_scan(struct shrinker *shrink,
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   58  					      struct shrink_control *sc)
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   59  {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   60  	struct iommu_pages_list free_list = IOMMU_PAGES_LIST_INIT(free_list);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   61  	struct pt_iommu *iommu;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   62  	struct ioptdesc *ioptdesc;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   63  	unsigned long iova;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   64  	unsigned long freed_count = 0;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   65  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   66  	mutex_lock(&generic_pt_domains_list_lock);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   67  	list_for_each_entry(iommu, &generic_pt_domains_list, shrinker_list) {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   68  		struct iommu_domain *domain = &iommu->domain;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   69  		unsigned long prev_freed = freed_count;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   70  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   71  		xa_for_each(&domain->reclaim_list, iova, ioptdesc) {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   72  			if (freed_count >= sc->nr_to_scan)
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   73  				break;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   74  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   75  			if (atomic_cmpxchg(&ioptdesc->__page_refcount, 1, 0) == 1) {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   76  				void *virt = folio_address(ioptdesc_folio(ioptdesc));
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   77  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   78  				if (iommu->ops->sever_branch(iommu, iova, virt_to_phys(virt))) {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   79  					/* Successfully severed, queue for freeing */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   80  					xa_erase(&domain->reclaim_list, iova);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   81  					iommu_pages_list_add(&free_list, virt);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   82  					freed_count++;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   83  				} else {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   84  					/* We raced with map, abort pruning */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   85  					xa_erase(&domain->reclaim_list, iova);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   86  				}
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   87  			} else {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   88  				/* Not empty anymore, remove from list */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   89  				xa_erase(&domain->reclaim_list, iova);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   90  			}
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   91  		}
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   92  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   93  		/*
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   94  		 * The IOMMU may still cache pointers to the severed tables in its
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   95  		 * paging-structure caches, flush them before the tables are freed.
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   96  		 */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   97  		if (freed_count != prev_freed)
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   98  			iommu_flush_iotlb_all(domain);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01   99  	}
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  100  	mutex_unlock(&generic_pt_domains_list_lock);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  101  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  102  	/* If we didn't sever anything, just return */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  103  	if (list_empty(&free_list.pages))
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  104  		return freed_count;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  105  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  106  	/* Wait ONE time for the entire system */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  107  	synchronize_srcu(&generic_pt_srcu);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  108  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  109  	/* Free pages from all domains */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  110  	struct page *page, *next;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  111  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  112  	list_for_each_entry_safe(page, next, &free_list.pages, lru) {
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  113  		/* We must restore the refcount to 1 before freeing */
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  114  		set_page_count(page, 1);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  115  	}
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  116  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01 @117  	iommu_put_pages_list(&free_list);
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  118  
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  119  	return freed_count;
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  120  }
500ec14f96dbb4 Pranjal Shrivastava 2026-10-01  121  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

