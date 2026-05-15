Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0019A35E529
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842917; cv=fail; b=Zi7xIyGaxd0dYsF2jQ8z6FQGQ+IHbQmrCQYy/6DtXkiih2S1Qqqr6dShTsqjc5AvqFNnqU2bRwfn+oRo2lhdrDNUQ/kLzWs18I1xfSSaLekXNU+0eTsiUHhlHj9RT+sv6M8nHmiM4MuFBQoCVBm2qMk4xo6sSU6sIC8da79wjN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842917; c=relaxed/simple;
	bh=SrwgTjfe1G5qreagW2jJkBEzkNztp96mmaRHh0PInyo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FzVMckOQGF4B87nwts+AFt1BWUjjqBAI75CBGJBplefrJLuwW6apb3SAmplSfCiKFrAlkL82PAsnL5P5O2D+I4tJtty4U2rnCeTs/XAmoA0+jxGX60x4XKwn1FUgeu6aSuF28Lq5tfM5ngzleB1AaXyEBbFHfKVjb5M/V4H3Gtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4gx9JPN; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4gx9JPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778842916; x=1810378916;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SrwgTjfe1G5qreagW2jJkBEzkNztp96mmaRHh0PInyo=;
  b=c4gx9JPNLRZXUcmhzirlF8LgbhUe7E72pPQH5GzVpvs+Q/xZsRkMqVyC
   6B+7OATLJofU8qOCYkCLxaQ4ZgkJ13OaS9oZ3KumXFk8tWY3ahescVpq6
   MX4sfa5sclilEmopG9Ub/gQOy0lPWqVQbx1KSimCkm4vZnSV5Yoz2b7dy
   YcHZzAwRYmEZoNQ90gLKYV2BHUdtYS22iitzMup4/hj3Rq37ISh3A4X5n
   MfFxd0Ce9OEtHXEN5d6aikvEp8mql32P8rG52qVX38cymcdBaPyQ90z3d
   lUCXD1Rcic5YrSyM9ltXcWEBCTEvF9isn/47eFNTl2dkIJHssDGGd/Zd0
   A==;
X-CSE-ConnectionGUID: c0oIDE/LQQebJrtBs4Rgzw==
X-CSE-MsgGUID: hyAxcVwXRvaF6BjYV1Ipuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90493318"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="90493318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:01:55 -0700
X-CSE-ConnectionGUID: 8tgoxzbkQq2F+x1vs14aNg==
X-CSE-MsgGUID: MvuR+e6VTnqNjeCZTjfm6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="236026241"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:01:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 04:01:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 04:01:55 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 04:01:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoVyn+qZDyXG00eybhkM0w+6tQCPc+apg+4yMNnByGRj3at+B+O6eYPaTZ4VoB6W7IhsJGEDNCifBb2XEfjgQk5iQNApOmUh4wtSQX4wfHuGg+seNkbf2mGcQKQNqy+0EiisvcScb60b5o6TLT8EqKdGX6PHOco9AF3+JWaXmh5cN1IZWgFWMQId2sb3pH/+y6rlza4OIcHFg/DfOgqW1yzGm/I0S/hUS9/c8FTLb/CE5ec0cJYdHBkJFgCpqoAETrybdXN/ysSOpeQ3ALW9TfTNahvO4fZeeKvmcuTfBJRff1ETjzUE1CQziteeJimzLSJx+1C7xABjYw6xexghfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YD20W0OhhKO5W0uhRWpNQrhJSGRw0PD0wRLTJejVARc=;
 b=IuaIQyzrV83ZaJm7u+hBCOHt/j8QRaguL5nx3Qmzj2XcNsPANfFw9CQ3oNkn09cIPJNGwEOUyRZ5gdpFbH+j+5Lrw8hfQOjZIcK/0skytnNfbfaL+DgDqt+G+Sy2T3mb6HMrJCNqhN43Zo5XgxQvoxOjDJTuhX3qKVEROIZv6Dw2CYz4gWo6MwmtAvk11WJyi0tcSNcjAW08ZoXLzKfrqkknq5/KnN8rpiTxc1GHDWkvuPqpIgWMXef3i3PBMcUo1EA290Ll6Exjt9mp904oZfpq9toc7I6R+N8jEmbbTh2Lq2iDmHdUAzZ4nJftWPPX5zM7dcLI5bZ+ss+D8dwNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Fri, 15 May
 2026 11:01:52 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:01:52 +0000
Date: Fri, 15 May 2026 19:01:41 +0800
From: Philip Li <philip.li@intel.com>
To: Joonwon Kang <joonwonkang@google.com>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: mm/percpu-stats.c:125:9: error: aggregate value used where an
 integer was expected
Message-ID: <agb9FeleSouug7ji@rli9-mobl>
References: <202605150328.mn2hv1fZ-lkp@intel.com>
 <20260515044101.2517293-1-joonwonkang@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260515044101.2517293-1-joonwonkang@google.com>
