Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2E6433D8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 21:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729544581; cv=fail; b=hRYypoTcYhmJF/zFs3/Un8lGGh5ZoOWSN1N1APYbVJ16kCIpdWIUttlOpBCvlOPi/Xz2pueo65NVzFgOBV8aWaRG3KJrqAj+RhGq4ZXz3OVpYN46PCNbegJFAuOag7pBTRon0wYF8FuXiILc+o0Bhp6AKNAWt/iC4YBMwmCwOGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729544581; c=relaxed/simple;
	bh=QigsJPq7ntaTgA3WijWiakYgGF6tLxj/eM0viRFRHuU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lidVEcxzrSPz8fBuRbgKUMYYzErc4+ZbbHonNolpg99yLHXLTz/Mm2UPul4URhjAheLwjItk8r+1Rq8u+dxdeOR5mzU215YDIbDscLCAQTh6GVnpm5VMi2J7eJI19M4YhIEjg7czpAOtAPjW3Por+y5x3ohuU6b6ZbrraS/Ousk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MXq32gk+; arc=fail smtp.client-ip=40.107.93.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MXq32gk+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6Z9ydu1NEOlWYJ1o9sR2TuchlMygB+6GJQwb4ltxMri/3FND5KZGgC0T9aQXp2LMIE4yKSoWQjptBt0RJVIzGA9jFUZUVl0Z69ZUoFEosM3w7eYL1dQtay4mPj8eGvvWcaQoxVnwmizYEFbmFDAJOMOz3RCs1tUMQVxDqXvBB9LEXnvRFQepSUU89x7Ih90Jko5eTpzR9bVgPcn2DWix6KaMotsAVa8ZqKfTSlr3vuFAHX9u3bSYU+7lYywZ4PsT6BjVbR5urLETxu8QRtjqtOESteiF+NmpZ1i/cueCky4MA/KidSlddHEu04GfgI/olPIyv5eXuim9IIymUBcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q7sXCLkQmeEgOpq1KNHDjMQP8nZXUxUR2G7M3ISa1c=;
 b=xyjD2PRzt0SvQTc/PM8vM7rYYnEw7GUrevo55XIYlS7eu2sXO2jzCd4Ve5H8yh1KBaipTAzNZyYuELqLEA4HynTt9ZsLFAUgrpYqVSgvfr96tcWRhEVI/IH34keyU+4MII1DjpcBp8JAvq70Kz7HkAiu+RDNAVsj6E4mMGONQYzrUMUf7A+m147uLdY3zvjfJwAnUHcWrPa1b5joVapyoxo7RiRwny7/HlHt5q+3SN8LaCQ5emUq1ApSgOc2ejVxGpL3J+K/gMkzkvfbGrxm4nXF0knKQxr5M5avAv7pxR0CoxFKXtBn0/jbkj92pDplY2mbLtBhdXoC6Ix2HoAe1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q7sXCLkQmeEgOpq1KNHDjMQP8nZXUxUR2G7M3ISa1c=;
 b=MXq32gk+ppmC6Kkg0veMrRiHHYeZt8cH8ZdVM1RcuGthScMpTHlnmYnMLPDUUVT2T0YRnnDgoQ3JJw/cDYvgceAiUEu8rJOQ4cavQaA4ZxrdXHt9t++yabDCUVTxH9tIvvCv5d2H7Hq19cpD/KOOQqEug752BbjDJ2Dxtaw81vyG7dsbTLRaZEwAHm2iftZJBxIBixChsXkuMXtqIRTnYwTUReeEq2lLnfRDFPE8ZZs2BLvXZY270HNKbUpSQvQZJDbZDLoo+HPxALG0VN7qUfPEtgIG7h1xUgEnAbftwGkByeFzJyCtURwRDok2eGE+ZeLbDdTCkwMz/NKujXqT/w==
