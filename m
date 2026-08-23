Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6EB3D4131
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488079; cv=fail; b=lgFxip7nq4xZZU36T9FmA96/MMc0Wf44dUCrz3pihgnRW9FoRAA3oq93pSP620pRnry140wK/YShf7jgDAyICi93V8VKqm0xDvdYAwmQVfC9GxRHR3wQRjCPdbEiOjBfafrrYp9FvDAQ2tOlqVVKMz6BpVBybkAT53gCuLsfUWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488079; c=relaxed/simple;
	bh=jK20oI7wTCfyIPNxR+Hob2/aOvIkxxhclwsErrv9nMU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jtt/ikb7IjMFYwizUVel56ZIdwbaQg6mYhiW5Ny5vZeD3v7B5kivHrBlWFUzGbV/7el/UX+wCQsJUROjnGuOuv7vMbk7lw2HIU31d1DHNDsOvaRv6VxVXoZ+w9gtv+NbiPT6nCDufYhdmn73kNnp85P8Db+m+62xHDm2p8G0uPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiW5KviV; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiW5KviV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488077; x=1819024077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jK20oI7wTCfyIPNxR+Hob2/aOvIkxxhclwsErrv9nMU=;
  b=NiW5KviV4NJH46PluCgawj59RE+ul+O1rDFbmoxuFHmPNKty51cZNP67
   NbbUnJdT5/+DOtMMbTcWODcUgOhsRmFoIrZQ4hPE4Hozk74EP4j0QGBWR
   vuHUmA/MtAcgdW+cbnYUI+znHANQQ5rj/3mfmbq+YZDYnvRse40AK8e6n
   CCnuVleyjR8JJCK/DLCGMZq+qN67rqzLHKEjVJZ5Qm8IU05pUC0ix+3nQ
   OkwdsDCWCxCNJlUhQFExk9TNKwAjzMcDigB37KUa8rQk9pFijqOA8CF4S
   tBIpfUSfjZfol5Mux567sSQfcMpNIpeeetdggIbSrAUdHOpjdIzzTmhV1
   A==;
X-CSE-ConnectionGUID: qazVFvHpRhSTG0kjCEcBNQ==
X-CSE-MsgGUID: UfHYlyz6QXGD7qXiVxQOUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="99120381"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="99120381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:27:56 -0700
X-CSE-ConnectionGUID: n5f6Z6GuScyAjCruCGPynw==
X-CSE-MsgGUID: nhnih35nTP2YdfoC2WuyFA==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:27:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:27:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:27:55 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6pmIcrBpIZ9F7bbaK66gVRQKdhO3e5VIRaCHgQgm9CZHq5Uz0kSqbK3vvvzZh9OWbwqrQBfFz00rHwVb0m6K6kOxliPb6n5YypqbNfHpzQY5pssfZbXlUIcEZwK3RM9ABch7MNjYgd7ny0uDfezyARXAfLxzRTxHp8iFbUtSNT8hG5F9ztIHL899dL2M/X0rJrpEZkblEpBvE3plUSd5iV+IJfvxSbKbyNBbP6NBHKaNItj63NuhQXlVk2emB/OCSRjPuPkIkoQIEFKfICkefoWb8HFgZbk1G2kkUSnmXqKBpIvkTPcgDwidTCa67hthk0xVV5zl35/Sqg+A3cDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4hmZcdpQBWuiYQ+6PMCCVZ4RS0RftbBjgfNoqYj9pE=;
 b=yBbPMdEs8lW+kXnTmWc1+bAoE9M0XlsVrhwdsUnlJoekBb+T/JBE1VMzEJ7yjsKdhMVfpL6npElhYsRJtJYOa2lNN5d9ATJKbr7fJfCQ2Cw6AKpsNP8NKGJsP4zqr2v3a+5qLgLpW+EDYtisxgzZrAVXuiPV3foQdha6lpe7h6WhDnDrRnTurkcZyhjDu7LgvAhPm1rgoe34D5IU+AAiE1tlXvdn4H7/kSDll4Kn+DfF4cFHlA8K/4tuH4hzRHLvKZrHVH8Wyglfww8Cz9LuGDf3ULmuYuctz+CMPCnt+MN2266/C5FK1DGDh4quts9Jx6QshUdv4s0FXO4k8xTTLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 12:27:53 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:27:53 +0000
