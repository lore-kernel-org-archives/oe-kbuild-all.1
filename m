Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D37F6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Dec 2022 00:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmLeKx6zk5NKWxjGWhx8EpIbxI9BQjsnccRhMsL9JHOvHS7HkHVlKQtFlLdNUtnkjWeR2Vyer3sjWpre3lLLwknQHblh9YGfwRJ1MTCxcxtCZtXCIRIYIqGClNrW+9alGkPlfHl4xtE6Z1mYIdLWQvWmtbkLCZVSZ6S3Jdnv0yc2b6tH+9gCGHqL+EnoWCiahLMThezUsiSK+lwKpnH7KvffTiWNQYK4kfDOCH1NlYzqWD8w9thD8Ipy+f4jKK7qF+km7H4307Pz0SbIdDbxJxAkHVwKtmHEIESvCHU6oTaO4cf89djrDLYiKTJgFf2wpQZbjcEyWlyK37z2oE5ivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHa3STLLjuRUT/g5DxmviSf0zqzz0oAmrTsOSr4JHM4=;
 b=f6jFJD14LRSf7j1M/LhfYhSNpkme8zevVLzvlB0yz2wliC8+OMQXxqh/dCxPShU3eqMefhdEbVf67oQFJ/GXc8rUvn6Xrkv2PtIwBzkvJABPYgCqSpnmr0PLGERmlt8ey5UqNdYzg83iusywY+kCNWfG4qHeVrjfaSAmOSNzQqCHvBThUxjzyrCdhGfPs3sQKypMaf2d70tZNjECEyQ6bmJjjsH4VT4cRRXaLuYirKH5llt3Qe1kNfmFmWoz/HSeBtUPyhaUUDiH0ou3Pe/sfE9hum9nOBGt/Kn7rQDJj4TTAQmhjvJezD9DDgSR+slwHJOf1XUMnGsgU4NoKILITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHa3STLLjuRUT/g5DxmviSf0zqzz0oAmrTsOSr4JHM4=;
 b=GHT06QTkC3ZnWxpKZ1mgCuuxcwZc/hiEuRcPUy+s5TM9gN1WNGoS3309lCocN5nHc8hEE1jp2UEzV41qh8MEEDkbivkaitcX+4srF82PQPtYXRn9pYrSyAfytSVBDSQ8G2P/R27lb1kQ03XlqT8B4x7whQbdKiBfU8qPr8qHTbtz+l27sgbPLuPLvWrmE6ogvCi3YlFE73fiBaVQlBsRxBuG8G/voRVVWHvgXWEvAYWmkNtu7+xZPnm/LyMuvGIffqovZXFw9ybWFnofx9tXP7QpqxBDxVGygO47kYSVWEKYe2of+dje+XQ1V0UoAf2WGO5uti/DBfMhMX3GB2oxhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 00:03:35 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%8]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 00:03:35 +0000
Date: Wed, 30 Nov 2022 20:03:34 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>,
	Nicolin Chen <nicolinc@nvidia.com>, linux-doc@vger.kernel.org
Subject: Re: [jgunthorpe:iommufd 11/20] htmldocs:
 Documentation/userspace-api/iommufd:174: ./include/uapi/linux/iommufd.h:117:
 WARNING: Unexpected indentation.
