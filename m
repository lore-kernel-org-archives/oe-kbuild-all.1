Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3895436B063
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 02:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769047298; cv=fail; b=ix7R1Z974KtWt14XzcEstZmlysMC4vrF1MXdnyViYmx6YbwSkJ5LaBSUpb7Uw2RBOSG6qMgMepIjNMzpmki7If/7t6DrAw8P+vDIEafiVLbaS2Hwigrs1RX4zU7zAyptCU6fq1oeN5+elZchnDHenDCUhNyfkMFBz4D+jARHMUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769047298; c=relaxed/simple;
	bh=891Y3GLQpF+FbFuOi8pGYvVQff3N6tlOVX0+UOT9KO0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VTnN8BNjumduxYubzTHBkWM45qwzZ3494WwFDfWKwKuLygX2kv2NIiI7Wz7z+KPrkd1ZajVCGydb03hENbHNN4bZZOCTds6eK68+67BsbdU2zPdFXeiBk/qbFjniUOHjUVtTBlsqVSvojunUCej49GaihkR95f1S3VVzUQJrnvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFhaESSa; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFhaESSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769047298; x=1800583298;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=891Y3GLQpF+FbFuOi8pGYvVQff3N6tlOVX0+UOT9KO0=;
  b=mFhaESSaMd2Qaml5tfRgftQS10qkELuPvPnzkkyu/cPAGwOKyNgZEpwJ
   cnIQG1O6FjtGkvq3YQj8NRHe2CfsGf/r7xx9UzSUczjp3FwW7buczYfWX
   HulpDsVoeKVxt16F8Ty+gi+hYH72qy6YILgqxX0QCduKnmwIxzWA4c74e
   wU3ERGE76YmwSCYj82mO/Bd5Uy1KfSd8e3VBc2K1ilUR1mcl/Twv5PDXn
   AfpfdIg6s/v8/wAu7u/u5fzOxbQQJOyAv/lr9Wr2zP5fLUJEog72BEe29
   HgbOE20U8swGNVbAuq9tdKPBstPGtHP4JPDXWC0zvZZaTlH1IwOw30lZ3
   Q==;
X-CSE-ConnectionGUID: rsAsPEiJR52s1+1Fe8VWEQ==
X-CSE-MsgGUID: ohw1pX5qRmueZUJB4d7dmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70199449"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70199449"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:01:37 -0800
X-CSE-ConnectionGUID: Nec2m/GNT2elLDgmM0fqIg==
X-CSE-MsgGUID: CuzvnuCtQIC6Wx9oUouLMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206417616"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:01:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 18:01:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 18:01:36 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 18:01:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCaRzHb+7KL/oxyG1kgCdLSY5XWKAkcP4mnhKvFC4GbEebV+SjDLO3oVg75QeW232ejbHqqXbrc07ykT19MuNujtnVUV+nzjf0HOe44jp3p6gN69ciRQSOkAyDR7W85axHuZAi0s4RR6k7WezgmwhRbrrY0qMCJzpk8a2XK4IrjY983qzXHiCzLGF4h/CAjvTiWp4tmaHzCaPdAPIurN/FrYHQx7X5bn7zSVXMMGdtnfjhq2W9/80xurW5DgSw1DNJvRlVsI6LKZM/ljtT6FyGwWooCk8NbJI8TIs/46yUyaya6SShF9bJ8nPgkg/01YUQfJb85nQbah1uXdKiHVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2um0IgcZX9ygmEhNuDxGWRkSQz2kqN+qU7EMActToU=;
 b=dBodAPOr93FJCvYuQcMA/8f8lj1XoF90Hfa9K90IH4wk1DCyVx2P/BIr5dFT6RVOfJXHK6Sq7+ZXY3jjjCuTJOnFhoRpzuHv/PYn5DBSHeV/UNzpB2CNyb3JC0VlOs/Um+S/ba1dPhP3Khvsf+gbtgUAM0SaJP/cvXxj+oJa1n5db5FLrCZfIDZLRNNAcMD76H5QpPhMGqV27OExh5vc40nKf4wtbn7F7Do3F5kXnqpxG3eyWsqu3hB0htrAdvrdy73vsXFu9V/cvy7hJAzju04wScxSe6f49hvwHaRK/K8tXQVUzyXsQRt6ko5j/FrzQxDQbRct2bLFao+tZfg0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DM3PPF6C1A2BDF1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 02:01:25 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 02:01:25 +0000
