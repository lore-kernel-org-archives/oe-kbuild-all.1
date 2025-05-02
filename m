Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756DD239086
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746179756; cv=fail; b=JKwsuWPm4tUjKCRmpJPFGVtZ7/AwASjB6inORZKkpTxMShyQpFyNZ58QYN1ItU/l9SaDKoAYh6TYm5J057d8E4Y1V3FGZF2KSsiMoRFARH+3Nwwl//7sJkL0Taa1vY0UJ+4iupeomTDziSNEvVzqFG4O+cCuTel57Z9e0552+tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746179756; c=relaxed/simple;
	bh=s9UCy4igc/AM4VLe1Wn7q5IJ+5BCPCcuiSRFtfs7P24=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sdf4jTtRSoiW1GVyUTS0Had94AVtvJo1JEPheJPMUsGozoK06kBjtQNvGh+AKVw3KhDUBkn5MO5nvgEAplI5HSwlOQj+iXnrbjcYHlOWcO1/ceVC2tnilj3yMIVacPdayMfL19p9HW9psPfSXvWO5LF2akhF/pFCKvwxFNE+9ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebJvtAou; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebJvtAou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746179751; x=1777715751;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=s9UCy4igc/AM4VLe1Wn7q5IJ+5BCPCcuiSRFtfs7P24=;
  b=ebJvtAouAMNILx59jseokys0bqIJrE8KRLCf3+cUsnXpDDm0GFvoTrme
   RgJtcggR62qB3khm6EPbopZjXJiLGNgoCHL5bJ/a/SgaiysGe5WyBLmrB
   GHj6E2i0iZIcvtA6GjMbmBFX0gV38cCE7As0qG9Ceqq4G92mXGc57qAWG
   BVK+E8wb+O3F+oycZDwTTHq8BPznYYaAlwoPUswlo/tSNUqWIg7byMpxl
   yfOClVUe1w4R/upC7sgjNLMjxdveCN3TDBmoD7163XV/JHKnaE/G9VNVd
   N7YlZU+3UqwBhMfbux+UGAz9LYwjo3g8t5/e7Kq8k0SQHqBMf5GHe6/mk
   A==;
