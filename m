Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE928F527
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061036; cv=fail; b=Cya8Xq90HfnJmloZpojaTY7goD2yiWGnXOj9DJIR5ijod0aDnMak8T2927VSqUaJqskTbQr4aEIcfao5CAcSNuHcYdT372HeSLDyMoH4cJ2sMs06WmmPjqWZzYBDiGQINTzNNOwql+iL4iTSTizXLHEN86C6u9zCUTi2i+O2IPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061036; c=relaxed/simple;
	bh=87p3FSjYwfAAkp1GjN28U72JXdyyUy1lBvpgZ2wnuAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kPCiOGAhA51yPiQmFrHCI+GDZybtN9zsr20BxTBvr0al9fStjI5NRg5uLCrC6lblLXSNMCq1Ymb8Sm2IQGwgBepPx+8OeL6qBOR0V15RiurFjAPCFY6mSx2dyPqkwLPURx0BxA9D+cqbBBYiBCbO3vKPGTi6ybRhGgbh2I0892I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tYDEugwD; arc=fail smtp.client-ip=40.107.94.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tYDEugwD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cl9wlVrj645K6n/woA+taEiegU2T+DGFZQBpqm/pcGJLpzHTVbSLDjpq2FABV4c+Zhvx7+H7LkmC9mqD15S4gV8So+fYBSD7ZpVU4RvIBGr5NGCDPbIhx74ci3m+GAEUCtNXu1h6pziN8CXSxLJIgn1yjywuyLg76ZB29XThLM/ZnoJCcxEwNrOOnB6+f/gHifwVIpEeATk7RYRsZqmt++XK9y6Ow1RXTM0a9vmVbJei3CZ3CLUhAooZDBT/atqHPLOWruhJdo5pbEXRVot9ZauCAJwljCTk75lQ4MhPj6zmlF05DA3bCYwilGNiKP/vIsiOcemhKEksKqGE1qXUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Utg/kxiknrbazUwAy4X9kK2aE90Vfh74rFY2+lM90I=;
 b=Ab4R5RxWOAcSYEUtZLCNDzwHPgj+5dLJAFQEH/xDN+iZZnMsaOd2f61atCd+gzlaF+lnWuOURCh9HufhWCaZQGOFvuEqcYPrUmofjY/cwSHqgAqCZ0rr3L5RF8lE0XTtzZGhtmrLFywdsZ20WH5fWHOCT3v/lZCoIQ0zvpRvUc7p/lkTM+u0zVvcKT5DauYdqVrSNXT16QbUf6qjewWJzs4TsJZYtA4MQK8otrWeChAnjrw9ZTge8dxuAQwB+VWTYrQgTC+et9qZLmfDiylj8RaxNX2SQEjXGpBMvl3Sc/4KZGmmfECHo+gYulskigbtmofJ+SyRmG0OWKEYibi2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Utg/kxiknrbazUwAy4X9kK2aE90Vfh74rFY2+lM90I=;
 b=tYDEugwDJBnskj+Hmdl3IgsOvLUkb9mVMILBp6vfEIjOylJF4WMF2lcGybUze0nM+D12xx1vgg3rS5oYlcTedPZCmdPDy1hI3t/cvEAU23znlb3L/w1fHs3ydGS3BMEaLFPB72EhRBmSwAiA55gmEnUO4tSwk5W4Avh4OS7LgODsqJ7N7RVDn7/Q3efsJJ5gtl6ItfdPY3kxbkvEkrTUcnIPMeDFmfoc7RTuv4tdwa6Rsgl7q1+hAXgWtWvzWmkZNxCvenCDPYoMo5KOJqYpJtbXg9To/g/67PdvJr9TaHYv8p4L7Conk1brDRYA0W9M/DytnBL+4829yhpq9Knlkw==
