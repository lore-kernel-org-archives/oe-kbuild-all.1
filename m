Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C48323C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 20:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cIEl6JcB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpfruMhJrWCYcdWkJOc1tMxeOmpoouzs/SyFbPLXtAC49Yxy5MPS/Al83+UeJEIPoffbS7JolZjHnFToyN4Y4a+RnQ+j+FWH0daLeDv6HhW888HZ3VFyeDEgB17MR3yzaZD5Rw6ZCvuCBvndY2dc2Lr4fjfN1QBTqMydNGOvwic6ifXak7T+pZNSVO9DdQFB4ADngq1yTPtVv+qDEIdNWiN/FzZCJZVYL7WUD1473nKrKMYN7i6K4u3X9Brg9mc1JgJFihxmLTK+zauNHrSDLYFhxkQrxVru7DXQA5wnve4woe3TBcFVh8PY/vCS5P+f9AIZCudXg6Q5ja63VLfTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLkQuIzeXomrNBT6w/BkWJyZWuASOIBaL2vYaTwB6L4=;
 b=HHujrHqEkTHXuuRXfLAegcraBKklnPnJGypyxtCkOtMjt8UfxeKfxBr3XR/q5U4zP/fais7CabtyrkEwl+fzrykAVSYAqrl0i0t3WYxfxs6kbBAXUdIL+rCzIDb40z6OLku+FXQBoYbV9vTY1nqvvl48C6eINV1xeap481S+IqFA3cqK+RlhAF+RYP+A9zlNrhMgJZ+rTkci7duiCTRQvK2zpwrqSLr3I+VHJ2J4SOqi7pPgNeOslf0gWk3PBN4ins6BJMczk1gzw+OWY3/HqfWJl7JgW11XM7MZJtDyqln4wBFjDfJzorDFZs+u1FRHYx3jz2joM2pjkIRoMn2zig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLkQuIzeXomrNBT6w/BkWJyZWuASOIBaL2vYaTwB6L4=;
 b=cIEl6JcBcWn9xHKNrPnrNIPCr/2FHru5AuY87gQtCs9y6wJXHCUyzK/147HkfeIcEeQYBaaeT0bCk2ZpMdZV6PnjuAb2cDkShE5K7Fb1Rpb71iOFmWetUD9q8fBGPlH2bgmOOx1JU8ul+6lrxFVKtV9CKczmnPun4q1aeUyaZmO8gXtU5kFuD5mAMLmTCPbl+fwVf+Rz1IDd361jYW0SHC7D0UZM8Kroch5mK/Op7PP9HvLcVzELa18LFs8gMsTYdnz8mo3rCLPotFgtFFfq9Yn482RYfV/5x6MNaRGYcNaqpOPiWwLLMOkNo56lq6jclL9gP2p+M+4QVZ3TMMZCTQ==
