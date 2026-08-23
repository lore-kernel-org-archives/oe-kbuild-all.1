Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E742B376475
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488097; cv=fail; b=EjCgd0OGk0cBq4ymsgUoL0EHGcdNEKq5FY4L5BUnO1+5O2FIkiEeP7ERtV2C0fQ1QjwB98kct/kaokzUN/K1WiTNAsNDnPuDbhQgwL5DG1GcI61m60VGMNT/tbcTUS+svq9A1k8ZnrjOuG2ZrAlTBGZT4lyV5m7RRIzEBhm0yrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488097; c=relaxed/simple;
	bh=yFQj+HrmYgUK3eDPGIKKrOC4Et9uahJVMqe+FH6YvdA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PU95vNARJEHGZH1IVjEdavKzp6LkQXPIhJ4ch45IGwz0mX/yyeLbgszEKcx7iHz4J0jEGq+UGUjMzlaRh5R+J9cbMnToW6v9l1QzT3Toz56SsfygVWsms9vV5nwsDi3uatgGNXDla9mNvjJM5HYmFYCtHu0NwnSJRGKsMH3Ksrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFcWXvwf; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFcWXvwf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488095; x=1819024095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yFQj+HrmYgUK3eDPGIKKrOC4Et9uahJVMqe+FH6YvdA=;
  b=mFcWXvwfzoofHAmyanpcTEl3bMc8oBfP8ex/Z91JBoj/Bd1VC0EPQ5AE
   c+uHKGLyGXJZZtttYiLptabf+sW/eSfmSPLbXVLiRHymHqX4E6iJjxMvz
   vrcVt1xtvXqajR+XVFvyDuzWRdqXsR8QnH6Ani9lfMx7Gjt8U8jRGF7Fp
   U+4rsRUaSoniz+SkR0OMY1+jaiGDDv/R1SBTOHbya3EOcJ9117S2ofHQl
   V0znGB9y1FN5zPCPkv5xj9/kXR72CVHSAYK0BK7r0izWCO1+mODJ5Z34+
   34QEwy9aFQjiFZQa3GfVm+vXSVUpD9ZBS5YVwSZxFxwuX0jPPgIqdfewy
   w==;
X-CSE-ConnectionGUID: 5lfo4aWuS66NNpgxe/jYbA==
X-CSE-MsgGUID: jPwE2ND2QQacpaEfijOEcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87076780"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87076780"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:28:14 -0700
X-CSE-ConnectionGUID: ndh1bkKeTZWszygbGXW6mQ==
X-CSE-MsgGUID: 7gLjULprTIS79V3bp4/pRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="296670797"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:28:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:28:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:28:13 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:28:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6I73B6xoQbRVbvuGpYyZGkaH2IPKRmpTe51hFJKhFb3pyN2xm5SXapWehIuJsdECMbu+AHu/ntnNJ4mg7tE30tl7ghbORhI+g/KRyZCjrKZK9lCojxp4c+TRdXDWlX9GykobXja5R9hr/8opAuIMNK/qdG6SrefEJU98cGb31nYlHaHUJTumPB4AFJfxsMlwI/oCF4He4czKXSOw5WD3OTo61D9PaipdRWxd1dTYZPzUVGgpGeF1QsX0Xeab9xOkFLG1YtNUEbjFa+/Auq1uf4aQJKwXHhCww3UVLX83KN4LctoMeYQnJlf265ZZvhDpcdotBZXGkgSEYM0lQ+oRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTPj6wsaDlG85OEssHjElgS4toOLK5gFyheZW5HfPg8=;
 b=nqqdD+nchx10kEyW3XAgMENRk+aA/rvrk3PSaomJ6N4oPOiC4jXRq2lCm8Kl6rCKxXOZHu8849Mr03P0ZotE6vy6qt4gcT5pQiNRW2eD/MhWShRj9xYd/aZiJ5dcQGa7DogWgk50Rz0e2f8v1UlYCC8dfqdqLEKm69z8I+aGL9fjKxlBoX5MICp8lmU3H7MxUQzgq3GvrgndI0Vv6K3CPvCBHoaF9xTMROMHEVTFduqMf5yzgLUS5KRehM0u6RW6J+avgBPfjnkhEtumOS3u+OfFVszEOhmx+uuw0xyIm8oFZ2IZ12pBzF+pzIVTfLSsAetO48tKIVXbbPntBBXGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 12:28:11 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:28:08 +0000
