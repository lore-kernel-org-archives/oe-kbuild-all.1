Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C45113C816
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729375546; cv=fail; b=U4F1bJKWSAd3h58iKMLfVVvXNguE5hesc929RqlESzFdw5ydUmZmqSnW07CSJQ1gd8svssciZ6saVxeDptlO0HADW9afTYt/kl3/xrzrDnb0LmC+e1/IIkgDinyuIXJSSIef5kPkx3MRUD14oPC1v7N7llVnQYAd/Oem3+3d55k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729375546; c=relaxed/simple;
	bh=B2oYL0tzt5Mx9ZgdgNAg2FmpPvENG+vacRxshP8ZMXM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWYmym7HDfg8NQVNLOPNQ3L/1SzK6ZlR3NTMdY7DvulNEKHHhkFZOjEPCrIQVQvEuNTLV5SFBX/y1888LmCh+FMwmzLFd5tBFT/e9BprOIkRRo7XKTpQkiqKefUe6/efvMnT62V2/LaVkr7rTzmJJoDwmmKVw3DVdCRdPH4M9lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hJJ2s1Xh; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hJJ2s1Xh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OF0lvP79cXqmLIHTDnLLfaXi5uzRMnJP9mT7X3goF+gJ1dfR2ZKa+a8rodPb+WIb4S9+PwJBnD53j0q9OmP+HiCpptnuSVQ3XrSScfJP+PtcezfVbbJ0NXxvfH4QYql1f/9Vp49QX1OaFGa/iQjKJ9JazHTekLzQy7xVK/IjyjwF3rn8PZ/sFWAOCIA86Fy+ENJUpYOhNq5zo6hbcLLsmEDmzEFVjlPwG07yL/E00w7025H4Cdpg9Kt5MYb4FazFwtt2rEbOaO0QSsmvKkO1jrh77YtBm+hnfPsCfbVes3ihPQqdApqfTUKMENB/q3yJCeARM7QdkKupEurZiNwdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgGi8J1ADxV7cGK6iuNnBhLcifqr4+d25YbIqWuDWpU=;
 b=PpOUorPiE2ZIHg8ycAsMz/1oz2u5kRGAOxzrdAaJaTpFoxsYGYo0fUADAB/eZF7CCuHMHud6YH2GnSBgfA6CAZQgjnBvKEznfojkJM34lQKKrg1L4KS1XjsnNuD5nDk8KA/179d2T0KzUPKDsNQEguLxf+AoC8eDLZv/F6jdHxH2D27eU52OfUZe98CSdDWPe9ebH3oZLtk9HuAesRpD4GoSIjS1oVc+cW94di4fKTk+FgdV2KY7d2OA6HXf8eWRxPw7dx87xRIM0oJZz/WC9qHJ5Nj8MLSAG0khwDOwqzIiSd/XxkioVQz6r/fh/IrwdiFtiHKj+R8B/C+EXAZO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgGi8J1ADxV7cGK6iuNnBhLcifqr4+d25YbIqWuDWpU=;
 b=hJJ2s1Xhl1Vt0MgWPlcoGsDj/fab4jKAo5qPelSonOXM8i2KggVnkMs2+RQwjAaBR9ZEe2Zw1hZvsDLYeo1KsvbgsDCxWb+FjYIvtQO9LnDsZrsioPf69mrHJqLE1ViL4pGeN2nSWpVMNlMXRuMPWIdZ5hqstWhrEPNiIxSgWgVdWJXBAX9Q9JFfw/Qm8G8bQohawvN4p/usUaylnz5SkMujyL1iQ6avVLaoe54ppIVfSlINR30O4ghpLBuzk89SmeeaECuZlrsG3jaRKF2B8K8UNqTY65Q+wXffx07l7N41m0AJQNP4vJG80ldnCQthEoTVK8aVcpg0v7uR3C0yMw==
