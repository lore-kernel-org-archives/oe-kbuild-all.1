Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE0E14F9D6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 01:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752023713; cv=fail; b=vFvb0Hed6+eMwQgXhkZ9X6FKvnTwcj1Qo8gb9PN/5c2CPF9Ww9uxAqRYQ6H8GPSsvGSbLrP/3AnhGm6lO2+v8TlXARvHLqQyH91Ejab1NiTqzZunYqUsu9W/I7VLHfkxcKc+3CjxOXQvqtGj3qA+0rfed8Yxde4bJeSIrbungcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752023713; c=relaxed/simple;
	bh=nI8yE2mDSJ06vV3Q6DGM1+iZRWHNUAyQQQPAL2CTKpc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rd0LbNabYyRYbS35K2z36TbSvPoz+fGbV40ZZL5QRAsAmD+2HunClw0tE/QZYBl9FI97aITGSs16WxEyXJVPbClWtil3MJ7HwFYITSSyySikTaHbajpWDa1+n66QiqYWoF28UrVryAC3HuAvxhcujkFuvd9aljO9/8RpQRcZEas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2GKv7A/; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2GKv7A/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752023712; x=1783559712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nI8yE2mDSJ06vV3Q6DGM1+iZRWHNUAyQQQPAL2CTKpc=;
  b=Q2GKv7A/vHcl16PDo9FlsvFqxpzVSPjNBsxwHt/XvmrkpHyhrVJAFKem
   QqSf+aClsbn1E9enpp4RpL+UF7X+Btc48kGdTu6GUra8gf8Khk+8rFo2C
   g2wYFk7ZPee1e3AxtlqdI4c3ei84PEeh5BsV7Cooyj1o10y6cHQsgVW+2
   1amKXJo+pfKvaaGd8riFxNHIM80eb1UOJEyf1IKPTju5Fy/XUMLN5jqwi
   5RTURekC/ey2cbYF1dgzAwr4zCELBk0iRlpUp8kZhSWpS/e2+UsUoDhBZ
   Amgryx9CYcezYiAchVOVu2wEpjM+PwGooB3c8ar52+CWwKXNfb9rrbt3I
   Q==;
X-CSE-ConnectionGUID: ssq6xf8hTUyi48u5TB3sZA==
X-CSE-MsgGUID: 1H9stEBxQFSD3uldPp3WTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57943576"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="57943576"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:15:10 -0700
X-CSE-ConnectionGUID: hwAvconrS/CXiABxMXazSg==
X-CSE-MsgGUID: 7nUNJx7NSPWj+YAsj2svDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="156217361"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:15:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:15:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 18:15:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MX2CsRQ3hkpqPR1yBXNS1MoLnxuXyUc6p9e56nxFa76aE+K27SRoh91TV4YMi2EaEfZu0Zk1lltaa/JeNJMZNHuYFxDpaKu9ujG7+64se4tjAlKuxMCEBxX7FMpyorioR1HHYrnW8GKwgfAV0kSH1ql9w1deCpRjNBIfgL1UdLe6QajYaUo8z1WM+CGpMxUI1dukbvzF3UccT0yt9dDdTPOlXwBUmzA8Lrl+hm0BopoclG5opaFn6H2itOqpCaHSD7Nfv0MU/fFE0TemsnWZ/ulJjRvsWyS1+EyLlrS36tz5W4/oscS2GMbBVqYmsJg1pbvZTmUa5Xw2K8Vg5Gbaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7IkqkuueGFstL8CZ4pQshJQt2+q59PPHZLkNzso2sI=;
 b=hSZvBfLLLLUZYSDLS3bG7H9ZaC4GKXFUS7hBCZ4OJNoKwvYSuqHSSt3H/TUXvF2Mo4Gi0xaWGs8xli4G4/XTIVcxzDZHo1Q3+kGo73/aQuBFpvumLWyBHLjVXQ1hEfziu04gAydtwIPBYnvDacCsQyLMnAe8fK4w8zgXwDKHvARfBGHArpjONYFpZl0IFqHPhtT/AKqyZMCvqQmK48kE+6m1XMoXNWJc4+0HfB2zmAFDR5NGZiugUOoxd68MTZRrV36/b0ZwNzzWpuG5rfVUsb7Gimv54GOa1VdWMGdFnj4k6NYvLfdmT2Lfyd76C8qEFWESopZGZeANe7XMfJXAyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Wed, 9 Jul
 2025 01:15:03 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 01:15:03 +0000
Date: Wed, 9 Jul 2025 09:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, Jeff Kirsher <jeff.kirsher@gmail.com>,
	Roger Quadros <rogerq@kernel.org>, MD Danish Anwar <danishanwar@ti.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [jkirsher-net-queue:master 2/4]
 drivers/net/ethernet/ti/icssg/icssg_prueth.c:55:13: error: static
 declaration of 'prueth_cleanup_rx_chns' follows non-static declaration