Date: Sun, 23 Aug 2026 20:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [djwong-xfs:llm-fixes-31 137/161] fs/xfs/xfs_quota.h:198:73:
 warning: statement with no effect
Message-ID: <202608222342.PWgHt2BQ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|IA4PR11MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b79856-8ba3-438e-c3fa-08df0111fd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: pnMXzVtIqkCSco0B+wIxSmNHazrozifpX7Qkwl4I3bcCnWrdT9qXF9/yqeVHXYc7iKKikuuFo56KOVDBZyxypjQ/CaE8jEe2pBi8QYv6SwaZ28kX3agK4Fzx/oNjM9wnTKkZfrssZe/S2R+QklLM1bZMr6R/ZwrjQ/Dt5h2xaPe6HMpoGDCz8w9OMnOU4PZMSibvQpoUnAISQplaIBHhKjTWk1vq6ch0B1/bA4jH0T3zM+g43qA3NJZWpH6LyKrJFsl8kHlwKnX+8SI5l0ivsgC0RgzFmPFNkw2EiCc/JpUpGRWYk+nW1mIXbP6GMTRAlS14bgA0gobfT53LsF8s3yNEleM6c82a7IwZ9M3AdasXEoDFrYeT/i6J2xjFgxEPfNQNURWu0J1exjk8JuiI6CdN5u65KlbgvLhG+MKlb7rlliWne+HOJ0Hh2ezDgPItywE/vBZdkCGGo4ICRGvIG0pgmD9YyzCVUImpeaukaE+cO8MaeLsA+nkXYS9kUCsPZRKtZJE2QB4aA7gO3ZpIJ5VN4m93YJuTIy+DNjuF6SoT97Yp7avgy8Wfg2nel/yl+5t9jqTH2mcVego+cPKEqTLm6Be1eUn6RTuhNY3utDsrAjZmaJ05qI/n8a8+nab0ShOfRvVTRDi0YFEuB57rlvLEbCLVyXqzigDbQLriu18=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4I07vedIvXj7cB0Bv2NmJeXZ6pAoP26/DlrdCAOfsduoIM52cZbxVBgm4fZs?=
 =?us-ascii?Q?rV9NN9amtID8fGT1TCfdJ2HPUP35f2313BYUmXhDYLyEnKJr1EJphLQeFUzY?=
 =?us-ascii?Q?z4AVfBv3/thu6DMK4N+pE2SzMqjhV0pvk17IMCnukvw/1y73KbO1f2HOFiEx?=
 =?us-ascii?Q?1PDX5PPWfGodaePdyHSHTp4lWSCjp0J5V5VFnFNi3j8s3ysiND/ob8eM46ZE?=
 =?us-ascii?Q?BthUgWLiEhDAyZOfCi4zqwYAgln+RqVg9qpRmHSb6g+gINscwx4Vj3BMalTy?=
 =?us-ascii?Q?/jJK/19RpY5KVwyoG0PXluKi773p2oPzr1OVc9fT15U7EbwoPHKvlI1B3z4o?=
 =?us-ascii?Q?PqDZBidOupqZQOOAPV2ALK3d0FaKRNaQr+BTLxDFE50t41gW6NKrHMVZnma+?=
 =?us-ascii?Q?mOiOgL0vpqu9x3JDII8INBanVKPnBFS5jQfRIQkhB9GimKtMloJXq4dAy3Lm?=
 =?us-ascii?Q?kZ/lIfhep9tl1Bc9tx4miYG8uOOFWgVjD6866vwL2l1q+Vu9w7DxX/6wqoUd?=
 =?us-ascii?Q?Jw/HP94aJOEretFxRBJxCtwM6FW52f+FFHapjoJQiBxeNgBY7Q5jyT9+69zB?=
 =?us-ascii?Q?gG7cq/P2Y+Ygi9msbQGK2QNoCHayVqlvVfJA7lZSebUFmabBbgALJ4SX5/ol?=
 =?us-ascii?Q?Ljxs21R/qbcffE4Qbj56dbZRwf1gK7Rh9SKsbXa04Ir2bkz1PKo5vdGfCrvs?=
 =?us-ascii?Q?9nO8cIgG9FfJCHV3tS5TeM4sXModsXJLk9zEq+o2qvqPpwRNfVz6xWGI4AY0?=
 =?us-ascii?Q?PYIb0ZwoKgSojDcuKPQtOYOtMV7iZrpZ/E+tqEFpif+oLmetGCQ7KRmWZ6GK?=
 =?us-ascii?Q?TRGF4vLUKIMNpqXMBB0QhEgLhVE5wEkuoS2riQ7olYZ2MS6k2iyTBd18Nf4K?=
 =?us-ascii?Q?jzowH0cEmTSwxcjbiNcPYukehC4A7qwZ/VC/ekZB/k34Oy8nXsaCxm39NKJ/?=
 =?us-ascii?Q?NhdI2c9v36s+CEkLag5hn1XV93FgFQo0iUsKg7z1r+tV4EC2TklgviWsF84C?=
 =?us-ascii?Q?LAkuEoBlCZvD+V43j/DD9ZjmEFpPVYkk9IkgwkPg/L007zIorJw5n+ycj3AW?=
 =?us-ascii?Q?ZjxUTdD4tpt13yOhoxLm2upB3jbbjeWRmJINKvAuvjX/7pxD9AMhe+IkydEU?=
 =?us-ascii?Q?wlBF0w0PPqAUfn5jaX4SMQJc51GbMZb/0xG41mJbfHcRowZ20PbWM8M+fsNe?=
 =?us-ascii?Q?McSCYl7xs2GzztJ8F24g1s0F1CdTBMnp4PkU3tdHgLRPCI8AUj5xHarVYqYl?=
 =?us-ascii?Q?eiprwVYeUld75Ni8Nll+f2Jz0zWjb9dYIUg4O82LzxT1OKKepBf3jGgWD6s7?=
 =?us-ascii?Q?WATyCvIUzN0M/HjYVvZZy0PvE8p3dSiFjTp/K+ORzwOzNUjRGTW603I1xHyL?=
 =?us-ascii?Q?Ihel4mCmhOaF/5xL8m73zPSVDXWP4CpjlrWcE11YtelouoXIzcsKPTlivYJX?=
 =?us-ascii?Q?N2/sD3VOOKHVuGCoZz2ZYrmC7+1eMUPF93SKz58wDARr8tLEe6vmmMo1ij4a?=
 =?us-ascii?Q?uu3UmagLx888JQBt1AFLFOVh7bqjVldCU/zSO11kXMKLg0lG1jkQaQ5nDVt8?=
 =?us-ascii?Q?zYyerDcLnL7NzLQ/xgQk5Pm/ATkfcnbN1yDsCufTE2EvXrkdrtXK/VjAan5m?=
 =?us-ascii?Q?0lVxeIjjXkHyWObSbDO6/9ULZHSissWMkP1iEu4jK+5rqW+c/dQfUOluZIg0?=
 =?us-ascii?Q?fX5Pfp/XZVWbd2TcHlnF42/iK5T2r8vtXiuj94NvWU+y7pIwqSK357PQsMKC?=
 =?us-ascii?Q?+N2Q66PQvg=3D=3D?=
