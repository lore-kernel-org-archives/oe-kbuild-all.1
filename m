Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AF212B96
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708671721; cv=fail; b=Wf/cU0h5PzyRvuydr0+roofBI9E71E1gSUU3TFCAIZfchAdtaGnhWv7TNfjGdLUv0p3vV0uTENpqsd1wlmcKdQrtgOeb+Cv06Bw+GThxjtZnI9TCArryvT7pXhGyT5tkgA4tLkOpFNtWfG1JT8XJhdxtKC2RMcchR/WUYDRL2H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708671721; c=relaxed/simple;
	bh=3s+kEy5zwJIClMy/oaGJJAzxPASvsasqOY8jFnbEcFA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CSr60QON4lIWNuJdgSWxaCWjkFhfRjwmXRiMhJD7I6pMP20ehlSNXFXiKLaI72ChRifgBdXZN3M5a/laejd9zQfqy8wm6k8D9V/lgrnDzhsLO5RZSAni48RPRf1WPVh1W9a68RsN+sNl19fkSBTUtZwifrxwuKmZnQywLd6VgNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsaQCoJv; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsaQCoJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708671719; x=1740207719;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3s+kEy5zwJIClMy/oaGJJAzxPASvsasqOY8jFnbEcFA=;
  b=dsaQCoJvgQ7+6w7pl3hg+6giIvnb0ZTyjwWtDYWFzCgNaynXxA1qVwUH
   LGGbgsTsKqisPNdOVEhxwu2f6lpSsWnoAUtYlCXi4s58HThBo5nqQUuyK
   N9aL0y4uDD0dhVBTr9GaPTRg55GAs6Ka7CpxbMjSEx7zj2O7PP/UTIc31
   KmdNj4je9ok35oX1Oub/9FYIvvjDeZ5WWbhduHmgTv/rDtCGz/8U9+/KB
   e2AXXA4bypFna3+TcA9wOkSVZlLPqORTH6tMyRpNuomkctinl6bNJlLtE
   yTKLIL7EAFdTIV/4A1mrxBGBs6red75FVRqUM5aA6sANkSlQ8ZLEoe14Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2834545"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2834545"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 23:01:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913735025"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="913735025"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Feb 2024 23:01:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 23:01:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 23:01:57 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 23:01:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ns6a9rcWm2nXtuixdJRaDLY9X1USecWLMP2k3n4MzbIyq106BGPdPnlMX9p0XMKd7ktvMHB/umd5xmHapxe7EWZNcbwYA6gJk9LGqkj39COD74QGR82MnHqrk42W5RlNHIR0HgKs7Hq7WLg9MFD5ihtYgpgONOUS4XxIuQOD02f0QpFDXR0JiPxI13i2Ib45lbmkpUs8arD8YmQDTIj3J8L9XF+3ozfVE6YBCOWFEPJEYGxE829Mz+OxmoBlzo8zfQjXAYlB6iK6NiEy0Q16aUtxMDUrtFsBzadWbcerJ9B4Pc6KjjZtayGxXkD+Ooazn6MHj0ELIRD4GIsi4aVeLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzoYDE1bUlI8SRvH8K4DVaibCUmn0mlh5gelc8Au+Nc=;
 b=Vfb9ILU58NPvvmz9WIEP+bjNyQhl/48yYeGnGUPqa6K2ql97WSq7IRhMbLLbwhrASlCFm0PrL5Ausustbm2Rhr7nP2ZKwW4hA6cki71Fi8fHvtJo2I6wfC84QanvSFB+CtMedxqMNTbQ+c8sfY9JwQXWrdJqEXzCOINXjaFsaIGxaFo5dBHsBirHVMT9VG1j2j0fzZU2hh9HoFvEIcwFw4K10RyRVXeZ0AYoT81kIeZv0mxN3b3aqC2xVWNfAqdAKc/aIRjzLGFWZ+OQgUeGDYP3YaORC9ll/bBUl0ZxWDMEpEHmiDO6vQTF1HUbiFRO8M/UbYtS5K6px5/IIFrTog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BL1PR11MB5493.namprd11.prod.outlook.com (2603:10b6:208:31f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Fri, 23 Feb
 2024 07:01:55 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 07:01:55 +0000
Date: Fri, 23 Feb 2024 14:55:02 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
CC: kernel test robot <lkp@intel.com>, Suren Baghdasaryan <surenb@google.com>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [surenbaghdasaryan:memalloc_prof_v4 28/36] mm/z3fold.c:923:25:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <ZdhBRufne4NY0ffN@yujie-X299>
References: <202402210511.ByC178AG-lkp@intel.com>
 <lqhpmam42cg4it36b2ikuzxc43s4q6rrtxuxr2r5i4xot4m3wl@ieamqc6pxak4>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <lqhpmam42cg4it36b2ikuzxc43s4q6rrtxuxr2r5i4xot4m3wl@ieamqc6pxak4>
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|BL1PR11MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: d712a778-8d90-4dd1-6176-08dc343d5212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YzNDxAbBTQq0GHTC0uaUX2uvbzSwW294nVfQRN2krwJ+CdPKWDDpSCWuP046L+wmlybXExgjw4qXiaLI262ns6wmlmze7PgNPf3+FCODJ1RC9f1orRqhEl3fVSGUl8M33bLt58mhnJxfqTRjtxv/WCIPGmAeKQsLN8Y080B/LiyZyjsQOxoSNNMImj2PIJv1+QXxB6bxhfjFwLPftWhphyGPq31puRiqo9FwBtVHI6vmeo/XxiNR5nPNK+QFi9Oyscu0dCcU0ICi2cshFztbeYQGs3zWhIpEgLBKKIY5egjYs9zXkFcGRFhsTZQPoIsIXid/ccZgPfEjb94JYY9dfvtd8PN8ZhKWFcrajaX272uX/ECX+r2sxqug+gsri8SsUnqIybLuC6h4QF3mlpWxCVNwb9gluUgWvNAprcaGmNVY79muUOA6BUM8aFPYX8QoFfazqoAi4CkjxVyku7XivpVAur0+hahfb3qVRMXEo9mMp1MsMHKlmAOQ/R1LUOYisJE9oPjdDbhPM27xcNJ9DyQMWmNmFbxIsyelEMcr3RK4GXOsRU845MGR4kwqdLlm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MXFAV9hyQdy+R5eSO+8zyAM4BYsP0epyu/vZaZ/f5mpLKSyO36kE3iXOxnfp?=
 =?us-ascii?Q?ha6adl35jT/Vps+C0sHI6/wcSA3C0JUIhSBdndvJoyQFo2Wcv7dfFJUYe1Fn?=
 =?us-ascii?Q?oc92W2sXtVvx96761Gpd958+k6XgvSA9bkHByHyECSD6FpCQcUpWbO3GwDqE?=
 =?us-ascii?Q?CjHMx4dQZ6pfTdXLh4iwoEhfi9zfSnt0Rob0Xg/AMUCGAXQhGvtRll/2GoFl?=
 =?us-ascii?Q?0cpsY3Dt+aJbBrULu3mNIAi61EMxuiiRi0Onzn64vRiazezqgXeitwh6xM70?=
 =?us-ascii?Q?o6g/O7aPLVTgAtgjWiIaU+d+r6NOhLBzCuBgXDAFQlXZoxFGXKPMIY2IncfT?=
 =?us-ascii?Q?goV2y0jlr/FkAE2/5MswCVLGYtWrntjGWvAc0Ovzwu7jT1SlXbrsJ4poublj?=
 =?us-ascii?Q?iyDZIEcXNu1RBTBdoaqkntDOGeve9i+UIFjukWiH5Q50b0fU92LIcZwyP281?=
 =?us-ascii?Q?a4r78yRCtQDVk5Dr5f9HXJr8he3hgAJHrekqp1ZgrepDoNd3FNr87hNQy+6G?=
 =?us-ascii?Q?RggAVVh27oi1RsLQeqfT4V2Olc5doCqjEy2U/FfoVG2sG5lGXl8ygqeEK1ro?=
 =?us-ascii?Q?aA+dS7Ycb3tSmo/eA7tszrSkzu6j8+q+X70u06AlLdXbyKU+/syTwlN2wA8S?=
 =?us-ascii?Q?4ulm6tVfbWZQnkfYev8uVj4MdaqRN+KZhKubVhGb5Zvv6GqBd61jpnLN9laE?=
 =?us-ascii?Q?RqcHqMk8k6UsO4sAW7TAr9NUr0SzFHTqxQAZg6rFL7Gkkvx4uMepkFPehV0H?=
 =?us-ascii?Q?zWFTEqsv1hOdrsd7KoB7YqVtcuheqSwB1n0hPmaGJMryw/lXcD2dVkBMwFOG?=
 =?us-ascii?Q?f/Eq8OOkwhN0DvdhurDAT6aWJQi9GZdIL37AXHaxz1wM6Q42UxNJtSrNeSer?=
 =?us-ascii?Q?ujaQakUDSyiT3jstAIwsNrgWL0Fr/EYwPw3u/ndzMBoKSkvLjjB8yJxjoBBt?=
 =?us-ascii?Q?j9QeXvfeE3fBRwyZeTXKeHgCPsopDLLBB8kmqNn9Tiv8RjiKbKqsS2/2C0wR?=
 =?us-ascii?Q?K9yIFs8iCVl/oMiYZqhiGH+q5OqjHGNhmjXVoci6MJHqkl5PBd9h5r3zKE5O?=
 =?us-ascii?Q?Kyg3aq8Dj1xwurLI2diSoveFOPeJOLRvtuNUms6mOgL5ZQ1nZVUv5QCCGrWF?=
 =?us-ascii?Q?wkVpTRLwnRrzAjDWqQX+m3XR4ZilaGlfx7bApnhJMuVU7G6hxeGm7suIII10?=
 =?us-ascii?Q?0iofsBMHGTeyL8nkxlcE4yqAeA/R2es2XUkMY5c8XJSOaaE/WSHkBT56THMG?=
 =?us-ascii?Q?GNcRFstSJcbSBnGVPPwHLq6h7Pz1w48QWLsMwuv3gKduGoccBUpX9AMXBiCb?=
 =?us-ascii?Q?ZMpFm7AmAiTA4K1X+VW1Vgc0cpF8d6mCdQ9oj2DOoRFjc000lpWiz/sWfSLE?=
 =?us-ascii?Q?MgxTVw+nrwF3vepdSZm4Mv0yI7pr29b1KRw0oRkaVSphc1+TUgSULPGqhPHU?=
 =?us-ascii?Q?Cd/Uq5RMsO8KlMusT8Au0SSUT80RjMOh6r8V9jxmfE30VgBqSzZcIGzHCkcg?=
 =?us-ascii?Q?8BpvvTbqzKyB7R17OJs5jz84KgQ/9BA1jKLpCqaAI7qhgoLOxaX0xz5TfWym?=
 =?us-ascii?Q?2MkmjO9QJh6Ro02ICwTvLyaJMxz+Vy8zHP6sl9Dd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d712a778-8d90-4dd1-6176-08dc343d5212
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 07:01:55.5327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X96Y1MHMEQm7521JFtItgAxufjY36wFcB7xF5lhJ2RzgF2vh6jkGmHcnsP266VWM/xhrCz4q0LKBVgJmMFpvBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5493
X-OriginatorOrg: intel.com

Hi Kent,

On Tue, Feb 20, 2024 at 05:34:08PM -0500, Kent Overstreet wrote:
> On Wed, Feb 21, 2024 at 05:42:17AM +0800, kernel test robot wrote:
> > tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
> > head:   ce0668442c846ef25854d37e252ccbfec2a35241
> > commit: 0ea8081a7fd7a604cad1195c80f82b015381aa0d [28/36] mm: percpu: enable per-cpu allocation tagging
> > config: x86_64-randconfig-123-20240220 (https://download.01.org/0day-ci/archive/20240221/202402210511.ByC178AG-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402210511.ByC178AG-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202402210511.ByC178AG-lkp@intel.com/
> 
> All the sparse warnings I've looked at so far from the memalloc_prof
> branch were false positives - they were also present in mainline.
> 
> Is there something that could be tweaked in the 0day code to fix these?

It seems that the sparse warnings have some minor changes on the reported
commit, such as:

before commit 0ea8081a7fd7:

mm/z3fold.c:923:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct list_head *unbuddied @@     got void [noderef] __percpu * @@

after commit 0ea8081a7fd7:

mm/z3fold.c:923:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct list_head *unbuddied @@     got void [noderef] __percpu *_res @@

We can see that there is an extra "_res" suffix at the end, so the bot
wrongly considered it as a new warning and caused this false positive
report.

We have configured the bot to stop reporting similar warnings against
commit 0ea8081a7fd7. Sorry for the previous noise.

Thanks,
Yujie