Received: from CH2PR05CA0067.namprd05.prod.outlook.com (2603:10b6:610:38::44)
 by SA3PR12MB7974.namprd12.prod.outlook.com (2603:10b6:806:307::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 21:02:55 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::e9) by CH2PR05CA0067.outlook.office365.com
 (2603:10b6:610:38::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Mon, 21 Oct 2024 21:02:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 21:02:54 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Oct
 2024 14:02:41 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Oct
 2024 14:02:41 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Mon, 21 Oct 2024 14:02:40 -0700
Date: Mon, 21 Oct 2024 14:02:39 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Eric
 Auger" <eric.auger@redhat.com>
Subject: Re: [jgunthorpe:smmuv3_nesting 11/17]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <ZxbBb6QrSI9ZPpzG@Asurada-Nvidia>
References: <202410200404.OJrmhHAF-lkp@intel.com>
 <ZxQtJz3F9t2N5FoY@Asurada-Nvidia>
 <20241021124125.GA3576661@ziepe.ca>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241021124125.GA3576661@ziepe.ca>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|SA3PR12MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: de99cb7b-51b9-469e-dcdb-08dcf213bbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rZW402lr4iF+5jZ9A3ufFKlqDV/ashGqAq1D/TmVFJh8PJtcNdZaXY24PNC8?=
 =?us-ascii?Q?2MwDResSuQu8JPp/9zxHbUCAtACqRItH9Rw+KnUEpxV/gz6vtLvr0aHU8Xg4?=
 =?us-ascii?Q?g79tfocVyNUAo/lq5CyK4oBxosQo8EHkzHYZO6Q5qh+eiyS+aLBsb2UgegMQ?=
 =?us-ascii?Q?6jcqIhbw3vRY0TYGo0B3sbjdmiLfOKDZTAV7hhJpaUf6y+b8Htrtx+UVceIP?=
 =?us-ascii?Q?aw+b9kuCEUE89/6NPlkvZXilIMqSTPZ01f/k5Ib5Gk0N0FewZ7YYD87DITXA?=
 =?us-ascii?Q?hQf71V9SinqfwEOvd4Zu7Vp44Z2vEl2H2XTlU1vQhEn7a0ZmSYBSfXP/o+Bz?=
 =?us-ascii?Q?YCrEzYBi6ALrvcnxSP5XGyj8kxi4zgPREqHLomdRc2sYvpkhyo36m6VUONcC?=
 =?us-ascii?Q?xfMmJzJ+Y6gh4FwPKyxiQSPcmxFMzFx5n32bJinaJ/w5w0jFfLHit0NKwLCK?=
 =?us-ascii?Q?y6cZmredrDVludSkmY9Nq08ZB5t0z9yk5cp9sD62zpxiWmXo2vddGaWykDQ9?=
 =?us-ascii?Q?gj6BzzS8LNhM2dS6X3elPohF2xEUPCZedntAQ4b6gr+Q6luhcMfJNrTgH7yF?=
 =?us-ascii?Q?My5txiT+Xr2+KwTUZjXhbg73nyGcXvomRC3k6bI2AtTHyd+u0Ky0WHRdsbFD?=
 =?us-ascii?Q?0wSvFQJbAyEz0GXDjAPnNkYixFSvgLOREiFezGddC5pgfXfu89tja1sXK8a7?=
 =?us-ascii?Q?Al+r1RuvpPOMrBAbzxVHwXITV5TzaQ8PLDKtCrZ9uE5jKqZFlGcmG3//Is6A?=
 =?us-ascii?Q?tVIFQ3dAhBnzIO6VYkVNTkq+4VFDeqPWGyb4rdP/fRx2ZqQejDKrX/Ema9ET?=
 =?us-ascii?Q?TuydQlteXuH5shWrxgkuDwTiGlQnysOz/ixCPTA/Z54LW8dCqfuD3rlRfokQ?=
 =?us-ascii?Q?dqaDrXv8aE3LQiNiDuvSD0Ok6/2T7TMc6LpixW2MCU4BhRky29drFe0VEiAS?=
 =?us-ascii?Q?mTVxJx+yrKGDvOhdb4VLaiQelQ2S1wHQjSDZba+ChkiPfMGuvQCUigtmKk/m?=
 =?us-ascii?Q?nP1WNMxbV3xmFSlX2XeBJOXCZr82ZZ3K+9rfnZ0+mgTgmk7cA0NAlnxDNtRc?=
 =?us-ascii?Q?0X4JerpoEqlOfRbwcJtlpwlUw717XKBWAiqwPGrwhL/qSJFv7Zp9l0/gEjDj?=
 =?us-ascii?Q?F6bAJmA32GKQQ8WTLGXaOGnZsUnTSx5wuK1HTDdmK4/ZwjcHhwV/B69hy2tH?=
 =?us-ascii?Q?YSz5t7EIg3/WBS5sMx8BcjtMNPgaroljBX3PEET6uXiUkpsfokRA0AF/1o0k?=
 =?us-ascii?Q?AIFFuUwcN3yR7g/LpWETyx8VNETr22OCoQGtn/PA5Vg9SyAo0WYPxfLpvUCg?=
 =?us-ascii?Q?W7yr0rLX7de3UEkTQublTX2XQxUSmIlUv3huAU6nEupNZXmTA1T3oB57GKhg?=
 =?us-ascii?Q?XiWwl6TloCuCyL9IKa41TlDAsL/u9usaL0RgLNBea8z1cbR0HA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 21:02:54.7467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de99cb7b-51b9-469e-dcdb-08dcf213bbcf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7974

On Mon, Oct 21, 2024 at 09:41:25AM -0300, Jason Gunthorpe wrote:

> >  arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
> > -                          struct iommu_viommu_arm_smmuv3_invalidate *cmd)
> > +                          struct vsmmu_invalidation_cmd *cmd)
> >  {
> >         cmd->cmd[0] = le64_to_cpu(cmd->cmd[0]);
> >         cmd->cmd[1] = le64_to_cpu(cmd->cmd[1]);
> 
> That's going to make spare complain here though :\
> 
> You need a union to quiet it.. Or probably just a __force and a
> comment is fine

Oh, right... I did __force, and confirmed with sparse:
-       cmd->cmd[0] = le64_to_cpu(cmd->cmd[0]);
-       cmd->cmd[1] = le64_to_cpu(cmd->cmd[1]);
+       /* Commands are le64 stored in u64 */
+       cmd->cmd[0] = le64_to_cpu((__force __le64)cmd->cmd[0]);
+       cmd->cmd[1] = le64_to_cpu((__force __le64)cmd->cmd[1]);

Thanks
Nicolin