X-ClientProxiedBy: KL1PR0401CA0003.apcprd04.prod.outlook.com
 (2603:1096:820:f::8) To CH0PR11MB5428.namprd11.prod.outlook.com
 (2603:10b6:610:d3::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|DM4PR11MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: bd82d505-a4bc-4679-cdbf-08deb2715e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|11063799003|18002099003|56012099003|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: Rq2hrcR0Gu2PHWeqq+nw/x2Xwk5FrGZAu9H0+FqUTIemj7rCe456K9BG+uwJ3Vymj2tIF+sHghwVjJNaGZiXkitO84gkQwRcQlJEUJuExOL3uY1+r5TfavlUCSBCCDk091mmUhrj6+/opQYo1XuI8akeux6WZmAk/j5t8w3YiKajv1liDue3IWv+FLyf0hyadray85zFzSw5dulAH68BX+2AlgwDpCXht+aNholbzQ8KLD+Ugx1JOZjwldagcDqUXPhmO2dbW7JBnPeIPkOZpsSHaffsb4vfJyr2oPdywswDqe8Eyi+VpMUfMs5cixRasJi5gUhiccUuZGgnum3k3dg5CF/Q+1HBScll6Lu0HJn6fJ5ETAiePhJxgWvi5EqGQcftgqi8eATK65vfToZ9goAs7499rr+hYEO3bh7DXpQXMVsSSf7iFdfFyoAIayzoG/LdMkgGgdFQCMgI61aNrLAPP6kJJcYJN2DyPEi+DIgrp1PjNlRzJivFsW78uRh2CT/5OoqLsgqSLu+kTxIGUwGpNCYro5Oewe3KrXE8kKRbOxCb3X6hoU0T1hqp/kSYLfsmTgBO465aEuB9gEdLb8YivzlN2MAEGYv4EAlsTH739E/G56MGdrdslYMCT3Wgz9LOcOmCtnKTioH44Ng08g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(18002099003)(56012099003)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xCRm4oO27AS49Y49mxaPwC8mw13OXSDalQlm7HmZzU+8iDJ3baJ/J2pzLjKB?=
 =?us-ascii?Q?6Dznb2F1NZPBmJUgk4kcMsaXi9P1K8cp1wXR4+JxhHD213HRxF+AUQbxzRIj?=
 =?us-ascii?Q?FzaUDtHhXFK04ecpMPhxq2n+9Pmu/kFw7hfCwCfEBAS6lgV57ZYSdZDDD0uH?=
 =?us-ascii?Q?5+oVV+FSPJezhs0/mQQb03mkUiQnLPrajteqRSOC3g3Q9p5YFBUCa15QJnv1?=
 =?us-ascii?Q?N00V5G5nabUSDvPWoFCTvSozH4EWE1DKN56LRAPO/keKwAKzGznXYIPnD1sl?=
 =?us-ascii?Q?pLROL7PssqXQ4Vy6TZmCHnGxxKtZqojSrx4zUaN7nZSWO1kcX9970ieHR4fR?=
 =?us-ascii?Q?uulSO8LyVpM4QZ62ibod57uQWXDMrFgURBK0u/AxKCy/WXmJeg9HHz3ieyv6?=
 =?us-ascii?Q?AgneQHsdp1RVybNKzs3Jl4SGmecCLPhpl3ZpuvpJtm5IhIkMzl02yRC8utt6?=
 =?us-ascii?Q?gPSsiOVi4fceFxsur+4aBlm5Bas3gp4U8ydNKaviPgOhwfOnUs1ZJ20yXShh?=
 =?us-ascii?Q?4o3UqND2jf8Iq0E6PT+k+BHjIXvteing9BtWg5fmtq+bib2w2ISniYM1Okyu?=
 =?us-ascii?Q?Avs4CuaAfzsdr00vVRHg3z60e1Ef8xT4RVNdVKht3lYQ7QgxkaL4oKUeF/Ib?=
 =?us-ascii?Q?ZPv0Blc/jOiIz4XWHH+3nUukuN+NQ3xS1tPZ5gYpsQourdnocPITv6KFvMtV?=
 =?us-ascii?Q?htXdo63ggSBK/bVbHc+gq21XhVs9sy8C4FNjZyo+7gNSYyBatAjOSr/pkN4N?=
 =?us-ascii?Q?6Xq3oI/w26AuWCZbl6ORse8Y4m4VovSrmmGY5KYqcrBNvkEZV/+J4FW+Zdm8?=
 =?us-ascii?Q?q9V5hddyQWnSsXm6eK2KTSpl3Jg1eyCqBEUt/Z3ooTIM5ln3JmhVhvhr7Dcj?=
 =?us-ascii?Q?Ga7Zp4hLToNi5MrRgg2EXDZ7oVp+taPcbGP/TrYoJA8rc3ehGFwAWzlUBSoC?=
 =?us-ascii?Q?WvU5P8frrT361p8zRl0r5Grhf+QbLDDni2xk0inrjZU8L9DUGy3eijO/kbbt?=
 =?us-ascii?Q?+qFAxaldQBVDp2XkEed//ub7iVTy+PTKye486gMpWNX9f4CFyVcMPgHp+fWo?=
 =?us-ascii?Q?j7tREG9HZQZitB0i3HRiIit04k4M8eH0rOi19Ynj8zfjCxkkDGoevQH5qyW0?=
 =?us-ascii?Q?8psMkBrbciY7MAF7uvkSwdD1zSlnkM/IaceLESLH7xW2ptA3LEuWABpwBVpF?=
 =?us-ascii?Q?MaToDoP/qS3EYIdtVcqspVOoPXBWtFmS12XWGZtqAyeVirT6hGoU+qeypIcA?=
 =?us-ascii?Q?kM5JUmUsHo+5iD5PGgpH8Z8Yfh2iLEz9MaVNcHtRjDX+FN12H/dfhcthJmy1?=
 =?us-ascii?Q?bN6g/e0wC4eIotOpc4+XfbPnpukNGuVFSl3cFkAoqDi9n/WMF4XLJ/aHdacX?=
 =?us-ascii?Q?0yKaX/rd4T9A3MZh/dnUnJRWVtv01HoC7ClQdaDAGEqzIPyOjBFPaxZxQy5S?=
 =?us-ascii?Q?5471Yypn7LiEzSMVSdt5fGETi84Z8M+yI8X4x7LvqvjUMAUgPcol2E8qKDv7?=
 =?us-ascii?Q?RmnRf/gzGwT2+AT52kUxLJ/r+gQ7hnH6LiaE0ESiGKRLfHJAmL6AwOw1iq39?=
 =?us-ascii?Q?wo5Ggn4bYoMQcbebJi1vN7OBEphM32r742ogjegn35j78Knqf49OCQ7uvoZo?=
 =?us-ascii?Q?O7V4cZPK3FEPYtjSRiG3e+KbfPlRi9vESkPcBFaRTFxjxUW/Sc/3G27BS7Oc?=
 =?us-ascii?Q?LgkYFeFza61mNnjyu3WS4BLoDQBuZ782xCPGFTCixFIG534AYKhVnQLFUwir?=
 =?us-ascii?Q?7vH3prrPbg=3D=3D?=
X-Exchange-RoutingPolicyChecked: UJ8X4VvVCgLfRq3Y4QoT8W/uy0Q7AVCWly/NuukmFXegc07c6cCFgBDX1QoF4k8ojqSOw/hsLOqNsX0lUDH4ggQQaf/rRTrW7JmvhyGBiV0KEfhC/SHEgtYewqHKHP1LQgzNJ0Yt+ddn6QzhOdG0iTSKzkoLwY21mvRFuPj6YTaadhUDaTpgBt0xDRc01uHvycA/pyUQ+ZkmCYPH1wcVu8PkGK11VZDQBsfgRdodqPbywp6wHOc0hxjj4e0pB1OyRPkFPl4zGjqBxut7w6SoyH4dyLQHKz2dpWIquTKvcxlCUapALOScRjTDdUoYpzfP+jAjcSy4s04TdUDnZZ4YgQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd82d505-a4bc-4679-cdbf-08deb2715e4d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:01:52.0489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsHuhuaVGMpCXNHPFDD6aEhnz9e0kaM0sKwMUdUdVtBFEhDVOgYoO9F0jQi8tjKTT7PmJAYdv0oJBoBH2x3y4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7760
X-OriginatorOrg: intel.com

On Fri, May 15, 2026 at 04:41:01AM +0000, Joonwon Kang wrote:
> > tree:   https://github.com/intel-lab-lkp/linux/commits/Joonwon-Kang/percpu-Do-not-trust-hint-starts-when-they-are-not-set/20260513-070153
> > head:   53a3f421840a59abecd38cc1be7c4f1d4516c3f1
> > commit: 27e83e031c0de38ffad3fe513474bff375c2a896 percpu: Introduce struct pcpu_region
> > date:   2 days ago
> > config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260515/202605150328.mn2hv1fZ-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150328.mn2hv1fZ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605150328.mn2hv1fZ-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    mm/percpu-stats.c: In function 'chunk_map_stats':
> > >> mm/percpu-stats.c:125:9: error: aggregate value used where an integer was expected
> >      125 |         P("contig_bytes", chunk_md->contig_hint * PCPU_MIN_ALLOC_SIZE);
> >          |         ^
> 
> Hi bot,
> 
> I guess you picked up an older version than v5. This issue has been fixed
> since v5. You can also find it in the latest version v6 [1].

Thanks for the info, sorry for this false report that the bot failed to detect
v6 and we will see how to further improve.

> 
> [1] https://lore.kernel.org/all/20260513085117.1024175-3-joonwonkang@google.com/
> 
> Thanks,
> Joonwon Kang
> 
