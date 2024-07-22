Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C1F4C6E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 05:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721626135; cv=fail; b=B52uwptlVtGkcprY9mMdEusUmYH+pU1rkARaetrhsYgkwpgUdxXZ6YwiEHIYsq7OY1NnAEXy+uD/nUs+/zp2fQBFsegp7fQ8Ce5f2rKpLsvX9TBTjbrYxRF/H95WQZG4evQTiUkzL7Zt9eIDS86IAL4uCWVgeIFmAT1to2AfNzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721626135; c=relaxed/simple;
	bh=53ajzWQawqQ63SPCv6tAbyYq7qu2TO/ThpG8jj4f4+M=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pfn8cy/xK26ljtL8OWgSJRSCrvLyWxTeH64nqXoYugRmz5Ht/ER3uFFpRt/2WqOzSBek64giUv7ffPcTWpJQD4bSP4mQ4/7FUOLLk4hHk1MRcmQ9jkO3IkqSScvTEJGaLeuVlgCFLMPRdZgESwV/YMgtDcQilznzYQ25VzmXG88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VARcVBpB; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VARcVBpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721626127; x=1753162127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53ajzWQawqQ63SPCv6tAbyYq7qu2TO/ThpG8jj4f4+M=;
  b=VARcVBpBCGov3ZdSI3Njq4Qs712w0yy7/QqL2NZ6SjcuCRMQsBFSzj3Z
   bl0EagPnFNtFKL7TPm61o+gXj0b3obf0Df1Gn2c/ivi8pdHh6jpUzxvaO
   nicR65afCCq/G/I3CegphXbSE//8a3DEjcy1+BYCBiGv2+lAaOiwjsZaK
   hMvJIYRRptyM26IbiEL913JX2U8wq+VOJglKCvlVyxdjqn3rpxqeLvPVH
   h+emqe+F2dtdbPaC7fPjLUYEngtHADf3OkTTRvl5cXULHWinh6Dj/olAr
   tFCN1CmJ/4rxgYaQP51zMsacAJGt0vJl3q+5Ni4r3iHjD2PD1PDY80wsu
   g==;
X-CSE-ConnectionGUID: aUBP4c1qRVyGxyCLUp0OwA==
X-CSE-MsgGUID: ox2aXt/BRjay0580sc/J1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22939151"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="22939151"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 22:28:46 -0700
X-CSE-ConnectionGUID: M3lsjUxPRY6WW4nhaxvAIw==
X-CSE-MsgGUID: hQT2tCCDR1mEMVVuXhpETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="56042393"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jul 2024 22:28:46 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 22:28:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 21 Jul 2024 22:28:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 21 Jul 2024 22:28:44 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 21 Jul 2024 22:28:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWAcYPvmESKrzjG7sktqf1Qpr6Zl4KVFjKi6k0NQIb3Al6GE/kyikL8tDmWE+H7j+aSlXn/0qBCTWMQSRV51pCeg7RF9XxeEY+oZPjWQbAL3UAToEUR6mzNN5zpYO9hxnpSOHt3tiGDjrRbESpx8DlSd75ybZviGeUqNGyEAcr1kuImWXzQ9EW1mKr7cVLSq3ZnkxH1izVwLpOC7vptVu55/vw3N5uQhC2Mj1EgHJEfV/z7P4bR6mg1rcQMUZVIdEpcpRrxlt8MfBXjiniBSxX/c2th3HDlWVTv+esU42LZ1YU6C2xVKbWdsecOalgjG9YqQsmg+9PIDK9HfoWgokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AdGyJeFerYv3Jq1/U716oHttG+3tqNchrQvaIOSmxQ=;
 b=a08nWs0xP+5pgWPQiAQQKgivWmaaGRZKPz1kg3y0O/WI25tFY+FFO+r6q/gnx30Vtsph3WGd2lSN6m0qD/XE7Ya4irHt/5fgaOvNT6RyVj1LuUnDJqBfs8xBFsgC6xYCY/rkpid5QHu9lpl8GUJzD4U9fGqrTOLY6Bt2VZIHqyyaah9jCrpdvcJqXSvDgqktEPYDQstkY1DwB8/ZaPaUo+/2MoTH/Yi7W45Cv2EHwBAQI08yTHjhMgtFARXG3et8apq0fB4sAcqdjk/DXhnCWWOe56wi3PgqBklVi/GZN9/2ekN6XX8uNPXeFuetLsVXnZj3iEdsFDlRLpVu7t2e5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM4PR11MB7280.namprd11.prod.outlook.com (2603:10b6:8:108::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.16; Mon, 22 Jul 2024 05:28:32 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7784.013; Mon, 22 Jul 2024
 05:28:32 +0000
Date: Mon, 22 Jul 2024 13:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:6.6-2.0.x-imx 2524/11383]
 arch/powerpc/boot/dts/fsl/b4420qds.dtb:
 /soc@ffe000000/fman@400000/port@88000: failed to match any schema with
 compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