Message-ID: <Y4fvVvCbZgXxXg0J@nvidia.com>
References: <202212010331.21lwbBde-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212010331.21lwbBde-lkp@intel.com>
X-ClientProxiedBy: BL1PR13CA0398.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 480ef6fa-cf90-4828-c494-08dad32f7dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4biNJur9LcDdWBGEAdVReptSnBVXmlU/KQZ66398y9u6pxqTOY5GpL1tT7SR033tmVxf8OUOimXuUZ2/QHBn6YIUuTjoesVuf1iYJ7fWIRpk1+OvQJ58VgMeE1ithrtcdsIdf2gvFHtAIwhJqfRj6If1EgbF09RLrCDVr/Y8JyX9jeR1+ZPc+vn+foTgGZYPcMRlOtouI8tmacYvZnLqRy6Vcsudl3ao3gIahNOlumHT9ulTVm5JSLFZ2ijLsgfktCqy0bkfBEQ2eo10RcFaZALmKdghj9/71LqEGCqgV9IXD41N+uZzAtLdK88bVeZ7VMS75lzPLsUr2fUv/byIq4KmeuN+cieGn0yv5AuRsez6wwKANOMB9HPXMXzi1kFqNVGwRNk3PRlkZFZpagooOYKOs0rTIAMHffPeg1KHbRCN7tModKrEcH4B7WmJsYwcl5pAp+EeUfocZTy2R/70x7s0OZp7BEBbyGQHt+Dh0QPwCTxnHgNrTNh9aALTp0OoS3XeRWs1mpWWy1Ng763slrMvbvfY5ymNAvHzmfPniqh8d9Iv8JcHUCFVqZxZ2612+M7Wt7wMKo9kJSNU1hcwJjsRJXu2OGL3bsCeCmhZOcEu35Cy9hCuWl+AiptL8KxxbeZQcsJGO9FNS8Rk1hfxeQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199015)(186003)(2616005)(38100700002)(6916009)(6486002)(316002)(54906003)(36756003)(86362001)(6506007)(26005)(83380400001)(478600001)(8676002)(2906002)(66946007)(6512007)(41300700001)(8936002)(66556008)(4326008)(66476007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+SuEJgytQnzXFG9dTXxUJ3ZK0N8y/FoZA+UtwFHfieamDz6bH/wzLsRYxZUN?=
 =?us-ascii?Q?hK7ylWShzHt9ZnqvHvQVeyOzkNBxMKX0DxPQvmKIoiMjBQGavapo8SNUktjt?=
 =?us-ascii?Q?Q+6CI5hFDUbAOHMQeqMr0ZWz/MMQ+i5FMgr1Od/YAht6z6Gr7LK3XwgZJFXg?=
 =?us-ascii?Q?aihbjmW5GYTidKC87GZo3rNRvRN9ZgCHr1ESAuAa31ApV+HxU0/GE8AxI1+L?=
 =?us-ascii?Q?2mp0jENnKpuenyEfflfgLwQxRTzDLUDARrdnPLmWw5wXiMe4+F/FgEPA+oT2?=
 =?us-ascii?Q?RLx7o/fC2pgFT4wvS7qgtnqAkziVKNsOxAayGHPqeh1PIo1V5WvJuYkh5a1n?=
 =?us-ascii?Q?1JI6QhCcFsY5Geahy1Yk3gX/AL8iVxOKUnp556ALZn6hkNYjxqcBpwYUB6g5?=
 =?us-ascii?Q?gK+7u8xoBmDfCXIq79NgldnwlGxenGpQxBXhn+f9P3n8/75/dp//zVD62s30?=
 =?us-ascii?Q?mAMwEVRW7we1W6Ui19J2A04DEdEkq/b7Ee1R5Sajw277ZDlcDKiRy3OxQmx+?=
 =?us-ascii?Q?8486bAQZKinz8uKYZBFjpUYvFpspbaaX7k+9uYSRKcg01lvp0ZZJwar44Oeq?=
 =?us-ascii?Q?AfXbADimT9GErguhGqAJUTyf6vSC9YOLvNhTBBonNsO1oT9gZlrOkWdcqPHJ?=
 =?us-ascii?Q?TzWI4uFlRYfWpfzDYqGndfkAa+bbk1pFbsj7rvc50pcJpJ5eCd6TllJohbNU?=
 =?us-ascii?Q?15Uj1NcBO91nq3j/BPwaW/uM8oft/h+ILtSloKbXR4Q2maaovsREuDml7hp4?=
 =?us-ascii?Q?AEX3o32uQHkGYyf7gN2Z35YU1RfEOaZ+ryO2AryGIT8DXvntf53/egljj/t/?=
 =?us-ascii?Q?oMSOXWsE5zH0eC477djii54LWsBbCA0LWdUc931cIF2g7k3l3EF11Gk2vs+/?=
 =?us-ascii?Q?fM+nNA2dp+JbX6WhCOBYfaglHVHKTItepyakcTOF4yd4g6vabJcvj22bHoGD?=
 =?us-ascii?Q?CudPpDxcIg8bYdjpIECGMRkW4EaqM8dLqHDALOSFFBp+shp5riAWW87dsjtq?=
 =?us-ascii?Q?lUUxZSBKzShhwE5GheUEuwEamnXPYe15XNL4BBf/j7Ze+2OxG7TLrGjCmW4I?=
 =?us-ascii?Q?VfUocnsZT0eKBttByPA07mUdBxFuxE/PSPnCKd6v1hrcXbsnPUR+5Y3Htxjj?=
 =?us-ascii?Q?BTAPmxxwTmlC3D54FIp2CVnUvP2i/l4dUfPnGq8CT6IXtO4sRQPXGXH08ksS?=
 =?us-ascii?Q?V5vR8lKJrrlPHis/D+/KLHBIDn1HfDeHs1qufaj6mAl2HoqiAr0n4af2OZzl?=
 =?us-ascii?Q?Qk1loN8yZkT6y7zoiQL28Z2ArSMd6wY9cuzmvxnHwWfv3JQUHH/c59DI89fL?=
 =?us-ascii?Q?Q0dWn+XNA/nW1WqpY6yTUf39IMFL5lQnpgI0uJntH29VJvhrZ242f/xaRAg3?=
 =?us-ascii?Q?ynhL8kFhWtyMJ0bXvjLb/2RtFBjXQb7agEvzr79dj8hyM3DuPpAd4+AxMgWy?=
 =?us-ascii?Q?DbUNV/GBsTmW+e06eschizTu1lKuQENz9nhmCX5XbDBqI3Z6S88xtgvScLkZ?=
 =?us-ascii?Q?4zyVIqKD0ibAJRVdlUbyiNDslaHqsiWFAYYkFNxTLZCSqqlTcymp4Uw2XULu?=
 =?us-ascii?Q?kYZXv75AGjFHIPulEQM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 480ef6fa-cf90-4828-c494-08dad32f7dcd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 00:03:35.5524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vExM/2zakt5LdEyNJ8BbAwFI2c4NLVd1evOADSofvoUZMW+jjroB88HhF0NEMr5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651

On Thu, Dec 01, 2022 at 03:57:59AM +0800, kernel test robot wrote:

> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> Documentation/userspace-api/iommufd:174: ./include/uapi/linux/iommufd.h:117: WARNING: Unexpected indentation.
> >> Documentation/userspace-api/iommufd:174: ./include/uapi/linux/iommufd.h:119: WARNING: Block quote ends without a blank line; unexpected unindent.
>

This will fix it up:

diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
index de8d2d4f8bb604..98ebba80cfa1fc 100644
--- a/include/uapi/linux/iommufd.h
+++ b/include/uapi/linux/iommufd.h
@@ -114,9 +114,11 @@ struct iommu_iova_range {
  * caller should allocate a larger output array and re-issue the ioctl.
  *
  * out_iova_alignment returns the minimum IOVA alignment that can be given
- * to IOMMU_IOAS_MAP/COPY. IOVA's must satisfy:
+ * to IOMMU_IOAS_MAP/COPY. IOVA's must satisfy::
+ *
  *   starting_iova % out_iova_alignment == 0
  *   (starting_iova + length) % out_iova_alignment == 0
+ *
  * out_iova_alignment can be 1 indicating any IOVA is allowed. It cannot
  * be higher than the system PAGE_SIZE.
  */
