Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5548F19A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099389; cv=fail; b=ARz/QpBxb17zPSSdJPAF2Pr9ved2sDPGMew7WVU2zV/vE+XZPzE7rc2X03PHAnTkv4ekQEXfyluUx6hYKOVPH0gMEoFcLUrcGZ+SJw+ipMZIEBGtw9Y88XQRl6zl/oeTbG1trhgCUL8n/5lw04fCg+VLvgU+PI6NJ0UUeJAGAWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099389; c=relaxed/simple;
	bh=TEmEFImSIPGNdboUUSEZcoPIp2FRxm0mMZQnr/7b/Cw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OMFdiEU4r99KqRyZuhyl2uTn9XXjdRR1Hi/Oyfr2SchU2XcCypi6v41t7fH7nTCDyVGVyNrPejUFfN9iftv+xddDSywWbCtO2/6K9Plx21QmYk0tMX/YbjtV9Hw+2bVWik3GAfTA15wc2xNr45t053CPzzJW3wPdiixqJnq/f3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l4lRGsJg; arc=fail smtp.client-ip=40.107.243.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l4lRGsJg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3J81YFyyXHHaKs+q4kZMf7fMOSOvSUnwAa2xqakz2gSxcj0zdOm5jjkcBpMqIFjw7/E3m5BJYNntD5ruAiSgTFFuKr6MDF1UXRLc5gTPBbUdPWb4dDT7MO0xjh/jtKwsU7KPkSE8F6JCURxDh9M1eFKTTKrAPdY6pW2FnEnmG1SvLNVwoZQcuFI+bAYrwI/faWRlDSJpbDuGw1SGsTyP9R/nwS5QAgPmjX6U5RaZlQdIerF56SR4+0Pl52IL82nrJcNVeSTUxbGEBkEqUJ31XfCRb2Nb4q+KUAW87v5FB5+nrIx/5TorwDwKN1llj07FAF9H5xOwExHzGsahCGWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZqSDYE74ihBrv3zphzbFkMlVGvyFruLQenKoTOvSUE=;
 b=qSWJ5XMqS7qCrLzRIn1p7RQXZW8k/EJzGX/87RHz3wTUy13sJ9PqptxKmpQd2zoUv0kk74Di3Uq6OKOYZwyVv19rodBxo4Pe1/fi1CPw6Ndu/sE8K+1K0w94xuEXOnicrS9sndRa8ef/e8bce8QDunVv+GdDfRY+fw+Tku1mvZLDZR89lwgoHFZ09rzwlXrMnMyKG0lyxZ+HjsfShNkJdCRhUTXA2wgzTlmZLEmKJ7zWmfMvtobC9gcrjOjqT3UmiPq/GvPT17EmB8Vdw/n4zD1SiPGdwuecEjRAnS0ua2Lwc74VtO0CtU8hx7cnyidhDj0QRJHpoyTxnYAbOVrjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZqSDYE74ihBrv3zphzbFkMlVGvyFruLQenKoTOvSUE=;
 b=l4lRGsJgPVw8chLeZSG29XdkA2YfZF0OVsiUgkZnpolotz629T/r4iRBzALKhmHGHdeL0OuMXAAryZS6UANIoIJHupmb+dNArdUXBQtyja9RiRB0K1W1tNgu/80CGAczqQrVbIk1B69ISNAaT33fk6bBvsNNT3N0I95bKVM8LBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Thu, 1 May
 2025 11:36:24 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%7]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 11:36:24 +0000
Message-ID: <1967593d-8084-4a4a-b384-35d5adc54eb4@amd.com>
Date: Thu, 1 May 2025 17:06:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 272/272] fs/jfs/jfs_metapage.c:637: warning:
 Function parameter or struct member 'mapping' not described in
 'metapage_migrate_folio'
