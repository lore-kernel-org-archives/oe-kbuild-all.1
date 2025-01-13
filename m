Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78930204583
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778314; cv=fail; b=P11787YW8vOU1zJWAaheRyoDOcLdVSGTLFl1+ynJ77hGjtuTpALqu78rLiVwTvVfuZRgdd3urQiMvUoIumtOju9MGQ1T31rRcGP4A5KHvmi5VebPeqYjFILw9jJJ/ZfoqSJLtEZvqZouMukTvWN/I7tpBxjbzBidIj5sb3yf3zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778314; c=relaxed/simple;
	bh=FZ0+sCZnZ4C3VarWnnHNPNqiYMl8suxpGkdI0wfnO3A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ho1b4YdTPIpr1oii8Y7fYHMzrWqb8pSUxEtAUOKIIMi7Ftzx+jwRRPcP+E20vU/gOHv/X7V981Vfud7FT0sWVWrxawKr6OUOsBjL+k1GLOx8zEh1GmPMaoSspxKLHxNLVewhop7UJV7q1kigV1qz0+vuaihznUBXsKHyebRlYdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F8VPh5Mj; arc=fail smtp.client-ip=40.107.237.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F8VPh5Mj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHn6MJOSXJKAL/yWcOh/5NdsNmQwiTMg0tcaeaYjyCMRTMOvWOmNZzU+zURt1WZqDfSpDY5uIZ7xYcCNvSEyE3lG/euqPwD6DCE5Y79p6ZrYhez8wc/MBxDrmAhltKNMaGgCD33xbkNoZG10DliQjuU/nV2hUsxm/LZPEnRuGyMaZOc3x+RvmZ+afP87hgapThg/ig9dK1/q5eokhFLhw2jdganqHuEr4s+jzYBAuYeQmQWQSefMSXoSyjzMA4/eUND0250pCM2kGsn8EP6W6lSeER97AwGHgp6g1/qd4nNehBHCK0wHM2WJ6mzU+KnZDg8sltOSxIn/hP/9saeesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gd6xtVWQgpmmXhz28gm3VIIjdWTvgnd3YRfeQkFZb8=;
 b=t1qT7nvit8kIW2fKhHoNBZBLuwkPk854B7gLg5HNi5yeUYf475aJQqaENI11rOlxQnGgCUVGh0+rFSv9x0hs0RVDN1mU40t8arDcO5TgFUPFV4yqszkC5B9oVaXvnb2luQYKHO5faRn9iAkHurL4cFRem6noAMIIBIiqtgTgpHlWZy+/v2I/yDDMO0tqts7PvYAI65NKI1kBwYZR3tT1q+FwRxMpCNOPDmlvIRFoz+f4r0kOD5JEKxyiiNvCtjnaay9YOOPeoKYwIvM9/O/POAmL74xtjhSj47oU9Qm4kHP1DU5b3NE5Kao02Agft35dIcs49oN7k+9udbOCGEL6Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gd6xtVWQgpmmXhz28gm3VIIjdWTvgnd3YRfeQkFZb8=;
 b=F8VPh5MjloiKs49ceOPU85cpvldVjCpM/cf/ABpYUq2mM+YE/5/KFk37W2iegwRY3G81BAkUKEwPfEh77yGtZZeeXxkfVmz50ltLRPaiv3EIHcj4+JEgYsA17CDpaDhVMJDSx7R+O6V/sLYMiZWydBYXxL7+lJ9xUuFyggzO8BM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW4PR12MB7466.namprd12.prod.outlook.com (2603:10b6:303:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 14:25:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 14:25:08 +0000
Message-ID: <4b525d86-e1fb-4294-b804-cd065904a409@amd.com>
Date: Mon, 13 Jan 2025 08:25:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5495/7860]
 drivers/accel/amdxdna/amdxdna_mailbox.c:334:52: sparse: sparse: cast removes
 address space '__iomem' of expression
