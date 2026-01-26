Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020101.outbound.protection.outlook.com [52.101.195.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF3A3385BE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435066; cv=fail; b=h8kn9GUKVKwl9kjC7XNSXDfdT1qCbq4G74Kgaj2uxVAxs4z76qNIN8E+Y8NR1gCWMtAbrXVH80d9kLoddbi6F87fr/4B6btEmWxsf4UI+EQ6uej1++yX1SZuXn240wjSLjEy4TwfF236NBDLaUrj9J5NavDkq/B/dZ1jO52uzVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435066; c=relaxed/simple;
	bh=+LWgxavrZvUghcZXhbFyQ7tPxhbDaOMqoMIX11TihHk=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=RffmzBtkA3G1Jg2CX/RyhvGP1cU5pJoephmveJgPbPMUnvE+KOTCYU9PG7goQuyEyT8Z8Z/S3I33HtQ/LYNDCQagw4yvuYEt0nnFg2X7rLuq43qLuMaLemAONDPcdJ9psUpomzRJoAZ2al1afks1QTb/2jfgLUngXXXYy8nVaqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qlOuH9mE; arc=fail smtp.client-ip=52.101.195.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qlOuH9mE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bj4X10BiiQWcBCHdWzfXG64lGW4JFf2FK5vhC4aZPQNeEDA4Bc7/U5/oedfWDl/cVRO5XEbMFgvyMiHu6xcZMoGi778UcABzLnvMzrTYe0pL78/QpODn2H522sL7be4B0bQMRRZA7IzBm2/CpLQ1jgMeLvck/xbgsNBWKn0Xnz0cvoz7sIQO4j5uYpbr/OUznRZRkJpe1Z4CLUFm+/Bf1954Y5MVbh9PmSvQuuEXdiXJwMiW4hld5/UI076/ArwxpbxBrH/Um8iqeE3XYG5+tceryuWFhuEdMAiZ0fKqlxbuVq1IAE+HUA5CMplCD4iqJsBxNv6ncL0cybasTWmjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9sx1yd1t4ZIsvAgzlfoesMkx8FAliKGD7ZHpdRwSpM=;
 b=osYxRazmrb4UENDgV+o1xbeTHISeWo9p+oyaaFQdo/5igm6v2TxywfDyOFJkFd5/GDjvurPe2ZdhFfu2KenbwDI2vrTtE5t1c1TAJebJYPK2zvME+Drqy8gKOo1P15t/Zh58SMg0zTyp/WQiK34zN2JWKq8SiCLrrRcKHeGdtxUE6tNzs0ViFIpedmPM0P9TX5UnGJw9wtcdnvrrKtmNaVSZ+8o1ZZyAiXLs5uX9tuUo4OAOC35zxImLqSrJpKm+Pktgm9ezE9SzoDNvTCjpYRXA1tf2JtiQzjATEFFPJ+xiHZoyxfHulRbHrW/2hKPNaM1J3mE5WfbqD0iegOmeWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9sx1yd1t4ZIsvAgzlfoesMkx8FAliKGD7ZHpdRwSpM=;
 b=qlOuH9mEBkT8q/ogpRP0UukO/PmSTaH3A2LoUbnszbDmUV/gjH/z4PCmg5wL8snU02Guj8N0GNMn2SEyQTmMiDK0lD19D5bffGAM0QGhlaiAYhVkldO/dBNBu3qfpAdZEBQ2GcmxBZoDn/b9PtZ4YYv99y+2dV6cy2o55vjkRzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB5519.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Mon, 26 Jan
 2026 13:44:21 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:44:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 13:44:21 +0000
Message-Id: <DFYKDPBY1U35.NQFFTDZNU9MW@garyguo.net>
To: "kernel test robot" <lkp@intel.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: <oe-kbuild-all@lists.linux.dev>, <devel@driverdev.osuosl.org>
Subject: Re: [driver-core:driver-core-testing 12/12] Diff in
 samples/rust/rust_dma.rs:105:
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <202601240553.wieP0mKV-lkp@intel.com>
In-Reply-To: <202601240553.wieP0mKV-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0632.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB5519:EE_
X-MS-Office365-Filtering-Correlation-Id: 787ce312-eb53-46c6-f3af-08de5ce10296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFV4N0dYT2UrY3VyTlZKN1VNaWNGbTRYOXVxME1RRmFFUld2b2J0NkJtVVVH?=
 =?utf-8?B?V1BXclIxUnBLNllwUUU2SlRRS3UxczNsbjNSSXI1dHpyZndjL3VQSS9adVN1?=
 =?utf-8?B?czlRUjhJMHVvbExKMHdPQ0hTa3ltenl5b1dFenFpc0ZKL1dsYlNuWGkvNXFG?=
 =?utf-8?B?NG9Zc2lxWS9QWkNGZDhaNElva1MzRWhEQWE3bGM1SkRvdWhVYjdUaGtKTGNU?=
 =?utf-8?B?bGExQXVxUUcvNzZQVTBDY0pxSjMzc2Y2bXgxVHFUSGdHS0cyWnpxV0RNWldJ?=
 =?utf-8?B?UkZlMGdOWmpudzVHZ2FxWlE0S1hTaWRXR3BKajYxd3BYMzc1ek5qK3lxaFB4?=
 =?utf-8?B?aEFyY2QxdjhFbXcrU3BZTW0ySytHYjduWUF2SkV0cjd0S3FQVGlzaTNkckty?=
 =?utf-8?B?NjVabkx1ajBuRzVKbFd0bUM0UVlQN1BHUGJnbGFqS0VMbXJwVmIwQzZYQlJU?=
 =?utf-8?B?UnlrN0gvUTBpSUwyY2lDM2d3TVRIcHJGV2dYZjlFbTd3WHVFcDJjaS9nRzFY?=
 =?utf-8?B?eFlJWThoMXp0TnU5SzlGK0s2SVk2RGExQVhZczVqRmxRaENSNHZZdGhuakI3?=
 =?utf-8?B?cFdYcTdCdXBwWC9SVko5TUNnWGJRcm5LYlVlaGZ1UDVYZVR3YWszYTZyck1x?=
 =?utf-8?B?MmJZUmgya294dFp1dWJtZ2pWaTBjVlpKWkJQaUZhQU9ySEkwZ2FGZlN4anpo?=
 =?utf-8?B?NjdXV2dtWFJNMmdxNlF3bVNZRit2aEc2SWFEdkFhOXRKZ1ErRk94ZTVtNjY0?=
 =?utf-8?B?RWpwL2ZZQW55TlBCREd2N01FdkNjcmF6SzF3TnR0SXhERkRXNlpXZHV3SnZJ?=
 =?utf-8?B?WlpnaFBWVnJVU05SdWc0bHB2TzRWc0NhbVJkOE0wdnlaV0V6THpEZkx2Uzdz?=
 =?utf-8?B?aVZuY0xCM3J2WDJKVENRV0VIUWYvbWFhSTJuK25UcVNNZkZ0SUJ4Y2xLcUtY?=
 =?utf-8?B?dC85eEhtRUZlNkJwMVU4blhrY2QxZHk4OFdNVHJUWmlIVUNwSnNhcXh1akx3?=
 =?utf-8?B?NGtDUGJESFU3UFZDQVlvcGNxSTkzSlR4ZmF2R01Vd2JSRi8zNW10UDl1UDVk?=
 =?utf-8?B?YkJXVG8zcGtNVVluYWJDS3JFdE5KWDcvUHpES3ZjYWdoZmgzVkttYkpKTlU2?=
 =?utf-8?B?T2hUdU4rUUhQNnludzZRL0FZOEFmekExU01pckhxMDZ5Sm9PclJMWkpNbWta?=
 =?utf-8?B?cksyWGNsWjNMZFI3b3lTYkJMMlBTMTh1NGFhL3A1b1Q2LzdHYUxNYVEzeXpF?=
 =?utf-8?B?SDFDZG16REtpckFXaUVWWENzNmVCVU9WVU1NQ0dGNXYreXduVStJRFdzc24v?=
 =?utf-8?B?V1UrbndoTTUyTU56RTRTY09oQWJNbFM5dEtra2d1ODRvUFVCaWRHdk9iaXJz?=
 =?utf-8?B?TlFKa2JBNzJibWk2dmg1Zi9PYXB5ZWpmSmdhUFkrVDdUNHVEYVNsUnduNy94?=
 =?utf-8?B?amI2bUFnRzc4SE04R1lNZFdURnI1Q3lhK3dVZjdVZXA2MjlCOE9RM3I1RXJN?=
 =?utf-8?B?bkVjbHUrRlEvY2hoVElhVHRCYUVjSE5UVldHak1FclpPOSttblgrMUFPdUNh?=
 =?utf-8?B?R1FxUjJDWnEvLzlYMGpMQnFXVmRIb01PUXVqbFhFemhRT3BVUWkwcnIxQ202?=
 =?utf-8?B?M3NjZ1ZPVFQwRDhjek1NeWlzWmJObmhJRXVBckhpUldkd1JnRDBGQU1vY2o0?=
 =?utf-8?B?SXkzTC9KdTRMQXljS1FiTTF1c1FVdEpETGliWlJmQmpJTkVVOXQzZThnMFFP?=
 =?utf-8?B?aHN1bkN2d0l6eTZNZklaQW5LQ2xzSmJoODB0R2xrNWcyK2w1SHZVL3gwWWlT?=
 =?utf-8?B?andFTUNJL0d6T3V1U3JGUld0TnJzNGlqd2hxOC8xWnZGS3ZuanZJSGlFN0RG?=
 =?utf-8?B?c29wRkFXaUJzZnUwcDluUGVYbXNUNS9Ka1ZFMWo5Ui9qN0NsRXppdzJrZVhH?=
 =?utf-8?B?cHZ3OGx5bS9tRzF3SjdGSmRrRktFTlJwQUd0UUtkeTlyVVk1Y200ZkQ0Tllp?=
 =?utf-8?B?bXRXeXpLejR1UmVHLzhLUW1vMllKOC9YeDFXeUpRc040cFZTNklMeWErbTly?=
 =?utf-8?B?TXViNFpZMGZPczUrZlZPTWNZWXdxNC9MdDZoSHVhbEZRR2JmT0ZQL3dBL1Fa?=
 =?utf-8?Q?s2Og=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTF6NVk5c2tEbGxpL0JhbDRtUjNFOXdNckVHbWVkZFExN2xpTmR2bjlYSmRi?=
 =?utf-8?B?UCtxYmltZ1FCanYyQ1BIWFdWdDc5a2FJZTVJYm9qUXlvOW9heEhaaGhLU2ZI?=
 =?utf-8?B?RWtvVHBUS05PODc2MFZSb2dyckNTeC85dWhhQXFTWXlSMmczK3puVzY1eGl1?=
 =?utf-8?B?OXorU1d6T29SaGNlRVE5Q1JPQ1puTzljT3VSYTlvV0tRQ0l4OWZGbUV3Q2t5?=
 =?utf-8?B?aUFRY3B5cnhuUFQ0YnhrL0FWNnBGM1o5QkIrUGorSm1ybXdLclNRVWlIZnBQ?=
 =?utf-8?B?Q3B3OFppNExmazF5YkRlSlFFRUY5aXRwSG5QYVdyNCtGOUNxNHZVajVGNlVx?=
 =?utf-8?B?bnQyQlNQMm1qbWhNY3V3SzkzdFR2cTUxZ3hjTjU2Rld3MnY2V20wcFZkVXFJ?=
 =?utf-8?B?N0laZmxFbkhVQk1nT1lrYUcwQWhwdFdFaWNhUjBIN3plNngwVktTY1J2Y0pJ?=
 =?utf-8?B?MHNHcVArazd5aEZNWHdSTThVSXdvR2UwTEUyQ1pyZHg3T1lBRjk0b25ZRFdN?=
 =?utf-8?B?MHRWd2tOY28weG8vU1ZEZ3ZST29qNVNybGJWdnRHNzNDV296elIwVzlLUVlT?=
 =?utf-8?B?a2dhOEExR0h5TGtjY3ZiRXRSM09LRHIzNnRBNFNuNUhrRVhPWHhPSW8yS3NW?=
 =?utf-8?B?a0NsbXNYS3MwTDBDcXB0Y2R1YTY5ZmVZMUs0d2o2TStXNU1yVlFpdTc5TEdB?=
 =?utf-8?B?ZlRxVEttemQ4UFhYT00rYmJuVmZzUkx1UGNqUXg2UTkxbUQwTGJ3dXVuMlFt?=
 =?utf-8?B?VTB3SVRCVERRZU41UFpKMDBZZWZBSEE1TnpUV09KdHRNQy9CQ3RJakZxMEZp?=
 =?utf-8?B?V2JXcnZ6bEV0bVpzYWROSjU3UXZQejl1cHRrM0VHR0VURXFEWjhiMUZqSklE?=
 =?utf-8?B?ZDExR2VUSThYWlFwanNrT0prR2c1aUdLSGtRT2NEODNXUk9vems4alNFVmhJ?=
 =?utf-8?B?TlMyK3dxbDEvZHgyYlFMc1pOWVhKRHRHRVRHMDREd2tDc3NWZHpMV3cyRjZ5?=
 =?utf-8?B?RG9XdGdTdWhPRGZVY3V0OTVFelkvbER3a2drUGNSZld5Snl6QjRyTmk3dGdC?=
 =?utf-8?B?b1hibWVxeVArV2ttM1cxVmZrSXdXWG14NmtmSEVsbS9tVi96b2NPVTZHdUdr?=
 =?utf-8?B?RnlvY0l1MW02a2ZuQy9IbDNGd3RiZUxVbkttb1p1dmE4eE9FMnUwTllEMjVu?=
 =?utf-8?B?TUVEYlpDK0VQREg5TmV5MmJyRVVkYlRWUzcvcm53QmJQUDdUWFZGRzBWV3hp?=
 =?utf-8?B?Q25oYzV2SzQvbFcvN3dSdUY4QmI4MFJvNW5IUW1JWXdGbmo2ZjdXRVp4S1ox?=
 =?utf-8?B?WnlMOExkYmYzbEY0cUVGa1NRSTJqU0EzQTE0UHVKZStybkxqbmx2dWt0ait4?=
 =?utf-8?B?Q0MvUFB6aHMwa21BQjVoNC93QkJyTlViU2ozNXFtdk5BV2V6RDN1M1c3MDlt?=
 =?utf-8?B?cjdxT0JhVlo3NXllK1dWdDdyWWRUWnp6NGpGZzZNb3NQOUMxTnBRUFgzUTMw?=
 =?utf-8?B?V044N0ZOb2dJTHppdG9TNkZPUVlROWI0bS9YNlFQZUJUSS9uQXpGUENOdHpH?=
 =?utf-8?B?eFNvWmlCVThLb0tmV1J4Mjc0ZC9zVVpFRE1EWTJIN083SzVPNkNPYUVLU296?=
 =?utf-8?B?eEFsTUJ0TmJjbVhLcy9LUWhzSWpGRUhCazlRRUpFd24vOTJpcGl3OEdjRGY4?=
 =?utf-8?B?ajU0cTNBemlibDJGQ1FocWFabnFZUU5Yc3kxbGtNNGNsb0RxK3dtSWx1ZkNV?=
 =?utf-8?B?U2JhUWphRVN0R1BKMEpVSVFDaEhXTWdaSEJkd2p3bTVSQ3VuaFU3U3pMbnJt?=
 =?utf-8?B?TFd0VXdZcnFyb2FjK1FsaklkUmU5aVd2YmlEejRsRzhzV3JJeEpaNzNJQ2lZ?=
 =?utf-8?B?THF4Y2FrSk5Xazgzd0NTbUhXcFZHQUxOQUk0cFVzZVE2eVVXUnpFc1h5REd3?=
 =?utf-8?B?R0htczkwM0tWanltVzVJamo1MlpVVGVRNWhkblFzWUhlNHlFemNnRUl3dTRV?=
 =?utf-8?B?N0JMRVJLSGU1VERKWUp4L3NzTG5lNWpqcEFZS1BCQzhJYndwYkJhRGdNaTgr?=
 =?utf-8?B?TTlGdE9WL0lMblc0akN3dUhhSVc1b25SbURtOWw5ZUlpMlZqQnptSlJMQlNR?=
 =?utf-8?B?d1U0RXNRK1pFTVRDM0ZDR2JGWU9Pc3F4UFBwNUtsb0xUNTEwYTRybGZnSU8v?=
 =?utf-8?B?SmFOUE95dEZjQldRZ3ZkYjNJQ1Y2Q1poSG1UdFZCWDgwYW5NN0FPdTF0bE9i?=
 =?utf-8?B?ZERRRndPS1NIM2UwRzVzTU1iQUo4QTdwc2pwWjFwa2xELzVkeWk4djdvd0Q5?=
 =?utf-8?Q?O+Ics/TOfxR/0+9HNd?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 787ce312-eb53-46c6-f3af-08de5ce10296
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:44:21.4822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgo49gr6C8vv0F6u0OosL/+o6vKbwr6T3w5YhF1whYSoLThS27sBoPsFu8XcRq1aeKgX1kVW7brNLuxjH6YQ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5519

On Sat Jan 24, 2026 at 4:34 AM GMT, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/drive=
r-core.git driver-core-testing
> head:   c991f93288cac176e6361617f91c17c63c23a86f
> commit: c991f93288cac176e6361617f91c17c63c23a86f [12/12] rust: samples: d=
ma: remove redundant `.as_ref()` for `dev_*` print
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/202=
60124/202601240553.wieP0mKV-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260124/202601240553.wieP0mKV-lkp@intel.com/reproduce)

