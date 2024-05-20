Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0AD6AB8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 02:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716172527; cv=fail; b=ixRFWbt9rpYoMME7ztSUD5Ss0bcZSCr5RjgccheKs2+5Eqj0XzrvQrK+a042+vY38vyeNaGoB/8s2e50GdV6bXuMDnd6OImdoWYRfU+o2CBGWq8XIeDdKdkrIBWmfT3TLZq5pWLij7ya2P0mPdOoZ/l7VFXJgcHDv/Z3X9udY/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716172527; c=relaxed/simple;
	bh=2W2D0u4NpDTEm6sLSOfzxpiANxMjSjZTIgsUYLqwV3g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=M9gPSSm/8n8H8gPYlRiImg1qdjAF2FcLR3I4gHkrbW6BeDHcw3ItGvTDglh8YutrpGyjd+4vN0LHrdpW1UV2cMJlkys5judaPbohNTWeB+DUkHxg4L4Y1vdJxSWn2cssUIfltOhAfEoIfTSpi3aj/6wEQC1DLuJu2NrGjhn7dvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/w5anBU; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/w5anBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716172525; x=1747708525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2W2D0u4NpDTEm6sLSOfzxpiANxMjSjZTIgsUYLqwV3g=;
  b=Y/w5anBUqSsMTn38oy1jzPDZ3Lia2MiMxSIMLlAeb07VY92yFZZsnOPX
   SXeDK5rk7+jnPAMyi97eZOmpBKyjklWiphaoz9eKgCzPFCtw2A5RINqkp
   7ArubBUHjg0UHjayWT/zi45ZCoBWVANOvYHZd5JnKNknzABBdC8AjZmg7
   L0DKI8cl+VaDrFsjoZ6II2HH3iS/oK3b2m8aZIUZPUybPzNg40CRQrqfb
   lyFpR0wF5VnuYu7PtOag1v9w6sn2CdNmu0cwstaYyL21381bp84NjV87H
   BvwICxslqiyqoobJFJQrvkmBYt+wfm4lYo9+9HCjReRvZDjDEQ3fUfJWP
   w==;
X-CSE-ConnectionGUID: B4B5VsszSvCt4e6gXcdBoQ==
X-CSE-MsgGUID: WZ8Ur5gwTZCy5zrXR3Fw1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="29792988"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="29792988"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 19:35:24 -0700
X-CSE-ConnectionGUID: t0+31c4WQUiKLOtq1KO2TQ==
X-CSE-MsgGUID: 51WOf0rVTLC4x4dawC7G/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="36797296"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 May 2024 19:35:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 19 May 2024 19:35:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 19 May 2024 19:35:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 19 May 2024 19:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ1DIjLODbHfQKJ0beyMZJzXg6vwugqPXEEBiB1gklhM8fIqcMz5J4PHbRedGHH7iMlM+dxFFH9BVW0/LtenQWpcnflCBI9pO/SxSlhBX1POJ/m5yw/6QQy5I2ELkQ8Gkm39qHHwoawsyND0KUjIFB8DsAEowIrSbT2hbQxwJO9xg0O1Ht1FhO67Sv8DZF7pPWA+S23jcmJBo0Pd754j5oA42/aPSMRU2h9NNTl9/4Zar3UBAqw7LmfkckuqY7C6jJ4pnYwEhzvG6vQSi7ZRKcuS0ZjsralP3r8s+5cLXfl4DRNLKIC0fUeI3uxKssAax07k/NUcLyopRlWh7tU/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plJxNfjFG7+RQbaEtFf5ra3lwziPKrsF54wOJJ5cXHc=;
 b=lqnBLL0TVEJbU1aepK64Dxx0QR9Y6Hoyo3RgR6wwV6s6jY+Y1R7556gcEQdeBwNJq81ceftQnA749h9eYcPGSTgOp1YsJOxiy0lgzfjyaZ7Qs5f5Fww9kqLZZjb1kE1lYLEs/rnlCIx6U9hI94r+R61xpT1sU/Ars9VIwC6uYtN2Pe5RPYFBFuNthcd3StD4CJNkfS/WQhZoF7c9ezDMgZav+P+1Mx+6UxksPVRGNLn/MpxB0KRWLgQd3b0rlePEQe/MX2PeMI1ZuPPpsUMmMZ0h8oCJfwRbOEMMGv8I775Tj92c1k8I3C7JsVEQtBbJsUEquhXyEi55ua+DchO0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 02:35:22 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 02:35:21 +0000
Date: Mon, 20 May 2024 10:35:22 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Rick Edgecombe
	<rick.p.edgecombe@intel.com>, Maxim Levitsky <mlevitsk@redhat.com>, "Reinette
 Chatre" <reinette.chatre@intel.com>
Subject: [intel-tdx:tdx_kvm_dev-2024-05-14-mmu-prep-1 22/115]
 x86_64/apic_bus_clock_test.c:23:9: warning: '_GNU_SOURCE' macro redefined
