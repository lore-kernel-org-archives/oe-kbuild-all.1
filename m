Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A8416A956
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 19:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759002301; cv=fail; b=QspR2Azuw8wdaBwqMjeZtbJSQeVZD+skkrVjx1M1Acfir1/n5I3HjexMkEBGi1ImQrnde3z86dv2M4sY/Xc0JVAMkNsny+yE5aKaFDoX1oCTJ5HVgAukmS7T76Ov3s/Q2rSHTeuGlt+Fin9nsw9ri4WEPAY8XZJPcPmVvQNv9co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759002301; c=relaxed/simple;
	bh=8ZqU41TgoBnth77QTnJ6t7DDpNSXu3hdMuja7JwP4AU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YIvIn+4bqjrO03Hi39k1Jg4hxdUSRbKDypaMnY9244bW6zzUwDXjYKijt6HEPr7bh/vf+YNGf/4s1y9qqvyPY5ZLifLhdq/MaHyHRWAMIQBUabByV68zFc5xl7moG2RkbcG+7yXpQfH+ZFs/KvGdv4MYHEvraYyd3jWx2xeTlT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CdP4hMll; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CdP4hMll"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtEXzIIHuL3QBrlyKjWs/n5NdqsPxgg9qcr7G7OkHD8eOfxOOU5dZ0CR7yuzjO+adz4taMq3WKo3DA+Y7lQ6jTxTmLHH7/E+YbSFDnrUsMgJnvMJ2mQeQKAtKCBbE5ewYaquIOrlysyDxuOBSP1kILtyqDPDfsxHUYBEy5FFHHGmFJXL4x4s5JEUOMBWIC5ADegTn3ZcEsnl8OZef9uCqINaO/sGOhbVfhZr8cjzczlbhAJLR44WSQXU+ap3yA8yPfL0hwi5xQqCMomiTGxbAedXU8QYZlUoMsZoKZUHET1mVNftnPCc/OYSSMXdJg7AJngSEPFPu8QYM/JIAjoVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZqU41TgoBnth77QTnJ6t7DDpNSXu3hdMuja7JwP4AU=;
 b=qTTXtxvaymgcVtAlVMWo+FEJ1zgJb7C9gABv3dpNIjjggAXk8eEvzJ0tAJ3tJf6qRybB3hyl9mG/31lqWux2YQMyDbOkKCsUQ/DSWWw1qEea8cXzPPRDnyWfS2nYRAhR0SKSvoCEx1sV1D5RrsJxbuwnkgyjSsGfaTwdhh16al+bfYtXrQigijcqIj8qy7nTKANc6jQ5xvtlXcut15zdUoKCy4/2nmNHPNN5DEocBkaMaiKjQaj4RWSp0eEXxrWfgXkGrZm7CVcncOGdJWyn32Qs8zV2KPIxMCi+XhJVjhVwtnI89tQnaiejLEsL5d/Lke5y62Qo+5UZut3G+AT3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZqU41TgoBnth77QTnJ6t7DDpNSXu3hdMuja7JwP4AU=;
 b=CdP4hMlljKaPiJ4J1qgPod8tpZrlrOLL7zFzrjjwY3wg55xB0ro0gWJmzvbTyc502oV64fPP8JgrhnjzVr0+Tl0WBv2mkbOfhcgPB0wLGbArd629EeVS46YKBJO+Cm6ARMUnY/LTEwyFt/nNOPWfGXrX0YyzdxmGiw2piOi7IeM=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by TYWPR01MB11892.jpnprd01.prod.outlook.com (2603:1096:400:3fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sat, 27 Sep
 2025 19:44:54 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%4]) with mapi id 15.20.9160.013; Sat, 27 Sep 2025
 19:44:54 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, kernel test robot
	<lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: RE: [thermal:thermal/linux-next 23/24] make[6]: *** No rule to make
 target 'drivers/thermal/renesas/rzg3e_thermal.o', needed by
 'drivers/thermal/renesas/'.
Thread-Topic: [thermal:thermal/linux-next 23/24] make[6]: *** No rule to make
 target 'drivers/thermal/renesas/rzg3e_thermal.o', needed by
 'drivers/thermal/renesas/'.