Date: Thu, 22 Jan 2026 10:01:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH net-next v2 1/4] selftests: net: Move some UAPI header
 inclusions after libc ones
Message-ID: <aXGE7TVGpPAzs+gr@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260120-uapi-sockaddr-v2-1-63c319111cf6@linutronix.de>
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DM3PPF6C1A2BDF1:EE_
X-MS-Office365-Filtering-Correlation-Id: a806e1ee-b637-4c87-d649-08de595a25d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WABrnDXbhT7EI3QIXMXQY9lP+SoNOJ6LSSPeVI5ck33htCwKrlvlwvsckeZG?=
 =?us-ascii?Q?xZYSdRnQDi+FkS0Sdb6UxSOFp0KonK541M4KKX2fz5HfDsSWaxBXcyKvLHsS?=
 =?us-ascii?Q?+sbwUWBEs2N/edqcBDPdvlVvyC/0ekxuindTnLo+HMiZKA9Nm4EwA6prs3qS?=
 =?us-ascii?Q?MHJ2PIrbP+VpOJKGKe/RMMfHccvwQK+XGMJ2MXea+Tn7JhI7vaAwd4XDcKuS?=
 =?us-ascii?Q?Q3TPMdSbQn68DcMoAFV6gk7d6Zc2i7QJDpvKJf7lz4ODrdBsXMqo2/2eo0IF?=
 =?us-ascii?Q?oo7ttHoFpNmGbuhBB1IgpEZev9b0oslG1PjJY6iuTpgV9WwDVuqWT50DCiL4?=
 =?us-ascii?Q?drmB33J4/Zcs/BkwCXuXjVUKOirAitgqadoAADgtCnZ8UlS60T5r1tYQMI1j?=
 =?us-ascii?Q?hpUccusLdKyKWMOmAmLXKJIOrm8OXDTmmkS8h17UpLTvFP+a7lM0NyFe5UV3?=
 =?us-ascii?Q?aaBliXt9GnMQDTc6Sjms4BqvWT3xpFvmqHkDu6A6DyWVacn6XxWW75BJCVys?=
 =?us-ascii?Q?4z/tkz7fxllN2nPlXDP/F+NLOBsMMYQufKDG1E8Fu47bctaMLoKD9z1ObXDQ?=
 =?us-ascii?Q?fdSJxhAHbkOtHxOoeOybpIgv5FriAYs3tGhRADq0Bh/UW0XF6/3K+6S9IwVc?=
 =?us-ascii?Q?AYxUnW9J1tV53sKq4aLUC6B49zZPfEVT3uLrqc3MlQuT0gUP7WVpLnIOR3ed?=
 =?us-ascii?Q?X8JUkhCmN98UxvK0zbJdFnBJxpOSOz7xItkhKaHq6njzJGyCnGqBJ1ux/uNh?=
 =?us-ascii?Q?TUWe2/oLCv6ITyYXj8GZd5mprWKDVGao9ZoAD//HEEZ9hz+m8p+t2OBsXOE0?=
 =?us-ascii?Q?GICb2RFlGmWpq/MZAawkWs4HosrlX+n/T6LJ9bYjkCaERdtrogoYvu2GkYwA?=
 =?us-ascii?Q?Z1JrNOmbrZw8R/9J0949RbtNSj2wthJrBZdFySz+vIsbXnYIMhU04sL+I+mU?=
 =?us-ascii?Q?tJbJsPjbrPbYaueuzhxXhsEIkySjv5CGcKZJci45RzUH735FgWHcvPjTDmv/?=
 =?us-ascii?Q?psJGXEHy9monSDJPmXBWptebUD4pWYJJ1j++UQ+Tj5gMQ7JCmktESlw+fEjW?=
 =?us-ascii?Q?QH58fOh4xR30UaPWir9hiZr8WSg7DC5vqCCz0WiUvfGW3Z3Odr/Ozlm06tjN?=
 =?us-ascii?Q?dMWFdRdUYlf5ackurD2/vQO9p93QMHrtuGOFEXxWx6QnpFfPj8LofcuTE1Lk?=
 =?us-ascii?Q?bRsaw7VkoGnCJ1AdGDzNnlxuuW6dR07/tg+qrHCJUfb/yiwOMwN58sarEAXq?=
 =?us-ascii?Q?6NEHXtsl+gmbEsr/SpR/0DxIxXP0HvYkDSnNGkxNSYY7Hq4FHZZlZ39tINRa?=
 =?us-ascii?Q?aRMd/IDjJbuqxf1oTG9yqL0kpl8wJDNYbSuB3OL5AFpTmaaU5dMi2oqfpZ82?=
 =?us-ascii?Q?dGoV3MbLBPfH6TxsBov+wPcxxqSDzUlYResExL6S5LSn/IytgZgyP/38E3+F?=
 =?us-ascii?Q?7WkbSum+KJ7EMHHEIbY/3Ss9W+QZqosY5nLIuBMTdfugzdggiNoUyqMSx5Zt?=
 =?us-ascii?Q?yt9tEVWEMV1OGS5zFPcPqrRUJgOdOxQKjZ5zd/VUw8iS4nUPW1gFCfqIuoty?=
 =?us-ascii?Q?aKIqgjg16RXydqhpAboBkszA0wCCmAFGWF3FDw+6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cyExhqFAtjn8AzASRKxDat9SsaG6U0fGHuNmJBBcszzrJncwbq9jrO3zXz2U?=
 =?us-ascii?Q?p4O9RL3dHOHCiBKgg32uhT/jlzjB3g2Wj5gZRVlk9jCwH8sweSQs56F5umar?=
 =?us-ascii?Q?nu1gLTEeucUNzPK4Ee336jxI+xfMygDz7et/aypbqVyREJYrkCqX0XkM7OuL?=
 =?us-ascii?Q?4kGhwUpZ5h694UqY7kwlnzWGXXDD6A3FutWKzHZOaJnjLuxHIOJdZvVVer+K?=
 =?us-ascii?Q?IKkx2nZY2Z1jsld7B0vKwnK5kBE8R2xko22soESKUc3mMeXbS2Bbk1F1RYTl?=
 =?us-ascii?Q?8lw6QP7HLZNGT+55+XQc/oFUoZ2DpvJnt18g4WVi2wOP0NmYmTKqCHZb/wq1?=
 =?us-ascii?Q?iziaCahuTCJWcfLdxi6ZJawezsuHpNh/QrrBdfV5uqIM5KbHujxlx0TyDP9p?=
 =?us-ascii?Q?U1XKw1mdWU1J/8rLcsvw2V3LVgtFcZEbgoSol5nNCsgAM1+e5XQ3thw0wYgV?=
 =?us-ascii?Q?mRNqcbd2JEnErhPh1k3jTkcNiHp67VLLAmwfIUqMmL7Y7eTHRVOENJFPLL62?=
 =?us-ascii?Q?NKvWUuym1uk82tjLk7MxYu0AwnH/GSNErRFcG8fs5JTyAUjK8t/h141MgBgI?=
 =?us-ascii?Q?FtDWp0DmEVMkB+GnqZGeVNUzvjyYYQLPxDCaMUobgvlrpyCOlmLxrFpUq4Qx?=
 =?us-ascii?Q?k/Zac2tu+/7fXxWnbDUDV2ZDS5AaqbeAzE6TN4L9kzsZVGvDNjWivowWvI+D?=
 =?us-ascii?Q?H29t9W9Ei1zxRPFN+G9BoFZJvRmOXDZMOVClvWEWwfWDj0hDjWSe9KDsqeBI?=
 =?us-ascii?Q?VW+UPIsQ5PKGGge6VOuERIBFeyKyI2pgigMljgkm1nue4dinoR/ncyytDXGE?=
 =?us-ascii?Q?53NFLq6b1E3zuWRqDRk/0151Z9nl/FH2hRZjB5bFSaFo9186WrH5ZgS8pFUa?=
 =?us-ascii?Q?55LylAPSgK0R4Mw82MgOYnkG16ZtuZUcKGcI59AgkFAdmSmDbtlYkwBn6Ckz?=
 =?us-ascii?Q?3KJ6uT+7Ox/8q/DHWlVhGjpgqkQL3LiXd+J5Pd3U2SR8C4ExLb3ht9h2o6XG?=
 =?us-ascii?Q?F6VDKqVIDcuxH6uhP3nkZylqrajUCmAdXyAmQJvf4166hpXJL69Zr6cL3rAe?=
 =?us-ascii?Q?heP+GnDOVdTSwt4I1frinz73ay50nw/bPRVMTMi+nsdtPKzTSHwJLW6WKX9C?=
 =?us-ascii?Q?ZssRy0KZtd5JpFwhHP/8sm9luQN/X+pG8NWSmknm0X3XzlUQwh/YEWfy5Xsf?=
 =?us-ascii?Q?KbRm4qXguFMhYlFRY/vWICgAoaMDpiXtk5Ui0sXi43995TLETQA1pjaE6fpr?=
 =?us-ascii?Q?62pb9MWp3ZZaQM5b6/bRsgTHKyCm4egi94LdP/MvlOg/JxuHez813EzXJ5nx?=
 =?us-ascii?Q?TVuar1+KZ/B+mM/YHFAl2NPU9cvrEZVVmlFtnrpqjaUyAayLLr9HDmzr2to1?=
 =?us-ascii?Q?M8/laulXV53gPrzX5KfNJSHWSN49zEq5FcFNCqaR7rDOdouLxY9KSn43OeLA?=
 =?us-ascii?Q?9FiSk7heNK4yQDB6uch6HYVidE4cPII/EjBcfWL//Bzquq0T4SOeEN7POrZt?=
 =?us-ascii?Q?IvaRA3ce0mc5+qzgEpQBOfIwiTSuC/gorAXxNueUdPYeLJfBh5Z0LtxVdNq6?=
 =?us-ascii?Q?F9wFwogQ45p8VhFFcjQLYSV3SeuzvZ5Qu2zjk3iFcGp7iFsj5tWbPLuv7vR3?=
 =?us-ascii?Q?BjaikBZzTcbRfYZYf15ErjqwIMoVjjsuRo5ES3KmBPU9V/Lf5g0oeYnhUCV8?=
 =?us-ascii?Q?5brwBwomnWYP57bwhPuYvDt8tNJS8xezS1BCstyoIqw7bmM3t9SwlPlg5MVf?=
 =?us-ascii?Q?dg6pz015rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a806e1ee-b637-4c87-d649-08de595a25d3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 02:01:25.3041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QXOVkLHfAI2M2J4v63/e71if7LM5kHejnq1T5+1iYLLQuOSfXCC7Tdyw8pgc+khgVqIhHTGeswpoIR4Ramm6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6C1A2BDF1
X-OriginatorOrg: intel.com

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/selftests-net-Move-some-UAPI-header-inclusions-after-libc-ones/20260121-032048
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260120-uapi-sockaddr-v2-1-63c319111cf6%40linutronix.de
patch subject: [PATCH net-next v2 1/4] selftests: net: Move some UAPI header inclusions after libc ones
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260122/202601220222.UHz1JhtH-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220222.UHz1JhtH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601220222.UHz1JhtH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/netlink.c:3:10: fatal error: net/if.h: No such file or directory
       3 | #include <net/if.h>
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

