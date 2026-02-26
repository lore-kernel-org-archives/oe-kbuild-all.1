Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3323A1CF7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114312; cv=fail; b=JjGdp/S1NEwZv9Gebx+/nPBjHfgzJhVauBGzlZJGAUygn4qDCbDS5ZFAgoHW86Tb3ZLMnqdpu8aSwcBEI8RGu9iJ4wq3/ASSS1KoBCFicPvZqkBvebPba3rnlga5s3x0ZxwLiz//V6Qhu7EH+prh0GEZ4tWdEnYqmCkTf/S3iPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114312; c=relaxed/simple;
	bh=6PAFSOMiOMJdTyKDpGM+Rq1gEgWnxyr7qiq/bHhMOaA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Y3Vz+yfnZtaIyLYZxkYJuLMkmRb/r9EvblaupItfou27Ek7YkQjBdEsnzGzW973+OJI63a3In1EmZ4WJ4nxmFxQvVS4+eJl1i77PjYyoBJFMzTKPORJX7QmBkHWEWdgOa5Verdwz8/9BPn4vvT42nlbtQb9p/b5I7fxj6fXKwJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nT6dJLsT; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nT6dJLsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772114304; x=1803650304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PAFSOMiOMJdTyKDpGM+Rq1gEgWnxyr7qiq/bHhMOaA=;
  b=nT6dJLsTlyP4D+rAmLMc72kra1e8WJaiSn04wPfjZWtpK/+zlA+z0a4D
   zWGzI/STokjxKRavkJB+RYn0eeczscn0UFyqtH9/G598zhPLhxHZafKPt
   NMovLk5fU5RAue5iRHj+SbLdgrOFm2PQd6bjWd9g54J2dLcpSrxVZot6D
   +d/GHLw0J4orMI/AdhY4m1nGwmy0FfjGoW+U73udwpcs8bm7K27NluDsx
   r+64iDe8ZLvEwEPRTTxdY52+jgCd6hFVcmoL6wd/58oY4/WCsbh/n7t4z
   AWaQqhqLEa3rIQgBdjcjzEwf7lC6UHT+a1VWNI3ewLFvNVhf9P8dhHEP/
   w==;
X-CSE-ConnectionGUID: vExHIeroSC+mKUKunp+KCQ==
X-CSE-MsgGUID: cqz8lMHXTraF94L+aIYdow==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73276918"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73276918"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:58:24 -0800
X-CSE-ConnectionGUID: 8UgMv8slTeeyLISMVnZOLg==
X-CSE-MsgGUID: qTvwkuUHRn6Yuy4QX812+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="219890216"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:58:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:58:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 05:58:22 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:58:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkICNizDWikJSCu1crTVkmdxTcSn/jCyDfF0dyCk95nPTiOiVVmbqXwoW6F7TXilx+Kxxq4kCW7zntJI6erwPy6o2NW9PgVUVCQ0J4WbYcfLHTL8/XQW77zAbCNx+NVM+DkRd3XsQW1xG+aOhgatifU+YjCC93pexMGrJq/Wm0jC2Dl+RY33Ex0cpdlWOaCSS1e6izSZXkkzl8dEyW0QlohJjjm8k1XGK4WklFZvuXlzeON3HGaVnDo4LycPNRiWwYy04vZMBOGZQ6gz8lAm8is/DxnA9P2A7Uf43/+q5utFCBdf2LFm/Ux/1A07nP0uHUlEKn79LzMS0pbEwbLeSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvZLdSBs+qHrNyObDKFkJ9nwJOXa1m4kALoyvgcelt4=;
 b=IvYXazuR/dp2xFMc2locb8Yy38ovwIvWSesuoTy9W1ZvZPz5TMgqNWF4r9T6oPqIvDoHEAHvT4jnn1st1StBtkkiIiQCF/IHb4cvyOKnMVIrHYu4FfPETn/vXftZNVS5FaGtHHFEVM1ZGinLzZUUH66SUXogK1Ff2CRGgXxb8zcZqlYapt9hXzIqMJ6f+l9iJG9OwNYnyXJB8ldtDdpcSv8M5/J+11UDeEZePTAN4meiggBBpTugD77Mc9HTHsBhd1gAlGq8ngOPdiZMO6qTlmFZWNpCzv32VdJy1KC6R01G1vtLW3RMkDw6/ktan8eO0wHmHbxxYlXm0Bs86fFAoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 26 Feb
 2026 13:58:20 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 13:58:20 +0000
