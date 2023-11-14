Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FFA79CC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 01:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dzmt2W0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699926097; x=1731462097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rFYAWvRQLbjc1zstnRuzqUga9Y2sdOiPt+ayHBw0ynE=;
  b=Dzmt2W0yheE9yjaIgnTL1YHX08Or+DuSeQhha0K9wDdu32J/L7R2o26c
   OEy7HIMIxCjG86JCgdpXtJNobbZp9UYjzFbQkmpz3iU+EtQ/xXhHn8XRa
   w+lN1COs5B7G0+kOlmSeBy4Oti8rMzkSr1WRAsvp7+2/M1ulRj2pIG98c
   IQ4HUEChrgnAM239eZPwXIaKaMKC3ZQV+Ng7bjV9qHd4HJ7VHj2//j7Nw
   kGeVlGYUAFjPAKSCdH/lmlwilEFyOyHPIqm4fpZ7IDHlZHbozaLxF5KGc
   bWkpu/3+2Tg6xbDa3s1MVaBjJBIoXZv9CL0JJbLyE4QnnPh3QHwMvbFJ9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="380936409"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="380936409"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 17:41:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1095907408"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="1095907408"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2023 17:41:36 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 17:41:36 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 13 Nov 2023 17:41:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 13 Nov 2023 17:41:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 13 Nov 2023 17:41:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVuNzSQo4CLs3Ls2Ng2NuadBfmobTCA02C8f65VRs4LDM/bwSEw6rPYQ+jmm5ec7PS8BULZHBG9Nry8SEb7E3kO3EcCuszX+Cf2rl7ufzopjW9kzcC+RH8YA9TtXK8Y+7pEyuONf4rCBA+5/cEY9ypJHebUMg3mzjTY7LCN+QYIeYh7enR9WgwAl3z1/OgZtzqrFR8//r4Wop14J7ON3c+QdNIgXKktw6CLRUmhZLRB5rRxVXCJh5yoqsJLlTkGSZqQwNBedoubWg6aptrq3RDnXiHjTyl0pvKIyvk5nd+/jI5wLf71h/3KRjBw5KNVAc++84R93FldUs9zj12I7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yFXLDb3VFIig73MK56b5fs3oBGQC3HJJDQ3XeJEih8=;
 b=I8/eJlyZL0x7n6D62dKiDMggmw2r+u/cLHWELdlQatGqyTdbAtwYx4Jb/VuQvxMkemsZwRdMB6wtAp5RVA1gIEDEfET5+C8nZ3qGA1UeR/Rgb5XtnjB/1Tkqh3mRIxyjpaPE4LoNLCnj0delqzVh7CENjHOWs27a6xswPn+/V44lLsXdBBwvgHZeaQkmhWrGY9g33ykfY/BvxxsZSMzXi305yECj8KnTmrTUZ2aG6VKIOvJnLUaAv5OOXkhEe3n7vlYRnnc1ZOamMT0ZR4579tGdn22CYDor2NP9oq2HLf6XnrLmIBvAFnCW/rBiKei54ENSCIZvu79Ircc9ALkwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Tue, 14 Nov
 2023 01:41:27 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 14 Nov 2023
 01:41:27 +0000
Date: Tue, 14 Nov 2023 09:36:47 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Prasad Sodagudi <psodagud@codeaurora.org>
CC: <oe-kbuild-all@lists.linux.dev>, Yogesh Lal <quic_ylal@quicinc.com>,
	Elliot Berman <eberman@codeaurora.org>
Subject: [sudeep-holla:android13-5.15/ffa 1113/4062]
 drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol
 'ads_page_owner' was not declared. Should it be static?
