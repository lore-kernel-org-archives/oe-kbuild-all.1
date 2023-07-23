Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EB77F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 11:41:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRlg8XFm0GO3cC3xvl7yP2DRTDkHG+uNh/4ehsHWlypmitsHg2lK44CvQjOW9nC4raV/f4gxhRDl0scpKWt3WXsJ6lc46CHWfh7hFBVKP6kOGkGFRzmTasQhIQf17Nw8Dy27qk4a18iTWEerFffYlzhJQsJ6bXfYu8aC1tPm3EQXPlfheErp/uUAM9IKJ1BOUHKmoNZ85OKABbt+Tt4a8QjiHZWU3pOWdzfOP/fA4ypfWAMeOjMKxYzIMNs1OlQ/hrOsLaR4IJuUsJWqEJUKTk2unmDHlZqI8C5K87kEIu1A77N8q13yVOi35P2LfsW8sPxndQDgW7T2o5PlHqkLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNTA8WUPGSEUSKT81fdlbEIRJfk5Ul75FuAttv8c+EE=;
 b=B8Uzkx5KBWkuYgvfueV9lM88HEZ/B/oTSA/2BR0S4KQNAa9chz9jgzxJGOOZJ8nCr/DNBoJp9wP93kYHh6tHhmr2czcL5EkBBwr6KpFJ3rDGL7xBaBwGen+JTTyM+noEdDW+M8UTM7Dm5hX3LMawxyXXO0k2fErix4mIZf4pvk7P6LGoqB+vaEj0wKtAlGP4eiERjcS8FMLljsg1xVqcWFbtbcmA3Kfa3Cy+EppUNnvBn3CSmRk/PGaEsRjPXaq80NFNr9qVxYl6a56R5feiu63+pb8Ag54wu50qWwrFN2SAok8RG6y7bIQFebppBFwJtsNKgrX/IAlcq81odK6+UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNTA8WUPGSEUSKT81fdlbEIRJfk5Ul75FuAttv8c+EE=;
 b=r2R8qaDfdiIIhBhYX0Ztq5tZDxse/wAsbkZgfcEtA4tJiAuWF7iYXKOaNM37Jg5Iwa5Ip7BJ3JcLTh0ddpQ+BSAZ2T+WV8GY0Eb9+MfRM+1NvuPM1lWX1osMjHQbWmNzXo3P0T5b2XAqMo4YGHyfsA2tO3s3tl3/J2Fia+sVm2M=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB11425.jpnprd01.prod.outlook.com (2603:1096:604:245::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Sun, 23 Jul
 2023 11:41:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::834b:28df:28dc:7f95%7]) with mapi id 15.20.6609.031; Sun, 23 Jul 2023
 11:41:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Topic: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data() callback
Thread-Index: AQHZvUDvgs8MHdOqQUa8bS1k2CYM0q/HNFYAgAAFz9A=
Date: Sun, 23 Jul 2023 11:41:21 +0000
Message-ID:
 <OS0PR01MB59229839D8A2C3B4A5386D02863DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230723083721.35384-3-biju.das.jz@bp.renesas.com>
 <202307231907.FiS4VQie-lkp@intel.com>
