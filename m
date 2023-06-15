Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FA16120
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 09:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1686822855; x=1718358855;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Gs7AKmzVkB+b+Kr9+GB4Iu3BUqWm6+MpVfujMFLYNRU=;
  b=mUvGhIYnVY6yvrUL16ZEFpE1YiZYSzkl0vFA3OHmOsvjOetVouIeS8hO
   8Vug3eQn3zX+Mdyoc8o+uYVKO7kMVHmYyhwBFm/On2sOUApDMFaQANW3t
   8ZySM0DGGMrd0iTEVAj/4K7zEmhPg3RRKzfB6XbzQE7PhDUK1zg4nMw7a
   wkKh0dFbS4sQq5uosPFgItm1etElIQkke8CdMrYtL/jKNQ9bT8AhkNqsC
   7FGAw1WMJCXK+NIThI023fuqWK9SfIuI9CAjw+v0peYbt9wCphqzzH8OH
   78cjByozITNGDhjlvMnEo7moA2j7bKeUuP+2yTgWuonBLfQ/Z7F1dq7sY
   Q==;
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
  by ob1.hgst.iphmx.com with ESMTP; 15 Jun 2023 17:53:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJrz8CRMx4wHnCMEUigvCYvrIQOn8rSZkuAER599tsfFcNK5t0x26jdssGjl/cHQmxDdwKOvNS0G5knKnehNonoMuSK9Fq/EbKhyzcxi3DNtnTFMeSd5ZmAhnJfCeDMSGY2HgcrQOsiucwGCgFzpnMrTbFLowOS3xZ5Ta6Dqy1dkcgo48tMz2FiaIq4JFCA7mfGoJKvBXJ7OTkil52an4CNMvwIZThF6zXViMR7ezqDi+bYyVeL20ULVaePKzp2m008fVS0e4DcfvR9DWvsuAMn0sX0FWLgnLYA5rWL7WeQ7rPGfWOitJkkVVOipuCXW5z37iztk3Kn6kHRyvcXOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=id3mmaF7z45taolIZW5I7iswJehAh28x2MgT0gAO9VA=;
 b=exYbUFq/QE45XrgE+hdHmEv1QbtLIW/EUliCFmM0aB5oFa/TLh06e4gRJuxDGlNmh/eLkBoj+qUd28aIEzLA8Md2vcCWyBNjc1XZ3gLZT9MRrgPM4OdIRawz9nPmWNgbLLOGm4oPTuwkZ8yEEacQ8K59ZKN+Q7KldD1y92IKzFNdKAto9lK2wWAF5R4BCZkrhwlnZlKzh4FGvAR3eWBhb4FmmNXa72x3+yXr8FEPJZggHJfpB5GlHy7ycAp/XtbkodQ8HdUvoukuGq/4D2eCKi/QbhlqL7qiBZ9bJ0hqeIwTD5aPYhHfeX/AVCIs0JU/saFtNv6iw+qpiAMXfOvaKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id3mmaF7z45taolIZW5I7iswJehAh28x2MgT0gAO9VA=;
 b=FlAeBeKculIrWsSPsFdjJ8M22sIkeIaCXe8bs/+zZ3kZt3Z27tMon8oaDi9thqxbvQsAK5LjpnKft2rZ+EOcmqF7NFamPPrgEnTpSpQLMRBef3jS8PlZ7hq5Yxwmf+R8LUWfNrN9hy2sYRLEUwe9kW+7u0jtiDsMWJNz/dRI3LI=
