Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83963A6EF9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776259239; cv=fail; b=diw2nYhxBO9NCGNXmoeS+YjwVBnj9cGtysy4MK173luQR52W1qFWiv/QFCtRBFoDe6Mh+vAOLkdonxMwBhXes3joQ8qjiGoIftQgvMFx8iuWyeDwSf9d9bdst72q5hKghQxz3ZcFUMNgQm8pYJ7eVl6nyXstSOIXS0UPVAY4Hc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776259239; c=relaxed/simple;
	bh=3PbWDGV+jPGBq/3Jlm0fE+gkljqpvAw9xfaMVDALgNo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qSOiA1T65trxvds1ZuvhHQ0NWZe1AHqRkXlo7H4fJ1OkO7B7EjG/hEdAvLUAcD1062zwZ9p9WTs977cu+ADIzpE7awRwc8Pr3oeYcPe6UH+GqRJkNsTpbL9NERFbk/kKKWeIBLL76J2SFYf9CVKJYjgNo+L+aQOcQMqq6PJiWOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUwpgIS4; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUwpgIS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776259237; x=1807795237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3PbWDGV+jPGBq/3Jlm0fE+gkljqpvAw9xfaMVDALgNo=;
  b=iUwpgIS4NN9KCWGhxlBc0ZAbQ848cJz6HVh4daYciSOgg+qvCs1lxXEb
   UG0OFccCLPElckeHkQNBx/E4IxBPOqmc/itrK+2A5cTCpEmZIizokDlV/
   DVBL2Udy7s2L+A7vp9qfbx3s+zazyjuvGoRaBT3QJrrkjVLuGQPnXKIed
   Vnj+keCusIvqCgODzJGzJodneS/4tv+0qkijINSKe8npO0aOuseptI7PZ
   P0fYk0b1u54/VvzfgBBv4/DPbSy8ie29IiqbANmoRywkSzGVQbJRLHfmK
   Ni13UxkGH5JrwfIHFnNoD96qj7g4AjbVPOQd+2slhaETp3tuomYvi47dg
   g==;