Date: Sun, 23 Aug 2026 20:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [djwong-xfs:llm-fixes-31 140/161] fs/xfs/scrub/inode.c:215:10:
 error: returning 'void' from a function with incompatible result type 'int'
Message-ID: <202608222347.5sqdxIj1-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To SJ0PR11MB5214.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: edf155e7-91ff-4940-49cf-08df0111f421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|56012099006|10067099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: vLZ2c0L5sR8zFW+kxBtqfGMEr7Rj/cSCi9MEzU74cNaX0C4vzOdhkarERbI39lP0xPI4NOMeu/qi8rZFx4d9gHPXYDxJBvP4bgMJEWDaUFkEufrHHPwgGI32ZONXAA/a3vvHJj+ak1304a0HiH0rbJsza7/9LcwYOj/TrTjW04LNb5Y+8MdXOiv++u+7zls0S4B5IH/o/zthnKFXIGm/wrbcmiyiJKeW9UExDHMcgSU3puT5UdHmRqxapxWc4utcEP/rrE6KR0IwUNcEc/H/14+w2d4ln0EFX6PdpUohZvJC7QQ/rk2dbMJKrIRWv+JALrnAlfVL+Fu5OGssyQ8gHFuVTXhx5bxOcDkykUKRqtHVKTG93XUe44JfWxubO8yqPd/hWHpzjwmT4xkaljrpUPw5Bkm8AypASG29OLdJ5ahmMUX+qBcg+DBLieLxExr/yN0MKeL2Xa3xitpLIZ0dwSXbkRHTnh6EVuHUgpI1PHbUChgeswsLMyaV4bPfKF0AaMfyDF3bK9qiQ3esDGpMb0Gt9JGSlOwplQ0dlPgq2w9NLvTZJWgVFAuUb8tw9DeN3Jh8YQWEIaghscyA1p/eRyGbTc6ATvwCWhg+tsNOMXenMwkOyss6Zh47PKdNOECNy2wvxef/lkEWrvSgdKqBIWCi7oeCqSKJhw1/KrQM7Pw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(56012099006)(10067099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zE33I8dBeOSD9rWH3Dr0vgLDsPGiBzJ4e2D/GI/5jwf151hYEyLithoL4uBf?=
 =?us-ascii?Q?EI7nuB6YTwsVgPdfP1VMxL2cm5pIxdLLJHM92f5u5Cm0yw9b1iS+LfZnp1mT?=
 =?us-ascii?Q?CC9rsaZHw1OrqX7kfSf0IBAIpGpxmkNRr9PRXPzcH5+1xhnCjDTuH5fI6IOV?=
 =?us-ascii?Q?hklvaZUMideEA9Jcs3R+YIY/wDPJAWkiLhrQuLO1x044ZGr4uccD0TxvFg7c?=
 =?us-ascii?Q?AMpFDxtuhrUq1mKSfBguNHZVh9sbVM620Wc8XCneRWUXSygsHKJtyC0aRsjj?=
 =?us-ascii?Q?dQpu17Lcr9cm474RduWWiRbFHgLLFrT880f2jhFSNQcyVgsh09HDje+qajPN?=
 =?us-ascii?Q?cLfPI7QzWu1ze84rJUW0JJRCQugXtlM/zr9ndZCAsNYswXTTwS5xfITgGtpR?=
 =?us-ascii?Q?BmVV6jBxJq4CoGVeN9PAdiDxYX/z8r8Cb1g6Np9j2cxlCCOnZpCPw9rpjAMX?=
 =?us-ascii?Q?hp9xR27LtVv1pVuOeF0gSaZK5Z7QWGLOLrmS3Gq86lugJYII2w0VTmqfTqXI?=
 =?us-ascii?Q?PDBmFjqi7DkRNo4xdPab1iwcY63xsZ22k5WfsL4dbyyzQVumCEKzTyuhF/+5?=
 =?us-ascii?Q?h2jndwdb4QAg1ULgCZ3dh2ytHOie448htaDxACSGqfUn4YTAETZxa628b1LA?=
 =?us-ascii?Q?zUku4Enzcv8ylt5crepZ9xKG/dhJg5NMLGWozfxLl8mjCIOT4NzK8rtPWw6X?=
 =?us-ascii?Q?PUq6Kb7AkHYRWGTdOEjkdPgDGzNLClGzWIuVMIOZFyYP8vnXgSFxwyvGu5+2?=
 =?us-ascii?Q?4cJ8EbtnbiNz7GDvGpnymyw6EClNVkY62J7N+oPcNcmucJv2Z3tQ5L7lxNlh?=
 =?us-ascii?Q?hxkUzXYJIKwHF/hD6vTbE7/caKbH4D+b/qiZqAszB/+hNh+y7jhQKsT5e/us?=
 =?us-ascii?Q?bP6ZF/rmPjIlR7Jm6dOTRjRydHVMunaFgubLqv44++fBJPb+xmJ601XeWtO1?=
 =?us-ascii?Q?eiVXUcNvUzeq9YGx1PAfzajwUn7tcZFu9cSytlOZdK3XRJoLU25ILlCl9PQL?=
 =?us-ascii?Q?Q2b78UbQmp+z7OzvBt9Zt85Q+Awjzz5mn9NPxghkCLk/+5b6chNp1sxQs1Q7?=
 =?us-ascii?Q?D/BUiiwzhDcKx6waXRXIKaaLXI68VKKOZhnlNl8MW5o+BXrFzbgR3H1Nb8sC?=
 =?us-ascii?Q?fS7ySNq7H688uyiY1TDFAFyixzWhduLr9vEqxM3tcPeLF4ER6n01ckvTB1iB?=
 =?us-ascii?Q?ow++sEHd7dTbGcEX3WniDQ4/FzDj5ty8NI9bUIwASuABXdqb6oHzeoYGsfj8?=
 =?us-ascii?Q?qJf0HcW9mCUHt6eGi/Hvy0r7gmeOhrjS5iTgCn8xJiyiTPc39QJ4GEfjkPQN?=
 =?us-ascii?Q?nMxgj/SHuftYWkeu1D6jgFZTiNCX692lIzn00YfD4Xw6vOVS430mqzA9fG7U?=
 =?us-ascii?Q?LF3zMnxvd+NXPkz2j4xcamuvZehGoLa+Z9MeGBevEV6B47/ZRz7LZSVq9VUK?=
 =?us-ascii?Q?HfSX5BcmICgQOBxUEg+EfTW4YnfL9kat0zz4sincQ58y6veDQ7Xee1kGSlvR?=
 =?us-ascii?Q?7l614cwXe0qqapy3qN6FTgbd6AxvJ0eyqfwWzfTLKftE8HArNJFO9r7G1H1I?=
 =?us-ascii?Q?k+br0k8+Jxxn36l/+4SMFLPLRYLtHM+W0vG9N6alAMN17tdzuLm1qnp6OaJR?=
 =?us-ascii?Q?HBk/+LzPMULVrIkA1MsxXwjeXdwmDLwO+baJaqzT9eIIEd++ikq/x5luaPiG?=
 =?us-ascii?Q?UYYz2EGSpydFjoeR6196BowmRDFtLx7kq+SNJXvV+rOquLzfrWx36pTfOSBS?=
 =?us-ascii?Q?Lv8XD2XJaw=3D=3D?=
X-Exchange-RoutingPolicyChecked: BbIlOQKOYVvoS7BjxWPVNElvq15Rq+B4w9oZ9NmVfsAd1JwhbMUTTW2c9sC0xlwpTfNHRH285AKZWsSA27yEl3jIWJIT10Q8U1bRIlZ6uE5ISZBAWFOSWfDsLsEyO4W45+4j4/AbDWIcEESEZ10iaVlWaeN3azPflxADmxINRYZ4yJMkDVlCcpNCfKryL2VR3hP0IxkbQg/drgd7K7lB1reH9zrFHKumroo/Byc4qbDcuu9z0AEq8a4Q5NJytx6YsTvegkm+YKNkoOO19gghf5xd8t/DdytH0VTzzQ/REkUzT4DjUJrWf6zQS+CwcYQHUJCxxnHrLKBFfmCqqijUlQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: edf155e7-91ff-4940-49cf-08df0111f421
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:27:53.4000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/o3XFmSpYQAFBRR0brLwZ+fi0j0D4ZwwHachDu/sBZwxz9KDSIftvMk9yoHfdXrxN17UVaIeH0HoP+EpBaBQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-31
head:   99720b43a50e52830dacd44219a5f40dc8cab503
commit: 2e4dfa7b0b3e7bcac4c245421cf37c544e03a21e [140/161] xfs: always report inode repair setup failures
config: arm64-randconfig-003-20260822 (https://download.01.org/0day-ci/archive/20260822/202608222347.5sqdxIj1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608222347.5sqdxIj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608222347.5sqdxIj1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/scrub/inode.c:215:10: error: returning 'void' from a function with incompatible result type 'int'
     215 |                 return xrep_setup_inode(sc, &imap);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/repair.h:241:36: note: expanded from macro 'xrep_setup_inode'
     241 | #define xrep_setup_inode(sc, imap)      ((void)0)
         |                                         ^~~~~~~~~
   1 error generated.


vim +215 fs/xfs/scrub/inode.c

    81	
    82	/*
    83	 * Grab total control of the inode metadata.  In the best case, we grab the
    84	 * incore inode and take all locks on it.  If the incore inode cannot be
    85	 * constructed due to corruption problems, lock the AGI so that we can single
    86	 * step the loading process to fix everything that can go wrong.
    87	 */
    88	int
    89	xchk_setup_inode(
    90		struct xfs_scrub	*sc)
    91	{
    92		struct xfs_imap		imap;
    93		struct xfs_inode	*ip;
    94		struct xfs_mount	*mp = sc->mp;
    95		struct xfs_inode	*ip_in = XFS_I(file_inode(sc->file));
    96		struct xfs_buf		*agi_bp;
    97		struct xfs_perag	*pag;
    98		xfs_agnumber_t		agno = XFS_INO_TO_AGNO(mp, sc->sm->sm_ino);
    99		int			error;
   100	
   101		if (xchk_need_intent_drain(sc))
   102			xchk_fsgates_enable(sc, XCHK_FSGATES_DRAIN);
   103	
   104		/* We want to scan the opened inode, so lock it and exit. */
   105		if (sc->sm->sm_ino == 0 || sc->sm->sm_ino == I_INO(ip_in)) {
   106			error = xchk_install_live_inode(sc, ip_in);
   107			if (error)
   108				return error;
   109	
   110			return xchk_prepare_iscrub(sc);
   111		}
   112	
   113		/*
   114		 * On pre-metadir filesystems, reject internal metadata files.  For
   115		 * metadir filesystems, limited scrubbing of any file in the metadata
   116		 * directory tree by handle is allowed, because that is the only way to
   117		 * validate the lack of parent pointers in the sb-root metadata inodes.
   118		 */
   119		if (!xfs_has_metadir(mp) && xfs_is_sb_inum(mp, sc->sm->sm_ino))
   120			return -ENOENT;
   121		/* Reject obviously bad inode numbers. */
   122		if (!xfs_verify_ino(sc->mp, sc->sm->sm_ino))
   123			return -ENOENT;
   124	
   125		/* Try a safe untrusted iget. */
   126		error = xchk_iget_safe(sc, sc->sm->sm_ino, &ip);
   127		if (!error)
   128			return xchk_install_handle_iscrub(sc, ip);
   129		if (error == -ENOENT)
   130			return error;
   131		if (error != -EFSCORRUPTED && error != -EFSBADCRC && error != -EINVAL)
   132			goto out_error;
   133	
   134		/*
   135		 * EINVAL with IGET_UNTRUSTED probably means one of several things:
   136		 * userspace gave us an inode number that doesn't correspond to fs
   137		 * space; the inode btree lacks a record for this inode; or there is
   138		 * a record, and it says this inode is free.
   139		 *
   140		 * EFSCORRUPTED/EFSBADCRC could mean that the inode was mappable, but
   141		 * some other metadata corruption (e.g. inode forks) prevented
   142		 * instantiation of the incore inode.  Or it could mean the inobt is
   143		 * corrupt.
   144		 *
   145		 * We want to look up this inode in the inobt directly to distinguish
   146		 * three different scenarios: (1) the inobt says the inode is free,
   147		 * in which case there's nothing to do; (2) the inobt is corrupt so we
   148		 * should flag the corruption and exit to userspace to let it fix the
   149		 * inobt; and (3) the inobt says the inode is allocated, but loading it
   150		 * failed due to corruption.
   151		 *
   152		 * Allocate a transaction and grab the AGI to prevent inobt activity in
   153		 * this AG.  Retry the iget in case someone allocated a new inode after
   154		 * the first iget failed.
   155		 */
   156		error = xchk_trans_alloc(sc, 0);
   157		if (error)
   158			goto out_error;
   159	
   160		error = xchk_iget_agi(sc, sc->sm->sm_ino, &agi_bp, &ip);
   161		if (error == 0) {
   162			/* Actually got the incore inode, so install it and proceed. */
   163			xchk_trans_cancel(sc);
   164			return xchk_install_handle_iscrub(sc, ip);
   165		}
   166		if (error == -ENOENT)
   167			goto out_gone;
   168		if (error != -EFSCORRUPTED && error != -EFSBADCRC && error != -EINVAL)
   169			goto out_cancel;
   170	
   171		/* Ensure that we have protected against inode allocation/freeing. */
   172		if (agi_bp == NULL) {
   173			ASSERT(agi_bp != NULL);
   174			error = -ECANCELED;
   175			goto out_cancel;
   176		}
   177	
   178		/*
   179		 * Untrusted iget failed a second time.  Let's try an inobt lookup.
   180		 * If the inobt doesn't think this is an allocated inode then we'll
   181		 * return ENOENT to signal that the check can be skipped.
   182		 *
   183		 * If the lookup signals corruption, we'll mark this inode corrupt and
   184		 * exit to userspace.  There's little chance of fixing anything until
   185		 * the inobt is straightened out, but there's nothing we can do here.
   186		 *
   187		 * If the lookup encounters a runtime error, exit to userspace.
   188		 */
   189		pag = xfs_perag_get(mp, XFS_INO_TO_AGNO(mp, sc->sm->sm_ino));
   190		if (!pag) {
   191			error = -EFSCORRUPTED;
   192			goto out_cancel;
   193		}
   194	
   195		error = xfs_imap(pag, sc->tp, sc->sm->sm_ino, &imap,
   196				XFS_IGET_UNTRUSTED);
   197		xfs_perag_put(pag);
   198		if (error == -EINVAL || error == -ENOENT)
   199			goto out_gone;
   200		if (error)
   201			goto out_cancel;
   202	
   203		/*
   204		 * The lookup succeeded.  Chances are the ondisk inode is corrupt and
   205		 * preventing iget from reading it.  Retain the scrub transaction and
   206		 * the AGI buffer to prevent anyone from allocating or freeing inodes.
   207		 * This ensures that we preserve the inconsistency between the inobt
   208		 * saying the inode is allocated and the icache being unable to load
   209		 * the inode until we can flag the corruption in xchk_inode.  The
   210		 * scrub function has to note the corruption, since we're not really
   211		 * supposed to do that from the setup function.  Save the mapping to
   212		 * make repairs to the ondisk inode buffer.
   213		 */
   214		if (xchk_could_repair(sc))
 > 215			return xrep_setup_inode(sc, &imap);
   216		return 0;
   217	
   218	out_cancel:
   219		xchk_trans_cancel(sc);
   220	out_error:
   221		trace_xchk_op_error(sc, agno, XFS_INO_TO_AGBNO(mp, sc->sm->sm_ino),
   222				error, __return_address);
   223		return error;
   224	out_gone:
   225		/* The file is gone, so there's nothing to check. */
   226		xchk_trans_cancel(sc);
   227		return -ENOENT;
   228	}
   229	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
