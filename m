Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383D87DA88
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 04:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733977700; cv=fail; b=kwviMfqZetdcbHV3JV61TY76ebz4qycVVjw+xO6BVnnTu5uDHZrgzmTwpJAALOz871zXbhkPN6tr9Pvf1d9ipLiSQilZAp//b9VhsrhN+EHFJsTWlU9MmNhbSw0OF6cm97wQEzWoWLVjJ2/KJNiNlnMxkQdAV6uLNQjaYv8rkH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733977700; c=relaxed/simple;
	bh=/7kos5Ek4C3r1fttTLQQX4kBp5XeZaQOUHGnQEZyHd0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kygRLYgid/sWacq6k+ulnimrfBleBwB6FxBqsJU8DO54lCwwaR3ch5Ci6p0mE6v4+R4GV8Ng6UJ4Zi7c0b+Ut8oWWmjsVH0Ld63d/f8vDllczsRy532bP+J0ISyUVwCfXEgMc+oszAFE6Px1Rf3l0UPLVA/6YWTTsyHa7zn2Qns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igwOqRKr; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igwOqRKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733977698; x=1765513698;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/7kos5Ek4C3r1fttTLQQX4kBp5XeZaQOUHGnQEZyHd0=;
  b=igwOqRKrL4h/WRX84FUz/6QNlvogHuvBx/VXTJTf7bO8BYip/KGgTpGs
   GvK2ZO4+tuAa6QO43sKZI9dm+wm71kmfziI9EjFCPz4dtoeDnR+yj1xpE
   19WjyoxB1g8qmZK29o1eTpxoK98A2+rPVE4JIRSt6MDnxn4AZ5u8lIdGL
   GlCuPrLGq868jncpEeOLDMe3to0WDTZO82kwhmhNiLEX94V1kedJYEetf
   TcQSzIIiKZx8Z+5DLbEMIpYZy1vaWgxwbJAERfwpO0isTg7Z6RegrQBY0
   xt8LwwQGe6drBNf+UuKTWAj5Ya1qoTWXMZ9mZ0YPd+GimOWnUejUjtzU2
   Q==;
X-CSE-ConnectionGUID: JdaQCEIFSSiU/kuaNsEGbA==
X-CSE-MsgGUID: WqPGQs7RTLiB2JrS+0t0AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="21966482"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="21966482"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:28:17 -0800
X-CSE-ConnectionGUID: CRcSe8LjTn+eYbw74jxdaA==
X-CSE-MsgGUID: p8wKaaTMQdaL15N1znY75Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="95957233"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Dec 2024 20:28:17 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 20:28:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 20:28:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 20:28:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxkX8I+B9sykRQDvMnzMx3jvhl9agWr53iHd24TWPkJ0jrGEjtVi/4W/PBknnizBN+MOc4SUJPjbQIkSWF0PPVfbjR7VntVyASnuFgxPdBJFtcd+H0GGph28LoyLI4cnmcHPcnU7b3PWf639Xm7rxrBrN4fD3CPe3eueOOhlHxvcvrSHZgPFEl/Pt0cZjYQhQSjgpnNw3T0IRTspK25SfsRSOY+Bmrhc8G0+K+SoR3zYvCeKryborepdrT/IRBOcjy5cmQQ3SWtKKD71ejd5U2zqYch8usbxf/iLkJr5YdL96b2bx/MHz/GuAeKqdHx6lGktnLiYeqPoKSmXxnU5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylcTBaPfqOX1rC9vEbB5lIs6i7o4WmMPdYkcWVrX0jc=;
 b=FZUhIxB2OMgDXHD2mn+eCA5UWg9c1rysZk5xLK21kayjBhv09BOcvHust1FuErncfALa8/S2BJ9EuU6cHudsYhvaGoIj2FPorRaMQTXzTVuEzHv8wf/jwn4xSS6ewAU6LLCt72WGb1AJM85r58FRwpavAV1VKR/KvK9aW4hIYVNshYI7C8lBV03kUM0Vm7eLjACP7czSzG0K0RoUJXUKu2/KEEuM8sLfoS80VR4gtqFH6XVhKk2d15xufkhOPXBjqYQM19+CAgSH0Rb+NCgZKjWAbs3H4p3adfG5Bt9UEQ+jXXfTxWCk3QHk4gH1kHRT4VpNN1XzfTPaSEtZsc4Ovg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 04:28:00 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 04:28:00 +0000
