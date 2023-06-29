Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27805257
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 07:29:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUN3vo+AkeaTyyrmO/z9t057HO+uj2RXgFuaHVz/DfAWrFhaybRwGOXP9Awxyj+sZBa7XxT47dOPnkLI7gQD1lArSuoVIa9buwWh8X3KSmUVZScWJxxmfj36bwTkQYc2iIyHyBA5D1yFFM+ByjS23r9/GXu4QFfPhN4Rgv0nGV4uLF3/TRNrEtCUOvO66HpzsALHHpfckn5faiFon6uGOz/Na0gK5ji4PK+ZWxlJOuaHDFjW5xmaIKe2SfaKQkeDJN/qDS1WKm4/kjuKdcvoIbC3ZkeY6Yl128qrs/BhUmcvaBGLJunAX9UnEscgzf631QFufdkpiG2Q9iFiVVgaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvQXyl1qBM2Hp82JqiKVAT9TQnbYeMocEqlocOhHrrU=;
 b=KlvqLkSzXFDgDaVMSbZ2p0H5mgfZ4DDDmbb568+9rat5NaiXJwr7RR6esL0n9bCM55Iu5EOJKZ2+cuvxlYhTtI2SCpufxsuFW2bL6Jz7v5BvAppAltGQpcWeZVeIp0kXcQmkQ9dG6sVZkKGnaEvqN1YWsXSxosjElznXV7377L7M8lhbt9cedjc3gP67iyRlg4c/zWyz7l7z2TZQtGEgCO5yq3L1ZEvTZDhcblTatK2HvvPZRDglYPP51wWO76Ki1QwEW5HULHeEJqFtvyCgdJF08K1Tp+ylTGCNQe+LWDp/9lraIYcQlJL5Ecz6vDSTRhkOX5u9CGF/tddCDZh6wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvQXyl1qBM2Hp82JqiKVAT9TQnbYeMocEqlocOhHrrU=;
 b=k99vyLAaOgiv+PvmdGEDm2i6oT+PrJvQqotpFSnkDjDdXCLQWxKRu7JOsm0Mm+s/NPelgE8NbEtzM/ivYMxKncb5tzQdPGY/+H/A1LBpkkt26CxUOwAOl5N1DCFpTyq8slFRwx9f3TWXCd8UZpezpIJ0p7oRZekonay/jr4SRTs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9448.jpnprd01.prod.outlook.com (2603:1096:400:196::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 07:29:41 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fc77:6148:d6a:c72b%4]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 07:29:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Mark
 Brown <broonie@kernel.org>
Subject: RE: [broonie-ci:filemf5lkb 2/4] drivers/regulator/raa215300.c:55:
 undefined reference to `clk_unregister_fixed_rate'
Thread-Topic: [broonie-ci:filemf5lkb 2/4] drivers/regulator/raa215300.c:55:
 undefined reference to `clk_unregister_fixed_rate'
Thread-Index: AQHZqgKsCl5CRCE1CEisEm8VEt+4Aa+hYl3A
Date: Thu, 29 Jun 2023 07:29:41 +0000
Message-ID:
 <OS0PR01MB5922761DDA1985F6837429518625A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202306290452.FCbqwB6t-lkp@intel.com>
