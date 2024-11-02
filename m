Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8341A14AD20
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 21:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730583369; cv=fail; b=THnqTeRG2hfGrCQ8RsL94RvbR2hwHAk3efJSlwxBcKhxfsnOtbQPuk5o4BIF4vcMUFawPaYBwc+TDwx5zKU9X4Wrrv33b9rhigMwdiQiLlmj9V4zGQ3iY3iqOp37r9ggWMbmrLlQVhZDd8CF8gpcSB+IhkqYO1SY66AhgVs3dRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730583369; c=relaxed/simple;
	bh=u2FZUVKghGq8+nUFUDgsHFAGvHpqnYDHFPM7N/tBFDE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFXO+s8yWANq9cD1RICqtf+USd0SKNpFnHQhT/fm55yyZcApeA9iIiHZET2oluJlgYgJmN4k28RdhWMPLNdPE6Y4dhG/9CWmnXWZ5ffOxkK+w1nOBS3VA5nbPlxZ00NTbHsrVjUSPK/Lo7YaGARf6wYABkcpnAhdFfeF5MMZgIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wm6C3RfG; arc=fail smtp.client-ip=40.107.93.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wm6C3RfG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjLAb/v3v278qdcwQYWk6nNTGceCdiyBFDN8DESMxesBuyuvyfbVu4ZYc70/9aUIcbUBx5Gq8FWynElG2ldcB07tCikFacvHEanicWPUnujGcvjCvGTEpYQa7A+3zISFB6/lXCOulv3hP15Ho+Xy6IT8LU5bJaE9RGlRZRo307/zRwM7wWBRXAcwfmXoY0gMpUOOIyoqN25O9agmjLiih7le+X3yuyEpfMwy46HhOzCY6geymfXci99keAVMjpeJIjbY5VdEl6No6mnK6v3dhdDTH/1fXm/YZdZhG3Jl8zLp0v46m/lTGKkzleM+FH9c3W2Ems2sh01OcTMgqlvibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8sm10Vr/iwiphyZVtO+LjNYKsjlT93f65LS3Kf7rmY=;
 b=XKwvNEd5bJEXVKCH5PbVtUn4TJnAtc9SN9N3bCF0/7DHrRhYaciowOKbDQQ+QjDTr2jAhC4xDHp355pzaSUeqBdzXstW7/wA/LRdXd623c2ppoC0GpQ1xFmXkxHmfuOXK/xSR8hppNHbo0cVKCrUXuHG0i0ioTTNQbmK8BOFEWaXAlRisWaZHwJ+ltar3TTH1FAuF2dA9qNvmCHAsubchSxjj8EGLA4MEvm8GZAymU+6jQMCO146sAGggens8hhU2sair1AMmuNyYF9WnHPspa1oIWhsUx7U/SB3g9H8LakvzMboPiPbs9uGXP0sxv9cptk+OQ1FfAOgvpSsbTZUIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8sm10Vr/iwiphyZVtO+LjNYKsjlT93f65LS3Kf7rmY=;
 b=Wm6C3RfGnPpDIWtqsvFDKHGnAwt2IW27CeBhijE9Vw99jaGNbEouS4HkL5jIcvdYHuL9LQ/GS0YQzzijkKdEr1plYFOJrFi9+IKEGd5x0CX/XwgGogRKPTSNmcUklUEvgEc3WVuxpeQnWP/XXPzWevAEPzBGjlC1yoSIdV+0Z9uYgXb3bktmQDAsYExR75Wo7sAQsyzhsbfUHUTyV3HDcganVTEzyAsgDyNVnSNq2spYA7y6xAP3qWUVzfc0WonMBlp3aSIlAqkqHysbr3ys4yXeB6q7wpiVF5QhfF2CHzdBrSGb656TQHmt5494+wTY1J/x8ASVxJzNmjX2nPJ+vQ==
