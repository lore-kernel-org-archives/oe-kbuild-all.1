Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF0D26E6F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 13:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763731220; cv=fail; b=X5Ni9d5BPYDEl1qyn8BrB32Wb3F45RaNj7iqcapLcPdK6XaSD1yUz+QDWg+peHate3cA1fscJQrUkbMjDxkY1DfLc8o/fSO9EDx7GHTu9aA18R0eib3NhCrnNLZNijJV3vrXRAhkGU22l+fjduNAIV8ghSEgBPUAQs2QstdZxWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763731220; c=relaxed/simple;
	bh=FQJrGaQ7LU0FfGpm+2pMDjJEPpbq4V60uW4joG9wYEA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MSXi/1q3/87G7DGt8msXSnP6wahglI37+iwM7wRlo+6k5/xK+sgJfzQvneiprt3BCgreImQ0PBVSFTk4VAZtW0XR+7GeTsw0ud/k3nNq+kxLn3Vk89uZqmBMjlCv+0FsFxbMWqO6lUkYM7Wl9EUMv+kPnfs+hfGIc9cCwALYhPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTf+MTRv; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTf+MTRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763731217; x=1795267217;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FQJrGaQ7LU0FfGpm+2pMDjJEPpbq4V60uW4joG9wYEA=;
  b=LTf+MTRvzsTe2uvlHRdOxsDTj0SmcJTChLAHtMvDAlfHHFr2Zos0plLk
   SRJaU75u7nwkWZjeVnFXef8b11e1HLRyhZtlSbrRLtUkVbWvIvMlxGwJ/
   e1DuGHA1v3eMnRy/3rystUwXWymliRKDpkexl/C1WtcF/XZY3kSpLEUHW
   2nvfcyA45h/iEIH4AgC/iGpoD1UH1tpYbonSkbD0KUjDS9cooNC1B5bhK
   h57YU4nn7SCwg03Af1cH4wXcGv84Tc6UZtCPaYOELdw4W0FbXQXVN6LJn
   OkN47EBbEmBFiPr0ywmElw53AZ1FbECq7/PIJ1zK9h+8kJKCAk8vvDUUk
   w==;
