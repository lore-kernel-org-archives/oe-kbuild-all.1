Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C27633E7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 04:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739767668; cv=fail; b=kASrrBzUXnlCiAPBG8C7CnoA+zwz9s8GrY89zW1qmxdeHYvgbFtspX3+NyuyHCbEtgHeyX1xrY04NrAKjbe5Zbgjw9B+/Z1sVsqs+TPz+ajXCwoHTy4jsq9xCPOSO8ibkS7S2UA1Gvok9e/eflpDWCaFeiF0jHWlbERhpMRyNOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739767668; c=relaxed/simple;
	bh=hqOwjdIrFbLZ9y7omqMEnmjQnjr3PKffUzzg8rRxmM0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=THI+WwBUJH2tKX9kgkgCEpLM1I0mYrzqfdlq2n9TznhiBbP00b/2oow8p2FNSVF4tXLuFOREqi/nJLkSoo9HhID4et2KL6tEj1nHwqVEMQULw+NWkg1iogy0/MOXOOc/tZku8uITJ0VF4qp7W3z9eI99MCgUX4N44x1rs/fFQe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=DbqgH0Zi; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="DbqgH0Zi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCb2vDYzKJbZx+nPvmUzRYlzkvcWr+MuvBhMZxvhVAdqZEuRjR2zxc56yy/jICkXwZ+1zOr4P6ACd2kZ7grh32ygniyjO705g79y08n0Gx19fK6XhxqzSYflT2LUCmnr8or4LWctzbbpyghkpSiBBa1129BPPCyVhqjmpCxvB4FZf0p5b5VjPsJITSHCVLkrLAzLZ4bJaoZB9riBj8LsrvQ7jUNMoeHTIOh04IPAwPYje8m5lujYEajUMh9lADHYku6GvWoAWExxXcJ5ByoykqTtvQ8vkxG2heKCCl4YcdiIDaSUTTZOw6YH76H3XQwGXThya+qfP8npp+zNO8vqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqOwjdIrFbLZ9y7omqMEnmjQnjr3PKffUzzg8rRxmM0=;
 b=vFxPyYEuOoHMEUXmTkWb1JwdzMxbz8PSVfm8azK04Kg5Jge1rstIx2CLacuFzKvPnex3tPMaEIhlpVdJRqC8+p2XY3A550kjIHLCF8/bovZs3Un8E9ezu2TVaImQOyuiX/CNA5rE3oFKGhbJb3LAPkvGuxhNQvMYXdAeY64zWoFJKZonvuHQygsLcIM5p5EELWeaoh5Nr2731Etjh1b1oEoNLY7ua6wsO1PF5JwfeAzjpx7tl5yp4yvLVDdNG1SdTBxTTR8cb6mrIgqLIlenOeHUkAJxqqsDXBzzNN/X71M+0L6B4LLEUP+Qo3uK7MCw5IHWtjgVSgDiJZZ31lV+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqOwjdIrFbLZ9y7omqMEnmjQnjr3PKffUzzg8rRxmM0=;
 b=DbqgH0ZiBjuRiVH19Ol+/5tPNBTemoR48Hsll5v9tKwlDz7tkboyzwaMJcAKggR0/XIE+NdFSJQU5ZyvZYnIGXiqHyP26iW1PPfgflhLh/cTXe5rWMw0c40gtugenQEDZGzuV9es56icxWT3SCtUF8SJvOykYkDdRGWPyvkLTKaNHNf8klJqhOB/5ayJcYAteQn3nI8wDZ/yoEPLYYQle02OVDyxdh6jDYQGLIW0pgZHJA7CtZEKFi2MCjwVqX+jAoYTR5fq832PyL8S49HSOUGDK9Zq7NFrloj/uP16ycYI6QBlufnbLR+TUlwnDqACcf788JuYD2vsUjlHU7/ujg==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN3PR01MB7015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 04:47:41 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%6]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 04:47:41 +0000
From: Aditya Garg <gargaditya08@live.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Jiri
 Kosina <jikos@kernel.org>
Subject: Re: [linux-next:master 1810/4011] drivers/hid/hid-appletb-kbd.c:405
 appletb_kbd_probe() warn: inconsistent indenting
