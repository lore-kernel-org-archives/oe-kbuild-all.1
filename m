Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010007.outbound.protection.outlook.com [52.103.68.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C3619C542
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768869927; cv=fail; b=idLQ2Zv2ovjFLdpAro5oxSrKVNYYzQRX8tgm2s5VdQReeZKJQsB1NDUFDQXB4Z+QSvTEZXZotpHSL1nK18q9FojktjQdUNRJXsgUHBfreNpml2aYfgoLtQ9iftIENXVFpMjbbMrhu8o3GX/iOcRXh/zUXVCoXALRG/gzcII7Snk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768869927; c=relaxed/simple;
	bh=s5p1oZKy9EXng5I4UP0YEl2AR2hz2NaBNjNozk+iznQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sz2evIpDelvV2qwWUZlh0Sbwk0qChKipe7tyWsKEOhiieUJNdSoaF2msiXPs6REEuUCp8HkhChRunKCp1W3vO/5Ae2gt+udK25vGYoPa8EY2aksVsrn04RFTQBFrK5p5OiHa/dEW1vp9Ofr4OW1Iq5MCV7KJrGKpBL13qefALew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lI+tL37H; arc=fail smtp.client-ip=52.103.68.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lI+tL37H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rc74Drx8it0cCnh0MUnJFBkE8DP7LQl8+oKem55RbYeGyVsb9Ty6kqNtoyiVVRt2QvXDFi5Vs9gM8qU9lfwIdfFU6C054CAHCTy4K7R7Pn6dFLvSr07fC/FpwGjm7cBcqC/E9eQMhmeTDq8DSwYP9LsPUT+Jj/OJ/mKaK1zYgd8RlNgw2Tgpi5NXbRnqgwFyxHna/Pczki1LYcYhw2QxCtktWUu9PfHKcTQjHQTQ388jdgEgeTOs5hSdby0BGAbxv4yh69ztARWjHPyqXDwy4eWLgGyPHYjJuM+oR3o+6iutz/RmrVWcrexZEHXE2wUHQwV/2w277g/tulV3PHRyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCxcclYUPYoUCSmMjbdBv+D6I5kJXrSxc1kEgOwh5Bw=;
 b=UvhR00JKkYz+CupcQ7K4tk4/w9DcFUNw9D3wzv9yrGCnMTpDHXB6ZNXbLHIo4ul2ZO9OQ4nf23LbF0bKDpzYY5jAmV3f3qE/gQQoxZEbwTog9pm7fn4m/04M5CqdD+xD/v+ev7MZrrdrvnJtJbQTo0uj6OZtHEcj8dcEpyer6ZucXBC4mumk6Pqkbs+A/RIbQuzm6Qt7Z4TkDnOgdqo4CajmdXOkYeQsrxk/WV8JorW0NT2Kh26XIg+hIxJXQTH1LnwB+PVS8dumheGNpQGJig9E7wAft9Qc4avYUk8j1Wje8vxjOxoKZ9uF/0hdetCm1t/4slCpxX9ofaF9vuqxGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCxcclYUPYoUCSmMjbdBv+D6I5kJXrSxc1kEgOwh5Bw=;
 b=lI+tL37Hhb40/W011qUX5Ti0fG5u53s8Y3uG5kj2M9sy4WXi187hwcFIlOyXy3xSDB4+f7nvvmhJo6ALnWZTta5RuovJxXb9g01drc/KWGtAycg/ZzRRrmbwpjItOPSvCh/fNjUFSC/GRPuVJ7JPXv9KXTrSWXSEzB8j/044UzG/c8DgX+OfZeCg5/wXp0C3+sM7bLC68466oTfuHTaQIamfs0AH4uX41hv9eWfQvdkMMXDdB2iE3VvA9Xug48fISK1ftt79dzt/VAG+Cad2PRjL7K/ACeZwALfgPMJBsP4Zs1xwR1tVvuWWfNJ3hLMPTch9AzS39p95+gfAHT4IAQ==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN0PR01MB7783.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:b6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 00:45:16 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 00:45:16 +0000
Message-ID:
 <MA5PR01MB125007874FDFE05EF3D9D4989FE89A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 20 Jan 2026 08:45:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: arc-linux-ld: drivers/pci/controller/cadence/pci-j721e.c:648:
 undefined reference to `cdns_pcie_host_disable'
To: kernel test robot <lkp@intel.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>
References: <202601192149.m9qDmfLW-lkp@intel.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <202601192149.m9qDmfLW-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <116f4f20-091f-4cbe-945d-62ade230b969@outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN0PR01MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ffc19b-1d79-4bb0-cf7a-08de57bd2cd0
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|6090799003|15080799012|23021999003|461199028|5072599009|1602099012|10035399007|4302099013|3412199025|440099028|40105399003|52005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUtDSGxGeGNVNVNLWDVsMGFXeEJmTGJmY0lpZWZYMGFJRDlEQTFRZXEzZnBu?=
 =?utf-8?B?c1h1UjB1UjlJWTdTbFRTaUY5dGNaLzllMWFPTVlPTWpXY1hoMk0xQWdjd0U2?=
 =?utf-8?B?ZGhJbEJRRFoxQjJ4cWZ2bjZ4R05pQmpuVU1tOWZielFsWUo3NS9CbkhzZmIz?=
 =?utf-8?B?TWdPNkZFdVVFT2RMYmpRZzhLZjA4SzhleFBrVFc3VitLVitHSlFQYmd5UkFK?=
 =?utf-8?B?WEhCYU9CSTJvZWVjYURsMWM4aFc1Qkd2Y2tLRGRUVVNzYlp4SU9rTERKaWxL?=
 =?utf-8?B?WHhHb05nYVJYUEdlNXZ3Y2hleTdlSlhzY3Y5WHJxM0JYRGkzTk5kSHpSd1ZK?=
 =?utf-8?B?N0M5ejFtUys0cVRzYStvaUM2NHNqOFN5ZnE5MDI3c0hUTFJ1UVloVUFwQm9J?=
 =?utf-8?B?WG1GMHM2TSsxNk1oUU9mdzNZU2NDY2huUU93RVNxWWMvSXpBTUNVazdKdWp5?=
 =?utf-8?B?cC95elg2Smt1L1lRWmJab3UvWlhSQkwxM3JTOEZtTU84UTNSeHFrTUVJLytu?=
 =?utf-8?B?RndEdTNkRVZ5U3IrTmFBMDl5eFBxTC9zeXZVcjdYaVg2Nk5ua2pVZ0RTQTQ5?=
 =?utf-8?B?Q1ppT2ttZmIrZk5yc29XRmd0UWtNRWxRaWp2OXRwc3JVNVJyenJRWmFEYWhs?=
 =?utf-8?B?K0hwUk1zSXRSTTJoRVF3SVpCS2R5OGFFK25qN01sd0NKUUpwZGpEd1kvOTZM?=
 =?utf-8?B?WnFGL1hEdGlhTFdmS21xYVpEVVhUQzRwNjNhKzM4WXFFOUFBS3VBb05FcG4z?=
 =?utf-8?B?elRVbHBJaXN2bUZ5L0p3S3Z4dmNtb1BUaFBJVXRXNEZYMURJVzZ2ZUt2dDlm?=
 =?utf-8?B?SURYSzlqTHRoSi9sbUEwVmh1WWROamVqbVc3bHErOUZWRmY1d3k2KzBIVmxl?=
 =?utf-8?B?SUhXNWcvNHB4cDVsS05Cb3B5R25DamRXNDlMbGF1VmM0MitSUHpOcVBDeFFj?=
 =?utf-8?B?SzhzVkp3UGlFQ0tvdkZySHZSREVwVWxnMEZEZ1JiS096OXJHOGJWT0RHakls?=
 =?utf-8?B?TGliaWNCRnRwTnUyV2twS2oyenErbllvY1I5UTFYbFRSckpPbUcwVHdLVm9z?=
 =?utf-8?B?enlZN0pJVVVnamM3cE8xeC84eDg2MjlxQ3d0Nlc0N0pjNnFMbUJaaGhzNmFs?=
 =?utf-8?B?NFpCOEVLR0xTbDhMeFFmSmNKYU5DZWhMN1Z4ZXhFOXVpUm1PckpHWUt1b2xJ?=
 =?utf-8?B?M0c2SEpqZlFKZElGWEtvZlZFSUdydVp2ZzJ5UnA4V2pMbG5UQTFhcnBSeE5R?=
 =?utf-8?B?VlFpV28wNHIwc2FucGd4MlN1REI3ekNHSlgxcDJlaWg4VWdNbUtTaGtFVVI1?=
 =?utf-8?B?a3JvN1JRckRoNEk4bnNCRHZNbjFQWVdnUEZYZ2grSThzY3l1NEZFQU4xYW91?=
 =?utf-8?B?VTdqM05DamdjL1ZUd1NGVXZnazZtbGxhbXJuYmxYTWVEWitaNmQ2S0M0UVIw?=
 =?utf-8?B?ZDRIMERVdnQ5c1p0VStXSy9GRy9FOE84RU8yMWo3M3BCNTRiRTRMMG5QVzYx?=
 =?utf-8?B?TmN6aU81ZEU1QmtnSElCelJQR0hid3ZZRnJHZnlUSUVrRllWbUxxc2tpOFBN?=
 =?utf-8?B?Z1p5Kys2SEhVdXdtMVJnb1VjVVJTM2JRaWJQN0NrbTNkVU5XdXIxZXpvM0xa?=
 =?utf-8?B?U3pmSzZqMzlDWllJN2tRb2M4SVE5RHVSTXc0eEUwRGlDRzZUR2ErQUZWbE4v?=
 =?utf-8?B?amlrNEtLS3B4QTJwMHJQS0I5aE5mU3JrK2hGSmpzYlhPRjFzS1BLK3VaQkJj?=
 =?utf-8?B?ZGpIKytiTVJmTXZOSVBsMlpiQmRFUkxmd3lkR253bGdEaUdOcHBuN093Y2Va?=
 =?utf-8?B?OHduS0FydU5KTlVXZldoUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2hORmN0Y2dpQ2lVazdrNnI0R1ZTNk55MHZKakpDZ0I4U1JydzAxTHBkVFdM?=
 =?utf-8?B?YW1VWk1ydTN6cVJCcjBQQ2dUeDV3RWVRd3F5a21CTmFjRXNmbCtaSVFHUkxr?=
 =?utf-8?B?UkZwMG9rNzhOZ3hTN0RkVThsa3BGdko4UE9uSlVNeUZhZ1gwVzNiMzVQR0Zn?=
 =?utf-8?B?TGZldW40M1Z5Tmh6VGpCR0lKZk1ISzl0SytyWTZyQ0lsdkFLaUV5OGVzNnhP?=
 =?utf-8?B?VzlEQlBac1BsWEljc2RiNStjU2NOeUZucEFjY3MyNjFDeHFXeVRHQ1A2Z2ZI?=
 =?utf-8?B?WmFjM0RoMHd1OTlMOEZ4UFVLQklTRkI4TEFNZklNa0duZmZmUkFsZkl6Mlk1?=
 =?utf-8?B?cmo0d0V0bWRRaW9JNmpIYUo4VFU3VGdwTmpid3FYNm9oRmVTeFJCNDQzandr?=
 =?utf-8?B?dmRkdHVCVkJiYzRtNWt2OTZSWXk3b0pQSkFxVXgvZU1QYXNZUDdJMFBkTlhz?=
 =?utf-8?B?M1NsZVplZ2E5dGxzZlZBbEN2dzlhMjArd1NSdmc3SW1tcGQycDFHcWUvdm1C?=
 =?utf-8?B?L1BWc3NuVWNyMFBIQVZKSDkwckxTZ1QxQ0ZDWjFmS3orNlJuRFdKdDJuWlIv?=
 =?utf-8?B?RzJlT25hZXhhVXU4anREU0IxTnZOZ1FOZ0xpbnBWZWVQK1ZVWUlPNnNVdERr?=
 =?utf-8?B?Q3RneENxYzBpcG1SOGswYlJ2ZXdXT0tjQ2NWYnBvZnNpRjBTNXUxeGh2QkNl?=
 =?utf-8?B?MEVWVUh5YTNQOSt3aGw2bXNqaUlMcW1kMEVQY3gzcXpzejNSSjBGaXBwcVpB?=
 =?utf-8?B?RHhOdGZTZVhZT2RkTzVXNjE2N2tEdmhNZng4NmoxbEs3ellZUjFERjkvcjZG?=
 =?utf-8?B?b1hUUnd3eXdBNjlvSHI1QndJWDJobFM1OGJEV2g0VWVyUmFlUFhIc3RpbWFP?=
 =?utf-8?B?WnI1NE9IM0NoekZ0VGJBeisrRkZsUFhrQ1J0dG5lZDFMbEhaYU5Gc0RXUGJi?=
 =?utf-8?B?SHROOEIvNDhLdTJBUWNLZEEwZWROL2VzWU9zMHVLK3VMSmN2UXl6YS9jczkr?=
 =?utf-8?B?cjA3dGhzQkV1ZHRvWlBCeWdrWGkyeko4THN3dlNyQS9KWi9lRjBjTXozK3BK?=
 =?utf-8?B?Y2xHTkFqVXMrSkdNR1BvcmlXK3VCV0JlSW1LWlo5dzJLL04rUjNYeTdvNFZ1?=
 =?utf-8?B?SEZzM1lsbmhrdk9BclRaSjNlc2lYQUpiZ1JpOG50TW1XTTBYcUlOeDJRTy9a?=
 =?utf-8?B?Nm9jQ0NJTTc2dVRGTmVKektiYStUR0YwSGJJSzRROG9NR29qR3NmS3dWUUNB?=
 =?utf-8?B?RkoyTXh1dDcrQ3BoZ1FPb09McFVxQVQxRENzME5kYUduSzc5MHIyR3g1SVgz?=
 =?utf-8?B?cWpyWThzdzZhQW9wNDFJN0lKWFp3SUVsODBXTytXL3RJTkdhNzNrYUxGb1Yz?=
 =?utf-8?B?Vjd0YTdpWDFZODhvS1Z1dDEzclpSbFVzczlUSlV3QkRXenRNY2JSUFU5MlNH?=
 =?utf-8?B?aUlHMGZpcExpVnZGRUNhQzFWM1hnd1B1YnlSTHlpWEZDeVNZQlp1cit3Tmk3?=
 =?utf-8?B?STdLUUxkNjlCUmRBK3ZLeEs5bTBWNmJHN2xtMGovM0kzUDN0VGxVUGhuRTkx?=
 =?utf-8?B?anVoTG1xVTd5bEMzdFFLZ29ldEVBd1hiV2U1TUZ1a3B2T3RoYlJGbXp1Q2VD?=
 =?utf-8?B?R0oyUlFaYWxtL0ExNERsT1huRWZhS0hMQTkxUVcwc2o5MjVNQnB3M1oyMU9G?=
 =?utf-8?B?bFRWTGJYbkhkbndTWTJNQ0tZak5saFoyWVFEdG1YN2dobWRTSk9zTlZUL2lR?=
 =?utf-8?B?U1BuVWpnWGtidE5TQ2lidjYxclF4ancxYTRjWDRNdkl2L2xFMXNCSEdtajFs?=
 =?utf-8?B?a2JHYnY3ajN2MmFOZnNxTWRzRW5sbXBNczBzS0NmQ1ViZ2RQSjJHbDJLeUVh?=
 =?utf-8?B?aG5NMUdKVDhiVU11bUtZRjNEcXhQbVN2QzRudUYxOE0yZjF4ZTYzdCttbTFZ?=
 =?utf-8?Q?LQRhMEbNwwxYC7vn7ccqVGyBTFMrGaK/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ffc19b-1d79-4bb0-cf7a-08de57bd2cd0
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 00:45:15.3270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7783


On 1/19/2026 10:00 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> commit: 1c72774df028429836eec3394212f2921bb830fc PCI: sg2042: Add Sophgo SG2042 PCIe driver
> date:   4 months ago
> config: arc-randconfig-002-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192149.m9qDmfLW-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601192149.m9qDmfLW-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601192149.m9qDmfLW-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     arc-linux-ld: drivers/pci/controller/cadence/pci-j721e.o: in function `j721e_pcie_remove':
>     drivers/pci/controller/cadence/pci-j721e.c:648: undefined reference to `cdns_pcie_host_disable'
>>> arc-linux-ld: drivers/pci/controller/cadence/pci-j721e.c:648: undefined reference to `cdns_pcie_host_disable'

This appears to be a configuration-related issue. 
"CONFIG_PCIE_CADENCE_HOST=m" but "CONFIG_PCI_J721E=y".

I don't think this issue is related to sophgo drivers.

Adding Vignesh and Siddharth who might be interested in this.

Thanks,

Chen



