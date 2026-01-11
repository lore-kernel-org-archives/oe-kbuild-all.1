Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6FB2147F9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 10:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126171; cv=fail; b=fFmf23eCyTMCrNDMlwC5NoB9YBEm6FT0FCzj0cwqTsgl0FfXKgCzPoTueS74+YGU10OPQ9bs0v7gYSvOb1o+yWTDd54uOeFKhU6eHxHFL6YK0Ka2sZkPrSjkBNSKQlTCrUReBmHD0rMEARuTb/SWAsV2eyOdhSvHR3J3IziFCX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126171; c=relaxed/simple;
	bh=qSV3MeQ3HCoOoJRzklw65C7OJ+dUnIM7qeVhL4wIeLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b4fBp+ySMAe8kyX54tJuXU1y5v4Fcya00lEb2GYvNj59LQYnjWBECqy0B0hCyNxUPHk46R5A0WmLG9QalOyZWgOXMm7CDVmkXQfQG6MAYrMVXDRnvnDqAazzgGauwm2ROh/pEnLHtBCWuhGSN2LhZ7/QNxkFDa4TVhPeQpZgzqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=P6y/78D0; arc=fail smtp.client-ip=52.101.69.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="P6y/78D0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMcQRat8TursZbFBLMQ9UnR2LwinzFPXFMT4RIJkXW3XaPzk+QjYqZ+KIDs9o0tI2+UVedu0P8XJj7+L2St+uRMD2KgNShUdyUXyJ2I6a5fLjnd7Qitw8s/baJC6vfDJKjKcmgltaTBaUs4ICDoX99yn/QWGNWe9lh6UsOgfmR9lYrCK0tvSl2lVvZ8W8flY4ZhTHN4mxI16c/PE9uSVe+rLPMdsoX7I98bLZU6vXqcqN/q6qieT+m8Nona93MkblzyDk6poRxV5F8dD6tTIR63II+xBbH6M9KIrS38Sm37YJptGfhEcT2iGdzbhjIyjyC6SOVs9k24tigDBBFgc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3G1/wnbDfWd8cuamm79x4lwBvSNz0aN0O5y1B6O2TvE=;
 b=J0P6KQfWHIlHTeFHJRiwzddQ3ymcImbyAIw29NIbN6DS+TAlZrQAi9fcyEeyyj9hLvrx6N80lnFAhVlpaTv2jGG8wMeqOI2iJeVCJJOkDKgVTwnoEcZraBHCO3PvV1oqqf+fyP5t+bmWTh6pwgnEX9gu175jAnLJm17rm0324zsO8eFVaWh1290X8lVcyDxTn/ifpg2Jb/8q6atk9kJAJvPbqMQmLoYAiea+7PHGPOYFxMFjIQIu5/Kq5wptzL9CpcKztLQkMel77G510RBNrU7H7tsdhqvzP2bsebltdAL4vR5is9GrZPuLznmfgw/C3c7LQ0CQqUgkFAQjLEA7IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G1/wnbDfWd8cuamm79x4lwBvSNz0aN0O5y1B6O2TvE=;
 b=P6y/78D0l/qEIeR3fED8+zoxj8Pj+72HSK9itAVCo8TvpfK1rA/cpAfwnj3b9XzqHxGqk1VdxUs7Qqw15Q/lPSHDmjxU8M+2cRim98ijAJEwntZ5wpPUevIldjFL8Ld5J1xnXrLKJ2Xh/1ReerJRlDlNy4U5NEuIBFsF16ekQ0w=
