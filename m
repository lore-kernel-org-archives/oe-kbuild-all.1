Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6D1242D76
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 06:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.154.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769582417; cv=fail; b=M70t+136F/vEEqCdnuBxf3S5Nm8d0OUKm1myEuhDrfwrCvM5VpY2aAWSKyYwEIwNfZnlhvhaASWRyFHynFVfrv5wmhlpv32yJeB7FrrvGWfBWsDLunfy3fMkkEk5Tpu1rgNcz8ohUfO/U4ZazwkWgRSfNTyGsoZWACP8Pzxcj5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769582417; c=relaxed/simple;
	bh=Bg1LfP+uR9qMEVI8xCLf1ZjkfyDu3f+iehn4VPnYBI0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TBJaMhjv1jbuW2a6kGHi8Krk3OqNzvjlZoq5g+kd5x5QxFl8LwxPMpvgFzDfLXFypcW9Rzmd+7Ln7uR1kw/F1BjDqHkTRvw5fs3bmpLbGHKHEwZzvmr46fAgHcZl5MebfE0PGAaiVOS+aQnnaxQ532GHR5jz1Gl3EGLSIA3RR/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=N8KyB/9+; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=ukK3W3I1; arc=fail smtp.client-ip=216.71.154.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="N8KyB/9+";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ukK3W3I1"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1769582416; x=1801118416;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Bg1LfP+uR9qMEVI8xCLf1ZjkfyDu3f+iehn4VPnYBI0=;
  b=N8KyB/9+5rv88rEbQgr6pIb/jfvCak/jvL/d5klNT7KDn0NiBi4nWvRH
   Xdk+BpjnsDqrPpbeITs5jPcVwynKf+vZO0JfHmVGkg1bJR2w0XC/zlfxZ
   AGaiuVFtbM9dOQKulL6Nn9ZQCz7+uBNHcag3lrO11FJAAeNepaeN6G2L8
   kNc3C7Zn8OxJWKQXTmtFs5e8HNruXlrV5G7PV3X1pA+BVxZmVr7oIwqqj
   N3cMbhUwoYbwamOtzwIu8JufbHNBYlbEiMCALkXv4HD20xbTjd8Gmddrd
   6gMTDUxoIQt3BcPv4TVnZa9gpTCrWn6Df00LXjGqXuyH0D9tVYakvsCAu
   Q==;
X-CSE-ConnectionGUID: tcxlWJ8jSe67mJQy61AuAw==
X-CSE-MsgGUID: dyhqYf3ASfq0zObHX/j/Ew==
X-IronPort-AV: E=Sophos;i="6.21,258,1763395200"; 
   d="scan'208";a="136185914"
Received: from mail-westus2azon11010033.outbound.protection.outlook.com (HELO CO1PR03CU002.outbound.protection.outlook.com) ([52.101.46.33])
  by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jan 2026 14:40:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHNWIFLKBlbROZznc1b8A9pNJLHuk6heth4sWV3mvRGdIBLjIdMQckoGfhxWB+GRp8iteZMBIAFZYxdYSe7OWz7j+QvlXjZFDZPuk+Bz5+V6VFyEsNW7ImayEfWP4I/W2AXO7t7j/iE47WwqBCBbgHHiO0oBCzz3IyH+sTEs8O3R7ShJngP6trGKWvyBT9upvptAplsWBm8/gmLD5FoPLE5o6/Z07tcjgxN+jd1aTI1tFfmkI3F50YpRKDZXwc44Au8LqltQ1CLZJ5keFMvswzYZyTGXd5rerzYuOfHjcR8uWQoNxUu99k8wiiZPvAgvmxuvtbNrTk+M/ADO/9FIPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bg1LfP+uR9qMEVI8xCLf1ZjkfyDu3f+iehn4VPnYBI0=;
 b=u79jybPe+jSWIOf0ABBgIZPte3w+cLpY8yxsQKJkSuhq0VfqVWVcO5kMSUC4BcolVW5F25dI63E7mYbjDogM7j5Xk2YUs3PslZ368qPmu8JcIfyu0ycqNgtWrGd0d8nHGgPEymaDc9t0Eni4qxzrYkJh98Gq5MEpovtLOyIW9tYOfJWRqGk2nkDh7FAzggKXgHn4a2fCtX219rdq34YZ29UGJ+39tNkhCGslkDTxNd/0hwwiM5xfKHMDqwhZM+sI+ipmSVGp0TG5C+ghwSdsOtG8j2exaPY2l1Ub95zLtz+Tz/t+SlTr5a//5PbyNoEAnaBLGrTyaZyCWMcIjf7/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bg1LfP+uR9qMEVI8xCLf1ZjkfyDu3f+iehn4VPnYBI0=;
 b=ukK3W3I1mHs7jh9pNwwlFBR2OKOUyBGdhpNCU/fPPc7LKT7ekGkVaheA4QuPn9Y2rXTSEG8UzRYb6VjhpMpDNm/Zt7DN/98X7f+xgbuygSTyHsKLaQ4aK5DsxWtV4GG1cBjTLfT1C6U7jQIvaDPet9bEDjuhZGarJGQkqNGqH7U=
