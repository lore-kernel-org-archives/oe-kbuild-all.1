Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A0A53365
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747167640; cv=fail; b=bYvf405tHmq1XHYmVlzaFHJ+yJ9vKs+TgCRE6fu82Q009UdyBp3hlBEZcKVLMwHlSU99wd/hXxR4e0pGkhieFLUtV9NbdI0pvEG8QDxHeQVUnL1020VJP7bcKRkxm9e2Ifq/IUn0ANPnLTcCDazOXTGaTBLV5wgqXYjijaKgf48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747167640; c=relaxed/simple;
	bh=QYa2gcHj68SXoSmlwKGp1GXwqXplsPaPmbOjXoWjl8w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LKwCbIOscB6uMTL4rJKw5RdW3WszePSVYh8jU+kM77NoHTkEAE/NjRJIu3WRL+q++dvk4gnfCRsnah7tm1bbZyj8tcNEv0F61kb1LDqwXWWhraOnYXl8UaDYPlJTkZFt+q6AY90R8XuJeXFI3A/7P08r6xmHd0yP2um7y0C7wls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dfF2NJQ0; arc=fail smtp.client-ip=40.107.92.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dfF2NJQ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVlYeJvrelx23xtzwzGg3rvkLITkp8dx+/f9ACUyPfrInjLLSCeaxBNAFFZ1NxzkiPSL36KjgsxU5KYLcQfopQS8HOTVXwsGqqs5ocLYd2oGJS7LfAf1925+KJ44TGy95KhaU38Q+P3TUZWmXAr/Jsfpc1c7wnpCNLLl6vVeajmBwLDNM7rbduGr9HH5Dc+jjzfOOHKjMzXzAMoZ12TTwTrM/WfiT0j5jgAvW3jqY332tvgX1eVaC4pTkiJWUNtwT2iDFlq00NvBHQTIapOVPCZARepJjr6xnOYGCcct1N8ppGvXYXvRjM/e8icZHAuZIBYbdZ+7cxJHFS7JbYUJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Plw7Ff5Xd6toz17eEEH8ubBL8bjg8iWgvzOiDak2BpY=;
 b=AHkaN3462wkGD0+GUlJ9PTEsVo2c4Ap1PDECkEevst2fojQSUxBA3a2QS/JGfdQbqTIJFHojKOq49AQ95OxolIoqqdEUNAOnE2h51CaI1sjwwkB8QCjzxyT7LM3bWmGZ6DtsC/WAtqdg/fYDYJcM4HQNvgA0Q16pAsIgAiReoluJiN+d5uYdkmEEvhaGwHBr3IME45inep0QYAwGkBr3QStijy8hTX3Pckuz7OmX1mQer13xlJvwYWM/G1LIccotdDOI5NmUmpJeY2MXbVgvDq5Adm5804xXuUzrHAvaPSz/pavOHuNSnw6P9mlRyWdAFe35klEpBCZZvyMdFzdSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Plw7Ff5Xd6toz17eEEH8ubBL8bjg8iWgvzOiDak2BpY=;
 b=dfF2NJQ0vR0zIyoJ7GVTi0PNPdwo9qBxmbBfZcIdgnCUhgKDOBkh+h3Ax7AkGKVp/d8BrhXAc0wOjsNoVHmbxO40CGaEA89vOQOogGPKLyae4EvxMMlCgK6UOZ058uiJ0J9hLn0m9BEg7JMj/Fa//T1owT5fDzGQsIT/PH+CTPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA1PR12MB8643.namprd12.prod.outlook.com (2603:10b6:806:387::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 20:20:35 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 20:20:34 +0000
Message-ID: <8254f2d9-0478-4161-9f2c-3745e258c598@amd.com>
Date: Tue, 13 May 2025 15:20:22 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v4 5/8] x86/resctrl: Add user interface to enable/disable
 io_alloc feature
To: kernel test robot <lkp@intel.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, corbet@lwn.net, x86@kernel.org,
 hpa@zytor.com, akpm@linux-foundation.org, paulmck@kernel.org,
 rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, thomas.lendacky@amd.com,
 mario.limonciello@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 riel@surriel.com, xin3.li@intel.com, xin@zytor.com, sohil.mehta@intel.com,
 ak@linux.intel.com, ebiggers@google.com, andrew.cooper3@citrix.com