X-CSE-ConnectionGUID: Y1TrAwRER1uvBZGa7nMFwg==
X-CSE-MsgGUID: 5xQU35gbRXW10r6xvO4g0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69689341"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="69689341"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 05:20:05 -0800
X-CSE-ConnectionGUID: WqeVwfrcSm+ZQ2iQQKwT2Q==
X-CSE-MsgGUID: KLHVEUBZSgy3Q3kJHKfRhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191718534"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 05:20:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 05:20:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 05:20:04 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 05:20:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LF+0SRbWSEUcbH8VSUHCLaRNjyMoBxn2qA6ifm7KXl9TOWyfbzfDYwOPGT/06lS30rjHp/kX+SYsZlcsb1q3vTYVQ7SPXrs4LaIvGoi/DfFMAZktVLeZNCFJv0mKN/cy9R9FkM7E2TkAziVo15aFIJ+OTGLTf4SGIccHi1uYEBJvw0iXmtjCyI3bEn7G4FdRnZDpDVXWKmtCqDEAK4gBpSxWl4oS7azBcuhwh2RRei9nlkHmen0c1mxVYjRfiQY42k/8myOvdqRywhEVZYe3QHtaZr3+Y5G0w0nI7oCUcdZbOXa3mEUS44no2axkay2Tr6DPs5zhkKNQjRau46q3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdrWEjJ++L9HPnwxyOOpHh36pvNoHr0j59xNxdcRqyk=;
 b=OMtgQUyot4Y06MRTMBv8D0hrdIAom9NZ5mJdIn26VfoqSlwI4mnWX9zemdo6ffqcBvxatLpqsb1JcqjAq921Tu1OxnfLORRNNBQwoAj4TnxMzPOdX98rkuu/ncPMg+O6+ejDoutGuj/OH5ePatKOq3qyADj9UtAga0h+ILdjIZl/uZNC/8QRwhxacJpMd6npYy09/tiKz/YAUHtvh+BKyZc8m3/cKpLf/swiwo3mM0G9H1mF128SNYVDd6FPk+Ge5qVJbtEnhKaTNwfr3uW83gBLasiglYmT2oC+dfQNfLoitGEXlhe2zUfOVuOqXB1qcZP/h+DZzN0oOM4nXSMkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com (2603:10b6:a03:568::21)
 by CYYPR11MB8332.namprd11.prod.outlook.com (2603:10b6:930:be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 13:19:55 +0000
Received: from SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::fc95:158a:24ce:885b]) by SJ2PR11MB8587.namprd11.prod.outlook.com
 ([fe80::fc95:158a:24ce:885b%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 13:19:55 +0000
Date: Fri, 21 Nov 2025 21:19:47 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
CC: kernel test robot <lkp@intel.com>, Dongsheng Yang
	<dongsheng.yang@linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: Re: include/linux/fortify-string.h:571:4: warning: call to
 '__write_overflow_field' declared with attribute warning: detected write
 beyond size of field (1st parameter); maybe use struct_group()?
Message-ID: <aSBm8+ZXPfHHvozl@xsang-OptiPlex-9020>
References: <202511171758.8thF02dJ-lkp@intel.com>
 <1aebcf4a-0d88-014e-18a4-fe36e528dd35@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1aebcf4a-0d88-014e-18a4-fe36e528dd35@redhat.com>
X-ClientProxiedBy: KU2P306CA0041.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3c::13) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8587:EE_|CYYPR11MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: ee111ba8-a78f-4507-b66c-08de2900a903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v+FyxpaQtGxcl3o7rmrZBmY0npqP65SnG6ax8tnyjdP0r6IlkpKiNGchPXe9?=
 =?us-ascii?Q?1jKI7q7K9grdIBcFRii1eY2akLhtXyjhWOy3NuxFRvlwF0ViLxz6xooQ1xBN?=
 =?us-ascii?Q?Ws7iWjgOh5X/efySOEzB2ywUowfDJ/wo2P4UPmjHY0IOhQkUTKHi8GeQRSaF?=
 =?us-ascii?Q?vCdWOrL5IewV52DrbMcG16009mBjF/sm+PliFRWifDjvMc2G3Ypz/x4Jw8Ut?=
 =?us-ascii?Q?ROJWrpykzAGP0Ml5kqQbzflUinV+TjScDBM5Eo+k8wrOF+ZdMYrEA+WePoC3?=
 =?us-ascii?Q?XLx74jdXS/ptN15HOJl5YT8yHGMP69G8CY7JMCK0pgQRf9sYPtSgcd3ZQdYV?=
 =?us-ascii?Q?6IhQjee4SntJNE3SMjboHEMgrUG+yaadHbXC3xfsad6v1S06m8bljKaEkCTr?=
 =?us-ascii?Q?TxOxe0xwj+JFaxHQ3fFgnjxs5f/fgboDoX/d57IWP6mS3GCJDvXoWj8SxkdR?=
 =?us-ascii?Q?QeF3FwUSPNPNLxgeYtFfs0pnejdy2dkI6OEt+vdQghQSQfRpMdq9lNeFcbPl?=
 =?us-ascii?Q?KRsVwZYNBhU1AQ/aOsrebuIC2xwB4UY1lnop2ppVTxRAbHgB+lQf9oiyzKuh?=
 =?us-ascii?Q?Z2dJOBGcZxesYEFRs+xJcL703h1MvjWFLj2CttEiW45iF8I5lDCXFjiJey8E?=
 =?us-ascii?Q?rsOwk8cJ0wl6IF915RB6+mM2QLZ2l65/Y9kD7fu80wrerHAiQle1weBzzIrL?=
 =?us-ascii?Q?LToFfG3C9SsEqKxIyoa63spUOuDoEquCRreQOL0XDd0v8chWPocPw3gwoPoG?=
 =?us-ascii?Q?QHrm34bYPKydmVMoITaGPxoMq8M7Z6AJt0ZRYldklwtfKgBiG/5Nt1EPLIJT?=
 =?us-ascii?Q?UlEj53pJbxLQwAkSVhIvlz9qjzHDz1nQYx8t40exy29MNFxUt8I68izPcSM8?=
 =?us-ascii?Q?pILI35QW79K3s1S1Zhc2OXHSilnGN4kFiervIH8vGKmBzm8eYKsm5LA9m0hT?=
 =?us-ascii?Q?cNIIkLTdbfF3wfoLNLHIwCLEdRDvt5d6zFFmBDmnwvx9PFpyj7mCNYU5ufWY?=
 =?us-ascii?Q?oQsD02/46SJPsv3m7zaxCKmp1BP6YMwVW+SHkOvu4ZV2Chy2DtJd/an/cfVh?=
 =?us-ascii?Q?YGV2FdqONhUgXB5X/W9we8HokTYQZLOX+mvShM10Jwm6lobL+x2FbjEjq/Hn?=
 =?us-ascii?Q?jQMZ4jj2EgOeMPMGqqfYPOPUvykaLCyaTdzIKDyZLBBp6fE6WCjS+W+nmSaH?=
 =?us-ascii?Q?JDUhj3sCZT94QkSTr1lH+0C2P62vrDCZU47Klkqxgmzkr8R992fhyF4YEY48?=
 =?us-ascii?Q?+pNIL1gqogT2/dhnU/l4/JkbI+T8T8wYqL9xtHeogxvMCwxEv1pLHZENhhIZ?=
 =?us-ascii?Q?oaq3l2fytRi3Fx7ugA530X8TjNsEC1HqwQescIsfhAM7aG9X2EjYBmNiMZ4T?=
 =?us-ascii?Q?8x5zBaEy84g9hVGTPVDE2PQcPHYxOMNSWOhwnLPm0rAZdEYxRLSTfMSYy72a?=
 =?us-ascii?Q?iQa+Wv/flzfuqWQbFyxfCmAVMCdPoAX9QYwgsjrzcpMOLoqUHaBDsQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8587.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xrewNYVKfc4+68R4hP51V4et3U1FusCRnP3gy+vMmXsgWgwUEGLvqSaJSNu5?=
 =?us-ascii?Q?9GUKJFVyBevjzjI5NTKi8mw4t88q8d5qux25qGMfrE0UU94A3bySxlFUgo5v?=
 =?us-ascii?Q?LKCUoE0mBjUDeHcXZ1lCwTeCr1DeEd6bf/3lvtEmw1rXtjcwLCZdKN7WvGoz?=
 =?us-ascii?Q?z9CzzNPGPp1QleMgMcyHjvpSJhIX5R93tiz26/wMvSicTgf70FZ7y6h44FBs?=
 =?us-ascii?Q?dMSU7owHWQvG6ReHcIWCJGQUSCikck2AruM+wfGaCl/sDru/LHquElxOFcjq?=
 =?us-ascii?Q?QZT/Crqnj6g4FIhHKne/WKzmD6BuIeHeYVZOh8uKEFv2HX37loZTgqCZM48X?=
 =?us-ascii?Q?Jl8AZeDLTFZUf80wM5bgtwFQuCfnSfZDD571OwDvUDyH8JL1Tp5dsOmsMcCh?=
 =?us-ascii?Q?ptdJlwFz7GbztWljy2TMEIGX3uftOk7HJiIF3CVE+cMOaxQzYAO6/q2zPXC/?=
 =?us-ascii?Q?G/1y4RoQDHHo3TrZK64aCOXd5JzxmCV/mcBL3dG6Lm9jcwKquIWxM149wvoN?=
 =?us-ascii?Q?bKzQchmFnPXF943RCuxbnQ5azSRiyDN0tgdu+N0LkvGbWpTA9nhfmCxqg9Ph?=
 =?us-ascii?Q?yLmfa9qyn9kcOBz5fIQfyELOZLL0Kv3PyO0STnR6669Hdmdck0xSWQN3zhBn?=
 =?us-ascii?Q?9vgmvSfhRCzxFMKLHewu24k71OS9L71shK9Rq6QS4CLathF2Pj3BhCvYuRnW?=
 =?us-ascii?Q?E2V7Tw/6yur/gP6ieFOoutIFLRl0I+2X5Ju48Crb5lsIZje+HjAmHMb5GFKk?=
 =?us-ascii?Q?8mBsvnhI5PkKfNPMEqNSiod/eMSt96GtxjFZu03YaDVo0ymc1S8TdDdJQqOu?=
 =?us-ascii?Q?D8u+QzuaTYVudNh6z4fxSnPMUcD0VcamJ2iZN/vpHLyWkpwIolr0Gbhcmcv6?=
 =?us-ascii?Q?6XJWEUQUsPfbJ9RBXa6VA+jG59eqNrHdUPuEqsiBCWfrzhKEOpjLtpJNAEfo?=
 =?us-ascii?Q?8qqujHkWfilPmB/MneuwAA+nH8fmZpKvwCo3jiWzs2TC/xQHJuuQvZ21sS/J?=
 =?us-ascii?Q?LWhgJp2TU/8BnuHm/k+WD7Z3e/5C+q9lb+/ZWMxArx3FPSjLqsKy6YsRti+4?=
 =?us-ascii?Q?QKWVVOxRy4hEi4Dii86Chpo39k2uCN6oBVv1/2jpNz5/v/r6fkwdZQFrFXjj?=
 =?us-ascii?Q?uH2cwBLyH+gG6EqV8Zv75842Bw9hRc8prxrTUhEYm7hM3jQPB/1ar8lVgQDl?=
 =?us-ascii?Q?QjE1mbPYOCqP/q2xKw/XzN/eCPBqm5AHpDbM2xHZmxT0EPi8dt/bd0WFPMYq?=
 =?us-ascii?Q?lR3dGU3AdAoyA7Rp+3X4LrWjE47lsXwBvQGLd9tE8dPjbfq36GiCNgXW17eY?=
 =?us-ascii?Q?JxFlThRYsBXo/p3yKAmXsraaKQSR06u3eAfPeDcge1gXh2AINi6XEUrLDaNB?=
 =?us-ascii?Q?Sf2oKWP69enznS+V0vkGeUzDtcLgb04hvg4nd5ddIh+7ONsp7LAeoh4s28lU?=
 =?us-ascii?Q?BeTkymF781zFchnAT0MKahiAHoazRufAtlQQsIaOovdI44sc7GXPJO/zfkLB?=
 =?us-ascii?Q?hgb1n8o/jtwupCHpM8t5BI6ZDaH0wNBX4L06EFoAuLCi+54+8HPynMlxMIf8?=
 =?us-ascii?Q?Ze19NeHovx+aucx1dp4VqwjOq6y2jcyyiGIkvLy+sHWQTMsyleVidRzWO/Px?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee111ba8-a78f-4507-b66c-08de2900a903
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:19:54.9001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EUP/fmn+qqD3HMHnxW+6W309N38gFrCKJrspdR4I85INfl+R71mCPLs1BariK09l7YpCOjTrh/lBZbEyrxulg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8332
X-OriginatorOrg: intel.com

hi, Mikulas,

On Tue, Nov 18, 2025 at 07:24:49PM +0100, Mikulas Patocka wrote:
> Hi
> 
> Would you explain what's wrong there?
> 
> at drivers/md/dm-pcache/cache_key.c:816 there's
> cache_pos_copy(&cache->key_head, pos);
> 
> cache_pos_copy is defined as:
> static inline void cache_pos_copy(struct pcache_cache_pos *dst, struct pcache_cache_pos *src)
> {
>         memcpy(dst, src, sizeof(struct pcache_cache_pos));
> }
> 
> cache->key_head has the type struct pcache_cache_pos
> pos has the type struct pcache_cache_pos *
> pos points to the local variable pos_tail, that has the type 
> pcache_cache_pos.
> 
> So, I don't see any access beyond end of structure there. Am I missing 
> something?

by more tests, this could be compiler issue. if we change to use gcc-15, the
issue gone.

we will configure the bot to avoid sending report for this warning.

thanks

> 
> Mikulas
> 
> 
> On Mon, 17 Nov 2025, kernel test robot wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   6a23ae0a96a600d1d12557add110e0bb6e32730c
> > commit: 1d57628ff95b32d5cfa8d8f50e07690c161e9cf0 dm-pcache: add persistent cache target in device-mapper
> > date:   3 months ago
> > config: riscv-randconfig-r113-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171758.8thF02dJ-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 9.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171758.8thF02dJ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511171758.8thF02dJ-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from include/linux/string.h:382,
> >                     from include/linux/bitmap.h:13,
> >                     from include/linux/cpumask.h:12,
> >                     from include/linux/smp.h:13,
> >                     from include/linux/lockdep.h:14,
> >                     from include/linux/spinlock.h:63,
> >                     from include/linux/sched.h:37,
> >                     from include/linux/mempool.h:8,
> >                     from include/linux/bio.h:8,
> >                     from drivers/md/dm-pcache/segment.h:5,
> >                     from drivers/md/dm-pcache/cache.h:5,
> >                     from drivers/md/dm-pcache/cache_key.c:2:
> >    In function 'fortify_memcpy_chk',
> >        inlined from 'cache_pos_copy' at drivers/md/dm-pcache/cache.h:403:2,
> >        inlined from 'cache_replay' at drivers/md/dm-pcache/cache_key.c:816:2:
> > >> include/linux/fortify-string.h:571:4: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
> >      571 |    __write_overflow_field(p_size_field, size);
> >          |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > 
> > vim +/__write_overflow_field +571 include/linux/fortify-string.h
> > 
> > a28a6e860c6cf2 Francis Laniel 2021-02-25  515  
> > f68f2ff91512c1 Kees Cook      2021-04-20  516  /*
> > f68f2ff91512c1 Kees Cook      2021-04-20  517   * To make sure the compiler can enforce protection against buffer overflows,
> > f68f2ff91512c1 Kees Cook      2021-04-20  518   * memcpy(), memmove(), and memset() must not be used beyond individual
> > f68f2ff91512c1 Kees Cook      2021-04-20  519   * struct members. If you need to copy across multiple members, please use
> > f68f2ff91512c1 Kees Cook      2021-04-20  520   * struct_group() to create a named mirror of an anonymous struct union.
> > f68f2ff91512c1 Kees Cook      2021-04-20  521   * (e.g. see struct sk_buff.) Read overflow checking is currently only
> > f68f2ff91512c1 Kees Cook      2021-04-20  522   * done when a write overflow is also present, or when building with W=1.
> > f68f2ff91512c1 Kees Cook      2021-04-20  523   *
> > f68f2ff91512c1 Kees Cook      2021-04-20  524   * Mitigation coverage matrix
> > f68f2ff91512c1 Kees Cook      2021-04-20  525   *					Bounds checking at:
> > f68f2ff91512c1 Kees Cook      2021-04-20  526   *					+-------+-------+-------+-------+
> > f68f2ff91512c1 Kees Cook      2021-04-20  527   *					| Compile time  |   Run time    |
> > f68f2ff91512c1 Kees Cook      2021-04-20  528   * memcpy() argument sizes:		| write | read  | write | read  |
> > f68f2ff91512c1 Kees Cook      2021-04-20  529   *        dest     source   length      +-------+-------+-------+-------+
> > f68f2ff91512c1 Kees Cook      2021-04-20  530   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
> > f68f2ff91512c1 Kees Cook      2021-04-20  531   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
> > f68f2ff91512c1 Kees Cook      2021-04-20  532   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
> > f68f2ff91512c1 Kees Cook      2021-04-20  533   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
> > f68f2ff91512c1 Kees Cook      2021-04-20  534   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
> > f68f2ff91512c1 Kees Cook      2021-04-20  535   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
> > f68f2ff91512c1 Kees Cook      2021-04-20  536   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
> > f68f2ff91512c1 Kees Cook      2021-04-20  537   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
> > f68f2ff91512c1 Kees Cook      2021-04-20  538   *					+-------+-------+-------+-------+
> > f68f2ff91512c1 Kees Cook      2021-04-20  539   *
> > f68f2ff91512c1 Kees Cook      2021-04-20  540   * y = perform deterministic compile-time bounds checking
> > f68f2ff91512c1 Kees Cook      2021-04-20  541   * n = cannot perform deterministic compile-time bounds checking
> > f68f2ff91512c1 Kees Cook      2021-04-20  542   * n/a = no run-time bounds checking needed since compile-time deterministic
> > f68f2ff91512c1 Kees Cook      2021-04-20  543   * B = can perform run-time bounds checking (currently unimplemented)
> > f68f2ff91512c1 Kees Cook      2021-04-20  544   * V = vulnerable to run-time overflow (will need refactoring to solve)
> > f68f2ff91512c1 Kees Cook      2021-04-20  545   *
> > f68f2ff91512c1 Kees Cook      2021-04-20  546   */
> > 54d9469bc515dc Kees Cook      2021-06-24  547  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
> > f68f2ff91512c1 Kees Cook      2021-04-20  548  					 const size_t p_size,
> > f68f2ff91512c1 Kees Cook      2021-04-20  549  					 const size_t q_size,
> > f68f2ff91512c1 Kees Cook      2021-04-20  550  					 const size_t p_size_field,
> > f68f2ff91512c1 Kees Cook      2021-04-20  551  					 const size_t q_size_field,
> > 475ddf1fce1ec4 Kees Cook      2023-04-07  552  					 const u8 func)
> > a28a6e860c6cf2 Francis Laniel 2021-02-25  553  {
> > a28a6e860c6cf2 Francis Laniel 2021-02-25  554  	if (__builtin_constant_p(size)) {
> > f68f2ff91512c1 Kees Cook      2021-04-20  555  		/*
> > f68f2ff91512c1 Kees Cook      2021-04-20  556  		 * Length argument is a constant expression, so we
> > f68f2ff91512c1 Kees Cook      2021-04-20  557  		 * can perform compile-time bounds checking where
> > fa35198f39571b Kees Cook      2022-09-19  558  		 * buffer sizes are also known at compile time.
> > f68f2ff91512c1 Kees Cook      2021-04-20  559  		 */
> > f68f2ff91512c1 Kees Cook      2021-04-20  560  
> > f68f2ff91512c1 Kees Cook      2021-04-20  561  		/* Error when size is larger than enclosing struct. */
> > fa35198f39571b Kees Cook      2022-09-19  562  		if (__compiletime_lessthan(p_size_field, p_size) &&
> > fa35198f39571b Kees Cook      2022-09-19  563  		    __compiletime_lessthan(p_size, size))
> > a28a6e860c6cf2 Francis Laniel 2021-02-25  564  			__write_overflow();
> > fa35198f39571b Kees Cook      2022-09-19  565  		if (__compiletime_lessthan(q_size_field, q_size) &&
> > fa35198f39571b Kees Cook      2022-09-19  566  		    __compiletime_lessthan(q_size, size))
> > a28a6e860c6cf2 Francis Laniel 2021-02-25  567  			__read_overflow2();
> > f68f2ff91512c1 Kees Cook      2021-04-20  568  
> > f68f2ff91512c1 Kees Cook      2021-04-20  569  		/* Warn when write size argument larger than dest field. */
> > fa35198f39571b Kees Cook      2022-09-19  570  		if (__compiletime_lessthan(p_size_field, size))
> > f68f2ff91512c1 Kees Cook      2021-04-20 @571  			__write_overflow_field(p_size_field, size);
> > f68f2ff91512c1 Kees Cook      2021-04-20  572  		/*
> > f68f2ff91512c1 Kees Cook      2021-04-20  573  		 * Warn for source field over-read when building with W=1
> > f68f2ff91512c1 Kees Cook      2021-04-20  574  		 * or when an over-write happened, so both can be fixed at
> > f68f2ff91512c1 Kees Cook      2021-04-20  575  		 * the same time.
> > f68f2ff91512c1 Kees Cook      2021-04-20  576  		 */
> > fa35198f39571b Kees Cook      2022-09-19  577  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
> > fa35198f39571b Kees Cook      2022-09-19  578  		     __compiletime_lessthan(p_size_field, size)) &&
> > fa35198f39571b Kees Cook      2022-09-19  579  		    __compiletime_lessthan(q_size_field, size))
> > f68f2ff91512c1 Kees Cook      2021-04-20  580  			__read_overflow2_field(q_size_field, size);
> > a28a6e860c6cf2 Francis Laniel 2021-02-25  581  	}
> > f68f2ff91512c1 Kees Cook      2021-04-20  582  	/*
> > f68f2ff91512c1 Kees Cook      2021-04-20  583  	 * At this point, length argument may not be a constant expression,
> > f68f2ff91512c1 Kees Cook      2021-04-20  584  	 * so run-time bounds checking can be done where buffer sizes are
> > f68f2ff91512c1 Kees Cook      2021-04-20  585  	 * known. (This is not an "else" because the above checks may only
> > f68f2ff91512c1 Kees Cook      2021-04-20  586  	 * be compile-time warnings, and we want to still warn for run-time
> > f68f2ff91512c1 Kees Cook      2021-04-20  587  	 * overflows.)
> > f68f2ff91512c1 Kees Cook      2021-04-20  588  	 */
> > f68f2ff91512c1 Kees Cook      2021-04-20  589  
> > f68f2ff91512c1 Kees Cook      2021-04-20  590  	/*
> > f68f2ff91512c1 Kees Cook      2021-04-20  591  	 * Always stop accesses beyond the struct that contains the
> > f68f2ff91512c1 Kees Cook      2021-04-20  592  	 * field, when the buffer's remaining size is known.
> > 311fb40aa0569a Kees Cook      2022-09-02  593  	 * (The SIZE_MAX test is to optimize away checks where the buffer
> > f68f2ff91512c1 Kees Cook      2021-04-20  594  	 * lengths are unknown.)
> > f68f2ff91512c1 Kees Cook      2021-04-20  595  	 */
> > 475ddf1fce1ec4 Kees Cook      2023-04-07  596  	if (p_size != SIZE_MAX && p_size < size)
> > 3d965b33e40d97 Kees Cook      2023-04-07  597  		fortify_panic(func, FORTIFY_WRITE, p_size, size, true);
> > 475ddf1fce1ec4 Kees Cook      2023-04-07  598  	else if (q_size != SIZE_MAX && q_size < size)
> > 94fd44648dae2a Kees Cook      2025-07-29  599  		fortify_panic(func, FORTIFY_READ, q_size, size, true);
> > 54d9469bc515dc Kees Cook      2021-06-24  600  
> > 54d9469bc515dc Kees Cook      2021-06-24  601  	/*
> > 54d9469bc515dc Kees Cook      2021-06-24  602  	 * Warn when writing beyond destination field size.
> > 54d9469bc515dc Kees Cook      2021-06-24  603  	 *
> > 2003e483a81cc2 Kees Cook      2024-06-19  604  	 * Note the implementation of __builtin_*object_size() behaves
> > 54d9469bc515dc Kees Cook      2021-06-24  605  	 * like sizeof() when not directly referencing a flexible
> > 54d9469bc515dc Kees Cook      2021-06-24  606  	 * array member, which means there will be many bounds checks
> > 54d9469bc515dc Kees Cook      2021-06-24  607  	 * that will appear at run-time, without a way for them to be
> > 54d9469bc515dc Kees Cook      2021-06-24  608  	 * detected at compile-time (as can be done when the destination
> > 54d9469bc515dc Kees Cook      2021-06-24  609  	 * is specifically the flexible array member).
> > 54d9469bc515dc Kees Cook      2021-06-24  610  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
> > 54d9469bc515dc Kees Cook      2021-06-24  611  	 */
> > 2003e483a81cc2 Kees Cook      2024-06-19  612  	if (p_size_field != SIZE_MAX &&
> > 54d9469bc515dc Kees Cook      2021-06-24  613  	    p_size != p_size_field && p_size_field < size)
> > 54d9469bc515dc Kees Cook      2021-06-24  614  		return true;
> > 54d9469bc515dc Kees Cook      2021-06-24  615  
> > 54d9469bc515dc Kees Cook      2021-06-24  616  	return false;
> > a28a6e860c6cf2 Francis Laniel 2021-02-25  617  }
> > a28a6e860c6cf2 Francis Laniel 2021-02-25  618  
> > 
> > :::::: The code at line 571 was first introduced by commit
> > :::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time
> > 
> > :::::: TO: Kees Cook <keescook@chromium.org>
> > :::::: CC: Kees Cook <keescook@chromium.org>
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> > 
> 