Message-ID: <Zp3t990GF7HCYpW3@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM4PR11MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: a966dcbb-77e9-4241-66b9-08dcaa0f1ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HjkaJnH9jjDQa7vEynhaimB0VIkMMvwrngc8D38Rq8cNMQbRrcDuvm5DYEJr?=
 =?us-ascii?Q?l/XooMTrEjmiBmYo0efUmSox3CrwR95EYCg8Bsi5Oi6JpjIjy5wNhDbG14Ma?=
 =?us-ascii?Q?WKP18W5qBCf8Xuir0oo0rmQNQXEpu8Norr1YhcT5/p2mmvc3xyLJx5nOzL9b?=
 =?us-ascii?Q?gPz8DSTwewjlB0T6G022uNfdHA6InN+27zZ1K6SdWpYatJR0Z9gDC6/lTYGc?=
 =?us-ascii?Q?iuG46nMMmFKSta5J90sF7ABoyCxMEuqI8VVWxXKh9qa6rXOtBqrh3hLD/8l7?=
 =?us-ascii?Q?1JFJwS2kGOeyjfc9nnZc4lBdkTvJ4AgBQReZg1jwNPAWW6dte/9MmT7EmRfp?=
 =?us-ascii?Q?/DyeLYwSMC2wjiUmCw5G2ZgkEqaOF13kzdEFBYcVXEFO4fR0i6AoIsWiQi3R?=
 =?us-ascii?Q?jysn3IKOTUjRZfYBV17W3hekdWZ98GEq1Z2HuOgyPT89LHFAgwubeB96qaKS?=
 =?us-ascii?Q?KAuz37NynemonRHh+th/VDE4gwxmfa/axFFekstbPEb/+2LmXvY8S/fAecJR?=
 =?us-ascii?Q?IQvY7dkTZ6LBrm6eGap1LuoqACLEmVy864mi0+cD8MJA3faLsuBmWTWJBc2/?=
 =?us-ascii?Q?p3iPd5vmEnm/md6uCCbtPZk1Ca6Wki4YfhHOOqHo+nK/q7CsjobNrhlj0MBc?=
 =?us-ascii?Q?nS2008K8kpdbmHM7yDjATdnvsnL9u/H192MYk2LipkQ1eyVjL6kjU+a1xLx0?=
 =?us-ascii?Q?CXee2VxVxVvmgM0bB1Z1zUTiIolqHKracSEahCXivQ5AFPw+dPkE6LJaHzgN?=
 =?us-ascii?Q?ZtLImFc+9f9hT0BdidNfZOWeoNJr88ATZEATT7zTwit+fyQUsf33LXVPXXGU?=
 =?us-ascii?Q?LiTwXBiWO5vSPfH8ET21DpPDDR/JIC26qlAYj+D7jcYkizJpL9jFQPPZQIME?=
 =?us-ascii?Q?EfV/HjcfuB6Uh00CaL+bJipmfgn06Dbertf9KGxn5oDw67ISZ6I2atf52g+l?=
 =?us-ascii?Q?UupzSN5AV2By/9Q1uNH19JsDQXIdeTwSXOgJJpUvtDQ5MLtAWRRgRXgwHkDI?=
 =?us-ascii?Q?4V5FBjcg/F/Ks+AM9wHeZ3hD8wgatvVBfcvL1MozelzYyAWU0cG5FnC7bLP2?=
 =?us-ascii?Q?HzkfBNfcxoz+12silQ5O9VTwPgA8VKN/uWn3sCmAB+Rn0B2idzFOVE/6e3Lt?=
 =?us-ascii?Q?eNudBmk5ueYO4iSrCmTKVv4xEv/cgUe2wCicrH5R5BX8FPbqrVBrOeEO6p91?=
 =?us-ascii?Q?IocO1ATMxaNfdSELqRVLMknpe6r4PmYttCiEFEAHFav++C4hqJKHJmkPyiPn?=
 =?us-ascii?Q?cBHvPOLNgLykvDx7F4lvJAFIQrnWweB2up0RFpO1Y/amnFvqTgVAbiYnE26h?=
 =?us-ascii?Q?8gaIk03XKxYvs1XNmYOhOnve4OrBYNB86oxZoTn7DuVgwJXYh7kQTp4lC+OF?=
 =?us-ascii?Q?m2OVhE0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4obvdQGMcpziQ4DIMRNFgSu0wc/B9az6w1JoAm8OSJdtnSjSBIpZXDfxTPXj?=
 =?us-ascii?Q?ts9IvJqTzY0TuSxaZPGWUgf8XQNACDrTdcn412skRjaZ8MXwGIx2M1PJoPO8?=
 =?us-ascii?Q?UInaUpXlsTc1eiLicFzTwQzGJkfRnP5pqvdIghjCRNN8glODJ9BNlVg1e4Rs?=
 =?us-ascii?Q?ZoHOStuoh2aW1oXg1Ju+yvP53Csw4P42IJdNymy5msTAOAlAoTT36e4fepTd?=
 =?us-ascii?Q?kZdUPzkH8mM3dyC3nYBvfDF8Knd/PyGzjmVxntPHf0O0VhWUMOMg2SfnOD4B?=
 =?us-ascii?Q?S6MbM3YWm6pCkqEyzKA8PWQ2+ejT/rO2aHn4rgGbdHxAy//gJvR+QuHChOUJ?=
 =?us-ascii?Q?pW7Uoj6pC37k26/GE1W6vAMpY3cIaxfQmCLmW5MoyEJ2ZsDnN7GKIqycsxRl?=
 =?us-ascii?Q?RtgyYqlYa2g0ayVCEz/OcvnBx9FB6Q9kr8x9FKnaSbTA48wG+fXELAdzXyuf?=
 =?us-ascii?Q?j0b38Q67bTRyj/+qRxTicrqa2FdyqKZulMWSPMDtQy56qsf1pvSdb3diGu6m?=
 =?us-ascii?Q?4pNeHZQhrOq8pticZ1jP9N/XeKXt3jWz/r7iL28QZfVEpThjqpL8URXPVd6K?=
 =?us-ascii?Q?aONPtHHx2E0djGYyf7uNFBi52/vj1Qv7NvUvWpTSi5RKf94IydBaJCmNk+Nq?=
 =?us-ascii?Q?zD1oUiHHYM6vWWTznFR0P6ntKpneWszZRiau1vedrYi0YeMVgLF+4IeDQg1n?=
 =?us-ascii?Q?Ct1e55XjKjHHnwT6Ql9D397E9bOw5ujsrOUxwWAhL69z9qP1tZ8n6nQkwXDQ?=
 =?us-ascii?Q?AsDPahXYab/UZjbvJK0Eb+/Qi5mX70+BUmCKMoCu4r9XxlXEbBoCzZhzm7U6?=
 =?us-ascii?Q?fNPul7mkiXmyt9NcKEntEXfo7CI3P6cC9ar8323tr7PUWrnCKI9YFZDR3bm4?=
 =?us-ascii?Q?Ri36c2ssFhaHGKQIpkN86Fa7ej0ZN5140cTG4hIA4LJMC2vBGickGW80J81H?=
 =?us-ascii?Q?ysDnNlRcMkkn+331qT3wKPux+2lo0X0fxQ6SqMtaWKy8c98w8wRMtQtfRwrT?=
 =?us-ascii?Q?med4db1cS0cnvp/IYUHZRolaDFKVnK13zOZ/t9M6sF52iFjxr8v3qmoKcYHT?=
 =?us-ascii?Q?ZVzY1DCNZrwxMZq0OwH1JbEKWsfZdcJxI/LHeXJFAOTlM/9uv3K+1mymDXF8?=
 =?us-ascii?Q?5CJDwYNH+mSbzjEKu2CCO4jgWfX7mgYOidBtMSYgTuyfeZObPkn0nMfYfBh2?=
 =?us-ascii?Q?EDCEjrVorAlmg+bWs3icaqr9WwBx6n8GduCsPZiK5qXu+pMmIyj8KzKEhCO2?=
 =?us-ascii?Q?IntA7j8XLTJc7YcBlHiIvjq1qOdb/qMib9SwWciPN4uvahLhU9p2IXbeQAUo?=
 =?us-ascii?Q?tvc50mFJcxTjpGsfvjnYcexlVQSNDJvrFae1uwQ5RMlXmvahlYV3IKkeDE8P?=
 =?us-ascii?Q?IElIaTsX5u9a+c2BD/4e+o/9cwugsT/Uc/57Fv5C6GAkuTFzZ/X+vfgiunIF?=
 =?us-ascii?Q?A0mhmD9lr/JcEEF3b4elrzR7a4lRqAmDxRPW05Q7J7NcI8iNpnp/5gfuL2KF?=
 =?us-ascii?Q?tNRCu2fyWwXgUyAcjUikcgYfYPMbiZZjLJIL8ebb/YxJmq6g5q4iPYlHn/sk?=
 =?us-ascii?Q?KjWVAzVbcUQ/KubCfQvobRHykSrPy7b2OVYDGc39?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a966dcbb-77e9-4241-66b9-08dcaa0f1ff7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 05:28:32.4808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bM7RN+7YgUneZ8EDiIjzdyjaj//v8Se6rUrbmwNA+MuYoI3rKTVpO58Ez8UlGztrJjEIHJWxFeTnlT1idAQNjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7280
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   a9adc0280d6e8fde5718caf259e89692ba67a9ea
commit: dac644b33acc7d706d40a698c7a4c1557114b2cc [2524/11383] sdk: ppc: dts: accumulated DPAA1 updates to existing files
:::::: branch date: 8 days ago
:::::: commit date: 9 months ago
config: powerpc-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240719/202407191740.dd3mbu0O-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407191740.dd3mbu0O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407191740.dd3mbu0O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,b4420-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
--
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: mdio@fd000: 'xaui-phy@slot1', 'xaui-phy@slot2' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e8000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
--
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@f2000: 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@f2000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@f2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,b4860-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
--
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000/jr@400: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-lp-ring']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/mdio@e1120: failed to match any schema with compatible: ['fsl,fman-mdio']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/mdio@e3120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/mdio@e5120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/mdio@e7120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/mdio@e9120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: ethernet@f0000: 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: pcie@ffe200000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: pcie@ffe200000: pcie@0:interrupts:0: [16, 2, 1, 15] is too long
--
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/mdio@e1120: failed to match any schema with compatible: ['fsl,fman-mdio']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/mdio@e3120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/mdio@e5120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/mdio@e7120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/mdio@e9120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/mdio@e1120: failed to match any schema with compatible: ['fsl,fman-mdio']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/mdio@e3120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/mdio@e5120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/mdio@e7120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: ethernet@f0000: 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/fman@500000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p2041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/mdio@e1120: failed to match any schema with compatible: ['fsl,fman-mdio']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/mdio@e3120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/mdio@e5120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/mdio@e7120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/mdio@e9120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p3041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p3041-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: ethernet@f0000: 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/mdio@e1120: failed to match any schema with compatible: ['fsl,fman-mdio']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/mdio@e3120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/mdio@e5120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/mdio@e7120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@500000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: ethernet@f0000: 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@500000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@500000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@500000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@500000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@500000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/fman@500000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/mdio@e1120: failed to match any schema with compatible: ['fsl,fman-mdio']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/mdio@e3120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/mdio@e5120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/mdio@e7120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/mdio@e9120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,p5020-l3-cache-controller', 'fsl,p4080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet1-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: ethernet@f0000: 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/mdio@e1120: failed to match any schema with compatible: ['fsl,fman-mdio']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/mdio@e3120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/mdio@e5120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/mdio@e7120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/mdio@e9120: failed to match any schema with compatible: ['fsl,fman-mdio']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v2-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v2-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@500000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: ethernet@f0000: 'ptp-timer' is a required property
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@500000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@500000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@500000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@500000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@500000/port@84000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/fman@500000/port@85000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
--
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1024-diu', 'fsl,diu']
--
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e2000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e6000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/ptp-timer@4fe000: failed to match any schema with compatible: ['fsl,fman-ptp-timer']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pcie@ffe240000: pcie@0:interrupts:0:0: 20 is not one of [1, 2, 3, 4]
--
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ethernet@e4000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1040-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@e8000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: ethernet@ea000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t2080-l3-cache-controller', 'cache']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/corenet-cf@18000: failed to match any schema with compatible: ['fsl,corenet2-cf', 'fsl,corenet-cf']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/port@86000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/fman@500000/port@87000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@84000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@85000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@86000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@87000: failed to match any schema with compatible: ['fsl,fman-v3-port-oh']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@fc000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@fd000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@88000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@a8000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@89000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@a9000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@e3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@8a000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@aa000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@e5000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@8b000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@ab000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@e7000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@8c000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@ac000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@e9000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@8d000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-1g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@ad000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-1g-tx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@eb000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@90000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@b0000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@91000: failed to match any schema with compatible: ['fsl,fman-v3-port-rx', 'fsl,fman-port-10g-rx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/port@b1000: failed to match any schema with compatible: ['fsl,fman-v3-port-tx', 'fsl,fman-port-10g-tx']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@400000/mdio@f3000: failed to match any schema with compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/fman@500000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