Received: from DS7P220CA0050.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::20) by
 IA0PR12MB7580.namprd12.prod.outlook.com (2603:10b6:208:43b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.18; Sat, 2 Nov 2024 21:36:00 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:8:224:cafe::14) by DS7P220CA0050.outlook.office365.com
 (2603:10b6:8:224::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28 via Frontend
 Transport; Sat, 2 Nov 2024 21:36:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Sat, 2 Nov 2024 21:36:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 2 Nov 2024
 14:35:56 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 2 Nov 2024
 14:35:55 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Sat, 2 Nov 2024 14:35:55 -0700
Date: Sat, 2 Nov 2024 14:35:54 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <oe-kbuild-all@lists.linux.dev>, kernel test robot <lkp@intel.com>
Subject: Re: [jgunthorpe:smmuv3_nesting 3/39]
 drivers/iommu/iommufd/driver.c:6:24: error: redefinition of
 '_iommufd_object_alloc'
Message-ID: <ZyabOlJRZ3J9zgjc@Asurada-Nvidia>
References: <202411021643.mkNwAYyo-lkp@intel.com>
 <ZyZnRSg2eBW+xWNx@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZyZnRSg2eBW+xWNx@Asurada-Nvidia>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|IA0PR12MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: b1fe97b9-fcb4-4e86-948c-08dcfb865814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d41iNWF/mFkSL5RUCDZRLVc3/RK79jmm3YpzveajXqFt2t5gCyhdqYl6LGt+?=
 =?us-ascii?Q?KJjE2fldNTPE7rNww6X1S+sIEwVtrqotuKPR+G1G+bjw9nZHj0olyx7BTGIz?=
 =?us-ascii?Q?sO0+XYlSeG2MWTPPa12ZDTM4R9/gJVjy6e4i0o4JBWYpC0yZNq7wjmz4NSk8?=
 =?us-ascii?Q?B1N4M6YWGdqurnY5OVPixWbCYcfAVRFHTumynVV6z+2/3bgRkOakmZcnovW1?=
 =?us-ascii?Q?dBe0nwbdrAELdmJgAXVrWtq08456CEFcsa2A7soE5FSvtdhFdTmfthVaXFbN?=
 =?us-ascii?Q?7R7noC0KOyfdG5B+Tb5LUJS4uqhg+3FAJcHxIhpJxEn8n1iL5+SOmdAm55iI?=
 =?us-ascii?Q?7ksIyZM4NoPBlFEzr+16N2P4qkLD9hObgzc000eEzgt4yjYk3YgvLc8dPn/p?=
 =?us-ascii?Q?qaQC0M/5OLiphvOfINcLdV7viAtRsPZPdLUskgot5pcY1TkznaykFvEpFLDI?=
 =?us-ascii?Q?yj9ghnKoGbTEjhxtkTWBDcJVema4aOZm1cds4lPDkh4HxxKQc4T4Zl0uPuDf?=
 =?us-ascii?Q?WAxIrLFzWVfuVReFMDoHl17HFOq2UnsNIZm8iDkdVSf8f0vt0z1o/Y9wZzfx?=
 =?us-ascii?Q?Z3FAmgqv7ecZjI8eiHysAd0jPq4mlz8qP/dNq2FWCMRI+MxK2EEDZH184ITF?=
 =?us-ascii?Q?ZNS4LOZwlUhNpMpsn8YG6v+1kXbsrhHtMo0IGYUyQTz+tG7wCD+OQM+GjZB3?=
 =?us-ascii?Q?PiYkyrSoFj7NEatWiRaQPk1Kf0cKcg1gw8li1hyaiSKnGxMoKT0dV6gBRIG7?=
 =?us-ascii?Q?c+/RABHqAlQJ5UYrEab051BYVEmlZPR1/aB+/lDQnV6Pw0MyMalxUpqmArD3?=
 =?us-ascii?Q?PCiT6rhGNSnL1dWGoThIQyQkW9aIZivSxSMo3BTOyKBxxvyZ3fYao1Fn3HZL?=
 =?us-ascii?Q?fDKlA0zgKB2XgUG0Owfa308PL+udsx4rSjyy05Kh+OifRnRAGBGD0LnkWXqK?=
 =?us-ascii?Q?jPy+2sdZgxhGQed7uKVhPLbiiFWD3yrzWvAjmBGQAIJtod/xET9WDBrYNu/X?=
 =?us-ascii?Q?leau4j7TL1KmsZS/yawl5BqPcR4ZJvpqkdaL/1/4vAzKmZfZNAJMa3VvRQLs?=
 =?us-ascii?Q?D5+s7T5SJK1OMQXv5NWjRhAWDGozG0zgvWSHHW3B+TFnHNIMoxmcuzCk+TRA?=
 =?us-ascii?Q?Jk4Pgx04L/Lx57V2eHSJUs4ViW+FJeX6s6vel1eMaqC3S+lxb4pZsM6ShSiq?=
 =?us-ascii?Q?HMZ4aI1RmjR91xwTEbcFpgIqFqnfZ5p4sQaYH2XQhCsVyBB98n1wsg3XpNav?=
 =?us-ascii?Q?A97DRqYj/1Wskkw0fvJj+jE8ThRHfqwlnxNdwBpvmAreqak7cC9aNOkL7HM0?=
 =?us-ascii?Q?4ILc5fEWdBkL3Lgjw4C+IxpZ3BXKRKtfz9iaJm9HOFu4fdd/2XtVTjmqsJo+?=
 =?us-ascii?Q?BlgLwHo+TTYMO/yheqk/uyEtm+bIc5K2BYskvtAiScNR5+76Rw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2024 21:36:00.0607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1fe97b9-fcb4-4e86-948c-08dcfb865814
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7580

On Sat, Nov 02, 2024 at 10:54:15AM -0700, Nicolin Chen wrote:
> On Sat, Nov 02, 2024 at 04:21:08PM +0800, kernel test robot wrote:
> > tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
> > head:   23c28de51f2158aaebfd545a42cc2f015c98b8c4
> > commit: c6a74dd1148335a1f34b7a133bb08c7af3583715 [3/39] iommufd: Move _iommufd_object_alloc helper to a sharable file
> > config: i386-buildonly-randconfig-001-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021643.mkNwAYyo-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021643.mkNwAYyo-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202411021643.mkNwAYyo-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> drivers/iommu/iommufd/driver.c:6:24: error: redefinition of '_iommufd_object_alloc'
> >        6 | struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
> >          |                        ^~~~~~~~~~~~~~~~~~~~~
> >    In file included from drivers/iommu/iommufd/iommufd_private.h:8,
> >                     from drivers/iommu/iommufd/driver.c:4:
> >    include/linux/iommufd.h:142:1: note: previous definition of '_iommufd_object_alloc' with type 'struct iommufd_object *(struct iommufd_ctx *, size_t,  enum iommufd_object_type)' {aka 'struct iommufd_object *(struct iommufd_ctx *, unsigned int,  enum iommufd_object_type)'}
> >      142 | _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
> >          | ^~~~~~~~~~~~~~~~~~~~~
> 
> Happens when CONFIG_IOMMUFD_DRIVER_CORE=y while CONFIG_IOMMUFD=n.
> 
> I think we should move all the driver helpers under _DRIVER_CORE.

Hmm, this could fix the build errors but doesn't seem to make sense
to provide the "supported" _iommufd_object_alloc helper to drivers
when CONFIG_IOMMUFD=n.

I think we might have to do with "bool":
--------------------------------------------------------------------
diff --git a/drivers/iommu/iommufd/Kconfig b/drivers/iommu/iommufd/Kconfig
index 76656fe0470d7..7622652cc7f6f 100644
--- a/drivers/iommu/iommufd/Kconfig
+++ b/drivers/iommu/iommufd/Kconfig
@@ -1,2 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config IOMMUFD_DRIVER_CORE
+       bool
+       default IOMMUFD_DRIVER && IOMMUFD || IOMMUFD
+
 config IOMMUFD
diff --git a/drivers/iommu/iommufd/Makefile b/drivers/iommu/iommufd/Makefile
index cf4605962bea6..de675df529137 100644
--- a/drivers/iommu/iommufd/Makefile
+++ b/drivers/iommu/iommufd/Makefile
@@ -15 +15,2 @@ obj-$(CONFIG_IOMMUFD) += iommufd.o
 obj-$(CONFIG_IOMMUFD_DRIVER) += iova_bitmap.o
+obj-$(CONFIG_IOMMUFD_DRIVER_CORE) += driver.o
--------------------------------------------------------------------

I have tested all these combinations:
CONFIG_IOMMUFD=n, CONFIG_IOMMUFD_DRIVER=n, CONFIG_IOMMUFD_DRIVER_CORE=n
CONFIG_IOMMUFD=y, CONFIG_IOMMUFD_DRIVER=n, CONFIG_IOMMUFD_DRIVER_CORE=y
CONFIG_IOMMUFD=y, CONFIG_IOMMUFD_DRIVER=y, CONFIG_IOMMUFD_DRIVER_CORE=y
CONFIG_IOMMUFD=m, CONFIG_IOMMUFD_DRIVER=n, CONFIG_IOMMUFD_DRIVER_CORE=y
CONFIG_IOMMUFD=m, CONFIG_IOMMUFD_DRIVER=y, CONFIG_IOMMUFD_DRIVER_CORE=y

Thanks
Nicolin
