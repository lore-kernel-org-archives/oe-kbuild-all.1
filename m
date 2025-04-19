Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CAA1C6BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 01:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745026008; cv=fail; b=KKNjm/W5f4gAZBSRLyoU1Vy98fDQlUdZSPZ34BX3FvBGcEI/0/6LnnaL0d9DbTIVq8QsE6jWlEUuILDJd8z/hiFP+KDirhIRDrYA4nqm/D3nLtlLeAtnE1tSa6cr991H2eY//+U5gcsWOgvoMnMxvWioA33im1/L9auFG0np8os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745026008; c=relaxed/simple;
	bh=Ta+KOhRSJEdQ4aDlGbNcgpfcTkvANyxzoMsGICF/Iys=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SkTZUbN665FDm2UQQzxJcTbuExHURUSAxHZ22iX8hfAjty2kAyxQXF6qNkSTlGjnWXAEYQDDcfGdK6RBZ7HAFjxhUAy7Lb3XKfgj8J8WA2sFs5zRfV/ay9f5fBtkY6Ue9TYxqJNZhOWpiqdEZFBROM17toj7GXHc9qtmZ4YU7gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W0CjJsKL; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W0CjJsKL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClkZvRGHPHsQy07IkpcBk5eoYMGl/5aquh0ah83Ff4ZoYDplnteWpKpodQksICSWwYwLcFbuHa5vSGOXdo7sduEMGOil3YLYytUXeiL4sy2JygR5N0FwxgZoYkfRvgqWiLFdoicPluRT3x2B+u5dyG4B+trjLkgvwmxDSzFxERcTsTZmRZ2kTcKe/ykZ+DqIV4p41037rTpM/cuvt86JwnJW+tkPu4AWOFopwywU5uvZncpwmxDGMYYfbtcm6p8NSVk1Ybcus2YHHPIIvhh3DYgeiqmv4NCYFt3Een+fWMRc28t7rYNAGA0Wsp/fQuMx1ZYsJu4qTTuDrrm4iklcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FFZRrVmynFHtIIET9XqtIRDpH2x5bmO9cmdzp05fDg=;
 b=y96UiDIYvm+G0lB2UZdkZbtFaftJDHvSXt4W/MKcU93HGWaWhN9e1x0Fg7Wnf9a5f++xKC/WSmMwQ0zi5gPNDLwjVzvv0COIouRHQbx6qC+QsMh7iqB6UZ7b+4LvPf7CZJ7KJUj4icXkBbj/RNg9w7usEcKqA51OPbxM62LfWx5ef0xeiuq/QbCdCmcwjG/Gub0IQivEsWj2bHkONb4IoQnTVQULlH89gcYBPWIbjQ46rYFzFdKsSPsfYpSPZBiCU9s4uWi47hOOPpGZJvoHCFyyzfHiAJyideCJSnr00YCeM/G5T/neZ7Nlv9j07mRY8GZmtkkI4icYANSjhA/QSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FFZRrVmynFHtIIET9XqtIRDpH2x5bmO9cmdzp05fDg=;
 b=W0CjJsKL6r0+0xWgXczw3Fwqe+RXXcDPZvFrkw7a4v2LAmMv5797L6ceJ4eHHyN9FDmqW8ekt6MxrhMsM1S5jxeUDGHihLg8Upmev/XTxflZtiTelBcJU9SooSb1C0maSGILV4SY/l1seC0nYLuCakLO97GuGe+gWxww2aa5ChW54PJFYUBg8fxO9ruoMUbq4sxOVN59a9qJzuto0R62XDM5v1uu2e83Xk/e7Ynr5LDXvX3rvOyoEZY+vPEnm30BDUDJkPpmn7EFrlsqpHUu2e3AKA9rypvDATlX5hedZxEuDLaOPMmXhTGIUE5n6XVElZBZEGaEtD1IT+fizCrv9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Sat, 19 Apr
 2025 01:26:42 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%6]) with mapi id 15.20.8632.035; Sat, 19 Apr 2025
 01:26:42 +0000