In-Reply-To: <202306290452.FCbqwB6t-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9448:EE_
x-ms-office365-filtering-correlation-id: 89beb659-2983-4114-87b6-08db78729a22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YBUXenKrB9p8EYAoYevyQcEZ0aJQhvSDiU2W9VteU+e2mCqX6IVjttamqWRknrVUL6QQ1vLApqCIJCaZCwQR2vN8CEcu7EB9AT2+YuPeAQU+kQ4lWzs/Rn5teCWOl/1b+OOkF/ZWJzMGdfiC1O0Ope9HxZOwLD/wqKREImT9/lJ9yMAX2HndJpYQT4gLz5rT59sql0W7e7K1qpMlZxv37hvEb1O7E/oB3RMK4uarEAA4tBWIyf60KXqHqiF4SpQoI9YUGRi9EFQZ/vpG/J7mtRqOb9Y0YV6CoEQCXHzFVsKiPJetFd+cksQvisywDeyrETfxNkI2fg73m80D56f6fhOn7wdlLoQduSSknRvyzdC0aQefM++nyKBcgwtFt4p0J2p95udfZ4rSM0XAkuHmpEAA4+QQSjjmuIsBOgP2j222BgNKBWB0SOmecuKtwslCRzdEHJQeTUZDZgQCt+tQsgNWvGkv6YqvD5ACoXsZ+kHK1ZffOxEnJbRAUbE4xkmgScw8sqZyazG80rpdcJiMIR6M3EX4YdNd7rXc6fkDkI4+PTY3oJOLXbmstpsINgDrXrrvjKYwErfpqWLGX2j/G7eYO5xx3lJSdgyxLXz05+Ek4ygmh18L7a+Kxr/9pGvVk6NGHF7ylMkuI2GQSyvy03sJxOoj6hPzHzsEqMrOnx8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(5660300002)(6506007)(52536014)(33656002)(64756008)(66556008)(316002)(66946007)(66446008)(478600001)(4326008)(66476007)(6916009)(76116006)(8676002)(8936002)(86362001)(2906002)(26005)(9686003)(966005)(54906003)(55016003)(41300700001)(7696005)(45080400002)(186003)(38070700005)(71200400001)(53546011)(83380400001)(38100700002)(122000001)(81973001)(309714004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5hS/Kh8ei/8fIRO5p1hRHsmahJGZIAPM4L8dYRA1zHq+D6/hWHiRUEXNfYom?=
 =?us-ascii?Q?TwT1ZKurskYxFt5mIyGQYitSVwrFCd/qGHt6+qGvlFL7VuVpLZjRNEEzhU9Z?=
 =?us-ascii?Q?rHSWLw66f0Va+zjak95L0JYK3e050DSCnaoRhVAlnoF5w7jnyOBzmb28uV+b?=
 =?us-ascii?Q?YMVK4OlH4bAP3mBrbzXoZXynls1uql37VKj1PKe8tcjZ22X/I/ktYBnQcW3P?=
 =?us-ascii?Q?ryR56cwehZZgz0dps56w5EeeeYgGunlTxAVc1dlAFjCfQW6qO3/EQij7u/aF?=
 =?us-ascii?Q?dKKhJyyG7l/aqAIa5dsceDCWCi2XKjWkLcylWIxBjX/JNA2H2kA2zDKwHApz?=
 =?us-ascii?Q?60CxF16RC5WuBGLeEau3Acjq//36znUjlHbdhbv5nhbBUW9hoMPP1/xQGrsx?=
 =?us-ascii?Q?fo2Z7DH/hfWB8UrufqP5MSBbmd91yhr9kwqg0v4qUd7dfIS3u24ptuG6wiCs?=
 =?us-ascii?Q?ddti0kr2RASsk6/sXQFGsIoj9iz4EFny9TYkW8tu5Z2V6UfGPTzEBNpishgi?=
 =?us-ascii?Q?Qt8jdhRaQISruQF7VNfVVeFcd/Tdvjae88cmrp40kyDcK4J1dYtBiGZWsA/q?=
 =?us-ascii?Q?anltVAe6/9xPP/9gr8MniVKZZKMbNoTvwu35RjLAanyFiDa7DuoJlOvx2NY2?=
 =?us-ascii?Q?StHZUvrgJrAdNWRm9/jNz8ZTf71mZtmW/ekeVUccyCx1LXKo33BDOTumEVDx?=
 =?us-ascii?Q?mzvQGbWfJsNtT0UNWhAPxAUlckVOamdITcqhim3qJFb050X3W6BUP5WubbYv?=
 =?us-ascii?Q?QJ28P5h6nIC/TPmUPU6dN3z+uyWkWRdRwwhcxt/hNzY3wHiqHiiuG0LD+s9i?=
 =?us-ascii?Q?91b5RqV0R6DDqi1PVdUzzEOJhTPYtVG66K1bfkCJyHfyrFKnVI6SCrMbEKjq?=
 =?us-ascii?Q?wciEpI+bVQxqxfpgtuSNymT9VOvo9GiMkam1s1YfGUwBrwWVKVU5dzJY13Xo?=
 =?us-ascii?Q?aV1tzSJq6fbiml0VuOzXWTiQJvlutGtaHKfVj2rZZJJHMVxKUFBIkQJ0GXxL?=
 =?us-ascii?Q?+g/dC0k4pV4zFIjAT53HwiPxF2Vo0HP0bQX8QldylwDEN7SCMMgIbKYwdIQm?=
 =?us-ascii?Q?JTk3DLJCyU19wDPHcj4J/A84UHeBJmatsnxpwxMn92y98rhw5+6zNVAQTixZ?=
 =?us-ascii?Q?Y05TCRaXiVTh3UlVO0mgMaI149D1wvuEpEePQtyeKAqnZK6orr+uWT1lXmwD?=
 =?us-ascii?Q?NvhjvfzWesxEigof7w7bD00ZI7/JwAVYZxSCmvXlBK4dlb2S8ADMBa+NlmC9?=
 =?us-ascii?Q?v/eOQQLmzyBj3IX7w5X8J+gEMXFxry4T0TmpBC5pZaiIerwB1lM6GvoSrjEm?=
 =?us-ascii?Q?1KvYGr/QmuEpekktC3fkk1emHcsEW5gQ0GapxT1yO5Sgb7hNZxOWpoNjlzXL?=
 =?us-ascii?Q?D2juuyWlROiYEkOQI0iWQ3+Z7rgNgIqHvZ05MIZSiYrTQVmB7pl6sYVKUfik?=
 =?us-ascii?Q?uX9oxpjpn/kj1ZWRahtgp3U6MYYlx0DgDZwUZMWcnhpbNMCdheFiv5gxR37G?=
 =?us-ascii?Q?pVHCuJnMTQxpxOTK70HjM7iKuOAqgf/mik6r1lSE3rA5bmGOI11JOhvCu6yB?=
 =?us-ascii?Q?oq9K0vcg/QLEMADOJIxFyoCJMgrEIYrP8zrqe9i+?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 89beb659-2983-4114-87b6-08db78729a22
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 07:29:41.0515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UN7wh3/hoveW7uwSB3QVN3YHpJ3tqvX1J8lbvm3wOWtV/nOr2eL8m/3vYc4MAhE1lTF7Cb8qUc+AX+qLkQctOsJ82LcGsJTX2To7mdGvWoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9448

A patch for fixing this issue already posted[1]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2023062817=
4004.63984-1-biju.das.jz@bp.renesas.com/

Cheers,
Biju

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Wednesday, June 28, 2023 9:53 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: oe-kbuild-all@lists.linux.dev; Mark Brown <broonie@kernel.org>
> Subject: [broonie-ci:filemf5lkb 2/4] drivers/regulator/raa215300.c:55:
> undefined reference to `clk_unregister_fixed_rate'
>=20
>=20
> Note: the broonie-ci/filemf5lkb HEAD
> 6f037a89263ba15691af03418051f0c7e0c14341 builds fine.
>       It only hurts bisectability.
>=20
> All errors (new ones prefixed by >>):
>=20
>    m68k-linux-ld: drivers/regulator/raa215300.o: in function
> `raa215300_rtc_unregister_device':
> >> drivers/regulator/raa215300.c:55: undefined reference to
> `clk_unregister_fixed_rate'
>    m68k-linux-ld: drivers/regulator/raa215300.o: in function
> `raa215300_i2c_probe':
> >> drivers/regulator/raa215300.c:133: undefined reference to
> `clk_register_fixed_rate'
>=20
>=20
> vim +55 drivers/regulator/raa215300.c
>=20
>     50
>     51	static void raa215300_rtc_unregister_device(void *data)
>     52	{
>     53		i2c_unregister_device(data);
>     54		if (!clk) {
>   > 55			clk_unregister_fixed_rate(clk);
>     56			clk =3D NULL;
>     57		}
>     58	}
>     59
>     60	static int raa215300_clk_present(struct i2c_client *client,
> const char *name)
>     61	{
>     62		struct clk *clk;
>     63
>     64		clk =3D devm_clk_get_optional(&client->dev, name);
>     65		if (IS_ERR(clk))
>     66			return PTR_ERR(clk);
>     67
>     68		return !!clk;
>     69	}
>     70
>     71	static int raa215300_i2c_probe(struct i2c_client *client)
>     72	{
>     73		struct device *dev =3D &client->dev;
>     74		const char *clk_name =3D xin_name;
>     75		unsigned int pmic_version, val;
>     76		struct regmap *regmap;
>     77		int ret;
>     78
>     79		regmap =3D devm_regmap_init_i2c(client,
> &raa215300_regmap_config);
>     80		if (IS_ERR(regmap))
>     81			return dev_err_probe(dev, PTR_ERR(regmap),
>     82					     "regmap i2c init failed\n");
>     83
>     84		ret =3D regmap_read(regmap, RAA215300_HW_REV,
> &pmic_version);
>     85		if (ret < 0)
>     86			return dev_err_probe(dev, ret, "HW rev read
> failed\n");
>     87
>     88		dev_dbg(dev, "RAA215300 PMIC version 0x%04x\n",
> pmic_version);
>     89
>     90		/* Clear all blocks except RTC, if enabled */
>     91		regmap_read(regmap, RAA215300_REG_BLOCK_EN, &val);
>     92		val &=3D RAA215300_REG_BLOCK_EN_RTC_EN;
>     93		regmap_write(regmap, RAA215300_REG_BLOCK_EN, val);
>     94
>     95		/*Clear the latched registers */
>     96		regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_1,
> &val);
>     97		regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_1,
> val);
>     98		regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_2,
> &val);
>     99		regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_2,
> val);
>    100		regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_3,
> &val);
>    101		regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_3,
> val);
>    102		regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_4,
> &val);
>    103		regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_4,
> val);
>    104		regmap_read(regmap, RAA215300_FAULT_LATCHED_STATUS_6,
> &val);
>    105		regmap_write(regmap, RAA215300_FAULT_LATCHED_STATUS_6,
> val);
>    106
>    107		/* Mask all the PMIC interrupts */
>    108		regmap_write(regmap, RAA215300_INT_MASK_1,
> RAA215300_INT_MASK_1_ALL);
>    109		regmap_write(regmap, RAA215300_INT_MASK_2,
> RAA215300_INT_MASK_2_ALL);
>    110		regmap_write(regmap, RAA215300_INT_MASK_3,
> RAA215300_INT_MASK_3_ALL);
>    111		regmap_write(regmap, RAA215300_INT_MASK_4,
> RAA215300_INT_MASK_4_ALL);
>    112		regmap_write(regmap, RAA215300_INT_MASK_6,
> RAA215300_INT_MASK_6_ALL);
>    113
>    114		ret =3D raa215300_clk_present(client, xin_name);
>    115		if (ret < 0) {
>    116			return ret;
>    117		} else if (!ret) {
>    118			ret =3D raa215300_clk_present(client, clkin_name);
>    119			if (ret < 0)
>    120				return ret;
>    121
>    122			clk_name =3D clkin_name;
>    123		}
>    124
>    125		if (ret) {
>    126			char *name =3D pmic_version >=3D 0x12 ? "isl1208" :
> "raa215300_a0";
>    127			struct device_node *np =3D client->dev.of_node;
>    128			u32 addr =3D RAA215300_RTC_DEFAULT_ADDR;
>    129			struct i2c_board_info info =3D {};
>    130			struct i2c_client *rtc_client;
>    131			ssize_t size;
>    132
>  > 133			clk =3D clk_register_fixed_rate(NULL, clk_name,
> NULL, 0, 32000);
>    134			clk_register_clkdev(clk, clk_name, NULL);
>    135
>    136			if (np) {
>    137				int i;
>    138
>    139				i =3D of_property_match_string(np, "reg-
> names", "rtc");
>    140				if (i >=3D 0)
>    141					of_property_read_u32_index(np, "reg",
> i, &addr);
>    142			}
>    143
>    144			info.addr =3D addr;
>    145			if (client->irq > 0)
>    146				info.irq =3D client->irq;
>    147
>    148			size =3D strscpy(info.type, name,
> sizeof(info.type));
>    149			if (size < 0)
>    150				return dev_err_probe(dev, size,
>    151						     "Invalid device name:
> %s\n", name);
>    152
>    153			/* Enable RTC block */
>    154			regmap_update_bits(regmap,
> RAA215300_REG_BLOCK_EN,
>    155					   RAA215300_REG_BLOCK_EN_RTC_EN,
>    156					   RAA215300_REG_BLOCK_EN_RTC_EN);
>    157
>    158			rtc_client =3D i2c_new_client_device(client-
> >adapter, &info);
>    159			if (IS_ERR(rtc_client))
>    160				return PTR_ERR(rtc_client);
>    161
>    162			ret =3D devm_add_action_or_reset(dev,
>    163
> raa215300_rtc_unregister_device,
>    164						       rtc_client);
>    165			if (ret < 0)
>    166				return ret;
>    167		}
>    168
>    169		return 0;
>    170	}
>    171
>=20
> --
> 0-DAY CI Kernel Test Service
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b
> .com%2Fintel%2Flkp-
> tests%2Fwiki&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cbb4c6be333f4=
4
> 4453ee908db7819ce64%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6382358
> 24453179296%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dmhy1HIQMh6%2BGZMFZ=
0
> vKwkZskcXqL%2BHg6HBxsEm4rTjo%3D&reserved=3D0