X-CSE-ConnectionGUID: R93gwhRQR7uU4fePMQsyUg==
X-CSE-MsgGUID: VzEyAPSaRaaU3uj0Ts3xrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="81115034"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="81115034"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 06:20:36 -0700
X-CSE-ConnectionGUID: lEcOa4DXRSuNImdnG0FFSg==
X-CSE-MsgGUID: zx0/Khp8RZCWSiuvv6g9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229391548"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 06:20:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 06:20:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 06:20:35 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 06:20:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ac39QiSS/FFlCd+XWh22x598OeNvbz3q9FEvfqM3/0LclPLqX5VBiRXl5rJQIRA/ipNdJtYicJw0OmOuXof30rIv4Tk1OXUZAUupg5IlP7pUhecPBQXnBK091SBcasLwvTKzdvKHl9wbUoC9fzJOi/vmpexuietDERt7N8eP6Qnmyvvev+/vgjkjiRrV/WuwTNOPxynQwpqdTO/ug6/2N2WpYOu7Y8eGGU86CpTTyLKrrD9VBXOUKRAnXc/NCpjdy+lYSNstFOU1qRP/QCES5CFECXVmC4JyACatUGZSlvk6B8nbrFP8IxxsVWTTLQZ5K+6a9hi6Wau3QRJs2yNolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZydbI10X2i9vfruen6gdQ6EI3+1u4Q5DZ1I7BzOAeU4=;
 b=kerY/R2ej+s14Jw4m9b7oTuEZ5lH1fHkW64O9lBRStlH7XBC9wn3zbMZ+P6fU4EDawN5UtfQNNWD7GjcOs3v+LA+JwyLt2VG6GqDeGliTsBKn+0tvg7Hcz/cphE/WH/BKglxPGk6wnR1lONBY6OmtEWFylO1iIyBx0zarMLSxNtI2pwy61GT4JjkGxJaJZKA/iChZBJo7pVhUfml3Ep/9SjJ5iK5e0WSxmJsTiBCOJymf1zj/KNpX6K/OoOKziJGWm4KMcg/cqxFi/1Sehh5iTFRxgZp+5XSrLW20DZQ8tYSN4AQdPxy6tfIQ9/mouYTZ4yf+W5YzDK22/g/9NtQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by DS0PR11MB9455.namprd11.prod.outlook.com (2603:10b6:8:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 15 Apr
 2026 13:20:33 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.044; Wed, 15 Apr 2026
 13:20:33 +0000
Date: Wed, 15 Apr 2026 21:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: Aniket Gattani <aniketgattani@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: membarrier_rseq_stress.c:43:3: warning: #warning "Unsupported
 architecture - using dummy RSEQ_SIG and skipping at runtime"
Message-ID: <ad+QmRX8idqMC/X1@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|DS0PR11MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 8495c2d9-de51-4c8f-6f18-08de9af1c5f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: uhR8igDbuUJ5FhmyZFJg/OE0VTg0TrtcOv7d/rG8SdjpwDQ5ZLAZwmqAf7HnRkHMjPdUUkk1GlVjAWhkYcWkUhkhmybdJ5xns3qHBBnJEuhITuLEbSDtiqQBYH2/Yn/GQ6EU0b97xhC4V3WP3yuXQqGI+a/32UVKXUvb+gowyg8giIoJgoFlYUpGXcl9Kkz9sCJyQkcyzbwoyBGPhn6PXWhoqfe98R9O0l/xf6U0gAAEUUHpAOdg9oSXEZGSzlO/wjwOayXkaf0rkRCsSBAz7AFJfiZdzrg1QdGKmFIb/kIBbVGFzBvkHspYTIXUywCdWY3dtPRwbMAHjVmD+XTMSNLZv9gTEz+nl8oj6JaiwwNdYih1RCvfGqciu+HBdFzf5TiJXWEqYjaXu5vDzD+A6qqTjIIQXAGvrEPQCj/PYCYFvf80C5xYoawdDuEVvWr5WxHCy6OX9I0aFJUfZiH1e/OB0o1C1Gofdi76dwJS/myMYEf1z4UTwUoMOvBIm3Cx5KYMR/P7xhsrNWybRTBzPTvZsoGxSeo8D8YNlopyC5O3CBvhwlYamQ0pApvkPjxqAg32GUtvLPJa+jjwHzMp8AB/+txowo3vBrjLDatuzo59lii+j4UWWUOk7w8lWoHvo8IrKGN258pmXCzyMM1akw6Gzcu1aakX6ndguPi56yArxlrIrAfjQsNzYprkPUR3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8UdF0ELyByPqbBl5WvKSWTvib6SX3J13Fq2Fspds9rPBJvEuV5WWGDiQwSu?=
 =?us-ascii?Q?DIojjIFtnqYAEOlOS4PRbW1IMta0Yliwg3rYvfwSf+i0gDMbhY6l8mo9KIf0?=
 =?us-ascii?Q?XYFzeJZDi22WFh2ARk9BAuyIPkUfGJEoeMRx8LX2/S3cX6ZWbP7XEJptaSy0?=
 =?us-ascii?Q?fvFQbA18wF7zOH3xAVjAv2Hom+ZB7mm8cxGz4ivNOATCds+bUoxJ6xFj+A1/?=
 =?us-ascii?Q?gjsJ7iHOiY7N4c+/GIljwkgHbSy0M+ulk5/IXsXJy3ThB7tv61xnPD5zvnmP?=
 =?us-ascii?Q?VughDn1ALtJw3s5oWKLxPAdT3PkaBlsgm5tKkI0mDu4IdquftKcIKY/c4BwE?=
 =?us-ascii?Q?rR8DyJQLb2H2cpyzVv6Vbz0M4pgbMuxtXK9vQcHIU1sM5UeExJwZs9AOmHwu?=
 =?us-ascii?Q?cgxXC3vgSCcYyeAclMKLsLMMV2A/e7VWxUgIc5b2lUfG494KCRaikurXSfNJ?=
 =?us-ascii?Q?1efuB8l+eBpn8cqKRBWbwrsAE4/YbJ4NxV6kEGhEg8rLyIKrqMClCYyx5wi1?=
 =?us-ascii?Q?gO9L2bqHP3HZmR+npKXQPOHAHyuIxacVljqKnq/RmP3eJhfmlfm3+BQmDVFq?=
 =?us-ascii?Q?2n3PKUDVPuFU/fiLHT4fbVhq04Ln3WTjuPSNH5ZSbC/a+lnzWH1hIyrxG+1t?=
 =?us-ascii?Q?2BOSYmxFwIAbqw2QkoI5tYdEdTsZYODNtN+Vpos3Zde4VoVfHO9Z4gH3D2cg?=
 =?us-ascii?Q?hQqkZGWC+nzZwN/IOkevUHv16HO5kiyzbvTb5OrhT1Nxo/uzTKpWmJO+hboa?=
 =?us-ascii?Q?ca7Qjy11Yai9wyPoAnP7ZLPcABdzFn4yf9TxjB7KmprhLvIZU3OoF3i9w1eP?=
 =?us-ascii?Q?vb8pDFZfdxJvleyBkOfhRF/nhTflHF07V06R/qFXfCz9HuiPicDi8X7Bwn22?=
 =?us-ascii?Q?Jb+HEzx3gJigqMJpmuXW1PMWDjP3vNca7vYZRDbycl9I5W/vS0QL460g9TOe?=
 =?us-ascii?Q?oK1LYAnaFAf1NXiAMgXGIia+qykEA9BHbbpZN5FRVaACcMXclvMKxMXM+R1p?=
 =?us-ascii?Q?EVcfUCunuPJWu9YbF0wTpoZydvApvPD7jXz9kO273X0fCyBSaV2au2rMv+n9?=
 =?us-ascii?Q?qjG/cUVFH0O7BPMULZ/W2pc6a3qL+mpPsQB3klQCpGHBla8WjpKdVVSDMqZ0?=
 =?us-ascii?Q?ssYSneFjzdypII0w9yOj/+uxcgcz+JvEgYGRWnel6exB3d7o9XT5PH2Goy9W?=
 =?us-ascii?Q?mZFwHMI6vNGfB4LZHuCjHN6pQIJ/R6pz0C7RJAAvOWWkHnciEKy1y45lDAyz?=
 =?us-ascii?Q?T/mIYMfD5NJ/RTg6lLCBBd3KMFOnDQJ1PAUwLAomnOBxgPMQqkcxzSBluHjK?=
 =?us-ascii?Q?cJD8a9P9KE7UWOHps5O3by6PJJ0Uams++hW557xe6fGRFytjZDa4SO8VODYC?=
 =?us-ascii?Q?TsW+qsoQNNcJS9/pDbnVdhQZaSEtuHDePKJBatiRtBpBunc76eUdV32hL3aJ?=
 =?us-ascii?Q?L/xfVbRfQCfQ8hnMjuRPe8F1A7InxOCCEwr3I1UymIeD4OfA/g8fFNLuY7ep?=
 =?us-ascii?Q?8BqiB0lArd1DHej4kQru+nR3Mys7+rhwEWka53BEWrfhjQoqpNH+mQ1HS+Pp?=
 =?us-ascii?Q?8RlULAcs4COG3wwcpCt3WfyPiGG4rVTs6rC12UdRvhI/GvGoR8qeWdQ0qOKy?=
 =?us-ascii?Q?nMa9vIlfsQoVOvLnb98AVRDTAxS5hcbE4ypZ+QhMv9zevQSj1vmQCU6Y3WAc?=
 =?us-ascii?Q?Dyks3DADs0cqUijcGr3j7RfuFl3pXB9WUQl3BA4AH3iFNl7JA/QQF4w7k2EK?=
 =?us-ascii?Q?U9k2sbTHpA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Bli6Rit/h+dXT7ADa9jZb8Vowoy+Dsm43vWpx28+Jd0WMxIlRE9Hrk9aYa12ys3oWaL+iveSSjEWw764nnSSTs21gCVuNkLikj98cUMVUt8sN+roPFXsFLBkUnsHAkYkCn+iW1y1JZx+AziaWzXVnqB3RXUYezbej/cMcvdOO2tzKLsO13vCiwM0vEow4V1+7YvDequftuUkONi/b3xdIMssDzhjxPLnH6slagv4YEbevOWdWHwQB3kPBODRAbD9rtBSNW+zAs6tUZppeaYFv5fDTUktGcYLP24jaAu41a+qChc/kC9t3QYJjEMDZUY4+EwELu7KT7JOSVHJtb014w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8495c2d9-de51-4c8f-6f18-08de9af1c5f0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 13:20:33.3554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWb9FIhjXbxjCgLlZKfIwi/WKonA/1rot/mkwv2zX6gzM0O8Dnk+inSMaptnX4QH559VmniTpyv5yBadRrFjJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9455
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Aniket-Gattani/sched-membarrier-Use-per-CPU-mutexes-for-targeted-commands/20260415-000609
head:   117d22599fbe523427aa80a9839a2a0f5801cb32
commit: 117d22599fbe523427aa80a9839a2a0f5801cb32 selftests/membarrier: Add rseq stress test for CFS throttle interactions
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260415/202604151516.Vc7Ro4LP-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604151516.Vc7Ro4LP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604151516.Vc7Ro4LP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> membarrier_rseq_stress.c:43:3: warning: #warning "Unsupported architecture - using dummy RSEQ_SIG and skipping at runtime" [-Wcpp]
      43 | # warning "Unsupported architecture - using dummy RSEQ_SIG and skipping at runtime"
         |   ^~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

