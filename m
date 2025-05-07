Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D8529A0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598139; cv=fail; b=dF+OyRrXO4GIviz48bGj1xyjgdMsD0AQXihAq1KZzDVjtfhMGbWzUKylYdU4PcLrqs7PUn6ThqugWUOYKPdmij6G33ygFwl1sNMe0EzTRAgVWhbtIpYZsaN8uI4UzYmkQ4uKM92bdTYXX+raLaoZJq228O29u/qpy8OxIATqwtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598139; c=relaxed/simple;
	bh=Pa0j9YZNNQr85FATz81dSN5QzOVIfkjA1DpH91IoZFA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=otodpmjGZnanStKjjurcBA/++Wc/pl2aiZYAB7/6kebmwRS0bLXzVbrrSWSMXZ0kc+2iJ2VU1BDfgDpfjhPo07wQL7sw4mLWHYF8y+Tkts90zFxYOTd4DZL6qSVYzS88xrDXXGRgrf8zKLobh8uyf0z5FS3G8cKZ2vRu3NKAbew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWFentEv; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWFentEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746598138; x=1778134138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pa0j9YZNNQr85FATz81dSN5QzOVIfkjA1DpH91IoZFA=;
  b=OWFentEvj1fQN0+qcNKmRAJ+0ExpgAK53A0k4A7SRBt/Hogks0KdAsR0
   ucs/3Amz/BH3jYRwo91xuXIxWJBmXdQtmsRzfwt3LJMEeXVMRf7pXECuF
   aWFye+GzX4zBHH4DVOJihPMd5Uy5CTvF6tzGJfKedo33D4iJXbOkxOIJm
   IShJnGOoiIBJ1EF4JoXtXYN3nbiMCVwHB/9ICkW5cQyVTa2F2ev96u+oA
   L/uttFF7lxZ7j4HZ9t+kJgqRm8VSX8iWmBjg+iY+mMAsHGYWZdHK2Dn4p
   OmwCEi9DQRPIASv7GWuNA00qRLzUwO+AEXw4bX7MqnolJwabOIo1seYiV
   Q==;
X-CSE-ConnectionGUID: frRRpYZ/T86hsdGpAcJ89A==
X-CSE-MsgGUID: PTTtpPOuRumdkO3i79ZZLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48205289"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48205289"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:08:57 -0700
X-CSE-ConnectionGUID: N2MJhtEuSDW3F0+MIMfQGA==
X-CSE-MsgGUID: uBojLYsKT9+pdtA5mWKSsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="166896781"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:08:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 23:08:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 23:08:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 23:08:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlDpX+d9rFY6QozOGOtXDdKxQnPWEnfoeSF9LDMSzYOP2XpmskXE5vveaf0Mdk08J+p5DOy84edHxmmXgpfRzbQJIxarQpfjwVdqyF2bRsQNLcp23jMgmBU8HaIF5wpsWj9N5Zid7/v+lTrJm+rgOyoc4XKNQiyKZM/WG1u9RQxQ5vUSCsYaUq7II2e8UFQfmTNEtvlugm26vrGcUzCjortrI4TvIe9bkbegZFkfLf9zwzgthu8rpWv5sqW7IhBT8csyk+Wl2DwFHBs5I8J1AaPm15s+oupBlf7PzLvxf03zJJ2F2ek0C6DXqhNZr3/S/nfwmVh2oeeDM0oxbBiTpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFnMd7Nt/bFoFsB8OA5lUQRo8Bi0HUvXEUrPjAXR5+A=;
 b=fcdHCKK4MSZZVcd6NCbuG9397sUMuXrK2HK0NoHVX/DyfYkrwZ01CPjYCV+r9ufkdmZPVTMU2MiCtthcoXZkAj1xcdHgquwp/dguA9qIvDIvsXNSJcpzxCpfTiA2Sz7QkICkacHj5XemAIe1Xi/OVjl/pr6Pc4RAQ7JkGG7qRr0TN2ZYG9mLkiyS7rDlL3KWjgOwLRM42f0JBhAX/y9SdChlSXLyGM2bCBdV+Nw100s4XPo4QpiMcaT2p0srvDwPV6/N4JVqySGaaIxeuq7Sk9SVEZiHH0SaSdWMaoDJhIHx8ZCVquJ7EJT5BLnzCz6/aKNEN2//U2QcUhIIyO3n9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by PH8PR11MB7023.namprd11.prod.outlook.com (2603:10b6:510:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 06:08:34 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Wed, 7 May 2025
 06:08:33 +0000
