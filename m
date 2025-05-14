Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2058.outbound.protection.outlook.com [40.107.247.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2652A2777FB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229336; cv=fail; b=r7sc9Esl/gtgiVAcBeJeqB1NBpN/+eaeNakAQpf4bYDDbceU/m0gv3BJ9bdjN24ybgSAJTH4DwMgc+IQkFRmPyy1qnq2qKmsugVTE3kzKG0q7AjeIwQ/wjS7bl1FPghF1TNtzk1UWU1gnDnNIKzcsfyrjNn0DNFTyZt5Y94Q82Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229336; c=relaxed/simple;
	bh=wJwlKWgYeiXP1TZ8E7SdTizA9WjKblk540ezn5O7VIA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WKmYcxLqIt4V1eRVEXzXfk6jwGHdobIqhmRBgzA4sRNyZD4EadL0MtsOZg9JNv6/5BY+l29KaraLvBRTSklixyfRsPvecGNDe7RzT1Y3S2xG60mIgV0W08peZdM+ZlQFzy4sJOQqPY4LQRK4lP7t70Gb76TYE6qVCp6UzBweDiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com; spf=pass smtp.mailfrom=kuka.com; dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b=K5AshE2j; arc=fail smtp.client-ip=40.107.247.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuka.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b="K5AshE2j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkOxXZYHWbScJZfudg5JqxlcIAE5abzkFdT1vTjLJ96dhNGUpdOdA93XZskOXojwZJvkZ9NQZmj13u1EVUq+kzhxKyQ8gXs9MNv3xRqqJ2kWcn0wnwUGhtEfiybNyo9vGcn6KeitOJ5umSN/5C5QHYSXtqFogfxnqOHGeWzktCG4R6WlsOHrQsyOygQdtSADrk9ELF74QEei3dWDLLdlCHJZlY/pYfk+ChRnD4Axeaw4HGJYXsKIPP6Q5apabvQpBxz7rWLKsjQq+F3zvngqeo+8BdktrzbJJhwuKRjv/JaggWiJp5fa1+4jqLXzYbl4VzFVnWfISZyE09xXOIdnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJwlKWgYeiXP1TZ8E7SdTizA9WjKblk540ezn5O7VIA=;
 b=Bqbve35a51paxwCKq4FYZlBlpw/LMODnHnXTpV1dMg/vUsxlHF8NdzYTFYvzH9krvDfoFG/d/3PrwChZCmUW+5hm/pwpBbwdA28X3+0GVzBu2Ivi6rwLC+v7A0oMR+fnQwtJgLkjia0iFF9jy5YugiDsTRKpgK8zor6dDTTcbw7K36Rc9QtDuGRIq6JbZwAs6PrPmdstYQmxiSskielERqu18xqEG/XcqqkGtNukrfxb1HjsGl6rObC8uJc72dIM2sY1G2aMHx5LM45vNGU6Fd+QqsmVJhoBI5StJHfWeWUKPU073abtTClvuZQzf+R5045+ks3kjgqcRoTs8NMeoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kuka.com; dmarc=pass action=none header.from=kuka.com;
 dkim=pass header.d=kuka.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuka.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJwlKWgYeiXP1TZ8E7SdTizA9WjKblk540ezn5O7VIA=;
 b=K5AshE2jt9MbXBBAkGZBiZF5om/SKfcCM6m8qC/d9M3nzycoXzA+oyrV1Q3ANvcG++c0kOkYZaYPF8PIJlM4olqEtbtffNbSUGY79MtAXk7XjFRSLIgT28gTzgO9dFPygW5xr/pMwzukZY0CBvpHf/lLoVckxeM5GC3M8qSRUVdnhh7PL+qmQOM6Zp6Im4QmjPYpkucxz3hUW0W9+bFDNhPRH9FUTRAQmyKIz1loKI82n2CJGfauCZ3iGWJ7iBzEup09ZSN/NcolbCUA9P8Bb3ABK1XvwyLWHqHCrO7uwitui3JL+esYzfSxgzWrVcVLYKBzIPg/9dxr03EuBKJMkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kuka.com;
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12) by AM7PR01MB7105.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1b1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 13:28:50 +0000
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba]) by VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 13:28:49 +0000
Message-ID: <63ddfc13-6608-4738-a4a2-219066e7a36d@kuka.com>
Date: Wed, 14 May 2025 15:28:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-new 320/331] arch/s390/kvm/gaccess.c:321:2: error:
 expected identifier
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yang Shi <yang@os.amperecomputing.com>
References: <202505140943.IgHDa9s7-lkp@intel.com>
Content-Language: en-US
From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
In-Reply-To: <202505140943.IgHDa9s7-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::18) To VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR01MB5696:EE_|AM7PR01MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 271dcf18-050e-4b8d-1939-08dd92eb42ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXh4bEgvZFBpemRoSTZ3T3Vmc0t4dHFwcEh5aGswKzFXeExTazVOOW05NDNY?=
 =?utf-8?B?dXRqbFB0ano3aE14TDA2dXV4YkE1UXhZd29rcTI5M3Z2VVlWVlMxR3A2dTZM?=
 =?utf-8?B?TzlCbFlvb3dnZE1FVThHOUdsM3FFaXRkOXFlZWhoRkw0ZTNZL1RvdVBVaEti?=
 =?utf-8?B?SG5sdWxneG9WL2RCMXgvR3NiZGxtQ3BNRTdTUWRaRXB1RXhVSzBPb21tN0Rq?=
 =?utf-8?B?b1QyTFZXN0x3TTQvMGM0K09wSm8yQmtJZmgvT3lNeU9HeHlJOTlaTUR5OG8z?=
 =?utf-8?B?UkIzYmNIbmludDUycllOcnFLZTBUamV3Wnc4ODYyaVVsSkdDMkE1d2RUQWJv?=
 =?utf-8?B?ZmQ2VmtzTWZWditzTENIVVBlUy9MaXhxdEpscWwrSzNYOXY0cFcrdHRuVWNp?=
 =?utf-8?B?d095WnVDQWE1YUZvYWp4SkljVFhKMW9oS1pFSjRKVW11WjVnTTYxRit2TlVG?=
 =?utf-8?B?S1pLaGJZWi9kOFBIZGxJdTMzdHNDelJwVXROMGZUMURTcGRJQmxlQXRKWE9D?=
 =?utf-8?B?aCt4RjhRbGJpeFJZUzFkSFY4ZlhmLzFWZE5Sa2h2YTlDTFJNaGlxSTRKemVH?=
 =?utf-8?B?NGpDOGV2NU1VN1ZnVS9tc1BwOHpEcmNoR09kc3g2MUlHMTAvMVpSRXk3TXFX?=
 =?utf-8?B?VkM2NGhxYlRFUE8vbnYwZDJ5cGFuaDFhVWFTYjRZaE84cW1oRjNILzdqN3BG?=
 =?utf-8?B?YXNjdU5jajg0c3RyaGFhS3p0RHV1cFI4SEkzY3NVY0p2TlN1NmhvUUlxK1FF?=
 =?utf-8?B?ekVOMmRVSWF0NEdvVXhTcVczTjhqdkZsT0ZLei9GdXZKVVlsUkhSejBha1h5?=
 =?utf-8?B?bUVJYzV5RmFUZ2J2ZGRzUzlVL1hjWStMSUptNHZQMG1sK2IvSlhSb0FxQVU0?=
 =?utf-8?B?aytGN1dQREZiVmNHNWhrdFFZWFpSUGorZzVyZ1hFeUZ6RGNYT3RkRVMzNlZC?=
 =?utf-8?B?b2hEWGpyZUg1eXZTcGtMMkgwSmkrWXRBM1IxSVdxczVZNnhDWGt6dEdLSFRr?=
 =?utf-8?B?REMrYmxtOXhoVFhtY3g5Q0NzOTBhUVpvOUNibzVhVElLc2ZkUnJIL2Y3ak01?=
 =?utf-8?B?ZzRmS0FXOGRkcWJaM1dJRExmYWNwMHhtTHBJN1N1WWU5Nm9qZnppZjF5RU9n?=
 =?utf-8?B?Z25yRTFQNUFDRFowWHpNdU9LQjlRRHordXh1T2VmWGlsNjNJOWxvekJLVU5m?=
 =?utf-8?B?RmhmNVhBbnFkOWZmbnp5VFlWTVJJUjIxSVNvV3JMd1c1K2t3eFc5cU5NVWZv?=
 =?utf-8?B?ay9PMTU5aWpzbHNNZFBVSjh6Sm0zRzg3SXhKQ1VPUThSMFgyWHd1YTVMTUsw?=
 =?utf-8?B?TmRqMnA3NUZxTzdXU3ZXUzFQSlh6bEkvQ3dPb0xDcmVJVmFROFVSSHNYTWky?=
 =?utf-8?B?bmxKaVM4bTVzTmY0dHNLV1dvREprS3NoRHR0VUhpYUNiVCtlQUUyMEtoa3F4?=
 =?utf-8?B?bFhRY0ZnRERYMkI0eEozS2pFSjlRdW1STmJmeDVyZ3ByNlRZK1ExSFZsNWVk?=
 =?utf-8?B?WjIrZEpXZnNxODdRMGpCV1ZPeFh0bXlibUFUZmJRNUNMUER4SUlGVlRyOVRn?=
 =?utf-8?B?R2lnNmEvQUUveTZpQlpKTnUxSlRMMktNRkVSQ2pyNHpIaFBqUWVaUkpXNXln?=
 =?utf-8?B?QWxpYVhZWFo0TjFhcXJjak9ER0d5Mkw0bExHV1lPcXhMV3ZuUkZ4T2pydmY3?=
 =?utf-8?B?OGliWG90cjZiVlR1NlN3ZXV0UHE5MVBNbFQxZFVERWE0RVJaZytYb1kzSEhY?=
 =?utf-8?B?ZUI3dWMzWVZsdU5OdEFlQmtpeHg3SC9yTTNyOW02b0xMYUlKcnFydG9Za0Z5?=
 =?utf-8?Q?sSBqsGZRBb7atdJXu/IIrJtyrDLjtRhoJ3DY4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR01MB5696.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b25EdEh0TURGZzg3cjluQVhoQTd3NE9MYkF1ODFpTmRaK29pdTkzUEpCYzlR?=
 =?utf-8?B?S3hub3U2alBWaXU0c2dPbUg2Qmdtb3ZQSFIzK2VvTU9UUlk3ZjhtT01HS3hj?=
 =?utf-8?B?bnV6Z3hQT25YVTB5V2FoNFVLV0g0QW5wSCtkWlQxaUJYMDk5Mkp0ZVczYzNk?=
 =?utf-8?B?ekxLMXJ1Wmx5a3lrNHQ3dFRWZmdnQ3lLbHhtNTl4MGFVaEtMUUxsM1lWY3pH?=
 =?utf-8?B?eSt5ZWR3eW9uaHFoTVB5OGNDSGpIbFJTY0d2TVB4bHQ5Y01uM3YyL0gzNlIr?=
 =?utf-8?B?anRWcXlpaDVNWUNPME5LdXJYdnFZNXFQRnVxbCs4SHlpUkJxaEJsYWkyVlVs?=
 =?utf-8?B?clg4eXZUdjBWMm5NZUNFS1VLTVdzcWJXKzlXN0JEV2VDMjVValhpM0IzeGdL?=
 =?utf-8?B?VFVVc1V1SFRSc05RVFQ5bFplSDFNekRUWERpaWJtckh1WXRHNEgrV1FNcW9W?=
 =?utf-8?B?ZGVIeFY0VjVMem5HaGRrNFdZNUtHc3lxY2ZyWVdrSFU1U0p1Ti9WT2h5ZHk4?=
 =?utf-8?B?NU81UVFOa1NONXMralZydDJGQ0JEUlBPRGc4VkVpeTdRZnZPdnVMZVpqSXFN?=
 =?utf-8?B?TkpZcmEvbWg4K2V4T3RJam1oUmJQUXZ6TGpoUHRjQ1hUL0Q4UHhkTTRHLy9s?=
 =?utf-8?B?Njl3cnNUTThEL1VGa0o5M3JkeUlqc3M3TENDWFVmYTFnaDJZbVNGL2g1RTMv?=
 =?utf-8?B?emVtMXJOWnFvdy81RDFhZGc0a090ZFBTemRnMXdNWnI1RENnNXo5RklRNUpZ?=
 =?utf-8?B?RUxlQmY4Mld2OEsrSzk2UmFxamdwZjJqcWxvbVVpZFJKY1hCak0zemlXeTBv?=
 =?utf-8?B?cHBvRWdLQVlvTnhzY0dRd2RFT29iWDNhaGFENVRqVlAzRXE1VWZ1UFEzNkds?=
 =?utf-8?B?SFZaV2NyTWY1MDJZWlUrYlZ6UHlDU2pjMWNDb0UrRW5MOGQ1Zk1rc1VTMHRS?=
 =?utf-8?B?SGFxZk9KNGJhRXgwT0ErdzFSeEFVVmV0anFTVmJOdEJac1dFVGZoZnZzNnd4?=
 =?utf-8?B?VVZtZ05xbEZGM1ZqUGN5QjBDM2F0MzNBK3hkZXVUSytaR1NsQ00xUEJrb0VH?=
 =?utf-8?B?NmlhaFVzSG9obzZrOENVZzZ4SW03dkpialo5M1VnbW0reDJvUnR5UVpqNlJK?=
 =?utf-8?B?S3p2NExUaGtwUzhDQ044K2Y3M0IvN1NSMDhRTFBOcFN4RE9hemZsblVFTzVs?=
 =?utf-8?B?d2twZzBYYllVNGVrdmVqV3dqZ2hxdjVFSWhJSnJtZUZnMFRNMncrd09uWXFJ?=
 =?utf-8?B?UHhiMUM4VWdOQXVMY04ydHlsV0x2VVMvTmN3SjF4cm1zQW83eWZCU0N6R0sy?=
 =?utf-8?B?U2lVVk5raUR2TGFZKzFsUkZUUlIxUUFCcmJ6bXBWT2RuNlJrS3BRWnQ5dW9E?=
 =?utf-8?B?d2xQYjhaNEphVGozMmNhVGNzNTA0VkxiRHRnMXdocEsyUXpkZkt3azZVSDQr?=
 =?utf-8?B?aFNvcS9JSHpMTWp2dlJJN2ZFTkdnZ0lHbG9XTDNxVGwrYlY1ek14MVdtNDdm?=
 =?utf-8?B?eElBWnk1SERKMlN4UUNOV01vVE9MOWRZcS9LQTBUQlNjQ0ZzTk9SNTl2cEI1?=
 =?utf-8?B?aXlRWEhCMktYL05BUG03S2F2TC9CYzdRcjlBNWRRVUdwY2pzQWl3a3ZjTkpP?=
 =?utf-8?B?ZFo3ZUdNeGJkL3ZXYTFXMDJDRnhvY2NHR0phb3ZGY0RRRFp3OFNtSjZjVGwv?=
 =?utf-8?B?cVh4NWRYNHNtTzRmWFV2N0Q4RVowa0FzQ0YwWU5NdUVxckc1TWdRVkNWeEUy?=
 =?utf-8?B?SWVpd1JheGRaV0QwOHZocVpyM3Racnh2U00zNmlPTDl4ek1MMWRhQUNzcHRw?=
 =?utf-8?B?d29Jai9UQjlBT3JWRS95THpQOWZHb084VWxWRHRuU1p6eTFVbTVHR2FCdjRv?=
 =?utf-8?B?S3JFeDducEp5d0c5WTlEbzVYcHErdE11WmY4UVplQ3dINDRvZFlFeEtQc011?=
 =?utf-8?B?OUpvTU84MmlNanZFTzNteHRHSmtVcS9OcUk1RnBtcjI3NFRHaWxHT01BRHVY?=
 =?utf-8?B?QzhJbHFYckJCd3l3S0VnY3hqZ2VGZkFOTkNqYWpGQ1VQa0VJV1NOeGxtQVR5?=
 =?utf-8?B?OG12dzQ1bVdKNEJORHZYaWZVVTc2a3ZyQVJ6OUMzMGttTkR4TWpjdmhLZDM3?=
 =?utf-8?B?MkFZN0xETWtub2VHR1NZZURvVDVFTjdSbXBGSm95Y2xLY240S3pXUDJiUGgw?=
 =?utf-8?Q?9i7AJfKqkqkU5jJ1X4pTUV0=3D?=
