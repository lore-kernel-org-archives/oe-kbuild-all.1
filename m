Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D64C75
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687764354; x=1719300354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ovmpyK3yDDnNDzr1VTqaqPqoFXnw2eLPUONCrJb0f7U=;
  b=lKpWqXRnuNt21YbdyuCAwTwrF4RWLdyrbrflei9af7wo/K7/xTH9qhA8
   E1+3FSQrt4pPu6FImDasYq7KdgUgHHrHTByDHnezn8Y+BFbOuUTaRETGE
   gKdmkWtCFZM8eBkhLQRVmJt7tny/1AvQQLa9cVo7jnIJR9FhBU8803Yhq
   X9dW7C9AcCGOFrqQhToebByloFvYGXN8/fJ6jdMyVoafCCPbyta8rORx0
   e3+1jYmlw4JTMVWLXEZ737phwW8SqhGLMDRb+rr0E+UoAOT3MjO5rS0n3
   QAdJ+yAsBLsxGBdc/mseRAXIeu0pDwCgDCEgklOE+hDBc/vqE5depYidO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="363745581"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="363745581"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 00:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="962682095"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="962682095"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2023 00:25:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 26 Jun 2023 00:25:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 26 Jun 2023 00:25:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 26 Jun 2023 00:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpBpZTqOsDwx/5UEOS6Zv+fK0WKKHEbsNB9GvlPG8eechUHBs+0fLEDoIZoc+6XcQxj853N0W7H0GykUXAnvj6h8KO7tTK4rgl2rOG8E2M6WtluKVZtxsrviNeew3tYRD5VKh14ytaRaF7aEBT30Bdoj0GyHPlv80OpHowQlNKq6H5UmGVS+Ygz2K3csPtaHTUmzV8Fj+eQYjMrrJ9xHVspTFVc/Cs1fBIBES6h9DLiRCo74+h3jSiHbEirwT9A6hdMAcMZeVL1KxX0CRJVI+6mrOrcRs3y/2BKdbEVbC1sIAZd9GBgxrzv9GdA51soG8VNqc7aePqmClk9Txq6m/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNS1zdIRgVjL/yZfNPd16spLSRps9H735SUMYG46qe0=;
 b=UEdp99bNg3imASmqZKHAiaPGDX1IRdVlo2KEUleVphH4NZdaZSOUYeA0B3/ftd9mW1/9FjcyflxI0sBD50SxXDL/xNdX+TulxYNskQHGlnuTWNTRpPrXv5+GSDQeH/+L8VDiLJ7BuUffOCPhghR37ry/kETymF3MPRBNtQK/1y6PFmIvGeDLVDMJQM4nBxw9Pw3kvSpJgFpx1xMcVNs9UIYcWbb8ONb6p9mQc18ORxliMkFvo+fCiD4GLjNx0wNBjPPqT6y/pTojfkn/61NDfbf7v5T+ozIArfoDuyZx47vscHkZuVNB6T7wgv1zYwBhlGMpnS9AaapH4fM2YPmL6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 07:25:41 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 07:25:41 +0000
Date: Mon, 26 Jun 2023 15:22:38 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jimc:dd-fix-2j 11/17] lib/test_dynamic_debug.c:102:1: sparse:
 sparse: symbol 'map_disjoint_bits_classnames' was not declared. Should it be
 static?