To: kernel test robot <lkp@intel.com>, Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202501130921.ktqwsMLH-lkp@intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <202501130921.ktqwsMLH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:806:f2::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW4PR12MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bcbf8f5-094d-40d3-3ce2-08dd33de1521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VktGeklqWlM5eGhqdGQvMHdkdy8rcm16NHkrK1BKZW9ZWFkrQ3hQZmtrTlI5?=
 =?utf-8?B?OXNsSTRlM2NBMDNiTk1LZ1R3elRoTFBUVVFXM3l6L05QSDJDTldIQ3R2SFg0?=
 =?utf-8?B?MmlKaENJVENmVzJ5U2JFT1lmMU00dWhCdHU5bi9UMUZkbUk0YzFsNjZLaXVr?=
 =?utf-8?B?QVIraE82TU9sejRiY0pobzl3TU42UXNvaGJ4YTAyREc5WXF6c0FCcm81RVFG?=
 =?utf-8?B?YnJvMDNUZDFMUWxzMkNRS2pIQTVsOFpHZ0lxTy96WHoyVGhRRlhoS1ZNQllx?=
 =?utf-8?B?UkdORHhlNDNzbysxWHhkZHJMVnVDOFA5blBxSzZINms1WHlYT1RYZHNkYTBv?=
 =?utf-8?B?dnhIZ1NPYW4vVEgzMy9GeldXSHdZRjNrd0FvZUxpM05QVlB6S0pqMU5VZXJ0?=
 =?utf-8?B?ZEJGVDYzV2p4Znh4a1Y5ZnNaNm93ZGEzeFY0R1lIMGdTcUlaR1ZTWnVRa3Rt?=
 =?utf-8?B?QWN0QS9MU214Z2wrR0FCdUFGTzhNOGswa2pML25zSGtsMHNDeFQrZ1lVSHd6?=
 =?utf-8?B?dExiZUxRakR3Y050UlQ2VVFwY0lMRW82MjkzbVQ0a2YwMGkyRlVpV3cra3p0?=
 =?utf-8?B?WkZEWWlaZmpNNXNXOW0vSXNFZlplMWErbEhNSUtnOTRtYVViLy9lQ2JsT0NR?=
 =?utf-8?B?YngxaCtOdEZYUlNyZUVFbHQrSjI5ZWlZaFdQZFNicFFXVW5HaThhQkdOY2Na?=
 =?utf-8?B?cjNqMHNxT2RkSHZ2d3N5ZmU5ekdhUk00cUhPeGJiV0lXbDdwN1hvYkFwcG0r?=
 =?utf-8?B?Q1hRNFRpU0pqNTBWTHo4MExESWV6aEk1RXJhVlI1SzA4cDNaR3YvZFRsY01r?=
 =?utf-8?B?TW5hRFhIbk5GUkU0N2g2ZXFQOXNlOGR4b0FBeWk0RjlLbWpIOVVDS2VRMENZ?=
 =?utf-8?B?ZExyakM1ODEvOUNkMFRkSkdJbzY2c0gwaW15cHpUYXNrWWhpb1hDR29jdXVv?=
 =?utf-8?B?YzZMNlAxRDBkcTM2VEo4dDA1ZE5rcHorbzIvQUl3RC9ZNGxDTWlwbVl2WlIr?=
 =?utf-8?B?U2g5M3JoTkZMUm02b3E0M0QwazFncW0yOEVYZW9mS3dRZmZKU1lKTW9hai9K?=
 =?utf-8?B?Nys5bHZ3SGlSWTBmYlFoSEFsRjFZR1ZCZ0hTcjhKOUdRdmZCakM5K09COTBH?=
 =?utf-8?B?dFV0cGlrZHp4WUFSazMyYS9xcm0vUTZEYW9iM05nUU53WGJiRTBIRzFqcmh3?=
 =?utf-8?B?Z1RFeWszRkx3UzNTNlNzV3RYMjhGVkw0cmFzNDErdDUxeXZNL1FUaS9CNDNN?=
 =?utf-8?B?VnBLejlDUjkyK01NT01Db0twRHZvN1FJSklkeC91bUtkOHdFQmNLRzNJb2Rn?=
 =?utf-8?B?VXZyczFiSnZtVTltemM2ZHhEWDh5Sm16VzZJTktYZmtLUng2QmVhQXJuSllG?=
 =?utf-8?B?TXl2SkhyeEh4SjFpZFU0YnFQWXF5ZTVFUjJTdk9mY1JHV1A2MGpDUm9wT1ZO?=
 =?utf-8?B?d3dwUXdPdjZoOS82dG55N25XSDRZSUZ2OWV5a2NYSWpiNmZNdjN6Tzh0L2U2?=
 =?utf-8?B?ZzduR1hnclZkU0tRWUFpRmJMV0NxT2MvZWFmZE5WSXA4c01jZ0xQL2tjbFJa?=
 =?utf-8?B?SGw4UzhiT2ZCWHlGaDRvTHF5Q1RrZjduZ2tITHpIcHRhZXRWQXNjRFFXSWtX?=
 =?utf-8?B?Sm45WWREUk5vWitHdU9kQWMyTTNjL0QwdnhFdFdQKzJWSVpLMEpzOUZyYUtF?=
 =?utf-8?B?aXBoUzlDRE8wTkR5VGdWU2ZZTTl0bVVWS2k2R2RtVHlGNXBwWjhTaXByTnNW?=
 =?utf-8?B?N3R5VXJwaXRGNnJLS0Foa1lEaVpVN3pXK0pDSmlpYlBVTy9nb0QvZzV3KzFy?=
 =?utf-8?B?ZGwzNElDR2VOMVRwZmdYUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzZDMWszeEdBZUl4OUdLU1YwMHgrSjZVSWplVkI0WCsyZWlZUjV6NytaSkhq?=
 =?utf-8?B?QlR5dGkzSmJjdzBUT3NXWTR1cmNqSzNBL2taUVZnaU9IM1RvaElzRlJiTyt0?=
 =?utf-8?B?MzEwLzkzRlByUmpUdVh2Yjdrc1k1TjB6bEswVWVsenZOcWIyby8rTlkxMXZT?=
 =?utf-8?B?QlFqcTdzS2VDR1g5V1RybGM3ZkpYdk1WYjcxUFhxK0M0VjI3TlRZYkV0dFhu?=
 =?utf-8?B?VU1pTUZrbDgwRm5qSXRLUTh6RkxrdkJILytpMVd5MzdSRmJQSHZpYllXOW1r?=
 =?utf-8?B?blVjK3BlWi9UZXdsLzZHeTRObWlwbXBoNU93S1RVYTdwajQ3N2UxNVBGTk41?=
 =?utf-8?B?c1Y0NG1Wc21vc3JQMDlCaVlzT0NyREQ4VUdiZC9MTDJTS3RlVTcvYWxGQ1J3?=
 =?utf-8?B?ZzdRMi9tOUljRVNtS2dwTWdJSUprcEtLMHh6NWpTL0FXcjBvTkpTNzY5eUhx?=
 =?utf-8?B?YTRjTk9abDV3STRHVi9NUk9aV3VKcUZqdllpSlA4RzJMNFhOdDNVaDl4VFpp?=
 =?utf-8?B?VWxQQnRnQXVkcDdRalJCUFhtNjBmaFhwTlhTMzIvaVdJWWltalF2WWtVTzRU?=
 =?utf-8?B?STl6cFRxMmZYbGFCVnRLTGN3VXduYnViNENsbG1kdmtkWk1yN0pCSVc1MU5U?=
 =?utf-8?B?WTZuV08wQWZjMnBtZDAyMjJjSHdnY2hMTkhZWDB4RTVlNlZJYjZSc3h6SUM5?=
 =?utf-8?B?RHYvWk5YL1Z4OUdDamhUUUY4aDFPZTlrUmJ4eFV2WFg1Wm9kZ3lXYmwydkl3?=
 =?utf-8?B?TkpXaGtZRnN2U2RRdnUveEVIWDhqY1lpempIb0MwMGhkSXYvQXpPWmtiSnc5?=
 =?utf-8?B?bDhPWUxtb05ZNEhBY3lpQ1gzMjVTbSszUlhwVWlCM3dZRU5XcURuOUsxdEJj?=
 =?utf-8?B?czVnODMwL2M3UHlSN3lNYURiWU5nalNlSkc1TWJ2OVRqMW9DVkdZK3J1U3R2?=
 =?utf-8?B?MHFrcHRLRVFBQmtSSzU0WHEvQklMRnUvQVRLbzl2RFBNelZ3VlNEOFM0YWky?=
 =?utf-8?B?R2NHVWM2RlUyVlhsWllkSmdtdE54ZjhST3huZGkwcGZzMVp1dEFKR05nVlBZ?=
 =?utf-8?B?VjNDVXJJczAzTVVqOGtZMkdWcnZVdERxbUtiN3NiM0xhVitXQmN4MXoyNnV2?=
 =?utf-8?B?bTlVakJaeW45blFCallxK1N3VDVqQlBVdmtSTGhaay9NQjN3a3phbVFhL2p0?=
 =?utf-8?B?ZnN3aEl3aGNXSWsybEszbG9aWGM3S1VmZERUSHRzUXFDWDJNRWJMUTVBTVlM?=
 =?utf-8?B?V2tBTkdjVnZEOFJTVUROWm9LNG8rWUxRaFBaTHJkc005eXJWZHNmSzdkZTJO?=
 =?utf-8?B?VzY5K3hPTW1pM2RibDFnUnN1Yi9HUTNPMk1Wem5Oei92b2NqcWxiS1lPSXVa?=
 =?utf-8?B?U3psREY4RmE3WW1KTFM2ek5VYXpmT0hPcjYreEV1RXFLcEErN1pJMU5wYlox?=
 =?utf-8?B?S0I4ZkRoYlE3Z0tWaEE0aS9ZcGM3L1JwY0YrQm10Y010WmxPNkdzSjJncHk2?=
 =?utf-8?B?b2J2OXVNVkRRRWMrc0NxallpZVNzSkJHdFp5NUVaNldaWWlJSTJvTU8rWHl0?=
 =?utf-8?B?NHRxY1gwY3FIOWZELzE4b3RSTENidUJHQWthaVdvcHV0SVB5clYrSEM0bVhD?=
 =?utf-8?B?dy9iVFc1VnQxanFyKzB6cjRucVB4SWZ6NnBTOWRiRWJSVzdIeXd2MHZwR3Vv?=
 =?utf-8?B?UHJaZkpYd1dtS1ZHeGxmWjBOWUxBMmtVRVk5TnFGNmhOUUlMd1cyTG0rS2NR?=
 =?utf-8?B?c3QzTlBlWHVzVXBXMlVMNzljSVRxaUZRV2UrR3ltdk9FQnQ3ekg2RFNWTGM3?=
 =?utf-8?B?T3BsNmE1cW1Zc1Bqam00Wks3aG40L1gxOXU5UWVhNE83aGZEVTZzUGwweERl?=
 =?utf-8?B?ZHo3ZkxOU2NQWWJWZmJDOExQMno1amhrRSswZTdxUEFFdTRxellwNWhvNkRL?=
 =?utf-8?B?eXFFdlg4KzV3TU5tS2Q5Rm1EZ1pCWnpKOWFXVTJGa0Q5bzdtN2twSmVaWEZY?=
 =?utf-8?B?TDgzeDVoUkxEVEJQM1hMWkdSYndoVCtqQnFCYW9mMVh3ZjQzNUJjMXRHaTNG?=
 =?utf-8?B?S2pka1h5STh4UktITGtKSHJ3a0pUSnpTa3FKRjkvQ3VjNHdjNzJZM25nUTVm?=
 =?utf-8?Q?zOn0SxvaYw5U66Y8AJgcoEp8l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcbf8f5-094d-40d3-3ce2-08dd33de1521
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 14:25:08.8405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0opePgCQHWKfK1ERskLcsFe99A3YRnbhCx+tJPUkEKcbY3zWy9zAUuptJAhyRcUuF6wyTfK0YV3sPTRU8/t/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7466

