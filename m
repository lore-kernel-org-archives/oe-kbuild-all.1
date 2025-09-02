Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6201419A9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817344; cv=fail; b=QT5ZIzWO6NxVedp0+djQLTQ3cyEEXjqSpsM8Z+0noLpS1sXyhksATGICxzVTsuH+uoEkNZa5oP5Lrr6+osh9A4h2oeNrOIWdfdGP1NWPf+VQ5hxNJLoXHUZByJYLZJL3uLU7CsjHhRVFKVC69Dks9YPsR7W5F0veK32Loix3uoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817344; c=relaxed/simple;
	bh=eDct+fmV67tM7kO9ElJW/gXgxF/a1kRpa6hcalbRvQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a/BGKWa7WODW4QRKwstwtya2LHAMzGJae2GfQHjaDuKTvh0OChXRgKLmF4FT7C8GYrrkQijJFZC95csP6wvLKaL369HAwAAiEuKypP+DUhoojLxL/NNtlwKj08v1GYXhxR67+yrUN4o3N/FNAFWbXvSnc4ayAO8Uyq/wlYz6V1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kMVIWs3H; arc=fail smtp.client-ip=40.107.220.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kMVIWs3H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqPfR47anwLVAfr6D4dm01rwfy6llLJCFCT4OCmbAzWTcZ17PMTXFBHmeVrHWqa8gMaz7HzVYYCkmL+b2boJ546PNHFkRsK4aaqWIKysy1vg80o8v23KokqhZJ/lsc1NUaO2GeX1wVyOjnknLtBmLBCjsGx8j/dZpUdMD2n2M/a31vWEztOrVCVFalEx5SLpB5BT0NYRcoricLB0u/olXOxATrHUd2lbzQh6eddi/MuTQ4MdQeYnpCBUfqf3exfb3Pg1RJ7zFVUnqUicYtRNM8d4l71yD5mcLKWU8XnfZz6zZx7Y4iPcLwL+vH5O33gDWS5AEUjzbLOJS8zUa6Vc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkCdSaHqM+6gu/bH1GL9EzC2u6c4DcS+Bvtx15B6hs8=;
 b=VXUVPKmGjBx4DSa0C8tPBavPvQ002gEjcBGhHgGU4M/LuCp8bV1Nas8VR95zj0/B3LsD4+TrI8IJpuNqyw0eilVzZW1BtC8zEXoOJEnM78yQPlGXW9qjY+BKvBjJn6U0Fsri2S50XwPzdPTkLLLtE/vLvbp/v4T7lM1ojwmL8GMB4WPnJuyL5Xqgsf6XS+VPD1/W6h9/cMLAboHFC/xFmb5gYTcRkVIMIJwK4vJhQsD/BpDSoXB16Y87LGKgcF4KZxkb9QMpHIRab6nMvq/ApL5Bu/CLjzs67N18QWZJiJJ0+KpdVfdMt/V/aeMvjqOATfw/8ygC0vo0Pob08b2Iew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkCdSaHqM+6gu/bH1GL9EzC2u6c4DcS+Bvtx15B6hs8=;
 b=kMVIWs3HLziZZrzd61XTR6ivpTzCMSnDDmNRm+SK995UwHqLEwu6NuXhcUEimQDKOJNVIFLRLWsxZSInVHg2sdAdRW2Wk2oFEEpNcJfDdZn2rZPSR0XUmruTyc6VJ891aRWmlrvKrK9uauUtekBP7nmkMrahBm1fKOJ6VoQoSJYJx/lGzc0nChMoQlnICw8s0LLgAsbglyvtxn3OpOxOG5psXOrhNUtK7/EnkBtB+nyEfzRCFcpbMulZGc5GohqLkvsLhkGOOgHIimuz/Rsaifo358Ekfo05GmTJ2nDMu15k5sxX5F2QJu1cXeCCgUYDELWZBy8tVv+N1prOJPLoEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB6787.namprd12.prod.outlook.com (2603:10b6:510:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Tue, 2 Sep
 2025 12:48:57 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 12:48:57 +0000
Date: Tue, 2 Sep 2025 09:48:56 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [jgunthorpe:iommu_pt_vtd 8/34] ERROR: modpost: "__udivdi3"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Message-ID: <20250902124856.GE186519@nvidia.com>
References: <202508271856.ixwxgh3g-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508271856.ixwxgh3g-lkp@intel.com>
X-ClientProxiedBy: YT4PR01CA0344.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::29) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1d0a34-0f36-4e22-1653-08ddea1f14f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ono7TQTGA/AuNV2qpKsfbsShTaEYdxUHf+kqbFZNEQi8Hul7oPZ83TttG4tH?=
 =?us-ascii?Q?Oed8gkcIDJUJQuVu8/m9olWcZc2yAdgdG460vlcbsUGknhWpemSRcFsssqCg?=
 =?us-ascii?Q?9WOC9eTQxiMv5r1PeuxSNwsTfmINKk2mQTDozMbUfPLsChwFxLT59GF1e2NP?=
 =?us-ascii?Q?lFkqKCCBPmPjhBzT1oeTW+oJBHJ3iwSarVecOG8Bf7+ezd7x2E3K31V3n+RE?=
 =?us-ascii?Q?OIXngmiqHRlsagF02I9pn3+QzKS4TwUrxEhiQN5XaLXNJnb0+zNh1b36wmon?=
 =?us-ascii?Q?jLsFQXWbFaPCLoJLn3IyV8Wl+WcHRUMgF2HqZUmdfSaYSXLFmnDz+pdZmCzn?=
 =?us-ascii?Q?RYd3sGZnE8rIRFwJKmC0TvWgdMOdH9scu/Rw3eKhTiYyxUE6jV9hLLG98wqj?=
 =?us-ascii?Q?wynQp+XQIBSHH5H7ZHXYGWM+3FBerhuJfTqPPxHPTbM4RssIVoHDupTQ+LTp?=
 =?us-ascii?Q?1YciU26jfef2u120wdi+77XnpRONCI84duEXbyPivDWgbyMK9SDAsicftAZ4?=
 =?us-ascii?Q?ji2e1d8qQZXLw5J6E4zux8/xF7HPJ0PyQFqx3Op7x9OLko59vllhKmE4S9Pg?=
 =?us-ascii?Q?CecQ+mnbkajGMeKU/qYaq5/9JQIKVOE0befXwAzEtnbLke05MPy9eeL/k07B?=
 =?us-ascii?Q?lL+Y6v8M7a8uSFVdbo/aEMzX5XjZ2c2H9rspQtFITSkKNPJZvL9jFaNQHN0A?=
 =?us-ascii?Q?VFTUknB3e1W1P05nke2MZDX+MFXVboURGCidY7Lqw8a4hqw7NJxVPnpmWZTD?=
 =?us-ascii?Q?SBAWsmbrdQ5btYKCL15Ffm7JxLuTtCZMfGbMjZKdNBEhHvEfpxK/3ftrFKDU?=
 =?us-ascii?Q?rF+8sL6OcVSwgYmi85zRVogdCt9qZkgaRB7MlurpF5LgL3BULts8/XdaaLwB?=
 =?us-ascii?Q?EKTOBD7WzB3+ZwijgVpjDR/uUAfiqbC9JIP3yrDvtIi8Jsk3LCDUbOKA+9UM?=
 =?us-ascii?Q?kzZVLhDuoQu1MNGKLV+7ZSDAh2Cv49adUywl00GPet8+dXbGjq8CX0qMbxQE?=
 =?us-ascii?Q?RoC2/YB7mCoQwcwdXdZMlZUAUbC9QGUZt8scHPbu7cUgF5Uzn80xB7YsM+h9?=
 =?us-ascii?Q?/KXjwPK504K0xDXI6mtOj/dFSeZFHAjWkyKfjzks4j2p6CR6A6VCCl3XM1zg?=
 =?us-ascii?Q?y7I67Tgi1D/9lhu7ge4iSXipw3AkMamciDn0WjyozvZm3E4vtm1JxmzK8NGQ?=
 =?us-ascii?Q?ClyQQb0hEXZJQI8skB+NvPplZZny+mCc/7q47xaEY4siz9XTqL6wVrAQYOaJ?=
 =?us-ascii?Q?IiRaYcUSaun8YIjGJqPD80SzhJHzEr+JX12ER3WF2MxznpsAd6weXsox/cks?=
 =?us-ascii?Q?Oxjh4Cz8HUYSPsFpDftTs+lLEyg8z0C/hUVobUMOj/NZVCTCLcvcZAfbuCFz?=
 =?us-ascii?Q?fpufCS6pdRC5mQjBdAtsmG3w950Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T/cKiWYsDSBZGvyqEQ5l3SQGA13OEYNZDw+g0MCB/CcnjsK7gd6ZJ5hl3Ysn?=
 =?us-ascii?Q?iEYF6prDKev/fjpGxzZJg/YicsX5sU2WU8DDxvMWpT4QcTX2kRnk2XJHHeLT?=
 =?us-ascii?Q?gvQrvthXHeUPSbc7u9q+ShDI037Qd9AroIlkejIeyproyWpjV7hNA81DXMma?=
 =?us-ascii?Q?mu5CPOEB43isJvguxWy0RXENizgSLl/j8WZodQPDictJ+/gKMGT1t32CYg3V?=
 =?us-ascii?Q?SdGqLrbO0neN2kcimglqgBAaiXNMIC3DFjLxRn5G68uRMVCDuY3oeDS+xkrS?=
 =?us-ascii?Q?hf3+SP72MZv1xJgOPXiMEz0MJapE/KklaZsXuqnoauGSbMITBuiHz3bpeaao?=
 =?us-ascii?Q?Y9dfbLRqTJBr3EJDkMOd8xgTrbniu2Al2y0ySxOJ+KTgFUQYWUfj0Q2ygvg8?=
 =?us-ascii?Q?lT9Re5/cZZ9c53tqbiIwsk9aeAT5EmlrcsvSVwje0DuN2tQyKIbLlf3vt7ES?=
 =?us-ascii?Q?TKx2H8f2WYuUEnZpFz8M2jYH4IzXHGr8AfvOdpIk9bQ/ZmLj45ffyMjo7IFu?=
 =?us-ascii?Q?lE1oDYMENHzKlkeNEnxA9W8dJi+fgs3+EtVBDl1Y15k4UwQ4nhG1uD8krEBg?=
 =?us-ascii?Q?ZHMCe0lS+qoBlLs3QHh3DYzzUOTslDLpy3pdyIfRxnNSRlCRMJUKhJaIhOj+?=
 =?us-ascii?Q?LCDeQ+/h7e0Mvgy9W1CP4mCFpaOSpXm8Clj00R+q+VoXTghQp2FTZw2Ix7wA?=
 =?us-ascii?Q?tzUfDbp8D+H2Np19kXDT6tiBOpSXuNYO8nsPmcmtm3T8vFMQauVl97deyAD+?=
 =?us-ascii?Q?CVHiSuxZzyCaa1V8ZiVsIdsT/96j730h7e0sgq/7N3/JN2OkoTSldACZlAj7?=
 =?us-ascii?Q?dEkUoY9F97ZA5TG+h8kyysaTD3F0GWCWQQNlu6KScWe7DGWjLAjORYod24u7?=
 =?us-ascii?Q?eMYuT+bpQAbpXVuxKFdmr/3TxLdgb1D7kVttw8kbozD3rNt+35yGrQAtxuNS?=
 =?us-ascii?Q?GOqwkS/tZ5UUqXEuE4QhmenfBUM8HuhK4tKWzi1ZdyRtesK4luqsyOIqpDrh?=
 =?us-ascii?Q?QiRWkwefbjBLZi9uJcm+mdExHjf0T6CT2LYn+ovNNiJGr3DyYleZFuleJGJ2?=
 =?us-ascii?Q?2V5b/GSp49uF5mJ5BuN30qwH+EZYW+r7RUSRsC2No4/1LtoaNJ+GYqN9RoNJ?=
 =?us-ascii?Q?f2ZI/r/fhugKoS1MHytJ2A4YE11qSjSPZ3ojWFDc3I1kDFrdVDnXZZLlEvzC?=
 =?us-ascii?Q?ZSCPSLhlbTUtLYbW3nToR161FkRYtK5iSjkPPVcaoieZgLO13duplxB9eqTp?=
 =?us-ascii?Q?LMHt8QXd3PlP694QsZew70/62fnzi86gl1crlZo0s+QROCv68e7deJBr4I8F?=
 =?us-ascii?Q?QninleGPyWiDdszJesbHjCQf2z0FDFZ9f16Hp7ZNYG1QwZ2N7a7qLsKLA2Aq?=
 =?us-ascii?Q?eeDtmrprjasduYX791qxClNg++tXVIa6rWQHM6IicCax2bQlloVh8J3eH45n?=
 =?us-ascii?Q?3Vezu5vD4E/Ctlbvrf5A0mDBiuTxSnyWeZMkJdN5sRPyXEL6JX6gYKOr+elo?=
 =?us-ascii?Q?X564qkUeXVEQfPdjBYyn5d1RF3EAD0ZXimVj7gWL79Gh/mlpgFlE7h1VMFt1?=
 =?us-ascii?Q?Qgr5qSUoLIBZqcOeWHE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1d0a34-0f36-4e22-1653-08ddea1f14f4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 12:48:57.5515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8h4tpUkT7sCrXrIEAwQz6w99nfYbgqIIyf2jScF7DrjsD1Q++hGCbJ5Uw7lFw33g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6787

On Wed, Aug 27, 2025 at 06:53:24PM +0800, kernel test robot wrote:
> tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
> head:   fbb816ad5a7780a27bde18e3090b30552b6068f9
> commit: 9722034883c205c7cfc7e395cb9a44221f010fc3 [8/34] iommupt: Add map_pages op
> config: i386-randconfig-r111-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271856.ixwxgh3g-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271856.ixwxgh3g-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508271856.ixwxgh3g-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "__udivdi3" [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!

I could not reproduce this..

Ubuntu clang version 20.1.8 (++20250804090239+87f0227cb601-1~exp1~20250804210352.139)

sparse:
v0.6.4-66-g0196afe16a50c7

Jason