To: kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202505011647.L0LGO7Lm-lkp@intel.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <202505011647.L0LGO7Lm-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::20) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|SA1PR12MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: f161965d-8c28-498b-efeb-08dd88a466be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkpkcjRySUdJVE9Wb296VzV1NGt3ekgyQ0VsT0o1SE93NnRJc0U1ZXY5L2lv?=
 =?utf-8?B?WTNON3NTdUhTUTdZWkRjN01oaXlpdnk0UUpLd0R0OVZsL1RCc2tmVjI1REtl?=
 =?utf-8?B?R0dLOVRKelAwWlNiUXI3azIreG81RGlmOU44cWt3eWtKTXFFVXdCNzZOUHZm?=
 =?utf-8?B?ZnllTW9BSmJUSTNGb2R3cWpIZ2pTTTN4R1VmUWhUN0xXWjBtYXBrSjFabGFp?=
 =?utf-8?B?VitWcUVhMmNiWW1OcmpidGtxOW8vNWdObjAwbi9HWG1yUDdrRy85djdybW5I?=
 =?utf-8?B?S05XUnhGV3I2bmdCSTlvVTZYZ1BMTjdsU2VHYkJSdmlCY0JQU0xRLzNTeGRq?=
 =?utf-8?B?bUJoZVZydlR2U2g1WVU4djhUN2hhdDNudjJrNXJxSTNtVDdnZEJSNmlQcFkv?=
 =?utf-8?B?SFgxUDFja1V3MG5KV0c0a09naWRaYzF2SXBaSzFucSs5Uk5wZnJHd2FNaDF6?=
 =?utf-8?B?dHBCVUh0OTFUQjJpN3pUbWk5b3A2bUk5WVBYUC9jZzBTMXZyU0FQTTZUZWJR?=
 =?utf-8?B?V2ZGakpHbEszOHAycS81UGM2YW1uUTJVaXp1bExWT1dId1RkYU1rUi9EN0hn?=
 =?utf-8?B?aFJqcjhWUndYSDV3LzNFT0xYbjdXVG45ZmNyWEtSUW4yY296VW5lTWY4eVNw?=
 =?utf-8?B?a2dQamJvZjlsOTRaamE0cUVWRG9JcmRITU5CQ3cwOU1rTy9OV3JSYiszSkFv?=
 =?utf-8?B?Z2RldWZSeFJjZ0grUUxsTUZQUkFwdW5HQmY4QXNqTjcrYkFJaFJWZURlRGg5?=
 =?utf-8?B?MTAwVEpDQWI5R2hYWGZMZmhiQUtMVmxpNml4cFFMTkJsaHpKS0FYbGZ1bUZY?=
 =?utf-8?B?M3kxSkkrRG1NMS93a0tIN0FDc3h0Y2ZvbXYzcGhFQVZmTDlVQmpMa3pyQmpO?=
 =?utf-8?B?blduOFVZMjZxaFZJUGVieXJMTFAxamV4UnlHdVVzVlNiR25lRFFOODN4amxm?=
 =?utf-8?B?ZUtOd1dzUFYrbitKUnJ0eGJMMzV3ZXpQREk1VWQ2bzIvUnR4eHA4L2xWYlBO?=
 =?utf-8?B?ZXQweG9vZnZCTWNTT29Sdms3MFRrdEUzY2dLQlM4M2RFTG1GZzZ4QUxDaVNG?=
 =?utf-8?B?NUtveVp1bm1tbEhCYk4xSDFlUjRXczE2RWMyOVlBVy8zd2FTejN6TTVQdVZp?=
 =?utf-8?B?Y0VKb2dsS2V2ZVg1YlRMb3JFTGZsNDh4Zm5RSHRzdVNSbGlzK25uMytPL25G?=
 =?utf-8?B?dTNhMjdtYTNLNDdIQk8wWGhUQlEwcUdOUEJib0IxQS9ZN2hDdjFLLy9NTUha?=
 =?utf-8?B?REVuM0NiMzBlaCsxRk1DdldFMkZCMmY4U205OS9YYWtRNitDNnQ5dXRmRmVi?=
 =?utf-8?B?NmlHa01JWHl4Yi95NHRkS0lBSTN6eWh0M01qQjhIVWRPWE1lQTRzeU5BYXpw?=
 =?utf-8?B?S0pLTHFDYW05L1RtZ0VCRjlUNWp2SXM2dW9wSjRib2ppMy9YSHpCQkdna2hl?=
 =?utf-8?B?L2F5QjVYeDhwTkRGbWpIVEt2R2h1OXpCY2FIRWM5akFmSXBqNmU5RFlqYTdv?=
 =?utf-8?B?SWE4bVhVcnRrTHhmQjY2WExYa2YwODVXWGNidDB6aUZ4RTBvZDBJd1FwNzU1?=
 =?utf-8?B?dFZYRmF0NmZRRWZHeFNVVlZFMTU3M3Vkem55RHZhQTNhZmFvSGF2RzdRUzlO?=
 =?utf-8?B?YXFDaGY2MStzb1FMZWdpVGN6QW92c2V2OC9oYzVCdG1yS3kxR0JyQkw1SlJD?=
 =?utf-8?B?OGUvM280cE9ZMTJVU3V3emJ0T3M2dzhQdVMzb0txb2VOUFhBaVRpcGk3dlZL?=
 =?utf-8?B?ZWFkNlBuMEJsYVd3SmVyYUEzRDMyQkNScnJhYWdNenlMc09DMzFvK1FMQmla?=
 =?utf-8?B?c1YxSndKR0hTSUx3bUUzWEk4WERVaExHR0lZbU9ocVdhaHFrN2ErbTlKWWs0?=
 =?utf-8?Q?mJTFl6z/4p2w8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXZoSjhPcUtGcFhmNmp3REp3TDRobVh3S0tWMXdITHdsS1BMbFpDazAyUUk3?=
 =?utf-8?B?ZW9iNFhTUW95SjRDcTc5SG9vbGx5UGVoUDdkaWhrakRqVU1YZjNoaEsyVFJW?=
 =?utf-8?B?b3ZMeGVmUlUzb0xEYkcwNkhPVUhyTDZtM0hOWGdla3pnWVVWYk9FRGVXVCtq?=
 =?utf-8?B?KzV6aXdKOWJnQTVQUStyTVA4aHhyTXVmQkpuYzZ6WUNZVmN2bmhkeVN4cVZW?=
 =?utf-8?B?Q0Q5NThnd2ROYW1abnhMVFpjeHlPQVJ2eDRETHR6VUl2b1hTejN4RjdhTDNn?=
 =?utf-8?B?MnU0ZTJibUlESC9aTHRvV1pXMG80VWprMU80UkRHQlprc0UxT1RSTFgvU1ll?=
 =?utf-8?B?ZVBSS2lRZktpVGJ3bklnNkJNZ1lyZGNYZkQzSFlndFhLT1V3NUZ4SGM0MG5r?=
 =?utf-8?B?NlJabzVlWlRkMEljUjkvdVptVXAyOXNQRTR2aGVwTkJRdytGRWpYWHVlc0l0?=
 =?utf-8?B?UFFwbnE0V3pBU09TdExJUUFYckdiMHAwQnQ2d3NWeHAzaFIrdlJwR0xYWkN3?=
 =?utf-8?B?a0YyQ2g5alhjME04TThzQkNwZThBbXlqUFhoZURjUmhhRys4OGowYzNZMFNI?=
 =?utf-8?B?YmR4aUtKNVBwQW02TEVESDhoSnVBZTQ4NWdOZXJKaFpudXNNME9BSUpXTHh6?=
 =?utf-8?B?Q1poSkN0SmJkQ3EwVjgxUXlvMENBRnpsQnM5bmJvbzdOU3lISXY5ek1Wd2xG?=
 =?utf-8?B?Nk00VUJKeWJVWUFQczFrQVN4YUY0SndxWjlYQ2RjNFFlUXhsSHJXanhzTmdn?=
 =?utf-8?B?UUhrMzhGNWxXNnZEWVVndkZZSE5uUGZwRlNlbmRqL09Tb1hkd1d2ZHFYdjU2?=
 =?utf-8?B?K2p5UWZIcHN5TjhUamhGelJuRWdMdjIxT21vaUhDM0ljdndoMUd0RjRNb2xN?=
 =?utf-8?B?QkdFSW0yTWlvdENMZ1QzSWVsODlTZjJ2ZXQ3dDJCdUpUYzdDSEhVTDJtLzdn?=
 =?utf-8?B?clhVa1dxbE5rSmRQRitRUGFNYkYwU0l6MS84d1FxS2tVUmk3bmw5eGtVK0Nv?=
 =?utf-8?B?Wk9aZklobkhaWE5NKzljQ3RoQmFWbU54N2c1TzVHNjVyakVIeE1Gam9jWTlO?=
 =?utf-8?B?Y2FkYnlpdjFIeG9GWUhlT2w4Y2NlR1NKRG9xQk44Z29iUEJ6eE5pdStaSkZF?=
 =?utf-8?B?bDZ3bkZTdG1nUkZseW5PL0lQWk5kMWtld2szQVV5S3RRZm5BZFRrbnRZTmwv?=
 =?utf-8?B?Z25kd3ltcnBQMDN4bFo3NEUyMkFSUnhkSVh2M3FUaFg5WDRtc201aXFOdVEx?=
 =?utf-8?B?cGtFOGlWbTk4NkExVzhwTlBoZDI4MHBPdTFZNG9sc21DL2pMaUMxd2QxK2xp?=
 =?utf-8?B?OUxHN0tnakZLZzE2WmtlSHljVFlTS0Mwd3R4dllUREQwTW9rR3gzWFN5dWwz?=
 =?utf-8?B?Y0VhRlRCWEZ1c2pyYmRqQUUvOEEvc0pEVnBpOGNlTXlKWllQbEtmMS8wejRx?=
 =?utf-8?B?eVNpaEJtK29CWXpCMmFMckpWaEZhU285Zmp2RnJMb0FsR2J3THVRRi9WMXRS?=
 =?utf-8?B?TXhkT0Z5MGJZWG5BakJHZ0ZvSEdmaDBodDVQNmxlbWZ6R0MyWnpXNkZuNm4x?=
 =?utf-8?B?cEdjUytURVVCY0NRSnJuRXVXQnVoVnNsYmgyS3ZYenNnV1l5ZHhNRHJTNVAx?=
 =?utf-8?B?TUE3K0hwOG4wUXNUa1YxMk1iTHFYVnVIUzE1VlhHZzdUdGdma1BuMURxdDJJ?=
 =?utf-8?B?MmRIRzdNTS9mLzdaY0JWUjNkL1p4QW41bjJYT0dHY0Z6T0JpbFdEWGJ3L0tB?=
 =?utf-8?B?aHhtQmhTNWdQVzBaWVhvNXQxU05YWjNWMmJHeSsyZW5FamlWT210SmtPdVRa?=
 =?utf-8?B?akVOd3VSd1BmNFhHSXRudThqSUgvK3I1ZDlaUjI3ZW5ZRnRpa0h1RWVXNXVH?=
 =?utf-8?B?RDdJMjhqaGZ0MEZoN0JkS1RkZmF3V3A1dmcwdUxJNVBzOXpUOWhlV1UwTTNV?=
 =?utf-8?B?T0tSRTVlMjZRaiswUzUwTVdwTkRKMGxRTnFyRnhxZmhOdmd5SVVJNFd4MnNH?=
 =?utf-8?B?aHhCbFNkZUYzRTI3UzZVUmZUQnhnc3VRY1h6TjdFb0R2NmhwQ3o2WjJZUFIw?=
 =?utf-8?B?WC9pVms1cjJCLzZaY0FWenJYZ01nRVEwVjE0ME1zQUFuYXZzOXZHTXE1TkVQ?=
 =?utf-8?Q?5laXJokOjxVwn96+YxPQf6P/e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f161965d-8c28-498b-efeb-08dd88a466be
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 11:36:24.0405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd0oiIfz4luKiXJ3cosSjELmCgM1FbyiXJCRsrzR1SynPZ+7m4/3OcMxjtRumjfW57jfp2c1MuG3FXs33oz7jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344



