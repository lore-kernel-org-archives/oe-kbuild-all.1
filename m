Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD6F58106
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 07:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712129023; cv=fail; b=Cme1wJKBVyaGYJOgCcWaU0thWPNnbaqDNY2Ew0AyNJJkbIFRzW81wiAWK4WhsOaTwbKSzO5C8WTmrS3ApDq3V5UyDlwWqiIl808yqLhhp6wI9xGCiWhyjOoR7FlQuRn0KiBiq6SKGVgVmbPuEIcB7+kATE5O/ugFDlxwTuusPEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712129023; c=relaxed/simple;
	bh=paByiwoTd5DLzvADa/C0QIrWBhi8z2SFvRny0AFeBmI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S/X/mtNYH93yCbQkecAeFYNwQS6Dl0+uifaknaX6SnqqdoIXpQVS2bMqlwQJQQFbIsqQiA2JGDebbVve8dyylKoLtD5eP9OM4Lz08unPyUTbmX0lj3GHn4ca5C2NUfr5HAlAYkfpoyUneDbycOjpK+Wv22zb6bb2/8prZeTbReQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejJ3mxtx; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejJ3mxtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712129021; x=1743665021;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=paByiwoTd5DLzvADa/C0QIrWBhi8z2SFvRny0AFeBmI=;
  b=ejJ3mxtxElHk6kkuARkWQqAJOHBBMzxcLEwomrwxYeuidQbGwFi+19zK
   AZ/cwqc9/k9XSsvykUZmKriWEcKEJ/Ty4XU/aQfdUTLnUQ3oXMk3h9mdM
   bZhtN6mP52r5mTU0M5VrrEP0a0OOAhFJPX/P8azWEbm59FaKJcX4x6mou
   dKRi9CCiBRT+Jok11uA8fqPsh7zULvjYWzp7vecpUrlADwvULUYcCR922
   4T8Y8swDCeN0yLhEazEE2NI5UXNhtXc6Ysx5COmVM7AF2Q6EVhUqFERG1
   9mFiqW7IS4/h7zLE1wdzY8pbbVkPLlkP40qnYFSSKn+UzQ6nhyGPMq74H
   g==;
X-CSE-ConnectionGUID: 0XWoFZCuQ52u5dAEqg4kwQ==
X-CSE-MsgGUID: V1P0+DkdRCqCk5DuAq9T7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7240308"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7240308"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 00:23:40 -0700
X-CSE-ConnectionGUID: tl8y4AlKTtudPWrKwTpn+A==
X-CSE-MsgGUID: m4Wvg2wOR6yUTGvA/8L77A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18763157"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Apr 2024 00:23:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 00:23:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 00:23:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 00:23:39 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 00:23:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5AK6xx2oBrYQJfSoEkEThngzg9lnQcvyQy6iybZsEC0S1hwd77R4SAz1LTWSiqAZNygmy3KYBsWnxsPBVc5hH1mgDN/tLlkNDW/pS0q2YOjFJD5pMWgeq2oKyVDqfhp+l8cMU04y3u8GxkVuwf02HHylQB2ow8ojvkazhYMRX1m75Fk+36DrwxncgL1tuCinqJjxiOuMy5OOUZX6wO8DuusSHmbNlc2Hv7IL1FREPEBj8gPUe+sTX7vGWrwfRKoClfkVBh42V9ITEBtt6D7XjKxbRBvpZLfGL3BtGn+tVC0Acu3A4XSByXV5KmzeAsdrhx1wMEoKuDyv9UT1dRkag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oAbbFBmmNnDceksvfdDN13lUuga6sfmAdyvSKFptyA=;
 b=AH7CwOfl2crLIDsvp7wpHmvHyr5v//igpYaXZJ5mGb8rTZPWFQPouSdmPdycDiQSbqxrYtOgL63Hor7kkjSexdu1suAS1W3RopvD2vioXTUBfnrotnUZPCS2kuQH1bPDEYZnU2RnACD0gakoOMuRQJ6+LPQiQcOdRu9dc3DNl2nCEVx2oJSFBmtU+FeAiPuU/wQt7PaJ7rL1805O7eLIXRWQmZfKCyi+qTl+AiwIalD22FqP5Bt+liicdJ3DFevPz1H1mASqM1OMM08T4+dZ5BwI6280mQwi573dAjx+1JC5DR5hP5TKFI4dctQwYUW0dPQ3TGChCVCymh1bCr+qmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA2PR11MB5194.namprd11.prod.outlook.com (2603:10b6:806:118::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.21; Wed, 3 Apr
 2024 07:23:36 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7452.017; Wed, 3 Apr 2024
 07:23:36 +0000