X-CSE-ConnectionGUID: M0hieo/xTKSZQOrsIof/Dg==
X-CSE-MsgGUID: jVZfrazxRISWcbJ3H8mdDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="50516779"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="50516779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:55:50 -0700
X-CSE-ConnectionGUID: 26mTaSu+T7WC7ptS89oszA==
X-CSE-MsgGUID: hMs3a6TURliQ4g8R1v/raA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134353639"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:55:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 02:55:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 02:55:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 02:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=go8n13rsb6OjrLgyXRjsHMnc6tjAvHCnctL9aYVkpZqeIF0e3/T88VR2wX9GrMjwOsQ5Eif8udYZBZ+DmE1HZYaTqxjagfj5/crAh0TXblMcxVNwqldiM4rOfWnEeTr+1zgvuslq5MpYE1+cPlO4GrTF9wBg6wv60XZ4P2wKAZL/QVf70catWTLCZDUmf3S3fAqhqnwNSU6U15A+cuSBUqw74IYREswstaoFCiNURsu4ilC9aBVDB+UBlHI2a2Ro6qhB71JP/egsIhq1wzBlwjffkzIEhX7o3ppeFzT0oyOMFSCHVIz4JNM3OE9Y+yEwoYDakmYg0s8JFuAv3wYItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAOC6ayB2S5094YzrXHJQx+iKRt0UC5hfEfg9ujWh0s=;
 b=jhwkUQN13IF5KmSVakc6FcabuP58eABy2YvzdoVYEgAXzorWpq9AE3/DYfOSVn6gP88pBUnzGz1vLk+16FPaNUt/ynVc8gUhEdpu4PXoMRlllebSCweuWVYQVB0H9tfzcEkYO8ZWUmoXU+s6MqXIND5Faq7a7Xb+Ax53mK90JCiaI0mlLyHKyllknpH8BiLyDzJFfx59lpO3CoZd6e931rDbvOny2DDPxufdv9fGW1YPdwgw0YIJ9QellnE1CdGiWAx/T/vVSSE71S/+I1uZHhInYCNAA7cSJMa6Q9iFcpCFLKCCMvkOrPyCdeB7xb9PHp11tkHJs9/DKhbLNejWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SJ0PR11MB5152.namprd11.prod.outlook.com (2603:10b6:a03:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 2 May
 2025 09:55:40 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 09:55:40 +0000
Date: Fri, 2 May 2025 17:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH 1/3] gcc-plugins: Force full rebuild when plugins change
Message-ID: <aBSWlbas+kZVvR96@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250501194826.2947101-1-kees@kernel.org>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SJ0PR11MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f45047-e06e-42e4-33ae-08dd895f7e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mamj1rFAIEkxWMkjPU97hAwue486rA2ntVfDqvub883IK6t/k4mS9RILW01p?=
 =?us-ascii?Q?ii0waT+q7SE/FS71i0iN5WNVDPiAuYo9ZXneKJ7jyUKUdopWt02bnniFTyL6?=
 =?us-ascii?Q?IICej1zTC+D2y42E5t4PpgJxr9529R/0y7l4iaILfZiKOWsnSPqhaXpIg5A4?=
 =?us-ascii?Q?VAE99KdqYb1BNsVQOOcJqNgO4DwMwGK9LiITfmxAp/hkWmslM8RqLkzXnzXq?=
 =?us-ascii?Q?rNHx5F/UlHAdfDNpZrxsVyNxLqBSOhK1jQu2JpOwVTdkLiQreTM/xKcHHvaJ?=
 =?us-ascii?Q?Z1tYwbtkHSL0RYTEUc8Ca4V/Sven/sWWzgXhU+3R30MotpEYJEMEAP1KV+Mc?=
 =?us-ascii?Q?1H1JEKtElvHoyXvBAhMIvLK0jH8x4IsgF1x5QqoWBTHIx3GRITpIbiw+4llL?=
 =?us-ascii?Q?exObknFJVIWCW0tNP34S6NIUSzny2WKrSesBLwLl+vqGi9RaAx3AmNITcdkW?=
 =?us-ascii?Q?j2qKO3BHFh/RkVRX+LaHa+nScKQomZiLfAhxvg7iiEjcFI5JySHyLqrJw5NL?=
 =?us-ascii?Q?89zeYiRposrnA6liTlWCrx87qHchjICnWoje/Yn1aVi7sIkhTd3JRrPNBGBy?=
 =?us-ascii?Q?+9iAQXhP0cl1WsFJaTcrZwWcQlUp/w4sSfYzvgOl0ZbQJwLd/VHrWFwIdm8H?=
 =?us-ascii?Q?7LAHHS8/epBBeTV/XrINTf9q5kfIKBncz0MNZfjX7wn6KIlyZVPP47v/w05x?=
 =?us-ascii?Q?32t2+TxHw2sdwtlpqqGuj8UnNpsJIgYrFyu9sGDjtH+FzWuDt+8RxN055z9d?=
 =?us-ascii?Q?pfM7GClMbVj+9Gg59Z1aZyVAWpppdskacw9IXIQvq/jS0LWOWOyPAuG/0vj8?=
 =?us-ascii?Q?t93Y3JJR14agGONt1+ZcH52nznd2QNM01UyB2pyiDYmoA0xhvDzh3IxSh0EB?=
 =?us-ascii?Q?RFB4UbVFdMcxR9254kfGgSUbFH1sVHJi1HBVr2S8KrgAcq2UlKwm3ZBWno2P?=
 =?us-ascii?Q?VV9+nRWCwdCOBY23Lr92HM1gn4BLRmOBa179RXNcsY9kY5lJu3R25mxFJZqT?=
 =?us-ascii?Q?r55K3YmcE6Pj3wS4kn1RagLZt9OMGJ6KtGqU9rCuXEgCXpInY3ijQ5bh9GZS?=
 =?us-ascii?Q?fAQi4MUk6ADVnMcuuJKmmD2wEaswEFYgM0PeY/EkmrPcBumBED3kZYN82dkn?=
 =?us-ascii?Q?VKyW+MjkAjOpdhQtAXkzJV4TgPciK73whKE60vF6sbsjwB3VGPt6AkvPguSf?=
 =?us-ascii?Q?GsA/e6cwGssrkmve21nKlRD3Yno0EpzeFj7Ex5HTkQIYuNUuyYNK/VtjH+7W?=
 =?us-ascii?Q?gDMY0veHhl5wdGNakTnWnpBoLN1D1KQLgks/eWO4Q9AJzkCAebgO8dRSfb72?=
 =?us-ascii?Q?44ECTEWpbHaY2L8zeOp92Q7FUMUdiWiJDfZdmwDQilPqM5gaAb7YtKwYlI8y?=
 =?us-ascii?Q?ftBVcz95V7d2uiTr6cmOuvl5PNzf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6VcAWngsc9HpVZw7DhTj89D6QrNZG4QeFuQIb7K7IVXrqvGP12Mas6k7PlZ2?=
 =?us-ascii?Q?D983u6zjzx1YpuHhHkaW1HKctO6FS4ojSGoTP4SNx+gZ0bwWTJxNe6UiYNlX?=
 =?us-ascii?Q?/2/BuJ02rVEEiw2e5uXi/v5z5I8IPB3q1B6JZI9f8g6Cxuv+uXQvXHOdUJTh?=
 =?us-ascii?Q?Rrvk94fsOy3gWpCP11BFrOpG1dY8SQGf5XBpKhzDoBx5wec9wrsWTRa/VHTD?=
 =?us-ascii?Q?jT+PSPe2e1PgdT+n0O1eKl0777vL/6uLrJord0pxsKosfF3IZVISs8YjpuAY?=
 =?us-ascii?Q?nTZP0B6KojA7J1rsDByOvalKNew56rzER/G4gOzwbmNymXg47j29Xm+KNvje?=
 =?us-ascii?Q?6JfqhrUyB+NRJ5WvlceoDmr4oN5OWIsT2GYJpGIvhryNS7fVmf6dfv6uOi6T?=
 =?us-ascii?Q?mCY8eg5QN38RMNrQx97Xcfy1GlOO8vITqe7i01kg5W5RYgki4/hycbao1Pby?=
 =?us-ascii?Q?kGIDRWgvH+hX++iX1bDrwMGTZe0Ym1gCbCa+BR3S6gnGBFDAiBYxJQP/fPE/?=
 =?us-ascii?Q?ziC3632A51uk8snSbyzqGB3BrhUY1wrrpd0zX1ONx/esYjqL2NL2IuydpMEM?=
 =?us-ascii?Q?6voQo8QFoJC9KycQHwLsSpa2G0+SB1xvYe9YGrtVZ2Qb0FiVk6GlYj35MxhY?=
 =?us-ascii?Q?z9jGNga/ZBEk2pguYkfRCTx4jN/BnbNeEkxTbvHtoez1I8+RW7sVHC/ZcvZQ?=
 =?us-ascii?Q?+FaLLsclShsH+5hZZR7yek7smyd/TKyASIMKkwgPGqAh6YPgsbBZlcXmnsf9?=
 =?us-ascii?Q?arSvm4nt5PAz2SiRfK3KzYPt9p3A3XdCSxWlbxYT6NCBQiLNZFaNIApTIQlM?=
 =?us-ascii?Q?RbIUOGvosIUWV2tzRkph1iwNF723G9/6AxTvMrJ9xOVUnvtZODckyDRFS28K?=
 =?us-ascii?Q?zdf7FmigzeJKug+R8Utk8PtFJxLGiyUVM1wFslxWlkoDZuEEfJNhqtbHe5ua?=
 =?us-ascii?Q?LtdLckgShUuL/K+kz6fSWICaZwjbvEuoANCUTzU2Hc6/fTDzNhGsN/Lqsnjf?=
 =?us-ascii?Q?NZWNS6Z3qOwo8C4TRWhTaIt3oMZqjnP4+J/ex6KZCXzdLCyYH8nUtswF+/e0?=
 =?us-ascii?Q?NN+mC3OISVGGvw5kW91zeo1eOE3+W/vBDSeU81wSJezB+JBehMDM4D1TjRLW?=
 =?us-ascii?Q?1SRcGL6B9u3aqbbapxJeVUQ0J2x9vg7Rm6AUNlFNmIHM7dZ9yONnX/JS6vLL?=
 =?us-ascii?Q?bjs5jCPHdcelMwfROhQFzzWKF32PtyNNiFkmWXKnTwmvJ/HDSbD2Q8XHPmVa?=
 =?us-ascii?Q?D2w0pkzyn1MeRC9VLl+WSC0ywL4t9LXK9mmlZGBo2fJw5/gle/54MCe1uPqM?=
 =?us-ascii?Q?iBK+vS4pEwxynUL54XULThbAXoIkVL+/5Q+rP3mkEfSjt1bP+g9Lr7nDzi8o?=
 =?us-ascii?Q?DoeXWUlRq6o4Gq+NN2xubtae9ME8QcfSA8l4NQM4A9edhwZFnQqd6V0UEIQC?=
 =?us-ascii?Q?rlHC+GnMxf/nGRtFnqM6eGtHHeE/PPEIvHABpH7MxjxYIcsjxvLLKsGurxz6?=
 =?us-ascii?Q?u4VEw+yO3A1nZ+dRLwD5ITh+yoW8zGihMLnaHhZoeYm9KMzGFSOfVP36M3TO?=
 =?us-ascii?Q?v6Vi0G3ko7InOAzZuPuye1sMcRrmFW/ioDlFwlU4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f45047-e06e-42e4-33ae-08dd895f7e90
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 09:55:39.9477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /atOgrzrq7X4ksGV5lxrpX5TtP9VmwIFHNdw9VmvtYoN87d0wdmaKIrL+UW/G3hjlDydtsVzLNp2fBQCKBETzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5152
X-OriginatorOrg: intel.com

Hi Kees,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on kees/for-next/pstore linus/master v6.15-rc4 next-20250501]
[cannot apply to kees/for-next/kspp]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/gcc-plugins-Force-full-rebuild-when-plugins-change/20250502-035038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20250501194826.2947101-1-kees%40kernel.org
patch subject: [PATCH 1/3] gcc-plugins: Force full rebuild when plugins change
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021403.blhkPRXG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021403.blhkPRXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505021403.blhkPRXG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-gcc: fatal error: cannot specify -o with -c, -S or -E with multiple files
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:203: arch/arm64/kernel/vdso/vgettimeofday.o] Error 1 shuffle=1304459473
>> aarch64-linux-gcc: fatal error: cannot specify -o with -c, -S or -E with multiple files
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:203: arch/arm64/kernel/vdso/vgetrandom.o] Error 1 shuffle=1304459473
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[3]: Target 'arch/arm64/kernel/vdso/vdso.so' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:224: vdso_prepare] Error 2 shuffle=1304459473
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1304459473
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1304459473
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