Message-ID: <3d81befa-2066-48f5-9e24-2b7ceb079429@nvidia.com>
Date: Sat, 19 Apr 2025 11:26:38 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3573/4779] kernel/dma/mapping.c:922: warning:
 expecting prototype for dma_addressing_limited(). Prototype was for
 __dma_addressing_limited() instead
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Marek Szyprowski
 <m.szyprowski@samsung.com>, Christoph Hellwig <hch@lst.de>
References: <202504190615.g9fANxHw-lkp@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <202504190615.g9fANxHw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY4P282CA0009.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::19) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH3PR12MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: 91346b5d-4a08-4c2d-ff05-08dd7ee13da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnNkSC9iWWdXZzN0OVA1bWc2S0FjUkVNOVQ0VC9OY1A3NXpRUlhudm5FS3hU?=
 =?utf-8?B?dnBCWURZdHJWVkVUUmUzQU55aUJjWDQycGpFNkhMbytYMkc1OXRRaTFYQU1U?=
 =?utf-8?B?TUhrNlNKa2crWlAzcnVKV3JHQk1mV3B4dnZnQVpId2JLOXVRM1lpbldOLzIy?=
 =?utf-8?B?blRmMkJqVXFDWFprZmJLUy9ab0laazR6bXV3dHNFdmlxU2JZemtwdzRPMHEx?=
 =?utf-8?B?MFQ4a0lYN0xSNVMyaE5qdVprd1U1d1B5MnpSTnRxc2FSdkhsQnJuVVpsdktI?=
 =?utf-8?B?dTB4LzRSdFNlK091Y3NRVnN6TFlpNlJuOUk5dks2ZldRQU9Xb09JT0VheVI0?=
 =?utf-8?B?SExYUnE0RXU4ZlBrWEpHTG05ZkhKVnpSWnRRWmUrSTNQcUdQMXVFSWpBRmNP?=
 =?utf-8?B?RWNMR2xaWlBxMFNUcnl5Tk9uaWhpWmhuRlM3bFhOaG8xUDZYbks1b1JybU42?=
 =?utf-8?B?S2V5L2NZalYvTGlObGZ1M0U2Si9tQWxlM3Fyc3hDYVlMMTl3TGtpS2JhbkVo?=
 =?utf-8?B?SG10QS9RbHo5U3B2V3Z6U09Kb0VKZjFENWtPY2VhTitYTmFNSERQMS93STZ4?=
 =?utf-8?B?UHpPZ1EvNUcxVnpvVUcyUFZJWWhWTVRvbDFGVUxhWFJ4YzhuRGQzN3dWa004?=
 =?utf-8?B?aUlyOGxwamM0M0EvL0pERkd2Y3NmOFQxQ2RqRGZtcU5TL1dTcnVaN0VsbXgy?=
 =?utf-8?B?a0dBNWQ0RUcydmdDeVRTVUhRbmRyWUJtNnZYSngvR3NjVkhsSjVuTm9xTFF2?=
 =?utf-8?B?L3lwa1JYY3RyQStOcVRsWUh1K2dUTE9nZzJESTNvUXpsQnJ3R09JRUxhYko4?=
 =?utf-8?B?eTViaTJPRlViTjdLUzlXOW5JSU5OTHJweXAxVm9OdExkbGV0UVZ5bE9qQjF5?=
 =?utf-8?B?MWl0aGN3dC9sK2NrbjZLSytQQTVJUkVNZm5BTEI5Y0Y2QUptMU01MEtWUDE4?=
 =?utf-8?B?OFVCZVlkaitVaDVsOXhZRmJZWlAwNFhKRHM5MDZWNkROZU92cDlmckgyS2Fn?=
 =?utf-8?B?V0RvNTNKbDhoUSsvTHRWc1FsYkpkQmo2TmR1VFM0Rmlwb1pHajQrTUdFR1Bw?=
 =?utf-8?B?WDRlV2JiY0wyT0Y1dW8vcW00cWRKdG54T0s0QytnOUozaEl1OUtBTGRXTU9l?=
 =?utf-8?B?c3lMdVp2djU2cG9KOWlaZlc1YmRoSlBYUk4vYkR5aVhtMkhFK3RaQXBzT0NB?=
 =?utf-8?B?ZmlCdHQxZVU1YlZ5VlpHVlJlR1luSkl6RWx0MnVHWWlFTThOdTVzS21PSnE5?=
 =?utf-8?B?QmxrWVhPV0pjLzRrR0p0YWttV04wRjN2enNrWjZHL2VHbVIvTThuU0NMU2tu?=
 =?utf-8?B?RjY4Vk8yRVdpYnR0TkdqMXorZFZtNC81eFhsb2lyREZvejNyZHgwLzVORWpp?=
 =?utf-8?B?bDlMckczSWMzUURDUlNWck5iSDJnS0hRd1Fvalc1T0pHcEJ6b0JldjYrcFZr?=
 =?utf-8?B?RzVlT3YrODRncFJ3eTBMRHhCZWRXTndWVzdRTEZtNjRUTDNSR1h1OTlKTTFM?=
 =?utf-8?B?c0pzRG1DdVpmL3lUZGZHdEt5eGoxNmFadCtZczN1UGVnbW5KTW9MZG5NRlR0?=
 =?utf-8?B?NE0yMnJQYlNVUVBGTGlPb1pPQ0J5ck5nWU9CY2xJd0NFNjY1cVhBTnUwcERr?=
 =?utf-8?B?V1lnd2NnS1BkdGF5UEJJcFN5ZUxrYms4UllXNEdTUmZPbU9rYWpYcm1PNFBt?=
 =?utf-8?B?eDYzeEwxMjVCK2phMm9aaWpwU0NpYlNqWm0zZHl0UUJ5OUNndU1mNUV5NWJu?=
 =?utf-8?B?SEVONDRNTG9PNWJXSVRmbVpXSFRkM2lIR2hZQndpS3hlbFBOZkVseXdoK3Ux?=
 =?utf-8?Q?zSG+v8bT95/22Vqmml+PLjcGzLMC+YwsfM4Z0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N01vKytEUEdUS0FkZ1U5dXVtY2x0eXlSZlVlYzI0NC9uc0tDY0QxOXpWOEtV?=
 =?utf-8?B?aSs3WTVoOHZmbnlkUFVSK3NvUG5DUktqc3A1V0VvWTZUUEltUFJMWUFvMk1W?=
 =?utf-8?B?MDMxa0QyRThNcnhLNDMxYVlKK1lQMU5RQUY0VERQRGxDa2ZZNTE1WGszcXpI?=
 =?utf-8?B?RDZQU0lzcmNWbUVOWG1Sc2dra2ljSmRvK0tFTDZ1VFFCTllndlorMTBrNHVK?=
 =?utf-8?B?ekY3OHZzcENzT2gxUUZzRWJaY3VMbW9NZGhGaFRLNmhPdnFmNmtiZzRFRENr?=
 =?utf-8?B?Zzg2YVp5a1VWNFJiT0tLbkdHL1JhVThWcFd0bkR3eFY0aDJkdFJ0THVsd092?=
 =?utf-8?B?bm5QSjNTbTBlZktoeHRQcklrQkUzVG1iVlBQK2FYUHNwUndpcTBSbldwTGk2?=
 =?utf-8?B?aTk3R2s2Rnl3bStTQVlDeTkvZHVUek84VWtXTGJIUExzWXEraGsyWS9FTVh3?=
 =?utf-8?B?ZWtpZ3d3TFRyeXhuT0loMWtoVFArdkxNc2piSUEvUTBNU21pbXNwVU12MDVz?=
 =?utf-8?B?NjFsc3c0WDE4cWlMakEyT0phS05BcWM5MzJjczRXVkFRcVZkR1VDcHEzTWFW?=
 =?utf-8?B?NUE1KzZ4Y3M4M3JsWWJ5Ny9FNE1zdkNqbnUwV1JBWnhXZk9BNmNJbk5RN3VI?=
 =?utf-8?B?cEdwcVNYbEJKTmpGdWNvSTdtd0JEN1Fqd0NYR2N6dEt6SExwU2YvQU9sREdo?=
 =?utf-8?B?WVdEM2dZUkRndGVPMlRQSmFFdmlUbHMzWEdtR2pDcmZMZEs4SklOWDUyRTZD?=
 =?utf-8?B?OS9LUGhYUGE0MjRUYWs3bUtsUDlDMkVjSTFxUyszeWd4VFR2aGxCUE5rbUtW?=
 =?utf-8?B?SWhvMU9kenVVeisySUhiZXhUd3RHcHk1SzBXVVRWakRyOUorYUVTazVIRkwr?=
 =?utf-8?B?V1hkL0R0NVlwa3NNalo2czFzUFRYamcvZVpTKzdQYjlsNEhUelkrL2FPUlMr?=
 =?utf-8?B?MnBvUHVqL2tzdUc2L1AwNmM3WGhsV3BaQ2RWSzhON21NTzJzOTZ6WUM5Z2pJ?=
 =?utf-8?B?NHowbjUzc2RGYXVLdDJleSs0aDh3R2hWZkVrVm9uUHJjQkN5NDJFZGc5YmRC?=
 =?utf-8?B?VUVIeCtwb1lyeEZvVXB3WTNIWUo2SWNIR0FFVXlrOHFhNUVtV3g0MTllMmNn?=
 =?utf-8?B?dlpLSUxveEpuVWx1ZWk3TDNaRjNrWDNCdlRNaU5aZFdLSHpjRlh5SHNxWDgw?=
 =?utf-8?B?VUpuakFmUkpHSUU2dlQzRm96Vlk5c0toTmpHRFQ3eERvQVNJQXl4T0VBdU51?=
 =?utf-8?B?VzZTRXVvaXd1WGg3NTZMYUZwWmEyeldZTHNraW1yTDgzZmJ0SDZ6SGEwcy9w?=
 =?utf-8?B?V09TUHlzSVFUZE4xaDJVQTF6MUxuZW9LRzZ0eFM4VnlMTGtOenU4ZlA2ajJp?=
 =?utf-8?B?cW5TSEQxRy8xQ3Q0Y1NlTGxFazF0U2lTbStYOGdMdTZYVHljSGhaT3R5bmpu?=
 =?utf-8?B?bVM3Z1ZBbS8vazJ1c2F3cy9wWElHVXRicDZqSmV4Q3pOZ1VxdDJySnZPbEl0?=
 =?utf-8?B?cVhjdS9STFJxcUFHdnRITDlzK3kyTUJVbUFGRzRnMmdUZXl2MWt1MG1pdFQ2?=
 =?utf-8?B?N0lDcFlQcmpIS21jWGVHb3RFemdST0duUlo5N1Jyak5ZL1hIdURWdDRvdVJk?=
 =?utf-8?B?WVFNaEZWays4Y3U4REoySkMyNlVEK1RUZ1JqSmFuTzZXeSs3WjJkRjgyem5n?=
 =?utf-8?B?Zld5WHBFcjJKcEFMbnZYZ3RMYzV6T1FrTjh5V3UvR2EzY25rK1hmWXhPRzUv?=
 =?utf-8?B?WWVVRjBNU21WdkZCWUZoU2NhMDhkcTlVNW5kNm85S2NaZHhIV2UwSHlUcjZV?=
 =?utf-8?B?S21zMnR4Nnkzd0d0bVNkYVNldUs4MWtFeWsvU004Y0JpTC9ZbWZvUmkvSncw?=
 =?utf-8?B?KzVkeHdIenQwQVd2dW5HOUd3akRhU0NEbXN1eCtNRDhib1laRXoyVzJjdFdD?=
 =?utf-8?B?VlhDSzY5a21IUnB6cXNxcHpvdStyY2Z2ZzZRUmFZVCtyeFpGb3REaDVnK3Fs?=
 =?utf-8?B?UWxIMFpVSDVxWnpFU1RpWFFVRjY0YVplc3JIb3ZKanZHSmt4QVBrZ3hYMHFB?=
 =?utf-8?B?UFJWbzc3dytKTXRjMHdNWGphT2drU0ZrcmRyN0F5QWZtMlFNUzdrWTY2cXd4?=
 =?utf-8?Q?/4ikFWUytaTL7zaFdECW/Zq4A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91346b5d-4a08-4c2d-ff05-08dd7ee13da8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2025 01:26:42.4944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkfQmsepeEyZN5/Y41b9YygRawNIKc3RFyhQNDLFPfgtjPsYUcI+tWQ9mrDhloPKYdjdPluXzrt/pZDAtlfE5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023