On 1/12/2025 19:21, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
> commit: 3c8cfec3fcc4fe53f2bd87ec91ef31df4fa6dc0d [5495/7860] accel/amdxdna: Declare mailbox register base as __iomem pointer
> config: x86_64-randconfig-121-20250113 (https://download.01.org/0day-ci/archive/20250113/202501130921.ktqwsMLH-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501130921.ktqwsMLH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501130921.ktqwsMLH-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/accel/amdxdna/amdxdna_mailbox.c:334:52: sparse: sparse: cast removes address space '__iomem' of expression
> 
> vim +/__iomem +334 drivers/accel/amdxdna/amdxdna_mailbox.c
> 
> b87f920b934426 Lizhi Hou 2024-11-18  274
> b87f920b934426 Lizhi Hou 2024-11-18  275  static int mailbox_get_msg(struct mailbox_channel *mb_chann)
> b87f920b934426 Lizhi Hou 2024-11-18  276  {
> b87f920b934426 Lizhi Hou 2024-11-18  277  	struct xdna_msg_header header;
> 3c8cfec3fcc4fe Lizhi Hou 2025-01-02  278  	void __iomem *read_addr;
> b87f920b934426 Lizhi Hou 2024-11-18  279  	u32 msg_size, rest;
> b87f920b934426 Lizhi Hou 2024-11-18  280  	u32 ringbuf_size;
> b87f920b934426 Lizhi Hou 2024-11-18  281  	u32 head, tail;
> b87f920b934426 Lizhi Hou 2024-11-18  282  	u32 start_addr;
> b87f920b934426 Lizhi Hou 2024-11-18  283  	int ret;
> b87f920b934426 Lizhi Hou 2024-11-18  284
> b87f920b934426 Lizhi Hou 2024-11-18  285  	if (mailbox_reg_read_non_zero(mb_chann, mb_chann->res[CHAN_RES_I2X].mb_tail_ptr_reg, &tail))
> b87f920b934426 Lizhi Hou 2024-11-18  286  		return -EINVAL;
> b87f920b934426 Lizhi Hou 2024-11-18  287  	head = mb_chann->i2x_head;
> b87f920b934426 Lizhi Hou 2024-11-18  288  	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_I2X);
> b87f920b934426 Lizhi Hou 2024-11-18  289  	start_addr = mb_chann->res[CHAN_RES_I2X].rb_start_addr;
> b87f920b934426 Lizhi Hou 2024-11-18  290
> b87f920b934426 Lizhi Hou 2024-11-18  291  	if (unlikely(tail > ringbuf_size || !IS_ALIGNED(tail, 4))) {
> b87f920b934426 Lizhi Hou 2024-11-18  292  		MB_WARN_ONCE(mb_chann, "Invalid tail 0x%x", tail);
> b87f920b934426 Lizhi Hou 2024-11-18  293  		return -EINVAL;
> b87f920b934426 Lizhi Hou 2024-11-18  294  	}
> b87f920b934426 Lizhi Hou 2024-11-18  295
> b87f920b934426 Lizhi Hou 2024-11-18  296  	/* ringbuf empty */
> b87f920b934426 Lizhi Hou 2024-11-18  297  	if (head == tail)
> b87f920b934426 Lizhi Hou 2024-11-18  298  		return -ENOENT;
> b87f920b934426 Lizhi Hou 2024-11-18  299
> b87f920b934426 Lizhi Hou 2024-11-18  300  	if (head == ringbuf_size)
> b87f920b934426 Lizhi Hou 2024-11-18  301  		head = 0;
> b87f920b934426 Lizhi Hou 2024-11-18  302
> b87f920b934426 Lizhi Hou 2024-11-18  303  	/* Peek size of the message or TOMBSTONE */
> b87f920b934426 Lizhi Hou 2024-11-18  304  	read_addr = mb_chann->mb->res.ringbuf_base + start_addr + head;
> 3c8cfec3fcc4fe Lizhi Hou 2025-01-02  305  	header.total_size = readl(read_addr);
> b87f920b934426 Lizhi Hou 2024-11-18  306  	/* size is TOMBSTONE, set next read from 0 */
> b87f920b934426 Lizhi Hou 2024-11-18  307  	if (header.total_size == TOMBSTONE) {
> b87f920b934426 Lizhi Hou 2024-11-18  308  		if (head < tail) {
> b87f920b934426 Lizhi Hou 2024-11-18  309  			MB_WARN_ONCE(mb_chann, "Tombstone, head 0x%x tail 0x%x",
> b87f920b934426 Lizhi Hou 2024-11-18  310  				     head, tail);
> b87f920b934426 Lizhi Hou 2024-11-18  311  			return -EINVAL;
> b87f920b934426 Lizhi Hou 2024-11-18  312  		}
> b87f920b934426 Lizhi Hou 2024-11-18  313  		mailbox_set_headptr(mb_chann, 0);
> b87f920b934426 Lizhi Hou 2024-11-18  314  		return 0;
> b87f920b934426 Lizhi Hou 2024-11-18  315  	}
> b87f920b934426 Lizhi Hou 2024-11-18  316
> b87f920b934426 Lizhi Hou 2024-11-18  317  	if (unlikely(!header.total_size || !IS_ALIGNED(header.total_size, 4))) {
> b87f920b934426 Lizhi Hou 2024-11-18  318  		MB_WARN_ONCE(mb_chann, "Invalid total size 0x%x", header.total_size);
> b87f920b934426 Lizhi Hou 2024-11-18  319  		return -EINVAL;
> b87f920b934426 Lizhi Hou 2024-11-18  320  	}
> b87f920b934426 Lizhi Hou 2024-11-18  321  	msg_size = sizeof(header) + header.total_size;
> b87f920b934426 Lizhi Hou 2024-11-18  322
> b87f920b934426 Lizhi Hou 2024-11-18  323  	if (msg_size > ringbuf_size - head || msg_size > tail - head) {
> b87f920b934426 Lizhi Hou 2024-11-18  324  		MB_WARN_ONCE(mb_chann, "Invalid message size %d, tail %d, head %d",
> b87f920b934426 Lizhi Hou 2024-11-18  325  			     msg_size, tail, head);
> b87f920b934426 Lizhi Hou 2024-11-18  326  		return -EINVAL;
> b87f920b934426 Lizhi Hou 2024-11-18  327  	}
> b87f920b934426 Lizhi Hou 2024-11-18  328
> b87f920b934426 Lizhi Hou 2024-11-18  329  	rest = sizeof(header) - sizeof(u32);
> b87f920b934426 Lizhi Hou 2024-11-18  330  	read_addr += sizeof(u32);
> 3c8cfec3fcc4fe Lizhi Hou 2025-01-02  331  	memcpy_fromio((u32 *)&header + 1, read_addr, rest);
> b87f920b934426 Lizhi Hou 2024-11-18  332  	read_addr += rest;
> b87f920b934426 Lizhi Hou 2024-11-18  333
> b87f920b934426 Lizhi Hou 2024-11-18 @334  	ret = mailbox_get_resp(mb_chann, &header, (u32 *)read_addr);

Looking through this, why is there a cast in the first place?
The third argument for mailbox_get_resp() is void *.  Can't you just 
pass read_addr directly?

> b87f920b934426 Lizhi Hou 2024-11-18  335
> b87f920b934426 Lizhi Hou 2024-11-18  336  	mailbox_set_headptr(mb_chann, head + msg_size);
> b87f920b934426 Lizhi Hou 2024-11-18  337  	/* After update head, it can equal to ringbuf_size. This is expected. */
> b87f920b934426 Lizhi Hou 2024-11-18  338  	trace_mbox_set_head(MAILBOX_NAME, mb_chann->msix_irq,
> b87f920b934426 Lizhi Hou 2024-11-18  339  			    header.opcode, header.id);
> b87f920b934426 Lizhi Hou 2024-11-18  340
> b87f920b934426 Lizhi Hou 2024-11-18  341  	return ret;
> b87f920b934426 Lizhi Hou 2024-11-18  342  }
> b87f920b934426 Lizhi Hou 2024-11-18  343
> 
> :::::: The code at line 334 was first introduced by commit
> :::::: b87f920b934426a24d54613f12ed67c03ae05024 accel/amdxdna: Support hardware mailbox
> 
> :::::: TO: Lizhi Hou <lizhi.hou@amd.com>
> :::::: CC: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 