Date: Wed, 3 Apr 2024 15:16:58 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2555/3220]
 arch/csky/include/asm/cmpxchg.h:138:25: error: implicit declaration of
 function 'cmpxchg_emu_u8'
Message-ID: <Zg0Cajm4nmQ67UTE@yujie-X299>
References: <202404022106.mYwpypit-lkp@intel.com>
 <eec09843-3962-4951-ad17-b15f2e311eb2@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eec09843-3962-4951-ad17-b15f2e311eb2@paulmck-laptop>
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA2PR11MB5194:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S7YUXBKFnR29NmkDq+gOMewqAIuYH6mmAUzLACuK8j7cIJ36BX4hNyfedoKhQ2ifegfRMl+HyQCLtcxwoTBzQXjp5NWg4fE65a3ZWcPfAYN5HBDKSFpcQcMSZi0a6ocyZBVs9CCbDibyn0kRFDxW8tFL24a6zXNeCROrEj1Gx0GnKwYIN/leHPVIFNg2MaSzrdEzoDa1KTZmCELe0A0FbaMvrRPhG0zSdPgQhRv7MYDdzlBgz115UVZUmaF01aXHtLcw/1ZI4fxLLImdKw5pLZqydovGsLvPjkPAnTovO+4yS9/IVNs/Jp60lDX1HVjtSrJsiPsMCs4CcJ5r36YVsjWfpXTeakPeC0DwST+oGbtT70otLumF62ZUGm2MdNaVSFOoo3ZuW1fYicfu2Of8mdEivXFfQTB/Mq11VATBOqOIj8oAayfo2TaiXELmFIWk+vR9RtbC1fk/vHYD0Mz2W0oFY0nnMwqSC+LwHJRROtnO+L9e6CRgnOCyXKfQgFw4j6J2f7zuWajGwqotkRaIOl8itd3P8EQ5469O5YCBApw+QmBnMljjtf0WJL8fszoaw96vBex2FgpOkahYXgODYIysY4fFyiMpdhjDMkQbD+/GRY/KQMsky5vAkDgVj/DV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3eI/C8QMpA9wM/7jAXzu18MXV6+6DF/lOF/jO5nmhAwvOKW3ss1m3l23zt/?=
 =?us-ascii?Q?wjQ6h1yhIhnf0wD2oHPV4catfAj5TrQeNAykQ+rTxxFjCd3jwEBdCOayvTJ6?=
 =?us-ascii?Q?nlf9uTwTahQN/laVqKgLvxm1yH7yjzYe71zOpSxAp0ur7pgOxqwo3A3E37Ju?=
 =?us-ascii?Q?Tk+N0Uh0V6dmCVs+NlrtdInGDyQLd7xPsHO1JTP/Ktf5D3AqTwimq1tQPzai?=
 =?us-ascii?Q?eYtVvifcw/LolyiFjXOFQZzZ9P38E/KLadd2o9I8yLcRbMX4s31Yus1kJ/EI?=
 =?us-ascii?Q?0Ik1VPDxgd/FZb83ApjV/KF/rO5ZBIO5sOkPxVL+L/15yf7WGT0b1SxLdqJi?=
 =?us-ascii?Q?jUXyQd8PUInLwD5XsBZ7NCwSyUjagXXsWPXQaWbLzkMloWsrMOp1N69dPrmr?=
 =?us-ascii?Q?jJsfrg0licNQqoAs4796oc1SKWsFuii2xXtFIU1XfSS+Gtwzq5fWx7c0FzWS?=
 =?us-ascii?Q?9pgmXzKwI6ggjAEszSsdoJLb2jgzEEkxPnYPF1kby/C0f4z0pl46oZGMsOpd?=
 =?us-ascii?Q?fqw5bnH7dqYyhH1d8WI64uOj3+uYNcCill2F88cUJ6ynbNnz1NFd07LbpyPc?=
 =?us-ascii?Q?dgpNUbhDIpp5vVmyyaJkGDdOWXPeulK6jo8HLGuZJsIrjdPtbwbi8R8cE4ac?=
 =?us-ascii?Q?p4O1tDJOkDbksl9aIpCKrgV2bFaC6kXwuBjqwm7vYvDkZK/UNsZe17OTcH1k?=
 =?us-ascii?Q?3Mf2cRihEYY8sBde0Po6n7AM+B6G4QdjgwSPAIQKCLqogcLCmjz9rPSi1lZ2?=
 =?us-ascii?Q?L0RQt4bu0K5umzB+Z/t4OR882keOZrGe0YBgtdhTuOh0VsqwpphFe92Cr6WX?=
 =?us-ascii?Q?jsJnYoLhs+e1HcfZIk4wfFHkxKZpGzJODI1SfUJKwKOlwbo06g2H1dMASI0P?=
 =?us-ascii?Q?1NFvvWLTUltv5L4RpojJEWXEFlLl7M2zj5kwGj8yBbpG3DeOpBN91YtNtcf7?=
 =?us-ascii?Q?5ZeLoq7rfp03ayZZgv0pDz/nbL+p6Mufe/b8b8Xu/d8SKWnjwae+NWbtl9T+?=
 =?us-ascii?Q?M8BUGKEEJdesH4dhbr1Mra7cbNlYlTdwXDcNq+J9TbPTPLi1TxbapWk322YQ?=
 =?us-ascii?Q?gAS3vGj7nuzIVCwtiY8jVUAc9O7/ySkLxUoTXh+8dg84eqAx6gEQNQycLRf5?=
 =?us-ascii?Q?XRh+OwP2mrmmpVG/DbhZuXmJzquGiIK+MLUdB41Ht1uoK4zryPlOOXcLPRaz?=
 =?us-ascii?Q?dLK/XYlb+AyhJbXfPVhzAeaFNJU7buUqLH2CniO3MZtSDI4ilMYff07YX6mn?=
 =?us-ascii?Q?LGpBwkVu87E8ozA2pUYkMPA4byhKMDgVQNuLUCq3jgCz2ch3pj5vOKl4HnFU?=
 =?us-ascii?Q?7tmJOdiXjZPkibnf0wfnggt3DcgHSGRhxpMQHz81XoCMDBMsh1QFfiuNPGWf?=
 =?us-ascii?Q?CJ+iWR4lTin6WP9otgdruv/mCNhTQxw0pv75SGnRLfmek4IMXv+Tgcrvg2cE?=
 =?us-ascii?Q?+v69Ie9R2vfz+JyINsd97jKoKY57EWXkMfLZByVQEt9Uk+Y1eigfEbxefxNV?=
 =?us-ascii?Q?3O4PBYerEk9+qgxbkEp4YGFfE+PooPWvvDiGjBETaSzjHCabBd3X46ss8fSe?=
 =?us-ascii?Q?WPRsVTZwnEytNisA+9orffVJyAqcL3Et3ie23GNZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8cc92c-1116-4025-879a-08dc53aefa0d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 07:23:36.7161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHXTCgMndvJ+py0DeKlCNncc55VnDH2Rn+r3qquG3qPhTV2tzAXKXULShF1F1PBAkLguf+3DruY/6E5xyZMtjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5194