Thread-Topic: [linux-next:master 1810/4011] drivers/hid/hid-appletb-kbd.c:405
 appletb_kbd_probe() warn: inconsistent indenting
Thread-Index: AQHbf6p5k9yFTQA1F0CdI0gOQ/kKYrNIs7SAgAI7D4A=
Date: Mon, 17 Feb 2025 04:47:41 +0000
Message-ID: <44A53810-6914-4124-8F44-AE84979BB8DF@live.com>
References: <202502152006.fBBCdEr3-lkp@intel.com>
 <95066B70-F91B-4A93-B016-DFDD13F4A61D@live.com>
In-Reply-To: <95066B70-F91B-4A93-B016-DFDD13F4A61D@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN3PR01MB7015:EE_
x-ms-office365-filtering-correlation-id: 7b1e819b-4115-404c-d95f-08dd4f0e3637
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|7092599003|8060799006|461199028|15080799006|4302099013|440099028|3412199025|10035399004|41001999003|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?cCtCYUtJdXB2ekZNTTU4c3hBc08xNWkxOUFUWHlCd1QxdkRjNnJnVVoyVXBq?=
 =?utf-8?B?bmVadEhuQkExNE5PM3hDSGQ3TUJYZVNTWGtwY2xCSElrb05yRTVSczBTSFRj?=
 =?utf-8?B?L3Vrd0VyUjdBVkkrbGZPbzUzNHlNMENkQmFpd3p4NnZnaTR2WGZRRUsrTkZ6?=
 =?utf-8?B?ZEN5M3JrYnZuaHVLZmxUcW9CcklJbENyeUFkM0xzdnk1NWYvNVBIa2plMklY?=
 =?utf-8?B?MW11QUZhVkdPT0pQWm8yQzdJZjlJamlUeFJoeWRXaUV6bGdxTWRqSnM4RWZT?=
 =?utf-8?B?OStYSHBVRFVsTTltaXJLa3BsbGdYN0VCUGJWWDd6VkhVUUQyZW0rWFpoL1NN?=
 =?utf-8?B?WndqRnczRnZodEprbzR3YVM4YytUU0diZ0pzT2dxTXlTK2gweklXMGFBbzY1?=
 =?utf-8?B?MzkvdUNXVWZvYjYyRFhqcElMQjVUSjllclRDVDhiUWt2dHhUVWlYdFA3YUh3?=
 =?utf-8?B?TWRzZFc2elpMaGVuSTNRb0dIT0NJY2ZZUFRBL3UvZmxTMDBYZG9rMXRhU2Rk?=
 =?utf-8?B?U1A1SkpKdHVsWEFBdHo0a3ppamtKZ3R0MHJlY1ZPR3F6d0E1MWdXUFFuRERx?=
 =?utf-8?B?dHoyNFFhQUk1TEtqcit5Y0JMYVRCekdzWWw1TEt4WkIzK0MzVHpDSDB0OTFV?=
 =?utf-8?B?aTJ3VktBUTVsM1BYcGVaUzF4YWpoSVRudkRTWmk2dTdRYm8vUmVLOHRnK1R0?=
 =?utf-8?B?dHN3MGFXU2Y0d09wTXhtZ1NIVEwwTmIzRE1PNzJHVWZheWRmdXBXTlpqMTZu?=
 =?utf-8?B?YUdpZGhVR21uMUM4SXR3Z1dhWUtuQnhMQmVuQXVKL1JodU5xanB5c0JaNzA4?=
 =?utf-8?B?SThNUVVaM1czQklHRjlEUkNIclFrbFBEK2ZWbzV0dkFudm1HZG9JbXVNdklr?=
 =?utf-8?B?S3BQa1h5K0UrY0JQUkdXQkFRQk9hSm1VZll3amhCdy9iSmZTSVVQemk3NVhM?=
 =?utf-8?B?YUhKS0d2TjZnME5Sdm5Yc3pCN29NOU9LRjhrWjdtU3ErWXBybGhOUEpsdW9n?=
 =?utf-8?B?SENGQVRzWFFZcisvTjFXMkcyWW5OUnlGdGxySTNJSDFCRmtubG9aWTVqenMw?=
 =?utf-8?B?UmVRd0tEWGc0NFBxUWkrakdyVWpqMHlDdy9XdTA4ZitybjJndE5tQzM3Y1JQ?=
 =?utf-8?B?Ulk4VE9mWEQvcWcwV2pDcEJVaHNXT25SdW1ZRjAzbWxXM1UzZkZ0NXozeWlj?=
 =?utf-8?B?Ykh3eTJDeG1nVThxSktmU1ZaYlUzOWg1WWsrV1pnYXd4SXVEekNLK3BxcHBC?=
 =?utf-8?B?Q1dDWUE2WkZxMjRtcndZeTJ0R2JoY0dhOWRMa3FOdHlBNGE3UTliN2Nza1FF?=
 =?utf-8?B?YjQycTFtR2RjeWoram1PKzVPQWtyYXhuc1FUdkpXb3hLTHZuUWtXbXVlOGFN?=
 =?utf-8?B?NW1FbkUraDRDR2VGemh5ZmY1WHZES0xnbTNSOW5Jb0Z4ejkyN1g5UkRPa2dj?=
 =?utf-8?B?YkkyR2FwN3ZJczlvNEU5M0Y5dFdvaytXcTh3VEhBYnRCbmpOWFA1N1BubzVs?=
 =?utf-8?B?cW5LOEZIU05wWVhwN2xvSC9odElVd1Avc2xud0ZlamtTN1cybE5tN3lHcThM?=
 =?utf-8?B?a1hSZ1N1MnhXWlhXYmx3NHpaeDYwZ0c0QVE2LzU2eTNRWEtqRlNlRGlORkpI?=
 =?utf-8?Q?oRmZ3fgretgDrFC5hZpqYhnMJDMIZnNuMihcDae+HSLY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZkJqaFpyeXNPWENlemJyN3R5SzJzRHQwb0xjTzFXMTY4Ni9GdVRXWWZPbFNJ?=
 =?utf-8?B?MUlyODlrMGpISW5FQmVKUnVwbU9HNDB1TzIySzZmbGl5RUdacDZRYk1teE5x?=
 =?utf-8?B?VHpyc2Z4dFY5b0lKQ0ZOQTIvODVoRzRlQjVKTkFxVTFmUlREbkRkY2VrM0Fi?=
 =?utf-8?B?Ykk1ZFAwNEFVUFhXMWlxa2tOYndLMVZPVUhwZk9ZajNrQmdrd25UejdGc0dU?=
 =?utf-8?B?ME5PNEhhZk1zWDNBWjEvYitMaTl5Wk44YzlJa283SlJNRTRrVVJvTzZzbllR?=
 =?utf-8?B?VThCcXMzMGpJZWcvUytsbW51MWF0UUQxZ0hvYUN4UlVLNXZ6YWRQbE42d2w4?=
 =?utf-8?B?cUo2cEU3WWpDMGRyVXFKMEFTK1JMSnRwT3JsN1Z5c3cyeVAwaDNDek56dGlO?=
 =?utf-8?B?ZnhocHlHUDAzK1cwRi8zNUNIYkdkN0w5VjBFSWxDMlo5eG9pb000SUp3ZHdm?=
 =?utf-8?B?WloxenZDdUFtRXYrQzVONEU2bGNJVWUzNzV6RXg5SzQvVk5aR0hQbHZ2eWRv?=
 =?utf-8?B?Rkd1cjNKSkNlcFFZV1cvVzNBc0syRVBHanhLNnlkSGJmb05sK1RKZzVOQm1y?=
 =?utf-8?B?SXFnREF5K3pBUWtncjFSZkdVZ2Y2UEorUEpBY2FVeUdISXp6cE1SSXJOQnJH?=
 =?utf-8?B?UVRUUFNTTXRZTEZ0dzViM3R0SkI0OFZEWUVHMThqbmpXL2s2V284S0FWWTdQ?=
 =?utf-8?B?T0RoTTVSSksyZThkaVNFVFRXZmUxcm02Rmxndk5vbjhKQjVZMFJqOXpYQndu?=
 =?utf-8?B?V0NGT2dGb0RhSGNBb0MwMDA5bkxtWmVGa1hqSDVmb1kvVG1tQ1VXb2Q0ZkM1?=
 =?utf-8?B?RGMrZG1tMEpaSCs3WWczdzBPa3pHQ2cxYUdmYW5jU1JpV2paRkFCYTJlTWFn?=
 =?utf-8?B?V1NBdlJRUHBteVBRQjhVdGc4VktaUVlNL2hVWTlGNEp4Z2swOEgwZExMdGpT?=
 =?utf-8?B?OUorQ1hPQUU5WlpUMzdUcFZMNkZTNVU1SG5tNWdUV1E3ZWMvbHFuV2hzemhh?=
 =?utf-8?B?Rjc4ZzFaQ2E2OFFMUUhEQzlyUEJYZk1ScWVob3NIaitjQ2lvZUlWc1Vac2R6?=
 =?utf-8?B?ZWVIckx0WDhvREx3ZTd4S2JaNklEUllqcXhFZ1dxaDhJMGl0b3cvZUJ3Um8r?=
 =?utf-8?B?b1lISVZYUGNkRGs4UjQ5enB4Zm9jazRqVmd6UEM3REl1YVRFakE4eWZPVGEz?=
 =?utf-8?B?QktJK21WWUZYYThBeEwzdzA5UjdMRWthVW1HTjFjWFdNcFB1RCtWbjR3VkFz?=
 =?utf-8?B?czRWc2VTWVRyTURmVHBseE93Wm9uTS9tdGY0UituNjBIVmNvSjRtalZaQXQx?=
 =?utf-8?B?RE9KdTVpRGJRZ1pRdkxsU29MZEtlNVlCcnNrekVGRTFVQlpPa1NiL2VlcGlk?=
 =?utf-8?B?VlZmRlNSZHIzdEY3UHJsZVpXWGtrQ2xRM0pSMFY5MEZERDA3eG1YMm0wcE1v?=
 =?utf-8?B?eDZyZWJ3SXZWSFFHOFRWVDJsTm9xUlNIc3pSSW1jaTAyVTF4V3Uyckswb2Zo?=
 =?utf-8?B?MDZrNGYySWJ5a0tXYUg4Sm5qcVdKcHcxSmF6VTFkaGp0OXJ2WWVlOVdWeFI4?=
 =?utf-8?B?L3Q0NDJOU2VTWE5KUXFSdmllMm1nRmZpY3lzeHBMVm9DdjhaclM0MHdXNXl2?=
 =?utf-8?B?Tm9wbnJ4QUphcGxiYmNjc3haSmI4MmFMK29Yb1FzdXMvK1dWSFRaZlhaeHhH?=
 =?utf-8?B?TVJnVmZya3U1NXhNb2JuWm9kWjJ0aTBmc3gvemU1MHd2eDFqbkd6OFJXK1A5?=
 =?utf-8?Q?DCyZmc8pQVdyU6tC3pey3sUCNfYxyhetMh3JjjN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0911F5EDA13564F84E0E50E1742AF0A@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1e819b-4115-404c-d95f-08dd4f0e3637
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 04:47:41.3359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7015