References: <963710cb374d55856053989e4edc61d7fd033662.1745275431.git.babu.moger@amd.com>
 <202505071703.3upyWMIB-lkp@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <202505071703.3upyWMIB-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:806:23::6) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA1PR12MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: d4108a1d-9caf-4bfe-e88e-08dd925b9dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3NNcVZMMkYwOW0zQWd3elNBUjZDWXBnM3F6a1dBemI1VXEyNExVSm1wV1l6?=
 =?utf-8?B?cWVCV0tWcWdZQXJ3UkFkS3VsdWxSc051MlFpQUY5UlFZeFQzdDN2eE1kWGg1?=
 =?utf-8?B?QWhGeVV2ak96enllYXVOY1FpZlpFZldvUEgvK05BSFlVVXNxUlZjUVJNWE94?=
 =?utf-8?B?ZkhMdkdpbTJJdUtyN1dKbnREaXNoZ085TjdVMFN5dlIwak1YQ0lQSTFObi9V?=
 =?utf-8?B?cFdlVktWTUdDTlhZbUticThkQUlFZEhzSmh2NjVkY2FsRnMyRzF5Q2ZhWk85?=
 =?utf-8?B?Z21iM1Y5NkEyc2ZnT0Zxbm5IaUhDcHlJbE80WVVkcTJnWHBkSTRpR2RWRDk5?=
 =?utf-8?B?dnlHLzBGN3BLT2FWVlptNmdBM2ZrS2ZZYzFXcy9nMzQ4dUNNaklOMGRBU0tX?=
 =?utf-8?B?a2pTWE14OGxZdktPdWJvOHljbHhTZTlrRjBpS2ZRblFhQkdEY2NtS3kwdGpJ?=
 =?utf-8?B?bXc5Z0xDdldHWDJyWFE3NVFlaXJmZVFhMGNiSklyU0VEM2w1Um0wUXNzS1NJ?=
 =?utf-8?B?OW5iMjA4eGZCOG8zT0ZVeWJNeExaY0NobWFSTllOMGpya1lhekVhOTJIeG15?=
 =?utf-8?B?MTRXY25Xd3JWRTh5K1JkS3NvSFRJL3lLZWRBOHFyS09lNXNrMDFkNGFyWVNW?=
 =?utf-8?B?bnhLM1UxR2dRUUFFZm42VjQ1VXdtUHVGTk9FUlgzMVcwY1Z5YTFld05jZVhq?=
 =?utf-8?B?UzNKT1U2SkRIN2s1WVFwKzNZSU83NFhLUzEvYy9YT2RxTnV4WURhbnZlNzlC?=
 =?utf-8?B?MzlaelBPMzc2WDFnUkpqWFovTitnUmx3T0E1ODRtd0UzR0dsVjBiWGtlQ2xY?=
 =?utf-8?B?ZTZVZFQ1SW80MlNLMDlYY0oxb3BIOXk3MW05VDVnK0p1NFlQenZQWERPU1Zu?=
 =?utf-8?B?akFLdFg5c0JEZU9UTFNBNU5TQkNNUitiVmtiY09GS0xCbEFlUmFUMWRGWFZD?=
 =?utf-8?B?dExQdWVvcm01RUo5MEdqMnJLN1FtMkRSWUJYR2RZS0EwUTZSVXRxSE9EeThq?=
 =?utf-8?B?dUNmUUxZK2NRTzFodmZWbXpwUHBRa2pRUkJMdWM3OHVDdUo3dHJyZ0pBVU5G?=
 =?utf-8?B?OWNLc29EcWFyek82QXdsdUlGbTRISGl4R2ttMmdVbGJ6bVFISmZBcWwwZzBW?=
 =?utf-8?B?NzY1bVBsWi9EY1ZZOGsrMXFRQ0NPcGYxeGt2Qk5GN2JHUmU0bXlDbHY3cmR2?=
 =?utf-8?B?RWJQU2x1bWFtNHJSSCt4N21uSDJvVFlVdGI5RzU5NDNjbUwzNjBacUE4dUZ0?=
 =?utf-8?B?am4vMFlINHMyT3FGN0E1cEljMlQ0clM4MCs1bkoxSHBEK0t5d0dJZUgwNXN1?=
 =?utf-8?B?OWdxc1Z6NkRUQlZORy9ZUkZCZmhxWDJvT0hDbzBUVjBMNVVmT1RwblF6YTFy?=
 =?utf-8?B?aFBsQ2g4bTNEOUVid2xPQy95RCsvYkNFb1hPaEcra3UyKzkzQ2x6bWJucnhE?=
 =?utf-8?B?VTRTNWZjNUd2N0JCTzgvMGZrdEgzcXMyZm11cmErMCtSZEFaajA3eUhTcDM4?=
 =?utf-8?B?eGFiSHI2ejYzcDRRYlRWWDFpWFd0dUZKS1dXWms2WmRkQ2ZiMkJNVDZ3S2lH?=
 =?utf-8?B?MjNmNVZveXJ1MFYwTXUza0s5UDd2Q2JGT1I4Q1ZuWDRucXJ5dFp4dU1wY2JS?=
 =?utf-8?B?ZDBpRUFvMklKTGdEUmRzUXpjYmVqcEoyS25aNm9tV1VoTXg3YjlHbGNmL0NN?=
 =?utf-8?B?b205Q1NVME9tVzBkUXNubWVNTytKVDNyamUzUEVOUS9NVE5qM3cvMUMzL2Q5?=
 =?utf-8?B?L25XTkdvVDB2Qm9RTUlySEF1KzN4RmpDaHcwNGVGWlE2bGd0U3JBcnlYa1ly?=
 =?utf-8?B?MkZEaGx3K0ZMZzF5MStVYlN4L0t0dC9raWw2ek13dFBwN2xXbWUwZW1JY3Y3?=
 =?utf-8?Q?RZnIYKHlNe5nJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dExXQ3FUNkF1Ykd5RERFMVRGNWhUdHdhWldwRlh6bFg3NDZCY3MyWHRRT2V0?=
 =?utf-8?B?emI2WDMxR2JuYUorUys2emtTeUg4anV5ckxiTTNhVHNsUHFOai9aZ1IyS2VV?=
 =?utf-8?B?SXlkSnJTRjcwUGU3alZTUnJ2eGIrdENCUlcwRHJUZEVPNzdDV0UwTEtKc0to?=
 =?utf-8?B?NmZvQzBNeXMraVMrYmxnc2t5Z3hVK09LZFdmaTREZ1NQYmtlU1ZlMWk5cjIr?=
 =?utf-8?B?TGxmbjBaQlhIVGwxUThFRjV5RU5jajI5TUVUT1M5WWVtUEtHeWJwOEtzbU1m?=
 =?utf-8?B?MGlpVHhkMXlscjZlbnFlbUxpbEpkbUNyNGtYMTBUU3hMWEd3bTFDUmhJcGRF?=
 =?utf-8?B?NnptZjVJS1lOZ2hQS0R6OHhUa01MRVhIWm55OXQxN3J4bVFWckVKMDg3YzB2?=
 =?utf-8?B?c3BqTDVEQ3ZQQUtxSGhOaUVzWGEwQWtCOVJyS3dwMDJoNFBzVGhCQVVxUlBa?=
 =?utf-8?B?djB1YldtYmVnY0lpM3VmY3pIbFRGeGE0TXJtOTdlYmlVNkJuWjc0ayt6ZUlt?=
 =?utf-8?B?eFZxbFBXakZJZ1QxVlJJQ1RROUZCRGkyK1RCNUdiQlVweElZZkJKeGpDTDk0?=
 =?utf-8?B?Z2IvWFBlZXlGNWJoQ1FyeWg0N2VkUnhzbFZqQU1YQlp1S3NuZ0FBVW1uNVJU?=
 =?utf-8?B?b3g0TVdVQ1V4TzZJZk0yUmdnaFJyaXFZbTh2L1U1Y2xUckNFNXhiVjFmazJm?=
 =?utf-8?B?bm54dkFUWWE4YnhnZFloa2VYdnkxQ21Dd1o0VTFESnlKUWo0YnJ1WkN0ak0w?=
 =?utf-8?B?K1J5Szl3emQ2RUpiN3RyVHJsZzZtZEdpYTdrOGNIM1cxZGJ6SlE5NXZRY0Na?=
 =?utf-8?B?WG5OYnR3TkRSTUFaS1lwQkZiMmVuSk9vb1haWi96ZXhQZ253K0lCQkE4ZFR5?=
 =?utf-8?B?NTRFMTNEakQweXZ0RDhyc0xIOW9RNDZ6YUFXTHRoOGo0ZDRmRGV0V3VDYXJW?=
 =?utf-8?B?T0p1cmNkMnRad2pKVTl0M2ZxTlJNNEc0anpxMXNQNDhQTU5FRGtaOVRTaXZW?=
 =?utf-8?B?U1l1YThsbmVMMW1Uc25UT1M5M0NXRkY5YTduSHNaWmpRUEpNTDRSK0tETHRQ?=
 =?utf-8?B?b3hUNHhzMGJNbXA2RlRObTZiSnloSTlvaWt2RC85Uzd6Q01JYUJYb1Z4aDFh?=
 =?utf-8?B?RTY5djZnaVJwVnNKbEczWFlnWGFVai8rNHZzczk3QTl4dEFjaUxYNDVrZnp2?=
 =?utf-8?B?a3BOVXZ3YzZwSU9tWlROdGsxbG9OVWJSejJGZVdaSmNzdlRwdVNMSnlrdU9E?=
 =?utf-8?B?c3BidG1tM0J1aFgyZHgxVWs1Q0hwbEY1azdxeFR5S1dRdXg4OW9LS2x2VEhD?=
 =?utf-8?B?cGp4bjQ3a1pRSktweit5b0hMZ3AwdExla1pMYytzdkJXZzhtam5ROHhYYksx?=
 =?utf-8?B?RWF5V1ZXSjJyTlVCT2lobkFFZkZzVDlJUFRuMjI3ZkJTcGdyOVAzajd1OE5s?=
 =?utf-8?B?ZDdjbmZJTm9tZHFiY0tjM1dVUXBPVFBVTC91RThrMG5vOFBjeENvTWFZcklt?=
 =?utf-8?B?dVRSaW1iUVpYMjR3WHBSWDM0aU9qY3A4TzJkUnlsUEhWK0pxWHBNa2ZacUt3?=
 =?utf-8?B?WjdHTW8yZnZDbFFHUWpXMVF5S0Q2UFdsTWtUcllNOG1WLzQ1bFZLdnErODky?=
 =?utf-8?B?OWlUL3IvcjFOUGZ6cVQ4UVh3ZmRENEkrU2p5bjZwV0tUQlo2c0ptajdxZ0h2?=
 =?utf-8?B?bjRxQU8vRER1OThSYU1xTzdyRWpnYjE1S1VMYjdPSGJFY0NBM0dEZm1RMXMv?=
 =?utf-8?B?eW9pZ3RvRG5NM0YrdGtQZEZlNmIxaGZJNzN5ZkozZ0lCTFBVVlNpbUNHN3ht?=
 =?utf-8?B?WDNnTXVldWRubHN1WHp3Sndrb0s0RnpJbFdGa1gvV1NBYVZ4eHVSNUZwVGRW?=
 =?utf-8?B?aXhXanhIditDZUZNY2NXcTlyK3hMdmN2bkpLRTJkV3RqQUZBdlZ1Y1E4TlFo?=
 =?utf-8?B?cExYeHBVZ2dCbUhDNTdCUDZrWHdCYTNwMlR0ZUNoRm9SOVRxNVcrb0FacHp0?=
 =?utf-8?B?RUt2S0c4QkF6d3cwNUpNU2pPQlQzWUpYUHlyZFlkeWxQSWFMWG01WVh6cGgz?=
 =?utf-8?B?Q1FyTkRPbWlSZ24ra01Gb3R2OFJhd3RlSmkrYXZBS1ZJRzNYNVAwWlBFbG9S?=
 =?utf-8?Q?uNYM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4108a1d-9caf-4bfe-e88e-08dd925b9dcd
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 20:20:34.7819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2m/cgZw2uLjtNZ9MZio0DKxgzwEeYfn7zSn2dMx3cND5WwjQJN6R9ncelzdSp/t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8643



