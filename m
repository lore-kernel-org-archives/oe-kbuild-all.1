Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A6E1D6195
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 00:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774313584; cv=fail; b=Xt9drBcBGMSMPCQgZGX0Gziz4WFHvT2QCc98owoIdiDuFoCMg9Qnra7BfUnzc019N4MRXKTQZR0wYoMibElFqiARWozc0FRNKZ66WbuFVoiy6eQcZul0g4OlZfTiWPlQuIIacDQv2tBsJZ6/p5Zac0K6JWpzK971av7RQLWS3uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774313584; c=relaxed/simple;
	bh=yB0D4rZRi9wTB3IyFNvdwTlT+vEqOfJSMed6tng1UfY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BABf86RIRwvYXLf8MzmO/mT0tRVfzPuxMHwguuz+7s/S3Mdyb+NEgKERS30PqYysOuvjq1MX9OWOKc0YnujhbBQO6iPK8GlHvMr2YXHX4+/GTz1sJe3Su5ctYVi/dDT/aNzaw7YuW1bR/6+tLJ2pe0lH1aJywxU0vYzPzBL3jac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HY3kmhLQ; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HY3kmhLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774313582; x=1805849582;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yB0D4rZRi9wTB3IyFNvdwTlT+vEqOfJSMed6tng1UfY=;
  b=HY3kmhLQr5RXIEmoq7XM+q27qsjLRmXpXxRQTnVcDgMLYzEzufO15Kbk
   q9HhQ2YbR1zDRwpmjvbEm9zKt2nU7yP7Q6+J33oTJsyLOLIkDwdRVXb81
   KEHpt5YqreYr8rm9kmK+u824d5eM4ItDYrFLt8lWiBtXuX1KYJMEGL+DC
   I3+Iwunfi1anAFLlPYTFBlkbP8BGSw5eTNVGezEwvnja3PocV1s3P/uB5
   ckFRnlyQC7crD7juM7opKy/gwKEdRU4bl07OT2p5ArDGhm/yP9f347c97
   w/H71HXQbJDdtNaT7/Oy8czOiCBdAu7rkL8H7X4s5NouHwoR7C1j/Sx41
   w==;
