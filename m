Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B4118A950
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 09:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725961063; cv=fail; b=fZ455XWR6qutO6VAV6RBfIuy9Bd0zxOGKSyHv6zwnSanRt5cKuy9AV90xoDDi+dckE/Q2HMuHfDb4IexMkl7vEhIcELtR913TlYzvlhxcSc2505E80JayU7fe/pDWJm6JLJX8WvyWjT2gUxSvEjiW/+yJtddmWms1GWXjd/z8Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725961063; c=relaxed/simple;
	bh=onq85EQ7DJ/QfzT+5ig44fknBOlfzzjWtJ02HJfjQgE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YSYN4Q5qFgCBei8YJwsVGqzkR54Iz4ev6CgeJF8+86d8Z6mdqxhv0RKluLqW1IgnpQGnoPr9etfRs2QSMnkKo/0pXb+dNGUGbT8z8YNx42RGcq0Je9gQVYrzqTncjSemVY4xTnY0xmNKDp1FR74s4weZfzMXvCNGcmTSEzrCkkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEVZT4pq; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEVZT4pq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725961061; x=1757497061;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=onq85EQ7DJ/QfzT+5ig44fknBOlfzzjWtJ02HJfjQgE=;
  b=iEVZT4pq/3re96tCzgkosTrvybJ7Joz6DfkbbSaBNzZkrJoW3CGQYVKM
   6e5LvdwHqgDRh5Xaoz3BAi1/wZELhlt19mPtMFdQHDClMlYCvTowEHtrD
   hmsPZehHOd+q7Ijs6QDeE1u4XKDPhvlnNUs7dHptnCgLoZG8/y5fyISvr
   13gPgGt9Eh9EQ1MJi9+FS6wdhV5InEFXCw/oiZl5BCXWfWkS+Fe2CDY1M
   rM2KrRMV6iEYwib/Tlb4m+ugidhx2OUiKCwPKoB8z1qDEOoChMnxjXZle
   iBPZt8wt/q2Ju1r8weWpZtzMk0Az/t9cFrXG4jmPeA+uOhlhXgev9fAQd
   A==;