Received: from CH2PR10CA0026.namprd10.prod.outlook.com (2603:10b6:610:4c::36)
 by CY8PR12MB7243.namprd12.prod.outlook.com (2603:10b6:930:58::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Wed, 9 Jul
 2025 11:37:07 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:4c:cafe::39) by CH2PR10CA0026.outlook.office365.com
 (2603:10b6:610:4c::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 11:37:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.1 via Frontend Transport; Wed, 9 Jul 2025 11:37:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 9 Jul 2025
 04:36:51 -0700
Received: from [172.27.52.212] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 9 Jul
 2025 04:36:49 -0700
Message-ID: <3857057a-afed-4240-b493-99e7653a6227@nvidia.com>
Date: Wed, 9 Jul 2025 14:36:48 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [leon-rdma:rdma-next 49/92]
 drivers/infiniband/core/uverbs_std_types_dmah.c:64
 ib_uverbs_handler_UVERBS_METHOD_DMAH_ALLOC() warn: unsigned 'dmah->mem_type'
 is never less than zero.
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Leon Romanovsky <leon@kernel.org>,
	"Edward Srouji" <edwards@nvidia.com>
References: <202507091808.fHKHlIEm-lkp@intel.com>
Content-Language: en-US
From: Yishai Hadas <yishaih@nvidia.com>
In-Reply-To: <202507091808.fHKHlIEm-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad5ea5a-cedf-488f-7531-08ddbedcef42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amhNaFVCM05BaklGemorT0FmazM1L09DMzZrMXBvMmNiNllWejRnVlZqUGN6?=
 =?utf-8?B?b0I4ZnV6NDhPejNrK0xKMFI0dmVIUXk0SmVnQ1pPSUR5UGFhUDNneDBWU3V3?=
 =?utf-8?B?cTRYeEJxR2JhOE1BMmFodHpmeStYM01sdGtwVzFOcWNOMEsyV01CcXFoTi82?=
 =?utf-8?B?SkdxMzMxMVhvUmlaVy8rUXRDREM1emVCM01mY0RKQm9mZXNyeCtHdDFvTVF6?=
 =?utf-8?B?bjhySTkxVTc3Vkh5aXR4dW1kTGpiNmtPYlVnTS9oY1JEV0RNL0FOMnBBN1M1?=
 =?utf-8?B?Q2JjLysvVGNWd1NDOTBVSlU5Z0lFbjVGdG5FbXRLNTR5TzFuWHJMS1RjUGNi?=
 =?utf-8?B?Zk1NOCt4MTJQbVpZMG9pdnh4cHkzaXZYdkVkZXpJNkZzaDU4ZzNJaEJ4SGRO?=
 =?utf-8?B?cDhUT2FZczEyN0FkeWRFRFVpTFhyNmFMTkhQN0d1Vjk2WEhrZGxGTkFSUk10?=
 =?utf-8?B?SHh5M3QrcFpTMUhGOTlUQnJvSlZuZ3c3TDY0U0dOditHdzhFVTZYWlA4ajdU?=
 =?utf-8?B?WTdsUDlZQVpWRS95am9RTWxtWUFnNkxaZFpwWUpudkg1VVovMTBTUzFZanIz?=
 =?utf-8?B?SWpMK3ZYbm5hZUtxY083NytlNDlxTGNaZzVhb2dWNlgvUEJlTUFBaklmV0Nz?=
 =?utf-8?B?SmJkNjVxbERoQ1VIVjZLK0hnc2hGTDhlQStQVGVaVzlRTzJheEFNMjhHSG53?=
 =?utf-8?B?RUpJbFVvSUV3M3VsS1VobTJJcmx6cEpPMk5xbysrS0JKMFk1cm54MnQ1b3Nm?=
 =?utf-8?B?RzZUdEhhdzg5K3prblhaZkNpSjNZMkVCd1FNQmJLYmpOa1dUN1pJOFBYb2ZZ?=
 =?utf-8?B?NEg3TXdtdjJJU3hxcTZpcG5XU3cwamtGTEpIZXpUZmFIZmw5MlhQancrVERx?=
 =?utf-8?B?dFd5NzNqUkswUFl2ek9wZkZTL05CSElVSDNnbzBXcUVBT2NMWXVPTXFaRm1v?=
 =?utf-8?B?ZXFaU0RTeld1M0UwS3draHpEUDVJNjJBU0NzNDBEOEVrWHdIMHR5SUJYb09G?=
 =?utf-8?B?dXpTTnZTUFFzaEx1eFdtOS93ZmNTSitTUGpUQStIZ3FuMFpESUdtd0lEZEpz?=
 =?utf-8?B?UldUTjQwR2kwRlJGYnRPeENOUmZ6SVEzekV3VkNESVJaT3pyaEIyeGtqSG9M?=
 =?utf-8?B?WDFKNlhncklDblJRUlc2QXQySUtjNW9qVE1MeW1JQks0YmJZU25tamNORUJs?=
 =?utf-8?B?ZDh2cDl2NVpXNzdkV29SUk5jSnlqTEhnODJmTmMveWJmMmwvcGhWU2hzWGs1?=
 =?utf-8?B?emFuSGYvM2FGUXZDQURTL1ppZVVDWjl4UUhjYnZJTHpZUHIycE1Sd2tTL2tR?=
 =?utf-8?B?cUtVRmpualhOL1NRMXViNHA1OVpNZXk4SlZKOVV3Q21VVWJ6T1JlWXlpd1RL?=
 =?utf-8?B?Y0tWVkE3ckFmOU8xQzdUZW5zY2s0VHhlSzRlcTc5aVdvMXFsekJDbzYyV2pI?=
 =?utf-8?B?dWlLdlhnajRoZXlkSEFSb1l4QXpXLzVHMGNyVWkyRGxsWlNtRnJURWlOc1Nk?=
 =?utf-8?B?YittZG5VY1Q5NFowOWZaQTdCRTdSVHF3emdvdStsYVpKU28vSWcrcUxlang4?=
 =?utf-8?B?NHQza2hncnAxTDFNWElkY2RsSkYxQk5nVExuRFFNREMrZXpnM2xVS3NDT05h?=
 =?utf-8?B?dFQ2ZEkrbnlkQVRNTy9RU29XVU5mM3VFcFovY0JLcVBpSDcvOEtsckJBV044?=
 =?utf-8?B?Y1hDcW8vQTZLTzVGSEVRd0p0WFRrM3RnbXBQeDYydFk4RlprQmU3OVAwRWR4?=
 =?utf-8?B?L3BMdERDRTJlL09MK1FwczVteFZ4V0k1R3REMXRsanl0SU0rbmlQMVJ5SDFC?=
 =?utf-8?B?NmNBbzFKQ3Zka2VvNFdqejR4N1A2blFUZkxrVG1sNTFZQk9iUk4rZFd3SHZG?=
 =?utf-8?B?ZFhpdFJGS3IwQkQ2WXlWb3hGcXNIcEd6YmtLRW9mYksxdnFRbnhtK3I5cTVQ?=
 =?utf-8?B?ZzluSm9CSGU5dG94bEhtWjEzcWpkblNIZmpiL2d3alp4NDVGSWJOZGlDZHZQ?=
 =?utf-8?B?Ly9UcXZSWjF5ektmTERGN3FabFNtQkg2WHBvajhFeWlOMXJqSEt1cDhTZmMz?=
 =?utf-8?B?ZzNkNlZxcXF0VXVqZFR4TU92VTBUdU4xYURlZz09?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:37:07.1185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad5ea5a-cedf-488f-7531-08ddbedcef42
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243

On 09/07/2025 13:54, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
> head:   d728d0f17029a7c747224beb83aef0def8b1dd93
> commit: f2ff001b657ae65cde8e4c560990a098284f3b04 [49/92] RDMA/core: Introduce a DMAH object and its alloc/free APIs
> config: i386-randconfig-141-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091808.fHKHlIEm-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507091808.fHKHlIEm-lkp@intel.com/
> 
> smatch warnings:
> drivers/infiniband/core/uverbs_std_types_dmah.c:64 ib_uverbs_handler_UVERBS_METHOD_DMAH_ALLOC() warn: unsigned 'dmah->mem_type' is never less than zero.
> 
> vim +64 drivers/infiniband/core/uverbs_std_types_dmah.c

Right

Actually we don't need the below check [1].

It can't happen as we already checked in line 61 that attr is valid.

[1]
          if (dmah->mem_type < 0) {
     		ret = dmah->mem_type;
    		goto err;
          }

We may drop them in V1.

Yishai

> 
>      29	
>      30	static int UVERBS_HANDLER(UVERBS_METHOD_DMAH_ALLOC)(
>      31		struct uverbs_attr_bundle *attrs)
>      32	{
>      33		struct ib_uobject *uobj =
>      34			uverbs_attr_get(attrs, UVERBS_ATTR_ALLOC_DMAH_HANDLE)
>      35				->obj_attr.uobject;
>      36		struct ib_device *ib_dev = attrs->context->device;
>      37		struct ib_dmah *dmah;
>      38		int ret;
>      39	
>      40		if (!ib_dev->ops.alloc_dmah || !ib_dev->ops.dealloc_dmah)
>      41			return -EOPNOTSUPP;
>      42	
>      43		dmah = rdma_zalloc_drv_obj(ib_dev, ib_dmah);
>      44		if (!dmah)
>      45			return -ENOMEM;
>      46	
>      47		if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_ALLOC_DMAH_CPU_ID)) {
>      48			ret = uverbs_copy_from(&dmah->cpu_id, attrs,
>      49					       UVERBS_ATTR_ALLOC_DMAH_CPU_ID);
>      50			if (ret)
>      51				goto err;
>      52	
>      53			if (!cpumask_test_cpu(dmah->cpu_id, current->cpus_ptr)) {
>      54				ret = -EPERM;
>      55				goto err;
>      56			}
>      57	
>      58			dmah->valid_fields |= BIT(IB_DMAH_CPU_ID_EXISTS);
>      59		}
>      60	
>      61		if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_ALLOC_DMAH_TPH_MEM_TYPE)) {
>      62			dmah->mem_type = uverbs_attr_get_enum_id(attrs,
>      63						UVERBS_ATTR_ALLOC_DMAH_TPH_MEM_TYPE);
>    > 64			if (dmah->mem_type < 0) {
>      65				ret = dmah->mem_type;
>      66				goto err;
>      67			}
>      68			dmah->valid_fields |= BIT(IB_DMAH_MEM_TYPE_EXISTS);
>      69		}
>      70	
>      71		if (uverbs_attr_is_valid(attrs, UVERBS_ATTR_ALLOC_DMAH_PH)) {
>      72			ret = uverbs_copy_from(&dmah->ph, attrs,
>      73					       UVERBS_ATTR_ALLOC_DMAH_PH);
>      74			if (ret)
>      75				goto err;
>      76	
>      77			/* Per PCIe spec 6.2-1.0, only the lowest two bits are applicable */
>      78			if (dmah->ph & 0xFC) {
>      79				ret = -EINVAL;
>      80				goto err;
>      81			}
>      82	
>      83			dmah->valid_fields |= BIT(IB_DMAH_PH_EXISTS);
>      84		}
>      85	
>      86		dmah->device = ib_dev;
>      87		dmah->uobject = uobj;
>      88		atomic_set(&dmah->usecnt, 0);
>      89	
>      90		rdma_restrack_new(&dmah->res, RDMA_RESTRACK_DMAH);
>      91		rdma_restrack_set_name(&dmah->res, NULL);
>      92	
>      93		ret = ib_dev->ops.alloc_dmah(dmah, attrs);
>      94		if (ret) {
>      95			rdma_restrack_put(&dmah->res);
>      96			goto err;
>      97		}
>      98	
>      99		uobj->object = dmah;
>     100		rdma_restrack_add(&dmah->res);
>     101		uverbs_finalize_uobj_create(attrs, UVERBS_ATTR_ALLOC_DMAH_HANDLE);
>     102		return 0;
>     103	err:
>     104		kfree(dmah);
>     105		return ret;
>     106	}
>     107	
> 