On 5/1/2025 1:51 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   ea17e4fdc13cae144d90ce8561c2f50a49492037
> commit: ea17e4fdc13cae144d90ce8561c2f50a49492037 [272/272] jfs: implement migrate_folio for jfs_metapage_aops
> config: csky-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011647.L0LGO7Lm-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011647.L0LGO7Lm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505011647.L0LGO7Lm-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> fs/jfs/jfs_metapage.c:637: warning: Function parameter or struct member 'mapping' not described in 'metapage_migrate_folio'
>>> fs/jfs/jfs_metapage.c:637: warning: Function parameter or struct member 'dst' not described in 'metapage_migrate_folio'
>>> fs/jfs/jfs_metapage.c:637: warning: Function parameter or struct member 'src' not described in 'metapage_migrate_folio'
>>> fs/jfs/jfs_metapage.c:637: warning: Function parameter or struct member 'mode' not described in 'metapage_migrate_folio'
> 
> 
> vim +637 fs/jfs/jfs_metapage.c
> 
>    631	
>    632	/**
>    633	 * metapage_migrate_folio - Migration function for JFS metapages
>    634	 */
>    635	static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
>    636					  struct folio *src, enum migrate_mode mode)
>  > 637	{
>    638		int expected_count;
>    639	
>    640		if (!src->private)
>    641			return filemap_migrate_folio(mapping, dst, src, mode);
>    642	
>    643		/* Check whether page does not have extra refs before we do more work */
>    644		expected_count = folio_expected_ref_count(src) + 1;
>    645		if (folio_ref_count(src) != expected_count)
>    646			return -EAGAIN;
>    647		return __metapage_migrate_folio(mapping, dst, src, mode);
>    648	}
>    649	
> 

Hi Andrew,

Apologies for missing this kernel-doc warning in my local testing.
Below one-liner change will fix these warnings.

From a0685c29b71cf007bd7fb3e5ed58d1cb74e171a3 Mon Sep 17 00:00:00 2001
From: Shivank Garg <shivankg@amd.com>
Date: Thu, 1 May 2025 11:10:54 +0000
Subject: [PATCH] jfs: Fix kernel-doc warning in jfs_metapage.c

Change comment style from "/**" to "/*" as the metapage_migrate_folio
function comment is not kernel-doc.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505011647.L0LGO7Lm-lkp@intel.com/
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 fs/jfs/jfs_metapage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index f863ba521533..c37835d47821 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -629,7 +629,7 @@ static bool metapage_release_folio(struct folio *folio, gfp_t gfp_mask)
 	return ret;
 }
 
-/**
+/*
  * metapage_migrate_folio - Migration function for JFS metapages
  */
 static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
-- 
2.34.1