Received: from MN2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:208:1a0::18)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Tue, 24 Oct
 2023 20:27:47 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::fb) by MN2PR07CA0008.outlook.office365.com
 (2603:10b6:208:1a0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Tue, 24 Oct 2023 20:27:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Tue, 24 Oct 2023 20:27:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 24 Oct
 2023 13:27:31 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 24 Oct
 2023 13:27:31 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41 via Frontend
 Transport; Tue, 24 Oct 2023 13:27:30 -0700
Date: Tue, 24 Oct 2023 13:27:29 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <oe-kbuild-all@lists.linux.dev>, kernel test robot <lkp@intel.com>, Yi Liu
	<yi.l.liu@intel.com>
Subject: Re: [jgg-iommufd:for-next 36/39]
 drivers/iommu/iommufd/hw_pagetable.c:101: warning: Function parameter or
 member 'user_data' not described in 'iommufd_hwpt_paging_alloc'
Message-ID: <ZTgosVlGp/H/k6pd@Asurada-Nvidia>
References: <202310250418.NmeDHFgw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202310250418.NmeDHFgw-lkp@intel.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 8308267d-e984-44d7-2639-08dbd4cfaf89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aTiXDCj7nxt2xJ4TPxTHhgjKY0eElTnORrXzTUBrS07iPbAQt5nWzOepES+Ryi5Wd3O1NlNEXZCQVuS0cNHe+4UnvR5UZVn6iXyoEjwXOuQDcWpn/nklg53ra3NcaigRNVUCqYj8qJhdcIqNVthxy401XC508SxmdWIPtNTbxbWUTqs6p74FH1kGyqChBZdd6p66eHFNOmhdJ3wNqfvJP631//S2QEHTNRh4YQ0p62aYra8pvrjUHA9TgeN5no3vQkETs+S/bSb6WSv+TJXXIdTIOes0ahJTmSWSCwK2j2lYD4+yQar6qlUA/Jkbow8LQGE1T7Cm5dxNpXgLKoCBlY1aXGCuY+cdbqmERODUA17k96IUUxJTpnx6cMJ+eQmbJ/l9sJXsHGd64H9hrM5vHU+9lhtCLjqKlOeJ2ARND6P267fNGqTJPcWy3C2wyENsLBY+x1b3eLLIHSgQUF4Ztd/yezZHZyMD1glmq7qNqhjFwtFLQEojzYAmh21DhNXf5Kd4wmK4seydpxN+nzFaoR0taSPxkC1or5ybsD6gXq24Am4Hfc46rRiu3SP2zflcenjrWeH6qhEYtQhaV5xu7Hog9xSIEumyjOhQF8pjG1UhZUiQrayPunxn/doDSlZuEwJbvnzIzUYhtJ6WGGUdtEudDOYfxPuMEm6JVLQyHI2VZrIUQ3xFQqDkx1uTKLW/GWCNfbwEvEKt4Zj1LTwhKHT9F9KQy7oNKC7rsDh6SZXHTxNRqY4ghtdsoSIjVpVs
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(186009)(82310400011)(64100799003)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(55016003)(9686003)(4001150100001)(336012)(83380400001)(36860700001)(33716001)(426003)(8936002)(5660300002)(8676002)(2906002)(41300700001)(4326008)(47076005)(478600001)(70206006)(70586007)(86362001)(54906003)(6916009)(7636003)(82740400003)(356005)(316002)(40480700001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 20:27:46.9345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8308267d-e984-44d7-2639-08dbd4cfaf89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410

Hi Jason,

On Wed, Oct 25, 2023 at 04:21:08AM +0800, kernel test robot wrote:

> >> drivers/iommu/iommufd/hw_pagetable.c:101: warning: Function parameter or member 'user_data' not described in 'iommufd_hwpt_paging_alloc'
> 
> 
> vim +101 drivers/iommu/iommufd/hw_pagetable.c
> 
> 17bad52708b457 Jason Gunthorpe 2023-07-17   79
> ea4acfac57b9de Jason Gunthorpe 2022-11-29   80  /**
> 3bc7f01ff2de6b Nicolin Chen    2023-10-24   81   * iommufd_hwpt_paging_alloc() - Get a PAGING iommu_domain for a device
> ea4acfac57b9de Jason Gunthorpe 2022-11-29   82   * @ictx: iommufd context
> ea4acfac57b9de Jason Gunthorpe 2022-11-29   83   * @ioas: IOAS to associate the domain with
> 339fbf3ae14426 Jason Gunthorpe 2023-03-01   84   * @idev: Device to get an iommu_domain for
> 89d63875d80ea1 Yi Liu          2023-09-28   85   * @flags: Flags from userspace
> 339fbf3ae14426 Jason Gunthorpe 2023-03-01   86   * @immediate_attach: True if idev should be attached to the hwpt
> ea4acfac57b9de Jason Gunthorpe 2022-11-29   87   *
> 339fbf3ae14426 Jason Gunthorpe 2023-03-01   88   * Allocate a new iommu_domain and return it as a hw_pagetable. The HWPT
> 339fbf3ae14426 Jason Gunthorpe 2023-03-01   89   * will be linked to the given ioas and upon return the underlying iommu_domain
> 339fbf3ae14426 Jason Gunthorpe 2023-03-01   90   * is fully popoulated.
> 70eadc7fc7ef29 Jason Gunthorpe 2023-07-17   91   *
> 70eadc7fc7ef29 Jason Gunthorpe 2023-07-17   92   * The caller must hold the ioas->mutex until after
> 70eadc7fc7ef29 Jason Gunthorpe 2023-07-17   93   * iommufd_object_abort_and_destroy() or iommufd_object_finalize() is called on
> 70eadc7fc7ef29 Jason Gunthorpe 2023-07-17   94   * the returned hwpt.
> ea4acfac57b9de Jason Gunthorpe 2022-11-29   95   */
> 3bc7f01ff2de6b Nicolin Chen    2023-10-24   96  struct iommufd_hwpt_paging *
> 3bc7f01ff2de6b Nicolin Chen    2023-10-24   97  iommufd_hwpt_paging_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
> 89d63875d80ea1 Yi Liu          2023-09-28   98                            struct iommufd_device *idev, u32 flags,
> a6f4f0247d4e7b Nicolin Chen    2023-10-24   99                            bool immediate_attach,
> a6f4f0247d4e7b Nicolin Chen    2023-10-24  100                            const struct iommu_user_data *user_data)

I think we forgot to add this:

----------------------------------
diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
index 6e11693617a0..358708973cd7 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -84,6 +84,7 @@ iommufd_hwpt_paging_enforce_cc(struct iommufd_hwpt_paging *hwpt_paging)
  * @idev: Device to get an iommu_domain for
  * @flags: Flags from userspace
  * @immediate_attach: True if idev should be attached to the hwpt
+ * @user_data: Optional user_data pointer
  *
  * Allocate a new iommu_domain and return it as a hw_pagetable. The HWPT
  * will be linked to the given ioas and upon return the underlying iommu_domain
----------------------------------

Thanks
Nic