Date: Thu, 12 Dec 2024 12:27:53 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "paulmck@kernel.org" <paulmck@kernel.org>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, <oliver.sang@intel.com>
Subject: Re: [paulmckrcu:dev 51/57] ERROR: modpost:
 "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <Z1pmSSnUtMmhowqb@xsang-OptiPlex-9020>
References: <202412120535.T5YZArL9-lkp@intel.com>
 <12f955e3-bbd8-482d-83dd-b9ac00bc2f68@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <12f955e3-bbd8-482d-83dd-b9ac00bc2f68@paulmck-laptop>
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: b62bb7e1-f2a1-48f5-3874-08dd1a655cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dFmehSNncsQBgi8sB66AFq0FpUm7edsWUt0DLjwkcxzBRm7usdlUFaewJP2Y?=
 =?us-ascii?Q?Xb6BcHOYGF6LfnHcSsKyeitfOE3s76CXXkNIDMgXFmmyqko8XdmQVS2ZkxAy?=
 =?us-ascii?Q?KlKqZvrlrSjmVige4WgmRrGiRsi6n9TfcMRiz4RBO9Qavh8RguFopVFren9J?=
 =?us-ascii?Q?Q8G8AXYq0+hoVWky+JCg9P6LL0KgV5HerhcybRgIXjQhX6ReC6lB1KqvZZX4?=
 =?us-ascii?Q?H/95L1YMNQZjWi6SlPOz+7C4eZm6pp4mLX8gx8fRk54j1ocIcEe6cgErnjF4?=
 =?us-ascii?Q?Wvg+gmsy/sKsHetK/wmPTyXK1VnM17N075hY2lZml4fnEhItizPTijC5QHCn?=
 =?us-ascii?Q?z2RfxhB7KfHe3PXw8oRs1vXLhgEOb3SmjsR0j9SzVIguxq3+3jOlRdOi94Lf?=
 =?us-ascii?Q?zgeRK7iwxQPQe8T43Q6BuIp1KwRRg0mrJ/rTtBIksSuvDmLXOzYtBTRBR6DZ?=
 =?us-ascii?Q?n0IvAIvv1HFKgkANdf/+3TAGJZCYVpZcnaLlWn57lkp67pyxPV3yHZu1nkZ4?=
 =?us-ascii?Q?9eyB7pvKpv/9weXuh5iDeHxUiiCvpzlW+HY+oUnW9FqknQTKnbMJiCLZwrSt?=
 =?us-ascii?Q?/Qa7fVXvjyYAQEXBGfDmhMNCBwOwnNYKed2wK9vzyxwzSZuUCPALJawa1sc+?=
 =?us-ascii?Q?VoIsOrUxAaygyBwS6JGgUssozXU4F9Lj9NjajbZ7EqSVqYbjrAm6kHKKE0on?=
 =?us-ascii?Q?SymrzFwce8spu6htJShjLqDID8HSVow83p5S43RHpLF6Yr2ORGP8RJdkojff?=
 =?us-ascii?Q?oKQFjGmh2zizDeFM8cGpCkNZNmEq3CgeicE65T8lgAXGcot9GinVnnWtOWEW?=
 =?us-ascii?Q?z+80BZTVVLJkVsRoCK00ee0+/A3Ho/IKBZrkTgtoVppZj5NGKBLxisW3prCt?=
 =?us-ascii?Q?giFqbb59kmZxWN5tw4cJhVlAFE4cVNDr/ZZBXc2RJe+S8WbdWkrCTzDn7IhQ?=
 =?us-ascii?Q?kOyURE3MZuQlC1yjgbJ92O0UVZ2zEPEsMgo5ASQ7zrvaIxJ6cEdh0fNvrnS8?=
 =?us-ascii?Q?hKg2PtkqiqZ8vT/wvJBeX0KLzBZkrXkqnyuusDGHvM7AspkRz1bhfYcrp1i0?=
 =?us-ascii?Q?VTfe4hOV37+79oXGdh73ku6d5PD1QXXNf3qd8G1cx4mBkEXf5BmEi7A3jXAg?=
 =?us-ascii?Q?ZZqZPweHrisKjcvGdZeF5aD8ltoACFjA8M2KdmpBbiArwubDomo+NiLIrvDl?=
 =?us-ascii?Q?x8X5tp3swIs510DmgjoJyx/BDUEXM0vFxV+RgsA8Gbv7pG84ZoV0M/GsxpEb?=
 =?us-ascii?Q?FoB4R9qsPH+w7bq1FMJ1g0jxACU+UrFm5Ld68n0u/zPcGPx8EE3V0COAQnTD?=
 =?us-ascii?Q?GMLUg1lnmppgw9VlbKjVSczV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0PjakZuHLpK9S18gSD0ncmbUdExNwrG333wjc4bw/HVBBV7Lf+TyNESBFonN?=
 =?us-ascii?Q?xLJDr3LcGBcIpi9i6RMBmY6Sy7CQia6MZBtZEW3pIwVCkKPNUxWKPnVWzpco?=
 =?us-ascii?Q?irY8/LEU6KUXg6XQV05yZuOj1ss6/mtW3ylEp0q8x7nZEgyqsJLRn7ra+La7?=
 =?us-ascii?Q?vghdfkWwkDNjPU2DdSU/b29ryZcWupj/M4JtE+/RG6Vy+9EIIGfQ0bxVAjqy?=
 =?us-ascii?Q?V2Pct6KXKYciyZ06fWX2fqFfFOTKB7e90Ru0Wfy8l4Q6obRWKmcpPbDjGMZl?=
 =?us-ascii?Q?SJTfBAafyjm1gamo2+C1leaPbcHwswXn7PtOi19KvYE6l1cnl97um+HBlDn/?=
 =?us-ascii?Q?G2NvjBFnYdo7+nI+zB14T2NsKteplNVKbfag0Gyo87HveJrFaFxonXpWqT2Q?=
 =?us-ascii?Q?M93NYAKHxCzH7b0tkXYmtdcmVjFr4w0MeMhphHQHWCZUTUtgCBwGAqylIJg8?=
 =?us-ascii?Q?Mp2E7MWGUTvLZaHqtSf9Xwn6i5psE5PoJk9OOWWCuHIOKgGLmYQZygn527Bg?=
 =?us-ascii?Q?PKkoISn1NZQB/w63AtnmDM9gSkS7xmTYMhyLTvRg/wRknseZNJVwfwAw29tl?=
 =?us-ascii?Q?L6jr2+OcpThec2pTL/dtj0CzHyQaJaaAcHiR1bHoaH4nIjpd3Q74TLkeWBRZ?=
 =?us-ascii?Q?utz6KFKFW6YYsoz1PKA3xeyBxyJons+6aYcUIkG7I7MuY7gxRWAUM5OP3aAP?=
 =?us-ascii?Q?5+GjxPQFAqi07k09AiXYk8a5rlwENpFQ+Ymoup0j0AY60KThXb/yP7MSpTHN?=
 =?us-ascii?Q?0kPsWYKUKmG1a3CWeWlZ2/Jo19F5GANe9q+zK2vqdHt4YoaX4Nn7sP5HEGQS?=
 =?us-ascii?Q?7DQSVpoqMD/43i1/bdNSvrfUlUyL35Ve3AWWcQokvin+XQWjbVUfu3TCigAj?=
 =?us-ascii?Q?K372YS/pIQ2s4G7zyC8BqJrzslryxaPnstehCVMqkZJWJ2VOlsgSZWF/VNG/?=
 =?us-ascii?Q?+wVFAXYKymJBFnOpdy/02IsX69C/TUym5g/RXfqvFRlHM5DfdQnCNf/1tagH?=
 =?us-ascii?Q?9M/NhxRJfy115/MaG9TRUHsdVv/IEXBYn76sscJWT6oeklibVRFOGOwygl0+?=
 =?us-ascii?Q?/Kxe7FZmuJjqhektFASV3tnEqrK5G5d+16f2w9+uyOcXrBzDn7NWzOu4hZRv?=
 =?us-ascii?Q?HegE+IjSiHmYWFqao1NERTs8i87xULKOPaias8DKrlxlyAMOeC6rPg3/2Xa4?=
 =?us-ascii?Q?y3jo5Qk/8NJ+RwAxE+2OsT5tP7+jtRcXI+p2mIPHjy0Au4T5s0FBuwm9D+Wp?=
 =?us-ascii?Q?so4/ws/bwssQcBANwrMxT9c2vQBFwc1lyowccxJxJsm29T7byVFAp9Y+B3lB?=
 =?us-ascii?Q?zcNT1iw8A/vc8D0z7T6OVu6SUermQtBg3Y9dTdgss6T1hwqv/Iy4HB8FwXcT?=
 =?us-ascii?Q?r3WlBgVUCz39ewXKyojxtmscXV/qaeY7Ku4OKd8rU/13nn/O9c775WBo0jra?=
 =?us-ascii?Q?GLbsE9d2bu9WkoquUo1UFK3T2/Vd3JoQtFR3fSQaOS3PzFgBqELk3Jb/NsOM?=
 =?us-ascii?Q?+WSMMcQW5/DGGeUEsrR6nVFABl48SVeEDlt3pff760Kv42wq9NwNWVEYAjd8?=
 =?us-ascii?Q?hdewfxM2SbpMt6driLdWC8HnDQqqX2xA2hNR58owRm7nhVulLvTL+VttbKHG?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b62bb7e1-f2a1-48f5-3874-08dd1a655cae
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 04:28:00.8725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6fIa8jnM+9bd3Hcj5CP7F1HolIO/KWpBWLtFUFE6EafXuW67pCWAJR9C4YUB6Z05s35ZBAjCIpyiPiAaUeeBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
X-OriginatorOrg: intel.com