X-Exchange-RoutingPolicyChecked: l28v3jm1wotjAsQM48o7yJ65myf8TLQAXnSSOK25XgCNjhGFpQ3L0qaPOb/wnEY7LK0Egco28bnweXvpt7dzXgTAie8jt+6wUzaezSVf2/lkE+fDMRltdIukJLPVLTb8c2udZxS7vuq/8uqdSnaxghvCbCwnKcUt2k3gTDJgmQoTvht9gXg0mx0Fg6HfGOUC6Q8ezSib8oPUhZqeWxi1aJFdHGRlnSrz3Ru3oa6s9AuZAQyA8kz7GWiTPMK6YuQHM0pQ3HlayVsgOn/cV9mZ8p2CcyryFSHHh9uPZYDh87WoD6rS1ag6O54IXINOd54jqrOLNtU2K+YiYUkGTfaBBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b79856-8ba3-438e-c3fa-08df0111fd12
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:28:08.4093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5FPszZBz2CwQ8UgkoQx1qlONIbp81NmVkhHVm+GIAkw5KZAdsVRKC9NsyDKUlWnpstFoKozTXiHomody4HJKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-31
head:   99720b43a50e52830dacd44219a5f40dc8cab503
commit: 02ba3b2929d48bb926d06e902754b4f5249ce78c [137/161] xfs: reattach dquots after changing inode ids
config: x86_64-buildonly-randconfig-004-20260822 (https://download.01.org/0day-ci/archive/20260822/202608222342.PWgHt2BQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608222342.PWgHt2BQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608222342.PWgHt2BQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/scrub/inode_repair.c:34:
   fs/xfs/scrub/inode_repair.c: In function 'xrep_inode_ids':
>> fs/xfs/xfs_quota.h:198:73: warning: statement with no effect [-Wunused-value]
     198 | #define xfs_qm_dqattach_locked(ip, fl)                                  (0)
         |                                                                         ^
   fs/xfs/scrub/inode_repair.c:1791:17: note: in expansion of macro 'xfs_qm_dqattach_locked'
    1791 |                 xfs_qm_dqattach_locked(sc->ip, false);
         |                 ^~~~~~~~~~~~~~~~~~~~~~


vim +198 fs/xfs/xfs_quota.h

ad4a74739708e1 Darrick J. Wong     2021-01-22  193  
92f8ff73f18672 Chandra Seetharaman 2013-07-11  194  #define xfs_qm_vop_create_dqattach(tp, ip, u, g, p)
7d095257e32121 Christoph Hellwig   2009-06-08  195  #define xfs_qm_vop_rename_dqattach(it)					(0)
7d095257e32121 Christoph Hellwig   2009-06-08  196  #define xfs_qm_vop_chown(tp, ip, old, new)				(NULL)
c14cfccabe2af2 Darrick J. Wong     2018-05-04  197  #define xfs_qm_dqattach(ip)						(0)
7d095257e32121 Christoph Hellwig   2009-06-08 @198  #define xfs_qm_dqattach_locked(ip, fl)					(0)
7d095257e32121 Christoph Hellwig   2009-06-08  199  #define xfs_qm_dqdetach(ip)
7ac6eb46c9f32d Darrick J. Wong     2021-01-25  200  #define xfs_qm_dqrele(d)			do { (d) = (d); } while(0)
7ac6eb46c9f32d Darrick J. Wong     2021-01-25  201  #define xfs_qm_statvfs(ip, s)			do { } while(0)
7d095257e32121 Christoph Hellwig   2009-06-08  202  #define xfs_qm_newmount(mp, a, b)					(0)
d5d9dd5b3026a8 Darrick J. Wong     2024-11-03  203  #define xfs_qm_resume_quotaon(mp)		((void)0)
7d095257e32121 Christoph Hellwig   2009-06-08  204  #define xfs_qm_mount_quotas(mp)
7d095257e32121 Christoph Hellwig   2009-06-08  205  #define xfs_qm_unmount(mp)
5d2bf8a55e03b0 Christoph Hellwig   2010-11-06  206  #define xfs_qm_unmount_quotas(mp)
108523b8de676a Darrick J. Wong     2021-08-06  207  #define xfs_inode_near_dquot_enforcement(ip, type)			(false)
200491875ce144 Darrick J. Wong     2024-02-22  208  

:::::: The code at line 198 was first introduced by commit
:::::: 7d095257e321214e4cf359abd131ba1f09c60cba xfs: kill xfs_qmops

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@brick.lst.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
