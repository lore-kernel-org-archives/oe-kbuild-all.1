Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2088.outbound.protection.outlook.com [40.107.212.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417A41E2616
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282438; cv=fail; b=bXnRTIpM0WYX+eHq/VmtHBIXRdq+eh5QaxcaHKx2UheZk5LBUcoez3EU1ckaNDHvRc89xXFoUW0Cnf7dqBD7tPA9HpqPSgjhiHZLiOJ05cOkc/7mxD1ajiSD+/ZXggCaA896YP4DluILPvq30AQSjqoRYx92SkJLoRajkILZm2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282438; c=relaxed/simple;
	bh=6PQwG2kj64cMD4oguDsbu4p+1npptq9HTbqPm1C1F4U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IsEX8JEQq4PCMUMgiq0vWvPFKMvmrRdQNBoT4mgSXYHvQtrfIXVSq186zkBQ3WOj7+0Upc0KSLdY7RrIHjHpT/GL6VOD3p7NqPEwaoC6hBNI/2k3ihF+9WuKZbam3yKhQhdt2q3TqGbHqpERzbjLFgDD/yow3DoYZ+ddYHWzOQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=w1H18NIy; arc=fail smtp.client-ip=40.107.212.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="w1H18NIy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBqFb5aoIMN7Jqy3wmtAa6B9dtGCqGS3cG5y91gyl8UjCFLfL14SfEQMQEKg9YzNMgR1lsm467zOPLsKv1f95xb2dRNMxKXr+AWvITZHHBXR6pBD5zprZtncaladyEWR/bUF/iF/kFOphc848qUcVqRzq+BrvoI6IMKdKB7GT1was/BukOfyFV8gT57P5Hh1FnhiQW4T6IO4PPL3Fv9viv7gu9OBWu+GPGCTIfc7no8njrEOYxY1Ssc9h5CIqCYhePSOO2eBYRaSOZ8kdDGpMcVA2RNzXQNbiRzpFeZ9SZeg3JkNGpqVDEw9bNF93Vpt/cnMOtGHu4iy76FIv4ldGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hfiTac7rQ/qu7gJxZoU6W/vgEKJpOPDWlX1xjQg5eo=;
 b=nY2G8VfQfh9WeilFS0p0Hs4owfLyQ/z/5Rh0N1gg03BKHoAfZbTjulz7PiCwaJpkI/JDkfd/OQCrBIYfTvOcms4643v9NYPD4hs1JhbqIo7kOqSz91Y6h9EHEJhu3Z89s8KRWQu4qjKSnOGhROihrqV1JC7Szc7KxnjPXoOIP/LdxxWCD8o6RaCwIncX//PtkxpoG8oAr3vt8waIvNMiUl5cUJs1p2jbGZPisH0IuFgT0c3OhNXVAwrTJFUtozRi067T1YSGzmOIca99ctI0j38prFrvhakFU8u+BJyjybcihGbqfSf90cZ/uaiVGOq2t8huL5sCKzLUpNIXcxzHNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hfiTac7rQ/qu7gJxZoU6W/vgEKJpOPDWlX1xjQg5eo=;
 b=w1H18NIyvGysjZWyFTdHlNTU/SPkCoZdNTtWoyK1ybP2VVxm5cNOrua2aZq53wwAUuduLJ3antv5LsQDwrc/bILIheRiAV4Wqhx62xyIyK1aibKQrfIEEaebqOSzGzDo66nMO9/7Pof1kZGfdRp3Us5TCeJzfVBDsErp1nIoF5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6048.namprd12.prod.outlook.com (2603:10b6:8:9f::5) by
 SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Wed, 30 Oct
 2024 10:00:28 +0000
Received: from DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::6318:26e5:357a:74a5]) by DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::6318:26e5:357a:74a5%4]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 10:00:28 +0000
Message-ID: <0ce691df-4652-40fe-b316-5a70dbb948be@amd.com>
Date: Wed, 30 Oct 2024 15:30:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [iommu:core 10/22] include/linux/iommu.h:1085: multiple
 definition of `iommu_paging_domain_alloc_flags';
 arch/x86/kvm/../../../virt/kvm/vfio.o:include/linux/iommu.h:1085: first
 defined here
To: kernel test robot <lkp@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <jroedel@suse.de>,
 Lu Baolu <baolu.lu@linux.intel.com>, Yi Liu <yi.l.liu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <202410300824.FoaIMuCP-lkp@intel.com>
Content-Language: en-US
From: Vasant Hegde <vasant.hegde@amd.com>
In-Reply-To: <202410300824.FoaIMuCP-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PEPF000001B1.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::d) To DS7PR12MB6048.namprd12.prod.outlook.com
 (2603:10b6:8:9f::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6048:EE_|SA1PR12MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1b74f9-1c3b-4901-6f46-08dcf8c9ae79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejRMUGpsVjY4SlVtS0JQelROc01wakRSTkQySCszeVdnMDNLUUpKNEZUamhk?=
 =?utf-8?B?cFd6Ry9Xb2cwbElXb3drWlVaVkMwcXcybHU0eG5QekJST1AzOHk4ZGEyNFNn?=
 =?utf-8?B?VTlxUVd0QTZIUFFMQ3h1elNwNmFhNmY2NGNtdmNrYmZmSWpVK3NGNVBUWG5l?=
 =?utf-8?B?ckJmd1Y0OUpHcExQS0s0QURZY2ZYRWZzcU5reEFaUTlBK2oyWDB3RmpwT0dq?=
 =?utf-8?B?Nk90amZMazRMbjJwdWxCd0RTZVlLbERVL2J6NStGWHQwalFLSWdsTGxieUYv?=
 =?utf-8?B?KzZ2ckwwRE1KS2VyVmt4LzkrTzJWTG9JZjNGVnZkQThhcG1MK0w5bkUxeWo4?=
 =?utf-8?B?OE8xVERHbXVXZCtjL0hma1Q1dmhYbDJPU1ZCWjBhZFl1a1JiWHdEU3JlUVVv?=
 =?utf-8?B?elhEKzhNZ0RPdTZDODdVTFlSV0hZMVo1bllkeHc1UUZRTFFpWGVBVWRjRmQ3?=
 =?utf-8?B?QjZOTGpsbWphSXloRUhRVVhQelh4WXZ2QXVkYW5idkJySGd0QmRXdEd5Yndp?=
 =?utf-8?B?ajI2VUxpK2RQclVRamcrS1Q1K09CUENDV2d0TG9mVmlvUkZBcGI0VmhyWTdJ?=
 =?utf-8?B?ZGNBSWdjejFpcFdMWWlSRFh2NG40THVvWDRVQTRUbDVoRGZGR1MwUCt6RWpO?=
 =?utf-8?B?dTV6NlRQaGZGellNclFCb3p6SjViMDBWSTd4VC9iQnFMclZjNWwvNW8wQ2ti?=
 =?utf-8?B?bXl5RUVnOGQyNEhZMjJFbTEvOTFHbVp5dzQ0eU1QRlMvcmIzZ3ZmU1pPeGhv?=
 =?utf-8?B?OWxKZTVEWDg0dGg5dmtKa2oxVmx3YjhzR05rOStHNTdCLzd5L0Qwc2dRUTVj?=
 =?utf-8?B?RkhhRnlMRThra09YdnNRVXpEY1N2YlRyZlBIc3EyajVJdS9tbFFuR2R2dE5t?=
 =?utf-8?B?MjdCRklXRFRIN3RMS0p2eTVvdkVNanROdkx6NW02YVZUOG1Od2F6aEZWeDdN?=
 =?utf-8?B?WXdjaERFdVpjQ0haSENFNC8vODU4NVlyQjZ5RjZmZ3V1TXhTYWQ3UXF0ZmMx?=
 =?utf-8?B?Tlg3T212eWQ0bk9KaldnZmlxZHoyeHVHazk4YzhyZCtVckhTMEhrSkJsZ2h2?=
 =?utf-8?B?L09KZkg1U0hhMXZxZHVxZEloS1g4OHJLekdyTnFPcXd0RkxuMlFpZkt3WVlG?=
 =?utf-8?B?dTRlUGd2Qll0cHZFd0FxNXdwVEtNRzV3ajN1R2ttQnZOeHhXQnQxd09MZk1a?=
 =?utf-8?B?Sy9YUDNTOXFRNWhLUkZ6N1hhenBlbjNRY3Z3NENtWnpUYmpDVVVrd1BoUkhs?=
 =?utf-8?B?MlJOT3JzbHpoTE9pTEhGL2VwdzU0TXhWdldIdnRVTlZRV3VPOVN5R21EZ3Qv?=
 =?utf-8?B?V0xOeHc2MjFYNVNYcHpEZnovdVhuTHFraDdlUHFQWFowdTRJS1JRei9sNi8x?=
 =?utf-8?B?SjlNbnlrKy9ZRllqU041MU5jMlNIaDAvYnREekxDWW9KWVJQcW5CbER2NkNS?=
 =?utf-8?B?YUZCMEs5ZG5LUHd6QXY3T3Z1R1hFTWVDeWVqdUs1d0poMjZ1Y0dCWXlGWXUx?=
 =?utf-8?B?b0xPbWw0WUVobWZIcDZlUWJsbnBzQkpJS1ZYZ0M5a0pPaEpNVVZBampKWmNv?=
 =?utf-8?B?eXVxbXlyWTNObGtvbUZOVXQweGtjcTBDM05ta1NOMTdDOS9vTFovTklFdzMz?=
 =?utf-8?B?czFwWGkrTXlzdkpsa3RoRjhCN1VWdE1wb2xGdWRRU09Hb2pQRUtibWl3Y2RM?=
 =?utf-8?B?S2dsLzU0K01GdVZCV21wZTY4VFB3YTdvb05WbVRVV3J0TWhBRG93c3BnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6048.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDFBY0FyTTlIeUJ6ZGVGaFU0T0QxUEFQZnk1bXlWaDd1L2kwdlFhZzZ5bjBj?=
 =?utf-8?B?MFU0S1dwZDk1VkRidXZydmswT0x3VUxoTjdoYUtYY3V6ekE2Wmk3L3hMeU1E?=
 =?utf-8?B?YnNuM1lJb1doSkNJY1ROL0EyVmdiTFhMdkxzSnJkcXA5NDRZMVZ0QVBnc0NV?=
 =?utf-8?B?NU5LL0grcjQwUHUrOE9SMEZzWWlGcnNCbHFFZjNYVDI0MnI3ZFpmYjQ0OFJk?=
 =?utf-8?B?d3l0U3Z1c3BjQzl0OVppaHVhUkFPZDRRMFVjcXk1UmtmQ2hOUEk2QTI5bFpL?=
 =?utf-8?B?WnZyazZJZUJIZUZsQlJOZnFnN3VUa2xoRnN6blVjTDNOYzFzVS91dzl4TlNE?=
 =?utf-8?B?cWZ3dGF0eXp6ZThJRkFVUUU1U3RtbHRpTnptSld4RjlBUE1xQkFLWkVaMjkw?=
 =?utf-8?B?dDlzdVJ2N3RwbU03RkgzVVZtZDFUMFFLZTlmYnZlRStiTktKYmF2VFZXa1Vz?=
 =?utf-8?B?eStiejVsdjZnalFoUis1L1JiYm91M0lLK1JTalZ3RUl0OW4yWm54NGphVTVq?=
 =?utf-8?B?UEY3NWxReWUrOURpT3N4VG1rVnJwZDRDaW94QjdYUUNaVTdZV0lKOUtFR3Q4?=
 =?utf-8?B?SkY3WGpTd3dDYko0Y2FyQXJyTE43dGV0UHFKRnh0TExhcGFXUGVXaGZEaGhk?=
 =?utf-8?B?NmNIS2dKUCttREg4amlZUE9xbFk4SlRWbkpXTUVIc0tZRi8rVklCOFJ6Nzdz?=
 =?utf-8?B?QWR1d1hwZVMzbjJ1SVZUWEMwN2RXK3o2V0VvNjFMZmRvNFZ6TVNaNExPeHM2?=
 =?utf-8?B?MG1NYlpIcnVsYTFFdCtad2VVTHM0TGNqK1dmQ0pMSmZEYU8xN2xDallKNGpz?=
 =?utf-8?B?MUo2QnpITFdoUVBFalRWRFNuSjcyMFMyMzVCc0dsRCtRUkFqUlc3NWphaXR3?=
 =?utf-8?B?dWRIci9RdHcxQ1V5TzByL0VMVjBQZG1HQmorcEJJeng0K0Z4M01WL2Zhc0FI?=
 =?utf-8?B?Ujc3VTZ6anlpK3MrKzBmdVROU21PRW9Ud2VTRGdOQ2hWcjcyWXBsaU5BNWtj?=
 =?utf-8?B?OEYzb2lIUEN0aW1ScDdkRFhQS000SUdndUFaTFlvYWtVMWt6WWNTQ21mTDhU?=
 =?utf-8?B?U2RjeS9LMjRWT0crb3dteE94amc5ZDQyQVlCYWcwT25OYnRldE9RUGFkTlRw?=
 =?utf-8?B?K2JRTkZNaEpZaGl1WUR5VHdlQzA0OGdPYzVKdm9zUE5MY1VPeUhwRzFFdmlz?=
 =?utf-8?B?Wjl3cXdNbWNvT1EyVVJZRnRUWFl0blBPMkF6VFg4NWF6eWxTNEU2RG44QkVB?=
 =?utf-8?B?QTRpUThPeVAvcVJIcjA2SnI4L3JtdnlldW1UbTR3ZFhoUkFyekhzTW05cTZn?=
 =?utf-8?B?SHd3WHdMRVU3aGVTS0FDcEZweWxFOXNtQXR3dEh6eEphdkloSlRxeWZ4UTNn?=
 =?utf-8?B?emxJeHFaRGpxalBkNm9LS1AzT3ZjUmxFUnk5dU50azF3dTBlMXZMNnBMTTNE?=
 =?utf-8?B?SGhmcjczbkV1enVJRkVkTlExbDdMUEJHR0JiaXFVUGcvOW9rTHBtK0J3OU1E?=
 =?utf-8?B?cHpXc2hRaHpJVGhOYWh6aGV1TGROb3lXYXA3K2FsZzJsM2pLd3hlQUVDRE1u?=
 =?utf-8?B?TThjUWNEOXkvbVBaYUg3UzdTUFJsckhCcnc0MVB1bUFkRVh4T3FVWmdUL2E0?=
 =?utf-8?B?bkhqeWNVQldGdkN5V1Z5cmc1OHJmSndIZXY2QjJoTCtNbUNrbGRmNncyQ0JW?=
 =?utf-8?B?TnpRL2VlR0pGSHliaEhmcVErdU5hdWJvdG96MjBGY3pYU1psYjVpUnFJNnNK?=
 =?utf-8?B?R093UzNIVzZkZ1JRaXJReEtBc0RML3NNRW4vVnZHMFpwSURBRUlrNk5FdlNK?=
 =?utf-8?B?dGlXMzlnQVd4OXZIV2tCT2FHL0V3aHdlVmVNU3J5VDRtSGx4Tm91b2g1QlVx?=
 =?utf-8?B?bmgvTWZ2OXYxMEpkVmhSb0RWUENxZHh3SUoyTlpxWFJrcDVFaitvbk94MnlO?=
 =?utf-8?B?M0d5OVJmWkpHYXVtd0ExS0NpYStzaFB2emp5YjhzNGxqSXltVFpBL040NXQ4?=
 =?utf-8?B?Vi9pUzJjUGptYW40bVR5eGo2dnNmdjRxS3hzTGlwSVpUc2xXUE4zYWhRSFNp?=
 =?utf-8?B?czV0OC81cUJqelFSRzd5YkRBSkcyRlRucDdqZi9IVmJiZm1OYVdoMFZjc2E2?=
 =?utf-8?Q?kACuBO5KVoyqRizaSMQz6dLtS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1b74f9-1c3b-4901-6f46-08dcf8c9ae79
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 10:00:28.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssV3x6J75ifuUQYZxVv9OaXfpWDDkoNCmpS/4vAdEbTK0D+KozMmnouWDEwp6yFAcB9NOubjtqLpRkAYc3FTRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5615



On 10/30/2024 5:47 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
> head:   a33bf8d8ce7e06bf0f033865b0cea5887cd2ac8c
> commit: 20858d4ebb423826b7a978d54cde195f51d87e20 [10/22] iommu: Introduce iommu_paging_domain_alloc_flags()
> config: x86_64-randconfig-r064-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300824.FoaIMuCP-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300824.FoaIMuCP-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410300824.FoaIMuCP-lkp@intel.com/
> 
> Note: the iommu/core HEAD a33bf8d8ce7e06bf0f033865b0cea5887cd2ac8c builds fine.


I believe below commit solved it.


commit d14772c0d88c387f881a577aa136e1e9b1291d07
Author: Joerg Roedel <jroedel@suse.de>
Date:   Tue Oct 29 11:54:25 2024 +0100

    iommu: Fix prototype of iommu_paging_domain_alloc_flags()

-Vasant
