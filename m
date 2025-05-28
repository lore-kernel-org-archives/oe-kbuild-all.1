Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBD12798E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435654; cv=fail; b=GzwoHnS/WidEY9rX1jEvJQAOZDFtIsCqIJkyjlbwJhsKdjmGTtI7+FgL+flzXBVFybdI8MwEDt6SzxjBTfIQ0NtQBVZKrSwhxUdPnnrSnGMn3/NKdVRBXXtGJtWHQV//FEp72bglvMQyL4bdiqKjBgkJv0g0k8D74hKriXUYGjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435654; c=relaxed/simple;
	bh=5QxF3VHwd2dolqXVenGSt18b27IjFY98scW6akH0YF8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gPEYL0XxOaDAmIEETnYLlNGWp20vryaUL4FoJF9pANqxXzFwmDQy8PcuHcdf25fzA+9PkiGecHK8x+GyckybGWhpUHEWMkcBvmi++6k+glEdq5RkyK/QFz8jhVcTq3fncA7Kc1xejuR2K6Ok36zNQ2Q9+C1O+/nydSeUaGLJp0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vxzWBws9; arc=fail smtp.client-ip=40.107.237.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vxzWBws9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBAHM6be0zZ3yrr1/eypycZtLuX81J+yB7eayJvis7OGF6cztfJTCBZzjAqq60V24Ahv1JgdYHmJPs7M+41V+5CJATk24jWcjpiSp6x1W+n1tPydNEcfssqBDisS6q5ztRzE556yXTcsK8b9Pc5nn9mzwX8J2/V5u8NdL2Bn4V+aAZudoRPakGMTMy3+ku5qlajrFyiJl2RjwsHynqsYEWl28VdIyqN/KxIeYMIPMjn5l8q303xdrGPviopWiCvq34Spt+cNy+pCktoqNW48h2dI+jFnaf0Sa0aCjtjcQujTsJmSTupG3pjV673g3n5ru0IXK1Q1ZPdUdrVEkU5DXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfyQAGDPgR1qqkx3SlBqWyQjFkvtLQKP1zTJxtVFOiU=;
 b=JE0KFrE+gVWS6NwNKtEA3wTYrM0yixB0OCsNhw8S/Vzs+1eN4TksrZ51LoHbSs1Yr5ulw574eNjkFd+/luQiRSZmLoKfLbOvDKr4cNgWiaxD2pNwSZHGKQpgtDEKqDIQQMyxzMW6UBucGYqzMnBnZak4efaa+rq+Fg+ge5xFKBe9jC+0BRKsrB22spsRrjDfwjGS0qzrPST++AcZz6lfMRry2zdPH7n0kERyht6TqT2rSQyphM2Qf56ypMGQjdIJyaPnAfCgsLCrHhpPJtTP31B1CMx+aqceYkVN6/V5FQlcV8ukqVU6w74dK6Lh8U3Gfs5gUB11EXczF9RkBb+lYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfyQAGDPgR1qqkx3SlBqWyQjFkvtLQKP1zTJxtVFOiU=;
 b=vxzWBws9afR4+g9SyTAXKxnVTjWjXf38Y22YEoFXnw1bTFbyzLkJppZssjmzALOnxy5Et+lde5Y0Oeffk00TBUXI80APZdnZ3UgYz2kD8g+UHtQFQh/Uq/f4rtu1eZDjTSa2k10u0oZvtSWejvo+uhL/DFOCZ0S/vWrJ24+cOoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 12:34:09 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8769.019; Wed, 28 May 2025
 12:34:09 +0000
Message-ID: <d2ddc44a-19ae-4e4c-90a4-f4ec05558d74@amd.com>
Date: Wed, 28 May 2025 18:04:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 36/67] mm/khugepaged.c:2337:7: error:
 implicit declaration of function 'folio_expected_ref_count'; did you mean
 'folio_ref_count'?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
References: <202505282015.F0fVmLmH-lkp@intel.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <202505282015.F0fVmLmH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::20) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: dda6dd55-164b-4268-a0a2-08dd9de3f114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWgyZWdTN3hGenM1anhIYmRFTTVrZ3BFSzEwZTJUOUhCTW41dnZNWjkySW5n?=
 =?utf-8?B?azB5eTVaV3RYQVk3NDlTbVMxTTBjSUtHYnE0QVorMGtDZkMxcklJK21FTnVR?=
 =?utf-8?B?SVh5NGl5YThIaDFnVTQwYmNCNzFTYVAzMUhHeHd2UHhXWDJraHF3YlpaRCtL?=
 =?utf-8?B?RndLbmEvQlcxeGFidERYbzNoVHlUU3J6bXZZQkFqd0U1OGE5TnpuR3I0YzdW?=
 =?utf-8?B?em55Z25pVDc4SWdMMmsvOU8vOVJabHg4d2tobUZmZVJDYzRzUDVHZERwcisz?=
 =?utf-8?B?QW40YzZsUCttNGlycUJoOGY5TC94T2xsSngydWtvcHNNVTUrUXM5L21Mczh6?=
 =?utf-8?B?Q0dXMm45NVJQV0dyOXZERk1JUTRPMVEyS2J0d2ttNXphQVhaeitKSGFnaGdl?=
 =?utf-8?B?U3dmNVNEZjQ0MXNhL3NBZzdJby9Gd3FjcUdjSk9vNnhLc0xiOG9YNFYyRWFH?=
 =?utf-8?B?TjBCWm9VSGhyOUFHaUgxb01nSXBjZTh1S0N4enYzSEg0QkF1Z2Z4azAyYk5T?=
 =?utf-8?B?b2NJWXJGanAyRThXV2JMWE4ydG5pcDZLZFpUVUs4WEJocXVBdFlHOEZwQjYw?=
 =?utf-8?B?ejlucmN0UnJHTWF4K2hrOVI5U3lqYktROS82Y0MyM3YxNlVnTXNORGRQbHZL?=
 =?utf-8?B?TTIwTkt0QWtjL2twWkEwNEFZckhDN2pCK3kvYjNwbXpGcnA5S1NQUU9nTy9r?=
 =?utf-8?B?MEdMTjByMW9yeGtFa0hZQ0ljdys0ZTNQR1AxcWIxUnF2RjJmVUVaMnRRUU51?=
 =?utf-8?B?c1daR3RRbXYvWG5YYXRPbk50S3IxWjJyUGtwS0o2WERtQkxQUmhia2xNYjhE?=
 =?utf-8?B?M28zcnc3aDltQlJPQm0vcnRyQnJMUXo1MjNGbndxbGViQUloWWZnMEZwVTNX?=
 =?utf-8?B?VkU3bzRtbEJ0alZoeHc1WFcwcTFGcFRuRGNISGZKRWJIbmRwR3F6dTFWSWFm?=
 =?utf-8?B?RDFkNTcrVnBTa1pJUS9oaUNHN3YxUzVGazNkT0RweGVwam0zajJCS3RRSzdv?=
 =?utf-8?B?dTRZcUpMTkp2L29QUlR6RU1IS1M5bnoxNkYzQzBJN0QrVzdsNDExWk9tNzRs?=
 =?utf-8?B?KzJLWk0vV3BWTDZraFdTZHNGOTBDdlJxUzJQR0xjWkU0cmg5eTJJSVVYdFIw?=
 =?utf-8?B?TzhnR3NBem81YzArZXVkUEpyY28xaDh2azlIV3dwZTVxZW11NVUrT3Y1OFk0?=
 =?utf-8?B?eWZFTU9ZVTF4UkkvajRMWGFuU2Y3MnJwbEU1ZFJCNUVSMDQvb1BEL0ROcGgv?=
 =?utf-8?B?d1l1VzVvalVDNTBBSkFNUXo5a010TVV6ME1vamUwdzNFNGNtR2NodndrZmlE?=
 =?utf-8?B?UFQvbjgvUitJM3VzZkozM080ejQ1NktpRFFPTWJ6WkJtaWhIRkJ0akErd2px?=
 =?utf-8?B?dE1MYy9oMlJRV05SQWxzTGdTSkpUUHk5UHZBalh0alZpNGJYenN5cWk1NXJO?=
 =?utf-8?B?Z3Q0dDBXMTk5OE84Y1BoT1hKUnpkeFZqelR1aEVGeWVZb2lhY0xPZUxvb1VJ?=
 =?utf-8?B?a1ZlWWtGUDBWNDVyUUFIcU82VVpEVlk3ZnZuaTcvNFhjVlhOQnNsWHYzVmhF?=
 =?utf-8?B?Y1E5SjB0TDF0UHB6WTV5Smw4NzdJZmQ0VVk4b0xlTUY3akRGamxVMDM2ajlD?=
 =?utf-8?B?UUFCZ0hNbUFONnEzbnVVSG54MlZaRWVpcDkzeGs0NzVRVlkycmtNb292bkdo?=
 =?utf-8?B?NlZ4Q1JwUFhYN1dpNnhHUDB1dE0zWUJGMStWWVpFemF0b2R5VlFNZ2ZLMlpH?=
 =?utf-8?B?cDNZbmptMWQ1RDJ0ZzJhNnBzbGl6SGJ4NktIcWJtQVVmUnZzV04vRWplRTFW?=
 =?utf-8?B?VTZRckxnRkpyaEJmYjUrd2ZtY0diSms0MjFlNnYwa2E0K3hwSVg5Y21rSDRj?=
 =?utf-8?Q?J/pCcabBCLYuL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWVhUFdIZXQ1bTZ6eWhpMHFuNVdaL3NyYlgvZm5qbEFRUXg3RUVIbHhmeENz?=
 =?utf-8?B?Mk9yYW1pU21qeWphSHlxOUhUSm9sVkRYU2VwS1FQSWRJY1hmL2QyQUN2cnVj?=
 =?utf-8?B?VFZZZzlwV09jUFlSZWp5bklkQkJnTjl0OHAvV3loSGRjSXBnTThMQzJvM1Jq?=
 =?utf-8?B?SDU4elVxZmlYQlJKdXJQZVIvUWlGMDJzc3RSd3hZQ2xuTG44NDRNVnRlVysr?=
 =?utf-8?B?eXNkSUhHbGxvanVPZ1RHR1FSQ2VBY0F0eGdnVnlTUHBMTnJhNmZCUjlmYTcw?=
 =?utf-8?B?dXByVjNheFA0bVVQOWk2cjFCeVZjV0gxYnlhb0llVVRONXFxL2hJWkVmamJL?=
 =?utf-8?B?aWFVSm9DWFRhSlhTRmh2cElmN3E3UHRDVGVYQ0pkcWduT2xlRnZENW9uTFI3?=
 =?utf-8?B?Z0R2TGdjVE9xQXcvTWgvbW1XQlBoZC9Pamhta2w0WEhScmcxUkpvdFdmd2RC?=
 =?utf-8?B?d0N0TTdmV0M2c0hLOXVDa2xRcXAzaWFtcG1JekpaQTVNR2t5bzJVOG5ZQ09t?=
 =?utf-8?B?V09WSnB1U3JtdjJJTENBS1VBd01vUS8zVWZLaGQvUzdMRzZRMDN0OXZyMUVp?=
 =?utf-8?B?K0xVd3lDR084VTFaL3JEclpFczFyZExFSUI4RzBQVTZSUHFxK1FONWJ6ajFU?=
 =?utf-8?B?N2Y2RUZjb09MRFIzVC9GVHpISzRQNFBVbVlINWdDNUkxamw2VEp4OUFNK083?=
 =?utf-8?B?bTNBSGZJQml2V1VCK04ydzcvTU10OUpueHVNc05xRFd2RGtORml4MTRYZ2xP?=
 =?utf-8?B?Wmh6MGFvNmFWTU5KNlBaT0R2YStubklnblpMWXpLWVc3NnR4VTFMSFdMQUxl?=
 =?utf-8?B?NG1JTXhmSHZETDZoL2F0aWU1NGdCT3JjTTNnRElvYStmZ2tMOHJCTXdvMEVO?=
 =?utf-8?B?b1p4WEw5eFk3OGY1ZjVEWkppaVlmaVdHS2dCZGxrQU5YWUhnZGxadFNDUlVv?=
 =?utf-8?B?ZlI2RFJpb0xSZHlWM1RpZ21IK1dmM05BTFZ6bVFWeGtYRW1HYlEwNEhVNGVz?=
 =?utf-8?B?TTc1aS9BbGRzS3BESDNpelRJWFFoTzBSbkpZMnRsQytyN215Snd5dWw1bnc5?=
 =?utf-8?B?VTdxeFRwQkJXU0tXZXpaRHduL0VlUnNqK01yYmQyRVc3UjhKVHM2b0JNS29a?=
 =?utf-8?B?U3MxSWRMVG1zdEVualJOOE9FRi8zcHRZeExFelJqeldYRS9nM2hIeEVLbFVx?=
 =?utf-8?B?WlF6YjVpUWtjWDhQRGpjeTNqN1M0SUVUTy9RcUFacFhZUHJWU0Uwb1FBOWNm?=
 =?utf-8?B?UlN5TGRvVEJyeTA5aUJFeWYyM3VmYU9aU1VjY2pNYWNDUDJ5blV1NmRiUmZq?=
 =?utf-8?B?ZTJxOFJ1dzltN1FuZytHRU05UlRwKytjNkdIeU16czlsZ2ZjWXBxVXhJT1JM?=
 =?utf-8?B?cHVlUUxNZ0J3aXRmanBmVkd2TGk3dlFVWWRFMlhneFR4ZzMvSUdBSDQ0cEl3?=
 =?utf-8?B?a3N6WmtwS1hoNk1FMlRWTEFac29UcHlEKzd2TGt5ZXFnZmVxYnVJTm1TcU9Z?=
 =?utf-8?B?RXYvZlpGMllSalpWTmhSMlMvNitOaWZ6WVdGL2NhQXp6V3FRQTZLakw4SFpN?=
 =?utf-8?B?bEVQQjdwR3VkK0pXY0Jzd0I2SFNkU2V3anlNL2s4K3RxdE91UlN0WCt0U2VR?=
 =?utf-8?B?ZXQ4NWkvd24xeFBDMlo2QnNxZnVWRE9qWWFSQnN3QTFoY3JQNE9uMlR5RzhS?=
 =?utf-8?B?VUhFM0NPR2ZsVXZ0N29wL3NGdTlJREphNE1tUG5EK0Z2UG14QUpiWWpMdmtQ?=
 =?utf-8?B?R0FMMFFFaWh6dHFGU1R6QWswakVHQ0tJeEdUV1A1Z3Fyb09URW1jeHpUcFpz?=
 =?utf-8?B?SFp0MTZJdWdaOVVpdSs1aXV3cjNTK0xBSWVHQ1E0MWFsMXJaMTJNazg5eTdp?=
 =?utf-8?B?NGpQU1V5TEtVV3NXWTFVL3ZoS0JQR3JEUDJpZDI2WWIveEdjWm1WNW1sVGUx?=
 =?utf-8?B?Q2syKzhjSHJPZVBnb3lwa0xiMG1SU1FCODNyNDVRK1ZFZWhXV1hEais2MFl6?=
 =?utf-8?B?K0VTUCtOam9zWFFKYlhGQklwcmxSMGlkaDk5MjdyS2dqMy9icXlVQkJzUUE0?=
 =?utf-8?B?OS95ak9yTXIraEdVeGpHTnhjU1hkUS9hV0VhNlhENzdwcndUekdpQlY2cVJr?=
 =?utf-8?Q?gpQdTVNorNnuIkWpzRpfP51lN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda6dd55-164b-4268-a0a2-08dd9de3f114
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 12:34:08.9119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcbesZ3wQavR0wJo15HTV/V6aLOXzDiCnZzH09AeNpClBYm4MxoSs0eiqOv60jjox6/JeQniaGsrkTXTHeCbbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567



On 5/28/2025 5:46 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   52ce652e7ab0f015b51fee11b2862507b2c0c25d
> commit: 3bdddbba5f02f6d97283acb18e2a6e079324fe4b [36/67] mm/khugepaged: fix race with folio split/free using temporary reference
> config: arm64-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282015.F0fVmLmH-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282015.F0fVmLmH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505282015.F0fVmLmH-lkp@intel.com/
> 
> Note: the akpm-mm/mm-unstable HEAD 52ce652e7ab0f015b51fee11b2862507b2c0c25d builds fine.
>       It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
>    mm/khugepaged.c: In function 'hpage_collapse_scan_file':
>>> mm/khugepaged.c:2337:7: error: implicit declaration of function 'folio_expected_ref_count'; did you mean 'folio_ref_count'? [-Werror=implicit-function-declaration]
>       if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio)) {
>           ^~~~~~~~~~~~~~~~~~~~~~~~
>           folio_ref_count
>    cc1: some warnings being treated as errors
> 
> 
> vim +2337 mm/khugepaged.c

folio_expected_ref_count() is introduced with this commit[1] and merged into mm-* tree.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-unstable&id=86ebd50224c0734d965843260d0dc057a9431c61

> 
>   2266	
>   2267	static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   2268					    struct file *file, pgoff_t start,
>   2269					    struct collapse_control *cc)
>   2270	{
>   2271		struct folio *folio = NULL;
>   2272		struct address_space *mapping = file->f_mapping;
>   2273		XA_STATE(xas, &mapping->i_pages, start);
>   2274		int present, swap;
>   2275		int node = NUMA_NO_NODE;
>   2276		int result = SCAN_SUCCEED;
>   2277	
>   2278		present = 0;
>   2279		swap = 0;
>   2280		memset(cc->node_load, 0, sizeof(cc->node_load));
>   2281		nodes_clear(cc->alloc_nmask);
>   2282		rcu_read_lock();
>   2283		xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
>   2284			if (xas_retry(&xas, folio))
>   2285				continue;
>   2286	
>   2287			if (xa_is_value(folio)) {
>   2288				swap += 1 << xas_get_order(&xas);
>   2289				if (cc->is_khugepaged &&
>   2290				    swap > khugepaged_max_ptes_swap) {
>   2291					result = SCAN_EXCEED_SWAP_PTE;
>   2292					count_vm_event(THP_SCAN_EXCEED_SWAP_PTE);
>   2293					break;
>   2294				}
>   2295				continue;
>   2296			}
>   2297	
>   2298			if (!folio_try_get(folio)) {
>   2299				xas_reset(&xas);
>   2300				continue;
>   2301			}
>   2302	
>   2303			if (unlikely(folio != xas_reload(&xas))) {
>   2304				folio_put(folio);
>   2305				xas_reset(&xas);
>   2306				continue;
>   2307			}
>   2308	
>   2309			if (folio_order(folio) == HPAGE_PMD_ORDER &&
>   2310			    folio->index == start) {
>   2311				/* Maybe PMD-mapped */
>   2312				result = SCAN_PTE_MAPPED_HUGEPAGE;
>   2313				/*
>   2314				 * For SCAN_PTE_MAPPED_HUGEPAGE, further processing
>   2315				 * by the caller won't touch the page cache, and so
>   2316				 * it's safe to skip LRU and refcount checks before
>   2317				 * returning.
>   2318				 */
>   2319				folio_put(folio);
>   2320				break;
>   2321			}
>   2322	
>   2323			node = folio_nid(folio);
>   2324			if (hpage_collapse_scan_abort(node, cc)) {
>   2325				result = SCAN_SCAN_ABORT;
>   2326				folio_put(folio);
>   2327				break;
>   2328			}
>   2329			cc->node_load[node]++;
>   2330	
>   2331			if (!folio_test_lru(folio)) {
>   2332				result = SCAN_PAGE_LRU;
>   2333				folio_put(folio);
>   2334				break;
>   2335			}
>   2336	
>> 2337			if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio)) {
>   2338				result = SCAN_PAGE_COUNT;
>   2339				folio_put(folio);
>   2340				break;
>   2341			}
>   2342	
>   2343			/*
>   2344			 * We probably should check if the folio is referenced
>   2345			 * here, but nobody would transfer pte_young() to
>   2346			 * folio_test_referenced() for us.  And rmap walk here
>   2347			 * is just too costly...
>   2348			 */
>   2349	
>   2350			present += folio_nr_pages(folio);
>   2351			folio_put(folio);
>   2352	
>   2353			if (need_resched()) {
>   2354				xas_pause(&xas);
>   2355				cond_resched_rcu();
>   2356			}
>   2357		}
>   2358		rcu_read_unlock();
>   2359	
>   2360		if (result == SCAN_SUCCEED) {
>   2361			if (cc->is_khugepaged &&
>   2362			    present < HPAGE_PMD_NR - khugepaged_max_ptes_none) {
>   2363				result = SCAN_EXCEED_NONE_PTE;
>   2364				count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
>   2365			} else {
>   2366				result = collapse_file(mm, addr, file, start, cc);
>   2367			}
>   2368		}
>   2369	
>   2370		trace_mm_khugepaged_scan_file(mm, folio, file, present, swap, result);
>   2371		return result;
>   2372	}
>   2373	#else
>   2374	static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   2375					    struct file *file, pgoff_t start,
>   2376					    struct collapse_control *cc)
>   2377	{
>   2378		BUILD_BUG();
>   2379	}
>   2380	#endif
>   2381	
> 