X-OriginatorOrg: intel.com

Hi Paul,

On Tue, Apr 02, 2024 at 10:26:22AM -0700, Paul E. McKenney wrote:
> On Tue, Apr 02, 2024 at 09:15:39PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   c0b832517f627ead3388c6f0c74e8ac10ad5774b
> > commit: ea7f9bb7268e89fff8590ab5a360f5b27a0fc19a [2555/3220] csky: Emulate one-byte and two-byte cmpxchg
> > config: csky-randconfig-r012-20230202 (https://download.01.org/0day-ci/archive/20240402/202404022106.mYwpypit-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404022106.mYwpypit-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202404022106.mYwpypit-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> 
> And yet again, does the patch at the end of this email clear this up
> for you?

Please kindly see the inline comments.

> 
> 						Thanx, Paul
> 
> >    In file included from arch/csky/include/asm/atomic.h:9,
> >                     from include/linux/atomic.h:7,
> >                     from include/asm-generic/bitops/lock.h:5,
> >                     from arch/csky/include/asm/bitops.h:69,
> >                     from include/linux/bitops.h:68,
> >                     from include/linux/log2.h:12,
> >                     from kernel/bounds.c:13:
> >    include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
> > >> arch/csky/include/asm/cmpxchg.h:138:25: error: implicit declaration of function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]