X-CSE-ConnectionGUID: elYzhAS2SxKl7tBiEIePwg==
X-CSE-MsgGUID: MswnwO9/TNuiR/QEnDY5bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24511153"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="24511153"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 02:37:40 -0700
X-CSE-ConnectionGUID: FypKcGjmTgeN7M4e30auaQ==
X-CSE-MsgGUID: Iz0ktYfaRFe4bD1vI5U/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="67219837"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Sep 2024 02:37:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 02:37:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 02:37:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 02:37:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnqCf34VBF/KNSKE4SWR9eM+dNykciT90Pb/fT8zde9KIKn+qY7rJ7E6RUYUlbJzb4nM41X03qBKsk7uPeBwzkr+FXz0UG8T9BLeWqvuHE+dha1HcHIKjl5yomhMSaW9uP8Fzc7tkfffiPKbsNBC4h0zU0EsvQ+aUHZR+Pxa62QtFc9trKo+EXc16mdqRVQOsnTUzCki1nq7Gl0UoODG0p5KW/5RhH+B0hHoB7HSUNvs9lBuWJSfOTKwBZB44zJ7a9cUSBVfFBelSC5iuG3943XFA+Iqucgnj0o9GnEH60USzVTYSCNgfkZ4Glz2n30T0HeQ9WhPeTRsiEBr55xBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8vbPYhCIFhngUoPLUpUBugoI+wTqSBnuMo0vFy9Azg=;
 b=YvcoDZdKkew/xMMGHNvZhb9HD9eEQuu/LWRXTTIJg1kNc8xjrZVfbrNC8ud1amfTSzy8Vw8i4Z/QLbrinaUqArWDMmiHX447RIiYc+LOSekdFFs6tuVaxfZeL8rqsMTjAEG/EV1l2v/OJarELZyoaTR6MJ+UjarPlbz+v1eOdq2v1szKCZ992YHepfpcGUzprX147sZhXMscPHR/3YH2sSqgQq7vy3DlFD5OXTjLJ+127I95WBZ+f1e5xmbSWuJI9IDWcZCMcIQ1hUN6PdirkJeq8s+AaeyWTdvSxNq7uExnWRLwIGzayHoYXKxbQWdyZ+QtMXCTpH2ocMfSM5TCfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB5069.namprd11.prod.outlook.com (2603:10b6:a03:2ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Tue, 10 Sep
 2024 09:37:31 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 09:37:31 +0000
Date: Tue, 10 Sep 2024 17:37:22 +0800
From: Philip Li <philip.li@intel.com>
To: Pavel Machek <pavel@denx.de>
CC: kernel test robot <lkp@intel.com>, Nobuhiro Iwamatsu
	<nobuhiro1.iwamatsu@toshiba.co.jp>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [cip:linux-6.1.y-cip-rebase 190/438]
 drivers/iommu/io-pgtable-arm.c:1185:undefined reference to
 `alloc_io_pgtable_ops'
Message-ID: <ZuATUsFNnWxyZrKM@rli9-mobl>
References: <202409101626.sNel54m0-lkp@intel.com>
 <ZuAKeKb/23ZqSltA@duo.ucw.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZuAKeKb/23ZqSltA@duo.ucw.cz>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ0PR11MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 01031390-d7e2-4a95-5f95-08dcd17c30ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jMUgRT+3b6xW/hljAn5tE1prrUre4QCQvZ2WUo1PXBt8iyirXrhbuwOtbYJg?=
 =?us-ascii?Q?bV8ipOQdYWlocgIX/6ou4efalhdVNUS1MkK8bMzKyT4PQPROz+4YotLJkPqZ?=
 =?us-ascii?Q?VXWPLMX04CoEWZbvcqyf+yDRcjtR6JUJJaghC1ic2uHRoLXL5kSHldiMYRQF?=
 =?us-ascii?Q?BFkyKQikGH6x+PelaaLDtk731cpepcmrLS0CFj6LwPCEk60IvQtrFiyOw9qK?=
 =?us-ascii?Q?uZ2ZbHPI7tuRsRiOcM76BXchrW+5RiI2WebhTfYjCbJGgOOHYHHeLKFeb5VK?=
 =?us-ascii?Q?N4f8ZLZGZyoadhHuavISly81zxR4kMKlQzrUn+WjitrbSSbYr/zP9Jz74Ttc?=
 =?us-ascii?Q?DU69srwZyzk8tpGl8OvTSyVax/ekkt8wTCHCQgKefTovXh/SifCaiYmPkCpj?=
 =?us-ascii?Q?AZgAcd2aJwEc/5ax8PpQpcngh3pwvurwmAaYhwUli/YQ1tMgPsreUqbFj/bc?=
 =?us-ascii?Q?j7B5Srn8DUsrU493ER+TK+yA97hCYhjwkVNmBjswYZ0yXIO/jtted6DZRVPJ?=
 =?us-ascii?Q?ZAJe20BH7OMMr+JG91NO/yrRTlT/sigr5u3MLUu6ALgVxcUesRtEEnOV8xZA?=
 =?us-ascii?Q?uRC4vrrSw5yc54kVh9f9HHrMabW9FrNnsvReJ2mtujzKDnN+fhkDS7KwQg3S?=
 =?us-ascii?Q?zbYAvIVl+EpcutFmeQrFFYW3tnPFq1FHhDr9Z5ApqwIipAlVPN8R885c/0PP?=
 =?us-ascii?Q?7S1BBTEwynfLVUYm8c5N4xGDBmTJAFmdE64topg+plseLzhjP7oJNzzQtZRk?=
 =?us-ascii?Q?RLR8l2TIoARuI0K8FdgNE89IOWVAJg8p3mKhbV+gkXxXj52wcfJgpr+2rIBC?=
 =?us-ascii?Q?oqT+I5gD2C2t8U/C93Sctgl88j3BUp7M4dgTrOmmmtCMnbKws6YBpjCjJFOt?=
 =?us-ascii?Q?eWRP9usbPwaUbt4z4Kkw0+hVn8SpUqNbnB7/07UjlkTm0/wkZcdMkNFJ0qf5?=
 =?us-ascii?Q?a2z+SS2vyFeSGJXw9minGiyDzUh4z4jFxL3jTo2wrBESKwRMKFDkcWfSxVDx?=
 =?us-ascii?Q?FUDt41ccc2wdSK3D3IBsIa6O1VM977+55svjZW/RDTmPYPVTdD32wyJDFURW?=
 =?us-ascii?Q?RYNPGM3niCM+TWjO5E9yKDvIsGXvfW1GZTfJvhYGxQCmm6m8bxs2aQcl1sba?=
 =?us-ascii?Q?zL03RVuiWyrd+8jvTIOFQbOtHhM0RQcZdyZvropBWPBOhOZtW5N353Gbk2WL?=
 =?us-ascii?Q?L3FGJDvakoZuPKHtgr/IiH9/GhWUwyA5wnMs09F7K1Z5DgRP/SOCSK2ADQtb?=
 =?us-ascii?Q?1/8DQpfXgZhUUD3mXuZHye5MVy9mjKqLqajx3tfehCEyTSFP3S2eETLUBrIX?=
 =?us-ascii?Q?Pka+f+HjKxnrSdWojvlqELO7IbfcsX+OXavaT/0p87mjSN7vaTph/sucz3kX?=
 =?us-ascii?Q?+I7L5s4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gcBDUGpWlTh2fmJtfePrgkn1W67PDnEVkzPg9zSVjWC8STay/1I4b6/msr/5?=
 =?us-ascii?Q?q10LCo4jwso+ERrqWT4L3ohPEm5a9Hk+lTH6hXS01ExUjLvCsM2D+VQgzPtk?=
 =?us-ascii?Q?6hxIILdomvNQOde9sb+gmTKHpTZmHaET7TkLDYAijEOerQkiYCoSARNwDMJw?=
 =?us-ascii?Q?L/jBZ7lfW093mNQ+osPLQOZ+lFl65HCyw+ZEUcguU7MCw/+08l3dpb4OpkIx?=
 =?us-ascii?Q?MiyBd6WF21IuIrWJRjn9vvVXGRSDjA0Em0qzDwKgCr0FD0IAnBbVsBfyP6yh?=
 =?us-ascii?Q?Uvtk7fb/Xrp7lt641cV9Dmm6k4uXUmrriLGdZX/0sX7CI9XJ9bINYtbQfCFz?=
 =?us-ascii?Q?/lVAtrhJxLWvz+G1xounFPz7zVMJb6xwPLpo6MA0Sn2M7n8OXEOM+EvlQZ3b?=
 =?us-ascii?Q?ahzpbYGbxh7v1+asuxgkRhmJEV9lfI027tQRVILJPINCdupq6dbpx7fjyuBp?=
 =?us-ascii?Q?uudsv66pHZ2/cb+6VAaSAeZ58Q8RoTpBgvrWyHPOy+b2nFHjlncw13Fb/8Bd?=
 =?us-ascii?Q?NXW1eJCokgYG3XnLqCupkK3qDbUjq3rT/mSRl3BOCM/M1qvaLAMiB/d2NBxY?=
 =?us-ascii?Q?3X4YUBj51MpT7rA+2MuK9h00IlsMdqubPW6SMrvbZMWiKwFjeTN+UGdsxxpL?=
 =?us-ascii?Q?/hPhTPuJiT5/afToAulFvjby1ypKIzNBmj5fP59x0gEzAPJmKC+YyF+pEHMF?=
 =?us-ascii?Q?xiIq4+/oNm1dwzarCeYgWdO96mmvsJtbHCfR8NLB5/JKJ18Fzfkk0wzwMLOV?=
 =?us-ascii?Q?F/x/CJRDnX+30/VSwLSRPDaje7zjOUnnYiJhQUXqDorfFVSnw3DJjtxC8qQR?=
 =?us-ascii?Q?fz1iW/V4xd3/5b/8zaz3zaeGqg/nJeGipkVkZPEntJ4VhGhrmKzKy0xd4myL?=
 =?us-ascii?Q?kQMGRIynY/fajjfHzg2I6LQ5B3k7vw5Z/pikSEiItsCbTXmKJBJtFmL4UCid?=
 =?us-ascii?Q?J4QF/PYFSevwMDL50yeQrBW4jL/7URv5Yp0KSgMvoDkCeOJB54BoQHL10DGW?=
 =?us-ascii?Q?nBnT0QvI7V4OztBjEFVa+iUbdqanI0E5gELRPg2cN97DESYJiRR4xpuSNk3E?=
 =?us-ascii?Q?sXE++Vn01MKmya3x2PxNCxSFqZAhDflfTTBp/+kfzkoYtH0HkfE+mB1vpSw8?=
 =?us-ascii?Q?FAyAxtUhgL+T++3OL8ktA52GWt3Nfe6qAwDd5gwORt/V6HodEaC+JqqOj8WP?=
 =?us-ascii?Q?jK+goYX9CNs5gu2Gy3smgfPTfnaPbqcfXwgLhp8ro+pM8KPn8r97+0uhK2u4?=
 =?us-ascii?Q?0kCobvgiQevqQU0uTHXGi2TFXanclMy5Hu9vJdiSbGRiPQNqXz+ml7+yTDiG?=
 =?us-ascii?Q?18vre2qBDyir72ay426SXt+33lswef3dIDEhRVhxDasENqdK/g2GTYULLx+a?=
 =?us-ascii?Q?w6PFCG8krrhSJvb/0XfmeS2ZSsg/Q0NF4K2wPl1io1sxvRLymvWdy/ME5ytB?=
 =?us-ascii?Q?9jfSuS9dU0gNiu1O3YclAAplrZCNyO3zRekuxfVX0ITb3eLHTTwIUL0iq5Q+?=
 =?us-ascii?Q?imvDGKk3UzGp3v99TzFUB38bxY3XadRuEqYo+hg/1ELyYuEvkq+w3zJvLPX6?=
 =?us-ascii?Q?lj/cA+DnWN/3dMt13XYwKUVann8Z4qePj6hf28c6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01031390-d7e2-4a95-5f95-08dcd17c30ef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 09:37:31.0504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPeoS+H541ZApVZtuT/hwWIlnKSkeqi5rXnCoQxWH/JqsjY34m9wnduQzXoMtE0BN1GixMwSzIt6BkLDCamX9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5069
X-OriginatorOrg: intel.com

On Tue, Sep 10, 2024 at 10:59:36AM +0200, Pavel Machek wrote:
> Hi!
> 
> Who is responsible for this bot, and how do I unsubscribe?

Sorry for the unwanted reports to bother you. Do you mean to ignore the test on this cip repo?

> 
> 								Pavel
> 
> On Tue 2024-09-10 16:08:15, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rebase
> > head:   fb1857d56e47961f0e5a291c3385b88f610320e3
> > commit: 16cf7a685142727e637f16ed7d9de15b7a32a753 [190/438] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
> > config: riscv-randconfig-001-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101626.sNel54m0-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 14.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101626.sNel54m0-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202409101626.sNel54m0-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `arm_lpae_run_tests':
> > >> drivers/iommu/io-pgtable-arm.c:1185:(.init.text+0x212): undefined reference to `alloc_io_pgtable_ops'
> > >> riscv64-linux-ld: drivers/iommu/io-pgtable-arm.c:1257:(.init.text+0x792): undefined reference to `free_io_pgtable_ops'
> >    riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domain_free_context':
> > >> drivers/iommu/ipmmu-vmsa.c:361:(.text+0x7ee): undefined reference to `free_io_pgtable_ops'
> >    riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domain_init_context':
> > >> drivers/iommu/ipmmu-vmsa.c:439:(.text+0xc54): undefined reference to `alloc_io_pgtable_ops'
> > 
> > Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
> >    Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
> >    Selected by [y]:
> >    - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
> > 
> > 
> > vim +1185 drivers/iommu/io-pgtable-arm.c
> > 
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1169  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1170  static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1171  {
> > 9062c1d0bedacf Christophe JAILLET 2019-09-09  1172  	static const enum io_pgtable_fmt fmts[] __initconst = {
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1173  		ARM_64_LPAE_S1,
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1174  		ARM_64_LPAE_S2,
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1175  	};
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1176  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1177  	int i, j;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1178  	unsigned long iova;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1179  	size_t size;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1180  	struct io_pgtable_ops *ops;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1181  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1182  	selftest_running = true;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1183  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1184  	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
> > fe4b991dcd84e0 Will Deacon        2014-11-17 @1185  		cfg_cookie = cfg;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1186  		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1187  		if (!ops) {
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1188  			pr_err("selftest: failed to allocate io pgtable ops\n");
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1189  			return -ENOMEM;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1190  		}
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1191  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1192  		/*
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1193  		 * Initial sanity checks.
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1194  		 * Empty page tables shouldn't provide any translations.
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1195  		 */
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1196  		if (ops->iova_to_phys(ops, 42))
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1197  			return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1198  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1199  		if (ops->iova_to_phys(ops, SZ_1G + 42))
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1200  			return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1201  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1202  		if (ops->iova_to_phys(ops, SZ_2G + 42))
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1203  			return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1204  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1205  		/*
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1206  		 * Distinct mappings of different granule sizes.
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1207  		 */
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1208  		iova = 0;
> > 4ae8a5c528c0b1 Kefeng Wang        2016-09-21  1209  		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1210  			size = 1UL << j;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1211  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1212  			if (ops->map(ops, iova, iova, size, IOMMU_READ |
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1213  							    IOMMU_WRITE |
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1214  							    IOMMU_NOEXEC |
> > f34ce7a7018c2f Baolin Wang        2020-06-12  1215  							    IOMMU_CACHE, GFP_KERNEL))
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1216  				return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1217  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1218  			/* Overlapping mappings */
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1219  			if (!ops->map(ops, iova, iova + size, size,
> > f34ce7a7018c2f Baolin Wang        2020-06-12  1220  				      IOMMU_READ | IOMMU_NOEXEC, GFP_KERNEL))
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1221  				return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1222  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1223  			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1224  				return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1225  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1226  			iova += SZ_1G;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1227  		}
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1228  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1229  		/* Partial unmap */
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1230  		size = 1UL << __ffs(cfg->pgsize_bitmap);
> > a2d3a382d6c682 Will Deacon        2019-07-02  1231  		if (ops->unmap(ops, SZ_1G + size, size, NULL) != size)
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1232  			return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1233  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1234  		/* Remap of partial unmap */
> > f34ce7a7018c2f Baolin Wang        2020-06-12  1235  		if (ops->map(ops, SZ_1G + size, size, size, IOMMU_READ, GFP_KERNEL))
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1236  			return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1237  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1238  		if (ops->iova_to_phys(ops, SZ_1G + size + 42) != (size + 42))
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1239  			return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1240  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1241  		/* Full unmap */
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1242  		iova = 0;
> > f793b13ef0c9c1 YueHaibing         2018-04-26  1243  		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1244  			size = 1UL << j;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1245  
> > a2d3a382d6c682 Will Deacon        2019-07-02  1246  			if (ops->unmap(ops, iova, size, NULL) != size)
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1247  				return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1248  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1249  			if (ops->iova_to_phys(ops, iova + 42))
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1250  				return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1251  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1252  			/* Remap full block */
> > f34ce7a7018c2f Baolin Wang        2020-06-12  1253  			if (ops->map(ops, iova, iova, size, IOMMU_WRITE, GFP_KERNEL))
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1254  				return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1255  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1256  			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> > fe4b991dcd84e0 Will Deacon        2014-11-17 @1257  				return __FAIL(ops, i);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1258  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1259  			iova += SZ_1G;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1260  		}
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1261  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1262  		free_io_pgtable_ops(ops);
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1263  	}
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1264  
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1265  	selftest_running = false;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1266  	return 0;
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1267  }
> > fe4b991dcd84e0 Will Deacon        2014-11-17  1268  
> > 
> > :::::: The code at line 1185 was first introduced by commit
> > :::::: fe4b991dcd84e0104cf2e29223a819335ed048a7 iommu: add self-consistency tests to ARM LPAE IO page table allocator
> > 
> > :::::: TO: Will Deacon <will.deacon@arm.com>
> > :::::: CC: Will Deacon <will.deacon@arm.com>
> > 
> 
> -- 
> DENX Software Engineering GmbH,        Managing Director: Erika Unter
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany


