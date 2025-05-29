Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A519B3EC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 03:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748490380; cv=fail; b=Hu/2rB80vQq8dkx4I4osR6AWPxA9ydkXvOVd+iAhhOnDYyCN5Zja2lp9gKE3Xk8GYSmbE0kpt+eslbwLl29Kfgj8g35HYTfRNKZZIpovHgmvjzYUPiLbUSkblHoxs6XrXVUNUBZXp1Zh0PMkWq0U2dE42L1/6YoqjkvZp6GdKpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748490380; c=relaxed/simple;
	bh=rgK/7DEnmKDfd9Jdn4uveve/UeM2LokyVO7WArCvQIw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LqKGZxIhaC1+JWbeuWRZCE+zWgCu7lWHdexHUdpHDxZaSI1OrkcjDT8yFYBx7tk4sj+FXRY014F4fwVnnMlnBsgIVhnDNtIldIhl5m9NYJdb4x2OueArvwD7uIXDUo7pYkIkWj4zKIm5ibCRpVnAky6TGYvolvh5z+3ENDJFd2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bAocVsXY; arc=fail smtp.client-ip=40.107.94.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bAocVsXY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAtePt1gf2UpZOVwFXt48RVwfKrcXqXxayWF1q5gHGVBVNUf6IJzqMznzm+7wgZUzWmHr84nXgSyEsIOWsI1htmuLWStUaGr0ViycCMXrAr5hdSGs2RrAXAVuEdmjWXTnvnqFxFcMIqI5Zf0ElDeHkIxYdH1XwIatuKIwQGoMvdJdhDLg0qErFrIO2HaQFc0EBJBjk/L7941Og5hJxeHNDb/MosV5eSYIQFK9EjTCF2aeRR2eIeWybmEUFd8nM1J9GBRAIdKw3DGzBuzJwDHwqCYstZMXi/QZ6JN9g/2wsvoaviKSfHu6D5QrBaiZJZLBQ6/3R0W1IJo5iCmhVgLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7M8OkhZEFdGIC2FW9VcOpC6XabGdjoUqJkBiOdcezHI=;
 b=Su4qT2FeshaQU3E8JAUVE6feRYHJWj2RKgwiF7rEKA0WYcjaO51lxnuLMpb5rk31fEWrAMkqW9sv9iWA4rILAKSiMyAwHhtgCOWhXiLC1jzIqAedYFE4qnaoMe3Sycv4f7CuPb9MWGeOlhM23YYKxjcCuZa6RKroli1MQhXiiBeLSM22VeGYQ5qRUymPLN2ny1MZeHbXeRHu62wg440FoXaVOghrvW00sQnxfr5AXN4/ZyCtxJNJz126+2AlkW3CTNo95MKPrmJxeCao/oMvWgck/84gV7eAN99TFkvM0TOm2QwW0D+O6o1vun3ebz+eWUnQBOuT6dLj/ytZkWR1dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7M8OkhZEFdGIC2FW9VcOpC6XabGdjoUqJkBiOdcezHI=;
 b=bAocVsXY341R0G2qZyLwliRTP7KPURf8WxrAXtU8rpex7xX39LBPkSre9i7gGUIe+TomL/Zo9pwdcbaexfSvqXZ6HRqQ09MI319fLypm0+XGhLXYdQ725yWjOVutNsDQ1Q0I2tnH9Wys0uru2Lgt1/SpdG5H05fVNdQHm1Gaz/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Thu, 29 May
 2025 03:46:10 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8769.019; Thu, 29 May 2025
 03:46:10 +0000
Message-ID: <2a1e37ab-d9f4-44ed-9833-edb06f420388@amd.com>
Date: Thu, 29 May 2025 09:16:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 36/67] mm/khugepaged.c:2337:7: error:
 implicit declaration of function 'folio_expected_ref_count'; did you mean
 'folio_ref_count'?
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
References: <202505282015.F0fVmLmH-lkp@intel.com>
 <d2ddc44a-19ae-4e4c-90a4-f4ec05558d74@amd.com>
 <20250528114441.abd8980f1d66fcb3e1eaecc2@linux-foundation.org>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250528114441.abd8980f1d66fcb3e1eaecc2@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0042.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::12) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a1835c-b35c-4dc3-ba52-08dd9e635988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmRsSVNCeDVYTDhUdXRjbElDckZJa3hETHB3bGdwWlRVRVZiL2h4bHZyYXZ6?=
 =?utf-8?B?b2NZbjRRSFMzdFI2dTM1ZWFGWTRNOU9VNlM3cW9BR0ZWNU9ZMFZTK3BXRnRX?=
 =?utf-8?B?NWppTmxHbEtGK1p6cFRMbXNwcUNheUI1bHRMYVRsbGdBNE9EalF1WjRDSlpI?=
 =?utf-8?B?RVV1aHNmZnY1SEt1Vy9wS1p1Z05BM0EyYmZ4ak9KNzQ3NlVZaG9hanBQb1RR?=
 =?utf-8?B?YW5XUkNVR2JyczJ6Mm5iVjNEZ0ZScW5wWk1sZk05OW1tZkl6VGp2d3ozeUhU?=
 =?utf-8?B?ZGpMNWdpb0hYL3R6Mm9wS1RZMHoxV1phTS9ReU9qWTkzbzdlbXdvWTkrNm5T?=
 =?utf-8?B?aStQMDVFNEVjMUdoOTQzMm5mT21NeXFqU21rcGIzbnlwWWV3TDRIY1dhWXd6?=
 =?utf-8?B?bWlZT25PelZXSzVnREI5ampycGsxa0NrcmE1ak4xMUFKUm1qTEhBVS82eTdh?=
 =?utf-8?B?ZkkrUWpkMlcxazk4YVNMQTNSQ0EzTzBTK0tPTHNyc1ZoNGhhbXZvUVlBVmg3?=
 =?utf-8?B?Z2d0c216Rlgwc2dnL3RMalpJdkp1Z2kxdVdWMnIxUlI0cWZrSUdGVEtkQWVT?=
 =?utf-8?B?bDNpUktmRWFqT29Cb0syT1EyeVB6dFBCdy81b2FJTE82SnlsK3lnWWVSODd2?=
 =?utf-8?B?c2tDaURwV3NqVi9aMjEyQzdydElTUnhTRCtVKzNBMTZPbFN4dmRBMGcxNm4w?=
 =?utf-8?B?TXlqS0owQmc3a1BTRzBlSVlldGo1Wk1adzZSR2FYMWdxY1c3TEFscmNoUzlv?=
 =?utf-8?B?U2sybnhST1RjSkx0bXREdEQ2YlZhRFAvYmN6UlRLcjdaWW8rNko0cmovV2FS?=
 =?utf-8?B?RGt0cEtFNmNlQ0Y3TCsrYmI3amlEVDJId1lVNjc3b2RZUWhaSjJBblQyZVNi?=
 =?utf-8?B?eFRHWm9oMXlCOVVqWDNLS1E5UDZJYjh5YTR5VFJPYjZUQlg5QTMxUzRyc2VV?=
 =?utf-8?B?YkYrdHppTEJiNjFsclFpMEUxTDlGMmNSZnhHOGVBRUZRc2NtUFMyMFp4Q040?=
 =?utf-8?B?MW8waWRyNVVDbGxPTUFqU0pQc2xjR04vMkV5S3JNWTFtRTk4bHZtL2E0WHVl?=
 =?utf-8?B?eVI4MEJWVVRFVVpMdFM3L3lVbExwTzJEeG42QmF5NUFBZ1ZFZDRNTjhod2Mw?=
 =?utf-8?B?eENVeTRyQXA2dU9wZ3hJY2E4RThYM0E3eXU0a2VOS3B4bzBOaUIzeWt4ZkVS?=
 =?utf-8?B?NXk4bWN6MXdBSFA3a1pGY1BsRFRsUDNaV1ZpUUxmMlpJTHFIUnVxbDRJcVFo?=
 =?utf-8?B?RWtOdlRLV1JpOTNyZC9JV3pnU2Jmd3V5QldYV2hTN0xVQUFadXdBQW1FcEts?=
 =?utf-8?B?ZmlwWVk0eklUeTkydEpXVU5PTWpJN1A4K3BKM1pNR3pTb1I5NWdUcVBBN3ZK?=
 =?utf-8?B?MHEwVDEwUEpxN25XT2hOWi9yMzEwZVVYOXc2QjY5WVZlMXFWRmt5ZWRMNU9D?=
 =?utf-8?B?WnBEUUtSUGM1Rktncnp2QTQ4YlFqZS9nMklXSGl2V1MvQyt0NG15Qi8zc3Mv?=
 =?utf-8?B?Y3V1ZE1ONHJZOUtLa0FvSGRyWWI4MEZDQUdTTlZwNzBEYWEvN0JUaXUxWHla?=
 =?utf-8?B?ak1TV2VEcXE0aG95N0ZYUUxLUklhS1Y1dWZNVmVNYUpVQ3NDdFA5S0xMdWhY?=
 =?utf-8?B?TWF0bXEwQnR4OXRDL0xQM1d4L1ByenNRNDZtRnFVY1h4RU9XUDBtMERkVjh6?=
 =?utf-8?B?Z0ZRTExpMEJUUEpodlNQZWRkUCtGOUVMQm9CSUt1R2VyMTVHc3R2RVdjYUxs?=
 =?utf-8?B?Y0M3dXpXVUExdDl3QVJrUTVPQkk1ZVgyZ3p2a1VvSTBNUkpOZENtVGljUGF5?=
 =?utf-8?B?WkFsVHNRM3BYbkxGUGhJK1lrY2JRR0FmZXBCekRHQWF0NnR4bHNxQndYa2Jy?=
 =?utf-8?Q?INhGwHV8AjaWY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk84WWUxVWR1SzBLSHZOVmJwUjRFdUVKamg4VElTc0tMTDU2WHJkQ3hIYmQz?=
 =?utf-8?B?SS83a2RZSUlOSTFvdHgwNm0vakV1c2VQaXlXWFJVMUhRU3dSM3lENmZyYm9w?=
 =?utf-8?B?cEw2bStiT0RraWpqWWNwSDBPTEh0T2ZqQS9SZFl2SWk3VEVXVFMwZmxCcU9v?=
 =?utf-8?B?b0FhR3h0N2VVRmhZMXNjcFArTW84MTkzcGNhN2JQREduWUU0bURYcHkwN283?=
 =?utf-8?B?aVNrR2REZmt5elJzZzU0K2RQYjI4OTRDODVCRFNJMkIwRFFNOE1XczhKTm5T?=
 =?utf-8?B?SkhVYzZLMHIvU3hnMWp4M2k1STJtWUtqZVQwMVErbzZUNzNVa3NJS1hqeDVI?=
 =?utf-8?B?MElUM0pNczMxT3lZdWE0b20wVzVxS3lESTErNEZ2TUlGcEVyL3VJRmxnVDZH?=
 =?utf-8?B?emQ1VjUyTFpySklMT3ZGRHk2VFJxbllERGc5aDkyeC9PWjVUelFLdU1VbEV6?=
 =?utf-8?B?S2U5MWxlcDZFcTNKa1FUWi9EelNTVnhQcmhwT2xiZXRVcFd3MTJMbXBlN0hq?=
 =?utf-8?B?Ri8yQXNCWEUwcWlOYVVSMEYyNUxaeHFNM1RLN284TkYxWUU1QU4xVm51U0Q4?=
 =?utf-8?B?NnFzU0s2cHIzMENibUdKQ21GZS9zd1VjNlc4dlhId3RWNkVtREtNMDV3dFFr?=
 =?utf-8?B?Z1BjSmc0UXVyNHJoS0w2R0dUajNZcklvTVYwaWxTY0VOelFzWmNIR0ZWTkxo?=
 =?utf-8?B?UnNjL3d5MEJRYkxDNG4yK2ovaU9hc1dkMTlGZ0w2MHpTeFNRT0hERFlWTVhE?=
 =?utf-8?B?b1VaMTRoM2xCR0dsQmQreUw0OFVWa2dMMjh3MUh0VGY3K2FFYU5maWJMMjE0?=
 =?utf-8?B?MFhBVTNBVURjWncwWEU3YkR1dlpZT3BMWW5lYktlb1FvdS9UdnRRODFhWVFX?=
 =?utf-8?B?YityaWQ5Z3NIZ0pKbElYbnZXZ0dLN2IxWVV3K2JKQmp5OW54TXVGU244ZzVl?=
 =?utf-8?B?cU9ZZ1B0OFcrS0h4dUpNWEZGZk9UZXF1eDIyNUtrWEdTTWkxQVZTSmdPZmRt?=
 =?utf-8?B?RVRQdkdNenRFRGxnT1lRMTRLRUMrRHF0cXk5Sy8rbXVJSE51eW93RThXRzVh?=
 =?utf-8?B?WGpOSjdoUDVNdmsxWTRudG9WdjBtb0t4MWo3cDczOTI5TXhxSmpxN1ZPTDNv?=
 =?utf-8?B?YTFCS2g4ZlBoQ2dHeHBrQnRSSC9JamZtSk9QUHNSNFBrSGxkcmdzTE9KNk9R?=
 =?utf-8?B?c29aZGlMOXRwV2FqaGdtdG9BRnFpREFodHRzUjJUbzlGM3l3U0ZELzJvWmNl?=
 =?utf-8?B?MENQMklxRStJTElmUzNKb2dqTkphTTBLVHhqaS8yS1ZPZlhsUWg3RkVwejk1?=
 =?utf-8?B?RmNRM3g4QjRvakZXVGtNUWZtNUhieHFNNGlleXJWbGVqTWN1cWNNcEZjNE9W?=
 =?utf-8?B?ZlZwclJlbkYyd3VHcUFZQ09JZDFuR0FONVFmbWt1Sjdlalc0U3NodUt2Zjd1?=
 =?utf-8?B?UlFmN0VlTnNGaGhGejBpUUl6NDlsc0NNZkNyc1JGYjBaY1VQUTFHSzh4cTVQ?=
 =?utf-8?B?M3F1WWMxRU02VnBpNE9BeW5KRXRSdWg5amg1MGVTcHNzUFlleDdEWmkyQ0dq?=
 =?utf-8?B?S2FOMSs0Z1pKRXFESFBsb0ovRy85R1RiY1IrMGJQODRMUXM4VHoyZ0hCTW1z?=
 =?utf-8?B?U3hqdDgvS1d2eXc0Smc3blF1Q0liVXY4NWNqeG5GM0F3VE1sQTlhT1d1a01J?=
 =?utf-8?B?VXNTSWR5dnR6dXl5OG96RFV1YThTb1F0ZlpmZUUyZWM2WFFtVm0wQlJ5Mm1K?=
 =?utf-8?B?VlE5eUlMeFVXbWNsM0tvUnRvRUVhZU9wY1FXK2lJdE00SkVuVldYZ3RQWnpZ?=
 =?utf-8?B?RmhadUhNTmlOQlBtMVdUdlBHNHMyU2NLTzE0RTUzUjdzdW95NTdhVFBnZ3hs?=
 =?utf-8?B?eG9iRXgyMlh0QkFobGVHWlM5QWJnWXd5cSt3QnRkT3JoVndsMS9GL1pBZDIr?=
 =?utf-8?B?d0lEbkNQYWV6ZUo5SktkR2pmbUM3YkdwRUR5eWp1U0MvbGh1UGhRcGtBWm9O?=
 =?utf-8?B?WGE2bThjMEVlVmJkNC9FTVI5bVN2RDl3WGREdGlXTEpQdnBLdkNUdGhxRmxo?=
 =?utf-8?B?NnhRNXA5blZnWFRlV3FOS2F2aXg4OFRSWHRhSGpOVEc1cFlXeU9uVkhJZ3JP?=
 =?utf-8?Q?tbrIz0xkAAX0QGlECpV/lFaNt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a1835c-b35c-4dc3-ba52-08dd9e635988
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 03:46:10.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1Qih3tbD6DZPQ01fltuNHdoItkPRUq5CP1Afdcnxm0NtzPZFEmqdNLvAKHLMpisKsdC6krKE6OnvuSnXYo9SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215