X-OriginatorOrg: kuka.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 271dcf18-050e-4b8d-1939-08dd92eb42ca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR01MB5696.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:28:49.4284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5a5c4bcf-d285-44af-8f19-ca72d454f6f7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttEG8sP32jl8Wj0LR7sEbbfTHdzlncf7e6WIYVYhLZAtEq52TTKsKKlD4tgy61lxoZutbKlqAhUpLRAorQXnL1uAwRHSCQEnNaNvnLy7dyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB7105

Hi,

Due to the line:

include/linux/huge_mm.h:509 '#include <uapi/asm/mman.h>'

there is a name collision in arch/s390/kvm/gaccess.c, where 'PROT_NONE' is also defined as value for 'enum prot_type'.

A possible fix for this would be to rename PROT_NONE in the enum to PROT_TYPE_NONE.

The patch causing this problem was created by me based on a suggestion in the review process of another patch that I submitted first:

https://lore.kernel.org/linux-mm/ee95ddf9-0d00-4523-ad2a-c2410fd0e1a3@lucifer.local/

In case '#include <uapi/asm/mman.h>' causes unexpected trouble, we can also take the patch back... What do you think?

Thanks and regards
Ignacio

On 5/14/2025 3:05 AM, kernel test robot wrote:
>>> arch/s390/kvm/gaccess.c:344:8: error: duplicate case value: '0' and 'PROT_TYPE_LA' both equal '0'