Received: from MN2PR04MB6272.namprd04.prod.outlook.com (2603:10b6:208:e0::27)
 by BY5PR04MB6771.namprd04.prod.outlook.com (2603:10b6:a03:226::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 09:53:02 +0000
Received: from MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::d8ec:2aa9:9ddf:5af9]) by MN2PR04MB6272.namprd04.prod.outlook.com
 ([fe80::d8ec:2aa9:9ddf:5af9%4]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 09:53:02 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: kernel test robot <lkp@intel.com>
CC: Damien Le Moal <dlemoal@kernel.org>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [mkp-scsi:for-next 70/83] ./usr/include/linux/ioprio.h:107:8:
 error: unknown type name '__always_inline'
Thread-Topic: [mkp-scsi:for-next 70/83] ./usr/include/linux/ioprio.h:107:8:
 error: unknown type name '__always_inline'
Thread-Index: AQHZn07AiQNJk1JS5UKX1Qc73bsGPK+Ln7qA
Date: Thu, 15 Jun 2023 09:53:02 +0000
Message-ID: <ZIrffaXbecwgjG7S@x1-carbon>
References: <202306151347.WblKhRwQ-lkp@intel.com>
In-Reply-To: <202306151347.WblKhRwQ-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR04MB6272:EE_|BY5PR04MB6771:EE_
x-ms-office365-filtering-correlation-id: 02c6bd0e-a7f4-44d5-9b7a-08db6d864f26
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0OmRcAbwwVbpTMHztzBYqG0wisuMpl97C0JV+oPfDSh6gHNqtRtap94xWVxBOYxpyBW/eBf4Mbp1vXdC5QnNlY8XqQpSyNq3QD08OvEXOzWaSKWPKkXi1Y4s2FUxCkSCgkFJovK914vyXMb1B5ZPLp4S9wvKUoMC1Pz59I/XlP6krs4o1uvFLgzU17TH17ju20rvvhSRA8dralZeCIRhFld3H8DKxJEu21J2pAdljrOOYmd8/ZZqp4Hx1Kh+F1JpOa6jnefEBLQdkkFzDMEpr6F+iOcCnAlmianbmPYgyMKIe0EsWtCxqHxma2Tl3ENo4h1MSC8sQsf7u3Gf23y14s5Qe9kVYUOZLc7CyEaxxm0mGBv2OTccvJsR0OdLo9NeWKwJaDPUQf7vTnFyKhRcu3LajUN0bfh6BFR0pEVHYKQkIHY6GwsFMlpnBbsD1LPXOWV3noK6AyuAdEsggV1j8SF6cToYyk4cmji+g+vsd5iSL0vyZV67n0cxiyomAT5DtrEo6K6vxdRyhPT/jEDSeWrQmMAdRWjZhcuPkr9Khja5VQR0xH8FQkFXZv/iA6xYAGh+lDFB9xMSzZVWQAhdo+h3lMzfEs1Ow7N1mVTeoSA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR04MB6272.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(2906002)(9686003)(26005)(6512007)(186003)(83380400001)(6916009)(66946007)(76116006)(66476007)(64756008)(66446008)(66556008)(71200400001)(91956017)(82960400001)(4326008)(41300700001)(8936002)(8676002)(6486002)(316002)(54906003)(86362001)(38100700002)(478600001)(122000001)(33716001)(38070700005)(6506007)(966005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mqOEusfLhOqLjmiW/vqV86d1PyOJKuphIdYRg/Jqxeo+7TjXEAOGwmOxe6Bu?=
 =?us-ascii?Q?oT+s/MI7fTxNnGjUcHAJaUh/NtRXvpv3pgq+SJQ6IVewhxCz0iEJf3peGAW/?=
 =?us-ascii?Q?ho5HO9l8qu+lx1t0sFirddpSE85+E7Qqoe+QlhnNq0l4ggNTQc64KX4aB3fn?=
 =?us-ascii?Q?q1QBKKZaULtQNR+lrxJBDz4SVlVxNI70hgNA9VWv8FVZGf9XenOEDd/NzsV4?=
 =?us-ascii?Q?aFNHmlUj8jPZIedfn5DR4VKYEOw0QwdCnDsRbf0Zx/ct2IBBk//hKalF7GsF?=
 =?us-ascii?Q?iVQOIgNbZE7w6bMHiYzV0paBKnqFyXe9KHSESbAXiGebyJg6gAQI2TToWY4v?=
 =?us-ascii?Q?GrcyrLBIikHnA8DKl53MwxcPB3fRYc3ro6LJcTRgcnIryBidWYeozwemQQgx?=
 =?us-ascii?Q?0MS3B1IgHTOuB4JEm7AqmX1gExhwfyjusE90tGmOjrIchwQAOs2u99opwgkp?=
 =?us-ascii?Q?gV0/flXvBaBG5vJ89hT8KZyY19wiViPIOClyFqwAvNvrr5lHg2V9emY8ca40?=
 =?us-ascii?Q?abSLJWpfl7anPxVyw41lSLuyi09+caVaUo1bkNYhLkau9VsfyXIaaas3kkD/?=
 =?us-ascii?Q?fxh5DVhJ78b3ScezVbCXnyuUGkELOlXmR9FJYZiY9emBwii5hTTmqsmYb8Oq?=
 =?us-ascii?Q?FL5s8h0WkS/GhYtPJzJ7GJo+/M6awkWE7xRvrXUcJYmtsebVzbD6HwPtHfPG?=
 =?us-ascii?Q?6j0VZdpE3FOgJvGzyPUA+PRXOsWuHdUy8FSIx7w5zDvIgump3UDYaGWirscu?=
 =?us-ascii?Q?zyVpJG6aEj0IBnqZAqSLMeFWGGh0u05tvwelZQxiQokqogcERCtWSjik05kO?=
 =?us-ascii?Q?P3WNZOK6BVfdE57js1mfaRe+m05Sy6gpgI5pyi+ezalCgD+wuIGS6Q2yvus4?=
 =?us-ascii?Q?ADryvRHi1xQo+N1kZFvvat4N280wqLJ2OEwS1g27rXGTilcSwTL4wXyysgmd?=
 =?us-ascii?Q?clbie7B3RahCSBfVRzl9PwdgNL0a0EXI73y6v3fuJSNIraiuNZvJ+H28/z2u?=
 =?us-ascii?Q?veNgxI6jJJ+n2UGlLFT6CA2faX9RAUykbm3V+5bEBKAmwviLlbA0ObYtpNGJ?=
 =?us-ascii?Q?HhoFTseHL4KoE6+hTlJgzsWoG30X+VVUOPbJmDFhWD9Zq3jAVdMPCT3lyJNs?=
 =?us-ascii?Q?uN1qJYUKwaFkvtS6u1PknIVE8MB5QEsjMB0P+sBSq+ZFZUguwbO1zc2eBN+8?=
 =?us-ascii?Q?Xe006lD21qTmLv51kbT/mr9DTjMxEzXxhzyz2+Bije69Zsp4YD8SNPMryt71?=
 =?us-ascii?Q?qtHd/mQm+SA35jhZSRFqTirIvHOjnkQc0taS4dQhvUJ1MwIHkWcEBERBPyoz?=
 =?us-ascii?Q?fLJAlI1kzBr4vc4cncTf8UJFbWjGDnQyDvQEHgOR5RFkKfxIVOhYS6+axdCB?=
 =?us-ascii?Q?MttidFb/vLhmL6PMfjqWEx0AEZr6DsTM+zFY8LpgEr1wIgOJPtSUYFYPdON4?=
 =?us-ascii?Q?4AObDFXWNnsO9w19ZH13az79STkDhwmYKWcShWo6uFTT0GZrguCFUZbDiHyx?=
 =?us-ascii?Q?jzzpLiIF8N1ElslrKUxSm2IHbFclWhLNT/bTatMIhzgc1JGVwnDGcIXXmw5d?=
 =?us-ascii?Q?Obj62I9tjNhxoCz+UO9V+gErTh0Bv5V/qUzxOL7GUpRsJE5iXwjESMV7Rrpa?=
 =?us-ascii?Q?MA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <707ED65487C62848946EAC3D1EDC61F9@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DxTKuOldxv6Vv/vtlfTTKqk4S2P9+uvnMYE9g+y2/LZkhGg6e3GXTtQE1kckGsDGnDYkudKMWKUt3fTAL1rBRCVWElcjTxXp7CTa4349kuqnFtVKMihprqSfq6yMGiTG5iIZtU2RF/CU+TLtlMHExSKLnLILzsVHPbhPfptlZ+xWKaVaIC38vFUwUdO6U+m0n5zqoXxm+zusZfQ7p7i1dqtf+wqRitwHqV96ITj1uUNVSzvP2aommyP/zjD/xyKIEyOfhzI7fftm2yP6IwixaC8prTqwxFukt7a8l9Tf7SpImHC71nYNOCxIvLJ8sf8sunHmfxm0mBp66tgrB1lCOh3FtS5+bK24g6IPXjHw3DFfGXd2FB3xgJmVCWb9pQ1M6khPOBc5T3UNSFk59k4QY4Ro+jIi4zE5zEWESiaeNbUK7kMcL/CrTcxRhuZ34+md5jT7+8F4taX9+X3BVmKcFCTNRCtLU73zDMPnXKwVNe6BmgEe8MX9TGNvtIbDiAUH7k5e9Z4a5xH0RR0WcGL2fJ9q8Fu0psHvzDPW6MbmjC6em9LP9TMiH/8sXoM8cTYqcV4TYEwKZy8QkKmX6ZY1soWE9oOwHprYkSuV2j98iwx8bigbp0DMOS6+jI7eH8eXyGahohOXgnrCSF1fZ8lSTVWkwfEBaCZXG2AfkuuXK8IJuLVMphKcFPuZs8zD7vUR89K6ULe2eIQFV+J2TKao895+2qJQFBYuM1fbJ7pSM6gCb36u6T2KCH0dSW1lm+PL8xRrprXDlIjpAND+C5O2qTLhQFVKtAQ5U/E7VAls/EjRiW0S566aH16UmLl9miRD4wrP8k1ITPsUnEs+QIQt7mvfva6LdMwyA8DXnTee9fvdEfIT320cz29WfpN7szYAcIRq4dkcn0sza204fwXPrA==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6272.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c6bd0e-a7f4-44d5-9b7a-08db6d864f26
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 09:53:02.3419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQzvbk8ltsIzl0NUmchv+ArypiyaG9WD/y4Osvwc8fR9C6yuW2Q8D9fDzkLo/+d4d3PLMMipj2ElEMpFOIkpqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6771

On Thu, Jun 15, 2023 at 02:00:21PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-=
next
> head:   aca416ac0b1fbe89d563f88cdb9884f986863d34
> commit: bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60 [70/83] scsi: block: Imp=
rove ioprio value validity checks
> config: i386-randconfig-i012-20230614 (https://download.01.org/0day-ci/ar=
chive/20230615/202306151347.WblKhRwQ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/co=
mmit/?id=3Dbfaaaa3d9d09974828dc5c5d44eb2657a65d6b60
>         git remote add mkp-scsi https://git.kernel.org/pub/scm/linux/kern=
el/git/mkp/scsi.git
>         git fetch --no-tags mkp-scsi for-next
>         git checkout bfaaaa3d9d09974828dc5c5d44eb2657a65d6b60
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 O=3Dbuild_dir ARCH=3Di386 olddefconfig
>         make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306151347.WblKhRwQ-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from <command-line>:
> >> ./usr/include/linux/ioprio.h:107:8: error: unknown type name '__always=
_inline'
>      107 | static __always_inline __u16 ioprio_value(int class, int level=
, int hint)
>          |        ^~~~~~~~~~~~~~~
> >> ./usr/include/linux/ioprio.h:107:30: error: expected '=3D', ',', ';', =
'asm' or '__attribute__' before 'ioprio_value'
>      107 | static __always_inline __u16 ioprio_value(int class, int level=
, int hint)
>          |                              ^~~~~~~~~~~~
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


If we really want to use __always_inline,
I think that the uapi header should include:
<linux/stddef.h>

see how e.g.
include/uapi/linux/swab.h:#include <linux/stddef.h>
which also uses __always_inline does it.


(stddef.h includes compiler_attributes.h which redefines
__always_inline to also include inline, and stddef.h also
defines __always_inline if it isn't defined.)


So I suppose:
1) either replace __always_inline with inline in ioprio.h
or
2) let ioprio.h include <linux/stddef.h>


Kind regards,
Niklas=