Message-ID: <202405181535.WFKy4EwQ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:820:f::13) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 65fa80b3-0756-4711-6c9d-08dc78757f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VuqwJanw6qdq0MP1tNx6LdnQRqaldK0nhTOMByxkyWi4qAojvMUelGgaDCK6?=
 =?us-ascii?Q?4ktcsyPjKfBzWUoBcSCmajL3OzHFoxsrU2PlzxCcW8tIW63c5ynFpk6n2CRm?=
 =?us-ascii?Q?Jk0KzyrRslV3MWx29LnOw6ZL3kw7zv5aoS46LxF2PPI1U10JsM+n7FhGf2W7?=
 =?us-ascii?Q?2/zz9vcWw9VFDnTp1wl+BSxYAwcdSBDn1Y6pXiZ397ZKd2DpgeqG0P8qnr8S?=
 =?us-ascii?Q?mGO7NTODRyStreOk7P/uVnz50taaCIEsXb6AuPv3LlcE3CIkBc1QLzD9efRD?=
 =?us-ascii?Q?5S5qQpzi4ef6ye4NYr86QxxcteC7Ucy4sH7BsfFwRXGuEJntjBqLGGFeLoTj?=
 =?us-ascii?Q?JRmY9rfzV+eVjDTjJPn+uE6Z0baqD0G726ksDWPrZs14Dg8yZd/pi9v9fKNT?=
 =?us-ascii?Q?lEm0hfsqs3ynK32+I6BKZhsRnM8A4SNZAb5lRHU1BzCNPXsZygIdnyLbvoCV?=
 =?us-ascii?Q?d3JA33VUT0pHK1DfQw7SMVewBN8Y1pvkaAsMfqLMULRPSH87O3J7NwSRTRcj?=
 =?us-ascii?Q?+rOKfoQsmadPCiLOJezaHBs9bPR1b9icMeiCNRecK6cGaFXH+cwpdNja1vju?=
 =?us-ascii?Q?4yl+y5ykE2Znj/5UVdY9EaTUH18UPSethElJl6WERsTNo68BXoimbZtpqkzY?=
 =?us-ascii?Q?SOd0RCwVWtnOOlh9GauhSJ1etwJA+J+fCagtEZtPD1kCRRvwjOocOxcLsYOw?=
 =?us-ascii?Q?NsCLWPyQkZZXhqdwbCmeKpL+eas1LhKQTDlWyv9aRFouzc4etBY0G16R5uvd?=
 =?us-ascii?Q?xu4kbvcuUwwo3Krkf2ORXBc6taDTxrnA8kn/xjntVCoi9UiJM4EgcumxOzk0?=
 =?us-ascii?Q?zkZI3/Ng3btA62dl+OTaJ6TGrp/rX0F62xY7FFWwM98kYgWIkvO41Adt3fgj?=
 =?us-ascii?Q?q7UBFNuXMjxlofoUFXDa+f/QayCYH9v8kAUkCOvj38606IZezVLS/oe1oU31?=
 =?us-ascii?Q?3WK9hy98Ik+pIDNAqEbMn6A80s4fNB+2hAi5clG9GXxj4+b1yD2MTQ3wPmrB?=
 =?us-ascii?Q?HBn3NFgpowiTWBAbW8X1vK9QfTMn2u4n4b/ZOT+VPE4rnuGD++PMxpBOEQZR?=
 =?us-ascii?Q?erLm/NfypFb2CNmPCzZDkQycAVLrpvvDZFpfxP8i5QfJAlpdqp6dWIUH+Cwo?=
 =?us-ascii?Q?KL2X9ZRuxRU5lY16eIt7PWGmBO4O9Eg29Eb1NyqBgIntKj/ILZlBbTR0qhPa?=
 =?us-ascii?Q?ZLgsegn5f5komE8EjBn/uBS6I4pUzGmf6eXAAAWsWkJYsmpnQo9lprqdBwg?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j7ugV0rETkg42qfdD2Fv6zWMOXo7Y7OqJq2wj8xp6GZv3g/HFtyD+8/KA2nx?=
 =?us-ascii?Q?A3IsTRVCPJXnW7BlEgWBNoor/ZJe0Xm5YvoycXmkDuSPIjtYoTh118/YPInG?=
 =?us-ascii?Q?86Z0a+2Lk8ogOYOIGBPI9dujegVu0/KRrR8nGJuu5UwK4+QIRiVNx+VVgoO8?=
 =?us-ascii?Q?PbO/pfMUAZywg1CFD6WPR4VwG233lUkKoOn+P/PQoNpbpPRgGq9C272BfSXj?=
 =?us-ascii?Q?X3Dcmq+uV9Qkoo+KeHTe9OYO6jdUJ1DTa0sOiltJn2W9zoi6/SFIJ36juqTT?=
 =?us-ascii?Q?BiZPyqNI9DgpYUJeH2DFD2Ao1WHUikva/AIbOxvWkpSOXT78jONHT0hOg/z8?=
 =?us-ascii?Q?IinxrMH6FuINlIYWBKLDaUxzgLlt3qc7pUYSf82ZFjOpNRBVdFG5xxLTK4fq?=
 =?us-ascii?Q?juCoNCzjklHyi1yCDJ/PQSq4SXLKSHxAGgHbWd5He8gfhQDkc03Ueat7sd26?=
 =?us-ascii?Q?q4bZ0Nt7KkpwWMpOscsYNU+HR+c/AFDrIcECzC0dYAXs7L4oPIU0I2ULsVh/?=
 =?us-ascii?Q?CPgqGZ5JjcMTIXpM4q4sHy1WPvEVRmV9eJr/sZ+8dqNbypvmrYTZgPsc6wMs?=
 =?us-ascii?Q?JuUWoMYXUgSyWir+GEgHbRPv903/RsZmCvUGWfL+IeLk4ErqYFktbcSj56KL?=
 =?us-ascii?Q?dcQvoAB6BYag/iveQsBaRXPOPIBqxMTgo7QQ5b3R6eNNrZ0q8+JIiH2fIkkd?=
 =?us-ascii?Q?tWysQXhFr0aozui+cW5XCEq4ZtiRNvuL0eJV3Msjy2WvYV4bbaqvh9lvt78d?=
 =?us-ascii?Q?RZy2v9kamRvMSIXHCnownYD1zt/gMmWSPHrzjYGsmSsXBtmI41pl7wXh4l+P?=
 =?us-ascii?Q?BrV1H5mEiqOApoDJjIcLb9l/z/Udl+zIklee4dalSg1xm3WTbTDblaIkva8/?=
 =?us-ascii?Q?m8kYCVJ0RpfPW2lP5cwoHWgnmxyggbBMUfM4qGEuATswJ5i+NUlrAfVuNE/y?=
 =?us-ascii?Q?Gy9nvg54mQ8iwa1hPdflLGJuEhOWgrlRvS/5IGe/rHVrLPUp2y7UeGtxi/Pp?=
 =?us-ascii?Q?liObfEJ4F+NZ0tjtuufLxy7uFHBVYUMs293SDCbL9czXoxPCWJSgl3cvJOr1?=
 =?us-ascii?Q?EPosZ4HZBl47Yj5Y7X22xC47BdQLYUja8sd0uF/fhamNhfZi7hz9/rXQoGCV?=
 =?us-ascii?Q?lEuOI//kkaTpU+aTy1a0+8MXiu8bVdGs6tLDALdrjtEUd3Zlrz9bYbZ34oCY?=
 =?us-ascii?Q?o0OtGxZLq7U9nzKK6rkju85j95Ju+dfaFambJx6P8RFUfS9rBM80gW1raXoX?=
 =?us-ascii?Q?4hzHTMFysfly6zlNMpPhPXZU8Cm0OFOuKl+IqWuxAfVOz/4D6kBHKFjVkwSG?=
 =?us-ascii?Q?fqj+dRbovsAlWIjvYDo9VrQ9uvRx8n4ETtPgZO9sF57kOOUdQxPJz7GKfQ/7?=
 =?us-ascii?Q?UgU/8lr0/ICWSDYy3EgL/INn3mMPuw2OW5CPlxTrbOUuKMceh5kN39Uhne0O?=
 =?us-ascii?Q?kd1afxrKumzya7AvzZh9btDQsrHlkoye/+MmdmBzezQrV6ajaEsxriGoLs4U?=
 =?us-ascii?Q?RgQS8T9b9ZQXxZL7yibWNsfX5YkUOLpuDdJeSJi+kxLYXMpYfglBJdET/3Ex?=
 =?us-ascii?Q?ulVJcJoemPoXkyHXuEQ9AxgJerDYiaocrO/wMGyG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fa80b3-0756-4711-6c9d-08dc78757f15
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 02:35:21.9355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJH5g9UuKZCgj7VkosfhjnV0z5t9yVOPjNtKTEGLN/iyovcqe0wuIaUOWtHEeIdC04G50+Y1ILPQEw4qsz/yhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
X-OriginatorOrg: intel.com

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2024-05-14-mmu-prep-1
head:   076b4da9ea74a0b778ae01a05c3a36b8d8e1fda3
commit: 6ca346be0a271c01e0b0847cb9ed4ca90aecffac [22/115] KVM: selftests: Add test for configure of x86 APIC bus frequency
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce: linux/tools/testing/selftests/kvm$ make LLVM=1

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405181535.WFKy4EwQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> x86_64/apic_bus_clock_test.c:23:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      23 | #define _GNU_SOURCE /* for program_invocation_short_name */
         |         ^
   <command line>:2:9: note: previous definition is here
       2 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.


vim +/_GNU_SOURCE +23 tools/testing/selftests/kvm/x86_64/apic_bus_clock_test.c

6ca346be0a271c Isaku Yamahata 2024-05-06 @23  #define _GNU_SOURCE /* for program_invocation_short_name */
6ca346be0a271c Isaku Yamahata 2024-05-06  24  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