On 5/29/2025 12:14 AM, Andrew Morton wrote:
> On Wed, 28 May 2025 18:04:02 +0530 Shivank Garg <shivankg@amd.com> wrote:
> 
>> On 5/28/2025 5:46 PM, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
>>> head:   52ce652e7ab0f015b51fee11b2862507b2c0c25d
>>> commit: 3bdddbba5f02f6d97283acb18e2a6e079324fe4b [36/67] mm/khugepaged: fix race with folio split/free using temporary reference
>>> config: arm64-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282015.F0fVmLmH-lkp@intel.com/config)
>>> compiler: aarch64-linux-gcc (GCC) 7.5.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282015.F0fVmLmH-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505282015.F0fVmLmH-lkp@intel.com/
>>>
>>> Note: the akpm-mm/mm-unstable HEAD 52ce652e7ab0f015b51fee11b2862507b2c0c25d builds fine.
>>>       It only hurts bisectability.
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    mm/khugepaged.c: In function 'hpage_collapse_scan_file':
>>>>> mm/khugepaged.c:2337:7: error: implicit declaration of function 'folio_expected_ref_count'; did you mean 'folio_ref_count'? [-Werror=implicit-function-declaration]
>>>       if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio)) {
>>>           ^~~~~~~~~~~~~~~~~~~~~~~~
>>>           folio_ref_count
>>>    cc1: some warnings being treated as errors
>>>
>>>
>>> vim +2337 mm/khugepaged.c
>>
>> folio_expected_ref_count() is introduced with this commit[1] and merged into mm-* tree.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-unstable&id=86ebd50224c0734d965843260d0dc057a9431c61
>>
> 
> Well darn.  We have a patch in mm-hotfixes-unstable which is cc:stable
> (mm-khugepaged-fix-race-with-folio-split-free-using-temporary-reference.patch)
> which is dependent upon a patch
> (mm-add-folio_expected_ref_count-for-reference-count-calculation.patch)
> which is scheduled for 6.16-rc1.
> 
> I'll move
> mm-khugepaged-fix-race-with-folio-split-free-using-temporary-reference.patch
> into mm-stable, after
> mm-add-folio_expected_ref_count-for-reference-count-calculation.patch
> to remove the bisection hole.  This means that when the -stable
> maintainers try to backport
> mm-khugepaged-fix-race-with-folio-split-free-using-temporary-reference.patch
> into earlier kernels, the build will fail.  When this happens, please
> work with them to come up with a version of
> mm-khugepaged-fix-race-with-folio-split-free-using-temporary-reference.patch
> which is suitable for 6.15 and earlier.
>

Hi Andrew,

Below patch is independent of folio_expected_ref_count() and functionally equivalent.
This can be backported to -stable branches.
Please review.

Thanks,
Shivank


From ee23192f3306cdd2553b084ac23430412a9c61d6 Mon Sep 17 00:00:00 2001
From: Shivank Garg <shivankg@amd.com>
Date: Mon, 26 May 2025 18:28:18 +0000
Subject: [PATCH] mm/khugepaged: fix race with folio split/free using temporary
 reference

hpage_collapse_scan_file() calls is_refcount_suitable(), which in turn
calls folio_mapcount(). folio_mapcount() checks folio_test_large() before
proceeding to folio_large_mapcount(), but there is a race window where the
folio may get split/freed between these checks, triggering:

  VM_WARN_ON_FOLIO(!folio_test_large(folio), folio)

Take a temporary reference to the folio in hpage_collapse_scan_file().
This stabilizes the folio during refcount check and prevents incorrect
large folio detection due to concurrent split/free.

Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 mm/khugepaged.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index cc945c6ab3bd..25a406410463 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -548,7 +548,7 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
 	}
 }
 