Message-ID: <202306241240.VNDPVuzl-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c36654-f231-4fa9-98fc-08db76168bc5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gqWYP+6nG3OAJm7+4mZCnyDRfHKzPDfkQGoBtSO+XmMZdS2v8/HylxAgdRAFT3es8Riw5qt04Nz20oDxXZRVQy9V0tsVdZjMKE6ZxpMDKc8aFMRqt1P8ROyfJzfCFVrgckE/7iUk4fMyrvXo4kUIBcUwAko/5rTJF4nnpS1iZRU0tZIFQR4GmiI/iX28PtQ7jb3p05ykfqLm/AL9z0h+88lopPtNE5+awAKlIz8R2mGgm0FkkA+63JAnIF357P+NOf0lTCSLeKxop2StPJdZKIHRXK+k9Dp3JShu+go30L+269XzEUDnErlkaCzYmX1BclC8KmWOC6qjzspD1CJ0ojGemQY5IUfX1hX0Em2wtdjiEmY68njHVd9qtBctN/J4CJCAuojxAavI8XrDPjFKJ5tHYKDDoLTppTs0Es4L7dX+5A6TPbVCJ856GyzR7S1AOsglH65VBJ8G//TzWt/VgjAm7rd01FW7XuI6TVOX/2AXSNrMAsWS+rrm8QrYVBeUdvaAblPARhcf01RfsFvnUsbgWJhZOPfmutPNUWGLhpo7i/+kxwVkSPTAi6OlnwV1t3zZ/vKNrR085AEkXHKzaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199021)(83380400001)(8936002)(966005)(316002)(6666004)(8676002)(4326008)(6486002)(41300700001)(36756003)(82960400001)(86362001)(38100700002)(2616005)(5660300002)(66946007)(66556008)(66476007)(6916009)(478600001)(2906002)(26005)(6512007)(186003)(1076003)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JUzKGwVjtLG4Q7FCIrpIT+Z/Syy0cSlrV/3k5zWbRKpBxD1q1jKIldCyRa+L?=
 =?us-ascii?Q?ok5a2lW5dBUApYx4vDgRL5VI8+dpN8DTSoSJz0sPkzm1lvpndK+yBzeV2bIe?=
 =?us-ascii?Q?iGOVx9CS6/EkZNth7OSgLTGfwe59I3MimoJlSmnFeYh3u84gLNN0+CvwyCBj?=
 =?us-ascii?Q?2yXAOedCClv2wEaMovqSa8xrJXhudanv4aACCm8ygBF3UO+A+auN+CqliC5V?=
 =?us-ascii?Q?9xpfdwITm8ps1I+bmoDf7qz0HWunYfWUrEkhJhZ0/wW/BUPMWqQw1L65y6zp?=
 =?us-ascii?Q?6dR64dlltZsDe5oDAhdF3u0pj7uIi81CNGQsTMXhdbc2MWwvZ7YLYedHTh1v?=
 =?us-ascii?Q?ZozSLXA6n0YMuzJBW0FMZbDwr2oD1klX2MFAgNvCIYIwFgFvunuQABxQDrRT?=
 =?us-ascii?Q?qcK0WCPvsoNq8nFnLquAz3CXtCCetYeO1DbXA2QHXYJog6C8/E6ngNSTowwi?=
 =?us-ascii?Q?6SYhvdBA7h6P3s7pCNirR6TpZeqQ6oATjBp220Wrr1HLJIH0I0QIOcMCRlTf?=
 =?us-ascii?Q?UqBF9w5e9h3qA5s+ajz5qImB6BHGruae80b/oeAdDGkoPGZgVfiIIvd1X3YF?=
 =?us-ascii?Q?hZACF0l39oYssWUXBwqW61cxtNnj4PuLwTVfoweyvySWqX1LP+pT7tL/qVWU?=
 =?us-ascii?Q?WI3kca2h1B6V6KHMxcWEhNkOPFoYqCcXNiAtMLJKwPXc/W+dDzt4zE6Xezj9?=
 =?us-ascii?Q?jOtANwnGQWssNt3N53YxJBbrsUocyx7un4P8d3GmcL0buyAqDjA7SmdgV7J6?=
 =?us-ascii?Q?nzW0ZMVLf3AyuKjItGmypx+NabQDee1Pv3D3RRYotAdl4/bBT3oKJLzbL3Z9?=
 =?us-ascii?Q?X7FNV7g8/pz8qT9P5VTfJWR6IyNoPnRKpxeVPij9D160oZm3G0k635BKMxqD?=
 =?us-ascii?Q?2aMsDpztS9XEGq8gSMgZyuU/WliHshfpmH6B13KmtcZE2GRlXRt0E5tYZWG4?=
 =?us-ascii?Q?lbIW1kdD+2zB85Gah/yTkrCBGUTXwB0FcnCwEhIIKOXuST1y7PdnNvsN2uOE?=
 =?us-ascii?Q?6xmJEDPF2pejSeZ1uKvj6Rp6Bj1qWrYrn0Pda9MMSHjYs7Ydvt9VF2TWxFYL?=
 =?us-ascii?Q?FghnRieykJMPiIwrqmDdBNue7j9NilW8PXDSxRDADl6tdI2dR/rIcgWaXEiP?=
 =?us-ascii?Q?fy9kFYbDudS4pM5g+TuV9O59uhU/lDxF2gQLBAEoc0lgS0QBoMNd9lxO9FBN?=
 =?us-ascii?Q?o5DpbrevORCTn5du6MtOtT6qGrGXQV7uAijdcjvuWHXtEKF/OKFnhy+fW99x?=
 =?us-ascii?Q?XbSc6Ce77rxUYpDpHgLgfn40HuNX17e5yBtInPy/o954R4X4ikTIzVBwME5c?=
 =?us-ascii?Q?KYNN9D/ahJHgwQWLb/BD3YBzGU5PeSwgsAm2GhCaNCzBTPUj582Ci2dPkIKy?=
 =?us-ascii?Q?WFnwuggrNnfiQ2zBKh8ulo2rAhBRsrib2IxbrONLeO9mRsdoHcdzMY1hwwfp?=
 =?us-ascii?Q?vsxqaot1wj07gCckMgYIDkwtAr4JRmvuV2VmGu37TYtdqeYaZbZ21q1o1sUv?=
 =?us-ascii?Q?DFzRg3Xr18rTKlEHHz9s+rVjQN48VDy5mV3WoVHSSITuy/uvg86RuhFqgPdU?=
 =?us-ascii?Q?D+6N6mt4ePLFDa2+6tbyNRAUpL+f01aVCKtVwHsL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c36654-f231-4fa9-98fc-08db76168bc5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 07:25:41.0974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDMPdQDlGBqlnJp+YR+26qK47oAE3b6l9wgEN95o/R2HCQSq0detje0hsTVpA5536pFCQ5fHr/6lDgh4940VDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
X-OriginatorOrg: intel.com

tree:   https://github.com/jimc/linux.git dd-fix-2j
head:   4098fc4c48d0cb803788c4eeee53e03ddd157200
commit: b03647afea5bd503a87dcfee0569af044c8cca6d [11/17] dyndbg-API: fix DECLARE_DYNDBG_CLASSMAP & CONFIG_DRM_USE_DYNAMIC_DEBUG
config: um-randconfig-s053-20230621 (https://download.01.org/0day-ci/archive/20230624/202306241240.VNDPVuzl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306241240.VNDPVuzl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202306241240.VNDPVuzl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/test_dynamic_debug.c:102:1: sparse: sparse: symbol 'map_disjoint_bits_classnames' was not declared. Should it be static?
>> lib/test_dynamic_debug.c:115:1: sparse: sparse: symbol 'map_level_num_classnames' was not declared. Should it be static?
   lib/test_dynamic_debug.c:118:1: sparse: sparse: symbol 'map_disjoint_names_classnames' was not declared. Should it be static?
   lib/test_dynamic_debug.c:121:1: sparse: sparse: symbol 'map_level_names_classnames' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