Message-ID: <aG3CjgAtHUcs9WDG@rli9-mobl>
Content-Type: multipart/mixed; boundary="0GE2af7+/gwI6Ibf"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e67e92-109d-44fb-1047-08ddbe8607ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rnxg5fgo6vfCk11Zd/LdgnvRMWVMzwLVI27eNyG0Fe6MvKBiH/cjAMpp8zng?=
 =?us-ascii?Q?cQuNfnTPn77U6Uv03jd/xz12kXlCpWy5l5tLpIRes7Q6lAxW8AMEgCNqwSJ/?=
 =?us-ascii?Q?OJ5XslkBIIqO9DBrN0BLTAAcQTRhPGG2sbrpZ5dxiBZPP+0T7jkMclefuEHU?=
 =?us-ascii?Q?ToUYplhdKZpAkJofR4ClAZH1ywEFo09jFICkdgHdhYyXrSie0TGu5wTYYnpl?=
 =?us-ascii?Q?RlMXGZZanh7WhtkcXWuy+t/vRzhewZwtg+qYJD72mPO8/hyl5GIDdrQPThIG?=
 =?us-ascii?Q?jNlfx5DmbsIsGfzWjQqn21rN+u3GcHESaqMx/6dwaFPGrcFpeZcBvHdy+Efh?=
 =?us-ascii?Q?oAQbA6HIVeXEFTq2Bg0M/10hcmjFtOYwU8CmszjDp/UeeNXhKCV8d7PzOe98?=
 =?us-ascii?Q?bOxnq6hv48GUcYRjZFBlquHmgHqgbM1UljmQDwoNT1Y6CgfIAxMd2lSKsP5a?=
 =?us-ascii?Q?nSjkw7VBbAS75rL5XCwDj73Tu0Cm7fJU9XcuUl9irQZKbU8mvZvLi9h2PX2O?=
 =?us-ascii?Q?nd1GjL4Ukv74m7iTJrS1eImAENeHyiv+kCcqaIGxFZ/yxs5XbuI2lyL33mVD?=
 =?us-ascii?Q?9KBNiCn7FYuOhVUTuJ+65BI9d3wsNePEEzgePaqFqe/buaywohFDakJrdWbo?=
 =?us-ascii?Q?CpTGymR4Q5mMjyxhCiZUVqJiokGqNMpifV8ayRUsYDJJ3MsKjlVpP3s5C/Pn?=
 =?us-ascii?Q?G+hM11A0clB3CNPyhzdZ5+IS4oQ2vGN5h8bBWYEif/f4DSEdniAmw4SMYG0h?=
 =?us-ascii?Q?7edc3XsgSp6RGgWOs31ZCaeiLeDJyBn3a58oVP8XNfIIJTqoaF4sNEpx5Nq5?=
 =?us-ascii?Q?SJNbjKGMRG34If4Z2w61McvkgtVg/uhxYfKuLmZfrsvInpV6aofqTM3PP3i+?=
 =?us-ascii?Q?Gg4mV6N+/+oHxe1af4E+Te9lD5OjrUB2MqF/ycFog6JqYv9HhAj8vDmL6dOP?=
 =?us-ascii?Q?Eq1dAv6Wz4ez/EbqlDdepeAH6kqfEPBDkADcljhnrDM7q4hxnNkFhWL2zaMC?=
 =?us-ascii?Q?/28YrwKv7ZHIjf5RE7Ptmo/rO2hz84TSRJIR3G94XSxrlgJF1ITM7bxn04//?=
 =?us-ascii?Q?FwKrbyYpCw53Rrj/6FKowgtyt+3aXIokgPghXH49lnek9AlKRtBD79XgOtO0?=
 =?us-ascii?Q?bnNTANTMHCeVomGvqZmfNXv4cB32Ke66q0W7mujZFT2uIuYXlSxC1qLahlcn?=
 =?us-ascii?Q?h6K+S5XKIz4H/MGdn+FuPn6Z2anmvVj+joiGdC6itjzBX8aIxlJyqFrhARYB?=
 =?us-ascii?Q?R7VqjsLQazh3B6L1TcJU/BunOKc7msFr7fq5gODCQChoNHbLick0V6JoS7ew?=
 =?us-ascii?Q?9lVimB0eQU15Eybu7FKIbNrhr7ULDdQjGGxeFoeuHj8S6HbeS8bKz3ZJgd0I?=
 =?us-ascii?Q?3w39EqtNOtllDOW/On9Jx+Y40yfX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4pKoAWK/DcqndHiYkfuJxL7VvclqoHRJTr73El/EF7enuIJAB87RcwXRk+Nk?=
 =?us-ascii?Q?69iP6NSXKQlUJj43WFFArtY2o0iYO4cDQMWC4enbdroh44iTZnVieP7Xncnu?=
 =?us-ascii?Q?zI8MPCTJDfeznk2PAFkavhSMrKzBBWWx94yiB7W2sxUiRec5EcBi6zYKU3qM?=
 =?us-ascii?Q?7C/q9IQgbfLVfoiZm2ifAMPfpEVHUOe9kyq469OpV6qj6H6oNHiDvL+YE4Rj?=
 =?us-ascii?Q?/mOSBXw66+4kPhU0nOwhnhZXfYjJ523EvqsdyzSoUyGVctktjYvmzui3Mvne?=
 =?us-ascii?Q?QyrBCA31oyKHL37fXsGGaXcqHqUlnR/XeZL+P1yAEI1xTy4Edc5H8i8aebdH?=
 =?us-ascii?Q?4ALR0nWJ4Q2IclbpWx8Eg06YUDbNh13I2XRFlhAj+lLZt4nRAYA+a+b3Qu6L?=
 =?us-ascii?Q?9J85oxiI/LowyonN7enawQgdTW6KWbbTjBhgVXG2PJrqeNYpOpwXxlIfcxKM?=
 =?us-ascii?Q?/uBZHJI7OrihKZqZLjr6GCQ9HOyBDnItgwKKztHZHOR1yHBUg+o4ri3tDiOX?=
 =?us-ascii?Q?eQsc7/3gx0gi5rxOAnTw3rywzywm41dzs4La67hy3xKIhMLrEWNfMPFSYz9f?=
 =?us-ascii?Q?xJIZNoht3TIZo7uR7vEK0q6bsXTDBYhJWwqAl1zV3sWh7IK0uyfWz1s6/scY?=
 =?us-ascii?Q?hubLjkAysVaaEfAiF6Ef4ekqZPlmZ9C+qdMFTxGqcSk7/UNf1vUtzgCPB/rL?=
 =?us-ascii?Q?zKLzloBWV8OcLZaPNMDLy13UUF8EIXIA0l5lfk0CyS9QsRrX7PuXH7QcgrvF?=
 =?us-ascii?Q?Gy+uzQXbt/+ULc+B7SaDEfYtG9adNldXDG3SpUVi64pO2HZgyis9WF6O3eKJ?=
 =?us-ascii?Q?rvo6aJpMjNt1FllVEgNAcPMXjpWip0ciZ+MU1mgoXYuiV6QozlXTeXZPDNin?=
 =?us-ascii?Q?YRKnJPN1vilWdTvpv1TfK1SaY//GCiLEtjbtbuuDqGqqXLJHjR1HXrGuip8C?=
 =?us-ascii?Q?1X7kr390Wwt8qGPDW5u1YZgHK7tQhv/06cFn82WQfSb21ZgXlFKaxhrGFDin?=
 =?us-ascii?Q?WYCMhPxr9PtTMfcTl/r+qpnsEsatlqwEe4FcjSYsz3+Sq+YL75V/amgsjg/i?=
 =?us-ascii?Q?yDANHVA/8YrKeSd1pJMJJJgEtHyZgSBViPwu1tfwHKKQO2qK4Hxr9Uyyuk5X?=
 =?us-ascii?Q?cXdvxqmwvAUqkfuDtMFPSCuROOigPWhmXTeOBmH7TSeAS5RMgoiQaURM/KoK?=
 =?us-ascii?Q?kioyyDt3bXMnxq6YP8pPQ5uOnZ39iEHqgBAasqatmdwLgue9+o/SrqPPb29m?=
 =?us-ascii?Q?drt1h07MDcSACbbSmCmreXzkjflhvmU1dwXnR3Yj7bddDaLDJNdVEVCR9gJJ?=
 =?us-ascii?Q?CWZ1wxj9gp794Kj3AWLUA7jIcBJhJCgixrX/NW9lhggbEwU0DIgJzk7HgKAT?=
 =?us-ascii?Q?O9gD8yb9SfIBJerCnS9LD4eNId0fhnWbJOq4fgKPHY1gq/+8XOa4vgmEZcIe?=
 =?us-ascii?Q?mJg3GUifb+whHOR0rLG4xEQmAjebCTqftlnq7WYJVmtI7vN2K1w6wu6uPzZl?=
 =?us-ascii?Q?Ap9jyH9BDxNU1r5vHojCn5Eh+SL3Fd7eYZB75xoWH/c7YNFTwgZX36YixIQn?=
 =?us-ascii?Q?5ztSDN/OLtTSPBh1+FBXdryVJwYjrdPkiT6swk55?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e67e92-109d-44fb-1047-08ddbe8607ea
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 01:15:02.9493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUfROEQXtvd1rtrnGagVu6Q+x1PIziGvvKrAtj7p7G+z2iuzZxN5FYs9yM8lDZqugsOi5kv4+MhwV7KAlbTPSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-OriginatorOrg: intel.com