Oops, forgot to invoke `make rustfmt`.

Danilo, can you fix this up from driver-core side?

Best,
Gary

>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601240553.wieP0mKV-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    PATH=3D/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin=
:/bin
>    INFO PATH=3D/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cros=
s/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>    /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=3D -fno-crash-diagno=
stics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falig=
n-functions=3D64 W=3D1 --keep-going LLVM=3D1 -j32 -C source O=3D/kbuild/obj=
/consumer/x86_64-rhel-9.4-rust ARCH=3Dx86_64 SHELL=3D/bin/bash rustfmtcheck
>    make: Entering directory '/kbuild/src/consumer'
>    make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust=
'
>>> Diff in samples/rust/rust_dma.rs:105:
>             }
>    =20
>             for (i, entry) in self.sgt.iter().enumerate() {
>    -            dev_info!(self.pdev, "Entry[{}]: DMA address: {:#x}", i, =
entry.dma_address());
>    +            dev_info!(
>    +                self.pdev,
>    +                "Entry[{}]: DMA address: {:#x}",
>    +                i,
>    +                entry.dma_address()
>    +            );
>             }
>         }
>     }
>    make[2]: *** [Makefile:1871: rustfmt] Error 123
>    make[2]: Target 'rustfmtcheck' not remade because of errors.
>    make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'rustfmtcheck' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'rustfmtcheck' not remade because of errors.
>    make: Leaving directory '/kbuild/src/consumer'