Message-ID: <202311131712.xesxaMqm-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SN7PR11MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b00b7dd-69c1-4113-1e67-08dbe4b2d172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qJAiZvInHlyrK6dBuJam6bqKFENHUmPbD8HVsYTVfyf84CkekyXSdeN7lFchz4bDtuGkG0O8On1wgEnFralio8aVZ2LuNO7DwXupysgakEgx+/DqmYSrZjQY6/GTIzYQ4ZjsFxanCW6YXBcTlxBQk8JwQAAvDO53pSuAVCNfXSNIf8QxtKXBXF1gY0Jdz1tNvYLIfrkw/KGHL+jBLrjZeM+5eOM1htRBb+nZGNP//TjMjoGfbFafRjeFv9HJW54TSfpb5jg5J2ZPVMvnjQsd2BCMPddXfvajum1q8M414mHRoLHrLUctfBXNd0GHhac9YK1D6iVJw6T71USoCmeN4yPB5ft8U52tnvkybS4e6xVRAWjAmhSypFtkSMz1EeqV4bLL/YpZ/bahT1eL+0NQxXrhhcpRqmfcwaEQzTWIj+AHno4MpqkDMbjracf556Rv3oNAfHVi6/gQL5XhG3G4+2dvRnMMyg1IVBlKXFQe6RMMIgSUpUV4aOsCrMJ0vYJFCd34KJ08IRjXxtUJFYW9JR5wHpUnEMkiFeaRceRb9zoDnpH3lmZN9m/fKJi+o9sR3BC3VY+Z3irpOh8ITgSqDVjRlO6GolxRxrJ9AL8cYXjWiThCPrkHvUbj28bg/REJobiYHM8dct1NgViCwkrZgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(136003)(376002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(4326008)(8936002)(8676002)(1076003)(26005)(2906002)(4001150100001)(5660300002)(86362001)(2616005)(82960400001)(6506007)(6486002)(966005)(6666004)(36756003)(478600001)(41300700001)(38100700002)(83380400001)(316002)(6916009)(66946007)(66476007)(66556008)(54906003)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lHOtTgMP09evJ+4MdKbIZ3uPg33KEvXmjtVm6+eayPsTNvtwq7lbhrkcsiSB?=
 =?us-ascii?Q?cW1QpP6VYB5LfftYe67j8PGhC8f/sCl+ZDMgaminK9v1St6rBCOa0axUIc5K?=
 =?us-ascii?Q?+Rfbg8C6a5Um9VIgomkpzs/QISN5D9StaK5yF32xJ3AeBLYHE97xLvhX/dlf?=
 =?us-ascii?Q?T6RBIxJ1lH5WmBamI26xgC1bZqBx8McPF0W5cGD7NNuJWiW5+iHYtHW9DHrO?=
 =?us-ascii?Q?wQNTO4ZbOI2WLznTKNvcIzxsMeaNkmrqv+aiTuWbQqnYDeO6hNZ4MBJOVi83?=
 =?us-ascii?Q?7E8ieJdUbr3/H7QKfhorcgA/gWb9zlmu2dnwG4cu+Pkuhz1ycimbXI8cK9R0?=
 =?us-ascii?Q?y53mpeGtV7ep+hh2wmVt2mP/zVimGwib6WD06fPR5hd0SBiTj1OJu3lsSfc0?=
 =?us-ascii?Q?oiWCNa5YEopjikAJ8qZcZrLcBT67dxkzYLfDvR3ixdRLlS6x2v7euVWkHj0/?=
 =?us-ascii?Q?2atT7bI8wubHXVt122LpoyGC3tkVHiXy6NMu2r2hiDiUPk7W+cJgmMuUp2w7?=
 =?us-ascii?Q?Pnb34oIM0ZjbePOwyDrcmXQB0tj1or6JzvJ0DkZ1/naRe2d8RurX0g/1+m2Q?=
 =?us-ascii?Q?3U94Y4aXMDvUsa4x1rHEgcozyZoC3BmxjMjlfJvXvbxQLXXhd2Z5vj4wbKlq?=
 =?us-ascii?Q?JFjqvHOZbJ8dRx73PxQYqXLLsL6ArPfrFtw2SveDmwYdfyrwz/NszKBH79Fw?=
 =?us-ascii?Q?vFDa+sJnLx5++FX0M0jXUY4ENhZiu6HDE0slxnPnCOGsSz+hEgyvHlz96+Ok?=
 =?us-ascii?Q?GggpaAEMGGAvHlBisQHV9u0AdcXuxDfXfg1F+DQsHEgCJ3KwYT+FehBW/0C3?=
 =?us-ascii?Q?85rE41hjIdgFX6ag82guRLMWJojOQQ5ICMFyvpKsoMMHV7fLxvqSQG4eZoIE?=
 =?us-ascii?Q?6BPvVgyrIY4ZdGCsdUKj9UVH6TQ+qAKpAs5mYSZtq/Ns0ZK9RpfoyEmat1Ii?=
 =?us-ascii?Q?0WtAbJivGXrxFysklPDlhaDh9YX/SySw44dhJNkYzSLmuBGHkuLUTrc+m6MN?=
 =?us-ascii?Q?sQLfYDaQgDH1lsTh3JEIYfQgZOPjs/zvl2FhNj3rjjXLHBrY1Hxi1+EMsE//?=
 =?us-ascii?Q?Sh1P3cnD4bqCBfaaXBUjt1ZZPMYEeAHGW+4nVa/MqXH0O0dTBaj+KvA2e/5+?=
 =?us-ascii?Q?AtYO+BQRY7fL068yTp0DS25AhZc05pLKHj+zDzAm8YQDkBoQLeLp9lTe0QkT?=
 =?us-ascii?Q?qDHIDBLA5Eowna0iVPvrEtPJtdxAn5fLMJF2/qfH4EzBNsK17N0uryJCefG2?=
 =?us-ascii?Q?Q9bzO2qCkI/Gc7z5TbQNyYLtzeJuKTvWkFRqh+ZP0sIQiaFKwPl0JFxFj3y6?=
 =?us-ascii?Q?NxMb33dERxH5XMHTmiBpGUox9lBj50cVHUmCiSrsxCtBg7/jb12MX/PIoKOC?=
 =?us-ascii?Q?vOGCqAcHajE6Yn37xyewtEjk6yoI2knQ1/pvDZlq34HWV/7BPH0GDAocCf8+?=
 =?us-ascii?Q?LhD++aVlkB/NiB0AGX1tpMrl1U/KHRDeR9TDev7ekxWF7mi90F9YOcyCWtUT?=
 =?us-ascii?Q?c58GcORqL+mkf7ypC7sXuAcXfonqf3bzRelYbTNIYr9ndpPUcBKWBp7PhgKm?=
 =?us-ascii?Q?SMwgT09+hdaB1Xnx3mBI+uLtLN/fOPwQUPE8h+Ap?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b00b7dd-69c1-4113-1e67-08dbe4b2d172
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 01:41:27.3587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQ4quS6+YnuNRbHJEHLUP2WeLK/F8E6ICJ1hebLwb0LYuheZREQI7VnkuiFGcGcIq/YiTCMM4hoM2doXuOtAbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6750
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [1113/4062] ANDROID: android: Create debug_symbols driver
config: x86_64-randconfig-123-20231113 (https://download.01.org/0day-ci/archive/20231113/202311131712.xesxaMqm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131712.xesxaMqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311131712.xesxaMqm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/android_debug_symbols.c:27:6: sparse: sparse: symbol 'ads_page_owner' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:28:6: sparse: sparse: symbol 'ads_slub_debug' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:29:15: sparse: sparse: symbol 'ads_vmalloc_nr_pages' was not declared. Should it be static?
>> drivers/android/android_debug_symbols.c:30:15: sparse: sparse: symbol 'ads_pcpu_nr_pages' was not declared. Should it be static?
   drivers/android/android_debug_symbols.c:88:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/ads_page_owner +27 drivers/android/android_debug_symbols.c

b2df67a932b5cb Prasad Sodagudi 2020-10-28  26  
b2df67a932b5cb Prasad Sodagudi 2020-10-28 @27  bool ads_page_owner;
b2df67a932b5cb Prasad Sodagudi 2020-10-28 @28  bool ads_slub_debug;
b2df67a932b5cb Prasad Sodagudi 2020-10-28 @29  unsigned long ads_vmalloc_nr_pages;
b2df67a932b5cb Prasad Sodagudi 2020-10-28 @30  unsigned long ads_pcpu_nr_pages;
b2df67a932b5cb Prasad Sodagudi 2020-10-28  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

