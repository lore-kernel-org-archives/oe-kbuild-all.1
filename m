Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2072.outbound.protection.outlook.com [40.107.100.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E126B080
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739459425; cv=fail; b=gdEb31NOOgdRYyB/ZHfA3P0GHZblxa8CyTJJGf9xqetlIw43JzLdRUKvSTFspCBN+C862V41gZsMYBm/d2TVBdkXxVTxhYSuAxfxr8FoAh01eLtL727yEjTt1iKb6U/0dS5qrgyJ7y5r6iUHECkJmcJiM7kYl7bqmCFwuHc6pjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739459425; c=relaxed/simple;
	bh=DOZi4eD1ZlR0+Jgm5svyjHmuejDedSIhpAwzTF441d4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AXqzsg5nHyJFUI7TezX8h2VtAFmFoX0x/NR2I5Fig33zShxJ9dQPZNzLqsDTNmfJWIITVFNqfr57IU5fj8fuQKQhhJbDJKk+Z0dK9RsI1HmXbaPi/nT7GINkAlPohJH8mP0Vg8o2KPcpW7GSFCCToT+wbUrTjrdANEh2S7xQbqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I+zw4YGK; arc=fail smtp.client-ip=40.107.100.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I+zw4YGK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvgFYWNCzcdhPnfjKJjvxNqeeg38OZPnouCF4OzcvFWF5gZMPqE/TpncgbYSls8waRSe8f0NnjFPQtgsRFBo9ummjlwzQAHLWUVtzTdgy0kKwwI/etdvgo+zCH0Qkr8L5EZb8vdQunloqvimI0BOyHQWj7u9mhpDH7hADoqjUjJ0xVpBf77aQuEEAPtjcsJPtJcLpLTWxC8okaBY+B3+JBY3zFf/tS1H6kLMpIJOGhlrdjfW7Qo9NoiSaihmhfysbAZuXGJwdrch7MR/ilC2GXz3se4OQN85IHl3dUwEtxHZWZeCFxjr9Eo5bSwvcPPEoNdmtbNytmTx1q8N4T+0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieEK7pv42zWseNic22ZHLnKUxkoWVgeDUWXb4LLHCgA=;
 b=MBb0/cHy/0PqaK70qkN+P9+gM7GWhAhMaGRfLG871LeSADhYW59g3nnS22UThw3U1i26yqUMX+E1HBh2ITOxBVSjWAtHF6V5ppVVuFK/p7VHlI0/V6J6pjphxxVUC18JNevCwYMEp9OhZKi7czeT4q8BtIJtK1e5AzVNzpacGMoYaK4IRNGylmQlJRzujsFX4LsnM+hY35ELg8kMqItvjU8tbb8wreXZzkzopN3Oba3wLuoYkmxhMMeCEucb6s+88jZKGvwOECZvUJsDhyRY05oG2HY/qAh9IPR5kphQkmntV3pn56Yq9xY9l1kgkzmq10Qt80BNDGFFgGq2Buxyyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieEK7pv42zWseNic22ZHLnKUxkoWVgeDUWXb4LLHCgA=;
 b=I+zw4YGKEK6l4ANVkm6x2r+5ufOZmQgyGHPOcFXTTh0OcZoNOWu3dAon8VXGzRr67otCYJk480d1x7H+qQO6loI316/vXev2OJxm+xBMUaRSTFervlfwwJ/KeonqJ1/GbJ3gt665J3wkh1SEWQbpzQU6jox7e1vzpIuXYJucKBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CH3PR12MB7715.namprd12.prod.outlook.com (2603:10b6:610:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Thu, 13 Feb
 2025 15:10:18 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 15:10:18 +0000
Message-ID: <f3eab810-e4a5-429e-ae8f-61f8813b0ff9@amd.com>
Date: Thu, 13 Feb 2025 20:40:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1858/3437] sound/soc/amd/ps/pci-ps.c:68
 check_and_handle_sdw_dma_irq() warn: inconsistent indenting
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
References: <202502132134.BlkNw1Iq-lkp@intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202502132134.BlkNw1Iq-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0250.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::15) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CH3PR12MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a91232-9d12-41b9-f979-08dd4c408703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2pzc0ZpaUlhRzZaOGdHd3NmNTl2Z1VIOEJtalFVeFFWT2xHcHVCV2Q3NGtM?=
 =?utf-8?B?cUp4QjRBd2p2dHMxWlFsOXpacW9TcUduVXhyMU0zYXZjb2tDQlV2TFEvN1Bq?=
 =?utf-8?B?SUwvNkdKbkZUTUxRdHUwOGdXZXNla1Q0dXZ0NjFYd2NUTDVEdTFqRERnRmNL?=
 =?utf-8?B?Q28xcUhGaStucVJJVUpLY1BCbTZ6TDlGWFFoRXJBWUllVmwrTEtTVGoxek92?=
 =?utf-8?B?SkQyWWtzN2l4YTlGRkI0TTBhTFkwMG83YW1LVGIrclFMLzRLMlBrV2lTakd0?=
 =?utf-8?B?U2RuNFRQbURubnZmRzZwRDdKRStMSnZCUWdmVTVUUzErbXkwbWpVNlZYQy9n?=
 =?utf-8?B?ekJ6RGNITVUwQ2JPQzFXdGI5VnV2TVllUjVDcWFUZXJsSkJIdCs4d1p0cHo2?=
 =?utf-8?B?eXNWQ29SM21mWU44NTUxZTdlZi9pem9RUVlDL2JiWFZQb3BVRW9wbVpqSUx5?=
 =?utf-8?B?bTM4U1JBYVJTRGhqN1VwdGpFc2NPektPN1RPY0lUUXI1L08yQ2lrenFrcmlm?=
 =?utf-8?B?MmpGbFpmcWI0VzZvV3lQR2FtQnBrcTNxMHlnWUJuc1luenZxZmZYMFhzRmlh?=
 =?utf-8?B?ekJ3anFXZVBSQXdzYVBrY0s5MEdZU2pYdndzMkZpNnNreVR1Vm0rV1lEaWZJ?=
 =?utf-8?B?bVZlZG1sN3FGWFpFT2ljdmRKYkhKTVFxeFBMbjZGTllHS0M5bWFnRTI1MzQ0?=
 =?utf-8?B?UFJxVnI5aTZDcTNZSG1nSThjRHdDVnFucUNwUlErbmR2d1FlTkFMQXZYUWl3?=
 =?utf-8?B?S1FxZC9iVnZEcUZ4ajcxMy9DN2FPdkJORStqYWdZd1J1T3JnNkJmQzJrQ3Bm?=
 =?utf-8?B?SEJuaGc0KzRvMGF3d1gyUU51U0dBN0JuOTZXK1FlME1POUVRQkxtRFZ2T1Fx?=
 =?utf-8?B?ZTZ5N0swdm5pYU1HMWIwUHk5Nm1FL25HNnRXZ0NZMVRCbUhLaW03RE5YSE9U?=
 =?utf-8?B?RSthbGVoUUdUa3BuMmE4RERwcUZCT1FEQnZXbllNbzNRSUFVLy9FeFpNVis5?=
 =?utf-8?B?Zjgwc0xEQXp3eEtKZGtLMkoyWGFtdjIvRURlTmx1dzI3bUE3WkRIMDBDNXlr?=
 =?utf-8?B?MTdUc1N2VlZFWEVWbFM0MnRMaWZpNjRZVFhpbmM0VU5sWVdlcnB0QUw1bHhz?=
 =?utf-8?B?SFJQYS9URnZpejFsZ0NpS0FhSWoreDJlbmFmRjlZdWxyQ24zU2szR2Z2a3Rt?=
 =?utf-8?B?SnhZM2c5Z1NEamxxTjI2VU1SMk9PMWo4VWRpeGU4OXYzSGNqV0lzcmNOVGFr?=
 =?utf-8?B?amdmUWRZZi93ZTNLaE1XNEpnNGVsUHdYbkI3bDlRY2hvYUtSdXc3TktTblBL?=
 =?utf-8?B?akJGcFlXaUJGbjdobEthRzFZbGgyVVZObWxnSVhrbm1sZFp0T3ZoLzRodjF6?=
 =?utf-8?B?SHROczJaVVdXT2tqNkthWWgvdWE4aEgxODRXR21TNXF3UFd2SVdreFZ6Nkpq?=
 =?utf-8?B?dHIvY0tqb2txb0ZtVTc0S2diQ2JDT21CcVJzN1VhWXpoc2NRNzNnSmlabldH?=
 =?utf-8?B?Z3A3NWdrQ1pTS3lNWFdqZDR6ejl6WGtRdllPQW91d0ttZTkwM05NOUlSRFV0?=
 =?utf-8?B?YlV5SzBSamhKbVp3ZUw4SnF5TlkyUk51dVg1V3pLQ04wdGRFOXpvYkNSOUtS?=
 =?utf-8?B?a2NNVmpOUUxCdEVXcGxrR292Ulp0MWFSQnZwSTFmZ2pudWZRRlNMOWtFNUJF?=
 =?utf-8?B?SzkrVGE0RGh5WXZLeXZQKzNnWDhWQ3h0T05lMlZ6cXBwa1MwelB6cXdYc3Jq?=
 =?utf-8?B?TE5jSEZCcW1VcDFOR3JhVVhzU2R3WGdoTVdSaVZrQnFxY0ZEUnYrdjFCTkEx?=
 =?utf-8?B?K01vKyt2VXc2REMxdWhidz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnBJMHhGQW12bzhEd05BeFRLanhhNGhVaTYwSEJBQUhvWTVYQmpqT0t3YlNi?=
 =?utf-8?B?ODhRRWM3R0V1blkrVnVBNzNrQzh2cGY1bW96S2Z6VlVDV0xBTXdkNkRxTHlV?=
 =?utf-8?B?cFY4ZFJyaURoR1N2TkdvazRzakJZTmltTWhKT0xqN3FFZDJKQ1NjNVI0TTJr?=
 =?utf-8?B?Q0wrdm5JZkNwZjNEV1NPVmphd1BTbXBRUW5MUjM2V3NCc3dWeGl5TjBjdTQ0?=
 =?utf-8?B?blNlZGhod2krdERScXRFK3RjOGpXb2I3NmlsbHdFWEc1bUZaR2t3UEtNK0RF?=
 =?utf-8?B?eWt1SEhkTjlka3VsKzlKeHpJYkFkNUpRdGxOL2JwMlBnR0Fkalg3OXlKb2lC?=
 =?utf-8?B?U0QzV0duVThTSi9McmIyeHN4OHNxQUFtRGtSYW1YVFZpVW51MmFldTl0VFpF?=
 =?utf-8?B?STJNUE0vdDE1UTI3RzltbWZRdHRMVnV0Y1g2aWNpd09rRDYrb3kyN1pzQjZS?=
 =?utf-8?B?WWYxVGRWWU1wUmVac1RGdy9QM2xiVnA3OGEvbmtHZFpwMno0TmVWbC9kVDl3?=
 =?utf-8?B?bXNyVXhFb3I3N3RaWkQyVmx4ZzBuSCtYSytRYVd1eU5sZmFvWWIyb3Mrdlht?=
 =?utf-8?B?bDN0NFVNSTJKNzJFcEdjSWF0dnFhRDRJbGRDb3NPRlF1ZXNIS2VCVHR2REhm?=
 =?utf-8?B?ekYwU1VTdFpnaGdBVGtHV3RNdmZJK2MyNVZhdFl0UWhHaEhLM00zUVcyRmph?=
 =?utf-8?B?eVQzaEI5bUQyams2MG1uTUM2bVZjaWhCcW1HM3RJWVFGaGZ2a3pySVdEZklI?=
 =?utf-8?B?ZTRPZi9BQzJ1RVdpcTRnUWxMbUt6L2UzcGJNcm5Za043REdxcG1EamIzcFlD?=
 =?utf-8?B?M3ZVRkh3Y3VaOUgva0NBcWlacENlM01vb2VwaFJlUEtSTFphNytIVnZCT2Ix?=
 =?utf-8?B?cTZvY2YzOWN4alpoVGpna2puNjhBY0tNWGZtcklrZlpZWEF3Mm4vUHJqcVQz?=
 =?utf-8?B?UUd0Tno5N1dqcmxqVFJsOHl2U1lGa3hhdWNZeUlkZDBsb3BBWHd4cDFJN3FD?=
 =?utf-8?B?NDdWbTFITXdUMkl1RjhxY2ZIL0VHQlBJM3FDcEhYU2dSOUpIQVc2RGNVWFNH?=
 =?utf-8?B?SFA3bEtQUXljSHA3dWs4WXpQN3ZVdUNRSGNKNUY2TGx3My9UWldlRFhiQjJz?=
 =?utf-8?B?VjJTdkVKbHZCd2RxeThpb3lHNmtjbVdEbFRNbEpsMWtncHJGTFhQQStBRWxT?=
 =?utf-8?B?ZGtUMWR3VmJ0RmNES203elNyYjFEMmR3aFM1RzNqWFEzWU1sc0ozN2NNaXov?=
 =?utf-8?B?WWxiby9nbUl4a0V4QTdrOFNnbU5PQkUrUEJoZ0huczFPbkdPVS8zaHBzVzk3?=
 =?utf-8?B?SS9yM1BJRWJ0TG43MWZtQ09YUmJZT3RCSVduOVZUMk5XT0tQOS9oTW9CZHdk?=
 =?utf-8?B?V0t0ZW54UTB1QjI4T1JwNHV6WUJvcGJTSStvSU5INE02QkR5SlBSM0lscEJr?=
 =?utf-8?B?NDVMQ1o0dGNRYnVxRnpsYmt0M1FteUZ4Qi9xWDdWOHdhK0tRTzBUdm9wckpt?=
 =?utf-8?B?K0RTNlhsUVE1cDQ1dkVDVERQRnN0VW41MWNLVXREdGkreVA4WTd1SlVjSU9W?=
 =?utf-8?B?YVlOU3VJSktWWHVIYW9GQ1A1Y08wWmc3MFBTbWlCUGFJa1BhNnJwWXp0UDlz?=
 =?utf-8?B?Y0lScElQL0liRmhUaDVtME1yUEszbTRvVGdzQ3pxMWlJdmRyNVZKT0dsZjRX?=
 =?utf-8?B?S2ZtK2dQak15cit3YlVNQk9KNmdaa0tFeEhlbmR2VXY2QTRyZnlqU2NZUXJy?=
 =?utf-8?B?ZTZxaURFMkt3RTBtK2o5Wm14VzhsemhYSkVUVElsSWZ2YjBkM3dHVjAxWVR4?=
 =?utf-8?B?dFFLR090UnRuWHNoVUlHSm0xdVQxTGtDRzNja2psbUd3eFY1VjlMM3dBWVVB?=
 =?utf-8?B?SXRPOHJDd1IwdzJtUElPN1Q5d0pyNmJRRzd6dk43WDd0ZUNBM1RVRll2UHNq?=
 =?utf-8?B?RU0rRkROVU5iTnhiMDRTcVZMdmxSR2dlYlVvdTMxTmVKQnNYZERqeEtsZ1cz?=
 =?utf-8?B?aSt1WTlqdnAzZWxEWnh2Q2NHTHdrYUN4azFSK3BwTnRYc0dVY0lLemRrU2px?=
 =?utf-8?B?VWdTQXhyZDVmYyszd213UHFCKzk2TWJhQ2FsOTRMcUJSa1phZDEwdkMvNXZv?=
 =?utf-8?Q?JcWECOAOqFad+wfLSfuKGjsf3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a91232-9d12-41b9-f979-08dd4c408703
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 15:10:18.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4I5CdKPrufhOrHCN7PMsGRVpj6yGTFXrotmPTjMl3MTmwNf400xzmZJCtmuxcFg1GDIW8Wi1dLYr0sS67975g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7715

On 13/02/25 19:35, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7b7a883c7f4de1ee5040bd1c32aabaafde54d209
> commit: 0b6914a0121b4c9fc8f575b60a5dd43b74612908 [1858/3437] ASoC: amd: ps: add soundwire dma interrupts handling for ACP7.0 platform
> config: i386-randconfig-141-20250213 (https://download.01.org/0day-ci/archive/20250213/202502132134.BlkNw1Iq-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502132134.BlkNw1Iq-lkp@intel.com/
>
> smatch warnings:
> sound/soc/amd/ps/pci-ps.c:68 check_and_handle_sdw_dma_irq() warn: inconsistent indenting
Will fix it.
>
> vim +68 sound/soc/amd/ps/pci-ps.c
>
> 95e43a170bb1e9 Syed Saba Kareem 2022-08-27   23  
> 4516be370ced14 Vijendar Mukunda 2025-02-07   24  static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32 ext_intr_stat,
> 4516be370ced14 Vijendar Mukunda 2025-02-07   25  					      u32 ext_intr_stat1)
> 4516be370ced14 Vijendar Mukunda 2025-02-07   26  {
> 4516be370ced14 Vijendar Mukunda 2025-02-07   27  	u32 stream_id = 0;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   28  	u16 sdw_dma_irq_flag = 0;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   29  	u16 index;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   30  
> 4516be370ced14 Vijendar Mukunda 2025-02-07   31  	if (ext_intr_stat & ACP63_SDW_DMA_IRQ_MASK) {
> 4516be370ced14 Vijendar Mukunda 2025-02-07   32  		for (index = ACP_AUDIO2_RX_THRESHOLD; index <= ACP_AUDIO0_TX_THRESHOLD; index++) {
> 4516be370ced14 Vijendar Mukunda 2025-02-07   33  			if (ext_intr_stat & BIT(index)) {
> 4516be370ced14 Vijendar Mukunda 2025-02-07   34  				writel(BIT(index), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> 4516be370ced14 Vijendar Mukunda 2025-02-07   35  				switch (index) {
> 4516be370ced14 Vijendar Mukunda 2025-02-07   36  				case ACP_AUDIO0_TX_THRESHOLD:
> 4516be370ced14 Vijendar Mukunda 2025-02-07   37  					stream_id = ACP63_SDW0_AUDIO0_TX;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   38  					break;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   39  				case ACP_AUDIO1_TX_THRESHOLD:
> 4516be370ced14 Vijendar Mukunda 2025-02-07   40  					stream_id = ACP63_SDW0_AUDIO1_TX;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   41  					break;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   42  				case ACP_AUDIO2_TX_THRESHOLD:
> 4516be370ced14 Vijendar Mukunda 2025-02-07   43  					stream_id = ACP63_SDW0_AUDIO2_TX;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   44  					break;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   45  				case ACP_AUDIO0_RX_THRESHOLD:
> 4516be370ced14 Vijendar Mukunda 2025-02-07   46  					stream_id = ACP63_SDW0_AUDIO0_RX;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   47  					break;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   48  				case ACP_AUDIO1_RX_THRESHOLD:
> 4516be370ced14 Vijendar Mukunda 2025-02-07   49  					stream_id = ACP63_SDW0_AUDIO1_RX;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   50  					break;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   51  				case ACP_AUDIO2_RX_THRESHOLD:
> 4516be370ced14 Vijendar Mukunda 2025-02-07   52  					stream_id = ACP63_SDW0_AUDIO2_RX;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   53  					break;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   54  				}
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   55  				if (adata->acp_rev >= ACP70_PCI_REV)
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   56  					adata->acp70_sdw0_dma_intr_stat[stream_id] = 1;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   57  				else
> 4516be370ced14 Vijendar Mukunda 2025-02-07   58  					adata->acp63_sdw0_dma_intr_stat[stream_id] = 1;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   59  
> 4516be370ced14 Vijendar Mukunda 2025-02-07   60  				sdw_dma_irq_flag = 1;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   61  			}
> 4516be370ced14 Vijendar Mukunda 2025-02-07   62  		}
> 4516be370ced14 Vijendar Mukunda 2025-02-07   63  	}
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   64  	if (adata->acp_rev == ACP63_PCI_REV) {
> 4516be370ced14 Vijendar Mukunda 2025-02-07   65  		if (ext_intr_stat1 & ACP63_P1_AUDIO1_RX_THRESHOLD) {
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   66  			writel(ACP63_P1_AUDIO1_RX_THRESHOLD,
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   67  			       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
> 4516be370ced14 Vijendar Mukunda 2025-02-07  @68  		       adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_RX] = 1;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   69  			sdw_dma_irq_flag = 1;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   70  		}
> 4516be370ced14 Vijendar Mukunda 2025-02-07   71  		if (ext_intr_stat1 & ACP63_P1_AUDIO1_TX_THRESHOLD) {
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   72  			writel(ACP63_P1_AUDIO1_TX_THRESHOLD,
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   73  			       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
> 4516be370ced14 Vijendar Mukunda 2025-02-07   74  			adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_TX] = 1;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   75  			sdw_dma_irq_flag = 1;
> 4516be370ced14 Vijendar Mukunda 2025-02-07   76  		}
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   77  	} else  {
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   78  		if (ext_intr_stat1 & ACP70_P1_SDW_DMA_IRQ_MASK) {
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   79  			for (index = ACP70_P1_AUDIO2_RX_THRESHOLD;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   80  			     index <= ACP70_P1_AUDIO0_TX_THRESHOLD; index++) {
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   81  				if (ext_intr_stat1 & BIT(index)) {
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   82  					writel(BIT(index),
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   83  					       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   84  					switch (index) {
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   85  					case ACP70_P1_AUDIO0_TX_THRESHOLD:
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   86  						stream_id = ACP70_SDW_AUDIO0_TX;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   87  						break;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   88  					case ACP70_P1_AUDIO1_TX_THRESHOLD:
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   89  						stream_id = ACP70_SDW_AUDIO1_TX;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   90  						break;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   91  					case ACP70_P1_AUDIO2_TX_THRESHOLD:
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   92  						stream_id = ACP70_SDW_AUDIO2_TX;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   93  						break;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   94  					case ACP70_P1_AUDIO0_RX_THRESHOLD:
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   95  						stream_id = ACP70_SDW_AUDIO0_RX;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   96  						break;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   97  					case ACP70_P1_AUDIO1_RX_THRESHOLD:
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   98  						 stream_id = ACP70_SDW_AUDIO1_RX;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07   99  						break;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  100  					case ACP70_P1_AUDIO2_RX_THRESHOLD:
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  101  						stream_id = ACP70_SDW_AUDIO2_RX;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  102  						break;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  103  					}
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  104  
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  105  					adata->acp70_sdw1_dma_intr_stat[stream_id] = 1;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  106  					sdw_dma_irq_flag = 1;
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  107  				}
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  108  			}
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  109  		}
> 0b6914a0121b4c Vijendar Mukunda 2025-02-07  110  	}
> 4516be370ced14 Vijendar Mukunda 2025-02-07  111  	return sdw_dma_irq_flag;
> 4516be370ced14 Vijendar Mukunda 2025-02-07  112  }
> 4516be370ced14 Vijendar Mukunda 2025-02-07  113  
>
> :::::: The code at line 68 was first introduced by commit
> :::::: 4516be370ced14c4fb454fd6cc016e47bffe109e ASoC: amd: ps: refactor soundwire dma interrupt handling
>
> :::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> :::::: CC: Mark Brown <broonie@kernel.org>
>