X-CSE-ConnectionGUID: V8EHbcmNSre4sl/mx4i/pg==
X-CSE-MsgGUID: g342yG7QTramKIIEOA8v2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75291638"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75291638"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 17:53:01 -0700
X-CSE-ConnectionGUID: TJ4H+1u5RKSMTaS2HQGJAw==
X-CSE-MsgGUID: xUtBfSe2Q6atkYpm1nRy/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224412674"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 17:53:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 17:53:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 17:53:00 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 17:52:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EuUomQPQHjsTdrKexfnjR1i1GDx8w/bnDDsrz2o1jD4fQ510KEjeyb11aB7g+f8Q9dZMAIlNdTTki5SuDf94dA0Vg6kDFjiiNM4AF4MMewReQDcPUNcboCTj9TmxMB2J+sphfAdOrlSsJW0QOMbVssZoUMgHxcDWl1pRh0EE0MjSGUsiCoBP3Ex/Hst/pb3VLziAzZIbI0fsUk7amiolAq+f0CLY0PI5InafuaQZA41eKh0IC0MwKljDtgiG91tuEwGDFR4W2pB0rly+wLafYsclMFdo7etQXlf0l+lHYqb5WI7q+dhD5vjXhFJ6fJb5RkHzAxVMP12I4okgkVptQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47cCTAsJOrbzTU+cHWxMOGkfB/+A9tAtfg9L3/cllOk=;
 b=HFO9IIjqNZF5qISREipmyYrORZY7PclsVCg2dg/JpPpBkzp0DF1ZZLtnJhOh2bqxComOwsJJ8lvgfKzxMuVZD2z8+nRoyO9YQUiFFyDQlwEQR1vrwCCzkOaeoyKlnxaew23cCo4gthO8AS9CB3yzulXwWizKQTYbl1WaP+lN86+7nX9SnPnczeMDvUxrXiI/5b/PVnD/X89sCOJPfS/TL3aZL4EhbsMjweHhnwd/yL5lNPEEoCgQr9Cn0XoH4Ejt5RurCgajRSh9RUFLbFUKK7YkabpkJOu9hBFQzi2SmYRBtuYxY5XIkI6CydjdkfSkcu4qPZnOWHMRt8UETHzNkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by CO1PR11MB4786.namprd11.prod.outlook.com (2603:10b6:303:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 00:52:57 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 00:52:56 +0000
Date: Tue, 24 Mar 2026 08:52:48 +0800
From: Philip Li <philip.li@intel.com>
To: Yury Norov <ynorov@nvidia.com>
CC: kernel test robot <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oe-kbuild-all@lists.linux.dev>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [PATCH 3/3] bitmap: add test_zero_nbits()
Message-ID: <acHgYLkKmR3juG1t@rli9-mobl>
References: <20260319004349.849281-4-ynorov@nvidia.com>
 <202603220114.k5BHBav5-lkp@intel.com>
 <acF-sTWyjdZk6jbD@yury>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <acF-sTWyjdZk6jbD@yury>
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|CO1PR11MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c129bff-8b3d-42d2-81df-08de893fb038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AO9KpSPRwAVV8I2JiLF05Np0RQ4ItqKPaj/PgiZ0/gtYqztG3m2g+XdCtuIPPVo2UtBPiGlAKvWzFQBdgA8WRJWa1WrfJLfoajdcHp9gULikMaJykROvPzNltqYREuSFb61yD3vEmVdZ0lz8wwZPmv+oMBOvuGm6x007Wubx8GpOClbBr3p/P54glHxCd03Dsz/w+9Ncf5zLC2BFSPmY+KXcAOKi4hfMb75DUKdoBSmWzPAaHD1ehmcE5fbz9PuANLqn0WP0wxhdWp/FJRKvbCJKMNsYS7Wy7O6yAAVWrsuhe7mOOyrmh2wzrQis/dcnTzepuBdS1sPOJbQYKlWD7unDouQvWe0n+yXyRlyuc1rx1XC0UUFPWYrts6s4KYRxZAue9vYdvbJnMwXqs9BoJhOdyXqGYl3Al1DZi65ExWlCBzUjU3EEKl2QSEqZhfAu8wSqVlg227vXGr+m6Jmbt6WGHKGR7Dt4/DCzyJ2uR61ED0PXN5YxJ5b8ImK7s7Q8EtnrIwEej4vgjk9atbrN+fT2P+mg/epvOkknpxuOi4muaBRO1ELSkMlS3TfFTKIRDtIL7N0qjc1QOwP6S5gaV8mjwjhfOsTjTSic141ekD0cVtIyJY9mAOWLcJLfEgNtNW+5Nz+05NzVUHNZ5YTmna7FK+TCPsKlyTK60udE3H43AB6uilBTMwU+8zgeaGod
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XHnu7CbaglAelgbFVjgXogtagcja6EEzkSA/MgGfWTYEkBD9GbnKvXte1fvm?=
 =?us-ascii?Q?uf/yL2mCbH+HgPupou555hGWpOoENvb74k3gleUGjrPF/HHJvw4GRo4KDh0Q?=
 =?us-ascii?Q?Jtbv0lf3Y/OCAKsDf53Rwwh9JzuicwULeRjD/0Peus14QiKSaigcrlfBdl8z?=
 =?us-ascii?Q?GGD36RHF9CqtaxOyEhEPMeI0lYoRk5XjwRg2uzrlXbW4z1+GmboAv4pnZL01?=
 =?us-ascii?Q?UVY4pjo3MmwBsIE5WPMQUT1wxtQmkcD0yG8cT+T51GyFXa1RkvdNCe96iPio?=
 =?us-ascii?Q?nw2QvWjCKRk9EpxyY09CP8I9IHw97wYAVlkfXySfpIgmgzfn+vPqTtkYnqsy?=
 =?us-ascii?Q?RHKOY2tBA1c1r/N9ZB0EpWJ4plj0OvBdfSA7nanMypkcvw9USKa/C/I1UlDe?=
 =?us-ascii?Q?RiwSU7kT9s0v8qLqc7IAVmYqGwV3uB5fcmvETyEF3IZ3lOYm9jM9xSouUSPX?=
 =?us-ascii?Q?OsJGGgAJhgZcnJEgQcAhkp2SSancB9AyR6TvmhqNu3f6fuXWCZZ5k+xItNIh?=
 =?us-ascii?Q?/S2Tc8I09Im8aaprneP3tovSFKyCld+LRxYGq2NRS23uzNrmPJLJrDlUIgmp?=
 =?us-ascii?Q?jSkVabB7e73OceZdwJMw3diDuc3aEgwQzSialbffxRcx1TIyW/7gDWkFEuxe?=
 =?us-ascii?Q?Jq0Ugk5xsRWs3Me3Vxnn8St9pYMh1vZricsfJgDotL8oo8am8+SwqVcltBVe?=
 =?us-ascii?Q?IFr1Mh7dwK+9J6U9sxta3ZevXuvGMIrxd/CCMkRmikHZg/oSY6+m51W6MKCH?=
 =?us-ascii?Q?A8gv9KckFKCLp/ejdQpxc5dQr9NTpgXnBb9k5ztWkGHqdl4tdcBx3J+sYCPz?=
 =?us-ascii?Q?+GCNVhfs+vXSFMTr4/GMy4LcIA9TTCLlGuPKIAyX3ugRZ7Bn3pN7ncnvfL7M?=
 =?us-ascii?Q?PvsaMC67tcKg+epIK6BcP0tx92O5t9zoFRV/wIIRLGCn0BWZLFH9o4HGNYzF?=
 =?us-ascii?Q?ENPeoiTJPC38WciDIIcDm/4wSSpcSB7n9cG3GPKe614QgCgleppy5nBk3zSp?=
 =?us-ascii?Q?T36wQNs/XnCq2HekC3iz94/AI0wI0DO8x1PHEk24opnUO5z0sEN+V7nY6lih?=
 =?us-ascii?Q?EVNSO/ZvavPZe3ZCauMyfz+KTmW9w8zIs1CUHBCEH+uaA7N7HN5x4kApfIQj?=
 =?us-ascii?Q?vdeFB9nBF+XJgSJFwXWoc+eNBoWK2z3TBwX0KUyWSxCx9Y8A2Yltzy+89sAb?=
 =?us-ascii?Q?iHc/UBwqBqx/rcxC9ALOD0eUN2TPqnaB5vSCQJ9W2b1T/nLyXUA/0rfiTp7o?=
 =?us-ascii?Q?YPiYV9Q0u7sHgSTrXNY6SFC1pgMAFNkLRTzlHY0QQGU/Et3s5CPW5WeAYFb0?=
 =?us-ascii?Q?bp09i+s4fPC+9gvpDs4efFCdZU/2aieYxmctGWoS1wMWRU6sh9RfoGItqUsa?=
 =?us-ascii?Q?CO7Pvp1ByLRPuGEQ+YlJixTKsRlVOgauq5AU2X6X10RGFjz4Gjp3NNNQ6FPu?=
 =?us-ascii?Q?xxeFPoB84aWWFyG8W/b2MI6ZAnZAMJwSucrhGC2NBM6iSjLRWD+lf7rIj7u+?=
 =?us-ascii?Q?oM90Sdbg4HVYN3285S0NuzMNHXtb57w4KfFkm1YcbL6FVBhK5Zcku1xEQq34?=
 =?us-ascii?Q?+MUWVbCzIvapbXvyVx21fomw0hGh8//hngsJFuJ9IBUhyUM6ZSWuSD6ZTN85?=
 =?us-ascii?Q?PmikuRGcJimNOnW6IhUt8NvAmplMavfEBhqTyCK8ApT+gNqiRKVwyrINGJjN?=
 =?us-ascii?Q?Ag7IkU6FR2SL8ICUt1+v/Newh8N6Aq/Vr/+SMliH8SE/c8haXBccLUaeE0Jk?=
 =?us-ascii?Q?A0PpmpcZMg=3D=3D?=
X-Exchange-RoutingPolicyChecked: LacZXDc9o4/EdRerlyWRjsHUJ087+YM4m3ve/tK2ptPazfd3yvO4TQTjwKuA/1ihxq+EugUW+xtyzXlmlkTiCCdd70VtR2QH1duIj8XK31PhvA72VITb0vXIn7P77LfbIpV+ppctqx/WwnQVSOBS/TrVSgtO6RMHygsjDId82+79f9VuFY8V6djP9LtYusj3osst4o0HhskgkLP81qut3LM7GMGZDRn4XZRZ5ZJ+TjHwf8Ux/XKCZOnqEtZbe//091I70TbfHsvlKCIGVKTazky622+oU+lzvKNlAZ9Iuqau3JQExz34hl9OwZesTGLVazrN4HbWeYn1Y4Urkw9+RA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c129bff-8b3d-42d2-81df-08de893fb038
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 00:52:56.8317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qsHs+wTiNEFmBo8TN+p6fIW0mFekJU4DjylsSfpcKbGYHQYFLdvdvpx9rzQ6/VMCNjt/wSasm71kCOFtINNe/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4786
X-OriginatorOrg: intel.com

On Mon, Mar 23, 2026 at 01:56:01PM -0400, Yury Norov wrote:
> On Sun, Mar 22, 2026 at 01:09:51AM +0800, kernel test robot wrote:
> > Hi Yury,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on next-20260318]
> > [cannot apply to akpm-mm/mm-nonmm-unstable v7.0-rc4 v7.0-rc3 v7.0-rc2 linus/master v7.0-rc4]
> 
> Just as said in cover-letter: apply it on top of -next, or
> bitmap-for-next.

Got it, sorry for the false report. The report is based on next-20260318, which should use
next-20260319 as latest base.

> 
> Applying this in bitmap-for-next for testing.
> 
> Thanks,
> Yury
> 
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/bitmap-test-bitmap_weight-for-more/20260319-221930
> > base:   next-20260318
> > patch link:    https://lore.kernel.org/r/20260319004349.849281-4-ynorov%40nvidia.com
> > patch subject: [PATCH 3/3] bitmap: add test_zero_nbits()
> > config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260322/202603220114.k5BHBav5-lkp@intel.com/config)
> > compiler: nios2-linux-gcc (GCC) 11.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603220114.k5BHBav5-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603220114.k5BHBav5-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > >> ERROR: modpost: "__bitmap_or_equal" [lib/test_bitmap.ko] undefined!
> > ERROR: modpost: "__bitmap_weighted_or" [lib/test_bitmap.ko] undefined!
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