On 4/19/25 08:07, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
> commit: 2042c352e21d19eaf5f9e22fb6afce72293ef28c [3573/4779] dma/mapping.c: dev_dbg support for dma_addressing_limited
> config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20250419/202504190615.g9fANxHw-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190615.g9fANxHw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504190615.g9fANxHw-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> kernel/dma/mapping.c:922: warning: expecting prototype for dma_addressing_limited(). Prototype was for __dma_addressing_limited() instead
> 
> 
> vim +922 kernel/dma/mapping.c
> 
> 8ddbe5943c0b12 Christoph Hellwig 2018-12-06  912  
> 8ae0e970319ac0 Jia He            2023-10-28  913  /**
> 8ae0e970319ac0 Jia He            2023-10-28  914   * dma_addressing_limited - return if the device is addressing limited
> 8ae0e970319ac0 Jia He            2023-10-28  915   * @dev:	device to check
> 8ae0e970319ac0 Jia He            2023-10-28  916   *
> 8ae0e970319ac0 Jia He            2023-10-28  917   * Return %true if the devices DMA mask is too small to address all memory in
> 8ae0e970319ac0 Jia He            2023-10-28  918   * the system, else %false.  Lack of addressing bits is the prime reason for
> 8ae0e970319ac0 Jia He            2023-10-28  919   * bounce buffering, but might not be the only one.
> 8ae0e970319ac0 Jia He            2023-10-28  920   */
> 2042c352e21d19 Balbir Singh      2025-04-14  921  static bool __dma_addressing_limited(struct device *dev)
> 8ae0e970319ac0 Jia He            2023-10-28 @922  {
> a409d9600959f3 Jia He            2023-10-28  923  	const struct dma_map_ops *ops = get_dma_ops(dev);
> a409d9600959f3 Jia He            2023-10-28  924  
> a409d9600959f3 Jia He            2023-10-28  925  	if (min_not_zero(dma_get_mask(dev), dev->bus_dma_limit) <
> a409d9600959f3 Jia He            2023-10-28  926  			 dma_get_required_mask(dev))
> a409d9600959f3 Jia He            2023-10-28  927  		return true;
> a409d9600959f3 Jia He            2023-10-28  928  
> b348b6d17fd1d5 Leon Romanovsky   2024-09-22  929  	if (unlikely(ops) || use_dma_iommu(dev))
> a409d9600959f3 Jia He            2023-10-28  930  		return false;
> a409d9600959f3 Jia He            2023-10-28  931  	return !dma_direct_all_ram_mapped(dev);
> 8ae0e970319ac0 Jia He            2023-10-28  932  }
> 2042c352e21d19 Balbir Singh      2025-04-14  933  
> 
> :::::: The code at line 922 was first introduced by commit
> :::::: 8ae0e970319ac0b516d285650a744bab4ed3dd37 dma-mapping: move dma_addressing_limited() out of line
> 
> :::::: TO: Jia He <justin.he@arm.com>
> :::::: CC: Christoph Hellwig <hch@lst.de>
> 


I can't reproduce this warning with gcc 14.2.1 on my system with W=1. Assuming that the warning is for the
kerneldoc, I can send a patch out to move it to the right function


Balbir Singh
