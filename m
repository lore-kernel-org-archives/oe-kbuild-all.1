Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC7263C7C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478111; cv=fail; b=KgGAAyj7CouUOPu3Wm6yOaznVEXHakt9CzSJwfgQtrs1tajHQDI1gHgS0JdVFmbiSreaktozbA/GCLO7wXZ9p96GgfENhBLbB5fLtWRXAtYonQAWftyGS2e7g+NP4p3FI8hw320heRCl1gjFzIZOlFui+eBtVAzAjZnDJG06qek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478111; c=relaxed/simple;
	bh=ENtmyaRRpg4AHyp2WEfFevBaXa+OGd47gKbVwgoKueE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cBJkOl2bF+EfHArpECxDOoCGvISY58zycNjDjHzJjqyEpsHDsqFIqQBtkef0L7f4RUvzkXoZsNWT0NW3WQvvTxLd63eB/9MJNxhf9Ico5ydEJyiBdT9+mZoQFkkmRsRykewZmrBiOyoughGeTQzhcy+1fTu92xNpux7y6+9RDOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=nHAwUZo7; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="nHAwUZo7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZafRbqtOYx1ZFYTyoNJAyHit+1VKSpqDISNnVeYDfOzNyyx2wMvNjgrbRZMcNZzhF3V5GSv5di6xK/PPj2Qz8uil2QmuK6l4MMn8PujBKqP3PpaoeMTLnXPP4BWvcJluskjspGRyvFsExyD6qzTlHnQSThj7G21ufA1I/IYBdDRWwkNvpnzGcN+9uuuRXadpEaU19X+yWCsvdAl9FE0p7/deFaODDJmcPffBsAb86F9i72CMK43ODG0e4lH4wW4d/F2gC/qSINTOtij7e15jkxX69cxNpQfDhedIjZBaoRGxxK+WTzbJKLaGWk+vJL+N80MaIP/KF9yG/m+NxB0hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62dk86FKyKPz95sHr4+hhOqrd5gbhcYMiuAU2XKoqGU=;
 b=TUf9rmmShlKtgLIzshCn7Ex9RDXZfcxVsmcKyvpT4H4802GtUdkm1XpE2aNMWtTHa2+QQcluuKOg6o8ylxEFgO5u1xdc8B7MYfS3/CPGBsdhVBJQrzlJrseYvsOLzWPqlb/CwfFOFBrEYHduCtFuHWtpXFceqx4hB7e2OPjVdMXQGzNgAUvUMc6GBvhYefsurycPurfa0u0iFrOwTWSZJOgRYpJHdLJjEA+iuyOSSDbza2Xr7x/SW68V8OyFE0fd3cUI343Xmu7h1HPx1yt0Y92n8BHIJ1K0RUakt8qHmqcLFqsP/xN2Sq/f3DZqK/m1Wr3ZaZkfVuxGTy7kLgCTUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62dk86FKyKPz95sHr4+hhOqrd5gbhcYMiuAU2XKoqGU=;
 b=nHAwUZo7+zR+JROKSgBuerUdGX0QN3lmmKRAvkSUbbPk8wFRL1tpu+16wrGm272Uig7hfgVRAgRGIabWZf6vw7WSP8P7Y5BhqShLY6VdLjZKmKs0mYQZ0ctll02Lf0uK2yO5wKyLNaS+OWHiV84DYRXP7vF8qqMouvKbC6vRLLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8378.eurprd04.prod.outlook.com (2603:10a6:10:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 10:08:24 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.018; Tue, 25 Feb 2025
 10:08:24 +0000
Message-ID: <0e8571a2-37b2-42cc-a3b4-8dbb947fb1a1@cherry.de>
Date: Tue, 25 Feb 2025 11:08:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5345/5954]
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb:
 gpio@27: 'reset-gpios' does not match any of the regexes:
 '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