This error is caused by missing header file. It can be fixed by adding
the include, similar to some previous reports.

#include <linux/cmpxchg-emu.h>

> >      138 |                 __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> >          |                         ^~~~~~~~~~~~~~
> >    arch/csky/include/asm/cmpxchg.h:165:10: note: in expansion of macro '__cmpxchg'
> >      165 |         (__cmpxchg((ptr), (o), (n), sizeof(*(ptr))))
> >          |          ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
> >     2026 |         return raw_cmpxchg(&v->counter, old, new);
> >          |                ^~~~~~~~~~~
> > >> arch/csky/include/asm/cmpxchg.h:141:25: error: implicit declaration of function 'cmpxchg_emu_u16' [-Werror=implicit-function-declaration]
> >      141 |                 __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >          |                         ^~~~~~~~~~~~~~~
> >    arch/csky/include/asm/cmpxchg.h:165:10: note: in expansion of macro '__cmpxchg'
> >      165 |         (__cmpxchg((ptr), (o), (n), sizeof(*(ptr))))
> >          |          ^~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> >       55 | #define raw_cmpxchg arch_cmpxchg
> >          |                     ^~~~~~~~~~~~
> >    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
> >     2026 |         return raw_cmpxchg(&v->counter, old, new);
> >          |                ^~~~~~~~~~~
> >    cc1: some warnings being treated as errors
> >    make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
> >    make[3]: Target 'prepare' not remade because of errors.
> >    make[2]: *** [Makefile:1197: prepare0] Error 2
> >    make[2]: Target 'prepare' not remade because of errors.
> >    make[1]: *** [Makefile:240: __sub-make] Error 2
> >    make[1]: Target 'prepare' not remade because of errors.
> >    make: *** [Makefile:240: __sub-make] Error 2
> >    make: Target 'prepare' not remade because of errors.
> > 
> > 
> > vim +/cmpxchg_emu_u8 +138 arch/csky/include/asm/cmpxchg.h
> > 
> >    125	
> >    126	#define arch_cmpxchg_acquire(ptr, o, n) \
> >    127		(__cmpxchg_acquire((ptr), (o), (n), sizeof(*(ptr))))
> >    128	
> >    129	#define __cmpxchg(ptr, old, new, size)				\
> >    130	({								\
> >    131		__typeof__(ptr) __ptr = (ptr);				\
> >    132		__typeof__(new) __new = (new);				\
> >    133		__typeof__(new) __tmp;					\
> >    134		__typeof__(old) __old = (old);				\
> >    135		__typeof__(*(ptr)) __ret;				\
> >    136		switch (size) {						\
> >    137		case 1:							\
> >  > 138			__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> >    139			break;						\
> >    140		case 2:							\
> >  > 141			__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> >    142			break;						\
> >    143		case 4:							\
> >    144			asm volatile (					\
> >    145			RELEASE_FENCE					\
> >    146			"1:	ldex.w		%0, (%3) \n"		\
> >    147			"	cmpne		%0, %4   \n"		\
> >    148			"	bt		2f       \n"		\
> >    149			"	mov		%1, %2   \n"		\
> >    150			"	stex.w		%1, (%3) \n"		\
> >    151			"	bez		%1, 1b   \n"		\
> >    152			FULL_FENCE					\
> >    153			"2:				 \n"		\
> >    154				: "=&r" (__ret), "=&r" (__tmp)		\
> >    155				: "r" (__new), "r"(__ptr), "r"(__old)	\
> >    156				:);					\
> >    157			break;						\
> >    158		default:						\
> >    159			BUILD_BUG();					\
> >    160		}							\
> >    161		__ret;							\
> >    162	})
> >    163	
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> ------------------------------------------------------------------------
> 
> commit 58155a7e67f350f00c2df5b6066597fe438543cb
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Tue Apr 2 10:24:57 2024 -0700
> 
>     squash! csky: Emulate one-byte and two-byte cmpxchg
>     
>     [ paulmck: Apply kernel test robot feedback. ]
>     
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
> index 848a8691c5a2a..a3dc0a5b1cc3d 100644
> --- a/arch/csky/include/asm/cmpxchg.h
> +++ b/arch/csky/include/asm/cmpxchg.h
> @@ -62,10 +62,10 @@
>  	__typeof__(*(ptr)) __ret;				\
>  	switch (size) {						\
>  	case 1:							\
> -		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
>  	case 2:							\
> -		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
>  	case 4:							\
>  		asm volatile (					\
> @@ -98,10 +98,10 @@
>  	__typeof__(*(ptr)) __ret;				\
>  	switch (size) {						\
>  	case 1:							\
> -		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
>  	case 2:							\
> -		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
>  	case 4:							\
>  		asm volatile (					\
> @@ -135,10 +135,10 @@
>  	__typeof__(*(ptr)) __ret;				\
>  	switch (size) {						\
>  	case 1:							\
> -		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> +		__ret = cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
>  	case 2:							\
> -		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
> +		__ret = cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
>  		break;						\
>  	case 4:							\
>  		asm volatile (					\
> 

The patch above can fix some of the warnings, but not completely. An
extended fix is shown below. Could you please help review?

Thanks,
Yujie

-----------------------------------------------------------------

diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
index 848a8691c5a2a..a6a4805064a40 100644
--- a/arch/csky/include/asm/cmpxchg.h
+++ b/arch/csky/include/asm/cmpxchg.h
@@ -6,6 +6,7 @@
 #ifdef CONFIG_SMP
 #include <linux/bug.h>
 #include <asm/barrier.h>
+#include <linux/cmpxchg-emu.h>
 
 #define __xchg_relaxed(new, ptr, size)                         \
 ({                                                             \
@@ -62,10 +63,10 @@
        __typeof__(*(ptr)) __ret;                               \
        switch (size) {                                         \
        case 1:                                                 \
-               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                          \
        case 2:                                                 \
-               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                          \
        case 4:                                                 \
                asm volatile (                                  \
@@ -98,10 +99,10 @@
        __typeof__(*(ptr)) __ret;                               \
        switch (size) {                                         \
        case 1:                                                 \
-               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                          \
        case 2:                                                 \
-               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                          \
        case 4:                                                 \
                asm volatile (                                  \
@@ -135,10 +136,10 @@
        __typeof__(*(ptr)) __ret;                               \
        switch (size) {                                         \
        case 1:                                                 \
-               __ret = cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                          \
        case 2:                                                 \
-               __ret = cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
+               __ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
                break;                                          \
        case 4:                                                 \
                asm volatile (                                  \