Received: from LV8PR04MB8984.namprd04.prod.outlook.com (2603:10b6:408:18b::13)
 by BY1PR04MB8774.namprd04.prod.outlook.com (2603:10b6:a03:532::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 06:40:12 +0000
Received: from LV8PR04MB8984.namprd04.prod.outlook.com
 ([fe80::9ba6:7273:90bc:53a8]) by LV8PR04MB8984.namprd04.prod.outlook.com
 ([fe80::9ba6:7273:90bc:53a8%5]) with mapi id 15.20.9564.001; Wed, 28 Jan 2026
 06:40:11 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Michael
 S. Tsirkin" <mst@redhat.com>
Subject: Re: drivers/vhost/vringh.c:559:33: error: lvalue required as unary
 '&' operand
Thread-Topic: drivers/vhost/vringh.c:559:33: error: lvalue required as unary
 '&' operand
Thread-Index: AQHcj+1/2SCChIjMtUu9HXItPE+WLbVnIguA
Date: Wed, 28 Jan 2026 06:40:11 +0000
Message-ID: <1cc48c45-c730-4e81-9aed-b643102e75be@wdc.com>
References: <202601280148.8Z2rFqjo-lkp@intel.com>
In-Reply-To: <202601280148.8Z2rFqjo-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR04MB8984:EE_|BY1PR04MB8774:EE_
x-ms-office365-filtering-correlation-id: fd985b31-a322-41bf-ad70-08de5e381657
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|10070799003|1800799024|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?cHBwRkNqQSsvM2loTmdNcVdnRitmRTV4MkpZWU5ES29FTzgrZko2dXEwUnY4?=
 =?utf-8?B?R29tZUtlSUtGQ0JtVkJEa0s0ZFVIZlExNHNya1RaVWpjWFk5T0NDVjM5djhl?=
 =?utf-8?B?M2JidGVvUEcyS05RYzh5M3NBOTlzaGRabzJhamRJNTZiNFpZVkR0d3FnN1pF?=
 =?utf-8?B?dVJhOC9yMCtLVUVSMHFtdGFyU2xCYXJuVDZrSkNZd2RtNjhBT3BsRC9qTitB?=
 =?utf-8?B?MnJZS1o5akc5TFR5UXR6elhZaHFWcDR2bW5ZRUpmbXc4aGdsY1cvWDNCNXp6?=
 =?utf-8?B?ZjdqTFk2VzMwak5KTGxNUmk2YWp1aTN2d3M0MXBWWHA4dXk0K25taW1KMWlw?=
 =?utf-8?B?b3RWcXYxT1dBMTR1M1RmeTlweEZxQ3ZROE5YeDdYQ21lMUlsZDd5enN2UDhS?=
 =?utf-8?B?SC9PK0dzc3pzaXhHSDVmL1VCaCtBSWZzcFFsZWtRQ1lQdXQySlQyWXpOMDRH?=
 =?utf-8?B?VWI5R3pTd0RVTWpxU2pZZVprSE5FN3loSjVEelIwOTQ1Snd5MzRyNmpMWXEr?=
 =?utf-8?B?VkFBRU1YdktYZkFiTWExTXpzUzd6WEk1NTdLYlFDbnNHVHhsTGhKTkJmaEZL?=
 =?utf-8?B?S0ZQSTBETEs2K2JuY0gyRFFIQTFhdFZVQ1ZFc2dsYTFDMG83M0pWNXJLVHN4?=
 =?utf-8?B?UGFUeTNYOHh4amV6d0NrekJkbVFuM2wxTW1lTFlFMUxBMDhGTExWajNYdnlq?=
 =?utf-8?B?aElCSlBSSzBQTFArY0o1cVVoUGxmVUtBV1RqbkNpaUpxdnVacG9wdzdNeGg1?=
 =?utf-8?B?R0dXa0lPUGc3WkdTMkdVTVBKeXIwQzJRcUlvNmRmQkhnS3VFT0FxY0tzWGZz?=
 =?utf-8?B?eTVINE5lNUpINHBmZHhLVFdTS3Nld3VUZ1llMVZoeWZTNlF3ak1UM2x4eGZD?=
 =?utf-8?B?anRBZWtURUprdVRvUm5nZVVmRGowNWlaWkdpbTl2Zk5sazJZNnpSMElCZWEz?=
 =?utf-8?B?U0czZ1Zwb1J2WWJWVlpUcURidTV5dDBzQVlRckJzV0xUZ3I1TUpsK0daSks5?=
 =?utf-8?B?ZldIZnJKSDBoYmVwbGZHczBQZ2sxUHN2TWM3OTFLN0JLMU5uKzFIL0pUMHVN?=
 =?utf-8?B?NytTK0xzQmFyaVJQTmNFRzVxVTFId2JuTUkxNWJMZjQwSHJJOERmOVRBSmkx?=
 =?utf-8?B?Njh6bG1YbVlVZzBWWlpZNVBUOVROejJlUDgwWGdwNk9YQVJRTklBNjQ4Qk51?=
 =?utf-8?B?UGJCZFkwdjRvWHMvbUNVeU1QRE1paHZvejBVWXFnSm5JSVkzUUg2S3lCcWVp?=
 =?utf-8?B?ektyMHJXZ1ZpZHhmM1lZaGZ3SitpSW9odDlLMmVwQ0F5cUNaL2gxVGtTVE1U?=
 =?utf-8?B?cUZLVXo2MHdMOWRGN3k0ZVVMQit1YXdWTG13ZmFQMWdiR1JXdExSRCt3d1p4?=
 =?utf-8?B?ODFPZUxEdVZmajh5MEtCU2Q2U1FNbzlwRWt4OHNCNGdycENLK2xGcXp4bG1B?=
 =?utf-8?B?dmdOT24yS3U1enVBZVUrRWRkWUlrT3ZkUmk1NVlrOG5UUy9rRWN3WmJyckhv?=
 =?utf-8?B?VEE2ZnRKNzM1L0R2RExZek9DTzF1eTNFbFQ5K3JoNW9OY2Y3RzZJN0xqLzBB?=
 =?utf-8?B?T3hzcDZjTFUzdmw2dDVSeGgyYmpPcVoxTlcvRU44TzZUUERFUXhYYVZPR3lw?=
 =?utf-8?B?ZGVLa3E4T2dzQkJCckFxNUNBNlRTYlJUbkpGejRSTEQ5ZXRid3pCNzhTWHJB?=
 =?utf-8?B?TkVzejlKOTQrZGs4OWxJUU1wNWlkUVl3NE5vT09YMGphVVF2OE1weG5qZ1pH?=
 =?utf-8?B?Rm45YjVOcHc0ZXF6cU5mSE9FRzVsQkNFdVlRUC9mTStvdUhPbTg4c1grcVNF?=
 =?utf-8?B?cUtaTVNoRzJkR0FZdmRoZCtNK1dtdy9mcW9lK0hJWnQzblVaNm4vTTNidDZv?=
 =?utf-8?B?akFsdncyQ1JSVDFzUkpZczNLWFNaZk1PWk1uUlBjZmV3SFEraFlQaUIxMjJJ?=
 =?utf-8?B?bUEzTVR2YkFCMFpQOHR2aTlBL2szQmtvRFJkNzBRalFwa2JYbkhhMmQ3TWZt?=
 =?utf-8?B?aGlNV1YzK0JlS0pLSGFHN3FpUmVHSW5pRVl4V040bzNhZlV3NGVkTzJhc0l6?=
 =?utf-8?B?WXVWVkxPRWxGY0RTNWVXdlVZUnNtM3JBN253Q1UwVnQvb3diZjhPZkh3Wmhx?=
 =?utf-8?Q?NKqc+9QJ6J8WAh5A+lNGY4RmA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR04MB8984.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(10070799003)(1800799024)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2E1bCtiZVlZYUk1enZJRCtwY3V3WlBLNU1YU2tybEd0UUxPdkRlVDBSM3pW?=
 =?utf-8?B?NVRyUXhaV2FIaWErNFAzbjc3MWhJU3dVb2tGaVd4RkpjSXVBbFRXNVZISC83?=
 =?utf-8?B?clZZd0NHVkRoU1NKc3NZdCtlNHR5dmlQbWlUUHdUSW5pWTNreDF3bjZEcVlY?=
 =?utf-8?B?bkVSWlZWRmMyb2pYeEdZSDU3alU2UkpUS3l0V3VHbDkwaWVTZW82cXV2VXlk?=
 =?utf-8?B?RWFVQm5wVTJEZDlFa3hqOVd4dVduZGl4RmJUdnoyTjhTcUxTakVadHBUNzd1?=
 =?utf-8?B?bW93N2JpZzV2a3NZNXo1cmtkamh5MThuV0ZDWkQybUpydklSZHA2N2pGamF0?=
 =?utf-8?B?MGJkZjJOQTdSdTFuRjJLWDNjYXFMMjA3YVBrRkRDUE8zTE5Bekw1YWkvWHBu?=
 =?utf-8?B?STk2VmlwSGFiMlJLUGRkT3p4L0x6ankwSTA1RDFlZDUyOXRTd29GS0hXSzBE?=
 =?utf-8?B?a0p0bzk4ZjhFczVDdjBVZ1FCdldlYktDMEo4V3BCWG9HT0hieVY3VTdWaVVV?=
 =?utf-8?B?NkppWEZKRVNhc01uOU1ta0RRUTY3by9nSE92cGJLL0p5OXlqN3BLWjJ2NWtu?=
 =?utf-8?B?bEpvY0Q2alZGR29yQjhBU3ZQRTZIOWRERDBlZWNoRm90amFjZWo4QnZXZTZJ?=
 =?utf-8?B?MnZFUmJBTUZxRnhITHpZZmRsdDRNYS9kYy9rOS9JRGc5cWNUYnJycERtc1pD?=
 =?utf-8?B?SXM1T0JOSnhNZ2hraCtoTkM4Z1QrM0pxeE93TXZFZ0JXQ0VHUGtoMXJVS2w2?=
 =?utf-8?B?aCtaa2xYSEFGMzNIbU9vVEpxOHFrRnVPeVc5bXhCK2ZuU1cwbGNGZFc5K2hw?=
 =?utf-8?B?RC9Vd1hJcHdFK0xPNld3RkNQNkJQdmxJai9kYlJybkdaVWg3bWE2Ry9YYWxI?=
 =?utf-8?B?bnhXTXZ3YmtPcHZJcS9UYU5EUzhhckxEUG5jNjBramsvSWJRM3dUcHJXNHBV?=
 =?utf-8?B?U2kxSUxFYlhuRGFNLzR5NHMwdVMyMEVDeno4cmtiL0QydmdIc0JIZlFwU0hM?=
 =?utf-8?B?LzJIRkxPSmFDanJlZjE2aGMyVkVnc25wMWliaThHb0FrelJpTEhrbDlVWDJP?=
 =?utf-8?B?cFJqc210U1kyOUxPcm1LMWc3RVZYY3E5UmF2NCt6dWJpNm1xMHh6RHU4M3Jx?=
 =?utf-8?B?bXdwbHFtaXhZalpkWlAyUjBiVHAyS0pXeHBZamR4MitoQ3daMHNIWFYwWXRE?=
 =?utf-8?B?RTFBZkVydjhqeXNRdDBSY2k1R016eWI4bm51anVhMkVkbEZRMElwdDhveHly?=
 =?utf-8?B?Ui9Td05aalFkVFpTaXVhRGNtVTg5aldhdGlJYWhwWXpDUExEZDhERmFWamRh?=
 =?utf-8?B?K0VERy8vd1BaWlNOVENMVjk5TG9XSERDaVpkUUVtaW0weG9EbCtKSlVnMGhh?=
 =?utf-8?B?T1FhQTI0SU1Pd3d2cVFWMG1XQm9HNVZjbTcwOWd2bWIvU1gxY2h1ZGVmMUxN?=
 =?utf-8?B?Y3Bkb0N6c1NTeUZaKzJlMVFSbFNWa2tGOW1DZjArQmd2OFdnaGlxdEpUSzhs?=
 =?utf-8?B?YWt6TGxoM2t3MFpRUHBRN3B0Sk1Sbk1GMVBRUzdOQ1dVdG1QVWMvdUtaUG5a?=
 =?utf-8?B?WVVHUGdyeEcyZ1l3dFVZTlNyWWZtb0NPbVhnSFBwNVhlV2Q3V1BmUHpJUkNv?=
 =?utf-8?B?NkJGNDBZY3lWaGo3V0hzZjNlN240N21aejkra2txOWF4QmVkdlFWN0NzSk9k?=
 =?utf-8?B?M3RnNU1OeUpDcWttT0haamNnR1RFOWVycHlNNElQR2w4ZFAyMnpEaTlVelIy?=
 =?utf-8?B?N2JSNjFIUmJKaFBrL3NoWXA1aUhjY1NvNWZJY3JDeHp6clhid2p1NXhTNEdh?=
 =?utf-8?B?SkVCaE81VXJRMTJCak1NZS8wYzNFQkNHbUI2elcxMi9xVUk1ZXRBZWRZcEI0?=
 =?utf-8?B?SjF3RWEwVk5YWlVqYitycmlnWGsvM0VyYldpM3ZIVXlrTmlMc2ZaSjI3L2lv?=
 =?utf-8?B?SDFORU5DTTVudVJwYnNHTm5Pa3lMeTA1MFJaWUhaMTUzaWVMT3Y2YkQwYlhH?=
 =?utf-8?B?YXFLaU90NkwyeHVuLzN0enFjc3ZxTkJyYjdYN1ZScE5hOGpGWExxTGJoZDFt?=
 =?utf-8?B?alZRVSt1WDk4UW9JY05GTEZqVmpuc0IwUFgrNUpaQ3gxTm92SUFsS0QydHAz?=
 =?utf-8?B?dlRocUFQZXV3dTNhV2RBdCtIYlNtMXdHaEhNRDY2WGp3cTZ5VkxJWWtaWGlm?=
 =?utf-8?B?VWpOUmFWL29rSHNCNHlVWkxaeDRaWDFCZytlbXZZYlZNT0d4bXZNZWJTWFNX?=
 =?utf-8?B?WWpGUVB1dXBadkxsWTA4dGZMMDVYVzFsR0NrZ3BrYUcrOFpreXlJZDdtdmkv?=
 =?utf-8?B?Y1lCeE54a1ZOZWVORFA5czZya1J1RHFKVVdrSndhemI3cHBXTVlMakdnbFZu?=
 =?utf-8?Q?ti6IRFWARY+QJdB5m/1kf/VbncbSBJqgDnYW8Mh34z5Vg?=
x-ms-exchange-antispam-messagedata-1: O0oDE9D8NN7uKHMg6qI3cuycN0kFmQbmYx8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EFCD367622B8A4092DDAC5ADB82CD0F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fQi3xZBt3P86HPwslhY9+eQIr85ezxeXKmyVHbaRrgapPVd89kSVJYQuuCcBAQRAeb0km1vWtZL7VQYM6cN/ivToTv3S/wkmwoDrVGkeLm6xF6Jhd6d1kULVHJHk+yMInaqGH5joImsOdOwEACDpqBi0Y8junnXwtrDU0HIrFm/9SHMGrv5CyUFgBQo7//e/kLN4M79iPCJHHFEauKVDrlAEA0UbiIaWoBd337GlTNogKLP515+QNvAnvrnn8AS7vKvQL1+7JEPFfXhORby2hSa89cvIfq2HamiWXGg5tY6WXOACgq+yGXCEerO7kadK5LjpHw6qvcNicp10/z7Zafcg2a7mKw4fDRG0N0J6+yYcUfk5a59z5nhCDzACGsc7oMzAKEPESqVM6AbpS4NNwxWJEVVmkBrOLRh1NNit3cS41bGw90/5weWFvgy/5VGkBlrhMqZ+lJjz7hnCPxXq6SZ5LUwlZabjhSTbZJFkJQjSNscDiY/Uw9z2OLcht/Opw4IU5FEeKZEktkKaQmwXyiMfE4OpMh+icvYCo6odbeO/UC7NOltLm26rEhnDo2baKR6Z+ULPDk18Rs7Gv57SSru5ekK49JeRzWRBVxBdR/w5coGvLgsk3HcZHUqUM8gN
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR04MB8984.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd985b31-a322-41bf-ad70-08de5e381657
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 06:40:11.8773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YAA+BfKSzZn2bdjWAshVTmnqVGljiZVc22JcrQKvFNfy/vFw3PErGP8aWugUBsXboNxzADTv/jykrwNm74gLO7cEHDkpOEaP4bBYbDxJHtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR04MB8774

T24gMS8yOC8yNiAxOjMxIEFNLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90ZToNCj4gdHJlZTogICBo
dHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXRzL0pvaGFubmVzLVRo
dW1zaGlybi92aXJ0aW8tc2lsZW5jZS1LQ1NBTi13YXJuaW5nLWluLXZpcnRxdWV1ZV9nZXRfYnVm
X2N0eF9zcGxpdC8yMDI2MDEyNy0yMzUwMjMNCj4gaGVhZDogICBkNDNlYWYxZDc0OWJmZGFmZjlj
ZDA2MTA0YmI4ODM4ZDEwNWFiMzNiDQo+IGNvbW1pdDogZDQzZWFmMWQ3NDliZmRhZmY5Y2QwNjEw
NGJiODgzOGQxMDVhYjMzYiB2aXJ0aW86IHNpbGVuY2UgS0NTQU4gd2FybmluZyBpbiB2aXJ0cXVl
dWVfa2lja19wcmVwYXJlDQo+IGRhdGU6ICAgOSBob3VycyBhZ28NCj4gY29uZmlnOiB4ODZfNjQt
cmhlbC05LjQtbHRwIChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAy
NjAxMjgvMjAyNjAxMjgwMTQ4LjhaMnJGcWpvLWxrcEBpbnRlbC5jb20vY29uZmlnKQ0KPiBjb21w
aWxlcjogZ2NjLTE0IChEZWJpYW4gMTQuMi4wLTE5KSAxNC4yLjANCj4gcmVwcm9kdWNlICh0aGlz
IGlzIGEgVz0xIGJ1aWxkKTogKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2
ZS8yMDI2MDEyOC8yMDI2MDEyODAxNDguOFoyckZxam8tbGtwQGludGVsLmNvbS9yZXByb2R1Y2Up
DQo+DQo+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChp
LmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YNCj4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwg
a2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncw0KPiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4NCj4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L29lLWtidWlsZC1hbGwvMjAyNjAxMjgwMTQ4LjhaMnJGcWpvLWxrcEBpbnRlbC5jb20vDQo+DQo+
IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToNCj4NCj4gICAgIGRyaXZlcnMv
dmhvc3QvdnJpbmdoLmM6IEluIGZ1bmN0aW9uICdfX3ZyaW5naF9ub3RpZnlfZW5hYmxlJzoNCj4+
PiBkcml2ZXJzL3Zob3N0L3ZyaW5naC5jOjU1OTozMzogZXJyb3I6IGx2YWx1ZSByZXF1aXJlZCBh
cyB1bmFyeSAnJicgb3BlcmFuZA0KPiAgICAgICA1NTkgfCAgICAgICAgICAgICAgICAgaWYgKHB1
dHUxNih2cmgsICZ2cmluZ19hdmFpbF9ldmVudCgmdnJoLT52cmluZyksDQo+ICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiAgICAgZHJpdmVycy92aG9zdC92
cmluZ2guYzo1NjI6MzY6IGVycm9yOiBsdmFsdWUgcmVxdWlyZWQgYXMgdW5hcnkgJyYnIG9wZXJh
bmQNCj4gICAgICAgNTYyIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdnJp
bmdfYXZhaWxfZXZlbnQoJnZyaC0+dnJpbmcpKTsNCj4gICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeDQo+DQo+DQo+IHZpbSArNTU5IGRyaXZlcnMvdmhvc3Qv
dnJpbmdoLmMNCg0KDQpTb3JyeSBJIGRpZG4ndCBjb21waWxlIHRlc3Qgd2l0aCB2aG9zdCBzdXBw
b3J0Lg0KDQpJJ2xsIGNvbWUgdXAgd2l0aCBhIGZvbGxvdyB1cC4NCg==