Date: Wed, 7 May 2025 14:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [kees:for-next/hardening 6/14] mm/kasan/kasan_test_c.c:1504:7:
 warning: argument to variable-length array may be too large due to
 conversion from 'int' to 'long unsigned int'
Message-ID: <aBr42psLtchaluNU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|PH8PR11MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 63955112-3eb0-4d70-b296-08dd8d2d98da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rs1xHRkNtvFW1JSKhd7jtJATrxMyyNubucmvWNjOkUq+FlpR4nzwjQQYbf+n?=
 =?us-ascii?Q?voVZSePl96dzuwWqX4Aele/ZHSHeMMkAsQBd2M1mGv6eJRQA2daKZbdtehcH?=
 =?us-ascii?Q?vaXsa18kKfs+ZOa6JAKFjMk8Q+6FnCj+H2NKKc0FzffZA8xi7Nu0z9xMz0dL?=
 =?us-ascii?Q?7De0PpkgJJfYS/44CSUAU62vUdLaj3KfufTmIEPDhYoHj7JsEB3UMU5oA6z0?=
 =?us-ascii?Q?ztVpkXxehFU4m+FzhWd+CoccxepaKFo4zFPrJPZyiaKeXCugJjxLtV/vsoMO?=
 =?us-ascii?Q?KIKJIGvS0npFFz3bZ1FkZ2HYOl4scILUi0C9i5Tkk4G7VB931tCoPuvHh/hG?=
 =?us-ascii?Q?zKWDpqkahGAGu8evG4YXbkoxFbZ4OMeztPiBl69S9bSXfFX5fkPuxkBKdOAM?=
 =?us-ascii?Q?7oxd+FBBu0KzOMKCUHJ6UsdmNSe75F8+RiPBdFURAbP1Z1yOWzcescEoh9im?=
 =?us-ascii?Q?tmUE3bVTk225Jm3Jg3E59TC9k7uZJVX9n8plZPiMAqppqshqf1u9hwtWLsbw?=
 =?us-ascii?Q?vljRkVSKsKrDJ2XHVRh6QJ4j4BQTXOimSWijqY79mdm9Pl/BIy2m3/VoB4+M?=
 =?us-ascii?Q?SxtVV50EzYGJoIep0oEw7Iu0DBqijlLxk792S8DWoQBwxCbENJ6is6q/f79Z?=
 =?us-ascii?Q?JDbdDtZ7tQmRZ7Fdci5mgjEEvBOyf4wlGMNuMv1fQQjXpPm4SgYyXmyfoDIG?=
 =?us-ascii?Q?eC6gri79kVMLMK9botgAhbZtWTDzn5CKzJ9Y8M9hvRSi9ym8grb4yd+W5KFI?=
 =?us-ascii?Q?PD1x2JkVcW338DhLRerWevn/vN2eUE0yVN0aUy7dpENbxuBbV3bPltHAe5JQ?=
 =?us-ascii?Q?FIjDJFCMhkMoMHC6Evg2/jkI0uO+TDk4b4sRV5YJcvzM0L6QR/U/PmTKNlHU?=
 =?us-ascii?Q?gNAZgOvNITauZTV8527CzF+d5EtaYwZqz4aBo1HSKbsgD8ir0p4DephLveyc?=
 =?us-ascii?Q?BFABVtCxSHpxXfo6Wc3hyf25ycSnzVHf6kscSPPcQI+D1d5Gl+N6OQF55YK2?=
 =?us-ascii?Q?ZSERkmU4ntmCyuBOe1FqqU21fYYXLILLhEe7Pkb547j/PSoJGZ+g9RXrRXRG?=
 =?us-ascii?Q?4ggTDHvly9KvZU7YvXtkcg6wYBYx/ucZV0rd3P7PoMfS35XZCo9U4wpfUDhz?=
 =?us-ascii?Q?F+S5XHRQ0lnokWtUov+9QM1POEcnMLKQRXovbf+TsA4SAbK8sxxuUNjkKOVo?=
 =?us-ascii?Q?kfX7EZNGdDp1HGpRd27dD7o3sOP6m1HUVFGgl3FHTtZ/bRUuUr0y434sLrId?=
 =?us-ascii?Q?1sSOuyY0mZjsbsadPMC1Regu9B9Cl/hq2fxWJAOldUlkDBImbU2AiyPNse2c?=
 =?us-ascii?Q?f5Tirs9YDXPO4ljwiXNd5D80F+EbIOFPE1fYnFfXisQAQnD+9hsoI+trWh5H?=
 =?us-ascii?Q?H+1mdQtHnUOo5MLL8iLWCuc8Z22O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bIKYciM3xpMrDqgY4cqwANKpBxAdP8FokzhQLGWQuUKKBr5rrjn95w6Fcu9H?=
 =?us-ascii?Q?TTWfMt+PgehOrIA5qUVUObssFwMMfZSbb7s9tXZz0xeCJF9C+flwT8ySNzQ4?=
 =?us-ascii?Q?EjsW0O4wZGORsQ/7sifAselL1rHl61nW6Xj5GE8pYtS73odvVOxSzQQPWNCG?=
 =?us-ascii?Q?cS5itO3GnJsXzOxC+U2EOSkdYbPrcFdiIj5EctWrerdTqtKyJ/sPrh5CF50I?=
 =?us-ascii?Q?SfEZMnH4m7/mxXyQtz+kcMMliQ3DmYtj4bDmqEHW1823bqtApokuaEJzwyCC?=
 =?us-ascii?Q?N4lp4EoIXfSnZh0rT/LBi4mbPR8WxWgXFKD2wy6yp9MnbTzbj71JjYaSKkXO?=
 =?us-ascii?Q?P8urXrapq7g8OkP0QybcfVQV4Pe+TqpcwUHkFBPKq/WsQE+vIC3kIM15stvO?=
 =?us-ascii?Q?epyPL0AYI5D6AiC4Kt4zvcI4MJG8QBhQrR8LM2z2LAjWGEEPIfHu4ScMxQF+?=
 =?us-ascii?Q?LDZQ2bVtvKrjRxvZBaF3FiQ3wRNdsf32fOh/3ehXI7T5Igr/vvemV3EcxmIM?=
 =?us-ascii?Q?8GX+/nfB1POhYrEXvKq8wVmpYNbvPwVCdz/BVo/HjyXWnmTOSalcc3p/3wXN?=
 =?us-ascii?Q?mTEzcmy0x3DmsEloTvIF/KdZ/9Tc4pm2f1wBzADfB8wj60xUk7ofZ5bxO2yo?=
 =?us-ascii?Q?DpsGqLM9K0AmQqUvUQO5DTrikA2kbgHdWRKa535Y3G5rP5mOjnEJKXa9PFpI?=
 =?us-ascii?Q?XSNAhacFBJ55UHGow7izfxUp6bylY6KtgMJ4/XoEz/GmnB03naNniemj7Pji?=
 =?us-ascii?Q?NGn0uj1vMJJ6LBzwzQnYGlrr25tqjMc/0eAyOO/UqYvv2Qm3a5U+qtGcIn8F?=
 =?us-ascii?Q?TfOg2DdOgkQnlsvK3L0nQQWWclmFrDRAJHi4ACYMrYOQBlsg09tpEolZQlFM?=
 =?us-ascii?Q?XvNCxxoAH/5iLHuxwCLpuu9b+0qYfQA6SBx+vzHqrnNr8TOFHNVua8oYm4VE?=
 =?us-ascii?Q?BEHV7u4JqLe9oOTZntGQ8GbicJDc3x4A55sVTkZ/jWumPmeqES60xrynwmdW?=
 =?us-ascii?Q?wPNv+X8Q2RhfX4KdajKYHfT/+Q4j094TLuut9dJcImMK8Wa5TS2wQSf6hiar?=
 =?us-ascii?Q?NSmiI3f5uKUZRxWdFvuGvJ26pspK5uV+IBBi84PQnC8m/1won+EmUW7fMUIY?=
 =?us-ascii?Q?SJ3A7LVhgN/VTMD56wKTlhz/UlXuM2N81TlipfSdOnqArUkeOfmxF2IJGSf4?=
 =?us-ascii?Q?LHBtay+wlObt96Q5W5BftpEHU4RhOMDsTJanpnC5NPCmJTTI3oMe6Y+cE02z?=
 =?us-ascii?Q?Kl8wDqwMdMN9FnqVy3TBk3s2cDIrEQJ+Na8t/diti2Cw+kYneUC79MiZUFE3?=
 =?us-ascii?Q?c8AYVG/MP205PltEYuI5fqlA/7dvzL3VgmD8nbWpOwIT42TVc/K/LrAzebPu?=
 =?us-ascii?Q?GQxNKNFfUmbFd1EcSC90OGAmPJGRiUayCEv0ILw/Sf/MT9PoJNOJ3xuYNCUS?=
 =?us-ascii?Q?XrdkyHq07iYpGY9U300RrliQ6tRpM2EuPghyv+5CbjH9sZo0q6L4GIKBcqy7?=
 =?us-ascii?Q?VGpXGw8WkMiYr0zpZaQQp1hNp3uAHKfKBcnPbqY8QUxAIAugpS9pd/ZI2AAb?=
 =?us-ascii?Q?yKoEuMgnK5gdci4lljmNzriGbkLiZjjimgfMYhDDhMgrcS5DsBRBzmnt088V?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63955112-3eb0-4d70-b296-08dd8d2d98da
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 06:08:33.9060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2oFaM4uMK/y+Ro/gBHkC9Q97t73Asi3RK6PFJ4Po/NMi4o7KwOx0Cg177+ueozjSI0auUrQaJYOojWdBW7tqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7023
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
head:   48b79238694db6e7eb3dd6153cf71107db624a11
commit: 1ca6c23046d30abfe57d8706248ad5888aafa3bf [6/14] kbuild: Switch from -Wvla to -Wvla-larger-than=1
:::::: branch date: 33 hours ago
:::::: commit date: 9 days ago
config: arm64-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250507/202505071331.4iOzqmuE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071331.4iOzqmuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071331.4iOzqmuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kasan/kasan_test_c.c: In function 'kasan_alloca_oob_right':
>> mm/kasan/kasan_test_c.c:1504:7: warning: argument to variable-length array may be too large due to conversion from 'int' to 'long unsigned int' [-Wvla-larger-than=]
     char alloca_array[i];
          ^~~~~~~~~~~~
   mm/kasan/kasan_test_c.c: In function 'kasan_alloca_oob_left':
   mm/kasan/kasan_test_c.c:1489:7: warning: argument to variable-length array may be too large due to conversion from 'int' to 'long unsigned int' [-Wvla-larger-than=]
     char alloca_array[i];
          ^~~~~~~~~~~~
   mm/kasan/kasan_test_c.c: At top level:
   cc1: warning: unrecognized command line option '-Wno-vla-larger-than'


vim +1504 mm/kasan/kasan_test_c.c

00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1500  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1501  static void kasan_alloca_oob_right(struct kunit *test)
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1502  {
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1503  	volatile int i = 10;
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06 @1504  	char alloca_array[i];
2dfd1bd992322f lib/test_kasan.c Peter Collingbourne 2022-03-24  1505  	/* See comment in kasan_global_oob_right. */
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1506  	char *volatile array = alloca_array;
f649dc0e0d7b50 lib/test_kasan.c Peter Collingbourne 2021-05-14  1507  	char *p = array + i;
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1508  
58b999d7a22c59 lib/test_kasan.c Andrey Konovalov    2020-11-01  1509  	/* Only generic mode instruments dynamic allocas. */
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1510  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
da17e377723f50 lib/test_kasan.c Andrey Konovalov    2021-02-24  1511  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_STACK);
00a14294bb33af lib/test_kasan.c Paul Lawrence       2018-02-06  1512  
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1513  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1514  }
73228c7ecc5e40 lib/test_kasan.c Patricia Alfonso    2020-10-13  1515  

:::::: The code at line 1504 was first introduced by commit
:::::: 00a14294bb33af533f7ac002fb20623fdd8ea0d7 kasan: add tests for alloca poisoning

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

