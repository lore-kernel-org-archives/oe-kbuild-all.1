Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD9516C451
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730570079; cv=fail; b=p7lvwniqKQhFmJxXbNshaTwAjY9wQVa68tXhv2usdCMhmoeKfI4K3DpPT2dni/S88OqzKk5KwDjQYsL6G2vtt3f8DXwnkY0kRNwy599tD3dlthNmk64kIVv7WcLyX6LvqetMAy+8SBOy8/Ua5tbqYfG2sKUKnxaVeu8Vg3jMwyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730570079; c=relaxed/simple;
	bh=1l6P4PbElE9PCOHxgisuQa9HJFRBpwWD2v+SGY68p8Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZE4tFFl5RXKjEAgB4AAIldYi7UthX6RFYMAdNNVMuH9hZAPJsqrS8cuCZgK06yZw8+a2GQsDOI6nzJcGUIxmlyxrgzwN8LDrMoXEysdW+TYP3d9yG/t4BM5iaetUACNtZW6S37U7b9TAfmudzAYT1huZxkxSnK53T46h8McamM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DMLJAKxF; arc=fail smtp.client-ip=40.107.236.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DMLJAKxF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h98kyWzL/ejDjgZZDClDL/gPTVJ71Gb+t9YbnWkVH0eXDB50MiONFomIGPGO5VA5hQAWt0ZMgtRDrF3dM90cm3w2b+qttWeQabE6RuGjPXGo9HcsPjrCONrxm9yeiMZKwFYz3hDmmuK5//mskq5kgKsti5cxOXjZ/xw51KZ3ynhG852OX6NaKR+UswTvdY+dGeMzbQBr4Ss4vq+Czz38KmntpUOElXHdIzqVUSMmOEezydWBOCM7G5MjKBfhWh3C2sNfDKclbfmrlfh61j7kVt28EghIWPfwkaczzl9rpVwOp9Mg1UxTfymjYb/A66x9UOr3tuWBPtCa15rwe8X/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAQj2bhp91+m1iVq2/PSsCo3VIuh5VGkrpQ0l9rC54Y=;
 b=gAq/O9MzoWt0T6Ru95tjDzVvfCY1xe0HQkh29+CbWNqDclE620NtsaiLvvgkTzxE3r6n2vtR/K8fEcK8+Oy/Q+NRpXwILCmxWXkowa9Mo3SPTCFaTtYny9FJk3vYtebLory5fL+NU0+5osuxv0FAHaIseGzkl1KOoaowEw5xppT+mGhwpCML4aFTsUJApJze7FauOau3nKkCMth1WSN7KQ9XCO8Io5k2Xn1XsPb+st8AXm8zx+2hWWeCZ+6HqyfxU4qiAZNNkPKoD0aMlatspaaAMZtR+kupzLtqU1dgCXHHSTKaLyqXubyzy4N6Q/hXYjONxw24NiEobwnIBsScmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAQj2bhp91+m1iVq2/PSsCo3VIuh5VGkrpQ0l9rC54Y=;
 b=DMLJAKxFzfWNWhSr4zTKVN9FjoCXherB9He08gCfh6mn6TBUOaXuo3j49255Vj+2F4qh04gc3Q2ffyCCsuTXO/QX/OLN5cyqzSn1e1rfLQXlStxJGBhRenw3UvPONgpJB9fYr4en7hp05VwCQ8CvuGXUlQH9+UMYLuYISWBkFixhvTmIcDoUXGPjBfb9VZEcZeoOLkUNNxaKVlv0FW8nyIDbWYvJy5nOBFwD1veVfWyhYbNKfPjPcJmCr8NFSx8brsCvkHljLMe9aB8wZTEJhp5KEHGzRBVTPTWhtWJIcA5s+YA0mjMyBONWogdNlhwD2pcTikNWTtm8N8EbIIoXXw==
