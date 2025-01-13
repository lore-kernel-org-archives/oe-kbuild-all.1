Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F346146D53
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 16:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736786143; cv=fail; b=dyYsSAZflf3jwpurpugpmQ6sl+E0e9lRVfv2vgRpOZU0nqxSBa+N8v9+ORUpV4hyEDfsLQWSTqMilhAAPDFepnhMtQtYxU9gF1dkdGu/Dk1OyBg8WVPphIWWnlnKhrtp4p77egAMsjHdbED0Z68dlmaw392hixjnjKvy7PbPDCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736786143; c=relaxed/simple;
	bh=XnOF1TGw0MNki5vxIR+BkhYxw2o0OwDYu5Hh8rxwSC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=szNf6sOmD6ADAcSRPchJExsiZi72ilHeKmmd/3Zh6VrD0we4ljmpGGoCMYJtRkziq62cVwIBkQSLOxxo71UbV+opMNMF+6SrBDYGtQISw37SDRlr4DeYf84i9LLWpoQqgG7+k8fcxUnWtjs6P5I1vX4R3B4k++lVyOGXnTFggzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BJdgRwam; arc=fail smtp.client-ip=40.107.237.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BJdgRwam"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftCwxRyc439vJ6F/MhcauWb5LtvcCiUKVWMu/ZPMXDV+V/Y7uVz85ZsdrnqcqyrnkpIOC6mNVQsd/fbrO0yhrsfJLxwZkr/HWB2di4Gj/d7aJ3wD6VgXDODdF7xtNaZB8vs5UWsgjlPghsBUW4hhXi2RE7lvl7++C+gspQpIuwG030zsufPPKzmJaErxGGK5VG2RHd5JUtXbFygfbHwHtN/T/eRvo53W+XsCAx5Kl4Mw4vZrcoVzUTunJc6Z2jExaopxAkK2lRNkyt7Vw/k+t5mdx9fNqsPxIIAe+8SK00jVom8hwFl0euprly/UZoYW255DwN9ZzDk3ZP8dZclF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw+aV2pkAyJQI2z+rufzCE1mbWTH/ayYcEETYrRl4Ho=;
 b=BcP6KXekvDCKkPXouHz17DE+GuLgM8BJPsEIHiMWdQsZs/GUR69tojkalmTT7BDtAz/q5tVGlXgZz2D1BUUwnrBE+PXeAOci2zmAZmK2L6kV058qlFeM3KuE2+V/4nuXzS4KY2NcY1W+4QZVUrFZ3abL2PLh4EKAaFTI9tLkJ+kI5xYSFYaAWkaAOt85ufKtkuDMummz2hfAMDrLSX6GceyBlcuz9Up4M4Z9LD92QRtXOIDWSELjOZeiXARLDl/GxKxTrS6anY+eq79PPJnIIwlq7Zqr++5aIGPIYoXnkTB814Md9heo8Vo9J1rZPlSG8Q7EFumZs8TRZgPnhPJ50g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw+aV2pkAyJQI2z+rufzCE1mbWTH/ayYcEETYrRl4Ho=;
 b=BJdgRwamfC3cRprzwA0E8n6yZjJ02NnOBWsYGQzIOaEb97eE2OzZ2G3y7zlcFzLu3UwZAsIpLc6kHZJEexPlqwMo8modI+auzeH08z7VkHGrsrJ9cvmd3vwH0z9F0fBr457A/vw3swX0YQEP8XJeDZvsxkRqtYNPumhB+HOjcaE=
