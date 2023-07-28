Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ADFC2C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 06:55:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMhX5w1D2Dv/a+ChxmQmevM2tK7EnH6u3xo6PIY10PznWuAr1eUSE++jT7Fd1zbXZB0cYfQ8w74Nnrz4MK6M3280fpDIurN/NoxTOG4Z66jJqil83tuuGNuSkGjbIDgJXrIi8JCGqU3WnYw/+8p0p4p9qjfk+9uqB6ZfZ4/K0qm1bNNZn+bc05lRGqunPL7sSqo3qLR3HE/5IgVSCW/Ds2BoQ5AY19c3drVq1f81QxGpmHPpGZKjTr9Ia/5jGFNT4zOjvIM2572AHA+3Xt8ZvGe4NwFq2LDMdpcrQ1ElNwMl3hwXvHxK8WrpLyLD8EkgrEJH5YjPsPd8hX0XjCpKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VXTfAWe6QXxRuoHBP1XSqBeQToD5doCCvgBw3vvvVY=;
 b=HDpw0zA/r+1QuYz891byB2Pukj5jR2+4go6cu+kcLO78dIbU7afBkMw/llDrBidEGc5/hZchzgWDn93hp/2esVql9W69hHHRMXzqM3GkkLm6s8UAO61vDGo1Z/cAOZz4SjkF/gA0R6mZ0lcRlkj6/CwYxASmzLvxSIku7auJ781jj4wuKwygKTLJHu1ve8RZ2gLfQVmJImnI0yXEaJOnvfIZg57iLP8HVT2l1y1Qs977LWFbTa4aA732w0XfLnx5KqZRryuo12oNcScxqTTU5/UpO3b70bXkgv3s8aJv2gskd64fXiAG8AZUTCQFFlleiogbfW2qwDLfyBZEu7naJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VXTfAWe6QXxRuoHBP1XSqBeQToD5doCCvgBw3vvvVY=;
 b=OhTFHWtWrnuOVKAOQHauJ1g0bOYymj3g209gXIR4ZCNAp+obLz4UikrHnIYlRwPTdUXejl6+ZbuXg9TQYSP2vIO5AzpvRoYxg7No9w8vgU6ylHkGWpEdJ1rQNmMcrk+GGYh8EBGlu+qxTJ36HMj8W+JY77zaCCjfc3nAjVFY9xs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB9648.jpnprd01.prod.outlook.com (2603:1096:604:1d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 06:55:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 06:55:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Linux
 Memory Management List <linux-mm@kvack.org>, Lee Jones <lee@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [linux-next:master 1582/5027] drivers/counter/rz-mtu3-cnt.c:602:
 undefined reference to `rz_mtu3_shared_reg_update_bit'
Thread-Topic: [linux-next:master 1582/5027] drivers/counter/rz-mtu3-cnt.c:602:
 undefined reference to `rz_mtu3_shared_reg_update_bit'
Thread-Index: AQHZwPOmSUXUWIGlXEGAEX6+VqvH/6/Ovk5A
Date: Fri, 28 Jul 2023 06:55:11 +0000
Message-ID:
 <OS0PR01MB5922EDD75757A7C96E4B7EF08606A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202307280957.1acIz9dc-lkp@intel.com>
In-Reply-To: <202307280957.1acIz9dc-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB9648:EE_
x-ms-office365-filtering-correlation-id: 849a18c7-e3a6-4922-5541-08db8f3796e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 t2AIOg8ublcQIMbo4FL2YYvBJFiOmREi2moH2OledFFw3j5+p4oATNTVrZXvn9prII+M6YuRSRC4XB3dU3kzUIBkt1xaNru4275HIHmG8ioe3AlweIXUauVhWhzN3sBUdSUBnGKyFD8kp9JImZgLZYqgZ+wzJENcHSV6JrYGzhHyc5spLL2Hri6PPikmXcbwPyj3NNWzjrHwIUe7VrTNplHLpp+UA7bKjvGfeJaT3lt9LLA6rHBsPyP7hEZlE+098a/DHvph1bKv55SVv5KBbkXpPi16NbXs2KOj1N52vPt2h5tykk3aJY8sNhVrjaOZpZvz+v2ZeT6GdVm+0yq7oKahRvCIRTFlE1DXHLTdDfV9379Xs5gbNrRH2PgAYpRCBe4edwLDyPIZ1KXcEEkUCP8r3+h1ORbFiVwo23Cs8uwz9s6AlxyVS3rGJ9SoG42UWh/r/1q64eXKHX/TW17JfVQJWkxqvh11LRHKPgouWR0r+QBI0fbOnFuePTFNv2uhuVLHJDH8lIr80nELGV15f0ZIDn14ex1bunRc68iGDYhy9OpZ65jT6a6Ri/zBWo/owgnkEY2IzUPXKH5RLej0pxLgCD8OmyZWWs4nWubhUoJ33RClirMPLqcRKy8TJT1a
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(451199021)(55016003)(71200400001)(54906003)(9686003)(122000001)(7696005)(966005)(38100700002)(478600001)(41300700001)(52536014)(8676002)(64756008)(5660300002)(66476007)(4326008)(76116006)(66556008)(8936002)(66446008)(6916009)(66946007)(316002)(83380400001)(186003)(26005)(6506007)(86362001)(38070700005)(33656002)(2906002)(30864003)(81973001)(559001)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OikOBA6nn6BRItMvSRkTWHkogcZc5A2p7A+EcEj4gC2bHZ91Sf2c4iWV2IQZ?=
 =?us-ascii?Q?0baeN5yh0cb0gZGHhXLqnaP7sdI1fDB6E7UhKUIceAAA0YBdvKW+B8qI4Xyi?=
 =?us-ascii?Q?OJagU6EvjymXnLfC0Quwxw+n+VaMwz0K2z5rx8LUFNbOlpuvMDl0yGowwvIw?=
 =?us-ascii?Q?1JjvUdFdZKqLJvVUrfTLDYlcE27CbH5vszON9UT7mY79mkXV9jcOft8Q4SDb?=
 =?us-ascii?Q?smth/DMEHttPLTyhm7Hxi4QP4CUE1+iWZn+aLaAxyczejzanvA44hw/onTmM?=
 =?us-ascii?Q?KgbfmBg/FPVXiDpZSOEGidGO+gwG6rd8G1QawnHbkBFh+eFfh9/wLIjLdidY?=
 =?us-ascii?Q?mocpZhytvNZyEe6aHNPbu8xRc3Wq3ekJisfl2tVertNNk2UsjVbiBzDS6UWl?=
 =?us-ascii?Q?xdtHYLN5K3BZvFgimGGIn9gOTlTYdm4auKssb7cBx/lKMvt0c+X47TxM1eIM?=
 =?us-ascii?Q?hxuE/yOwFtGb2fuEuYmMJ6W9WDQqQVKXMuEZ/Y2wqqeU9LR/9UR3fEv+iD6O?=
 =?us-ascii?Q?6+unOYj/3PbUF7HhLKtv8+b60HGVxbf0FKw+HPUH/Wu2K6W+M2YNdhyrePgc?=
 =?us-ascii?Q?TYarClfUGmVIdqDV87rPZi0mVxYBee287k16Q+cd8xtkXl9TVU0E17SGkUga?=
 =?us-ascii?Q?u8gvbPQDhThA35M/nqXRoGYlvbuU1iZovISgdKikFip9u+RUMmSko4e+WFMn?=
 =?us-ascii?Q?1Q9mEqGzyPBOENu43V3inWbqPlY8zB2pLVHFECPaLsC5bZNUbnor3+H8glHC?=
 =?us-ascii?Q?YrxMwXl9tDqvj2x/pFc9ZfYMTfhVqpAHxfAa/ddzt5Qk/C4lufQmYc99rfAX?=
 =?us-ascii?Q?Wm7s/Y6slxnwL0zlKDxpdHKQvc6wQxQ1uRJVFd8gckYM4AuaLjLOcsx3+qz3?=
 =?us-ascii?Q?NgHQU+4TiwFjKsiFDfSs4VU9AM9jbkknh3/rsLszC8AGazz9abs1gRkiC/Rc?=
 =?us-ascii?Q?Qu2Jelun0YGZkpDHt1XhGyq/alGZM7wEjBuf9v65QgnrEy0iEHbL5EsRm8hh?=
 =?us-ascii?Q?Ai8VGgPUk7+5XypJIaZDV43SmjTzMdYCAVDm7myJsFmkW9sCeDnw55DfIoOg?=
 =?us-ascii?Q?Qvj4i7RgdN92I/FwVWaqB/09wmXMjhxaf6CNvhiyTcJARbIBwciw58ZxW99/?=
 =?us-ascii?Q?l1p9jt2+e1U8uPiVHm1zdUCrl79M3O0L/GHO43xQ7SHpomI7VGdgHJdc/tdT?=
 =?us-ascii?Q?S71W8TkIJ//Mgn3J/s7V792RpE9YbrjCWS1PSc9nP1ppLZzUmFOlnzSHoZRz?=
 =?us-ascii?Q?oYpH6AXdITrb4DmmA+boA7jiGflrSNkTvZ3V2s17uF9DCXAgjfwYva4FMkSL?=
 =?us-ascii?Q?q/8duFJDTGiV66syXb3gNKlPj2hDQaWgDzYx2sk1/aNN2VO+TczMD0zdLR/T?=
 =?us-ascii?Q?qL9Ixr4WZPsYISI4d84nMe4mPWc7/pq1EU7tUAHgQvU1ckGGnp10VYgmrN0N?=
 =?us-ascii?Q?NKIdp+MuqYEAlzuKxOGPw0ZUbAib23JUPQiIEet2jzH6poajF3pjGobxz6uS?=
 =?us-ascii?Q?bb/bf0lpXAg+qm5jUnRNbD335/7VtXXg+M9EWS8CGD4CurCSM09/4AwxM30R?=
 =?us-ascii?Q?mOWPbLu1WdIHX2FQF8YJeQlMGRPenLoZYIAB+yFM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849a18c7-e3a6-4922-5541-08db8f3796e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 06:55:12.0768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZgC1Dh6RvlVtdJiQps18JAETsWREmLEkRRHkihtRkuoqUUlV/4WINzsbYWSiq4VBI/KY4Q1KKphyBMax6h1DJQNrXSqKQAmpjgmAQ2a3k0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9648

Hi kernel test robot,

This should be fixed by [1]

[1] https://lore.kernel.org/all/20230719090430.1925182-1-arnd@kernel.org/

Can you please try after applying this patch?

Cheers,
Biju

> Subject: [linux-next:master 1582/5027] drivers/counter/rz-mtu3-
> cnt.c:602: undefined reference to `rz_mtu3_shared_reg_update_bit'
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
>=20
> All errors (new ones prefixed by >>):
>=20
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_ext_input_phase_clock_select_set':
> >> drivers/counter/rz-mtu3-cnt.c:602: undefined reference to
> `rz_mtu3_shared_reg_update_bit'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_cascade_counts_enable_set':
>    drivers/counter/rz-mtu3-cnt.c:563: undefined reference to
> `rz_mtu3_shared_reg_update_bit'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_ext_input_phase_clock_select_get':
> >> drivers/counter/rz-mtu3-cnt.c:583: undefined reference to
> `rz_mtu3_shared_reg_read'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_cascade_counts_enable_get':
>    drivers/counter/rz-mtu3-cnt.c:544: undefined reference to
> `rz_mtu3_shared_reg_read'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_lock_if_counter_is_valid':
>    drivers/counter/rz-mtu3-cnt.c:111: undefined reference to
> `rz_mtu3_shared_reg_read'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_count_direction_read':
> >> drivers/counter/rz-mtu3-cnt.c:304: undefined reference to
> `rz_mtu3_8bit_ch_read'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_count_function_write':
> >> drivers/counter/rz-mtu3-cnt.c:283: undefined reference to
> `rz_mtu3_8bit_ch_write'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_count_function_read':
>    drivers/counter/rz-mtu3-cnt.c:208: undefined reference to
> `rz_mtu3_8bit_ch_read'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_count_write':
> >> drivers/counter/rz-mtu3-cnt.c:194: undefined reference to
> `rz_mtu3_16bit_ch_write'
> >> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:192: undefined reference
> to `rz_mtu3_32bit_ch_write'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_count_read':
> >> drivers/counter/rz-mtu3-cnt.c:172: undefined reference to
> `rz_mtu3_16bit_ch_read'
> >> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:170: undefined reference
> to `rz_mtu3_32bit_ch_read'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_count_enable_read':
> >> drivers/counter/rz-mtu3-cnt.c:488: undefined reference to
> `rz_mtu3_is_enabled'
> >> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:486: undefined reference
> to `rz_mtu3_is_enabled'
> >> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:486: undefined reference
> to `rz_mtu3_is_enabled'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_count_ceiling_write':
>    drivers/counter/rz-mtu3-cnt.c:384: undefined reference to
> `rz_mtu3_16bit_ch_write'
> >> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:386: undefined reference
> to `rz_mtu3_8bit_ch_write'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:382: undefined reference
> to `rz_mtu3_32bit_ch_write'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_action_read':
>    drivers/counter/rz-mtu3-cnt.c:208: undefined reference to
> `rz_mtu3_8bit_ch_read'
> >> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:653: undefined reference
> to `rz_mtu3_shared_reg_read'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_initialize_counter':
>    drivers/counter/rz-mtu3-cnt.c:413: undefined reference to
> `rz_mtu3_8bit_ch_write'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:415: undefined reference
> to `rz_mtu3_8bit_ch_write'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:416: undefined reference
> to `rz_mtu3_8bit_ch_write'
> >> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:417: undefined reference
> to `rz_mtu3_enable'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:399: undefined reference
> to `rz_mtu3_8bit_ch_write'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:401: undefined reference
> to `rz_mtu3_8bit_ch_write'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:402: undefined reference
> to `rz_mtu3_8bit_ch_write'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:404: undefined reference
> to `rz_mtu3_enable'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:405: undefined reference
> to `rz_mtu3_enable'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.o: in function
> `rz_mtu3_count_enable_write':
> >> drivers/counter/rz-mtu3-cnt.c:468: undefined reference to
> `rz_mtu3_disable'
> >> hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:464: undefined reference
> to `rz_mtu3_disable'
>    hppa-linux-ld: drivers/counter/rz-mtu3-cnt.c:465: undefined reference
> to `rz_mtu3_disable'
>=20
>=20
> vim +602 drivers/counter/rz-mtu3-cnt.c
>=20
> 0be8907359df4c6 Biju Das 2023-03-30  407
> 0be8907359df4c6 Biju Das 2023-03-30  408  static void
> rz_mtu3_16bit_cnt_setting(struct counter_device *counter, int id)
> 0be8907359df4c6 Biju Das 2023-03-30  409  {
> 0be8907359df4c6 Biju Das 2023-03-30  410  	struct rz_mtu3_channel
> *const ch =3D rz_mtu3_get_ch(counter, id);
> 0be8907359df4c6 Biju Das 2023-03-30  411
> 0be8907359df4c6 Biju Das 2023-03-30  412  	/* Phase counting mode 1
> is used as default in initialization. */
> 0be8907359df4c6 Biju Das 2023-03-30  413  	rz_mtu3_8bit_ch_write(ch,
> RZ_MTU3_TMDR1, RZ_MTU3_TMDR1_PH_CNT_MODE_1);
> 0be8907359df4c6 Biju Das 2023-03-30  414
> 0be8907359df4c6 Biju Das 2023-03-30  415  	rz_mtu3_8bit_ch_write(ch,
> RZ_MTU3_TCR, RZ_MTU3_TCR_CCLR_TGRA);
> 0be8907359df4c6 Biju Das 2023-03-30  416  	rz_mtu3_8bit_ch_write(ch,
> RZ_MTU3_TIOR, RZ_MTU3_TIOR_NO_OUTPUT);
> 0be8907359df4c6 Biju Das 2023-03-30 @417  	rz_mtu3_enable(ch);
> 0be8907359df4c6 Biju Das 2023-03-30  418  }
> 0be8907359df4c6 Biju Das 2023-03-30  419
> 0be8907359df4c6 Biju Das 2023-03-30  420  static int
> rz_mtu3_initialize_counter(struct counter_device *counter, int id)
> 0be8907359df4c6 Biju Das 2023-03-30  421  {
> 0be8907359df4c6 Biju Das 2023-03-30  422  	struct rz_mtu3_channel
> *const ch =3D rz_mtu3_get_ch(counter, id);
> 0be8907359df4c6 Biju Das 2023-03-30  423  	struct rz_mtu3_channel
> *const ch1 =3D rz_mtu3_get_ch(counter, 0);
> 0be8907359df4c6 Biju Das 2023-03-30  424  	struct rz_mtu3_channel
> *const ch2 =3D rz_mtu3_get_ch(counter, 1);
> 0be8907359df4c6 Biju Das 2023-03-30  425
> 0be8907359df4c6 Biju Das 2023-03-30  426  	switch (id) {
> 0be8907359df4c6 Biju Das 2023-03-30  427  	case
> RZ_MTU3_16_BIT_MTU1_CH:
> 0be8907359df4c6 Biju Das 2023-03-30  428  	case
> RZ_MTU3_16_BIT_MTU2_CH:
> 0be8907359df4c6 Biju Das 2023-03-30  429  		if
> (!rz_mtu3_request_channel(ch))
> 0be8907359df4c6 Biju Das 2023-03-30  430  			return -
> EBUSY;
> 0be8907359df4c6 Biju Das 2023-03-30  431
> 0be8907359df4c6 Biju Das 2023-03-30  432
> 	rz_mtu3_16bit_cnt_setting(counter, id);
> 0be8907359df4c6 Biju Das 2023-03-30  433  		return 0;
> 0be8907359df4c6 Biju Das 2023-03-30  434  	case RZ_MTU3_32_BIT_CH:
> 0be8907359df4c6 Biju Das 2023-03-30  435  		/*
> 0be8907359df4c6 Biju Das 2023-03-30  436  		 * 32-bit phase
> counting need MTU1 and MTU2 to create 32-bit
> 0be8907359df4c6 Biju Das 2023-03-30  437  		 * cascade counter.
> 0be8907359df4c6 Biju Das 2023-03-30  438  		 */
> 0be8907359df4c6 Biju Das 2023-03-30  439  		if
> (!rz_mtu3_request_channel(ch1))
> 0be8907359df4c6 Biju Das 2023-03-30  440  			return -
> EBUSY;
> 0be8907359df4c6 Biju Das 2023-03-30  441
> 0be8907359df4c6 Biju Das 2023-03-30  442  		if
> (!rz_mtu3_request_channel(ch2)) {
> 0be8907359df4c6 Biju Das 2023-03-30  443
> 	rz_mtu3_release_channel(ch1);
> 0be8907359df4c6 Biju Das 2023-03-30  444  			return -
> EBUSY;
> 0be8907359df4c6 Biju Das 2023-03-30  445  		}
> 0be8907359df4c6 Biju Das 2023-03-30  446
> 0be8907359df4c6 Biju Das 2023-03-30  447
> 	rz_mtu3_32bit_cnt_setting(counter);
> 0be8907359df4c6 Biju Das 2023-03-30  448  		return 0;
> 0be8907359df4c6 Biju Das 2023-03-30  449  	default:
> 0be8907359df4c6 Biju Das 2023-03-30  450  		/* should never
> reach this path */
> 0be8907359df4c6 Biju Das 2023-03-30  451  		return -EINVAL;
> 0be8907359df4c6 Biju Das 2023-03-30  452  	}
> 0be8907359df4c6 Biju Das 2023-03-30  453  }
> 0be8907359df4c6 Biju Das 2023-03-30  454
> 0be8907359df4c6 Biju Das 2023-03-30  455  static void
> rz_mtu3_terminate_counter(struct counter_device *counter, int id)
> 0be8907359df4c6 Biju Das 2023-03-30  456  {
> 0be8907359df4c6 Biju Das 2023-03-30  457  	struct rz_mtu3_channel
> *const ch =3D rz_mtu3_get_ch(counter, id);
> 0be8907359df4c6 Biju Das 2023-03-30  458  	struct rz_mtu3_channel
> *const ch1 =3D rz_mtu3_get_ch(counter, 0);
> 0be8907359df4c6 Biju Das 2023-03-30  459  	struct rz_mtu3_channel
> *const ch2 =3D rz_mtu3_get_ch(counter, 1);
> 0be8907359df4c6 Biju Das 2023-03-30  460
> 0be8907359df4c6 Biju Das 2023-03-30  461  	if (id =3D=3D
> RZ_MTU3_32_BIT_CH) {
> 0be8907359df4c6 Biju Das 2023-03-30  462
> 	rz_mtu3_release_channel(ch2);
> 0be8907359df4c6 Biju Das 2023-03-30  463
> 	rz_mtu3_release_channel(ch1);
> 0be8907359df4c6 Biju Das 2023-03-30 @464
> 	rz_mtu3_disable(ch2);
> 0be8907359df4c6 Biju Das 2023-03-30  465
> 	rz_mtu3_disable(ch1);
> 0be8907359df4c6 Biju Das 2023-03-30  466  	} else {
> 0be8907359df4c6 Biju Das 2023-03-30  467
> 	rz_mtu3_release_channel(ch);
> 0be8907359df4c6 Biju Das 2023-03-30 @468
> 	rz_mtu3_disable(ch);
> 0be8907359df4c6 Biju Das 2023-03-30  469  	}
> 0be8907359df4c6 Biju Das 2023-03-30  470  }
> 0be8907359df4c6 Biju Das 2023-03-30  471
> 0be8907359df4c6 Biju Das 2023-03-30  472  static int
> rz_mtu3_count_enable_read(struct counter_device *counter,
> 0be8907359df4c6 Biju Das 2023-03-30  473
> struct counter_count *count, u8 *enable)
> 0be8907359df4c6 Biju Das 2023-03-30  474  {
> 0be8907359df4c6 Biju Das 2023-03-30  475  	struct rz_mtu3_channel
> *const ch =3D rz_mtu3_get_ch(counter, count->id);
> 0be8907359df4c6 Biju Das 2023-03-30  476  	struct rz_mtu3_channel
> *const ch1 =3D rz_mtu3_get_ch(counter, 0);
> 0be8907359df4c6 Biju Das 2023-03-30  477  	struct rz_mtu3_channel
> *const ch2 =3D rz_mtu3_get_ch(counter, 1);
> 0be8907359df4c6 Biju Das 2023-03-30  478  	struct rz_mtu3_cnt *const
> priv =3D counter_priv(counter);
> 0be8907359df4c6 Biju Das 2023-03-30  479  	int ret;
> 0be8907359df4c6 Biju Das 2023-03-30  480
> 0be8907359df4c6 Biju Das 2023-03-30  481  	ret =3D
> rz_mtu3_lock_if_count_is_enabled(ch, priv, count->id);
> 0be8907359df4c6 Biju Das 2023-03-30  482  	if (ret)
> 0be8907359df4c6 Biju Das 2023-03-30  483  		return ret;
> 0be8907359df4c6 Biju Das 2023-03-30  484
> 0be8907359df4c6 Biju Das 2023-03-30  485  	if (count->id =3D=3D
> RZ_MTU3_32_BIT_CH)
> 0be8907359df4c6 Biju Das 2023-03-30 @486  		*enable =3D
> rz_mtu3_is_enabled(ch1) && rz_mtu3_is_enabled(ch2);
> 0be8907359df4c6 Biju Das 2023-03-30  487  	else
> 0be8907359df4c6 Biju Das 2023-03-30 @488  		*enable =3D
> rz_mtu3_is_enabled(ch);
> 0be8907359df4c6 Biju Das 2023-03-30  489
> 0be8907359df4c6 Biju Das 2023-03-30  490  	mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  491
> 0be8907359df4c6 Biju Das 2023-03-30  492  	return 0;
> 0be8907359df4c6 Biju Das 2023-03-30  493  }
> 0be8907359df4c6 Biju Das 2023-03-30  494
> 0be8907359df4c6 Biju Das 2023-03-30  495  static int
> rz_mtu3_count_enable_write(struct counter_device *counter,
> 0be8907359df4c6 Biju Das 2023-03-30  496
> struct counter_count *count, u8 enable)
> 0be8907359df4c6 Biju Das 2023-03-30  497  {
> 0be8907359df4c6 Biju Das 2023-03-30  498  	struct rz_mtu3_channel
> *const ch =3D rz_mtu3_get_ch(counter, count->id);
> 0be8907359df4c6 Biju Das 2023-03-30  499  	struct rz_mtu3_cnt *const
> priv =3D counter_priv(counter);
> 0be8907359df4c6 Biju Das 2023-03-30  500  	int ret =3D 0;
> 0be8907359df4c6 Biju Das 2023-03-30  501
> 0be8907359df4c6 Biju Das 2023-03-30  502  	if (enable) {
> 0be8907359df4c6 Biju Das 2023-03-30  503
> 	pm_runtime_get_sync(ch->dev);
> 0be8907359df4c6 Biju Das 2023-03-30  504  		mutex_lock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  505  		ret =3D
> rz_mtu3_initialize_counter(counter, count->id);
> 0be8907359df4c6 Biju Das 2023-03-30  506  		if (ret =3D=3D 0)
> 0be8907359df4c6 Biju Das 2023-03-30  507  			priv-
> >count_is_enabled[count->id] =3D true;
> 0be8907359df4c6 Biju Das 2023-03-30  508  		mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  509  	} else {
> 0be8907359df4c6 Biju Das 2023-03-30  510  		mutex_lock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  511
> 	rz_mtu3_terminate_counter(counter, count->id);
> 0be8907359df4c6 Biju Das 2023-03-30  512  		priv-
> >count_is_enabled[count->id] =3D false;
> 0be8907359df4c6 Biju Das 2023-03-30  513  		mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  514  		pm_runtime_put(ch-
> >dev);
> 0be8907359df4c6 Biju Das 2023-03-30  515  	}
> 0be8907359df4c6 Biju Das 2023-03-30  516
> 0be8907359df4c6 Biju Das 2023-03-30  517  	return ret;
> 0be8907359df4c6 Biju Das 2023-03-30  518  }
> 0be8907359df4c6 Biju Das 2023-03-30  519
> 0be8907359df4c6 Biju Das 2023-03-30  520  static int
> rz_mtu3_lock_if_ch0_is_enabled(struct rz_mtu3_cnt *const priv)
> 0be8907359df4c6 Biju Das 2023-03-30  521  {
> 0be8907359df4c6 Biju Das 2023-03-30  522  	mutex_lock(&priv->lock);
> 0be8907359df4c6 Biju Das 2023-03-30  523  	if (priv->ch->is_busy
> && !(priv->count_is_enabled[RZ_MTU3_16_BIT_MTU1_CH] ||
> 0be8907359df4c6 Biju Das 2023-03-30  524
> priv->count_is_enabled[RZ_MTU3_32_BIT_CH])) {
> 0be8907359df4c6 Biju Das 2023-03-30  525  		mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  526  		return -EINVAL;
> 0be8907359df4c6 Biju Das 2023-03-30  527  	}
> 0be8907359df4c6 Biju Das 2023-03-30  528
> 0be8907359df4c6 Biju Das 2023-03-30  529  	return 0;
> 0be8907359df4c6 Biju Das 2023-03-30  530  }
> 0be8907359df4c6 Biju Das 2023-03-30  531
> 0be8907359df4c6 Biju Das 2023-03-30  532  static int
> rz_mtu3_cascade_counts_enable_get(struct counter_device *counter,
> 0be8907359df4c6 Biju Das 2023-03-30  533
> u8 *cascade_enable)
> 0be8907359df4c6 Biju Das 2023-03-30  534  {
> 0be8907359df4c6 Biju Das 2023-03-30  535  	struct rz_mtu3_cnt *const
> priv =3D counter_priv(counter);
> 0be8907359df4c6 Biju Das 2023-03-30  536  	unsigned long tmdr;
> 0be8907359df4c6 Biju Das 2023-03-30  537  	int ret;
> 0be8907359df4c6 Biju Das 2023-03-30  538
> 0be8907359df4c6 Biju Das 2023-03-30  539  	ret =3D
> rz_mtu3_lock_if_ch0_is_enabled(priv);
> 0be8907359df4c6 Biju Das 2023-03-30  540  	if (ret)
> 0be8907359df4c6 Biju Das 2023-03-30  541  		return ret;
> 0be8907359df4c6 Biju Das 2023-03-30  542
> 0be8907359df4c6 Biju Das 2023-03-30  543  	pm_runtime_get_sync(priv-
> >ch->dev);
> 0be8907359df4c6 Biju Das 2023-03-30  544  	tmdr =3D
> rz_mtu3_shared_reg_read(priv->ch, RZ_MTU3_TMDR3);
> 0be8907359df4c6 Biju Das 2023-03-30  545  	pm_runtime_put(priv->ch-
> >dev);
> 0be8907359df4c6 Biju Das 2023-03-30  546  	*cascade_enable =3D
> test_bit(RZ_MTU3_TMDR3_LWA, &tmdr);
> 0be8907359df4c6 Biju Das 2023-03-30  547  	mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  548
> 0be8907359df4c6 Biju Das 2023-03-30  549  	return 0;
> 0be8907359df4c6 Biju Das 2023-03-30  550  }
> 0be8907359df4c6 Biju Das 2023-03-30  551
> 0be8907359df4c6 Biju Das 2023-03-30  552  static int
> rz_mtu3_cascade_counts_enable_set(struct counter_device *counter,
> 0be8907359df4c6 Biju Das 2023-03-30  553
> u8 cascade_enable)
> 0be8907359df4c6 Biju Das 2023-03-30  554  {
> 0be8907359df4c6 Biju Das 2023-03-30  555  	struct rz_mtu3_cnt *const
> priv =3D counter_priv(counter);
> 0be8907359df4c6 Biju Das 2023-03-30  556  	int ret;
> 0be8907359df4c6 Biju Das 2023-03-30  557
> 0be8907359df4c6 Biju Das 2023-03-30  558  	ret =3D
> rz_mtu3_lock_if_ch0_is_enabled(priv);
> 0be8907359df4c6 Biju Das 2023-03-30  559  	if (ret)
> 0be8907359df4c6 Biju Das 2023-03-30  560  		return ret;
> 0be8907359df4c6 Biju Das 2023-03-30  561
> 0be8907359df4c6 Biju Das 2023-03-30  562  	pm_runtime_get_sync(priv-
> >ch->dev);
> 0be8907359df4c6 Biju Das 2023-03-30  563
> 	rz_mtu3_shared_reg_update_bit(priv->ch, RZ_MTU3_TMDR3,
> 0be8907359df4c6 Biju Das 2023-03-30  564
> RZ_MTU3_TMDR3_LWA, cascade_enable);
> 0be8907359df4c6 Biju Das 2023-03-30  565  	pm_runtime_put(priv->ch-
> >dev);
> 0be8907359df4c6 Biju Das 2023-03-30  566  	mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  567
> 0be8907359df4c6 Biju Das 2023-03-30  568  	return 0;
> 0be8907359df4c6 Biju Das 2023-03-30  569  }
> 0be8907359df4c6 Biju Das 2023-03-30  570
> 0be8907359df4c6 Biju Das 2023-03-30  571  static int
> rz_mtu3_ext_input_phase_clock_select_get(struct counter_device *counter,
> 0be8907359df4c6 Biju Das 2023-03-30  572
> 	    u32 *ext_input_phase_clock_select)
> 0be8907359df4c6 Biju Das 2023-03-30  573  {
> 0be8907359df4c6 Biju Das 2023-03-30  574  	struct rz_mtu3_cnt *const
> priv =3D counter_priv(counter);
> 0be8907359df4c6 Biju Das 2023-03-30  575  	unsigned long tmdr;
> 0be8907359df4c6 Biju Das 2023-03-30  576  	int ret;
> 0be8907359df4c6 Biju Das 2023-03-30  577
> 0be8907359df4c6 Biju Das 2023-03-30  578  	ret =3D
> rz_mtu3_lock_if_ch0_is_enabled(priv);
> 0be8907359df4c6 Biju Das 2023-03-30  579  	if (ret)
> 0be8907359df4c6 Biju Das 2023-03-30  580  		return ret;
> 0be8907359df4c6 Biju Das 2023-03-30  581
> 0be8907359df4c6 Biju Das 2023-03-30  582  	pm_runtime_get_sync(priv-
> >ch->dev);
> 0be8907359df4c6 Biju Das 2023-03-30 @583  	tmdr =3D
> rz_mtu3_shared_reg_read(priv->ch, RZ_MTU3_TMDR3);
> 0be8907359df4c6 Biju Das 2023-03-30  584  	pm_runtime_put(priv->ch-
> >dev);
> 0be8907359df4c6 Biju Das 2023-03-30  585
> 	*ext_input_phase_clock_select =3D test_bit(RZ_MTU3_TMDR3_PHCKSEL,
> &tmdr);
> 0be8907359df4c6 Biju Das 2023-03-30  586  	mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  587
> 0be8907359df4c6 Biju Das 2023-03-30  588  	return 0;
> 0be8907359df4c6 Biju Das 2023-03-30  589  }
> 0be8907359df4c6 Biju Das 2023-03-30  590
> 0be8907359df4c6 Biju Das 2023-03-30  591  static int
> rz_mtu3_ext_input_phase_clock_select_set(struct counter_device *counter,
> 0be8907359df4c6 Biju Das 2023-03-30  592
> 	    u32 ext_input_phase_clock_select)
> 0be8907359df4c6 Biju Das 2023-03-30  593  {
> 0be8907359df4c6 Biju Das 2023-03-30  594  	struct rz_mtu3_cnt *const
> priv =3D counter_priv(counter);
> 0be8907359df4c6 Biju Das 2023-03-30  595  	int ret;
> 0be8907359df4c6 Biju Das 2023-03-30  596
> 0be8907359df4c6 Biju Das 2023-03-30  597  	ret =3D
> rz_mtu3_lock_if_ch0_is_enabled(priv);
> 0be8907359df4c6 Biju Das 2023-03-30  598  	if (ret)
> 0be8907359df4c6 Biju Das 2023-03-30  599  		return ret;
> 0be8907359df4c6 Biju Das 2023-03-30  600
> 0be8907359df4c6 Biju Das 2023-03-30  601  	pm_runtime_get_sync(priv-
> >ch->dev);
> 0be8907359df4c6 Biju Das 2023-03-30 @602
> 	rz_mtu3_shared_reg_update_bit(priv->ch, RZ_MTU3_TMDR3,
> 0be8907359df4c6 Biju Das 2023-03-30  603
> RZ_MTU3_TMDR3_PHCKSEL,
> 0be8907359df4c6 Biju Das 2023-03-30  604
> ext_input_phase_clock_select);
> 0be8907359df4c6 Biju Das 2023-03-30  605  	pm_runtime_put(priv->ch-
> >dev);
> 0be8907359df4c6 Biju Das 2023-03-30  606  	mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  607
> 0be8907359df4c6 Biju Das 2023-03-30  608  	return 0;
> 0be8907359df4c6 Biju Das 2023-03-30  609  }
> 0be8907359df4c6 Biju Das 2023-03-30  610
> 0be8907359df4c6 Biju Das 2023-03-30  611  static struct counter_comp
> rz_mtu3_count_ext[] =3D {
> 0be8907359df4c6 Biju Das 2023-03-30  612
> 	COUNTER_COMP_DIRECTION(rz_mtu3_count_direction_read),
> 0be8907359df4c6 Biju Das 2023-03-30  613
> 	COUNTER_COMP_ENABLE(rz_mtu3_count_enable_read,
> 0be8907359df4c6 Biju Das 2023-03-30  614
> rz_mtu3_count_enable_write),
> 0be8907359df4c6 Biju Das 2023-03-30  615
> 	COUNTER_COMP_CEILING(rz_mtu3_count_ceiling_read,
> 0be8907359df4c6 Biju Das 2023-03-30  616
> rz_mtu3_count_ceiling_write),
> 0be8907359df4c6 Biju Das 2023-03-30  617  };
> 0be8907359df4c6 Biju Das 2023-03-30  618
> 0be8907359df4c6 Biju Das 2023-03-30  619  static const enum
> counter_synapse_action rz_mtu3_synapse_actions[] =3D {
> 0be8907359df4c6 Biju Das 2023-03-30  620
> 	COUNTER_SYNAPSE_ACTION_BOTH_EDGES,
> 0be8907359df4c6 Biju Das 2023-03-30  621
> 	COUNTER_SYNAPSE_ACTION_RISING_EDGE,
> 0be8907359df4c6 Biju Das 2023-03-30  622
> 	COUNTER_SYNAPSE_ACTION_NONE,
> 0be8907359df4c6 Biju Das 2023-03-30  623  };
> 0be8907359df4c6 Biju Das 2023-03-30  624
> 0be8907359df4c6 Biju Das 2023-03-30  625  static int
> rz_mtu3_action_read(struct counter_device *counter,
> 0be8907359df4c6 Biju Das 2023-03-30  626  			       struct
> counter_count *count,
> 0be8907359df4c6 Biju Das 2023-03-30  627  			       struct
> counter_synapse *synapse,
> 0be8907359df4c6 Biju Das 2023-03-30  628  			       enum
> counter_synapse_action *action)
> 0be8907359df4c6 Biju Das 2023-03-30  629  {
> 0be8907359df4c6 Biju Das 2023-03-30  630  	const bool is_signal_ab =3D
> (synapse->signal->id =3D=3D SIGNAL_A_ID) ||
> 0be8907359df4c6 Biju Das 2023-03-30  631
> (synapse->signal->id =3D=3D SIGNAL_B_ID);
> 0be8907359df4c6 Biju Das 2023-03-30  632  	struct rz_mtu3_channel
> *const ch =3D rz_mtu3_get_ch(counter, count->id);
> 0be8907359df4c6 Biju Das 2023-03-30  633  	struct rz_mtu3_cnt *const
> priv =3D counter_priv(counter);
> 0be8907359df4c6 Biju Das 2023-03-30  634  	enum counter_function
> function;
> 0be8907359df4c6 Biju Das 2023-03-30  635  	bool mtclkc_mtclkd;
> 0be8907359df4c6 Biju Das 2023-03-30  636  	unsigned long tmdr;
> 0be8907359df4c6 Biju Das 2023-03-30  637  	int ret;
> 0be8907359df4c6 Biju Das 2023-03-30  638
> 0be8907359df4c6 Biju Das 2023-03-30  639  	ret =3D
> rz_mtu3_lock_if_count_is_enabled(ch, priv, count->id);
> 0be8907359df4c6 Biju Das 2023-03-30  640  	if (ret)
> 0be8907359df4c6 Biju Das 2023-03-30  641  		return ret;
> 0be8907359df4c6 Biju Das 2023-03-30  642
> 0be8907359df4c6 Biju Das 2023-03-30  643  	ret =3D
> rz_mtu3_count_function_read_helper(ch, priv, &function);
> 0be8907359df4c6 Biju Das 2023-03-30  644  	if (ret) {
> 0be8907359df4c6 Biju Das 2023-03-30  645  		mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  646  		return ret;
> 0be8907359df4c6 Biju Das 2023-03-30  647  	}
> 0be8907359df4c6 Biju Das 2023-03-30  648
> 0be8907359df4c6 Biju Das 2023-03-30  649  	/* Default action mode */
> 0be8907359df4c6 Biju Das 2023-03-30  650  	*action =3D
> COUNTER_SYNAPSE_ACTION_NONE;
> 0be8907359df4c6 Biju Das 2023-03-30  651
> 0be8907359df4c6 Biju Das 2023-03-30  652  	if (count->id !=3D
> RZ_MTU3_16_BIT_MTU1_CH) {
> 0be8907359df4c6 Biju Das 2023-03-30 @653  		tmdr =3D
> rz_mtu3_shared_reg_read(priv->ch, RZ_MTU3_TMDR3);
> 0be8907359df4c6 Biju Das 2023-03-30  654  		mtclkc_mtclkd =3D
> test_bit(RZ_MTU3_TMDR3_PHCKSEL, &tmdr);
> 0be8907359df4c6 Biju Das 2023-03-30  655  		if ((mtclkc_mtclkd
> && is_signal_ab) ||
> 0be8907359df4c6 Biju Das 2023-03-30  656  		    (!mtclkc_mtclkd
> && !is_signal_ab)) {
> 0be8907359df4c6 Biju Das 2023-03-30  657
> 	mutex_unlock(&priv->lock);
> 0be8907359df4c6 Biju Das 2023-03-30  658  			return 0;
> 0be8907359df4c6 Biju Das 2023-03-30  659  		}
> 0be8907359df4c6 Biju Das 2023-03-30  660  	}
> 0be8907359df4c6 Biju Das 2023-03-30  661
> 0be8907359df4c6 Biju Das 2023-03-30  662  	switch (function) {
> 0be8907359df4c6 Biju Das 2023-03-30  663  	case
> COUNTER_FUNCTION_PULSE_DIRECTION:
> 0be8907359df4c6 Biju Das 2023-03-30  664  		/*
> 0be8907359df4c6 Biju Das 2023-03-30  665  		 * Rising edges on
> signal A (signal C) updates the respective
> 0be8907359df4c6 Biju Das 2023-03-30  666  		 * count. The input
> level of signal B (signal D) determines
> 0be8907359df4c6 Biju Das 2023-03-30  667  		 * direction.
> 0be8907359df4c6 Biju Das 2023-03-30  668  		 */
> 0be8907359df4c6 Biju Das 2023-03-30  669  		if (synapse-
> >signal->id =3D=3D SIGNAL_A_ID ||
> 0be8907359df4c6 Biju Das 2023-03-30  670  		    synapse-
> >signal->id =3D=3D SIGNAL_C_ID)
> 0be8907359df4c6 Biju Das 2023-03-30  671  			*action =3D
> COUNTER_SYNAPSE_ACTION_RISING_EDGE;
> 0be8907359df4c6 Biju Das 2023-03-30  672  		break;
> 0be8907359df4c6 Biju Das 2023-03-30  673  	case
> COUNTER_FUNCTION_QUADRATURE_X2_B:
> 0be8907359df4c6 Biju Das 2023-03-30  674  		/*
> 0be8907359df4c6 Biju Das 2023-03-30  675  		 * Any state
> transition on quadrature pair signal B (signal D)
> 0be8907359df4c6 Biju Das 2023-03-30  676  		 * updates the
> respective count.
> 0be8907359df4c6 Biju Das 2023-03-30  677  		 */
> 0be8907359df4c6 Biju Das 2023-03-30  678  		if (synapse-
> >signal->id =3D=3D SIGNAL_B_ID ||
> 0be8907359df4c6 Biju Das 2023-03-30  679  		    synapse-
> >signal->id =3D=3D SIGNAL_D_ID)
> 0be8907359df4c6 Biju Das 2023-03-30  680  			*action =3D
> COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
> 0be8907359df4c6 Biju Das 2023-03-30  681  		break;
> 0be8907359df4c6 Biju Das 2023-03-30  682  	case
> COUNTER_FUNCTION_QUADRATURE_X4:
> 0be8907359df4c6 Biju Das 2023-03-30  683  		/* counts up/down
> on both edges of A (C)  and B (D) signal */
> 0be8907359df4c6 Biju Das 2023-03-30  684  		*action =3D
> COUNTER_SYNAPSE_ACTION_BOTH_EDGES;
> 0be8907359df4c6 Biju Das 2023-03-30  685  		break;
> 0be8907359df4c6 Biju Das 2023-03-30  686  	default:
> 0be8907359df4c6 Biju Das 2023-03-30  687  		/* should never
> reach this path */
> 0be8907359df4c6 Biju Das 2023-03-30  688  		mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  689  		return -EINVAL;
> 0be8907359df4c6 Biju Das 2023-03-30  690  	}
> 0be8907359df4c6 Biju Das 2023-03-30  691
> 0be8907359df4c6 Biju Das 2023-03-30  692  	mutex_unlock(&priv-
> >lock);
> 0be8907359df4c6 Biju Das 2023-03-30  693
> 0be8907359df4c6 Biju Das 2023-03-30  694  	return 0;
> 0be8907359df4c6 Biju Das 2023-03-30  695  }
> 0be8907359df4c6 Biju Das 2023-03-30  696
>=20
> :::::: The code at line 602 was first introduced by commit
> :::::: 0be8907359df4c62319f5cb2c6981ff0d9ebf35a counter: Add Renesas
> RZ/G2L MTU3a counter driver
>=20
> :::::: TO: Biju Das <biju.das.jz@bp.renesas.com>
> :::::: CC: Lee Jones <lee@kernel.org>

