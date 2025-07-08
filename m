Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF372198A2F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Jul 2025 01:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751938223; cv=fail; b=VwKT4BkobopVsgzC8aqSZo+2kSKQYn4k/lapSrO6RReVpytg8NzTCZ8QtKphJDQ44/FrY2kgplT+Y721tlU6vxX+utoYTwoO/xpwecEW2WaeHuqNvxFdbZjZwA2mURAa5w1X+umg5nJQGTrzaAFuJC/WsvzALQF+BNHIzTceQts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751938223; c=relaxed/simple;
	bh=FGLmT679zlvhfKHNQivVQ9EJgtfMz2GaqXpeuz8BnSc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F3vfUZqJ4aQ8s1Tm31oGIBnB92j6ZJ0ie884C+/y3S4scGHvvB3q94FvzCwS1HBO58r5Pegyg0FQUUR95RKoXrXfPui7WkVH3y879KtRMHNyGp5QImXOQ+o/FbK6H3AeofSNBnQpELiI5SjmbxnO2U/hdeOesfkjbjfFpjb6Dig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c2qwJKz8; arc=fail smtp.client-ip=52.101.65.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c2qwJKz8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQJgBwO9O4TntbH1Aj8mcV31PzjqZ78WZv+3uPpICKSzEbEOi6JslqNBHLe7Sl/EnQJjmus+s2b4kAJZG5NNNVWfYze3cR1NzgZSuE8vzbMuohKHRr5gtSNN6erNiSGSkRgtlhBxlSHrrbWk5vQLmw9FReY6sB9FUNFL0NdlZvMZ3e/vvqKRhhUINp9nxoy+4Bi3d9mwyk9YsFWAOjc32TJ+gWDN3BwHgth575yCr/R4QX3xO73Mz5ep5HKEoBM9C26KHQBS7WVReY8vktQSCVlSh4ItZnVdSPI7MDfJjfVL11NwxQ/1tYHDJ4DFwT4beLqr6Bc0bYq2/1xmT0+72g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8W/luRR3QCta+d94r/MHvwb/xcvA0ztH17z6JfrQlCI=;
 b=Q9gmh8pKZrLL13aAmnC4VFbXY6Jg9VC+yjCQlSHkCJiwu+pghaC+RofOtE/ik5USFQ2KgpvXpZ75X4/Z7FBIepzKwjNqlNxwJCJDpw4B6kSOA3o++fHf5W3HcckW2AWrw/c9jw+gh8h7EwdHNKyfnBn3q9ssLCnnaTtBHze5gxKGPyG//bShEVTXce44xsNoA6KwRLVxWq3Ue8qLJ/R95UZ4wFrboO/DZbT00Q4F6kVAn++qczns+YjP/FfKT1jgGsZcYCrbudY0EZ31Kgvm6fOz6n6DP7gDNWB2QfCimjigPBNW7+89lZNvswM2aGky8/qmi1ibQnhFGpv8zoMa2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8W/luRR3QCta+d94r/MHvwb/xcvA0ztH17z6JfrQlCI=;
 b=c2qwJKz86Q1twd0B9/KzF6U8T1IxYfrYCiKMSXS4GwuwFLEiPXQvWxuRy3hOjbzFTvYfYwXmKcjBdiIgEGDlINmHD6gZU9+XsHXmZenaho9Ms3pXbolM8I0+Z634LsLkOT7IwmM+lTq2qOuyLZPjwXE+7vKm+LMEDYK2FnQFAnEIYDArq945A8RjBan5rPHQKuXqBOHIXxaauG+3IWjrClliGgoCZzcjuBEkwgSyW/En7Cytxa1aZukgQNfe0cr92S/7T0wujI423cLljRd0mM5evWly7WrU9qSMpI8ypcab1nRDCG0bWhHhxBeR3WmMIUpIhz5y7hw5DDKf6IYpDQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB4PR04MB11278.eurprd04.prod.outlook.com (2603:10a6:10:5e5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 01:30:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 01:30:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: kernel test robot <lkp@intel.com>, Sudeep Holla <sudeep.holla@arm.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Cristian
 Marussi <cristian.marussi@arm.com>
Subject: RE: [sudeep-holla:for-next/scmi/updates 5/6]
 drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend' undeclared
 here (not in a function)
Thread-Topic: [sudeep-holla:for-next/scmi/updates 5/6]
 drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend' undeclared
 here (not in a function)
Thread-Index: AQHb71TYaP52xMML7UeWyXx2Jmv53bQncDGA
Date: Tue, 8 Jul 2025 01:30:15 +0000
Message-ID:
 <PAXPR04MB845932CD9E1C87FA1A4F72BC884EA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <202507072359.Hfy79Adu-lkp@intel.com>
In-Reply-To: <202507072359.Hfy79Adu-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB4PR04MB11278:EE_
x-ms-office365-filtering-correlation-id: 327f9744-73c7-4e58-fe49-08ddbdbefdb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zGc4nuRuXmUmnTy+mOE0HcN/jhpsrFDIF9tLZbJDuvgzZFVeruVkzHo88Fvf?=
 =?us-ascii?Q?FCQdb5qNL6wL2fEorIwhgDMLtSVXJ/4S4TB0NDx3RwM0dIoxNxmpNLGgly/+?=
 =?us-ascii?Q?K0XD3l+VBcGpnb8pERyC3KbYG8v4wSRj/mXSzoiLkLlVFBiNUae1oiS6ly/c?=
 =?us-ascii?Q?6lcCFtnKd7lOURlPe0N/Mlbpb3mv8SfYrqvoG6Uwfx55fEpEcgGFWn2SdPvt?=
 =?us-ascii?Q?blqDz21VxgXm8LBEWcl3VmJE6KzuRIRTXm7XrFasGy/rFlvMXNgTAjLi4J0D?=
 =?us-ascii?Q?YJPBkY1jxbsAR3NpGbW9hLQxfGKJmvy5Q82mUUGVycw72TMjmg+qt244GbGb?=
 =?us-ascii?Q?3F4KJPJ8OWWfv939/eQuEb3Fn/7psvxH/O053uy3GAjIgPkJC/y21yqz8wLO?=
 =?us-ascii?Q?MQ6mxvcfEdPGG5NNpWHJ9qPE3LBsfzHyZkVRfBfmJ5LHlBQ12sc3B65hRBSF?=
 =?us-ascii?Q?ACJxyl++OpJ2+tRT/bCNibAX1SVgG0ysrJUhbx2mi+Oe9VnVV3pXCWczT+pe?=
 =?us-ascii?Q?EvZhiU32IGR3V5SJOpNbkpc92OvMjqeBCsws/DwIYyImgDJ1B7+gkGHm9ZAF?=
 =?us-ascii?Q?KE+lc9VFR7Ghmv+/yn8AfpKmZIabR6WGEc2OxghHuzG+KdKD9Z8/32h7C+i3?=
 =?us-ascii?Q?j+8Lcez7JYW/xN8iVtW2heqafj4DwVgUJi4eR5d93BrL0MpYkFNWkhfT6l7T?=
 =?us-ascii?Q?5z7ku7O2BTus+yUP6CUBOJuxowZC3IX9JvMpYdfUyXr3fTUpCA4ZIBNKXqE6?=
 =?us-ascii?Q?kO0zXRbw7XlBpaubhqdGUakxbWERZGcj9Jg+IDe8ZegAgBUSDSvVDsQcFnxL?=
 =?us-ascii?Q?/5b65astU9HBfGLTJdu9YGqImhG6etmpVtSwvLs+jFkPKJC0hqRVb3WPAS6/?=
 =?us-ascii?Q?RkfiTtfkNHcmTLeOXJBP4hp6BK5ZccOvMF0DFr1uSCQ0O5xz2z1K3Xr64w4e?=
 =?us-ascii?Q?lzOup8q1vtyjL6D4+E1Ye6FJFN6Utmmx8kAj2iCuYWA2OnlUm7Ebo4SYLDjA?=
 =?us-ascii?Q?WudxX1JCW4c0gpuJfLsrOgHZVv3BwmRWD9osRrKmh3vCefPipZL3HdJUSWuL?=
 =?us-ascii?Q?sxvpI2uOnqSKW7BvbkxmiYPpNxDbYXflXveHn2hkIot2S2CAOK2UM4oGJ0G6?=
 =?us-ascii?Q?H4YF6qaRXMf6QJKXJDe7Ftb4l/XsU2ApZMsWDHhtfV9+pqTS0egvTL2HQANf?=
 =?us-ascii?Q?8P59mmTe990dpkq4EEaxZxbCoXwCJZ0n4YYBRJR5rB6ebI+SVaDS0X6ITkI7?=
 =?us-ascii?Q?BGxuzAgjA8b3WzyVSpuZYLu0kZADa1MqXDFXUYrU1StS15aom3BjUKp6E6H2?=
 =?us-ascii?Q?KjJS0lx78h4jOIhbp2UF5quMzIDPzEVcmweIyNrSaq3Afy426o8Ov+NWzyJx?=
 =?us-ascii?Q?Z1wBHEsSBoB3E09mRYRn7QZpsJ/xLHr/yoODD2VkMA2Z4TBPiYus0NekBB1U?=
 =?us-ascii?Q?PewAl2JgiCYWG/MB/LA/ZnX9FpHwuFvnKQPw8EO/Z+WTnfk60c7DZfv8+cYP?=
 =?us-ascii?Q?GpU2krS0vtn6mwI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?a3CBKESOPn9ZRMSwrDV7AxyKlQO/LLzKCRlTdfZNrIdE39refkMBSDKfS26I?=
 =?us-ascii?Q?hyhnqMUCudC2ybu37VpDO4WNB2qWS5s50Kbm96udzNQD+DDkpRa8TGeW8Nzr?=
 =?us-ascii?Q?N6M8grHcE1YTXg+j9M47zz3RQvVrscvZQBTDXfDt5SZ6YToQaChVDor79cmO?=
 =?us-ascii?Q?IF2oa6jjqvXDu5gbOU21UVQniHTcJN7MrgX4mVsL/bZP4KbsCQ7wHBXaWqfn?=
 =?us-ascii?Q?tDYeldSpR+82+SH6bEhziGFdc+/XqmymGXbzvZoL9jVO3f0GsqRjt45VI0GL?=
 =?us-ascii?Q?ODQZRiP4eOsaSaPiUQxKcOriALoGKARPLLUSbyijeDCNKvYWAqLcXun/i/j/?=
 =?us-ascii?Q?fiMmMi6MRjB4cOuBGEWkJPhOijoXY7WA98lYOkaqfzP30ifz3CUY42DU3/QL?=
 =?us-ascii?Q?FTtjdswjzE3xCYhUToQNZa/OqysECM0BLef1G26EdFSZhKQCy/y3i/FxztN2?=
 =?us-ascii?Q?7KbRSSv21+X32ezdg30tSCTRSckFsifsTcjAbRqOWCJ6+7GvOQ4Ndd7UtU7+?=
 =?us-ascii?Q?ft6qC7ZHUrasf/+QwE5iJW/mW8pbZfcjhsk6DNyPVTrIh9gj9xPYrEAli7bq?=
 =?us-ascii?Q?ljEq9ZyIgEqn0gJXehNyhXUaLL3b61uaX5EW2i43O/INktVze6ENTyUnvXyb?=
 =?us-ascii?Q?hjRe+10WrH485G0l/ZFfTh6t3DH/GEWz6GgOarBshQ+5LWiZ30y3ZcESEaCL?=
 =?us-ascii?Q?qw5BUyUPFz7jtp5p7hUc3aHnQOlRjFEtov19NDpvHNIBch/yeM7ydCgJtQRl?=
 =?us-ascii?Q?VyR/zmK3nj8l4ZKVKS6tEmb9UO7Syhs7jdrZTOZE2woW7abf7oCOJVoKa7n6?=
 =?us-ascii?Q?ui1hWTxgnd1Htt9qMJPnVa0mazvm2jT5DgO8uFJclmS2ZPm7DCJDxx2BbLTs?=
 =?us-ascii?Q?gFPkkd+G93JRM/2DIKqmi8MCLiQHCzPxMuvlDpVHEQiUxpi1g1J2b8gUAeMh?=
 =?us-ascii?Q?fX/897HmSkTAurnEiXNXt1PFlP56Wb5dD1faspLxEGi1/oKE8O5bMnrr5gF2?=
 =?us-ascii?Q?hk6b86Fh5ACpgrhfcB/kdJNjkEDxqFHv1iGkQXlnuyxy517121tL+kjS35dx?=
 =?us-ascii?Q?GSmHS9a4rkcasNDnK+A3NTWi99a9xT2Gp7Gct9Ii+gMm8Kq3Cxfbtbj+GItD?=
 =?us-ascii?Q?NwQp/p8haLM3sLM1wfbMjfdiwSCb3bZZ2qjbmxKXVe0G/o43oTglPtW9WuEo?=
 =?us-ascii?Q?B7wtEeyfKInTbCE+Jt8NesORyOqlQKa8jmhCKn2ML+5QJ/5XY3T3nRYulKEP?=
 =?us-ascii?Q?IB2oFIFmQ5PJuL8Xqa8Lmnl21IGajDFoeoqsCga7FktlmNNu4R8N0fguV1IX?=
 =?us-ascii?Q?8ZbXvYJ0Qu6eDWfNdMEpbBBVEtJ+c7BwGPjS8faFYNZAgK6x1/vk1cuWd0g/?=
 =?us-ascii?Q?GyfhfM5bI4qlMAgVR0PhY8pNXhvswIPwzmCIdlP5nirvuYHbnSmau/Rl6pdB?=
 =?us-ascii?Q?K04hANzwsuU4o5jicuufFf1eJ78JVfhSt++0NJISoNfUICTXsQpIbZ7pJEww?=
 =?us-ascii?Q?qgWSmAK8gYSvr4n9KbLgFDgYHdrkJxiK8GiSGYn69NFGI2s4KMfscNS23XaD?=
 =?us-ascii?Q?zxY9ZZi5S+0CNHoVyZM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327f9744-73c7-4e58-fe49-08ddbdbefdb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 01:30:15.4145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhhkKLsrbA4VhN7DpWccWSILLGcbM23/vkziVVsefN2wmTKpsmbNwF2RroD63U2KhYgOxQzA/LURJy8nTKCKvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB11278

> drivers/firmware/arm_scmi/bus.c:349:33: error: 'scmi_pm_suspend'
> undeclared here (not in a function)

I downloaded toolchain from [1] and export CROSS_COMPILE=3Di386-linux-

But not able to reproduce this issue:
  CC      drivers/firmware/arm_scmi/bus.o
  CC      drivers/firmware/arm_scmi/driver.o
  CC      drivers/firmware/arm_scmi/notify.o
  CC      drivers/firmware/arm_scmi/quirks.o

Sudeep, Cristian,

Do you know what could be the issue here?

Thanks,
Peng

[1] https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/12.2.0/