-static bool is_refcount_suitable(struct folio *folio)
+static bool is_refcount_suitable(struct folio *folio, int extra_refs)
 {
 	int expected_refcount = folio_mapcount(folio);
 
@@ -558,7 +558,7 @@ static bool is_refcount_suitable(struct folio *folio)
 	if (folio_test_private(folio))
 		expected_refcount++;
 
-	return folio_ref_count(folio) == expected_refcount;
+	return folio_ref_count(folio) == expected_refcount + extra_refs;
 }
 
 static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
@@ -652,7 +652,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		 * but not from this process. The other process cannot write to
 		 * the page, only trigger CoW.
 		 */
-		if (!is_refcount_suitable(folio)) {
+		if (!is_refcount_suitable(folio, 0)) {
 			folio_unlock(folio);
 			result = SCAN_PAGE_COUNT;
 			goto out;
@@ -1402,7 +1402,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 		 * has excessive GUP pins (i.e. 512).  Anyway the same check
 		 * will be done again later the risk seems low.
 		 */
-		if (!is_refcount_suitable(folio)) {
+		if (!is_refcount_suitable(folio, 0)) {
 			result = SCAN_PAGE_COUNT;
 			goto out_unmap;
 		}
@@ -2295,6 +2295,17 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 			continue;
 		}
 
+		if (!folio_try_get(folio)) {
+			xas_reset(&xas);
+			continue;
+		}
+
+		if (unlikely(folio != xas_reload(&xas))) {
+			folio_put(folio);
+			xas_reset(&xas);
+			continue;
+		}
+
 		if (folio_order(folio) == HPAGE_PMD_ORDER &&
 		    folio->index == start) {
 			/* Maybe PMD-mapped */
@@ -2305,23 +2316,27 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 			 * it's safe to skip LRU and refcount checks before
 			 * returning.
 			 */
+			folio_put(folio);
 			break;
 		}
 
 		node = folio_nid(folio);
 		if (hpage_collapse_scan_abort(node, cc)) {
 			result = SCAN_SCAN_ABORT;
+			folio_put(folio);
 			break;
 		}
 		cc->node_load[node]++;
 
 		if (!folio_test_lru(folio)) {
 			result = SCAN_PAGE_LRU;
+			folio_put(folio);
 			break;
 		}
 
-		if (!is_refcount_suitable(folio)) {
+		if (!is_refcount_suitable(folio, 1)) {
 			result = SCAN_PAGE_COUNT;
+			folio_put(folio);
 			break;
 		}
 
@@ -2333,6 +2348,7 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 		 */
 
 		present += folio_nr_pages(folio);
+		folio_put(folio);
 
 		if (need_resched()) {
 			xas_pause(&xas);
-- 
2.34.1



