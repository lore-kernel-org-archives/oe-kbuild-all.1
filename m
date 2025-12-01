Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36A2E9EBE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764589645; cv=fail; b=VAClWThGI6fG0MdnzB5U7ZeHjbGhg2p0J9iSMbjOJHrZi1mniY7ThiivR2ApbGvMrHcLkZxbj4MmC0cyWkUCHIc98qoGs9vDb9nllC960ZO2eZRnu1M4Nz1ZziZy1q297XrgDrDY7HNs6JGkk65AM4h+58mVJ+KAfgbCuEp/9mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764589645; c=relaxed/simple;
	bh=0YnZ9t9rnbAjPem31yWekweTs40Ml34HHaO4o0Vrf2o=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=evHQ81a9cjrUQaiTx0Q4qtn2xbRyjbH1K34tdlTprMiontNYdQVKU5CW/PRY8BBzAET2lblcU/Nn6BUkkpXVjmb9t1MIYvvYlAiVC586raEqC0cedlCp07Vmk6EkwAdYPyQVFTYORR76TLDfBAi2WzYZExaQNNCXi+55VsrU9pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fpQjmIp2; arc=fail smtp.client-ip=40.107.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fpQjmIp2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqr5uObKzj9tNfTyNkJVrffguouvLSphkyc54bLiesrHFc8HHJuxd0QhGzQu21Tonsw63Fbpc8+N1RYXgPzlngPNtjIitZNSyVIIe2Vl/Ek6uZXLLc5eC4uXTeqDkuj7rc7VTVsRdTDrDTMcSJjql9b0BmHBE4FUJOsTGA/dA6/VdBnwEPhhNRAaBCa9UG0PsFoiP4FgMea6jRG7n/EeTaAFozz85JZBgkdFkZJra3H4ylcvXxHMlLpmuZFcqJK6hHP/w5RCuIwM2EboiGpda3C4VO1vdJ2tsutDPUUkR7o4RRpUcJ2vozVlEpjjCdmSSyfdYBrJE4oiA8c7kfT3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5M1lgiXeN0EmCPw7djhF1X3JcYQbpwyIEguBB68z94=;
 b=EwZRYHnuK9vLE2eWrPrplrPhqp7jfTTgSpg4buSlCxXgSFWOLkRpj+vVYbQx36lsBGLKFZxvIID1+TebpoRV7uo41RHFcDsVdrJzPM/JUvpE1nIvdZybXs7KzJHOpga4F8L+BM7wLjyhqBl+Okc+StK+qILsmSFA/Zfequ1z3e6PSSN+YfNjxGRXb1GC5TQDEKP145Egc0EIr4e7LeORQPzOtTBVRG34P8NJo8mAjRwHTQv1u7C4YXQH8komYlp3ghyT1Njr6NNxhQptX3rg5sF1OKnUCgVyaoR5+SCWuFE47E958YCxcmD83BCwryE1FKVTTqOmRbvXQbO8Pz5x4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5M1lgiXeN0EmCPw7djhF1X3JcYQbpwyIEguBB68z94=;
 b=fpQjmIp2Y39tKCLek2J85L1td5szmloxnSzZK9MfvaMqVX+6hYgm7sr98NvfwPYt+/tobY7cPfteVlrgT8fi6flaacBqjz+SYwok4Mmq3We6FwAIaIb7YqrNdqrv7HLicws42eeM2AzwHvWWVpKMc693KaSM2fvgfI8eEhlAjkGC/kCixEKoCUC3MyA/KdhmMNNKGEoU+FMIT/ETtTF6dBdLwBV3WKL1iot7ZYh69CX89gHvRR7G/GbXn/PQdYOPh9MxxV4VXSQD9J3QDCsxIaKI7WQDJP7wHJU/919Ut3RlCn3UCX/uH/HvqEapAVi2O/ixP5mnHaIwEDagknZSsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV9PR12MB9830.namprd12.prod.outlook.com (2603:10b6:408:2ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 11:47:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 11:47:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Dec 2025 20:47:16 +0900
Message-Id: <DEMUTK1VYTCD.1GE8RXH4H33XM@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "kernel test robot" <lkp@intel.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Lyude Paul"
 <lyude@redhat.com>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>
Subject: Re: error[E0425]: cannot find function `dma_map_sgtable` in crate
 `bindings`
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <202512010734.GAsaWH7b-lkp@intel.com>
In-Reply-To: <202512010734.GAsaWH7b-lkp@intel.com>
X-ClientProxiedBy: TY4P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV9PR12MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: 000134f9-e283-49e9-c117-08de30cf6276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1U2ZDNuZTdwR0RKUjJ5aENVTUhhZmNtcGZEdU9ZS1JqWlVtYWJWZS8xSUMx?=
 =?utf-8?B?V0xJWFZqRVpmYktDRTZJYkhQcG9GQ2FOSExpN1ZQeVRTaUhkTkVIRHdaa3E1?=
 =?utf-8?B?RlZLRmRHZlNaa3ZUdHhqUU9HTjh6TS9QbnYzVkhJY1Y3ZWg2LzVwVlFsMWFx?=
 =?utf-8?B?MXQ0TDNGU0pxK2l3NGV1Umo5aWtJSWhUeWhQRU5veVBMbE96dkNUNmJrVG8x?=
 =?utf-8?B?R00vcHVkSUtQVGVLYmUydGpVV05JYXhyOUJKZ2dRUGF3bFFmRWhXcWNqQnJU?=
 =?utf-8?B?eVU1eHRETENkanU3clJkb0xrY2xNSFM2ckxZU2pBY0d6WnJMaG1EUndTUnlR?=
 =?utf-8?B?M3Mxbm5kZ3ZjVkRwMG8yVldmaG1OdVJpczlXN1kvLzlDaWFEd2ZCUHJKbkZu?=
 =?utf-8?B?Qkl0N2VidXZjdkVPalhkNnd2NkxPc2dHUC9jNlZ3WVgxZFBEZk41emd6TnFy?=
 =?utf-8?B?WGpOY2NwNmYrOERQSFlibitNV1RINEZTUmNZTXdwMmVuenZLUnVjNHNzRll3?=
 =?utf-8?B?d2tEZmEzUGRCOUMzR05IdFlsRmxtV254aDBYVXhWVmFLMi9VL1BjRktTeGVm?=
 =?utf-8?B?S0MvdVBleW9uOGtFRVI3OGswN1ZmNitXZnJEMENaSGtReXNOUmZ5ZDBxSXVV?=
 =?utf-8?B?SmVVNXNPMm1CSHFmQ3RxaVI1VUd0KzByU0EvODZZeVE3VG5pWk15NklTY28w?=
 =?utf-8?B?VVZTTjJKanRpU1BrYWNxK2JZdEdrK1F5bk8wS3QxVGxsVDVYNnpuVkRSSVAv?=
 =?utf-8?B?ZzB0VkRiZnlMWEk5NnhUOGhIL2wvOERFblZTYUxBYWZ6VnB0SEF4Y1lUdXBP?=
 =?utf-8?B?RDI0NDNKck51REpDcHNxbzk5cWdwU2IreEpkNi9HdXlIYjlaWkFrcmlOeGlw?=
 =?utf-8?B?VzludXRnZ0cyRXVHYmhWczgxS0gzSTJuNmNtSWpQMFBuRkVhYllQblpTb3Vu?=
 =?utf-8?B?elh0K1dMVUFRd2dIVVkrWUl1UWtWOHhMdVBRRHkwREt6L2tRVDNWMS9xd2hC?=
 =?utf-8?B?b0dYSHNrQmxUMTkrejFVMnRTWFZPUHpJV0ZuM1MvbUQzaTFVSlNDcXhBT0x6?=
 =?utf-8?B?YTErSVRrTnd3V1N1UmsxYXQ4NjVoamVZMlFXWTdwcmZSY1V6NmdiNHI3ak5S?=
 =?utf-8?B?bm02WVNtWmJxK0xtTXRiSWxac0pBeE9rUEZKK01DV2hNajNiWVdXdkg2K0Vn?=
 =?utf-8?B?aGJ4UjFydHkxZFRDVWpaa2ZmWHFtRVFuRHhMd2NhdlpWV1FGVzlHSXZ4MkRW?=
 =?utf-8?B?dUR1VC8rOGwxQnZaaUN2Q3BPRGhjV09URGUzNCt2RFovS3NMQUFPd0xyVkxp?=
 =?utf-8?B?d3dIM0JRVmpMeXJtQ3lTU05MK09mS3NHZlNDQ2FwcE01OGhLbE1wL0VaUGQr?=
 =?utf-8?B?clhHUExQUExKSW8wVDJoYURxRU50V0ZiS3ZOVm4xT1Bua3NLOUdYcllzOVFX?=
 =?utf-8?B?WnAzYlVqMGFWS3NCWkExNWZoV01pSzVocEJhNWRxWXNyMWVyU3BSa3JCUytG?=
 =?utf-8?B?VjE5OXFwVG9pR1BUUXE1OUwwZFFVVW9mcXdDWHM4ZFhzT1RYTldkUXlnQ0dX?=
 =?utf-8?B?L2ltSlkvZUJXck5FTnhKQ1Nwb3NXYkhZRWNZSUZiNU9IOWtoK01wdmYxZnJV?=
 =?utf-8?B?cW9hNG00eExic0ZsSmJPU09NdVRZNGR6RUg2ZHV2TEpyYnVRY3VrWHVDS2VG?=
 =?utf-8?B?U0pycS9GVVdFTUZ1UUlGUGVOemxxMnkxdFYyUGhJR0R1Uk5uRmhxU2dYUlJZ?=
 =?utf-8?B?Y09ZaGlpQU5SbDV0MkV3Mjg0UjV3dFV3dENxSUlaMGh0b1R6Q2NZUThaYTVi?=
 =?utf-8?B?Qk5lNi9NOGp4amczenFtWTY1VTZYdnoydjdSU1RIdlFDdkJ1dnJjYkNGK1lv?=
 =?utf-8?B?b2RZeHprUWJjUTJ6K2RXRXpqSm9MMnZYbHZWOGhiem5RSFpWN0F4ZDlqODNT?=
 =?utf-8?B?L2wyUWtJUjV5OFUvR3FIbXJIZVA3VzQrMlFiaVJmK0srSmZSQTFFZ2hTOVVt?=
 =?utf-8?B?MktvVkI4dGRBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzI5RUFweW45dHJpWGpLcEJEMmZzU2V5bW1wb3kwWmRJTGhlM1dJVFpIY3lj?=
 =?utf-8?B?TWpsVWVESzhEb2ZQRFN6QjB0L0Nxb1pHUVBabVEwTk85SkYzZEo2eWhoTXY5?=
 =?utf-8?B?ZXVtRU1zRjJGaVljY1U3WWVpaFRiSkY3enpyM25NaXlXSmYyMVdxOEpzZUxP?=
 =?utf-8?B?Z1AzSmtTa0dFcXdIVlRibmpFSy9yWThVanlqNU1OUHd6cjQ2d1N0d0tHZ05a?=
 =?utf-8?B?TXVnR1hiaHdWVE5hbXpwT2Z5VnpjNElWbTEwaEFjdkwxVXE1Vm1aZmtqWHN4?=
 =?utf-8?B?dGtXVFdJTU9FUjJTekl2L0V6ei91dkxBVElXemJCWXJ4MlJNTXhCYU9iSEFQ?=
 =?utf-8?B?Rzl5WitGb0M5Rk54RVdSSHFQRXRsVXRKWk92T1dzbzRKcEJVK2NGcWE5b3I1?=
 =?utf-8?B?dUsrTWd2T2hQT0dYMy9IRldENWtwamZZcVhBMHMyWm40YUtJTW9Ra3NiQ3ZV?=
 =?utf-8?B?YXU3ZTZEYXZVMTU0QWUwVjFqdVlGUUNuRit0clE0UEpDRUdZNTYrWUxreWtP?=
 =?utf-8?B?eElPVEhZSmhHNytBdXZiZkExbkdrODdyNFRRdTVrNHJiZlFpUStGbDFIWkJv?=
 =?utf-8?B?VUZwbjdsSFVBUVRiTS9FOUdQMGs2T3FwamFVME92dENOd2hFTTNpLzgvN0w5?=
 =?utf-8?B?c3FYNXd0UHc2WU1DUCs0Lzl2ZWI4SGJSY09DdE93d3RmcFFHRDNPcVc2UFpr?=
 =?utf-8?B?TnNZblNuNlRLbVEwaDdrUC9ScmN4U1JpNFZrL003VWlxYUZpSmptNnh4RHFU?=
 =?utf-8?B?SXlJYjR0dWFlSTcrVzF4UUZMVW9jblk2OW1zNHN0ZjZscEs4QStjellLSGVR?=
 =?utf-8?B?bHN2S0lZRU1Ud0dDcnpyWUN4N1M4Q0Jya2ZZVzIwMWlYQVoyNmw3SEhVRXhZ?=
 =?utf-8?B?bzhBQnZROTdQbWZEYkNheEhOcnU3bE85Y3FKbkxxTlhNaFJOUDBuamU0Yldo?=
 =?utf-8?B?NXNtaEF5K2twbG1wK3dyVkZsdWh3YmpqWTRtYWQ3cEtlYXZpZ2hzYXVQVGtk?=
 =?utf-8?B?c2gwQmlkdTNqYy96NWZWOEoxZlVCb2svKzlZdDQzd0FUTzNRaWZkM1ZVTXNG?=
 =?utf-8?B?ZzJ5ZjZqUENsWllGWEJ5Q1pJQldPaTFXTWtLK1c4bHNQMDhEOGhZa1ovQXlW?=
 =?utf-8?B?QW00OU44c1pkQVU3SG9PWUNBY0hnUG41azF0Y0U5Q1ZDcE5WODkra0dRQ25q?=
 =?utf-8?B?UHZ3K1ZRYS9XOE1LYkhVR3YzMm01ZGtXcHlaVUVKWVhucEc4dWV1U3poSW5O?=
 =?utf-8?B?cHZPdy9vVlkyaHdJczI5S1B5anp2YkRHNjJENzdzK2pZbzgzNWhQVzk4TEc5?=
 =?utf-8?B?T2JKbHFmeWxjSE9ENEwvZTcrMi9SQm9ZNEt2dVRTV0VwUHhQQSsrKzdVWVBP?=
 =?utf-8?B?RFhZeS90UisvdjNLeDhWemp4WVRzTnpxb1I0MGpoTndublFaWDVBTHRONncz?=
 =?utf-8?B?QkVXSzJoeDJvUWVsRlUrUWl2eHZYY0RKZGpGR2dFUU9DU1g4V2FXRjYyUWNY?=
 =?utf-8?B?b25OUDZuWTY5dGNHS3NxdXhYZzZQQ0g2Q0QxckIwK3J3d2pUd1k0V2hvSzl6?=
 =?utf-8?B?SG0xN00wWXNEZVgwc0ZXcWNMM1UvZDZ4ZXZsVXBMcmxyVlUwK1V4M2ppRlRJ?=
 =?utf-8?B?N0QzMjcrMVNQWXJNSmpGMFhXbXdvWDJ0NWRLYlNrVDFXR2hoV2VCSzdzS25n?=
 =?utf-8?B?UGpNZzFaYThJMnQ3Um9yQktCditpWVNobmxRMTBHWEY3T0JXaEVQZjhvaEk4?=
 =?utf-8?B?MTdMcnFkZWFvTHR1RjBZWE1KWFRFWUU4OFhkUzBoWExWNmVOd2lCTldiRXlX?=
 =?utf-8?B?cDRDTmE2cXp0K3g2Z1B3bi9kYWRpckg1WW56ck1GMHlsYWVYNkpvcE84ZGYz?=
 =?utf-8?B?bCtRZ2tWa2hST3kxKzhUSFd2ZTVUTkduMWNPMzFKeTAwbW1WdlpqSkxpSFdY?=
 =?utf-8?B?c1VmejhZRys4NEh6eHJic2ZqejhSK1NSY1dSWCtudytlMnExRGx1SHV2eE9p?=
 =?utf-8?B?YWY5bDAzL3l3NXpIM2MvMU91NkVDS2ZMTzdNYVdBWk02eXZSZXltMlpzK0dZ?=
 =?utf-8?B?eWxmd25CTXdzVGM3L0cwNHJObHREU2dlVnVvQ1ZJV255dW9ZMEUwTEZTRGJT?=
 =?utf-8?B?cjVjZnVQa2dZay91dXNQY0trdGdzUzNMeDJoWDhLS3FGTjh0bzF6anhTT0lZ?=
 =?utf-8?Q?31jQ+qBw5xhnL2pIpNpEeItdZTf8zDgFGuxWCq0K0oVi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000134f9-e283-49e9-c117-08de30cf6276
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 11:47:20.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfQS4tK5wOMYgbLnrVp4dQlhT7Oq9uDLDYh536VbX4gLHSEoOjxbRVzpNiZEreRhXKzbXtKzxXls6LKqdlPj2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9830

On Mon Dec 1, 2025 at 8:22 AM JST, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   e69c7c175115c51c7f95394fc55425a395b3af59
> commit: 05aa6fb1c21d7fb9df735da24096d793223789d5 rust: scatterlist: Add a=
bstraction for sg_table
> date:   3 months ago
> config: um-randconfig-r054-20251201 (https://download.01.org/0day-ci/arch=
ive/20251201/202512010734.GAsaWH7b-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b=
3428bb966f1de8aa48375ffee0eba04ede133b7)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251201/202512010734.GAsaWH7b-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512010734.GAsaWH7b-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> error[E0425]: cannot find function `dma_map_sgtable` in crate `bindings=
`
>    --> rust/kernel/scatterlist.rs:212:23
>    |
>    212 |               bindings::dma_map_sgtable(dev.as_raw(), sgt.as_ptr=
(), dir.into(), 0)
>    |                         ^^^^^^^^^^^^^^^ help: a function with a simi=
lar name exists: `dma_unmap_sgtable`
>    |
>    ::: rust/bindings/bindings_helpers_generated.rs:465:5
>    |
>    465 | /     pub fn dma_unmap_sgtable(
>    466 | |         dev: *mut device,
>    467 | |         sgt: *mut sg_table,
>    468 | |         dir: dma_data_direction,
>    469 | |         attrs: ffi::c_ulong,
>    470 | |     );
>    | |______- similarly named function `dma_unmap_sgtable` defined here
> --
>>> error[E0425]: cannot find function `dma_max_mapping_size` in crate `bin=
dings`
>    --> rust/kernel/scatterlist.rs:356:52
>    |
>    356 |         let max_segment =3D match unsafe { bindings::dma_max_map=
ping_size(dev.as_raw()) } {
>    |                                                    ^^^^^^^^^^^^^^^^^=
^^^ not found in `bindings`

A lot of the `dma_*` functions become static inline if `CONFIG_HAS_DMA`
is not set, resulting in no bindings being generated for them.