On 5/7/25 04:30, kernel test robot wrote:
> Hi Babu,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.15-rc5]
> [cannot apply to tip/x86/core next-20250507]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-cpufeatures-Add-support-for-L3-Smart-Data-Cache-Injection-Allocation-Enforcement/20250422-064804
> base:   linus/master
> patch link:    https://lore.kernel.org/r/963710cb374d55856053989e4edc61d7fd033662.1745275431.git.babu.moger%40amd.com
> patch subject: [PATCH v4 5/8] x86/resctrl: Add user interface to enable/disable io_alloc feature
> config: x86_64-randconfig-r131-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071703.3upyWMIB-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071703.3upyWMIB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505071703.3upyWMIB-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:1975:42: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const * @@     got char const [noderef] __rcu *name @@
>    arch/x86/kernel/cpu/resctrl/rdtgroup.c:1975:42: sparse:     expected char const *
>    arch/x86/kernel/cpu/resctrl/rdtgroup.c:1975:42: sparse:     got char const [noderef] __rcu *name
> 
> vim +1975 arch/x86/kernel/cpu/resctrl/rdtgroup.c
> 
>   1968	
>   1969	static const char *rdtgroup_name_by_closid(int closid)
>   1970	{
>   1971		struct rdtgroup *rdtgrp;
>   1972	
>   1973		list_for_each_entry(rdtgrp, &rdt_all_groups, rdtgroup_list) {
>   1974			if (rdtgrp->closid == closid)
>> 1975				return rdtgrp->kn->name;
>   1976		}
>   1977	
>   1978		return NULL;
>   1979	}
>   1980	
> 

Thanks for the report. Will take care in next revision.
-- 
Thanks
Babu Moger
