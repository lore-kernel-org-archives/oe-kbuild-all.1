Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC15E2DECC5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762982395; cv=fail; b=bsmuF3dhVoWb9qNU09rzPrxumcpxOqvcbW5FOSPkYHQuR5MMasoybatF4Vw6YXebd9cWh46vwn/YY7zYWlEzMHSJXUPCxBrcDfyk3yl7toGP6HRrQ1ufkp6lcjLHrSzAX6t7uOcYRzKBZmJWoFL7xSp4STRhdtehzaJFuGlvFY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762982395; c=relaxed/simple;
	bh=uylcdOmBnxx/XGu78EM2PoiO2f48HwaVaNZkMZY9cPk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bs12pVLg6S+RVWR6YoXhQM6V/+qO+f9YGfDuJZE/RCkaNqqAtBJUKX/XfmOSAz/c8I9Zm2NSsrWf4XVlYllCcoxWje/ahI2SxoRgOH7aqEi5anz53Vx9B5+y4RKbHgYM1gmsDffIhExBM0ScisSm6Hf/GDdi4hBpgrDcdwEc2VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oCrvEDPL; arc=fail smtp.client-ip=40.93.196.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oCrvEDPL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zjehgwz3fzC7JaDOIgXlM89e5gNveCZasDPZ7GeRxl1p6fMPDLwJy8mKhgI+Ppa+V9VeZXBDg8YKt067km+PaQ5gfCpjQF2NeNmcvCrAC/684GFiElKFTCnE033uhUUkonuQ0fuCVKSKo8tfXFQmumR3DR5klZCYi+XUaKHg8syJdkBCnZCjYOjzQbl2Bc/Dbm9trpem9qjjdvPxi0IYRSxtpWQJuyubf09RYqWfAP2K7vN+MliEOF83NVkWWhjjv0X9Ue4di31xUGwVQ6DhycZ6Y4J2UdBuFw5DoMUlVHk3Xyh2R3UrGxgipXLkrvNGFOaJ+dJjeSyKTd8qtY3vgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCfeALJXTqxQptKoyZhgfk+Z6pf353N6RO+2EOgw7Hk=;
 b=oke/DnEAKsJkJBYV7Oyig7zzy7R3uCoZFP6iNsOceWfJ1DX8Q2qqkG+F/a4esK0twAiwlG5JIiuxdFEN2rFqbZLANQsukquDV5C5EpbAkWu12seBYKKB/goA/3/8QFDbpjUwR6BKbr3h3DxNy/ZhQy7ewmYrG5Hg9dSGfPnw8B1rtrHfFEVn7CLN2EPD1ADDBP2uQdf/lJuNLg7XxuBKqbZMw6eknfBNJg0tQycVjRHSlM02FE4aXLSqZLsOZ8XBovN8VY6WvSLHRWaSVs486BF5sGzqzPfE/qeCGAwaJ8cYMyBWSHoI98yvuM3HCRbDgITNs5LTkFKi80l6BDBWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCfeALJXTqxQptKoyZhgfk+Z6pf353N6RO+2EOgw7Hk=;
 b=oCrvEDPLWTH46UP35bL9DiYLuZDg20RyQIM7UdxBFdbenkX5g17JV+LUmVhpdhPVHGrhFFwUXNXAqHURJid8gWm/fIfu4t+fMK8u+P8X2/+h9aWPU08qbVWRXRxKRTVyKNnwlge4AkuivummPlkKKKYax1NIrs/vICco0kutYojEH/w+oF4pyZ9MXqsjPy8I439n9NTMvsOLcb6OtbTggQomcMCIneV8Fli+fD+p5nQsZIf2J2CMzSgEjwlphOWlBLNoqOqL6CzFd9226qZzweQy9hcd7yQyqnRIxR9ZyMDZNoScmSnUbX2y3FruIwAt+2VgqDuiTiX9g0+SEjpaDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 21:19:50 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 21:19:50 +0000