--0GE2af7+/gwI6Ibf
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git master
head:   db494b13c593e578fed58a6e41f4c9df619180d8
commit: f758f47f8a1fbf1908c6dcbd6ec1fe8dfd8f5261 [2/4] net: ti: icssg-prueth: Fix signedness bug in prueth_init_rx_chns()
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-defconfig (attached as .config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507090230.YPj6gQq3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:55:13: error: static declaration of 'prueth_cleanup_rx_chns' follows non-static declaration
      55 | static void prueth_cleanup_rx_chns(struct prueth_emac *emac,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/ti/icssg/icssg_prueth.c:34:
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:447:6: note: previous declaration of 'prueth_cleanup_rx_chns' with type 'void(struct prueth_emac *, struct prueth_rx_chn *, int)'
     447 | void prueth_cleanup_rx_chns(struct prueth_emac *emac,
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:66:13: error: static declaration of 'prueth_cleanup_tx_chns' follows non-static declaration
      66 | static void prueth_cleanup_tx_chns(struct prueth_emac *emac)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:450:6: note: previous declaration of 'prueth_cleanup_tx_chns' with type 'void(struct prueth_emac *)'
     450 | void prueth_cleanup_tx_chns(struct prueth_emac *emac);
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:86:13: error: static declaration of 'prueth_ndev_del_tx_napi' follows non-static declaration
      86 | static void prueth_ndev_del_tx_napi(struct prueth_emac *emac, int num)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:451:6: note: previous declaration of 'prueth_ndev_del_tx_napi' with type 'void(struct prueth_emac *, int)'
     451 | void prueth_ndev_del_tx_napi(struct prueth_emac *emac, int num);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:99:13: error: static declaration of 'prueth_xmit_free' follows non-static declaration
      99 | static void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:452:6: note: previous declaration of 'prueth_xmit_free' with type 'void(struct prueth_tx_chn *, struct cppi5_host_desc_t *)'
     452 | void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
         |      ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:135:12: error: conflicting types for 'emac_tx_complete_packets'; have 'int(struct prueth_emac *, int,  int)'
     135 | static int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:454:5: note: previous declaration of 'emac_tx_complete_packets' with type 'int(struct prueth_emac *, int,  int,  bool *)' {aka 'int(struct prueth_emac *, int,  int,  _Bool *)'}
     454 | int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:225:12: error: static declaration of 'prueth_ndev_add_tx_napi' follows non-static declaration
     225 | static int prueth_ndev_add_tx_napi(struct prueth_emac *emac)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:456:5: note: previous declaration of 'prueth_ndev_add_tx_napi' with type 'int(struct prueth_emac *)'
     456 | int prueth_ndev_add_tx_napi(struct prueth_emac *emac);
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:251:12: error: static declaration of 'prueth_init_tx_chns' follows non-static declaration
     251 | static int prueth_init_tx_chns(struct prueth_emac *emac)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:457:5: note: previous declaration of 'prueth_init_tx_chns' with type 'int(struct prueth_emac *)'
     457 | int prueth_init_tx_chns(struct prueth_emac *emac);
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:331:12: error: static declaration of 'prueth_init_rx_chns' follows non-static declaration
     331 | static int prueth_init_rx_chns(struct prueth_emac *emac,
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:458:5: note: previous declaration of 'prueth_init_rx_chns' with type 'int(struct prueth_emac *, struct prueth_rx_chn *, char *, u32,  u32)' {aka 'int(struct prueth_emac *, struct prueth_rx_chn *, char *, unsigned int,  unsigned int)'}
     458 | int prueth_init_rx_chns(struct prueth_emac *emac,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:472:12: error: static declaration of 'icssg_ts_to_ns' follows non-static declaration
     472 | static u64 icssg_ts_to_ns(u32 hi_sw, u32 hi, u32 lo, u32 cycle_time_ns)
         |            ^~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:493:5: note: previous declaration of 'icssg_ts_to_ns' with type 'u64(u32,  u32,  u32,  u32)' {aka 'long long unsigned int(unsigned int,  unsigned int,  unsigned int,  unsigned int)'}
     493 | u64 icssg_ts_to_ns(u32 hi_sw, u32 hi, u32 lo, u32 cycle_time_ns);
         |     ^~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:487:13: error: static declaration of 'emac_rx_timestamp' follows non-static declaration
     487 | static void emac_rx_timestamp(struct prueth_emac *emac,
         |             ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/ti/icssg/icssg_prueth.h:466:6: note: previous declaration of 'emac_rx_timestamp' with type 'void(struct prueth_emac *, struct sk_buff *, u32 *)' {aka 'void(struct prueth_emac *, struct sk_buff *, unsigned int *)'}
     466 | void emac_rx_timestamp(struct prueth_emac *emac,
         |      ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:573:13: warning: 'prueth_rx_cleanup' defined but not used [-Wunused-function]
     573 | static void prueth_rx_cleanup(void *data, dma_addr_t desc_dma)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/ti/icssg/icssg_prueth.c:503:12: warning: 'emac_rx_packet' defined but not used [-Wunused-function]
     503 | static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id)
         |            ^~~~~~~~~~~~~~


vim +/prueth_cleanup_rx_chns +55 drivers/net/ethernet/ti/icssg/icssg_prueth.c

f758f47f8a1fbf Dan Carpenter 2024-04-23   54  
f758f47f8a1fbf Dan Carpenter 2024-04-23  @55  static void prueth_cleanup_rx_chns(struct prueth_emac *emac,
f758f47f8a1fbf Dan Carpenter 2024-04-23   56  				   struct prueth_rx_chn *rx_chn,
f758f47f8a1fbf Dan Carpenter 2024-04-23   57  				   int max_rflows)
f758f47f8a1fbf Dan Carpenter 2024-04-23   58  {
f758f47f8a1fbf Dan Carpenter 2024-04-23   59  	if (rx_chn->desc_pool)
f758f47f8a1fbf Dan Carpenter 2024-04-23   60  		k3_cppi_desc_pool_destroy(rx_chn->desc_pool);
f758f47f8a1fbf Dan Carpenter 2024-04-23   61  
f758f47f8a1fbf Dan Carpenter 2024-04-23   62  	if (rx_chn->rx_chn)
f758f47f8a1fbf Dan Carpenter 2024-04-23   63  		k3_udma_glue_release_rx_chn(rx_chn->rx_chn);
f758f47f8a1fbf Dan Carpenter 2024-04-23   64  }
f758f47f8a1fbf Dan Carpenter 2024-04-23   65  
f758f47f8a1fbf Dan Carpenter 2024-04-23  @66  static void prueth_cleanup_tx_chns(struct prueth_emac *emac)
f758f47f8a1fbf Dan Carpenter 2024-04-23   67  {
f758f47f8a1fbf Dan Carpenter 2024-04-23   68  	int i;
f758f47f8a1fbf Dan Carpenter 2024-04-23   69  
f758f47f8a1fbf Dan Carpenter 2024-04-23   70  	for (i = 0; i < emac->tx_ch_num; i++) {
f758f47f8a1fbf Dan Carpenter 2024-04-23   71  		struct prueth_tx_chn *tx_chn = &emac->tx_chns[i];
f758f47f8a1fbf Dan Carpenter 2024-04-23   72  
f758f47f8a1fbf Dan Carpenter 2024-04-23   73  		if (tx_chn->desc_pool)
f758f47f8a1fbf Dan Carpenter 2024-04-23   74  			k3_cppi_desc_pool_destroy(tx_chn->desc_pool);
f758f47f8a1fbf Dan Carpenter 2024-04-23   75  
f758f47f8a1fbf Dan Carpenter 2024-04-23   76  		if (tx_chn->tx_chn)
f758f47f8a1fbf Dan Carpenter 2024-04-23   77  			k3_udma_glue_release_tx_chn(tx_chn->tx_chn);
f758f47f8a1fbf Dan Carpenter 2024-04-23   78  
f758f47f8a1fbf Dan Carpenter 2024-04-23   79  		/* Assume prueth_cleanup_tx_chns() is called at the
f758f47f8a1fbf Dan Carpenter 2024-04-23   80  		 * end after all channel resources are freed
f758f47f8a1fbf Dan Carpenter 2024-04-23   81  		 */
f758f47f8a1fbf Dan Carpenter 2024-04-23   82  		memset(tx_chn, 0, sizeof(*tx_chn));
f758f47f8a1fbf Dan Carpenter 2024-04-23   83  	}
f758f47f8a1fbf Dan Carpenter 2024-04-23   84  }
f758f47f8a1fbf Dan Carpenter 2024-04-23   85  
f758f47f8a1fbf Dan Carpenter 2024-04-23  @86  static void prueth_ndev_del_tx_napi(struct prueth_emac *emac, int num)
f758f47f8a1fbf Dan Carpenter 2024-04-23   87  {
f758f47f8a1fbf Dan Carpenter 2024-04-23   88  	int i;
f758f47f8a1fbf Dan Carpenter 2024-04-23   89  
f758f47f8a1fbf Dan Carpenter 2024-04-23   90  	for (i = 0; i < num; i++) {
f758f47f8a1fbf Dan Carpenter 2024-04-23   91  		struct prueth_tx_chn *tx_chn = &emac->tx_chns[i];
f758f47f8a1fbf Dan Carpenter 2024-04-23   92  
f758f47f8a1fbf Dan Carpenter 2024-04-23   93  		if (tx_chn->irq)
f758f47f8a1fbf Dan Carpenter 2024-04-23   94  			free_irq(tx_chn->irq, tx_chn);
f758f47f8a1fbf Dan Carpenter 2024-04-23   95  		netif_napi_del(&tx_chn->napi_tx);
f758f47f8a1fbf Dan Carpenter 2024-04-23   96  	}
f758f47f8a1fbf Dan Carpenter 2024-04-23   97  }
f758f47f8a1fbf Dan Carpenter 2024-04-23   98  
f758f47f8a1fbf Dan Carpenter 2024-04-23  @99  static void prueth_xmit_free(struct prueth_tx_chn *tx_chn,
f758f47f8a1fbf Dan Carpenter 2024-04-23  100  			     struct cppi5_host_desc_t *desc)
f758f47f8a1fbf Dan Carpenter 2024-04-23  101  {
f758f47f8a1fbf Dan Carpenter 2024-04-23  102  	struct cppi5_host_desc_t *first_desc, *next_desc;
f758f47f8a1fbf Dan Carpenter 2024-04-23  103  	dma_addr_t buf_dma, next_desc_dma;
f758f47f8a1fbf Dan Carpenter 2024-04-23  104  	u32 buf_dma_len;
f758f47f8a1fbf Dan Carpenter 2024-04-23  105  
f758f47f8a1fbf Dan Carpenter 2024-04-23  106  	first_desc = desc;
f758f47f8a1fbf Dan Carpenter 2024-04-23  107  	next_desc = first_desc;
f758f47f8a1fbf Dan Carpenter 2024-04-23  108  
f758f47f8a1fbf Dan Carpenter 2024-04-23  109  	cppi5_hdesc_get_obuf(first_desc, &buf_dma, &buf_dma_len);
f758f47f8a1fbf Dan Carpenter 2024-04-23  110  	k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &buf_dma);
f758f47f8a1fbf Dan Carpenter 2024-04-23  111  
f758f47f8a1fbf Dan Carpenter 2024-04-23  112  	dma_unmap_single(tx_chn->dma_dev, buf_dma, buf_dma_len,
f758f47f8a1fbf Dan Carpenter 2024-04-23  113  			 DMA_TO_DEVICE);
f758f47f8a1fbf Dan Carpenter 2024-04-23  114  
f758f47f8a1fbf Dan Carpenter 2024-04-23  115  	next_desc_dma = cppi5_hdesc_get_next_hbdesc(first_desc);
f758f47f8a1fbf Dan Carpenter 2024-04-23  116  	k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &next_desc_dma);
f758f47f8a1fbf Dan Carpenter 2024-04-23  117  	while (next_desc_dma) {
f758f47f8a1fbf Dan Carpenter 2024-04-23  118  		next_desc = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool,
f758f47f8a1fbf Dan Carpenter 2024-04-23  119  						       next_desc_dma);
f758f47f8a1fbf Dan Carpenter 2024-04-23  120  		cppi5_hdesc_get_obuf(next_desc, &buf_dma, &buf_dma_len);
f758f47f8a1fbf Dan Carpenter 2024-04-23  121  		k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &buf_dma);
f758f47f8a1fbf Dan Carpenter 2024-04-23  122  
f758f47f8a1fbf Dan Carpenter 2024-04-23  123  		dma_unmap_page(tx_chn->dma_dev, buf_dma, buf_dma_len,
f758f47f8a1fbf Dan Carpenter 2024-04-23  124  			       DMA_TO_DEVICE);
f758f47f8a1fbf Dan Carpenter 2024-04-23  125  
f758f47f8a1fbf Dan Carpenter 2024-04-23  126  		next_desc_dma = cppi5_hdesc_get_next_hbdesc(next_desc);
f758f47f8a1fbf Dan Carpenter 2024-04-23  127  		k3_udma_glue_tx_cppi5_to_dma_addr(tx_chn->tx_chn, &next_desc_dma);
f758f47f8a1fbf Dan Carpenter 2024-04-23  128  
f758f47f8a1fbf Dan Carpenter 2024-04-23  129  		k3_cppi_desc_pool_free(tx_chn->desc_pool, next_desc);
f758f47f8a1fbf Dan Carpenter 2024-04-23  130  	}
f758f47f8a1fbf Dan Carpenter 2024-04-23  131  
f758f47f8a1fbf Dan Carpenter 2024-04-23  132  	k3_cppi_desc_pool_free(tx_chn->desc_pool, first_desc);
f758f47f8a1fbf Dan Carpenter 2024-04-23  133  }
f758f47f8a1fbf Dan Carpenter 2024-04-23  134  
f758f47f8a1fbf Dan Carpenter 2024-04-23 @135  static int emac_tx_complete_packets(struct prueth_emac *emac, int chn,
f758f47f8a1fbf Dan Carpenter 2024-04-23  136  				    int budget)
f758f47f8a1fbf Dan Carpenter 2024-04-23  137  {
f758f47f8a1fbf Dan Carpenter 2024-04-23  138  	struct net_device *ndev = emac->ndev;
f758f47f8a1fbf Dan Carpenter 2024-04-23  139  	struct cppi5_host_desc_t *desc_tx;
f758f47f8a1fbf Dan Carpenter 2024-04-23  140  	struct netdev_queue *netif_txq;
f758f47f8a1fbf Dan Carpenter 2024-04-23  141  	struct prueth_tx_chn *tx_chn;
f758f47f8a1fbf Dan Carpenter 2024-04-23  142  	unsigned int total_bytes = 0;
f758f47f8a1fbf Dan Carpenter 2024-04-23  143  	struct sk_buff *skb;
f758f47f8a1fbf Dan Carpenter 2024-04-23  144  	dma_addr_t desc_dma;
f758f47f8a1fbf Dan Carpenter 2024-04-23  145  	int res, num_tx = 0;
f758f47f8a1fbf Dan Carpenter 2024-04-23  146  	void **swdata;
f758f47f8a1fbf Dan Carpenter 2024-04-23  147  
f758f47f8a1fbf Dan Carpenter 2024-04-23  148  	tx_chn = &emac->tx_chns[chn];
f758f47f8a1fbf Dan Carpenter 2024-04-23  149  
f758f47f8a1fbf Dan Carpenter 2024-04-23  150  	while (true) {
f758f47f8a1fbf Dan Carpenter 2024-04-23  151  		res = k3_udma_glue_pop_tx_chn(tx_chn->tx_chn, &desc_dma);
f758f47f8a1fbf Dan Carpenter 2024-04-23  152  		if (res == -ENODATA)
f758f47f8a1fbf Dan Carpenter 2024-04-23  153  			break;
f758f47f8a1fbf Dan Carpenter 2024-04-23  154  
f758f47f8a1fbf Dan Carpenter 2024-04-23  155  		/* teardown completion */
f758f47f8a1fbf Dan Carpenter 2024-04-23  156  		if (cppi5_desc_is_tdcm(desc_dma)) {
f758f47f8a1fbf Dan Carpenter 2024-04-23  157  			if (atomic_dec_and_test(&emac->tdown_cnt))
f758f47f8a1fbf Dan Carpenter 2024-04-23  158  				complete(&emac->tdown_complete);
f758f47f8a1fbf Dan Carpenter 2024-04-23  159  			break;
f758f47f8a1fbf Dan Carpenter 2024-04-23  160  		}
f758f47f8a1fbf Dan Carpenter 2024-04-23  161  
f758f47f8a1fbf Dan Carpenter 2024-04-23  162  		desc_tx = k3_cppi_desc_pool_dma2virt(tx_chn->desc_pool,
f758f47f8a1fbf Dan Carpenter 2024-04-23  163  						     desc_dma);
f758f47f8a1fbf Dan Carpenter 2024-04-23  164  		swdata = cppi5_hdesc_get_swdata(desc_tx);
f758f47f8a1fbf Dan Carpenter 2024-04-23  165  
f758f47f8a1fbf Dan Carpenter 2024-04-23  166  		skb = *(swdata);
f758f47f8a1fbf Dan Carpenter 2024-04-23  167  		prueth_xmit_free(tx_chn, desc_tx);
f758f47f8a1fbf Dan Carpenter 2024-04-23  168  
f758f47f8a1fbf Dan Carpenter 2024-04-23  169  		ndev = skb->dev;
f758f47f8a1fbf Dan Carpenter 2024-04-23  170  		ndev->stats.tx_packets++;
f758f47f8a1fbf Dan Carpenter 2024-04-23  171  		ndev->stats.tx_bytes += skb->len;
f758f47f8a1fbf Dan Carpenter 2024-04-23  172  		total_bytes += skb->len;
f758f47f8a1fbf Dan Carpenter 2024-04-23  173  		napi_consume_skb(skb, budget);
f758f47f8a1fbf Dan Carpenter 2024-04-23  174  		num_tx++;
f758f47f8a1fbf Dan Carpenter 2024-04-23  175  	}
f758f47f8a1fbf Dan Carpenter 2024-04-23  176  
f758f47f8a1fbf Dan Carpenter 2024-04-23  177  	if (!num_tx)
f758f47f8a1fbf Dan Carpenter 2024-04-23  178  		return 0;
f758f47f8a1fbf Dan Carpenter 2024-04-23  179  
f758f47f8a1fbf Dan Carpenter 2024-04-23  180  	netif_txq = netdev_get_tx_queue(ndev, chn);
f758f47f8a1fbf Dan Carpenter 2024-04-23  181  	netdev_tx_completed_queue(netif_txq, num_tx, total_bytes);
f758f47f8a1fbf Dan Carpenter 2024-04-23  182  
f758f47f8a1fbf Dan Carpenter 2024-04-23  183  	if (netif_tx_queue_stopped(netif_txq)) {
f758f47f8a1fbf Dan Carpenter 2024-04-23  184  		/* If the TX queue was stopped, wake it now
f758f47f8a1fbf Dan Carpenter 2024-04-23  185  		 * if we have enough room.
f758f47f8a1fbf Dan Carpenter 2024-04-23  186  		 */
f758f47f8a1fbf Dan Carpenter 2024-04-23  187  		__netif_tx_lock(netif_txq, smp_processor_id());
f758f47f8a1fbf Dan Carpenter 2024-04-23  188  		if (netif_running(ndev) &&
f758f47f8a1fbf Dan Carpenter 2024-04-23  189  		    (k3_cppi_desc_pool_avail(tx_chn->desc_pool) >=
f758f47f8a1fbf Dan Carpenter 2024-04-23  190  		     MAX_SKB_FRAGS))
f758f47f8a1fbf Dan Carpenter 2024-04-23  191  			netif_tx_wake_queue(netif_txq);
f758f47f8a1fbf Dan Carpenter 2024-04-23  192  		__netif_tx_unlock(netif_txq);
f758f47f8a1fbf Dan Carpenter 2024-04-23  193  	}
f758f47f8a1fbf Dan Carpenter 2024-04-23  194  
f758f47f8a1fbf Dan Carpenter 2024-04-23  195  	return num_tx;
f758f47f8a1fbf Dan Carpenter 2024-04-23  196  }
f758f47f8a1fbf Dan Carpenter 2024-04-23  197  
f758f47f8a1fbf Dan Carpenter 2024-04-23  198  static int emac_napi_tx_poll(struct napi_struct *napi_tx, int budget)
f758f47f8a1fbf Dan Carpenter 2024-04-23  199  {
f758f47f8a1fbf Dan Carpenter 2024-04-23  200  	struct prueth_tx_chn *tx_chn = prueth_napi_to_tx_chn(napi_tx);
f758f47f8a1fbf Dan Carpenter 2024-04-23  201  	struct prueth_emac *emac = tx_chn->emac;
f758f47f8a1fbf Dan Carpenter 2024-04-23  202  	int num_tx_packets;
f758f47f8a1fbf Dan Carpenter 2024-04-23  203  
f758f47f8a1fbf Dan Carpenter 2024-04-23  204  	num_tx_packets = emac_tx_complete_packets(emac, tx_chn->id, budget);
f758f47f8a1fbf Dan Carpenter 2024-04-23  205  
f758f47f8a1fbf Dan Carpenter 2024-04-23  206  	if (num_tx_packets >= budget)
f758f47f8a1fbf Dan Carpenter 2024-04-23  207  		return budget;
f758f47f8a1fbf Dan Carpenter 2024-04-23  208  
f758f47f8a1fbf Dan Carpenter 2024-04-23  209  	if (napi_complete_done(napi_tx, num_tx_packets))
f758f47f8a1fbf Dan Carpenter 2024-04-23  210  		enable_irq(tx_chn->irq);
f758f47f8a1fbf Dan Carpenter 2024-04-23  211  
f758f47f8a1fbf Dan Carpenter 2024-04-23  212  	return num_tx_packets;
f758f47f8a1fbf Dan Carpenter 2024-04-23  213  }
f758f47f8a1fbf Dan Carpenter 2024-04-23  214  
f758f47f8a1fbf Dan Carpenter 2024-04-23  215  static irqreturn_t prueth_tx_irq(int irq, void *dev_id)
f758f47f8a1fbf Dan Carpenter 2024-04-23  216  {
f758f47f8a1fbf Dan Carpenter 2024-04-23  217  	struct prueth_tx_chn *tx_chn = dev_id;
f758f47f8a1fbf Dan Carpenter 2024-04-23  218  
f758f47f8a1fbf Dan Carpenter 2024-04-23  219  	disable_irq_nosync(irq);
f758f47f8a1fbf Dan Carpenter 2024-04-23  220  	napi_schedule(&tx_chn->napi_tx);
f758f47f8a1fbf Dan Carpenter 2024-04-23  221  
f758f47f8a1fbf Dan Carpenter 2024-04-23  222  	return IRQ_HANDLED;
f758f47f8a1fbf Dan Carpenter 2024-04-23  223  }
f758f47f8a1fbf Dan Carpenter 2024-04-23  224  
f758f47f8a1fbf Dan Carpenter 2024-04-23 @225  static int prueth_ndev_add_tx_napi(struct prueth_emac *emac)
f758f47f8a1fbf Dan Carpenter 2024-04-23  226  {
f758f47f8a1fbf Dan Carpenter 2024-04-23  227  	struct prueth *prueth = emac->prueth;
f758f47f8a1fbf Dan Carpenter 2024-04-23  228  	int i, ret;
f758f47f8a1fbf Dan Carpenter 2024-04-23  229  
f758f47f8a1fbf Dan Carpenter 2024-04-23  230  	for (i = 0; i < emac->tx_ch_num; i++) {
f758f47f8a1fbf Dan Carpenter 2024-04-23  231  		struct prueth_tx_chn *tx_chn = &emac->tx_chns[i];
f758f47f8a1fbf Dan Carpenter 2024-04-23  232  
f758f47f8a1fbf Dan Carpenter 2024-04-23  233  		netif_napi_add_tx(emac->ndev, &tx_chn->napi_tx, emac_napi_tx_poll);
f758f47f8a1fbf Dan Carpenter 2024-04-23  234  		ret = request_irq(tx_chn->irq, prueth_tx_irq,
f758f47f8a1fbf Dan Carpenter 2024-04-23  235  				  IRQF_TRIGGER_HIGH, tx_chn->name,
f758f47f8a1fbf Dan Carpenter 2024-04-23  236  				  tx_chn);
f758f47f8a1fbf Dan Carpenter 2024-04-23  237  		if (ret) {
f758f47f8a1fbf Dan Carpenter 2024-04-23  238  			netif_napi_del(&tx_chn->napi_tx);
f758f47f8a1fbf Dan Carpenter 2024-04-23  239  			dev_err(prueth->dev, "unable to request TX IRQ %d\n",
f758f47f8a1fbf Dan Carpenter 2024-04-23  240  				tx_chn->irq);
f758f47f8a1fbf Dan Carpenter 2024-04-23  241  			goto fail;
f758f47f8a1fbf Dan Carpenter 2024-04-23  242  		}
f758f47f8a1fbf Dan Carpenter 2024-04-23  243  	}
f758f47f8a1fbf Dan Carpenter 2024-04-23  244  
f758f47f8a1fbf Dan Carpenter 2024-04-23  245  	return 0;
f758f47f8a1fbf Dan Carpenter 2024-04-23  246  fail:
f758f47f8a1fbf Dan Carpenter 2024-04-23  247  	prueth_ndev_del_tx_napi(emac, i);
f758f47f8a1fbf Dan Carpenter 2024-04-23  248  	return ret;
f758f47f8a1fbf Dan Carpenter 2024-04-23  249  }
f758f47f8a1fbf Dan Carpenter 2024-04-23  250  
f758f47f8a1fbf Dan Carpenter 2024-04-23 @251  static int prueth_init_tx_chns(struct prueth_emac *emac)
f758f47f8a1fbf Dan Carpenter 2024-04-23  252  {
f758f47f8a1fbf Dan Carpenter 2024-04-23  253  	static const struct k3_ring_cfg ring_cfg = {
f758f47f8a1fbf Dan Carpenter 2024-04-23  254  		.elm_size = K3_RINGACC_RING_ELSIZE_8,
f758f47f8a1fbf Dan Carpenter 2024-04-23  255  		.mode = K3_RINGACC_RING_MODE_RING,
f758f47f8a1fbf Dan Carpenter 2024-04-23  256  		.flags = 0,
f758f47f8a1fbf Dan Carpenter 2024-04-23  257  		.size = PRUETH_MAX_TX_DESC,
f758f47f8a1fbf Dan Carpenter 2024-04-23  258  	};
f758f47f8a1fbf Dan Carpenter 2024-04-23  259  	struct k3_udma_glue_tx_channel_cfg tx_cfg;
f758f47f8a1fbf Dan Carpenter 2024-04-23  260  	struct device *dev = emac->prueth->dev;
f758f47f8a1fbf Dan Carpenter 2024-04-23  261  	struct net_device *ndev = emac->ndev;
f758f47f8a1fbf Dan Carpenter 2024-04-23  262  	int ret, slice, i;
f758f47f8a1fbf Dan Carpenter 2024-04-23  263  	u32 hdesc_size;
f758f47f8a1fbf Dan Carpenter 2024-04-23  264  
f758f47f8a1fbf Dan Carpenter 2024-04-23  265  	slice = prueth_emac_slice(emac);
f758f47f8a1fbf Dan Carpenter 2024-04-23  266  	if (slice < 0)
f758f47f8a1fbf Dan Carpenter 2024-04-23  267  		return slice;
f758f47f8a1fbf Dan Carpenter 2024-04-23  268  
f758f47f8a1fbf Dan Carpenter 2024-04-23  269  	init_completion(&emac->tdown_complete);
f758f47f8a1fbf Dan Carpenter 2024-04-23  270  
f758f47f8a1fbf Dan Carpenter 2024-04-23  271  	hdesc_size = cppi5_hdesc_calc_size(true, PRUETH_NAV_PS_DATA_SIZE,
f758f47f8a1fbf Dan Carpenter 2024-04-23  272  					   PRUETH_NAV_SW_DATA_SIZE);
f758f47f8a1fbf Dan Carpenter 2024-04-23  273  	memset(&tx_cfg, 0, sizeof(tx_cfg));
f758f47f8a1fbf Dan Carpenter 2024-04-23  274  	tx_cfg.swdata_size = PRUETH_NAV_SW_DATA_SIZE;
f758f47f8a1fbf Dan Carpenter 2024-04-23  275  	tx_cfg.tx_cfg = ring_cfg;
f758f47f8a1fbf Dan Carpenter 2024-04-23  276  	tx_cfg.txcq_cfg = ring_cfg;
f758f47f8a1fbf Dan Carpenter 2024-04-23  277  
f758f47f8a1fbf Dan Carpenter 2024-04-23  278  	for (i = 0; i < emac->tx_ch_num; i++) {
f758f47f8a1fbf Dan Carpenter 2024-04-23  279  		struct prueth_tx_chn *tx_chn = &emac->tx_chns[i];
f758f47f8a1fbf Dan Carpenter 2024-04-23  280  
f758f47f8a1fbf Dan Carpenter 2024-04-23  281  		/* To differentiate channels for SLICE0 vs SLICE1 */
f758f47f8a1fbf Dan Carpenter 2024-04-23  282  		snprintf(tx_chn->name, sizeof(tx_chn->name),
f758f47f8a1fbf Dan Carpenter 2024-04-23  283  			 "tx%d-%d", slice, i);
f758f47f8a1fbf Dan Carpenter 2024-04-23  284  
f758f47f8a1fbf Dan Carpenter 2024-04-23  285  		tx_chn->emac = emac;
f758f47f8a1fbf Dan Carpenter 2024-04-23  286  		tx_chn->id = i;
f758f47f8a1fbf Dan Carpenter 2024-04-23  287  		tx_chn->descs_num = PRUETH_MAX_TX_DESC;
f758f47f8a1fbf Dan Carpenter 2024-04-23  288  
f758f47f8a1fbf Dan Carpenter 2024-04-23  289  		tx_chn->tx_chn =
f758f47f8a1fbf Dan Carpenter 2024-04-23  290  			k3_udma_glue_request_tx_chn(dev, tx_chn->name,
f758f47f8a1fbf Dan Carpenter 2024-04-23  291  						    &tx_cfg);
f758f47f8a1fbf Dan Carpenter 2024-04-23  292  		if (IS_ERR(tx_chn->tx_chn)) {
f758f47f8a1fbf Dan Carpenter 2024-04-23  293  			ret = PTR_ERR(tx_chn->tx_chn);
f758f47f8a1fbf Dan Carpenter 2024-04-23  294  			tx_chn->tx_chn = NULL;
f758f47f8a1fbf Dan Carpenter 2024-04-23  295  			netdev_err(ndev,
f758f47f8a1fbf Dan Carpenter 2024-04-23  296  				   "Failed to request tx dma ch: %d\n", ret);
f758f47f8a1fbf Dan Carpenter 2024-04-23  297  			goto fail;
f758f47f8a1fbf Dan Carpenter 2024-04-23  298  		}
f758f47f8a1fbf Dan Carpenter 2024-04-23  299  
f758f47f8a1fbf Dan Carpenter 2024-04-23  300  		tx_chn->dma_dev = k3_udma_glue_tx_get_dma_device(tx_chn->tx_chn);
f758f47f8a1fbf Dan Carpenter 2024-04-23  301  		tx_chn->desc_pool =
f758f47f8a1fbf Dan Carpenter 2024-04-23  302  			k3_cppi_desc_pool_create_name(tx_chn->dma_dev,
f758f47f8a1fbf Dan Carpenter 2024-04-23  303  						      tx_chn->descs_num,
f758f47f8a1fbf Dan Carpenter 2024-04-23  304  						      hdesc_size,
f758f47f8a1fbf Dan Carpenter 2024-04-23  305  						      tx_chn->name);
f758f47f8a1fbf Dan Carpenter 2024-04-23  306  		if (IS_ERR(tx_chn->desc_pool)) {
f758f47f8a1fbf Dan Carpenter 2024-04-23  307  			ret = PTR_ERR(tx_chn->desc_pool);
f758f47f8a1fbf Dan Carpenter 2024-04-23  308  			tx_chn->desc_pool = NULL;
f758f47f8a1fbf Dan Carpenter 2024-04-23  309  			netdev_err(ndev, "Failed to create tx pool: %d\n", ret);
f758f47f8a1fbf Dan Carpenter 2024-04-23  310  			goto fail;
f758f47f8a1fbf Dan Carpenter 2024-04-23  311  		}
f758f47f8a1fbf Dan Carpenter 2024-04-23  312  
f758f47f8a1fbf Dan Carpenter 2024-04-23  313  		ret = k3_udma_glue_tx_get_irq(tx_chn->tx_chn);
f758f47f8a1fbf Dan Carpenter 2024-04-23  314  		if (ret < 0) {
f758f47f8a1fbf Dan Carpenter 2024-04-23  315  			netdev_err(ndev, "failed to get tx irq\n");
f758f47f8a1fbf Dan Carpenter 2024-04-23  316  			goto fail;
f758f47f8a1fbf Dan Carpenter 2024-04-23  317  		}
f758f47f8a1fbf Dan Carpenter 2024-04-23  318  		tx_chn->irq = ret;
f758f47f8a1fbf Dan Carpenter 2024-04-23  319  
f758f47f8a1fbf Dan Carpenter 2024-04-23  320  		snprintf(tx_chn->name, sizeof(tx_chn->name), "%s-tx%d",
f758f47f8a1fbf Dan Carpenter 2024-04-23  321  			 dev_name(dev), tx_chn->id);
f758f47f8a1fbf Dan Carpenter 2024-04-23  322  	}
f758f47f8a1fbf Dan Carpenter 2024-04-23  323  
f758f47f8a1fbf Dan Carpenter 2024-04-23  324  	return 0;
f758f47f8a1fbf Dan Carpenter 2024-04-23  325  
f758f47f8a1fbf Dan Carpenter 2024-04-23  326  fail:
f758f47f8a1fbf Dan Carpenter 2024-04-23  327  	prueth_cleanup_tx_chns(emac);
f758f47f8a1fbf Dan Carpenter 2024-04-23  328  	return ret;
f758f47f8a1fbf Dan Carpenter 2024-04-23  329  }
f758f47f8a1fbf Dan Carpenter 2024-04-23  330  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--0GE2af7+/gwI6Ibf
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--0GE2af7+/gwI6Ibf
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce (this is a W=1 build):
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        # https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git/commit/?id=f758f47f8a1fbf1908c6dcbd6ec1fe8dfd8f5261
        git remote add jkirsher-net-queue https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-queue.git
        git fetch --no-tags jkirsher-net-queue master
        git checkout f758f47f8a1fbf1908c6dcbd6ec1fe8dfd8f5261
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-15.1.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-15.1.0 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/ethernet/ti/

--0GE2af7+/gwI6Ibf--