Received: from MRWPR09MB8022.eurprd09.prod.outlook.com (2603:10a6:501:73::11)
 by VI0PR09MB7786.eurprd09.prod.outlook.com (2603:10a6:800:21c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sun, 11 Jan
 2026 10:09:25 +0000
Received: from MRWPR09MB8022.eurprd09.prod.outlook.com
 ([fe80::8c7f:5e18:242a:808]) by MRWPR09MB8022.eurprd09.prod.outlook.com
 ([fe80::8c7f:5e18:242a:808%6]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 10:09:25 +0000
From: Pnina Feder <PNINA.FEDER@mobileye.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"pmladek@suse.com" <pmladek@suse.com>, "bhe@redhat.com" <bhe@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mgorman@suse.de" <mgorman@suse.de>, "mingo@redhat.com" <mingo@redhat.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "rostedt@goodmis.org"
	<rostedt@goodmis.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, Vladimir Kondratiev
	<Vladimir.Kondratiev@mobileye.com>
Subject: RE: [PATCH v5] panic: add panic_force_cpu= parameter to redirect
 panic to a specific CPU
Thread-Topic: [PATCH v5] panic: add panic_force_cpu= parameter to redirect
 panic to a specific CPU
Thread-Index: AQHcgN5yASWAh1Je6Eyuj0MZzPK3iLVKalQAgAAGMoCAAlJZsA==
Date: Sun, 11 Jan 2026 10:09:24 +0000
Message-ID:
 <MRWPR09MB802201A1FAA9B8836CF807658F80A@MRWPR09MB8022.eurprd09.prod.outlook.com>
References: <20260108203612.955769-1-pnina.feder@mobileye.com>
	<202601092335.DbBERt3l-lkp@intel.com>
 <20260109144145.bc6cc6042f1e70430451e3b9@linux-foundation.org>
In-Reply-To: <20260109144145.bc6cc6042f1e70430451e3b9@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR09MB8022:EE_|VI0PR09MB7786:EE_
x-ms-office365-filtering-correlation-id: 89decfc8-949d-44a0-b33c-08de50f97f84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1A1vetwQowWc/6+gAAyFev3IadjxUVhlLxGK84Deu21urM1rqfQeKieAksV8?=
 =?us-ascii?Q?wAq976KXJ3/j7dEeDqbLmGi2rk7ml9TylDDbuqyJluDm/1lXnu2mEcL2LDiX?=
 =?us-ascii?Q?m/h5wcks9APNFvLbY5AWPK1Rxb+66Vhty+S0ahUKGvMQnPOCVDqvPkcHUKwM?=
 =?us-ascii?Q?+6GIRfJzP5W+awotswd6KgjMqdqv/hMQFW7vl4vMwtc01IvTDKP3LDKNOwnW?=
 =?us-ascii?Q?Fu9OkwFQ9xXsPelxmGmcxgmZSP9TG+kShnBWIGhNr5kOxdQCyBK59Dzbgy3/?=
 =?us-ascii?Q?EfFDB9Ma8JVZ/ZoDc3/l40vCnUDfmxW3FqljAWNjwahD7ccAjVBgdP4Qc9rK?=
 =?us-ascii?Q?5LI0YnCZAmF0Cfzgc9608uosX613zb5J6Lp+miEMqYsny0HMIaPALDtHrSDo?=
 =?us-ascii?Q?Ywhv7Bw6f/hSIATLnBcFRSpKYUO0H+ORzElAfJZXZ+urDmp/i1Xqle6/RumO?=
 =?us-ascii?Q?NUrXnXi4KI/oUS9t2EfkudQp+YxNtAieFSI0SbRZANkugYoZw9EkgWaTuufi?=
 =?us-ascii?Q?rj3fTTbhCC/GPVoE+RZyO5rQSxMuZbyyRDXyDOHDyquzKzw+hGMk36/yxw0/?=
 =?us-ascii?Q?DStr2yTVp72fC7t0SNnnN8tV1AN6r2s/mqrhyD/sVZdcapeRsphGMfSPafiW?=
 =?us-ascii?Q?OG4gFYUIgMgbVBc6+e2DdV9xMaIDfwdW6QK77noZVmfvCfupPbGUgljKi/n4?=
 =?us-ascii?Q?TMMMDnV2h2YWhsYCnLz+nPeAs0e6rh9UJbzOiJkik3St5AceoQyg4kdZEWLr?=
 =?us-ascii?Q?b5QYqgRyKT7ZJ9bQfh1VJyqeKb1qBoRjmu3kmKO6HeZM9Qa2VYLuYehesZ2v?=
 =?us-ascii?Q?OpkCC77C2dZ879Fjh7FcUVWSKcEz2qGjEewAbROa3ZEGHUtuUTOY0xGzk60g?=
 =?us-ascii?Q?EmaCaDMnKZplPErx+ip3v99e6kit2TCu5jAiGKpk5Kx6cYTNpk9fR0TfvMk1?=
 =?us-ascii?Q?bfe4KC3edre45c2bWJeJA4wt3UDJx+3HFPCoD65VmzGFpxpQOgmbLhfszawU?=
 =?us-ascii?Q?eFdsUzVWyYMaajtQzQva8vVhBVqyV8HMRQwpnltg5d+C3TBnibU1Kre+bayc?=
 =?us-ascii?Q?Dhxp06lm8DeBhOwz423P9NyU3ETTXCOyx+HVwzGPSsGuJpcqPKu2SlE7czi8?=
 =?us-ascii?Q?1d9Mfy/V7+E5oN9nkA9xRDPAmB/FOgSSJn/bd4QQWuoOnHQ1ACVwpRe7lbDr?=
 =?us-ascii?Q?z5S5EiBBU/p0YRwPnX116DDRJ9CuYaOwGyVWsyw6B5DTNrB/Msms4Gifp9Kx?=
 =?us-ascii?Q?lwlVph1VRhtPHQ9KKs/LiAD+Shg3T8Zfg3uCJoH9lCzLvGZ/rAdJjffv2tzz?=
 =?us-ascii?Q?5MwCBkVRsklXzI4l9PBQiUxG1qMHALZW4yOEO+YSnMTVIe/j3cJqLWEbQgYG?=
 =?us-ascii?Q?6dEtxLeiZ2JK6ZYBmAZea9NF8l+MX9KxUahT6YmCsC5/rf1PO57qkLDcqGWg?=
 =?us-ascii?Q?07znptkE039EBmI2M2uCxnU7+OWX5TaJeAvNidB2rDd8ZAPaVxwUMRTlMS59?=
 =?us-ascii?Q?RDarCGR7WIumK9ko+l9SZc2UfXiWwLMLb8gf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR09MB8022.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nwxH7Vy5vDXXtbQkczklpoO3SUdNYd6bwEc7eb9iixQAW5evt7RuFXeXctKU?=
 =?us-ascii?Q?NeaHZELHCT75t9ue1QHRnpP1pQ9Nxq7gLkPSbHLArfW/L6a/UZKE/LlB2XrV?=
 =?us-ascii?Q?uMs9jtvSwWXErj3Ytj0v/HI2H+UuJJsvGA0OseWJFEcFXear3uEE/zQ1sbUS?=
 =?us-ascii?Q?8cjerW3aCdUKqBQIULNiRrLJQPirpVxFWXCoyrAwP91JLF83RLVMeJeucJf6?=
 =?us-ascii?Q?f9YJ+SCs0I4tZbeVw4w74Oe+Qq3cdVtiwjLbwOAhKPfabEGN4YJTGiFidfxH?=
 =?us-ascii?Q?/+saxpm7UUF8osaxdTgh2zxYeaWs4Mq/4CxcdmnE4esu0lUn1N7fX3yVp9CQ?=
 =?us-ascii?Q?CXezWotr2kMjWBgDd3BUyhNG/HCglsQ+9ANCSmnnHgjQu0urz8JRjbDuy5si?=
 =?us-ascii?Q?ECEBadzmNkWd7XkRKs5SeKxqrIs3BGbGRaV/ThMUCetGx3SK6W3wuj+bjRvc?=
 =?us-ascii?Q?xH6AjpsyrseO007SWb9HHAd3Xpt12LQnV0dUjXMFJpKWaTLvSMdR2sah4Xfx?=
 =?us-ascii?Q?m1+W3bMjFpdhke5rke4YsBQkjF7Hx5w4woqkysi46Wl+9PEJYHRFMVxca6E+?=
 =?us-ascii?Q?puPR7gKI97vZrC4l1/O9LWaqxs3rD8ppaPbiPUY5M5Lq+lDR7NpF08s897RJ?=
 =?us-ascii?Q?aDzhPK0zZOvNzQFeV2aScn2c0fjajd0I7mzql4+JRojzOTNdHR68bJPgFGtN?=
 =?us-ascii?Q?/NkFYrQSkAL8F6gomK1/Bz2hUOXLwpG//xi2HG68wHWq4My3xB/fpn95wKio?=
 =?us-ascii?Q?plsrlWuKFqsdfIbZAHrb+j/wnvHECfwFjqTNdkOxTRkts+NT0riZrWcoDQqE?=
 =?us-ascii?Q?ddvnvRK2po6izkU/J5noWWCXs/ale4RzyagqJu6NYXr/e/nxLwpulQh6znFp?=
 =?us-ascii?Q?2IHuMidR3Xu5IQ/vgVQ8NcU8x+TT/Yv8P48nGdO5u7kI2sY4Q7we0BYjnd5n?=
 =?us-ascii?Q?uhCcnbRiRhgTcRBtQUQCMcT9huCdMHs5EmD97m9E2eu7u2vMR0jyySMRPr57?=
 =?us-ascii?Q?NXYpJIJKJ2l4ZZ1a/XYUgPfipmLaj0liQ4KKjSKiGNlbgQFPrhKXOlIz+Xs0?=
 =?us-ascii?Q?7AvNXEUhUXftj7hBJUC1qPLcu1ps5lTjrof1vCIhLjLhTqkK0+QzaE/9NjCC?=
 =?us-ascii?Q?bXABa3IRWQewVBbnIv4nCt4sD+yUswIbKX/tTEZkK8xSMWTouJhoHOLMi3UK?=
 =?us-ascii?Q?znMOCZsxjlAcGsNblZUNUtjk2bxMfbH2n1HNvCqwn/FsALMtInvH6UwnNG1o?=
 =?us-ascii?Q?gYJVMKjKnil71TEH9cRKW22M5iZ3EtkOJXiPINwjBkGfWkLiiKfbX62efte2?=
 =?us-ascii?Q?KX5OSfvYqFoYf81t9/754Ye/Nyz7bbRg30XtFbJ1loHBhjn+mTe+1O+zuwRg?=
 =?us-ascii?Q?xT2kuPVzHGtpDtYstHAz14Zp/YVWNywszBZvJcymrDm0572kEOEhCUCsaXZR?=
 =?us-ascii?Q?aGOKxHnSjFbc+LX5ctk4Bdqo8ewKX/l3d3JyF13YupQAZ/oCrbEjJ2Ox/a8c?=
 =?us-ascii?Q?L+ubkNuYLdhfXaucwcDJjZTA87Ez3JxWlJzbSal7i33NTsj7z8Uu6ahz+mNd?=
 =?us-ascii?Q?k+CEfaxDyyBgWxy54rxcSYPVX8Hm0jPi2BdDnEXGAhV9mRxy1DSjc9oLDw8T?=
 =?us-ascii?Q?ELS+xKEt/jS5VKgSWSD0CPWs1FuMuioLnVRrLUzzgrt2kJ0aEln5SfQQdUvW?=
 =?us-ascii?Q?ZB47GnZYxkD8jyEenyt3PO1r+x8CbZ2Odg1Lci+u8qXYxp/Rum+LCT0QhnAm?=
 =?us-ascii?Q?AmowPneF8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR09MB8022.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89decfc8-949d-44a0-b33c-08de50f97f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2026 10:09:24.9276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AoQUdH9ERBUdabfOwCsip7mBuHJVke+RMMOzsW5wxWPbgFoI+XmfTfCOJBJ4LTtlUDMTN0snNRBXCAktRGyxFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR09MB7786

> On Fri, 9 Jan 2026 23:19:34 +0100 kernel test robot <lkp@intel.com> wrote=
:
>=20
> >    kernel/panic.c: In function 'do_panic_on_target_cpu':
> > >> kernel/panic.c:327:17: warning: format '%s' expects argument of type=
 'char *', but argument 2 has type 'void *' [-Wformat=3D]
> >      327 |         panic("%s", info);
> >          |                ~^   ~~~~
>=20
> Thanks.  That's what you get for listening to akpm ;)
>=20
> Stupid compiler.

I'll add the cast back in v6 :)

Pnina
