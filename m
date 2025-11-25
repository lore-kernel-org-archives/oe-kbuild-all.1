Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BE020FA81
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 05:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764049483; cv=fail; b=HdECNqhqwmA6ZugzgePNfzsBE6JR0gQS1+BG2uA0OwB5vGUWMkP5LMWCl7MPk9rMT0ClDta3ymTq46I+drWAIPhOLYUtqACW8fglND+d16UzMy9MpVFPqhQIM2JHuXwrRIQBGjyl3anana9Nt68to/tCcnMjHFp5i8PXglpebVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764049483; c=relaxed/simple;
	bh=vEa4NZOllW3/pmd1Y9DZg5OC5SKOG4e35+8schd14qs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=f0sx9T6vYYOcHfgRUm74u3Rh40+9fz1hxeXkvPjmWZI/spBubX5wHD0vGckj+HXGxGpkJJYDMHc4STx1nck3gbE0WdChNNgogb+PSYGFm78g+WppGt3tlkY/2ZQ6PSAeaFAHHdoRgBsC5ME6ZAxN3cfJKGUUe5AltCnUyyFLxSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFmTcC/Z; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFmTcC/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764049481; x=1795585481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vEa4NZOllW3/pmd1Y9DZg5OC5SKOG4e35+8schd14qs=;
  b=UFmTcC/Zs+fnwbigNb5qNyc0uRExcV59ywrWt/HUIEGTNLyQcxDzIxvg
   H9fSqqwXI5U+a3D97jaKRQDq7v2XOO+vFc3Z/cUxvHoV00ZvZr2uWK/Xv
   zycOZd07QbtYR+QXL0UYRrqdC4pruLFJxgkkVxWGHdHUL+oLUX744ow6V
   4SXFu5vPOsK0aKOJ52f6xZ0JKcR2p91lj7hCc3fYPowrUBgiHfQ5UcvO0
   UDTB12m1BXBopcLEmFT8OBCDWn/LBAXJn99IQRNt0dCEN94FZ6LlBVle0
   ywFBhAyohqBak3NMwhSbne/B69wc/fFrupXeh8nedcsFnri1/wRSeYxVA
   A==;
X-CSE-ConnectionGUID: EhOvPtP4QnCkhYZmVSBCYg==
X-CSE-MsgGUID: 0Q7dUDjiQrGXWty9qPHg4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69917442"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="69917442"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 21:44:40 -0800
X-CSE-ConnectionGUID: 6TfXRB6WSxeoi7CKg7XabA==
X-CSE-MsgGUID: MVFoO+0CRAONnBfZOIGDkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="197016637"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 21:44:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 21:44:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 21:44:40 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 21:44:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+7pwyuB7IpazGadVRWo3gY0QGtrifySHa/5wBbdxkJ5kQY5OLgJyVMD+ZasnnWYSujIRMCpZGPrXXVZ0f4XGbxUExv2qKh8f/tpP1RsnmUGIgOFrmq9WFmGgMDbe7PXxfsISSO7dqGG3lmapu7RjJrtcZMZp2WrYR0fcT8sAGE6OUsP9xGc6mB8QrkVhknAobnFVAbQ+JMTYZx6kRwdDxR8KG4PRzHBic0uFA1KznvbrldNHTpDaxmzg5LzRVVm4zqIMbiP/dhrxLvlYa7vnFpSCxHM2pyNz2qgqWYeTCZ/PvHKa/jk8UhpTr2ajLMTOqMzW3ZN9xJSg24iJd7NaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmJ6C06iureHM9jNjZm2Vx/hXjnsggv/o/ZjgSuc1bk=;
 b=nCqTLoq3tETHceycKCSdZWPeyI9tSF6x1n9UiJZ86e0O1eL30MjydSSeN1BZe3IoL0oxM/7RTjvWSUV6F/zB+ow38vteANI0UQ/9ZryANT4PNGsQKqfrkAlIXf1O6f6cZfp7fAN0TH68wxwNYtmUmWxO6O8qQuBzdQ8P0cniZUKIOPrHHIEkWLmpOhYd4FePs9YoYlY87STAe3wjfq9dGlhVlifAuHHs0grwcO7LBXoZKG3WLFAslrQ12cZuKEsb6QTDlUJodNBb0jfXTX2nRFSx0K1lFV1LU0pziHUa8/TiZ1jz4AKd6+NrUHVN2DtEhec+35gG14hnZNkzoea24g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 05:44:36 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 05:44:36 +0000