In-Reply-To: <202307231907.FiS4VQie-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB11425:EE_
x-ms-office365-filtering-correlation-id: 3c691afe-2176-470b-cce1-08db8b71bccc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 evaiYPZnb8rInWuEiFdSPCpYdaWjVw4JSMJiqi7a2ispzVqSC4rm6dpZ6kyXCL0V4jd47byWqh8vGzRcfeCVm4FHj27QfAf+yA2RZtljKmYSzo6beo+j84Os0+Xtq446Z+w6+GbJFHo/bKbo7MjGs2gO8X8DgcgFWQjHf6H6MY1crGtlbFC2CRlnfEEau1iArlzH5Z2onvdcD9hbu2n+3h4MvFC0jbJPz7QcA6pAdkybi5YCh6aPp4pvpmM8GKS23jw3p6PeQEzwz6CiD895IOuC41NuLXfkfYnTVzpcaB6gKqCsd+2UnVCtkZSbpAJtT26lcig+LumsO1lwndcaSWJGH5jn2BxKX/9Fr2nuzJydw2eA1ADj66QVfR3rVMFqPsQpSgl2FSRYRZKjFSCtOIv+9Ceop7Y0XyD9L4CIcDuJHUn46MQ55FRPlf6iEm/L8UsJyla6/xWIR/KnaX/nyAO1iZ245ppmsNzEASohj/zF9qfdYZ6iK0QAla25FggqTx15RfsivqxerUcCTTRuYo0zsy/6XovGAX87l/9WeNsYoWXJ5MEE3hw0nexTegAd2U/vvUVCHIJKYVUMZEnU5z44m2/H66rdNP2mv5M3Oo7+VwAqkIk0KciO8jbPys91
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(33656002)(86362001)(38070700005)(38100700002)(66556008)(66476007)(66446008)(64756008)(478600001)(6916009)(316002)(41300700001)(66946007)(76116006)(4326008)(5660300002)(52536014)(8936002)(8676002)(966005)(9686003)(7696005)(2906002)(45080400002)(71200400001)(26005)(186003)(6506007)(122000001)(55016003)(83380400001)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TxjTsEdldTxXgZ+HBL9+ZQ2kqlr52zFqcdBby6BzcG1jhMOJi+8QD49Xx6N1?=
 =?us-ascii?Q?bjmJ8XUx5RPduzWNgdSaIQx+FP9W7ICXs269rLC+P3WBXdxdYkDQRzFNJYov?=
 =?us-ascii?Q?czzIgV+KN1tiNuI3JSOBve+bTOcjhXsP0S42Z3omCk3CduQPdwMEEWKKlGaO?=
 =?us-ascii?Q?rTw653fof4vwUBwoMdHE146t3Zc1TQ1laItSbsf9StD26lm5kBSYOZ7GdVaY?=
 =?us-ascii?Q?KAW69FHlBcOWSNHqRmTughQsmnqpXqIhTAH8EiCVDM0a46Cso068Y1t3V6Z9?=
 =?us-ascii?Q?TNa1YSPeEBpCMxuA1ZIwq06xhPnhtbrnva3NNr9kPte1UR9iBd9/t3nSsWp5?=
 =?us-ascii?Q?x1Pyq4AtmYUmCVRJnLxgC2lLqrhNT92UgDQ3zyk05SmgEg1nP0KT/49b17tf?=
 =?us-ascii?Q?Ss6NblPPxd54CMefHshMdVD5ZG+treXTSW8v5HkAjShKwBSZJaItKOLi1mwC?=
 =?us-ascii?Q?c56FbUJJZwd8yEIK57+aEgEC3CNA9IrtH9afpZiR7Qssy4YNjCQS1uiXfX2U?=
 =?us-ascii?Q?Ri3wtk/3Trx2W+6sAEdmVYu2/BuB0JNERcOQUw6OdDZP1VfH+k5dzZLTjkDU?=
 =?us-ascii?Q?Kn53O+836D34G1KjrUVK7o6DHmuU5w/7Vme8EvnsqXONY0S6dEo7LUgNdhop?=
 =?us-ascii?Q?zx1GFjnkNSZD+cfBwEi8qe3z1za9nN6sR0+B9SImQivqqnUJsEGncPGW1ZXH?=
 =?us-ascii?Q?sbhpCJB88sbtwMLEXlKsXbXYuh9ACr94Xlo2i1KT3f6OimCYi2nEhJ5FhubY?=
 =?us-ascii?Q?55RzyvYT3olFGEls6Fqb8DaIkaWZGhu02o5tpHvDsQ4SZ0rSkYHXRvF9KQtM?=
 =?us-ascii?Q?XSdkCqH+MYaVxrEi7Azmbc5WBVS6JcYNgaKnfxDdN7k7GvnkUhS2VF5CU6Ap?=
 =?us-ascii?Q?2Ntynp9Lv8vU1t437ExiYgV/o9/w0fW238nuAp95d0K8qg6MON8pNPjlIfKz?=
 =?us-ascii?Q?6QgkqQ2rhiRQmF6T6pQS+VVNEc0BelxhLD6Y7ggaNpnD8wwmQNRhY8CebI0Q?=
 =?us-ascii?Q?v0/3uK1s2Ee497O3FBiTRxLYPQZHCzjL+IUshpTtggovzmei6ySXzzYmWpWJ?=
 =?us-ascii?Q?9DQ+8/OfzaQUmXnXVUdWf3/YN4ZdU3OsnIpQrdRwWdysXLsfolXHdnxhbTom?=
 =?us-ascii?Q?QigFtVzmm8HqiCGMSRuOZIUVe1j0VEraXYm6/QkPNq+u3grvTuApv/CMNoL5?=
 =?us-ascii?Q?iwn0rx7eZjY22Kad4XLvgeBWUbkGfB8nBX8z/CwRvM4zr8w2tZt2F94iJ3dM?=
 =?us-ascii?Q?XXcHc98tiugb3zLQEo7qFdizVzqMVAvCIw1ctlt0PmU7YJ+mHm5MAqomKBTg?=
 =?us-ascii?Q?P2n0KxlvGpC8ORfTrAuZeoI7AOKCixG526i3ZogkyEpGkO59071XbYvzVMAm?=
 =?us-ascii?Q?IBGHEhGu3llTmXAlUmrwjhQ32JiwbNRzis0ZLZVHObtF58H3qHiB5Us34Tjo?=
 =?us-ascii?Q?bu7uua45ALOTX93u+sk+Tmn2SAersvKPeMMsPcPOL8dODEZADQE07oTfd9nN?=
 =?us-ascii?Q?xiaD67SV2ohh3dhg76JzpkprKh5XDD+6nQdSc21sLicLNCk5AY3bfFcANBWy?=
 =?us-ascii?Q?p7tNS4ffoVU5el9DVi2Qc4Hq3K/ZBDZPvqDqHP6c?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c691afe-2176-470b-cce1-08db8b71bccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2023 11:41:21.7928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LR9zJlZ34kI/osG8Tk3+EJrj9VdJmiY4PYLR378MZH+K0uHh/z/m63ialF6lTau2A6JTLsugpM+l7pNyuaAMOy1Y36rLKYXwMlqUNKQM8O8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11425


