Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B82D1D356E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729854661; cv=fail; b=DL4hKNXzLJrMzmQjQykYHfa8KEhVqwKMORpE3uTfnPULjYsduk0nkEWz+aL0wqV/MlvEGMU/+YvO4GoXE4wI6SZar0o6hDZ4P2y56zfX1S990LZpmzBJihOxXBYnlOZVWBbb+kFEdxuJ3SIwgACJ8ZezC4WUAGQY4ICv3a8mp+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729854661; c=relaxed/simple;
	bh=61ePMHPJVwE3780/U7lyifhtJw45oWMPIvIaaAaByNM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZDOphsZXqlXWFkVMRRftLqfSNAyvk1akI0f9ihjjPQplMxO87m/KW5Y8TCMxWiOg3zOx23cAv+nH6zQ/sSoO28zwDQigEkHyYdJq8AvhIB9sR3QAzOyd6T+nCc2u95EaUxHQB/GR6cWG5wq+2YWJ+zdNFve+Ccd1HAuf7rnXg9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/auWuWV; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/auWuWV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729854659; x=1761390659;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=61ePMHPJVwE3780/U7lyifhtJw45oWMPIvIaaAaByNM=;
  b=I/auWuWVPFm8AykbsJuh0xKIq3/g3HEeKvKSqisxta2bhPHDSBFV6es5
   JGzI50ahOrzwi+nJ+ZwqJ8BLdTylQRxqs39qC7Z0lqj8LflYRCne1CiUB
   xZsqx+K86t2yy0j8V+whY31TI5z6w0JGDw9zP+6m1Gq3oYrWBEJdViccC
   lHAKOlIUvpOkaNHWcUAz/PKXPuDTFC6cyXw6I1Lp4Tfiyy86W4NEZd/4n
   Xh9ElsMfuWFfUlhmjXBFI8ga4hOmkKQ7C7+OIimdPvA0QnS0Y41hNZzhv
   P4mHzhELFYS8ClvneevAfNzyCWiwOXEi2O13XKex9n90aGYHX8Jwdzrsw
   g==;