Date: Thu, 26 Feb 2026 21:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [thomas-weissschuh:b4/kbuild-uapi-c 14/14] arc-linux-gcc: error:
 language c++ not recognized
Message-ID: <aaBRdM/aEGbzLW9G@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA1PR11MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 33000797-136f-4322-81b7-08de753f192d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: SbGjh9tEqED71BYinTJCZgPoUqJpDAei6aJ9qM3KhJrys6Idg3CxQlC1C5VKUXUwzWBQ45/baERuZQRIZOf1HXYOikpWDPOh6dWZ3YmJqdW2uksNe0XzIuF+9G9vh75pb355+w4hSWMJVCl7UqHz/64PvMMVBF5/8PhruihWHcfc/epSQt1Y+uo+GP8GEyROKqJzRpgto4LQUhn4571XgRCSS2XjqJUo9YDK+nFnsdKoevls6XsfwvU7XdjOb+KUYHatJud8Xyd7XO5nHHlfXzrim7h7Mt3kHwPaOHMQJ+8HZ/Sg1cRa4LKvjq7kphc8XD6i/BBwrSZpu/l7UeX7yvP9agBVQ0FQ740TCLHgd7GYFr/Zh/gtjkmYmHHbSESanB92F+/kLm/8RY83+3lTDiSqdkfazW34xb3Lp2NfaVKurLYYLG6GSkltcU74XB5NZ+bnVK8wqlPLjXop7KmbE9WU44fatdTCpBGgYlWUBWCqjoZOsb+e5x3AXsrkCv1mo5lJ5kvjNeMK/lfBQ0tJz0kmjpi9ue2gKFHTNuzOZ8Rc8L20v/eMt4PoXfR5l7l9zvXshNuKwgetWJVxIPhRPMtTjh0qqr94spIkTqeLCcQM5a9rsFWYJ6WtRTDR9i/qL4IlSFEZ3ypG7NNUWhB2mgbTeZecfO1jzZ2Hq2ns/mxpVpIW1dCO4tKBFZN1GWSuV23/WSBNURfJveM2QVcmuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYEn3T9Ws0nUvYR+WpuX/tmfIDUfUM+vt/rQ20Npmd1HtHSz7rf9zdboTpHT?=
 =?us-ascii?Q?cDZIgx4Jeu6Ggk7vXaT5M4UBekJeT6ag+qM5Z8WilOR0EeooI3FuF1DfSd9Z?=
 =?us-ascii?Q?bEwnFet+lpDr/bS3z+hIx1G6M00aD+Ml101l3TcQ/Osh3tGKGjkWAhV9HhtU?=
 =?us-ascii?Q?3JtoqeUjz+LrBAtMZIgM/pKUZ1CXJC/ss5pOckQ4PVe5gVgniQFziKAFu2jk?=
 =?us-ascii?Q?QetMHoVRd3XImm9VIN5M1opnS6tf8JkzYfxqcYQBsMJSc/Nxjymw3XaalpR9?=
 =?us-ascii?Q?KSomOn0tvQFlWR0qekfsziVGyswMFCN6SBmaPBG8a7f2WgxpHWqrN4IK0WxV?=
 =?us-ascii?Q?HiDhc1ISfCiSQkVrS3G3fztTLiSTq4UUoWA8iof7VTDzs+0b1HrZp97h5jo2?=
 =?us-ascii?Q?PjeD4n2JN7F2OKE22yUX7phTd6GK1njbGtzqBrF7Gb+TEGNIwa2Hh0Wc1gmp?=
 =?us-ascii?Q?3bZW4Lc2i/ow+tYrPhi/LI9KaT8y+LWjXeNrjbpHBsQqvEL6WlBniP+QKZlD?=
 =?us-ascii?Q?vxC6CaYN1azDWzzvVapFTihR4hWlJbCe/C782eHIThkjDvELR3Bsrsz3zn4Q?=
 =?us-ascii?Q?beST3oP6Ty4ic+vJup6dOLCyKQkyqEj5/tTM/FWIN9/pJUgvgfWQVs3hmwt9?=
 =?us-ascii?Q?MXaGrmo94/t1PrfQMUrRX0mDuwr/vqo1rrSRAORrUGUP5QMTyPO3w8ynoiV1?=
 =?us-ascii?Q?JZTi61phekKSwnvn6c+E4yI/TQiC8bCcSIJzskpqigM8RYdpY3Gp7nPr39/T?=
 =?us-ascii?Q?2MCF+T+YS7wWpz+eqw/O7hzBbRDOROiOHqBHY459QFLCmKpczJ1fXfrZV45m?=
 =?us-ascii?Q?ym2Z++6UICCmmH4b/Bztg2yGQLChn5yW5UGtct7Hg9qUfuumB6yplmOX9ErK?=
 =?us-ascii?Q?LHnYz3xIgIXg/8ZNpf44c6/fbnzOSFvcd5Hmk8zzDJksHHzPe7xndqqJrV5v?=
 =?us-ascii?Q?9Bgig/lKy31Ad3qXJWOC991D3SBBrpQ5Ec9Uq1BQ6GPfROVvdRExJ0PY3Db3?=
 =?us-ascii?Q?xjKK8dQLjBZY6LSNZueSIt/bCpeA+2NQ4DHtNH8qw+4uN96c8zJAkB4xc7kP?=
 =?us-ascii?Q?v72Pj3V0o9cF54WBtNzDDP6Wfm0IDFhXXsUc1diJGjNSiBg0ed1iDavtZpOg?=
 =?us-ascii?Q?yZhLJzriHIb+qo3d/fesGor5ufK8panAUZM312bs6oXNua3vfKZNPSjTZhpO?=
 =?us-ascii?Q?rVKiPkuyAW/NZbm9TghYziV0ecjyW9+V6jGXFeq+mYI2+QkjbDH4Bok2Do90?=
 =?us-ascii?Q?fPA91QwPx35SqxGgwJAiSsn8bWX8EE2hu1sanV8yepj6G2nev/qXB6Yq/C2F?=
 =?us-ascii?Q?moQvb8SEUJUMdf7Xewwk7rz06gbsRxt09fXjbnOEo9DaXqRqSIF1IcSaDWP3?=
 =?us-ascii?Q?SMo8ck03KIzWI4/3tsg0BLqVnIum16O+56c9GHckrh4xTpw7+DWPYEzdU7Lg?=
 =?us-ascii?Q?1Do/LNz7ol2GtItafxxdKiKznxFa3bY/KU4wPnPDV4qn+poGRvK6a0MawNjr?=
 =?us-ascii?Q?T0M5eoC4JCxbUUsJ6paOCQ7b1pa0WdzZIsh2Wl3nS0UIPrQP5e5Lt/704tfD?=
 =?us-ascii?Q?93lWSoQC7fYnm5kDBNL8NFLeAExQX0wbwa3STBmVHm/9pl9RFE2MZJrjtx78?=
 =?us-ascii?Q?92HmpCkzDGgdAAKUAlpqA/PUcWSuUPU21c9Wpn03tW0chhT2cYCwysIIrrn7?=
 =?us-ascii?Q?y2mjx6wApMvyoWdygofGTWzOIYoFh+6gCDo1iO/H6xbMJyMtMAGlH59WJw0a?=
 =?us-ascii?Q?ZzaDD34UnQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33000797-136f-4322-81b7-08de753f192d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:58:20.0227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+4B7p7AtU5VH7djxyujhXaQiuNC7T4asNJybkRHY1X2uJEQkA9VVXtPGgedwFL7iXKjn0S58+hljK6lrvDe+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-uapi-c
head:   f7e0b4956801dd819d37ffa46b55f82232b6c7ec
commit: 21c74eaf91ce4b0d2f569e9a502752d830c31cf6 [14/14] x
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260224/202602240723.x1uyz2AM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240723.x1uyz2AM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602240723.x1uyz2AM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arc-linux-gcc: error: language c++ not recognized
>> arc-linux-gcc: error: language c++ not recognized

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