Received: from PH8PR07CA0027.namprd07.prod.outlook.com (2603:10b6:510:2cf::25)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Sat, 2 Nov
 2024 17:54:31 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::c6) by PH8PR07CA0027.outlook.office365.com
 (2603:10b6:510:2cf::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.26 via Frontend
 Transport; Sat, 2 Nov 2024 17:54:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Sat, 2 Nov 2024 17:54:30 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 2 Nov 2024
 10:54:15 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 2 Nov 2024
 10:54:14 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Sat, 2 Nov 2024 10:54:14 -0700
Date: Sat, 2 Nov 2024 10:54:13 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <oe-kbuild-all@lists.linux.dev>, kernel test robot <lkp@intel.com>
Subject: Re: [jgunthorpe:smmuv3_nesting 3/39]
 drivers/iommu/iommufd/driver.c:6:24: error: redefinition of
 '_iommufd_object_alloc'
Message-ID: <ZyZnRSg2eBW+xWNx@Asurada-Nvidia>
References: <202411021643.mkNwAYyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202411021643.mkNwAYyo-lkp@intel.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CY8PR12MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a8e81d-0c5e-4483-39ba-08dcfb676718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QT9gbnTGjik5Kqes8cZw/IxuKoEt6IXv0+tR95YzFOwnu5x5cBOS0osf1RMA?=
 =?us-ascii?Q?TeJh+sYvLVDBq+XuFyB/dZFHBZd1tDswnZ/cxm+jJ1QhrpvbUjE5h2bLkAX7?=
 =?us-ascii?Q?HZ2JNOTYEK0y4CHc1GsaZV2Z8Yv+gHXUiixr4/RcfcncBHJE3xB+3yNwwtoT?=
 =?us-ascii?Q?5qqX+farePanD7/ITEFEfSRoMlRZTYBz3tcMlp/mAafP5lrocud6+oxNY3mv?=
 =?us-ascii?Q?vsLlGyFp/xfRCAzWOc/UQehMYQGl2+q29bxwNUHMKCsUIcSOPuspy6mUh6s0?=
 =?us-ascii?Q?PsViTeZYz/gDxP0ttmBAsk8W29QH4oMZSxc7VrMWPFXZOycDjk77x4M3pB6T?=
 =?us-ascii?Q?xueWGsVm7XOiyLTuu3BWmqLP9YqRBDGEiswU041WySxkpWowtuI1EgXsS7gk?=
 =?us-ascii?Q?DqrVs5TMq9HLN09zDFzP4jwwsX0HdvJDOKzxShW49JOPsv3XgwzT+cfrJ3ey?=
 =?us-ascii?Q?Hosjf2LBG44HBpd9OTJjBZecmqmuFYO0PIEsoYl48uVXNfgaoXLQepZ3/XzY?=
 =?us-ascii?Q?TXEjb8XKN+w6Y9vHjLVtcgmo8IdnZDo+HbsiZclx1KC71nkX5J/554vLbfHy?=
 =?us-ascii?Q?7wAjxhRSSMwKyRIqSiBVjsxwrdaz+eNxCgYrm0rI17C+XdDpDJhUubtXqzD4?=
 =?us-ascii?Q?3fUkMS6iphLeVWRin96SewJhqMxEAuUZe+LzLcEovQk2bw4c/L8y8m1qAYFM?=
 =?us-ascii?Q?nAgqwzSsL0pXaMyuOtspxPdT/D00/cFp6BTfN354ySaRyVbBjMAJH3sxw2TE?=
 =?us-ascii?Q?xrj99JeXnX1TE5XPTRE8stgbRj8F3MxaZs52IySZNeneHhI59B8qryZDJd8/?=
 =?us-ascii?Q?h7sSBrDe1gaaIPvszdJL63Xmn2CI4OFDw0e3oFI/hgyy2JHk4DZbY28RCpEs?=
 =?us-ascii?Q?the6QWK/uZq0G2OB690Yf7Qab+JbH8oUp7mWdmF2dzt8M5dzf8iU6QQyobyj?=
 =?us-ascii?Q?9GHuaINIWPzeTRPv+t9cBUnQ7k/H9hQMZLjdXdnnGaKSxE4LuxwCBjazf98/?=
 =?us-ascii?Q?kre3EtOPbCh2r9/KdB4ZYoBdvRmUNuioMW61jrxkbbjTDVfLCj4suJ1LjoSK?=
 =?us-ascii?Q?mW7JygoVbFNTeNceUC+d6FsvFy0CfCtwfaQs4laYjwFgN96muv9oHQIX+5Th?=
 =?us-ascii?Q?awVW26Xmeg0Cv/cHgLJKiWMmdwgOUMwH/Y/z6JjOh1+awCuK7RZyFs1yyXDk?=
 =?us-ascii?Q?JFwB79srv0KTItGs62ZGM3r8Wwl3n4fkj1N0jLBluz/xojAfMorpV49mKEGa?=
 =?us-ascii?Q?75DYoYigKzX//7svhX5vQjMNQYc02SFrBLwGyO4sPDA2G4hcy9vvXk6X3psi?=
 =?us-ascii?Q?IzXmAvQINc74J0jy7FmjX4OklzQneE8xjIALYm/egGXoba3vgJA2NCE3E4F7?=
 =?us-ascii?Q?K/83qcAVHd3Wdf5m6ufnKDl4Y5rs6Mm08vH9Dk2+u8Cgl+vRag=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2024 17:54:30.8518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a8e81d-0c5e-4483-39ba-08dcfb676718
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635

On Sat, Nov 02, 2024 at 04:21:08PM +0800, kernel test robot wrote:
> tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
> head:   23c28de51f2158aaebfd545a42cc2f015c98b8c4
> commit: c6a74dd1148335a1f34b7a133bb08c7af3583715 [3/39] iommufd: Move _iommufd_object_alloc helper to a sharable file
> config: i386-buildonly-randconfig-001-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021643.mkNwAYyo-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411021643.mkNwAYyo-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411021643.mkNwAYyo-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/iommu/iommufd/driver.c:6:24: error: redefinition of '_iommufd_object_alloc'
>        6 | struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
>          |                        ^~~~~~~~~~~~~~~~~~~~~
>    In file included from drivers/iommu/iommufd/iommufd_private.h:8,
>                     from drivers/iommu/iommufd/driver.c:4:
>    include/linux/iommufd.h:142:1: note: previous definition of '_iommufd_object_alloc' with type 'struct iommufd_object *(struct iommufd_ctx *, size_t,  enum iommufd_object_type)' {aka 'struct iommufd_object *(struct iommufd_ctx *, unsigned int,  enum iommufd_object_type)'}
>      142 | _iommufd_object_alloc(struct iommufd_ctx *ictx, size_t size,
>          | ^~~~~~~~~~~~~~~~~~~~~

Happens when CONFIG_IOMMUFD_DRIVER_CORE=y while CONFIG_IOMMUFD=n.

I think we should move all the driver helpers under _DRIVER_CORE.

Will fix both error mails in v7.

Nicolin
