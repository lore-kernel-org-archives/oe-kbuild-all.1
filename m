Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BF52D1F60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559148; cv=fail; b=QHAg5E+V3R3w2+th9d0D+YPM3OQmjQH0It2KzGUQWr2vUlKayMJ1f7YaP7qn82zIK2awoVsg0VPUgeMHBsjHJckFeiNyJ7JBZvh+16hfPodFAQwaT7JUgvrFxNtMmvxyYIgNtGtYHSS2YY4Qsa0wFoLxJrv2mDInMjlu1laK+I8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559148; c=relaxed/simple;
	bh=14ceJ6w7eTVeoApm3TOjdGIObiQP2YyxwFX6MltfOCc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FD+KVa4GeDbPrLFlBRua2rI+uZGHs6r9vyfEKsEcp+wCr1JV1QTPbBy1Hm4fLvc3d/VEeVIGk0uSdX9/dA2jZTqTiuG+unPr/QU0yqK+ZpCCuDXjKnPlWUJz63u9oT9pfJUgmyB7uKvIEhhOzWONM8+BxjIgn+vIE7SHIBtI7k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSfoCDax; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSfoCDax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749559146; x=1781095146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14ceJ6w7eTVeoApm3TOjdGIObiQP2YyxwFX6MltfOCc=;
  b=JSfoCDaxp37Qc3Svkh/olNFbkUWdVuZQGUAIgFoe+KsXRn3lGuhAl57T
   vKO5oszFYBZPqldf4V11wob1gCrsa/l1UNZowtg/S7b8xW3AAkmLMrPTk
   DYPlwwSN8oZVqmziaNOu/XoKtNPei6zODDIyyvtiTWIhZOm0Afelze8xz
   S0i/Hbx9mwPLp775qYnjV/h9FtYg+SLJPz3FBm5S1YPcrMziNjW/9D/9m
   i/6QahophaM0/5v+O8HGgG56rqXPIer7qoZYndB5IHolGiGfmehfoLFP3
   AdnjfKZBWfz3+UzyZnWWuFeDBx2Ir+qiBADpm1Jed6d9fIG4trS5X40ug
   w==;