Date: Tue, 25 Nov 2025 13:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android12-5.4 5/5] userfaultfd.c:296:65: error:
 expected ')' before 'PRIx64'
Message-ID: <aSVCPJp0curBWAAC@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ccb4d42-93ed-46ac-f4a9-08de2be5b798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q55dLJnC9e6JYa9OPKuzwfohw+gdX0Ph6XIllkWx8ezR1wW50kjioEYKAhl+?=
 =?us-ascii?Q?s3gnMg+bLiGdqFTeB8fWqc3aAQgYIwI134mQYdFj+85rI1GZG2KQD7VWtJ9F?=
 =?us-ascii?Q?v0oRBW4k/Ntj+VM/7mhWp/BkMK6usYwEAQId55aAlCkYwdcXNSktVWl5lUyz?=
 =?us-ascii?Q?fSz0jdec2LtVADEsE36mXpKgMLFUn/HhfuClNk0LYpDTbJVgow1z1u0MO137?=
 =?us-ascii?Q?8Kc+sFKVB8OYYMiFqPTAQfkarC6I/U3gTpMhW0fZuMAuzhCpNYy1RL3X/yCO?=
 =?us-ascii?Q?493Y/56D+wX8SVOiYGT9kucg9N2560TX72BNqcDHrfahqylIOcaezhUhOowV?=
 =?us-ascii?Q?ZjAISxCPmkQMib/qaBFYO0xh+X4H+3NLnErxH3WOnAUP0LAmw5hUnNLGrAOU?=
 =?us-ascii?Q?l0isZOiK2WGOoYaOMqc/7kUgYxxCcxIbCGwW7LH5EQNkgjXhssC+kpvdhJfh?=
 =?us-ascii?Q?iAGu7n+vYgdKgBt3hZeEvzOANLpG/stsGuujAeQKHdLDx9mlrVu6CZyahlY4?=
 =?us-ascii?Q?xxY09jzD3n4ws/FZKvCkEWMxFF+QhWLxI7NPRh9H5+KoD+ktUqrH7spW2ChN?=
 =?us-ascii?Q?ejxU8mjgvwOnPQuxK16WjX6qdL1Gql9jR3cXEsBStyprQTnmhzmy8AE3ZQar?=
 =?us-ascii?Q?OtYdHqnwW3A1zA67e2uXaq7M44sHv7tB0A7KzH/rS2CAZAiR0pL9WnS6LZzZ?=
 =?us-ascii?Q?b6n0oHm5PWfuBw4Ptxp3VLxrMjAoptik0nUxD4scCmpytAMre+FDoe/+yt/f?=
 =?us-ascii?Q?rc87dYY7FVguZxmXoH6+tBLUuL1PhKE9DFA8O+t+ucSIsiqTEJrK3gbEr5TV?=
 =?us-ascii?Q?P7qgrA/WugpKU7emreH/KyjZcm7EDrpsvox8x2f/n3jy/5ZreqAIC7Peg2Je?=
 =?us-ascii?Q?G8cMK9x3Kvhhu6j/Mg6/zc0wzhktljXs4udCWMsBcS3Bird6TOmFWx+l1hWw?=
 =?us-ascii?Q?CRUhuWb46+zKYH7luRZNAV/o7Sv4I+s9WjCNo66CNQLKrIDK4t22l9ZD77TG?=
 =?us-ascii?Q?WCz30f9nMloNpqBqY1SHJHInoOcI+aXRqnPq4QqH81wniVYDXjKkIHtWN3nH?=
 =?us-ascii?Q?fV87VIQrjWkkKFZ0jxK87EdE/AGo/nvojb+/ZPAwk0IIou0FrtQpsDvQKlHm?=
 =?us-ascii?Q?TrO1RIABOW5oLYcBs4TXrH3xbdwd95xY0J+64nm/HBjIgzR0SxF+/6LAj18M?=
 =?us-ascii?Q?ZrlhTz5Ovn5cMx8/3i/bF90H4bP7splpm9m+NiSsXzcr4Dhvs2szEbTImPaW?=
 =?us-ascii?Q?m0f/ySrfnRKkkOOWg3drVcLhOU6N16+Zasfihw3uOPbGGB2z+clzCcouYDwC?=
 =?us-ascii?Q?gizNyruHU3acOXzv/61IfSWzBdRuU2SUroe3m+WRyLM/Ce0grDQpjZ8lPcQ8?=
 =?us-ascii?Q?0zxfHM4aP1MdJ0x65wQVf5d6cBmg4VSp2buXcu7GCUS/gQsyVPirZTgvNGMp?=
 =?us-ascii?Q?lrU3BUZxzEdhPkGePS/pZax8bNuES9D/422THMHZ+Ocf7p5Z1VLcHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kgkyT+aC4Y8ac0Bjel6EGtFI/eDFJmSYcnOfD1OlyzqCHGOAvh23auqPWfyJ?=
 =?us-ascii?Q?QqWQk/dEfUfdVycydrM1Z0mW4mE66eZINx978EKsZc5GVTn2Dd95X+fZ287S?=
 =?us-ascii?Q?zj6z8rK8WayDq1+XN1MAkAWBgf2Dp9OcZd8HhWIjdNtDzYTR0FtAUPW1jaib?=
 =?us-ascii?Q?w3Cj5n1sBWlfTsCleauMZ/SoIJXZ15lIQxy1piPl+P+/Tz+C8XIXjpCOydYE?=
 =?us-ascii?Q?tfjQrnwmSOTtarwbvVsJPxKN54NOhRjs1RWbHdIfouL+nCJP8WqWTWmHmv46?=
 =?us-ascii?Q?OiVwd3rPrHPFTYJ0GXpGKFk1Nz9u865xtnFL0tergZkaJEfCJ0sN78IiQI33?=
 =?us-ascii?Q?LO9tGd/0/sLgQOk5LCgXgvjghJJiqYSK9zKJx0eVSTZPCArVgZIUDV3CFC7i?=
 =?us-ascii?Q?jGn/jy01gPbmzrSMXnQh4gAqNdGfuJdMtr99EXIem32eUmvRXJsHKFT6bA9I?=
 =?us-ascii?Q?YUNBWUQB94JA7lIns5lphJy8eNbBrOdrK3nDbs1dnUCY7mWYOQNAgKFdBG2/?=
 =?us-ascii?Q?w22uMTz7kDwATVfuxd16/2bieHbAjNbjLtjHScyIerbSib/wa//niBgqLiK3?=
 =?us-ascii?Q?pDCFU8EdtwYToUgok9oMo64qzjbej+UP5GXItX3RgEeFj7Wk6wPIG0mi67Fs?=
 =?us-ascii?Q?SAw1n+LHwGto1+2QnEdfv3J7gO9erKSL19LvDtqltLAPJd/bI4QtnrjggNy3?=
 =?us-ascii?Q?r7E7yNUyQ4WiGrjp3NB2Ogzq5d7s+n3Hi95S0NzvAiIvI69s1V7m2b6h5dRC?=
 =?us-ascii?Q?bbMkYarqPGXZkyaSpPEEiGMEcrMkzJPSzeSIm59Uv4Z3Bq5Kh8vIspXJCTAm?=
 =?us-ascii?Q?04+Rup3XEWttfyp+fvKSy4RZM67mg52OlfYk3URvvPXWtFgA5ldP7UC8T41j?=
 =?us-ascii?Q?dLlA2kMoShYS8ysqYZTXDYSXwxUmHNYD233LUOPB2sHzwgZq82qZ/Ac1fSfX?=
 =?us-ascii?Q?XVJUwqRnL8RHUVE0p/ZVVK03PsULjPqDYPRXg1yEMekVoQH9pdxQJk3pxi2b?=
 =?us-ascii?Q?Wpvxxn5xoz21lCHk+I+sw3sms8A4LVUgEPA+6QDMXdhh/QLOl5Cj1uy8QBL5?=
 =?us-ascii?Q?+G1b9SLq7MdbBGgW2WqREA27AHWQppv/44OxlCqEbOuPaq5e5f8zuaiQVUYe?=
 =?us-ascii?Q?B3c8Xk5PfNykYPPhbYtYmYY7XqpVGlVmT++KD6Ohp6lhzy53VfOiJeg1z7bK?=
 =?us-ascii?Q?R4cXDRG652IrGd4siGqOTAA5oKHMeXFWGJmePzRU3oEsUYYIPZBNdPVW8day?=
 =?us-ascii?Q?Yxp+XXOZcMjUPrkWwycHjSaAqygrUCt8eUzFODlP2a9S2mQobt99txSRoTyD?=
 =?us-ascii?Q?Wgo5bUHpPtKM3FtFE86uoYvtDZjvEwfUrHxE9QvlzAmT730bkt1+XCP2d6J4?=
 =?us-ascii?Q?Ytkn/jC8opCd8TYl1EwjpJwHe1kjHOzjCBGFCEF/Ldo2JMU34OVpRHQo9397?=
 =?us-ascii?Q?pjn/IVK2EIe8ZP97C93jDgiAOaNDpEzxgjr6yJlNf+zb/LjFG+GdBXc6FCK7?=
 =?us-ascii?Q?xIsH//umudaM6hKRCeJHkzRzjbnh8fYfJBB+pLrUkpkPRz8BxRsqox3HBYNI?=
 =?us-ascii?Q?RU7xtUHItw3Soyr5esZCdmE+qi5i3wTyrxwTPkHE3LaDl+4v/kMA0XHHjXC+?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccb4d42-93ed-46ac-f4a9-08de2be5b798
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5969.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 05:44:36.8244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOgVWI2irQxyx91R90+9Pjjw36ja2L8f57Y/S7gVSjEBRoctjWGHvFb0EHNCLb3r0eyfJ6Sl/XbWVKXUG0cUtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: 2b2f7d6a04d65c2ebd53f9e5d3de6b55635d57b6 [5/5] BACKPORT: FROMGIT: userfaultfd/selftests: add test exercising minor fault handling
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251125/202511250335.lSphn3Io-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250335.lSphn3Io-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511250335.lSphn3Io-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   userfaultfd.c: In function 'continue_range':
>> userfaultfd.c:296:65: error: expected ')' before 'PRIx64'
     296 |                         "UFFDIO_CONTINUE failed for address 0x%" PRIx64 "\n",
         |                                                                 ^~~~~~~
         |                                                                 )
   userfaultfd.c:59:1: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
      58 | #include "../kselftest.h"
     +++ |+#include <inttypes.h>
      59 | 
   userfaultfd.c:295:24: note: to match this '('
     295 |                 fprintf(stderr,
         |                        ^
>> userfaultfd.c:296:63: warning: spurious trailing '%' in format [-Wformat=]
     296 |                         "UFFDIO_CONTINUE failed for address 0x%" PRIx64 "\n",
         |                                                               ^
   userfaultfd.c: In function 'uffd_handle_page_fault':
>> userfaultfd.c:498:17: error: unknown type name 'uint8_t'
     498 |                 uint8_t *area;
         |                 ^~~~~~~
   userfaultfd.c:59:1: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
      58 | #include "../kselftest.h"
     +++ |+#include <stdint.h>
      59 | 
>> userfaultfd.c:513:25: error: 'uint8_t' undeclared (first use in this function)
     513 |                 area = (uint8_t *)(area_dst +
         |                         ^~~~~~~
   userfaultfd.c:513:25: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:513:25: note: each undeclared identifier is reported only once for each function it appears in
>> userfaultfd.c:513:34: error: expected expression before ')' token
     513 |                 area = (uint8_t *)(area_dst +
         |                                  ^
   userfaultfd.c: At top level:
>> userfaultfd.c:699:33: error: unknown type name 'uint64_t'
     699 | static int userfaultfd_open_ext(uint64_t *features)
         |                                 ^~~~~~~~
   userfaultfd.c:699:33: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:726:29: error: unknown type name 'uint64_t'
     726 | static int userfaultfd_open(uint64_t features)
         |                             ^~~~~~~~
   userfaultfd.c:726:29: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: In function 'userfaultfd_zeropage_test':
   userfaultfd.c:934:13: error: implicit declaration of function 'userfaultfd_open' [-Wimplicit-function-declaration]
     934 |         if (userfaultfd_open(0) < 0)
         |             ^~~~~~~~~~~~~~~~
   userfaultfd.c: In function 'userfaultfd_minor_test':
   userfaultfd.c:1093:9: error: unknown type name 'uint8_t'
    1093 |         uint8_t expected_byte;
         |         ^~~~~~~
   userfaultfd.c:1093:9: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1096:9: error: unknown type name 'uint64_t'
    1096 |         uint64_t features = UFFD_FEATURE_MINOR_HUGETLBFS;
         |         ^~~~~~~~
   userfaultfd.c:1096:9: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1107:13: error: implicit declaration of function 'userfaultfd_open_ext'; did you mean 'userfaultfd_sig_test'? [-Wimplicit-function-declaration]
    1107 |         if (userfaultfd_open_ext(&features))
         |             ^~~~~~~~~~~~~~~~~~~~
         |             userfaultfd_sig_test
   userfaultfd.c:1136:58: error: 'uint8_t' undeclared (first use in this function)
    1136 |                 memset(area_dst + (p * page_size), p % ((uint8_t)-1),
         |                                                          ^~~~~~~
   userfaultfd.c:1136:58: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