Thread-Index: AQHcL7vPCMMtXXrTTEqra29KsjFnvbSnML/ggAATS4CAACmVQA==
Date: Sat, 27 Sep 2025 19:44:53 +0000
Message-ID:
 <OSCPR01MB14647BCDF0B9C474136E78515FF19A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <202509272225.sARVqv2G-lkp@intel.com>
 <OSCPR01MB14647236D33DECC1590DB26EBFF19A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
 <772c5800-23ae-42fc-b7aa-7b9eb3b9cc2a@linaro.org>
In-Reply-To: <772c5800-23ae-42fc-b7aa-7b9eb3b9cc2a@linaro.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|TYWPR01MB11892:EE_
x-ms-office365-filtering-correlation-id: 3f43c5cb-6f60-458e-bd5d-08ddfdfe54ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ti9CSEFrU2s2QXZ6VVRRK0wxd0w0VmZOYzdZcFV5L1JsTGZ6ODRwTmpFNVoz?=
 =?utf-8?B?amRzU0NCVFFUNSsyQllwNWdEQ2ZJRkc2RkkrWEN6QjdqZ1IwSGlTT0h1ZDVT?=
 =?utf-8?B?Mko1aXhhaGk5ck1tMXVZMmRUMFZidThHOUhEZjhsS2Rjc0ZkQXZBeUd5KzUr?=
 =?utf-8?B?dXFDTXlMMjJJZ2FtanRCbDBZQlRoT2hvZkVxZERJcVJNekphWG54Mm1sdWxj?=
 =?utf-8?B?K2RRdjMwbkVMZm4zYy9PSm1GL3djR0JLdVBRc3l3K1J0M3hGUWZVRUpCenFW?=
 =?utf-8?B?YWZDcUNIOGZZK1ovME12aENsZnJqcXFmczdZd09HQ09aVDBVVmlXMFRlQ0cw?=
 =?utf-8?B?Mzk2WXUvSTFzWEhvaWhTRDlXNnVkeVB2ZGgrOXRCWTZYeWFQTEk5OWNwaE91?=
 =?utf-8?B?UUJ4STRadmtWQ1lhTEVnVzB1V090UFNlK2RLZS9ramJzd1Y1RWV0ZTV2QVJI?=
 =?utf-8?B?MHFqc1hwN1I4ZHhHN1gxYW96dmdkNzZVNXg4S1ErczZ0SHFqb3NFWU8wNjJ0?=
 =?utf-8?B?U0VkSS9QVVczU244ajdxOGI5cFNrUExzR0psSDVRZ09YSFp6aXE0WE9ZQzBW?=
 =?utf-8?B?SUtDMDlKM0NrOTVPRFArZHNjMkUzWHAwT1o2eWNmL3VGN01SUFdKR2ExT2Ey?=
 =?utf-8?B?ejlldXJKRnNYU3VWcEl5eEdjczUxYUdBS1ErSVlsbTdUUlVTcWdOKzNHOTl5?=
 =?utf-8?B?VVNFQnUxbEhvRWZGUngrUUpXV3pMbkNtK2pnaGZZbDFaUnVTUUlXV21yOUUw?=
 =?utf-8?B?VCttRFFqSzJhZWZJYVk1UlBhNjBJUzlSMjRFY3hPdGtXdENKMDlaT2sxM0o3?=
 =?utf-8?B?dTZZQVBXQVRxaStCU0k5UEhaVlJlK1NYTExncXd5QlNNZlFEWkk5UjRtcXFP?=
 =?utf-8?B?V0E2bmJsOENDMEJlVTIxekphUmlkZUJveTlSVVBpYXdFMG1NSGl0Y2xQdGl3?=
 =?utf-8?B?ZE9qMWdsS0xoTHIza0xEb0RDbzloQWpMZHI2OXhtTmJ0dllrcU1CVGM2dnIv?=
 =?utf-8?B?Si9sYm5ZVjBTQmwxcjFFMC8vNkRqbERtYXlBWWR5OUk4cWY4MkNKZkJ6bERs?=
 =?utf-8?B?Ni9SM2JnYVlWa1FlZ2ZlSFlCaXJzS3VIZUxpaGtvQ3drbDMvVEV6eTRKTW9D?=
 =?utf-8?B?WkVJNGNWRFdCclg2dTRiTEZFWWcrWUlsYkF3T0dwMGdLNUx0dG5kQUlETk1l?=
 =?utf-8?B?dy9zcEx4RE9DOVQyOERqSFVWN3BCNlh3T2tQZ2c4d0lXOW9VTmhhUSsyUlYv?=
 =?utf-8?B?SW1UdXArRTVnZWY2ZjJFcVRuYTg3NUhrYVpJaE4wbUZNckkxam44OUUzL3dv?=
 =?utf-8?B?UDNWV25KcGJORS84YnJnaVBTSnJBTlgva0Z3N1FBeXp0MWZWSTVmSlVoamdw?=
 =?utf-8?B?NGhNSjVlMkFpMlNSN0NRTVdlZHVFVmEzZjc4Y0l3UWsvRkFLK2NqRkZBNWQ4?=
 =?utf-8?B?cTgxM1ArK214UUJaZmlMMWtpbWRCRkFya0lOV2F0OUR3Z2lTMEVQbE5OOW1H?=
 =?utf-8?B?cXQwdjR5WGtYanFON1o5QTk1Lzd5L081Zjd1UDJidGJwL3dXcmpqdlhXOFNH?=
 =?utf-8?B?ZFk5TTVBa2FjaGtvV2liMWxmbU9DQkMxbU9XMzlXVUJRUWsvQTEzVHFUYzZv?=
 =?utf-8?B?OVNiUVVEd2EwaERIRkIxTm93cUVEaVQyeGszK0xkaGZ0R1k2VWNZa2FUWk9Y?=
 =?utf-8?B?c3IveVVaMzhEaFBqSVlTOGdlWUlYNmcvMG9aN0hYdFFYcVZLWDZVYVg5cVJF?=
 =?utf-8?B?M0N6RW5sSTRsZXJyZmt6ZnpUaFhQKzhUQlhUOXRzaUR6Wm9HcXJmRHNaMWtG?=
 =?utf-8?B?eWRyWTh2VDd2K291b1BKRHBKV3MzeWQxMVJCNzFQby9OQ0trVmNEb1p6Vy81?=
 =?utf-8?B?RDBzb3RPZW9xV2Jjbm1KWWY1N1B2VFNIV3FMTlBnN3lxWXRPL3RmVVlmMk80?=
 =?utf-8?B?YkdTYzRPTzhlbGUyK3NIL1QzRXF6d0szY3U1Zmo0cVowYXRpZ0xzVG1pV3ZK?=
 =?utf-8?B?dkVoLzlqL09RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnRJVEZ6b3lhTTZkUzd6d01OQ3h3WlRLRW5SWEI5emZpcVFaeEs0cllCU25C?=
 =?utf-8?B?bEpuV3lvNG05L3pWVnRENjlPWFYxYmppRU8wS09lelFxRjdwaWNidVZuU3V5?=
 =?utf-8?B?N1VzQmI2ZVNvaHZad3doanFWanJKSFlGL0U3clM3MG5IT0h6RkFZZXlmQjJu?=
 =?utf-8?B?N1ZQaS9QTUwzbGhkcVd3emZyZysvZXRxZXdpNm1kQjNQZjQvSjhCS3NOUEcx?=
 =?utf-8?B?RXh4UWUrZmlqUFN5M3hxOVVXVnVlVHR4K1Vwci93UTM0V05nRWN4bk04UzNj?=
 =?utf-8?B?MndNeStheU01SUJQWWhlejZ4RDhLZXVsSm9kZmRqaFBNSUFEcTIvL09qc0Rv?=
 =?utf-8?B?UWtFaXRqWmpaU08yQmF5QWo5eUR0Y3BuZWp6YXhpbWM0Q1U3Q0dMcXZHaFM5?=
 =?utf-8?B?MWl6R285YWl5ZythdUdnM2cyWXVveWtCYmFsU00xV0lVc2pKTmRaenF4V1F2?=
 =?utf-8?B?d2JqVmY3QnFWOXFQQmhWM2g5MnJGcGIrQ3BhV0ZLRGhQNk9nWWp4ZUxhSC90?=
 =?utf-8?B?ZU1FME40Z1N1amVoV0cwME11MWNVRFVuUktUZU1vVHRLQWI0Y2t4Tm1pUWpz?=
 =?utf-8?B?QStOc0lJS2hrRFlOWGdCNmFvdWJ4UUlzcUVFV0lnQmE0c3JodVBwTm5oUW0z?=
 =?utf-8?B?N1VSNkNubTB2S2hzM2dPWUpwcHh2bThPMFR1Z1JkZXhRNkJnc2lpQ3VENk43?=
 =?utf-8?B?a0JEcjMxVTBUZHVJR01uR0w2di9vSkRLcmFQTzBWMVoyYlFKNjRCTTVZWmZG?=
 =?utf-8?B?Nk5qem0yRXNWa3lRSVh5c3NvT2xZRzJJWUVtTWhVRU9mZEhqd0JCRzB1L0ND?=
 =?utf-8?B?cUpBbER3ZlRGN3FjK3JOYitNdHVuY0FkbHlSaERaeDFvS3ZmbVlVTjhHdi9o?=
 =?utf-8?B?Q25BK0s2c1hVb2xSOUZLTDJpTmVaOSt3QmZ4V0tDU0dRMnFkZHZmaDdhb3Fh?=
 =?utf-8?B?Y1B2VTBVNTh5Nktvekpnc1AyUURwQmJENnhjSkZFVEJGaHFoWFRMT0tNblVn?=
 =?utf-8?B?em85ZEhDZFF1QjhuZ2x0T0ZyNDJaWXNnMWxYV09sNytIdCtVUXNIdTZJYlpJ?=
 =?utf-8?B?UlBPOVJCbVQ5YnllUW52QTdMMXBqd3ZFSDlRazZ6RXFJTzhkZnFsTFJxOVc0?=
 =?utf-8?B?RVI0bWE2ZEZRMDk1MUw4cTBQd2tCRHU0a0YrNmFvSDVGTWNUTFZMZ2VXWUhC?=
 =?utf-8?B?cTJpZTFJb01xMEJScFVEY2ZPMEIrT3ZFU1ZTdlBRVkVONGpVeUlmNUhoL21L?=
 =?utf-8?B?NmpDRmlzYnBadUVPVEhNQnpXaEg2ajc1UFRTcU1XWm1nSVJKTDNxOVZKYW5M?=
 =?utf-8?B?NnM5bEtUKzRRZUJXK09pUGpOTHRQbnVKcVhjUzIrQS92QkF4Yld3MkkzTzZl?=
 =?utf-8?B?NmRES082di9XYllNeWVLMTlWMUFlcGRUbXdmZkhjZGFMSVFDTk5KUTlKdG1I?=
 =?utf-8?B?UzNrMHJlNUpFb2VtRGd3VjhlMmZuN2RZbGNKcDdOZVJrbGQvVVRTUTlBM0VR?=
 =?utf-8?B?QVVzVWxPU2tlQkdSclcvOTFUV01kSVY0VnphbEV0Q3U0U2IzaCtWYkdxcGFT?=
 =?utf-8?B?bmF3RmtXZDVGemJCY2JHR3RLTGk3cGk2U2JYbjV1VFpFUUVkSmt2cmZTOWhz?=
 =?utf-8?B?bmFGcjJEc2VLMDM4b3JFQWZZb1JEdFlKeUJQdEI1by9lTjhlTWdjSk9zNTJl?=
 =?utf-8?B?VFJ4OEtYNmlic0JuZlhtRklFMTZ1aEZDYUV6eXhyYjI4aUJ2Q1dyZzVLeFpC?=
 =?utf-8?B?TGFodUxoWlFYMDFGRDk3YUw5RzhkZitocDNxTnhBWjh4bFZqeFRjK2RMSThV?=
 =?utf-8?B?MXNYblFXZXdBR0NMVVFMbnZNanJhSFliN3gzcEMxRiszV1dmK2hKdmJrZ2lU?=
 =?utf-8?B?eURJdm05K2QxR0krSC82amF0Ulp5WWZPa3F0VS80V2xaZGZUR0NlOTVQcVRv?=
 =?utf-8?B?OEtaTlJ4bUNFWkFYQkZyWFpZK0pkbGIxcnZvRDcydlJaREZVWWlLZGJ2NTlS?=
 =?utf-8?B?L2RsNzJFekNheHZKY0dSeEJNcTRVV2VXcVZVNHdtWlRubmowVGpmbkM2Snc4?=
 =?utf-8?B?NjQ2VDlwa2Q4cDZCZ0Z6UUowejB4ZVY1c29RK1U0WkVKRVpISlptQVkyTmFR?=
 =?utf-8?B?c2o2RlN5eThBaUprZFBGVTh6QWFDNVpFQ21qTmx5eHBOa3JBQVVHQ0habTFr?=
 =?utf-8?B?Z3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14647.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f43c5cb-6f60-458e-bd5d-08ddfdfe54ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2025 19:44:54.0199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6b1KAPdIUV2AN4bJ2rb189TOb8CetXtagvUhctD431PFI2IseaYxbC7jY9Am7lvEH64MYIYRv9ltDvhjo5bq/NynkR9EghNp6kz4h0Zsf0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11892

SGkgRGFuaWVsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERhbmll
bCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwg
U2VwdGVtYmVyIDI3LCAyMDI1IDc6MTEgUE0NCj4gVG86IEpvaG4gTWFkaWV1IDxqb2huLm1hZGll
dS54YUBicC5yZW5lc2FzLmNvbT47IGtlcm5lbCB0ZXN0IHJvYm90DQo+IDxsa3BAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW3RoZXJtYWw6dGhlcm1hbC9saW51eC1uZXh0IDIzLzI0XSBtYWtl
WzZdOiAqKiogTm8gcnVsZSB0bw0KPiBtYWtlIHRhcmdldCAnZHJpdmVycy90aGVybWFsL3JlbmVz
YXMvcnpnM2VfdGhlcm1hbC5vJywgbmVlZGVkIGJ5DQo+ICdkcml2ZXJzL3RoZXJtYWwvcmVuZXNh
cy8nLg0KPiANCj4gT24gMjcvMDkvMjAyNSAxODoxMSwgSm9obiBNYWRpZXUgd3JvdGU6DQo+ID4g
SGkgUm9ib3QsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBub3RpZmljYXRpb24uDQo+IA0KPiBb
IC4uLiBdDQo+IA0KPiA+DQo+ID4gSXQgbG9va3MgbGlrZSB3aGlsZSBhcHBseWluZyB0aGUgcGF0
Y2ggWzFdIGluIHRoZXJtYWwgdHJlZSwgbWFpbnRhaW5lcg0KPiA+IHByb2JhYmx5IG1pc3NlZCBh
ZGRpbmcgdGhlIC5jIGZpbGUsIHdoaWxlIG9yaWdpbmFsIHN1Ym1pc3Npb24gWzJdDQo+ID4gaW5j
bHVkZXMgaXQuDQo+ID4NCj4gPiBEYW5pZWwsIG1heSBiZSBjYW4geW91IGRvdWJsZSBjaGVjayBw
bGVhc2UgPw0KPiA+IE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmcgPw0KPiANCj4gWWVzLCB0aGF0
IGlzIHJlc3VsdGluZyBmcm9tIHRoZSBjb25mbGljdCBJIHJlc29sdmVkLCB0aGUgLmMgZmlsZSB3
YXMgbm90DQo+IGFkZGVkIGFuZCBzdGF5ZWQgbG9jYWxseSBpbiBteSB0cmVlLg0KPiANCj4gSSds
bCBmaXggaXQgYnkgc2VuZGluZyBhIG5ldyBQUiB3aXRoIGEgdGFnICMyIGxhdGVyIHRvZGF5Lg0K
PiANCj4gVGhhbmtzDQo+IA0KDQpUaGFua3MgZm9yIHRoYXQuDQoNClJlZ2FyZHMsDQpKb2huLg0K
DQo+IA0KPiAtLQ0KPiA8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzDQo+IA0KPiBGb2xsb3cgTGluYXJvOiAgPGh0
dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfA0KPiA8aHR0cDov
L3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8IDxodHRwOi8vd3d3LmxpbmFyby5v
cmcvbGluYXJvLQ0KPiBibG9nLz4gQmxvZw0K