Hi kernel test robot,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Sunday, July 23, 2023 12:19 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: oe-kbuild-all@lists.linux.dev
> Subject: Re: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data()
> callback
>=20
> Hi Biju,
>=20
> [This is a private test report for your RFC patch.] kernel test robot
> noticed the following build warnings:
>=20
> [auto build test WARNING on driver-core/driver-core-testing] [also build
> test WARNING on driver-core/driver-core-next driver-core/driver-core-
> linus wsa/i2c/for-next linus/master v6.5-rc2 next-20230721] [cannot
> apply to sailus-media-tree/streams] [If your patch is applied to the
> wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
>=20
>=20
> url:
> patch link:
>=20
> patch subject: [PATCH RFC 2/2] i2c: Add i2c_device_get_match_data()
> callback
> config: nios2-randconfig-r033-20230723
>=20
> compiler: nios2-linux-gcc (GCC) 12.3.0
> reproduce:
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> | .kernel.org%2Foe-kbuild-all%2F202307231907.FiS4VQie-lkp%40intel.com%2F
> | &data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7Ca41dac8cc153434a166508=
d
> | b8b6e99e7%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638257079370000
> | 053%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi
> | I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Diy644qCgKSJ5WOIgu1q9DL=
b
> | w%2FZDcAdH6roPahE4L9Bo%3D&reserved=3D0
>=20
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