References: <202502250657.z4e1UeVZ-lkp@intel.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <202502250657.z4e1UeVZ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: d34b6910-3b74-48ea-9185-08dd558456d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|220923002;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXhTTmRGR0VkaXM3NkRSVFZFeEQxLzc5U3ZqM0dIK3ViL1kzd29qL0J5dGpk?=
 =?utf-8?B?OGhwMXpheDdXT0trVFY3dkRCTUU3M3BqM1VKb1E2eUhQdXlJVVh5V1ZZcXJx?=
 =?utf-8?B?K1I5WmhmdDFTWC93ZE8yYks0a3A2WFFEbnBxbjNxZ1NiTGVkNlAxT0NKQmRr?=
 =?utf-8?B?MlAvNmxUSUNzemJTeWc0bGNWSU51RWlTY21OU2VyODkxTDFqNWpycE5nZExm?=
 =?utf-8?B?TUZwbTl3VkNUQVRkZUpaZGhyK2JSdG92QWZYOE5VVWY2YlBkdXNvM1JWZWNS?=
 =?utf-8?B?VkpKUEdwd0F5SGJ5TWxuUjUweVVLdGx2ZCtBSmgzYUZaYzFEVEZUMnV6ZHA3?=
 =?utf-8?B?RWVaZ2VvWk93a2NhY2M2aGZMUGVsVkdrSVhkNWRQUFViaXNNRjFQSjMyN1V4?=
 =?utf-8?B?ZHF0UlMyNmtKMjYvbEhOYmEyNDB5YWtFZlVxRTVSdnErN0dQZEo0dnd2bEx2?=
 =?utf-8?B?blI1K2R4c2VRRmxkZDhQVHltaFZ1RDJNbGpoQVVDSHlKeU1Ka3Y5UUFHUUhh?=
 =?utf-8?B?cFJzUkJ3c2d0ZHhpNVBEZzVkT3FrZGpKTWJqd001T0gwcTdSa21IZWFDVjYx?=
 =?utf-8?B?Y1YrNSs0NjdLV21xVks2TVJNZy96RUw4WHZqbEhBZ2RnS0k1N0FLL2xoOFBy?=
 =?utf-8?B?endyN3RuUmgvS1Nrb2o4WUptbmxtTG11V3BTa0RtLzNnZnEzVENJY3pySUR2?=
 =?utf-8?B?STluajdaT1RVMi9CeUE5N0tlRmNJTEEzMTRML3RISzdnYzJRcElRSnNOdk1P?=
 =?utf-8?B?L2tlMTV6RkNUSEt1cDVuZVYrN3V5UEcreEE5UHRaeTlFVGNac2JCd1dIeWhE?=
 =?utf-8?B?RlFRQXk2Mit6K3NTWWFTK0wxNVpiSnJNc3BrL1N4Ynh0MlJTRkRLRG5uNFI2?=
 =?utf-8?B?NzgxR1B2MTNkaEw1RFFkZnExRGRKVkVUYzk1MFk5cjlmV0hjUmFYcGxmZFlE?=
 =?utf-8?B?RkIzallxRXQ3dWltMEZ3K1ZGS0ZLOFJiVTUyaGVXNjdjTzREekx1M3NqV2R3?=
 =?utf-8?B?TjVLVnJWeE1hZDd1aHlNUjU1TEJvdC9vOTRBWXVvNHRpb2M2T1ozanBqMXBD?=
 =?utf-8?B?V2VPaHpmaWNrMElobmd4L1JUVEt3UU1zNUdIZ3d2Umw5VmRLa1N1MXhsZElS?=
 =?utf-8?B?d3luQjlYMlc0Tmh1VkloMmxKUXpTQy80T3pRcnFqYmZRRXFnMVdlTnFWa3Nq?=
 =?utf-8?B?bGxPU2p6MkZLZVhvTWlEekNqa3VaSFFBRUNGcFpLbmRiZytDeHZMSVlnYUYw?=
 =?utf-8?B?MmIwRkNwZXcvVmNoNlN3L1o3KzZGbkppMFpQNFgxaElBbERLQ0VZQUdNU2ZN?=
 =?utf-8?B?bkcwUyt3cmR3QkxORU1MdWplQUxUUnNqL015amJ6THM4aDZDQWNSRW5WR1NI?=
 =?utf-8?B?cWE2K3JiN0xVQXBraDQrWlcyZy9yYjM3czZiZitRaFZ0WWxPYmlXR3Z2UzFz?=
 =?utf-8?B?eFNPc2hFQk9JQWVpbU55VFljblZ1akFUMHFEQzJLcHQ4VERNcEdJWHpJRHFS?=
 =?utf-8?B?cUxWQ2dUdnRINmFpcHdkbDZVTlBQemI5RUhhODNZOVdxUWxEVUhycEpKWGRK?=
 =?utf-8?B?VUhrOUtRT05WRGRDT0lFMi9odVNSRHZNKzlsMHNWQldyanU5UlVQV0x3a2lT?=
 =?utf-8?B?a3hiUis1NWgzbktxdG84TVFFUTh6ZjVWVG9rb1gyYXR6WnNNa0NWYi8xUjky?=
 =?utf-8?B?NkcyOGFqRjRrbVR2VTBFWDVqSG1PSWYrYXNyRW5nNHQzSVJTU0YzT2FWczBY?=
 =?utf-8?B?WlRHVWFTNnl6aGV2c2J3RDB5S1R6OGh2Vlg4RFErdmdjNW1FVHVOUCsxU3E0?=
 =?utf-8?B?V1JFdFhjV0cxTVEyY1AzVHgvT2pDRmNLOWxhSGNGTGdub25yWitEV2NxTEhy?=
 =?utf-8?Q?0lGq5wtcyIeAu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1NUOVhZL0lqSGw0SEd1a3VZeGp6ZWhaQzYvNkxMYmFWZElnSzkxQzNwb2NY?=
 =?utf-8?B?clI0cGRKZ3JWTEQ0QmVsR1N5dnJLamxpTVpCWkdyc0NqVldxU1ZOaUtaVTh1?=
 =?utf-8?B?bG8vZ3hJUjJ4eUtYdkM2cVd5RG9NYklRaTREN2R6ckU4V0hMTUx1SUVZU2ti?=
 =?utf-8?B?Wkk2VXdtNk9UVGhTSnh5aFJzZ3NUK1dwVEI3NFJOQTVaeUxra2F0bnkrL1J1?=
 =?utf-8?B?Vml5OWhxTXRjaGdzQUdSUW42amxINENlcFZJVC9YRUFObHZoYjV2OUNSb1Jz?=
 =?utf-8?B?ZnhwSzNDaHVJQlNWczNtOU1OU2VBd3VpZDkvdklsTElNK2hXMGg1aW04VXB0?=
 =?utf-8?B?VG11R3JVaktXWEROT29GL016K3Z3TFZ4R0tCd1h0ajh3VWJRbW1wVEExYTJW?=
 =?utf-8?B?bWxReWpobU1SUHZrWEQ0R1FNeVNBZVNXOXQxbDVWT2ZPc095SGtqbldObmJ3?=
 =?utf-8?B?V09xREFjNWhHdUtjbEtvSXFKSHZneWNLLzk4cEVQVlRNWWpCZ2JpSGd3VzY0?=
 =?utf-8?B?dS81dFhEaEdpK2Zzdmp2TjhrcnBPQ2NINnBuL1lKaVhvaU1pd3hoVHB0QnRO?=
 =?utf-8?B?UHhnVDJMTHIwM3BOcG9MNitMeFZtbWtxalNvU0lwcW4wcUk5UklxOXBjUnhQ?=
 =?utf-8?B?SFpoMW15VnJxYUQwNk1hdkxsODhWbmxwUFhBOUVlVVpqb1k5OWpvMCtWRG92?=
 =?utf-8?B?R1VYbGZZUGd4ODFwQVJpL3Bxb3RaSHJWRTgzVzBzM1VkWktVb1lPekc1NWc5?=
 =?utf-8?B?MWZVV2cxVzJCL3llbkpnM1hCK0tQNmRmQXN2ZzBUbmZ3cXJoZWRIR2Z0dGE0?=
 =?utf-8?B?NmJRTnR1OEV4MGhmb3VNRFIrTXRsdEloL1crRzF5TS9CeFhCeHBtZG9HWUQr?=
 =?utf-8?B?RjRYR0JpQjIxemxHSWNYeUJHVytYYW1ab3lwUkhSRytqS2N1RENtbWVKdWh6?=
 =?utf-8?B?NEJJdmdXejlLOG93eFdKSmNORVUzVkxhaE8rckFpM21LMVlCU2IwYkJQbDJP?=
 =?utf-8?B?MVdhRzVsLzNGNitMeFpHSGYzME9ldDFsTVM5aGpIdTRDbHBmWTZCYWVFYnRx?=
 =?utf-8?B?K1Rqb0lQZStzOVJ3aXRGVDFWMVprZ0lENjhZWW1xbUFyRWRoZUtEM3lEdVlZ?=
 =?utf-8?B?NlBEZ0pZOHRiVkcvNkdwekxBR3Awa1NEbC9WbHRRZmFHZXpsUGV4YmhaaXRm?=
 =?utf-8?B?MUJERFl3WWZ1WUtmdWFydU1CWW43a294aXlVUXBsQ0RHZEhmdGUxM1JBYjd5?=
 =?utf-8?B?cEtNREVQSnFZb1JnL0ZTWm11R3d6R3NFWGdLM1N6MlNnUFBaS212bEZhWXh6?=
 =?utf-8?B?a3h0Nk9mLzJaYzdibVRxVWRrOHRCU0pCL3d1TUxTUmZFRWFmbVdINElSR2NH?=
 =?utf-8?B?Rk1VRzNEekc0VmtxSlBTcnpGZXEyU2wwNDRkQ0JtZUhmVW0vOXl1NTBWZU9F?=
 =?utf-8?B?YnlnUjVLQXg2cld2aDFJRmJDS1FFcmd3anI1Lzl2aVV6Nk96TVBYamFjbldX?=
 =?utf-8?B?QXp1SFIyMEp0K3JIS2ZYNUR1TVVITnF3QzB2RGpZamxHK2laMDFqKzNnVmll?=
 =?utf-8?B?UFU1UWx4YWdPR1VYWG9CbEdBczM1OFVOL3plaEkvc3NJcVBGeVFpUmovUnFX?=
 =?utf-8?B?bEtQdGZhZitFRmo1MldFZ3JDKzZGRzJUNkw2dFI5VUQrdU5ZSW1EVmh0NEFN?=
 =?utf-8?B?NkdmMFREbUZ2aVJ6QjAwbXUzMkhjM0NqdTV2SUxXRU1mTU5ISENwZFdzTEtn?=
 =?utf-8?B?WGpZQ3c1am9WdnNhNUFoaVBYemFuT0oyV01EWnRGTWpzUFlxTitlKzlxQWhU?=
 =?utf-8?B?d1BTUkM1bFZ1Qk5VVk1VVE8vWDdHWG00MDI2YmtEVWViVm9JTTNZOUl5cUdo?=
 =?utf-8?B?TjM0RFcwM2xzZmtxajExVWxRVDF3TTR0S09IcmlqNmJiMkdxeW9ISFBMZ2dB?=
 =?utf-8?B?RDJoelRhWUV1TlNiNnN1NDQ5VEtQN21MV0dOaVJ5NDYzZ2Yybm5CcWt6MGVy?=
 =?utf-8?B?Yi9GZk1DTWF5TGxXQzczVHdzbCtlNFppRFN4Zll0Mi8yallONXprQ0xid2Nu?=
 =?utf-8?B?dEZXb0pSY2lxaWwwU2lZZ2tMRHZXL3BtdXVHcWFCa1hTY3A3TDduemxUTWFl?=
 =?utf-8?B?NlpYMjZydUhyTFVRN0hQT0dlckwwbWh6Rmh4eVMwRVZ2SGU1U0JuTEJiWFp2?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d34b6910-3b74-48ea-9185-08dd558456d9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:08:23.9141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICmvJNQKnu47t74YpyNzrr10RPE1U7499agd0SAa6ZXoJ2Qs+3CVg9aI4YQK1JxqKbzcd0i0uuJ0gXoqujriS2djs4AwvK50Ll02lrPFOhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8378

