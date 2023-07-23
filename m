Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2131.outbound.protection.outlook.com [40.107.113.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAEB7F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 11:42:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mO6ppqK6dXecqJIkcFuC7GYKYCIkIMgKiHg6jQbISVhDA+sGeJrfBRg8E+Q6NCLg/nMjOn0sT7hcU73lzAx0GgiIAgPlcPIpQnIs1bGPWp2sCkNOAsKuY+bgFRJ+A9FqTwxZfE6r38xaEuxL5KTHMRI4lHD/b8Z4itSDuaMu2yXTQyahap96rgSyJr3kGJ00W0cXgGtNTF0DrGt5+59v0SfMGSPDQMSVPI9tQOU2/DYpRC8kH45lOObQ/sisFYouXaAIfniH15bQVzr0d7vyOeSNEnIC10EEMr8oDfERBTaSmyqszXA8FX5Mzl1cB0nG3D6Idg3emoAgABuUDA7F9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hre8HkyG546k7hy+2lDr/GwrfoQptIES4+xjw+j7tuo=;
 b=ZpZywEw0cxfFfIce0Lyf5oD4JNcO8/5asEvWaxhgSdv25TJLreFnbux2eio1U08laekNmc1xmgI6CXgMlRlqrKoByDRFvMTi53jC9EkSogfrHfkxMQiHw/p94lmKC878myM7TiIJh/nMYsJrUloiVLSpVxRcFjqhmpOa8gzI0E0IxFbawKCQ+nyknZ9OR/QSNgjRw0a9+bJOWjIHnCaIPwGoVjxet4D0OaspULDaIG2PajG9yojkCP8MCDNiln9f6PPEfTEg4fWwWgeIRTgadigCjnv3dCU/hy4sL0IodHXvH6ePLtvKWulbH+o8sI8GdEx/Yz5fdLNVcNk9wAIbig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hre8HkyG546k7hy+2lDr/GwrfoQptIES4+xjw+j7tuo=;
 b=L8Hq2QnzUqUJaLdiLL8WrnIy/gEARbhbLDkDSEK7TGP84K1u4jA0dIRu7yOGD8zSs1TWGr3QnGeXrXuoYVWC3PUPmfBUUfGZfagEsFUXJdy/pH5kHe3asnJ/Aeiy4nucQs1GiEXD8tcur2XWBOyDRRY/Wk30yDpwdjTk7ijTD8k=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB11425.jpnprd01.prod.outlook.com (2603:1096:604:245::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Sun, 23 Jul
 2023 11:42:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6609.031; Sun, 23 Jul 2023
 11:42:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZvUDvgs8MHdOqQUa8bS1k2CYM0q/HNzIAgAADg8A=
Date: Sun, 23 Jul 2023 11:42:21 +0000
Message-ID:
 <OS0PR01MB5922E55E73347D51F937DF75863DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
 <202307231900.3fDdJkXn-lkp@intel.com>
In-Reply-To: <202307231900.3fDdJkXn-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB11425:EE_
x-ms-office365-filtering-correlation-id: 9094c69a-87e1-4778-8112-08db8b71e025
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VaqkSNlB1DN05Dybmr79D+PC4fGQSNutF8OHGRkMqOyP3uZEGwVhH63NEopv6LYQgDmsEfW0EWrtRSE0GFOOuZq7jT1Qpn09RiP3G+zI5usDF/mIIp5rME8MIXzjFL/Iox0loS1YgII5thv78CwekZuvvxJ6nXUzyi3SnQKyS5P2MmhU86qy4TjZ9p60VUCknONZjjGhSja58ErxSVomFDrUwFqHxqtOt+PQYD9DzYmWUtFe88Vsw46L5sVu8pLbCKyPhLRHp8IfMx38PReakGdwXCSR4iptdMnmOnBEuStSb7DJ7z+uCy99jIDOJRY/qDHKuoBsnRFI/yDyEpx7jjJDwfF4EJU7esaQS6wn5g2SaKgHAyO9vPl/C5qGR7mXojLRiTEUH9A3AS+sAvrlbyYEWApapKiOJ8T+sPj334wRS7/hjWgJnymKtz4h1GyG0K/9WDLmqqW1Z4FdDb/oRrDn5l13lwcHRRXU7IC+ej2w6tsIboREiWg0g+mZuWgXUakr4kd8PLVa5wSO1eox1z4gdJ/C1MpFx45PNg7Gh1KYnnX3qO/kRhv7jlsD6YLff2e0XYgiTBB2khyOmPXOjSypsFR/lW8Qfzt/ul7JRnYQ042feUtvz696Hc84Ng9W
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(33656002)(86362001)(38070700005)(38100700002)(66556008)(66476007)(66446008)(64756008)(478600001)(6916009)(316002)(41300700001)(66946007)(76116006)(4326008)(5660300002)(52536014)(8936002)(8676002)(9686003)(7696005)(2906002)(71200400001)(26005)(186003)(6506007)(122000001)(55016003)(83380400001)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jYbeIIRfqgZ8sbnKAXvERniDzEvDosKOCLF8v6ZfdJTK6KOOEVpW/8h2JI1C?=
 =?us-ascii?Q?nclA6vo+O540isuayPig0uGpeBAgWqfqRkZmNbG9Ra7fymkvYxPRTiDtEQq8?=
 =?us-ascii?Q?/Ws9GFESvfrdFQKc3Dx0yVEeteQqavKZhAyr/RqkStLtL7lUF4fS9amlUcUI?=
 =?us-ascii?Q?N3j08rQHx2wmpg2g87mTqkmgcvflUgk/KgfxVW5j2c0vr4mm/BNcSOO+Vgva?=
 =?us-ascii?Q?r8VrmCyUY/PFPvYlo6+6yxp6+vLaiItaLYMlokfBhoRlFxtXienAJWSbwH6M?=
 =?us-ascii?Q?0OkeAoLDUhnBQR8HUVHWiHj5F52Pp961IKQix1HrjxgOaQyVcldBk0O/WVxv?=
 =?us-ascii?Q?OOODJ5AIP0MVDYQfZFnfLB9Gl5Tvps3iAQ6W/VPPWqqQYqlpVQhHhldg/1sM?=
 =?us-ascii?Q?6Y+3ggnPVWUWRTwEB0usXGbi6MgrNi/ZEKHZI5n0pe7g5BdpeJ0HurPED/98?=
 =?us-ascii?Q?1oJHvtw7hDMAtg07ekucLsxRSNL1Z6VAVdtkoqFi1aZnOx3GYC7gJlBTfeMP?=
 =?us-ascii?Q?j8PvtcyBcHFk0RpZ9Q1gBkc9q3XBuSE3cC9kxza3TEZbI4+8krmhOMKvrhdA?=
 =?us-ascii?Q?LP5OEN0RgBP91sCwbklnqbfuI69bGUk4czqxNwegT5vuCo4yR/EK3auMw9+I?=
 =?us-ascii?Q?8U15tkL02BbJYUBGwNj8Bl/ZU3pOKxRSXdOZwLlgrv4FP5QVgEdqrkcrpRAJ?=
 =?us-ascii?Q?VKw3EG13Y2k/0i9q8M6PxeEEYq/4ivAgdpHIGNQyADz/MWRQOV95TEz+U7MZ?=
 =?us-ascii?Q?tjSNwd39yHAm8jyYriXk9q/RAnYRc7wyzdxzLR5jwJgc7/r7mf5NgnjaH5Jo?=
 =?us-ascii?Q?NkqwZPbamr+Yk3NlXm9E5LwgVW/pIAK8PHgchQ6oycufFBE1ZWu5TPIsWzYH?=
 =?us-ascii?Q?dII+IME6UPRuWlaQi11nho4AQTXdPkijUWiSvQRWsLaxYAHFcYSyQ49cLJ1i?=
 =?us-ascii?Q?d2DFAq0uPXFhGz9NYX0xAMV6Fir8otyAcQwXBV/ItMOZdQ+dfRLbILcDIwB7?=
 =?us-ascii?Q?yUYDwrTzEurF8kFwyRZmeP39NnGSMbEIzeuiXsdGgJ2SiTjH2+IU6fqQZ6h2?=
 =?us-ascii?Q?WRcledSqcV1OuUCL70j9JwLA4zxQokqnXeZwNRbfAtqCU4Xos9vlK8cMk9CY?=
 =?us-ascii?Q?8YWMcs2xKXm3kphyyp0SNqTw6WrEdpoBv148y7qEksebiqoZowPNkREmfTAD?=
 =?us-ascii?Q?LQYDuiBuLvXg3YKRpJZRbsddZJB2xTXXyjCNhtWSkKOhkncTrEAveQabwnFa?=
 =?us-ascii?Q?SyXS1yW49tZKvOqw5Uh+UkBpuc+avqq01Ss/YbAf5/3dedpaPaROmKbNyjbG?=
 =?us-ascii?Q?lKy8+1tqIIo0RDSBITcR8c6+q3f4MO5EwOJkHdR43MzkGNuYuL7tIWdPcvuu?=
 =?us-ascii?Q?ZUcKbVUSdHOQrI+WkJkfcoZg2drPy2y7NPIVl4tP0fmFTnugI+WxQk3bKyv2?=
 =?us-ascii?Q?zVTDK2K46vP4bu+b/vYK+vIUWR5FZaiSKcHbeu1TwlTRnGc0PGQx2VrtFOIQ?=
 =?us-ascii?Q?BbBHqX3Y8lDQLTo9qSPc+fjMp4ZJZfYw2LBps/5EyC8fXKcven4rYkQwKePZ?=
 =?us-ascii?Q?wmlGyuS4FrDqwbeKYruBjIoNdIQr6HOvInpmZf1D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9094c69a-87e1-4778-8112-08db8b71e025
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2023 11:42:21.0690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r391cdaQIab+aVHlYmMm3GTmUm5ZyvAwZ1fYm/QW/UpT7KE6bC/qeyrsHBFpbhwiO/VxkJE2WRTGIFyMYubIY36KldoVrusD99L63jC39+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11425


Hi kernel test robot,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Sunday, July 23, 2023 12:29 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: oe-kbuild-all@lists.linux.dev
> Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data()
> callback
>=20
> Hi Biju,
>=20
> [This is a private test report for your RFC patch.] kernel test robot
> noticed the following build warnings:

> patch subject: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data()
> callback
> config: sh-randconfig-r023-20230723
>=20
> compiler: sh4-linux-gcc (GCC) 12.3.0
> reproduce:
>=20
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> |=20
> All warnings (new ones prefixed by >>):
>=20
>    drivers/i2c/i2c-core-base.c: In function 'i2c_get_match_data_helper':
> >> drivers/i2c/i2c-core-base.c:126:16: warning: return discards 'const'
> >> qualifier from pointer target type [-Wdiscarded-qualifiers]
>      126 |         return (const void *)match->driver_data;
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/i2c/i2c-core-base.c: In function 'i2c_device_get_match_data':
> >> drivers/i2c/i2c-core-base.c:141:42: warning: passing argument 1 of
> >> 'i2c_get_match_data_helper' discards 'const' qualifier from pointer
> >> target type [-Wdiscarded-qualifiers]
>      141 |         return i2c_get_match_data_helper(driver, client);
>          |                                          ^~~~~~
>    drivers/i2c/i2c-core-base.c:117:59: note: expected 'struct i2c_driver
> *' but argument is of type 'const struct i2c_driver *'
>      117 | static void *i2c_get_match_data_helper(struct i2c_driver
> *driver,
>          |
> ~~~~~~~~~~~~~~~~~~~^~~~~~
>=20
>=20
> vim +/const +126 drivers/i2c/i2c-core-base.c
>=20
>    116
>    117	static void *i2c_get_match_data_helper(struct i2c_driver
> *driver,
>    118					       const struct i2c_client
> *client)
>    119	{
>    120		const struct i2c_device_id *match;
>    121
>    122		match =3D i2c_match_id(driver->id_table, client);
>    123		if (!match)
>    124			return NULL;
>    125
>  > 126		return (const void *)match->driver_data;
>    127	}
>    128
>    129	static const void *i2c_device_get_match_data(const struct
> device *dev)
>    130	{
>    131		const struct i2c_client *client =3D to_i2c_client(dev);
>    132		const struct i2c_driver *driver;
>    133
>    134		if (!dev->driver)
>    135			return NULL;
>    136
>    137		driver =3D to_i2c_driver(dev->driver);
>    138		if (!driver)
>    139			return NULL;
>    140
>  > 141		return i2c_get_match_data_helper(driver, client);
>    142	}
>    143

Ok, will update once there is any feedback on RFC.

+static const void *i2c_get_match_data_helper(const struct i2c_driver *driv=
er,
+                                            const struct i2c_client *clien=
t)
 {
        const struct i2c_device_id *match;
=20
@@ -143,7 +143,7 @@ static const void *i2c_device_get_match_data(const stru=
ct device *dev)
=20
 const void *i2c_get_match_data(const struct i2c_client *client)
 {
-       struct i2c_driver *driver =3D to_i2c_driver(client->dev.driver);
+       const struct i2c_driver *driver =3D to_i2c_driver(client->dev.drive=
r);
        const void *data;
=20
        data =3D device_get_match_data(&client->dev);

Cheers,
biju