X-CSE-ConnectionGUID: 2k+hlmfRQXeAzhxhE0pqQQ==
X-CSE-MsgGUID: An1T/BGSRDy3mWZQK6/PXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40074220"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40074220"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 04:10:59 -0700
X-CSE-ConnectionGUID: XOgRtPaoSnG3mhjlHydRaA==
X-CSE-MsgGUID: eHnCsS3HQnGT+YoukqLpFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80541444"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Oct 2024 04:10:58 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 04:10:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 04:10:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 04:10:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGmtp8SlfA7AJKLVUhbQz7CHgYS70Mt77rBDp269GWPL3Arf5XXG09k2+jimuG+qh0qa2E1tLlBS1rKi8wgRMctrGjB6BP5nC8UnB//PMKZjLeputIAl43xInEfXsxzV+OwHnGrfg9//9uptXdPyvgk0aNqWInjGjjDV2D6Bc5P6u1JRkzyWQHHvAu57uB1pns89eAFt6DNJDWEJze3lAD+ZHgvr1hj0ZhW8N3DiFe7/7LHo/Moge2LAx7FxErSeduuRDItDDJ5ZApn+8L9e09Fk2/7xvBicWJ0KOie4CqfDVZYlI+zGl6XaIUGvrTlu8V2YEHF4wpKF9YSj69hCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9J5rpHno95kM5EZZuPCv1T3AWoluzn1hwUU/5vbwyI=;
 b=WrRO7JDy1+QLSrL4wMx13hHQFNZ6spg4k6AsjqE1Y5+SQegpuWHb61vx6S12gS0KLYCBgUsur+H/80qP+z2J72scbmaH7YdXVPOBT+7661ZqzxtzMyBK6gcyTeX/Bq6RUULhEYunWKKD05uU3Y+KOIAQTexCo0vy7slOzGPU1ZTurJrzJ0CN1Xh/bBr9uDqzw7z6SjgjfKq3EHkw4KfXnLjcmCVcSLomE39oLmydBE6wpx2g3w/oqHzHNf4vLSm0Clgi1r+1WTWzI1dUrXm1HwPvn0byCm3ur9WcbAn4Edo0o6jN3AfiBGhvq68rnMt3sfzksY1oN6LaG1E2TBYFAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW4PR11MB6982.namprd11.prod.outlook.com (2603:10b6:303:228::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 11:10:52 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 11:10:52 +0000
Date: Fri, 25 Oct 2024 19:10:44 +0800
From: Philip Li <philip.li@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	"Jarkko Sakkinen" <jarkko@kernel.org>
Subject: Re: [jarkko-tpmdd:lgp-v2 2/4] mm/madvise.c:1098:10: error: 'const
 struct mm_walk_ops' has no member named 'install_pte'
Message-ID: <Zxt8tJtZohMaPxt5@rli9-mobl>
References: <202410251042.SfLMse1o-lkp@intel.com>
 <daca8283-ad71-459c-bf16-a6f0660180bb@lucifer.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <daca8283-ad71-459c-bf16-a6f0660180bb@lucifer.local>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW4PR11MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: edc5f8d5-b6c3-4162-239f-08dcf4e5b041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xu6IUtaQs4TYDCEyJCqxKKcKpflsvbgR2AXYhea992gpzqNJip4J2WleY3Q1?=
 =?us-ascii?Q?S0Lj3CEUTDnxj0ttZgbo1zWW0oKar+53sSI+ajP7qm9aqzoeWcoJIPz+FmuJ?=
 =?us-ascii?Q?S447tRMTIQoq7A4/2qMHu+ISrHWRip4FM6vraGnAQsqUf7DCMgiL7bXFPep8?=
 =?us-ascii?Q?XVcvkN5aQI2JYY9gnzfcXm79hRqOwrIIHYmZFAH0a/xSb72EDyE3Nydy8IIY?=
 =?us-ascii?Q?j1s8dFiBzpW8elKTPx56NtrhByZuNDzeM0/ntAH/OHPHgl5CS2SFFlMSf3ZV?=
 =?us-ascii?Q?phzAVEg1E83bPXjlp0ibvsFZQqA+ByElUt4hHzgmaj3l5tiLu0z5D47ZGOg/?=
 =?us-ascii?Q?OeAGd7w6YomiVzqsaKUgcowlHTzysTYmv+F0RGk9A7YWacjY8byXPwCEKZPi?=
 =?us-ascii?Q?/NDqUNPo8eB0GFir4rnSXCh0PKh7aUbf0vLQopQyXATq8iKffNXARiGjanvu?=
 =?us-ascii?Q?viQR2f9GOyYVT+qmM2QblJKijoyAo7kGtsQD98uw6A6VqMZWKYsoj927CzGF?=
 =?us-ascii?Q?ZdY6BSH5jGSp478H13I3RaYIe6OZcLtdbP4oparMBE6e8LNNWm6ml3QrYeJo?=
 =?us-ascii?Q?INVvh4PquP1fe83etBOfnwclD0bvFywwp7Ggd3JMUXw/dMyeL1ccbnIeq4Kt?=
 =?us-ascii?Q?IyjXEU3vge5lDh3EwQrcX2ejoSF2PgCXZHnLyxb/l6ne563j4C8Uj7JHqD/8?=
 =?us-ascii?Q?lIHWmVCNA/HU3QKIIbp5IQ49kfgOexHHBikSGzC73bp7lJBJj8QIMst//Nyi?=
 =?us-ascii?Q?fyHU58wvr/AMcoSgceSjn8ch2tfKypr2tjt1qCkmN9wzzYlUC6XnAUVk60Yj?=
 =?us-ascii?Q?VFhXIEaoLc2/CcqTlaDQWwq29p7X1AYRSC4nvkxgyBww/hHnkru5RcnHQSt1?=
 =?us-ascii?Q?G0X0RH8twKqKMiKhs+0Xhoi5mkJ7gpYjJRovXmspph+XQnCyAol+TUqNbH2B?=
 =?us-ascii?Q?ZiCmL3unu4y49xtvmbmuKYuwD+/U9BvNyHCeQi1lBvvgbeMt1U58u0nkft5Y?=
 =?us-ascii?Q?WEJFjDcgR4MSKeBwxUkdrdhT5tM0JAY9zwewvjIKf4c75JPQDcBzi4R5+ftG?=
 =?us-ascii?Q?5BDjK7RDpnKlO8FF+RwXDoLd+mCrIHzUB0iJzlRBHgwCYvhJWwbIeooRoJZZ?=
 =?us-ascii?Q?68DW8HNA35XDfC1ookmgDm9gQ6GvuWgAEQaWDY8aHOOGFCf6CQ+1sj/DpcFc?=
 =?us-ascii?Q?MxQMU7IQcs0LveH5qo7y0Ulqh4RFPH9c8F3R1WDG7OKUM+KaBes2fiaMNdsi?=
 =?us-ascii?Q?QfdGuXOzgqv+EIAIk6l0EmsHOvJpN81ZhMaNXG0tlg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7b7TWvIRoz0i9FZFQLtavLBVGu5KbWm5E77fibtJwZrLOp4/DccvI3jymosd?=
 =?us-ascii?Q?zwmsUgRQX7/sgtdL6zeunrr9JSEoDCDa2c6Q7fgM1dED5weJmAu/ncU+Qvkl?=
 =?us-ascii?Q?Sl3dQtDmM1LPb4y+IBxLybsOuUqzLCZcz5dy9pjIuNeTp6KLHuFrwaZl7wjR?=
 =?us-ascii?Q?LX1flHF/tSZdog0kN8KiHki3bTwUC8RrhmiZ3DDSgqihu3CwmVpOGxMOJdSy?=
 =?us-ascii?Q?rxJVMzXuE84kyob4LcIe6yzoBMnQAWoXzyi4uPW5WQsCYbe8qxl3gQGMYd17?=
 =?us-ascii?Q?IGnNpiHhC0OlFXjIuq4lZwwWiNt/ob1w7RXdDSJcjTsHBXePbwnpNqGYvfi+?=
 =?us-ascii?Q?cuRMi8RZ4OjmraZyz0bDT0Hi9P+Mhnu6DBrw3Wl13e4541sbUXHWHRUSiODM?=
 =?us-ascii?Q?Rl3j45u925P2XekartZj4EOhOf4xUGR9mcbpn/0NcZHjCaIiTkQ+pTs5qIgJ?=
 =?us-ascii?Q?zau9HoGyX4sHMTMECIqwEvSQgmLMjNHaN9+qamxpd2O6Q1rDFtL3DbZ4s3Px?=
 =?us-ascii?Q?Dopj6G/iujyOqmMddrrlvX0QNPOi+t21RaLIjm5PDNfNvbUk9lcyWNgyQXvR?=
 =?us-ascii?Q?AsjSynG0qW5g7GPtk2116HtkAhI9wCXoqDJhPUVBgykZr173FX35w/KbTNze?=
 =?us-ascii?Q?zgknkVTivuAxPOGzbVihpn+/6m5yX6WwrSeiUgIBBUfhAEuEj5Dy/0lX0rs4?=
 =?us-ascii?Q?tGAh9oFUn5KTmPVFn2IE2DGf1J0FGoDoi/IRFp1s0mF5SnY6TXH4fLjKrTkI?=
 =?us-ascii?Q?6US0L5a5RY2S2EYv3lXPMOQ7Z4XSTG0IVzYrVbPmAdXu4EhlFt/U7fcpd0ql?=
 =?us-ascii?Q?sfwZdegh/JiHoGkxhFeIw6XOZeOpvXF1KxEgfRIGQmoehp8l+NbzNnFJ4Fcq?=
 =?us-ascii?Q?LQ0pKY/jnlWfmw9KSTY83F15u3zJsJI/syxy20GvWhuAyRnNTllTASrhg0z5?=
 =?us-ascii?Q?RPbcmO56KSVt4eERkDLBTybtmOxYo8oil3w6IJ1YpNYZWHVuRBZ4Oa5ifeZR?=
 =?us-ascii?Q?dyb2yawLmUc18C6uXBXrqdkyuFsUCaOSun3adfk95C2Eaope7BPPpMz/XQtb?=
 =?us-ascii?Q?wVmXxZ3WekVQPUujH6YKS6URmrb2bsWjCZeAUiQaI6GSrakxL0Lw1Dx8DaGW?=
 =?us-ascii?Q?5WLvMI+WeB/Kyd5ytJhRQRFNKetguenC9eO5b9NjfhjnBLQWy78VS2vd6u/W?=
 =?us-ascii?Q?XrQjnCvoRq4bUNPwAUSvjITjNhqvcW73etOXacMFF81j+zwj1szsQ8s/RdPo?=
 =?us-ascii?Q?iN4GXndHGTKeare4+dsnm/AOhtAQa8Tpu0uVBGjeyOn0f/SzEZ0x5LK/Q4Fm?=
 =?us-ascii?Q?TRzc/y5uWdD62Qsq/3I1Ke3O/CT7aPAnEyxR5u+lX/ZOsFmkfpD5FnQd/mzd?=
 =?us-ascii?Q?hbaxFS/QQpbGi6KLESvoc5UHFqP5vQl8ARa4pDu3dYkLsdkB/e66LMaaD0iF?=
 =?us-ascii?Q?lEsRhCM6v4KrOqpVwalKIuYIR+di03/KAJeclOIJ9SA1YnsPqskGrh2k5DZp?=
 =?us-ascii?Q?aja7xF0S6m72w4HxjEfq0Vk6C3uStiDwgBPeIZ7Nd1Tk4ybErsjnxdwNrK1u?=
 =?us-ascii?Q?E/XOtooZjVFmKFaUegqFD0gKX8EFSY0CWoJVRSNJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edc5f8d5-b6c3-4162-239f-08dcf4e5b041
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 11:10:52.4911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1kJDTDtwH0gev2K0U3oX0if2Bms/uAmKkN36/lpCAnDVy8u2dh0Mr1bFLchpS/hHyORkSzk+Ym7Q3NRU5Zz/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6982
X-OriginatorOrg: intel.com

On Fri, Oct 25, 2024 at 07:48:31AM +0100, Lorenzo Stoakes wrote:
> On Fri, Oct 25, 2024 at 10:17:54AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git lgp-v2
> > head:   7ed651841db9f18744191e575637d69239102a73
> > commit: 94de21c76e54641539032105ccd3f36801fa9d85 [2/4] mm: madvise: implement lightweight guard page mechanism
> > config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241025/202410251042.SfLMse1o-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251042.SfLMse1o-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410251042.SfLMse1o-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> mm/madvise.c:1098:10: error: 'const struct mm_walk_ops' has no member named 'install_pte'
> >     1098 |         .install_pte            = guard_poison_install_pte,
> >          |          ^~~~~~~~~~~
> 
> I'm not sure why I'm getting emails about a random tree/branch which presumably
> hasn't applied the patches correctly but could I not?

Sorry about this, we will configure the bot to avoid such report
from this repo to you.

> 
> Thanks.
> 