Received: from MW4PR03CA0004.namprd03.prod.outlook.com (2603:10b6:303:8f::9)
 by CH3PR12MB8969.namprd12.prod.outlook.com (2603:10b6:610:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Sat, 19 Oct
 2024 22:05:40 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:8f:cafe::cf) by MW4PR03CA0004.outlook.office365.com
 (2603:10b6:303:8f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26 via Frontend
 Transport; Sat, 19 Oct 2024 22:05:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.2 via Frontend Transport; Sat, 19 Oct 2024 22:05:39 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 19 Oct
 2024 15:05:29 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 19 Oct
 2024 15:05:29 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Sat, 19 Oct 2024 15:05:28 -0700
Date: Sat, 19 Oct 2024 15:05:27 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, "Eric
 Auger" <eric.auger@redhat.com>
Subject: Re: [jgunthorpe:smmuv3_nesting 11/17]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <ZxQtJz3F9t2N5FoY@Asurada-Nvidia>
References: <202410200404.OJrmhHAF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202410200404.OJrmhHAF-lkp@intel.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|CH3PR12MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c721937-c935-4a0b-fc3f-08dcf08a2b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LOt7U5BrQ4H1D0QqIOStYuxk8HXVpl53IZsMBUK0Vk46+NIG5zeYXQ1Zpi8y?=
 =?us-ascii?Q?JetAY2nY1b6e7TtYCVU/ogjRr5xOaVinUNtb0pUfWRAyr3S7mEnasHPTbxE2?=
 =?us-ascii?Q?SxExHr2Fhrtj/Bp+KK+oNUqX/qSAFcuwCv3+zbawJWmT5Du34AVRc79oo6AC?=
 =?us-ascii?Q?I6nSOARLK6QamwBg1dF5PYCCfEEkvx2RvPMSwqqT6TpUHLpqig/ntB7P6jFp?=
 =?us-ascii?Q?9ZErDwJpokhTnL53BljLcJAoRGzxzgHyaz/+XGZK8Zc5e9XV3/WKO6aoVrSI?=
 =?us-ascii?Q?Jgs4otLJ8p0nSCEeRg5WWnceJwOFichfZI7a619zHeYltFNE6xUWin+UmNfz?=
 =?us-ascii?Q?zlC6U7GUEz9fdV43UlPlNQu56UBqRj7Ou2u/a9cWKq39ZNUP2C+KRRrDiCxk?=
 =?us-ascii?Q?iZ77pk+S+dh8j9QUigiQg1ZHnt+sN961jSS3Tcc6ixfaSOA58PmnUZ7gTpIc?=
 =?us-ascii?Q?7nc56rGEdHIylZfX2yGhSGvJ2DGk68jiaSe4PmIiIlx9JVBTob9UuO6dLfiO?=
 =?us-ascii?Q?a3rq175BENmRg9ydfEmgIMVYc9SmncBFArPNBWQysJQlrKsaF3lstSnZ3xUY?=
 =?us-ascii?Q?YI06F6S/C0qtJTJqGaspEycr7ciFP1ox9dvCFso0bHMtIQTRtaVfZzUCI59+?=
 =?us-ascii?Q?D6p/3u1sgkKm9L6UUJ2qdtRBYDGG+L2UAjwOLFbOSGdW8qFyZpS5Uwum11I0?=
 =?us-ascii?Q?UcFpVuVp0WU+8/mIoOW71q3b9aD6ciZkBRU5sthvLffMiALiHC4oIaXvoQK0?=
 =?us-ascii?Q?nXNy+LGyH+JXf2R3fE6c+E4uWepjPffd6iRIV7RnMVxgM6ZMygWymIl+YJ7t?=
 =?us-ascii?Q?K/CRvMYnX7URUMdFYHLqGjiLOl92cWnCphocNv0FdUE112VVZulN1aWlvPpn?=
 =?us-ascii?Q?pLrS7l2qFlxWh/dy69PmyJKwA/yd9bkLkNI3636Do1dn74D2ukHBbAc44yFX?=
 =?us-ascii?Q?BeVNZj6Gu6isVVtLJdB8T+MNQGIIyEN8xVmDltsF0yOUTJUNbdn7gcpIZCYG?=
 =?us-ascii?Q?Pco0+/t6OWS1AVx3Rv5BNuql5VTGRZO5NCf/vqiJfCvCj/OacNRRFKntjYFW?=
 =?us-ascii?Q?srk7CxOiQBKdzNhnXh2hU9Jnx9xBjWjEXVwhB1CUjIMhhK14SViKcV7ig3if?=
 =?us-ascii?Q?XFlSmT7fXv+lcxlpgL7S01ro4Pw4CM4YRvH+NC4klbpQwQBe/muSl4R9MUG7?=
 =?us-ascii?Q?WRY1fkiDua23gA0IlqQ+tvkiwwPy/Ro/8W+1GS4j05Whjx/0xuQ7OMYmFzED?=
 =?us-ascii?Q?PI2KWlOOLyVc0I7OqFtTIbYTGl0clgy9DfFKW5Vv8zI1txAMXEoMLdoxOo3/?=
 =?us-ascii?Q?5YGnr/hdZHNaNb5eWzO2x+v2jDUaYIysg1bVj1RhucmjyVi3qiwlLEvljBw0?=
 =?us-ascii?Q?aNUvdvHqXMeCtD9ITqwRtByIsKfSZgIBdeinBX/dfnsjGA4FBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2024 22:05:39.8988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c721937-c935-4a0b-fc3f-08dcf08a2b30
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8969

On Sun, Oct 20, 2024 at 04:34:57AM +0800, kernel test robot wrote:

> sparse warnings: (new ones prefixed by >>)
> >> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 @@     got unsigned long long [usertype] @@
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse:     expected restricted __le64
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:141:21: sparse:     got unsigned long long [usertype]
[...]
>    127
>    128  /*
>    129   * Convert, in place, the raw invalidation command into an internal format that
>    130   * can be passed to arm_smmu_cmdq_issue_cmdlist(). Internally commands are
>    131   * stored in CPU endian.
>    132   *
>    133   * Enforce the VMID on the command.
>    134   */
>    135  static int
>    136  arm_smmu_convert_user_cmd(struct arm_smmu_nested_domain *nested_domain,
>    137                            struct iommu_hwpt_arm_smmuv3_invalidate *cmd)
>    138  {
>    139          u16 vmid = nested_domain->s2_parent->s2_cfg.vmid;
>    140
>  > 141          cmd->cmd[0] = le64_to_cpu(cmd->cmd[0]);
>    142          cmd->cmd[1] = le64_to_cpu(cmd->cmd[1]);

The iommu_hwpt_arm_smmuv3_invalidate holds a le64 array, though
we could probably do everything here in the le64 format, but...

>    199
>    200                  /* FIXME always uses the main cmdq rather than trying to group by type */
>    201                  ret = arm_smmu_cmdq_issue_cmdlist(smmu, &smmu->cmdq,
>  > 202                                                    last_batch->cmd,
>    203                                                    cur - last_batch, true); 

..eventually, here arm_smmu_cmdq_issue_cmdlist needs u64.

So, I am adding an extra native-endian structure to fix this:

----------------------------------------------------------------------
@@ -217,6 +217,10 @@ static int arm_vsmmu_vsid_to_sid(struct arm_vsmmu *vsmmu, u32 vsid, u32 *sid)
        return ret;
 }

+struct vsmmu_invalidation_cmd {
+       u64 cmd[2];
+};
+
 /*
  * Convert, in place, the raw invalidation command into an internal format that
  * can be passed to arm_smmu_cmdq_issue_cmdlist(). Internally commands are
@@ -226,7 +230,7 @@ static int arm_vsmmu_vsid_to_sid(struct arm_vsmmu *vsmmu, u32 vsid, u32 *sid)
  */
 static int
 arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
-                          struct iommu_viommu_arm_smmuv3_invalidate *cmd)
+                          struct vsmmu_invalidation_cmd *cmd)
 {
        cmd->cmd[0] = le64_to_cpu(cmd->cmd[0]);
        cmd->cmd[1] = le64_to_cpu(cmd->cmd[1]);
@@ -266,11 +270,11 @@ static int arm_vsmmu_cache_invalidate(struct iommufd_viommu *viommu,
                                      struct iommu_user_data_array *array)
 {
        struct arm_vsmmu *vsmmu = container_of(viommu, struct arm_vsmmu, core);
-       struct iommu_viommu_arm_smmuv3_invalidate *last;
-       struct iommu_viommu_arm_smmuv3_invalidate *cmds;
-       struct iommu_viommu_arm_smmuv3_invalidate *cur;
-       struct iommu_viommu_arm_smmuv3_invalidate *end;
        struct arm_smmu_device *smmu = vsmmu->smmu;
+       struct vsmmu_invalidation_cmd *last;
+       struct vsmmu_invalidation_cmd *cmds;
+       struct vsmmu_invalidation_cmd *cur;
+       struct vsmmu_invalidation_cmd *end;
        int ret;

        cmds = kcalloc(array->entry_num, sizeof(*cmds), GFP_KERNEL);
----------------------------------------------------------------------

Nicolin