QSByZXZpc2VkIHZlcnNpb24gc2VudCBoZXJlOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1pbnB1dC84MzY1QzFCMy0zQTM4LTRGNkUtOTU1Qi1ENkJCQUJBNkIwMEFAbGl2ZS5jb20v
DQoNCj4gT24gMTYgRmViIDIwMjUsIGF0IDEyOjEz4oCvQU0sIEFkaXR5YSBHYXJnIDxnYXJnYWRp
dHlhMDhAbGl2ZS5jb20+IHdyb3RlOg0KPiANCj4gRml4ZXMgc2VudCBoZXJlOg0KPiANCj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW5wdXQvMjFGOEJEOTYtN0UyMC00NjNBLUE5OTct
NEZCQ0YwOTM0RDg3QGxpdmUuY29tL1QvI3UNCj4gDQo+PiBzbWF0Y2ggd2FybmluZ3M6DQo+PiBk
cml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQuYzo0MDUgYXBwbGV0Yl9rYmRfcHJvYmUoKSB3YXJu
OiBpbmNvbnNpc3RlbnQgaW5kZW50aW5nDQo+PiBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQu
Yzo0MDYgYXBwbGV0Yl9rYmRfcHJvYmUoKSB3YXJuOiBwYXNzaW5nIHplcm8gdG8gJ2Rldl9lcnJf
cHJvYmUnDQo+PiANCj4+IHZpbSArNDA1IGRyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWtiZC5jDQo+
PiANCj4+ICAzNzEgDQo+PiAgMzcyIHN0YXRpYyBpbnQgYXBwbGV0Yl9rYmRfcHJvYmUoc3RydWN0
IGhpZF9kZXZpY2UgKmhkZXYsIGNvbnN0IHN0cnVjdCBoaWRfZGV2aWNlX2lkICppZCkNCj4+ICAz
NzMgew0KPj4gIDM3NCBzdHJ1Y3QgYXBwbGV0Yl9rYmQgKmtiZDsNCj4+ICAzNzUgc3RydWN0IGRl
dmljZSAqZGV2ID0gJmhkZXYtPmRldjsNCj4+ICAzNzYgc3RydWN0IGhpZF9maWVsZCAqbW9kZV9m
aWVsZDsNCj4+ICAzNzcgaW50IHJldDsNCj4+ICAzNzggDQo+PiAgMzc5IHJldCA9IGhpZF9wYXJz
ZShoZGV2KTsNCj4+ICAzODAgaWYgKHJldCkNCj4+ICAzODEgcmV0dXJuIGRldl9lcnJfcHJvYmUo
ZGV2LCByZXQsICJISUQgcGFyc2UgZmFpbGVkXG4iKTsNCj4+ICAzODIgDQo+PiAgMzgzIG1vZGVf
ZmllbGQgPSBoaWRfZmluZF9maWVsZChoZGV2LCBISURfT1VUUFVUX1JFUE9SVCwNCj4+ICAzODQg
ICAgSElEX0dEX0tFWUJPQVJELCBISURfVVNBR0VfTU9ERSk7DQo+PiAgMzg1IGlmICghbW9kZV9m
aWVsZCkNCj4+ICAzODYgcmV0dXJuIC1FTk9ERVY7DQo+PiAgMzg3IA0KPj4gIDM4OCBrYmQgPSBk
ZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmtiZCksIEdGUF9LRVJORUwpOw0KPj4gIDM4OSBpZiAo
IWtiZCkNCj4+ICAzOTAgcmV0dXJuIC1FTk9NRU07DQo+PiAgMzkxIA0KPj4gIDM5MiBrYmQtPm1v
ZGVfZmllbGQgPSBtb2RlX2ZpZWxkOw0KPj4gIDM5MyANCj4+ICAzOTQgcmV0ID0gaGlkX2h3X3N0
YXJ0KGhkZXYsIEhJRF9DT05ORUNUX0hJRElOUFVUKTsNCj4+ICAzOTUgaWYgKHJldCkNCj4+ICAz
OTYgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJISUQgaHcgc3RhcnQgZmFpbGVkXG4i
KTsNCj4+ICAzOTcgDQo+PiAgMzk4IHJldCA9IGhpZF9od19vcGVuKGhkZXYpOw0KPj4gIDM5OSBp
ZiAocmV0KSB7DQo+PiAgNDAwIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJISUQgaHcgb3BlbiBm
YWlsZWRcbiIpOw0KPj4gIDQwMSBnb3RvIHN0b3BfaHc7DQo+PiAgNDAyIH0NCj4+ICA0MDMgDQo+
PiAgNDA0IGtiZC0+YmFja2xpZ2h0X2RldiA9IGJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5X25hbWUo
ImFwcGxldGJfYmFja2xpZ2h0Iik7DQo+Pj4gNDA1IGlmICgha2JkLT5iYWNrbGlnaHRfZGV2KQ0K
Pj4+IDQwNiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiRmFpbGVkIHRvIGdldCBiYWNrbGlnaHQg
ZGV2aWNlXG4iKTsNCj4+ICA0MDcgZWxzZSB7DQo+PiAgNDA4IGJhY2tsaWdodF9kZXZpY2Vfc2V0
X2JyaWdodG5lc3Moa2JkLT5iYWNrbGlnaHRfZGV2LCAyKTsNCj4+ICA0MDkgdGltZXJfc2V0dXAo
JmtiZC0+aW5hY3Rpdml0eV90aW1lciwgYXBwbGV0Yl9pbmFjdGl2aXR5X3RpbWVyLCAwKTsNCj4+
ICA0MTAgbW9kX3RpbWVyKCZrYmQtPmluYWN0aXZpdHlfdGltZXIsIGppZmZpZXMgKyBtc2Vjc190
b19qaWZmaWVzKGFwcGxldGJfdGJfZGltX3RpbWVvdXQgKiAxMDAwKSk7DQo+PiAgNDExIH0NCj4+
ICA0MTIgDQo+PiAgNDEzIGtiZC0+aW5wX2hhbmRsZXIuZXZlbnQgPSBhcHBsZXRiX2tiZF9pbnBf
ZXZlbnQ7DQo+PiAgNDE0IGtiZC0+aW5wX2hhbmRsZXIuY29ubmVjdCA9IGFwcGxldGJfa2JkX2lu
cF9jb25uZWN0Ow0KPj4gIDQxNSBrYmQtPmlucF9oYW5kbGVyLmRpc2Nvbm5lY3QgPSBhcHBsZXRi
X2tiZF9pbnBfZGlzY29ubmVjdDsNCj4+ICA0MTYga2JkLT5pbnBfaGFuZGxlci5uYW1lID0gImFw
cGxldGIiOw0KPj4gIDQxNyBrYmQtPmlucF9oYW5kbGVyLmlkX3RhYmxlID0gYXBwbGV0Yl9rYmRf
aW5wdXRfZGV2aWNlczsNCj4+ICA0MTgga2JkLT5pbnBfaGFuZGxlci5tYXRjaCA9IGFwcGxldGJf
a2JkX21hdGNoX2ludGVybmFsX2RldmljZTsNCj4+ICA0MTkga2JkLT5pbnBfaGFuZGxlci5wcml2
YXRlID0ga2JkOw0KPj4gIDQyMCANCj4+ICA0MjEgcmV0ID0gaW5wdXRfcmVnaXN0ZXJfaGFuZGxl
cigma2JkLT5pbnBfaGFuZGxlcik7DQo+PiAgNDIyIGlmIChyZXQpIHsNCj4+ICA0MjMgZGV2X2Vy
cl9wcm9iZShkZXYsIHJldCwgIlVuYWJsZSB0byByZWdpc3RlciBrZXlib2FyZCBoYW5kbGVyXG4i
KTsNCj4+ICA0MjQgZ290byBjbG9zZV9odzsNCj4+ICA0MjUgfQ0KPj4gIDQyNiANCj4+ICA0Mjcg
cmV0ID0gYXBwbGV0Yl9rYmRfc2V0X21vZGUoa2JkLCBhcHBsZXRiX3RiX2RlZl9tb2RlKTsNCj4+
ICA0MjggaWYgKHJldCkgew0KPj4gIDQyOSBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiRmFpbGVk
IHRvIHNldCB0b3VjaGJhciBtb2RlXG4iKTsNCj4+ICA0MzAgZ290byBjbG9zZV9odzsNCj4+ICA0
MzEgfQ0KPj4gIDQzMiANCj4+ICA0MzMgaGlkX3NldF9kcnZkYXRhKGhkZXYsIGtiZCk7DQo+PiAg
NDM0IA0KPj4gIDQzNSByZXR1cm4gMDsNCj4+ICA0MzYgDQo+PiAgNDM3IGNsb3NlX2h3Og0KPj4g
IDQzOCBoaWRfaHdfY2xvc2UoaGRldik7DQo+PiAgNDM5IHN0b3BfaHc6DQo+PiAgNDQwIGhpZF9o
d19zdG9wKGhkZXYpOw0KPj4gIDQ0MSByZXR1cm4gcmV0Ow0KPj4gIDQ0MiB9DQo+PiAgNDQzIA0K
Pj4gDQo+PiAtLSANCj4+IDAtREFZIENJIEtlcm5lbCBUZXN0IFNlcnZpY2UNCj4+IGh0dHBzOi8v
Z2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQ0KPiANCg0K