Hi Heiko,

On 2/24/25 11:09 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4ef7aa6a88280d015c6533a210e46efd55bdb57f
> commit: 9f889cf1783680835d3ed401279075690b7f078a [5345/5954] arm64: dts: rockchip: add overlay for PX30 Ringneck Haikou Video Demo adapter
> config: arm64-randconfig-051-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250657.z4e1UeVZ-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> dtschema version: 2025.3.dev3+gabf9328
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250657.z4e1UeVZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502250657.z4e1UeVZ-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: gpio@27: 'reset-gpios' does not match any of the regexes: '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
>     	from schema $id: http://devicetree.org/schemas/gpio/nxp,pcf8575.yaml#
>>> arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-haikou-video-demo.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
>     	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
> 

I think we may have merged the Haikou Video Demo overlays too quickly. 
The Haikou Video Demo overlays depend on support for reset-gpios in the 
I2C GPIO expander driver, which was added in a separate series, c.f. 
https://lore.kernel.org/linux-gpio/20250224-pca976x-reset-driver-v3-0-58370ef405be@cherry.de/T/#m34648451131d34ba85538e08da0cacfc366d91af

I guess we should revert the patches and reapply them once the gpio 
patches get merged? Do I need to resend the patches in a new series or 
are you going to keep track of patches to re-revert? The Haikou LVDS 
overlay should be fine to keep as it doesn't have this GPIO expander.

Cheers,
Quentin