X-CSE-ConnectionGUID: 4azf24tvTGC/IcnHrVRA4g==
X-CSE-MsgGUID: U0++3b71QJKCnSjvTKVubA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55457651"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="55457651"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:39:05 -0700
X-CSE-ConnectionGUID: +G2EHwxARYyWprulJQH4rQ==
X-CSE-MsgGUID: 8Gnmh5JLQ5icw8cwkeA0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="151699355"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 05:39:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 05:39:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 05:39:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.43)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 05:39:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMqQMkRM9vZ5c97QVdFBkQJV51TCzirmeSg+jG3FVziCHNuoNkRFVSQJ0ZGenkZjYNi8dWTXgIpmqh9eoGhvP/1HoHFW27xl1x5n2qlStZ4vSK/mNQ2dE/Pi7TZE9Ni4j5JzxKMRAEur9i5mz+tspjuOpd1sUeoR76cUAChNHHaoTlFbAotXWr4dXuvXdFwDknX6JzYsaoovQgax4kMFOrCqfuhrajYJ9i/bc5aU1GK1xmorMtqSelmSJXsUSWpp7EkAXjC/kIoXRi/sXT/mNXGfJW+48u3LzKbhzwSvaXXDGjxR+tqXjo5JuxEe6ttjrIRHmnJcl0V2io+NmFo8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWBm1q6pInhHSJdxT2gQB0qgpHd+iZHcubMdIaN63gk=;
 b=BPxD4+qei+z3SyGxn7jTrWi6vwcGR0Y8TdM0AkdZ95uGwQBaFWd0eWxzoF43ykrgCrBBVvHFFGYpcI4xL3ucY5yFcn2Lgm8E+IGbSM5rv5F8L4d7jIk7iHDxb+91vRQm4y6+e6LTT9guIce+AhhGpwFfGZA+5fMbS2rBrfTtU8cGfvTdGT/iobnRZgS7MGf638AlG00co4SlYcSThVDPLEyhq7j9bY7fnfn51+VyLsvJUqqPQcVlGPom8OWTmjIjvsenrcqW7LyJr9fekKQP3I64EAt3V0bHvjpr7yeyntyzFx5qjhCq3jXqvlOBXNxVUbUwQsIzo1Zh4Pm0Gd0S9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by CO1PR11MB4884.namprd11.prod.outlook.com (2603:10b6:303:6c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Tue, 10 Jun
 2025 12:39:01 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 12:39:01 +0000
Date: Tue, 10 Jun 2025 20:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:klp-build 34/62] /bin/bash: line 1: 2756828 Segmentation
 fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr
 --stackval --static-call --uaccess --no-unreachable
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o
Message-ID: <aEgnXQ4D2h1Vz3UP@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|CO1PR11MB4884:EE_
X-MS-Office365-Filtering-Correlation-Id: fecadf47-2aed-4a20-e850-08dda81bc695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qpFwl4uEXZWllIbHDqh2ZqdKCNqYuyZlM91c36NhVJ413ACA1AKbdFozxUXf?=
 =?us-ascii?Q?PAA5d5eZAIdYIri+qIfdKusiRKsixjxsWMMu/ZM5joTmam1bEzvAQBR/It0g?=
 =?us-ascii?Q?KGpBmRxUamYeYz7mCXNd3kVi5BFAOJ7EQuh8MzlzamN12vj04wt61u0Kpwb8?=
 =?us-ascii?Q?MOUol4GRLubKoYu7oWBGzK0NflLjPzYF2Kzu40IuKhUd+TXkg23t/e2srE+D?=
 =?us-ascii?Q?unLhjuPpdgdviXlLF6N05uhUsEFUZji2y03fkZSeVz89ZIu/D13SQYIOHyTo?=
 =?us-ascii?Q?iGU78lH46TCzlr9LEz9vpc1a0WOW2+W13PIXUoGrwXVnrHKgfG4cA2qn5Wux?=
 =?us-ascii?Q?1YHvaKAoKXlRLSFWt4EmXFOaN2/vp6AzSSZMvhoGRXMMnrQg72dbxRizr+S3?=
 =?us-ascii?Q?lg2ZsfayyvxgBGQtXhgntvNIyHonu6rnIaky5TlXRhr9fxR0d5/wqEQaMWNP?=
 =?us-ascii?Q?UpaW2/hp2IvTkuf/PPu1V9imGuFagdna2+a50wp2Xb3OBqj2KqPGU2P+kyrm?=
 =?us-ascii?Q?LTr/d0acdiD6bcLueREF9ulYV5MBLAPXH5gGe0nmfGDzt0esVYpc/XHFrZPt?=
 =?us-ascii?Q?k1eKcLBICLQcSvlvYyXxyPTxheWDUJFLUcgVavOTWz8KUDYJ4X7VOKLvyqZ6?=
 =?us-ascii?Q?wskna/t06/eamn9kA/jql+iZn+pf6nuxYKprM309oo/7v57IHioFBCcfIGKs?=
 =?us-ascii?Q?v8eEl/zBR2/D4a1PDPa66/0/4R0jPmjPzk7CGgSmNy4OLR9+gKrOyMAkJPkJ?=
 =?us-ascii?Q?HJkWWLu0J4NU0zbz95DHPTDunteKBl4UAwnaI1//+kDnf7Dp2P+Yfgd0sjl+?=
 =?us-ascii?Q?9QI30pKM0tE3y+6JMkJRKgu15Y0Nuk07WIIrqqH7sBj4CaT7gkU7vbxOAgx4?=
 =?us-ascii?Q?BdSRybrTJpg3GxIPHqmsLkecigTous59GEvzAJ3jmgroNzLLeSKLxCT2RBEH?=
 =?us-ascii?Q?zxt0IC+TjBBTk73yXTA0AvdROR2f/R+PcsCi3fNMPoZlGS4XnF56pHVDchM3?=
 =?us-ascii?Q?C7B1zCDExHqR8ebmdOOs9SfuTWI/wWvdvfHyY/4dUdFj4VPyVxsKUp6XzNnQ?=
 =?us-ascii?Q?w3hpyGEYA9s8AByuJC4L8ROghjEYIo8O6OBQnuiwGvGK9Ahq3ouLG/tyqQb3?=
 =?us-ascii?Q?nk2+DWtIREY2kmPNs5d2e8UzexIFWIdGBJivwAbhDztizeuxcRueaWIkPY33?=
 =?us-ascii?Q?BVCCSCbLYexqgkECAmpwDOcavClLT+jYWTqsqN9FDfOtMt0ayqiT7Vhquo/u?=
 =?us-ascii?Q?Gdowx83064snnSx2GvtC6cLC5LRl9ayZEqB2RyKHPd3HCldyic9UYdCu06So?=
 =?us-ascii?Q?MtDbzgZYOLGyXzKeETQ1sohgqd9/8VfWgMyqJx+MKYmpS0QYh7djV7uPiEYw?=
 =?us-ascii?Q?EeTpU4jVKh/hzxh0UgjaHbyAU8tX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lGMKyxcSLKgM4pArcYIfO3gef6eoGnMX8N8fe7GCwiU+U2f0UVK1wVLzO7lZ?=
 =?us-ascii?Q?FHHuybC08O98wMF7oOdoSaRBc0jbW5V+GL56dFOWvxRNTwO32Byn/U0ZKi1D?=
 =?us-ascii?Q?jIUwHr1iHAo8ikJLMTQF5i2vAzG1E40f45KROhe9vAunPPcLFKN/1DxmeWEk?=
 =?us-ascii?Q?cysGrxCa+d2EPSWirPhKNuc/zqLF71ZuLm8I2qK3f0Iebzm4HoVgFLODyxez?=
 =?us-ascii?Q?B6gn0xmhsTOwnrw/5pxRFDMYeEBNMJGEmcW/bsjQ3Nv3ZclmTnrTmalfxGZn?=
 =?us-ascii?Q?TpdL32mwaYJW0rMb+8/yyGu3/H6suSnisC/LmpFXBK8wWOiA4B3boTEIhOnW?=
 =?us-ascii?Q?335gB2IDETJi1KdFYA5GQZjpRiGTo8QvqOOQJDm4CaFSHfVDzJedYekfVJag?=
 =?us-ascii?Q?CEi+Nt9si6Lnjyvn8Xcw+rqQPcqUhjkWFw14m/hG/zBrRhpO7bq2PKCkzIU8?=
 =?us-ascii?Q?mjxgYWscPS27GyoiKWdt89F3cWNmmrAxy5gG2oBS1N/147RAMDCUifXKrs8M?=
 =?us-ascii?Q?ljo3QhG3C0bRcZvHKzTbILPtkpvUvxdw1uSsK72ShO2X9H6gro2FfJ92N411?=
 =?us-ascii?Q?IePgwVyQ4zHumc7oKUFL2IOV2SV1hLCKXSVVaRsaZ4uD/ISfYWz/0eq+JSWg?=
 =?us-ascii?Q?gkpDHwdaPe+QcoXCWQM0H55nt68m1kX+b/MCLwQuSpQWTl3pX1JLf8MehdOr?=
 =?us-ascii?Q?1YgkYdYPnsI436E8Gli2e7ERsjobg9m71vFYQyXpNi7AqZQO+Bx0z0oZkCTe?=
 =?us-ascii?Q?lJA/KXZ5KYONcbEFEGBIPHTw1BB5CkSrJ69n7ZodbQnLlTKC2IOgtR6g5G9i?=
 =?us-ascii?Q?O8jVl3uH/VGKyLG5PpMNgKfsBFmfCSyD9kAH0BoEo5WST00MSLg35+l0SA/u?=
 =?us-ascii?Q?QcItWHqItiKMnAPR1cJsSmASvsL/+VRs1/eVpgCtAmyoY1Ypujti23dKeTWv?=
 =?us-ascii?Q?ooKQeEsXYtkCNQ+J/2uCJBqzpUBLdjvT7kfJGdr7vg3rJIfoB7dE3rz+RIsu?=
 =?us-ascii?Q?nzYDCc/bbYbHeVIyOQ9qPkcz5s2d+JI99WfD510HuVTiiPGYiRU40dejzn+B?=
 =?us-ascii?Q?7aM+v2yRR1nyuuI5ONv1OGxgAjqftUaihHdFuNcP2NxfQvNk69Dw0E48Pmx3?=
 =?us-ascii?Q?pd5LRF+yPC/D52YNgBq4z3KBog3vcJpDZvDgbY+s+DSOMEjKMRmO2HbJmdeH?=
 =?us-ascii?Q?s0ac6wnVdw16lTVWOb6HDJ/YpYGBx18fL15+b8PgqLvA62PlAKJaUb8o1EAm?=
 =?us-ascii?Q?nPVS9lwEBvt0R5+nA9Qrj46EN/A/U6hvu09UmUhP2N69lX3dQAZwekZy0C1c?=
 =?us-ascii?Q?YnHgOVwTEt9JCROCXd+R6all2tSyNmp5Ffv4nqN30vVV3jiwmjNV3HJj6oIU?=
 =?us-ascii?Q?V4JxxS3iNbYj87CiB5bsIVHqn0gHEfMSLvx5e86zu7e+XacsjCfW412em80J?=
 =?us-ascii?Q?DgGx4WDPpjzA3JGNClbrXwrYGkL3IFTslBcTus4bmZ6jg5f8HcFoYVRS07TZ?=
 =?us-ascii?Q?CV2JtDM3RBsoX23daaUPNrJFW0DIsR3jdeANo1DvfOpgtLYgUYVLncB85iam?=
 =?us-ascii?Q?PUw5KUAlPfLqywW9WcWrKcddM6R0A1l0cQfxUk0s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fecadf47-2aed-4a20-e850-08dda81bc695
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 12:39:01.0600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gey0swVnKKu+8PYPr7KAR4EhDrhTyv4uAk7M0M9JSEeO6xyxy86BWNPlLIwKpQ4tjfl6dxjXJqH645DZoAZ5JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4884
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   9936d838805eed652db144cfa0f44ba3ec967dbe
commit: 548e99c502be207f69aa2c56cc2e7febf7a470eb [34/62] objtool: Refactor add_jump_destinations()
:::::: branch date: 4 hours ago
:::::: commit date: 4 days ago
config: x86_64-buildonly-randconfig-002-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101225.6daxFzqs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101225.6daxFzqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506101225.6daxFzqs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: 2756828 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --stackval --static-call --uaccess --no-unreachable drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o
--
>> /bin/bash: line 1: 2757966 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --stackval --static-call --uaccess --no-unreachable drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser_interface.o
--
>> /bin/bash: line 1: 2758388 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --stackval --static-call --uaccess --no-unreachable drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.o
--
>> /bin/bash: line 1: 2759867 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --stackval --static-call --uaccess --no-unreachable drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o
--
>> /bin/bash: line 1: 2766501 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --stackval --static-call --uaccess --no-unreachable drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_opp_regamma_v.o
--
>> /bin/bash: line 1: 2766668 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --stackval --static-call --uaccess --no-unreachable drivers/gpu/drm/amd/amdgpu/../display/dc/mmhubbub/dcn35/dcn35_mmhubbub.o
--
>> /bin/bash: line 1: 2767226 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --stackval --static-call --uaccess --no-unreachable drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o
--
>> /bin/bash: line 1: 2767263 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --stackval --static-call --uaccess --no-unreachable drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn351_clk_mgr.o
--
>> /bin/bash: line 1: 2767506 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --stackval --static-call --uaccess --no-unreachable drivers/gpu/drm/amd/amdgpu/../display/dc/hubbub/dcn301/dcn301_hubbub.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