hi, Paul,

On Thu, Dec 12, 2024 at 07:46:09AM +0800, Paul E. McKenney wrote:
> On Thu, Dec 12, 2024 at 05:55:36AM +0800, kernel test robot wrote:
> > tree:   https://github.com/paulmckrcu/linux dev
> > head:   58b186eb8049230c475262f8e9eab34299677b8a
> > commit: 9133bc2bf728593225932a2574688beeb602b1ef [51/57] rcutorture: Include grace-period sequence numbers in failure/close-call
> > config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241212/202412120535.T5YZArL9-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120535.T5YZArL9-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412120535.T5YZArL9-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> > >> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!

above two ERROR are solved by the patch you mentioned below. thanks

Tested-by: kernel test robot <oliver.sang@intel.com>

> > ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
> > ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
> > ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
> > ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
> > ERROR: modpost: "inb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> > ERROR: modpost: "inw_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> > ERROR: modpost: "nec7210_locking_ioport_write_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> > ERROR: modpost: "nec7210_locking_ioport_read_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> > WARNING: modpost: suppressed 2 unresolved symbol warnings because there were too many)
> 
> I believe that this is fixed by the following commit, which I will likely
> fold into the original.  Does it do the trick for you?
> 
>                                                         Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit c2cf9cf59e746aa60badcb07f58b09b7f604c19b
> Author: Nathan Chancellor <nathan@kernel.org>
> Date:   Wed Dec 11 12:43:01 2024 -0800
> 
>     rcu: Use IS_ENABLED() for Tiny RCU rcutorture definitions
> 
>     The rcutorture_gather_gp_seqs() and rcutorture_format_gp_seqs() functions
>     are currently guarded by "#ifdef CONFIG_RCU_TORTURE_TEST".  This fails
>     in kernels built with CONFIG_RCU_TINY=y and CONFIG_RCU_TORTURE_TEST=m
>     because in that case there is no CONFIG_RCU_TORTURE_TEST cpp macro.
>     There is instead a CONFIG_RCU_TORTURE_TEST_MODULE cpp macro.
> 
>     This commit uses "#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)" to correctly
>     handle modular as well as built-in rcutorture for kernels using Tiny RCU.
> 
>     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
> index 1971683f1a82d..b97c64e99a905 100644
> --- a/kernel/rcu/tiny.c
> +++ b/kernel/rcu/tiny.c
> @@ -257,7 +257,7 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
>  EXPORT_SYMBOL_GPL(kvfree_call_rcu);
>  #endif
> 
> -#ifdef CONFIG_RCU_TORTURE_TEST
> +#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)
>  unsigned long long rcutorture_gather_gp_seqs(void)
>  {
>         return READ_ONCE(rcu_ctrlblk.gp_seq) & 0xffffULL;
> 