Message-ID: <4366d847-20b0-4828-8f40-203fed98401d@nvidia.com>
Date: Thu, 13 Nov 2025 08:19:47 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6752/7613]
 drivers/gpu/drm/nouveau/nouveau_dmem.c:259:13: sparse: sparse: incorrect type
 in assignment (different base types)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202511121922.oP20Lzb8-lkp@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <202511121922.oP20Lzb8-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3c210e-6e4a-4fb8-dcdb-08de223136d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWxkc0JNYVNjUTUzSjFFOWgyNjR2S043OHg1eWpVNnZ6QzJRMi9YWjljTlpv?=
 =?utf-8?B?Z29LQWNiWlJTMzlJZlNyR1ZkUnN2a1dzYjRKbTZhb0JDdnF2bnd0U0txdVhG?=
 =?utf-8?B?SGhDZExRZjEwMHBuUGFkYXBZTmF3S3BSQ3IwV3RXRzFKMStSbThMMGRnY0hm?=
 =?utf-8?B?SytkOGlmTXdMaU56L3kyZnpkakM4dUczbnJuUE85R1hFWTJDY2E2ZkpRQ0xn?=
 =?utf-8?B?U0pGemczeWUvV3JTTi9yeEhGemJyS1g0NStXbVEyU0pKcTZNcnRaaGJyd0ky?=
 =?utf-8?B?VlFiQTB4ME1MWXRsRzdTVG1pRU50MVU0QW03ejY0WGYyYlVPbzFwWjNCdlha?=
 =?utf-8?B?OHE1ckVGM0xiYzVXb2YwS2h4N2RzRmdMNi8zVFRlY1Z0VitSbHg3WXBoVWdw?=
 =?utf-8?B?OFFiVUFhVTZJK0tWYkZPWjdyU3dsb0dabmZQL0k3Wm8vNzNSQ2NRcTZiU29H?=
 =?utf-8?B?bDdyc1dZWUg5elNqQ0R3bW1pM0xtVHpaemFpazRqSEhMTzNTR2RaaWxPT0lk?=
 =?utf-8?B?UjRUb2kzeHVrMjZneUJTZmN5ZDlNUGR2VW8zdzlaeHlOTXlYMGQ0YzVMd0Ev?=
 =?utf-8?B?dDRFL0hXbmQwOVBubExtV2ZNNEpQaWVtRU5QelpRQXFlS2NoVW9pWDRDb2ZE?=
 =?utf-8?B?L1ovSS9vWmllWi84YmVoL1M3amRDWkNuSS9POXRTVHlQM1hMbnNpUkNJblRv?=
 =?utf-8?B?Wm5DOUxtd1BXL2xIdS9nai8zbDdlYjJWQUNnQkJRcldIS0ZpMUdVT2JEOVFT?=
 =?utf-8?B?ZEZiWmhaQUVnem5SVitwclpXbzNIMjloVDhjTnd5d1BSdW1LMHZVQ2tDYVUr?=
 =?utf-8?B?UTY5WUVVYWdjeUxIZE1NY3BMdHpKTjd6N1BpcVpCS3pnd1gxcVp1UjY5T1Rj?=
 =?utf-8?B?c2ZVVWhGYUdLMXM4VnJleUZ6c3YvUVJ1dllQU1A4N2V6cFd4WjkxQzF3cExQ?=
 =?utf-8?B?OXZLZDl5akNLU3pFc3UxYkNTQzFFaFJzSDN6OFdmY29iR0gxTFdHc1ZtdHA0?=
 =?utf-8?B?Y2MwelNZQXE4MUdjQldnR3J1YVRhR1BwK3ZSdE4wTVpJNjlZdC9CeUxFTXBi?=
 =?utf-8?B?MzZwRWo2K2RvZTcrTHVBbVhlMC9BbjRsR3NLN24zZkJURnloNHZ2R0EvTGY5?=
 =?utf-8?B?WHI1UDVXZVRTRWpKTzNOSXJMZWV2KzdNVDJGSk0zRXVhcmlQV0VxL1BHVlNU?=
 =?utf-8?B?cjdodm4vL3VpOHNtMzRpdlpibGhMTlJUajFIa1RZNHlCRXl2bkFHell0NCsv?=
 =?utf-8?B?UFVZdlJlQWtYeWZER0dQT1M1d3VveGZNZ0RScFByZXdtbDhDeFhtcXR1MU5V?=
 =?utf-8?B?dDZqU0NLSVJQblRnUFRGcm91cEduSEVwaXBBT24xQUxUSE42UEJ0Qis3K0Nt?=
 =?utf-8?B?emFkbXZvU3NMTGZIUi9GMDdHZVZ0OEFnTllZNHk0OXNGMEVSVXZGU1Z4TnJ6?=
 =?utf-8?B?K3pxbUJEZGVEdVl3WmlVbmF6cmVESFBJU3czVTFLTWpCR1QzSFpORHZRUmNu?=
 =?utf-8?B?SGFIOGRIMWh3dWh5ZzVBZXFJa1hmNi92aEV5Z3NsdXQwQzFDaytVUEFKeThK?=
 =?utf-8?B?V3plNmdhY3M0K2tDRENWeGNmZjNxdC9DYjk1dXBDYnYxZlFUR3JEeFoycjNS?=
 =?utf-8?B?SlpuMmpvNUtXSDI4eWMyVmwyWXhRblppTHoyYWQ0NDFxUVlyMGN1RHFzWURY?=
 =?utf-8?B?VlptSXlSZWZvVFo4MlA2WThhK21zdnlLdmlVajl2aXdIbXh6MmdUS3grb2V0?=
 =?utf-8?B?Q1RwdzJVbkVwL2QvdVZ6amFpdWZPSEJtekJOUEUrVVM5UXYwWnVUcGZMZklN?=
 =?utf-8?B?QVBGdTZ5N2RqU2dhd3NWQnpucklDT1lIZGR3N1c1bmhUVWY3dTNJS254c2Vs?=
 =?utf-8?B?MlRZTldEOVY4VDNKbTlTU2FRL0NaU01abEZCcjA5VVR4LzRuSFFKS0xzYWxC?=
 =?utf-8?B?UHJEN0NHM1ppNG1CUTVyL3cxOFJnRWRjUnFPNXhTNWZPbzcrT1dTM2Q3RlJ5?=
 =?utf-8?B?ZTI5N1Z2bTlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTAzSjBBUGNLNnZINmtXdFJtTkhpQ2hUKy9EaHphcytXcEZuYmc5S0Y2WS9D?=
 =?utf-8?B?SmJvUDJuMWc4KzNFNDZ6ZUc2MmdDQVdOZTZRNmpveGRYaFF5S3VsOUhPOC9i?=
 =?utf-8?B?L0ZCOHQ0K0RkZTNCTzZPYUwvelFMcjg0K1BDRXVTRXpZNU1wVnZlRlFpV1FX?=
 =?utf-8?B?SUlOb3laeEIwL2tBcUZmSjlmMHNYMnZyR0J1S0NMWTlSSzFLbWdGSmtiQ2dL?=
 =?utf-8?B?T0hOcndMT2FORDkvVXJHQnJTTjVQazdOZW1wZEF3cVpHMWgxbmdUSnBVRnFu?=
 =?utf-8?B?U1hwenRmdzJxWUZFWWc5L3dXOXpyYkFpQ0k2bU04SUNGRlpNWFFlOXhUYzJU?=
 =?utf-8?B?VVhWblpja2FQUVkramVseFlVM0c0S1MxZVB0cENpUWlpcDg5RmMwSWdpRTBK?=
 =?utf-8?B?OXNLSFVxTTZtT0FIVzFsKzFLSDBZMCt0K1VUcFpXcTdxdHNuUExvcHA2dHJW?=
 =?utf-8?B?TDQ4THNFTG52eXNrNGhBVk5DMFJIZ05TclQ1QW5PMDF3VnNDWE9vMERqRmpy?=
 =?utf-8?B?RlBEamdrMDluZHMwQ014UEUvL2x3ODlLbGpHYzBVMnNJM3kxMGRTNGNqdlFT?=
 =?utf-8?B?UHYzQmN4aUY0WWxmejY4TVZxcm1VWEtVVjl6UGhLOUkwNFRnNzFNTWNhaE8v?=
 =?utf-8?B?NUhidDBLZHp1UVM1dnJUVEdOZUQ1SnJXOHdSMVQxZXZldGgvVnhNOWloNHU2?=
 =?utf-8?B?VW5nRjJTdVRPb3JnMGZYVk9MNWRLb29xVEZPTnZaL2F1NU11V2NvSTd6MldS?=
 =?utf-8?B?VHMxMnY3UmU4SlhUcklIYVY1ZmZOTzR2c0NpcUJDRHZPZzBWNHpjbnYzMVBi?=
 =?utf-8?B?OU9mUS9DMlFEZnJ0b1hFM3pIMURkbS9qUGFSek1GS2NsNjlWVWo2cEtXbG92?=
 =?utf-8?B?R05LTThLM1dKcG1zVEdmWDBvU0x4a1pXMUU2dlZsaUVJYWlzOEkyTHl4YkpP?=
 =?utf-8?B?QTBoK1Q0YVBLeTV2ZHE0TnhNZ242Qmc0cUhKUVBKRTM1bjJzRjBlVUIxcGhl?=
 =?utf-8?B?cHdiT1N3U3R3QTVVQ2xJbzdZbnBDbGpFUElPUm1ka3ZOVDRXdDNzK3AwdGU5?=
 =?utf-8?B?UmhoQUx2ejJEMEdsNk45N09PWG1KM0JmWXMwZW5veFJSYXNhNS90RXBDcUs0?=
 =?utf-8?B?ZDlIdUkveWE1S0ZXeGx0b1Fzclpsa2J4SEF5L2NGZCtIS1BGRUY5ZmVOK0Vq?=
 =?utf-8?B?anJrMGJsTkZQTVF6Y1ZMN0M4QlE0Sk1rVXk5V0kzWmRLTEd5L0k3UFhYYk9N?=
 =?utf-8?B?RldLc2JlWjU0bXlEekx1cDJlY29WdHhpTHpnWWVXS0U4cjk2dHZyazlVRk5h?=
 =?utf-8?B?WEpIamRqUlBvWjNvM1h3N3VsQVFJRTBmUE9kVUNhSHp0S0c5cmp5ejVGZUVB?=
 =?utf-8?B?akVWWVBBRWI5OTQ1dithaW9QaHc1dE1BdjJ3ZEIxbUJjOXBQZjh0eDZiTEo4?=
 =?utf-8?B?bUpUUnJBdlJ5cHRneXZOT2gzZG81Q2FtTk5QUzBudFNWYUhRQUZ2bm9kS0V0?=
 =?utf-8?B?KzgrazJoeFE1RGxiVk9iRFRrYUdISkluVklHUlRIZnFzMS92eHFycWwrYm5l?=
 =?utf-8?B?T01xZjdpY0IwTmhIUy9leEpwdU1iNC93UXFxZGJ6bGU2UlJ5VVEvRTRHQzNX?=
 =?utf-8?B?Z09Vd2hMRUZna1h6VDJsSDIvTWttNEJsNjl3UHhmY1VURzRtSlNxelBWeW5G?=
 =?utf-8?B?aGMyOGgyalY3a1RHZVhsTGVkMFd4RC9DMWJNT3EyeGo0bS9pOXFseHdBUzl6?=
 =?utf-8?B?ajgyQmZSVFl3ajcrZThmTlFUM1hiekFIYmREdVlPT1UzZmFZWTRGam1TdENr?=
 =?utf-8?B?L2VoUGRSTHZsTnpIUmphZEp6VS85WWdzeGZoVmozUEJ0MWtLbFlmMTRYRzBC?=
 =?utf-8?B?Z1lKc1ZxS1hvUzZCUWppejBFVjlocTRrNkRwQmxHdmlERWpJTHQ2QTlXeElu?=
 =?utf-8?B?OVRDS2hzQkxPczFWdmJJOCtDMS92ZVUySkxwanVNMDBwZFJBd3ZqWWpyaEZH?=
 =?utf-8?B?N3l2djJ1ODB2NlFUSmlhdk1PV0ZQdk84QW10ZlpDblRzWFlyTGw3ZVV0bjhp?=
 =?utf-8?B?Zm9MNllmdHY0Ylk1eE53R1JtdkhDeVVLWHBEblFoOGhvNWNGczg3N3AwUVc2?=
 =?utf-8?B?SVRPZm1VQVRrTTV5emVwTm8yejhIMGFqOUFjd0FsWWVPcFN0VzBENGhadWFy?=
 =?utf-8?Q?/aaZLy+pjg96w5JhZeF4RJdXny2qXXeMNJ1BnZOg3xDt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3c210e-6e4a-4fb8-dcdb-08de223136d0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 21:19:50.3302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efo575X4YZxJhFCGNbrJRWWdSqGI7WaESW/4NTut58scvd4JRUw5ShnsTv5eeHfcmGfjAd7Vkk79MGi3Eckv5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066

On 11/12/25 22:57, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b179ce312bafcb8c68dc718e015aee79b7939ff0
> commit: d3b4177bcf978a441cf98b7515d043eb23728194 [6752/7613] gpu/drm/nouveau: enable THP support for GPU memory migration
> config: x86_64-randconfig-121-20251112 (https://download.01.org/0day-ci/archive/20251112/202511121922.oP20Lzb8-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121922.oP20Lzb8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511121922.oP20Lzb8-lkp@intel.com/

Thanks for the bug report!

A similar issue exists prior to my changes, the routine was called nouveau_dmem_copy_one() and had a similar signature.
I'll send a fix out shortly

Balbir