Received: from SJ0PR13CA0194.namprd13.prod.outlook.com (2603:10b6:a03:2c3::19)
 by PH0PR12MB7838.namprd12.prod.outlook.com (2603:10b6:510:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 16:35:34 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::7) by SJ0PR13CA0194.outlook.office365.com
 (2603:10b6:a03:2c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.10 via Frontend Transport; Mon,
 13 Jan 2025 16:35:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 16:35:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 10:35:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 10:35:34 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 13 Jan 2025 10:35:33 -0600
Message-ID: <b88b259e-3f95-471f-eae3-076f25de400a@amd.com>
Date: Mon, 13 Jan 2025 08:35:33 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [linux-next:master 5495/7860]
 drivers/accel/amdxdna/amdxdna_mailbox.c:334:52: sparse: sparse: cast removes
 address space '__iomem' of expression
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, kernel test robot
	<lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
References: <202501130921.ktqwsMLH-lkp@intel.com>
 <4b525d86-e1fb-4294-b804-cd065904a409@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <4b525d86-e1fb-4294-b804-cd065904a409@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|PH0PR12MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 6deca9b0-8b30-439a-6d56-08dd33f04ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGU0Z1J6VU12MERSZERVdVpTSkhJS01SQTRIVm5IZGk1TU9yZUhKbmhlcklZ?=
 =?utf-8?B?SmZRYU9NMmExeWZjb2JManF2TnZRS0ZHL3ZXblY0dFMrM3dLQTFwR2V2UXZk?=
 =?utf-8?B?dUdmZ0xhQjNyWng2S3V4TUVGVGJEMm9oTmJ4bVdkYUJaeTc4bWkyR2d5eVZY?=
 =?utf-8?B?NzFvN3RyQTMwY2Vyb2FjbGdlRVdZK1pYRnQ3cmZ0OGNOSW1sek5IMnQrblow?=
 =?utf-8?B?Z1FsMHJEU2J3Z1FIaGVyRUMxWE1EV3RaUWVCV2JjYTZrOUxDZVFMODkxMXd0?=
 =?utf-8?B?dUN4MlNsTmh3NlJxRlAwclhVczJScWdYTXJmSUk2ZEhST2NiVU5KSkF0UEty?=
 =?utf-8?B?UVZjVHdMenJkb1prNkFLYUhCZDhXNUVjYWNMemZ6dWRnQzhOWFA2bUZxbk13?=
 =?utf-8?B?YUFMeUJKYWN0d1BOS21mNmZYNkw2V3lDeHpPUUxwNFMxSFFkeFF0S2ExRC80?=
 =?utf-8?B?TExHa1N2QWtQUU5ndG8rbkZIU3NrUkF0dE5Da01ZK2g0djFBVzNrbldHbmZH?=
 =?utf-8?B?YWhuNVVVY0F4dGo1NEpjMDNHbWVYbTFMQmhDNVZ3UHVWVkEzM2hlM2FrYnpU?=
 =?utf-8?B?enZVQUtoaWJZRUY2V0VPL0QzVEJBQjVLN1AwUWhDcDl0K3JzUnFzTTlTM0N3?=
 =?utf-8?B?Z21Vb2c5a24zaXVVYWhad2NuZEFMNDVxR2pybitZeVNPZ3YyQTQ1S2xWWFcv?=
 =?utf-8?B?RjREMmp6UzE1MktaZC93M0xibmZGYk04a3dsUS9hLytxSUtnNjhHVWZWQkJq?=
 =?utf-8?B?OWZ5ODl3SGltcHNKRmtPRVgrZFYvTXNkaC8xYk04NUFKYm5EU3BOcmZBTlky?=
 =?utf-8?B?NFlHbis1ckp4cFZXdU9DOGU4a3RwZ2NESnQxeGcza0RsQ0tTeFh0TEN3MGNU?=
 =?utf-8?B?c0paekN6SGQ2ZTFSSGdRd21zODMvTG94WXRxWDVLUTJ6Y1VoT00xUDZvTkxs?=
 =?utf-8?B?L0RnMXp3d0k2aXN2T3J0eGFRWjRMUEQ5K0Zwenk5cDArV1ppVFBTOGljTU81?=
 =?utf-8?B?UWErLzQ2TjFEdWQzNDV4OEpsb2YyQjR3NEsyQm1ZamlvdFpVSlBkdHdvcXJr?=
 =?utf-8?B?Wndta2dCNTR5M20rakVxN3dXZGRkSFh0WDVHaG9HZEtIY3NBSDZjMmRGVk5v?=
 =?utf-8?B?cllsMjZqeS96MmZsYTVyS0d0L0owY0JvT1h1VndMbHZpblkzT3JQc05zSTlC?=
 =?utf-8?B?eFo0SDloM0Q1NXpRTERWU2VkQVJLNWNvYkZiTWZTbmhhQmwvcndCQ251WGxa?=
 =?utf-8?B?eHlEdC9ta2NaL2MxZnliUFcwT1h6bmpueGh4MGIybHVUaTI3SDJqb0l2c1Fx?=
 =?utf-8?B?alNCdW9mMWNUOTBybVJjRjlQVUF5dFVpMGd5eS9CMGQ3VkJHS3hoQnF5enBm?=
 =?utf-8?B?UUtXMXlqTnl5aTNDRFZGRUJva00zNitKeVU0QmFpRFdEakpGdFRtVnFoMGw3?=
 =?utf-8?B?TEJHLzh4R0VhaWdLQklRNU8rRVZHRFdTS3ovWkZnWmlJUGJyeG43dTlpaGt2?=
 =?utf-8?B?Yi83OXNERlZscnRWK1A3QzJxdy9iYmxQRHlYc2lNekVnVW1CZ2JkZEkwNmhM?=
 =?utf-8?B?aHhDYjFZdmtTMHdXaXppOVdocUZzeWs4TGl5dCtPdGhHSWtqNXJUTnpuQ3Yw?=
 =?utf-8?B?WTViS3JRV242cEtucGYrNXkrMm1xZWQ2c0NyT2Fya3NENWFVemRjUFdyUWVV?=
 =?utf-8?B?TTNBY2RjaUxKUEZicjJ3VWdOU2kvSFNkMmI4NWdDcnhqRzFUWkxHN1dZSDlH?=
 =?utf-8?B?VlFoS1o4YjZsY3VCQlJuUHJ4bXFSSWhGK2Y3WTY5TXJZU0FIcmYrSkpidG02?=
 =?utf-8?B?Ty9CRVBrZHBaRVY2YUtIVDR3ZW1FOUlXUitUQnV5M0t2dGt4QTFSeXlKeE0r?=
 =?utf-8?B?eVFzckg0NitaTllZSVZzR2g3VjEyRkljUFNJWTN1ZUU3MVI1eG5QS1dvVjdv?=
 =?utf-8?Q?otrEoILqgSdBgGKvydVzSzZ0TTVxXKpJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:35:34.6309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6deca9b0-8b30-439a-6d56-08dd33f04ddb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7838


On 1/13/25 06:25, Mario Limonciello wrote:
> On 1/12/2025 19:21, kernel test robot wrote:
>> tree: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
>> master
>> head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
>> commit: 3c8cfec3fcc4fe53f2bd87ec91ef31df4fa6dc0d [5495/7860] 
>> accel/amdxdna: Declare mailbox register base as __iomem pointer
>> config: x86_64-randconfig-121-20250113 
>> (https://download.01.org/0day-ci/archive/20250113/202501130921.ktqwsMLH-lkp@intel.com/config)
>> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project 
>> ab51eccf88f5321e7c60591c5546b254b6afab99)
>> reproduce (this is a W=1 build): 
>> (https://download.01.org/0day-ci/archive/20250113/202501130921.ktqwsMLH-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202501130921.ktqwsMLH-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/accel/amdxdna/amdxdna_mailbox.c:334:52: sparse: sparse: 
>>>> cast removes address space '__iomem' of expression
>>
>> vim +/__iomem +334 drivers/accel/amdxdna/amdxdna_mailbox.c
>>
>> b87f920b934426 Lizhi Hou 2024-11-18  274
>> b87f920b934426 Lizhi Hou 2024-11-18  275  static int 
>> mailbox_get_msg(struct mailbox_channel *mb_chann)
>> b87f920b934426 Lizhi Hou 2024-11-18  276  {
>> b87f920b934426 Lizhi Hou 2024-11-18  277      struct xdna_msg_header 
>> header;
>> 3c8cfec3fcc4fe Lizhi Hou 2025-01-02  278      void __iomem *read_addr;
>> b87f920b934426 Lizhi Hou 2024-11-18  279      u32 msg_size, rest;
>> b87f920b934426 Lizhi Hou 2024-11-18  280      u32 ringbuf_size;
>> b87f920b934426 Lizhi Hou 2024-11-18  281      u32 head, tail;
>> b87f920b934426 Lizhi Hou 2024-11-18  282      u32 start_addr;
>> b87f920b934426 Lizhi Hou 2024-11-18  283      int ret;
>> b87f920b934426 Lizhi Hou 2024-11-18  284
>> b87f920b934426 Lizhi Hou 2024-11-18  285      if 
>> (mailbox_reg_read_non_zero(mb_chann, 
>> mb_chann->res[CHAN_RES_I2X].mb_tail_ptr_reg, &tail))
>> b87f920b934426 Lizhi Hou 2024-11-18  286          return -EINVAL;
>> b87f920b934426 Lizhi Hou 2024-11-18  287      head = mb_chann->i2x_head;
>> b87f920b934426 Lizhi Hou 2024-11-18  288      ringbuf_size = 
>> mailbox_get_ringbuf_size(mb_chann, CHAN_RES_I2X);
>> b87f920b934426 Lizhi Hou 2024-11-18  289      start_addr = 
>> mb_chann->res[CHAN_RES_I2X].rb_start_addr;
>> b87f920b934426 Lizhi Hou 2024-11-18  290
>> b87f920b934426 Lizhi Hou 2024-11-18  291      if (unlikely(tail > 
>> ringbuf_size || !IS_ALIGNED(tail, 4))) {
>> b87f920b934426 Lizhi Hou 2024-11-18  292 MB_WARN_ONCE(mb_chann, 
>> "Invalid tail 0x%x", tail);
>> b87f920b934426 Lizhi Hou 2024-11-18  293          return -EINVAL;
>> b87f920b934426 Lizhi Hou 2024-11-18  294      }
>> b87f920b934426 Lizhi Hou 2024-11-18  295
>> b87f920b934426 Lizhi Hou 2024-11-18  296      /* ringbuf empty */
>> b87f920b934426 Lizhi Hou 2024-11-18  297      if (head == tail)
>> b87f920b934426 Lizhi Hou 2024-11-18  298          return -ENOENT;
>> b87f920b934426 Lizhi Hou 2024-11-18  299
>> b87f920b934426 Lizhi Hou 2024-11-18  300      if (head == ringbuf_size)
>> b87f920b934426 Lizhi Hou 2024-11-18  301          head = 0;
>> b87f920b934426 Lizhi Hou 2024-11-18  302
>> b87f920b934426 Lizhi Hou 2024-11-18  303      /* Peek size of the 
>> message or TOMBSTONE */
>> b87f920b934426 Lizhi Hou 2024-11-18  304      read_addr = 
>> mb_chann->mb->res.ringbuf_base + start_addr + head;
>> 3c8cfec3fcc4fe Lizhi Hou 2025-01-02  305      header.total_size = 
>> readl(read_addr);
>> b87f920b934426 Lizhi Hou 2024-11-18  306      /* size is TOMBSTONE, 
>> set next read from 0 */
>> b87f920b934426 Lizhi Hou 2024-11-18  307      if (header.total_size 
>> == TOMBSTONE) {
>> b87f920b934426 Lizhi Hou 2024-11-18  308          if (head < tail) {
>> b87f920b934426 Lizhi Hou 2024-11-18  309 MB_WARN_ONCE(mb_chann, 
>> "Tombstone, head 0x%x tail 0x%x",
>> b87f920b934426 Lizhi Hou 2024-11-18  310 head, tail);
>> b87f920b934426 Lizhi Hou 2024-11-18  311              return -EINVAL;
>> b87f920b934426 Lizhi Hou 2024-11-18  312          }
>> b87f920b934426 Lizhi Hou 2024-11-18  313 
>> mailbox_set_headptr(mb_chann, 0);
>> b87f920b934426 Lizhi Hou 2024-11-18  314          return 0;
>> b87f920b934426 Lizhi Hou 2024-11-18  315      }
>> b87f920b934426 Lizhi Hou 2024-11-18  316
>> b87f920b934426 Lizhi Hou 2024-11-18  317      if 
>> (unlikely(!header.total_size || !IS_ALIGNED(header.total_size, 4))) {
>> b87f920b934426 Lizhi Hou 2024-11-18  318 MB_WARN_ONCE(mb_chann, 
>> "Invalid total size 0x%x", header.total_size);
>> b87f920b934426 Lizhi Hou 2024-11-18  319          return -EINVAL;
>> b87f920b934426 Lizhi Hou 2024-11-18  320      }
>> b87f920b934426 Lizhi Hou 2024-11-18  321      msg_size = 
>> sizeof(header) + header.total_size;
>> b87f920b934426 Lizhi Hou 2024-11-18  322
>> b87f920b934426 Lizhi Hou 2024-11-18  323      if (msg_size > 
>> ringbuf_size - head || msg_size > tail - head) {
>> b87f920b934426 Lizhi Hou 2024-11-18  324 MB_WARN_ONCE(mb_chann, 
>> "Invalid message size %d, tail %d, head %d",
>> b87f920b934426 Lizhi Hou 2024-11-18  325 msg_size, tail, head);
>> b87f920b934426 Lizhi Hou 2024-11-18  326          return -EINVAL;
>> b87f920b934426 Lizhi Hou 2024-11-18  327      }
>> b87f920b934426 Lizhi Hou 2024-11-18  328
>> b87f920b934426 Lizhi Hou 2024-11-18  329      rest = sizeof(header) - 
>> sizeof(u32);
>> b87f920b934426 Lizhi Hou 2024-11-18  330      read_addr += sizeof(u32);
>> 3c8cfec3fcc4fe Lizhi Hou 2025-01-02  331      memcpy_fromio((u32 
>> *)&header + 1, read_addr, rest);
>> b87f920b934426 Lizhi Hou 2024-11-18  332      read_addr += rest;
>> b87f920b934426 Lizhi Hou 2024-11-18  333
>> b87f920b934426 Lizhi Hou 2024-11-18 @334      ret = 
>> mailbox_get_resp(mb_chann, &header, (u32 *)read_addr);
>
> Looking through this, why is there a cast in the first place?
> The third argument for mailbox_get_resp() is void *.  Can't you just 
> pass read_addr directly?

read_addr is __iomem, thus the tool might still complain if I directly 
use read_addr without a case.

I will try this and see if it passes the tool check.


Thanks,

Lizhi

>
>> b87f920b934426 Lizhi Hou 2024-11-18  335
>> b87f920b934426 Lizhi Hou 2024-11-18  336 
>> mailbox_set_headptr(mb_chann, head + msg_size);
>> b87f920b934426 Lizhi Hou 2024-11-18  337      /* After update head, 
>> it can equal to ringbuf_size. This is expected. */
>> b87f920b934426 Lizhi Hou 2024-11-18  338 
>> trace_mbox_set_head(MAILBOX_NAME, mb_chann->msix_irq,
>> b87f920b934426 Lizhi Hou 2024-11-18  339 header.opcode, header.id);
>> b87f920b934426 Lizhi Hou 2024-11-18  340
>> b87f920b934426 Lizhi Hou 2024-11-18  341      return ret;
>> b87f920b934426 Lizhi Hou 2024-11-18  342  }
>> b87f920b934426 Lizhi Hou 2024-11-18  343
>>
>> :::::: The code at line 334 was first introduced by commit
>> :::::: b87f920b934426a24d54613f12ed67c03ae05024 accel/amdxdna: 
>> Support hardware mailbox
>>
>> :::::: TO: Lizhi Hou <lizhi.hou@amd.com>
>> :::::: CC: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>
>
