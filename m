Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64115AD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Nov 2022 20:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667853296; x=1699389296;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JlzleEEi9UaeXd5cbeiW0oNDLcSVzViiQLFi2QHvZHU=;
  b=lrxzEl9d9XNsXc/qHJQNWoNs9xtz8hiwgj/HPPOdb21AB8PTzhtJlGcE
   Lr6y1i4sTpInnCJbN4kKKOcQ7OzdhrdyD4vsn3y1tcKYLzt18/LWvz0/X
   DCxqurWnKS4Y9Fk/n9QEBtS6DahL351yr86j+ZCX5xvau90+NO5wqaGpb
   Z1+V0q77R6My3Up9rSRaATnhUiS3fTcIF0iX/c0bNrqmlf2SveO7JSi6m
   3sfqClR13lDvfSr/rl4RGwiVF+x92BDJSo9MDkFgi1ahlqbsD28for8xJ
   gYv6o73IB8uOS1JWEFj4u5teJuuXiNGuaHnzOVTZNhvbcbgoPnLcrZUEH
   w==;
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; 
   d="scan'208";a="187989506"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Nov 2022 13:34:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 7 Nov 2022 13:34:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 7 Nov 2022 13:34:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1uxIxz7JLBRIX29ozvxdXFHYP2HL4ypgH2xZxtZWSD3DbdlAM+IClOsUqeDclmMhUdDyuPuMcOf82UMscw8wS3sFgKkXeaaUYZ9GL/jQLMsRQ9zY9vd4HngdB/+WD9s2SvfiRAYt7/5w32W5lCkXoaHZOtTfrc2dH2rBxmKejmoG1Av/Zqiw7MCsKiZitB1yOrBVTW32xofeNRmJl1A93BIEkPFQ6TAIzFIQY0AKZPJk6V1dJSqyOixJIwG3vcbBtDpBTLuE4ftBptk6dyPocjQT+AH9a5z2JE1Wgf1OGn/7WX3dZuDIjBzoLShllz3Bn7jqJ26khi3NhYUtQksDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDsLN54io+oJztkf0RcoV75aHA7dNYahaZ5Km187FqQ=;
 b=ZNJE4YUUpBTbE2TfBeTCZ1qj85kVbrwUnbhG7arum+YrbJ666BCLNsE8eLUOHnrapnZ6WBGF82NMHGID8wjBgbHA7wNb9+Rf5uX5dIRofonK0cNpGqXy8QyqPHtUXTaArxQjeblYWum+drQFFise/zzDLM4OGiFu2KORtLjEnVtPG3sHlGFPIHGn7c3o4vipYtQl7mE8F42G/rdXmJBb4Fo0/mXULim14WOI3zkup7yECuzZT1m6R90Syivfnt6rmZfUHz0+lg4IrxJWLSBUJxrAY/WVOJ+9TFaf0p1W07PDs6NgPC60tZhOVuP0i1aug0N3DkCgwLkySDNHqu55RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDsLN54io+oJztkf0RcoV75aHA7dNYahaZ5Km187FqQ=;
 b=lotaX/EkL7ew3QuXSBxkDBDdU3QZl1Y+fCIYF9cm8X7mDNoJ4FA+jva0OQ4xNmUZKPow7qH27M9qs2hr8iBhpZniq67FDvwOk2K/7by8LejL9TjoisSluI+W+ew/N/L7nNdwamOBR9xU4NLnvSfOWYce1x3iOjAD6ISVnWrCceQ=
Received: from CO6PR11MB5569.namprd11.prod.outlook.com (2603:10b6:303:139::20)
 by CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 20:34:52 +0000
Received: from CO6PR11MB5569.namprd11.prod.outlook.com
 ([fe80::d02f:4ea6:e2ce:4a93]) by CO6PR11MB5569.namprd11.prod.outlook.com
 ([fe80::d02f:4ea6:e2ce:4a93%7]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 20:34:52 +0000
From: <Daniel.Machon@microchip.com>
To: <petrm@nvidia.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-mm@kvack.org>, <pabeni@redhat.com>
Subject: Re: [linux-next:master 4744/6155] net/dcb/dcbnl.c:1230:1: warning:
 the frame size of 1244 bytes is larger than 1024 bytes
Thread-Topic: [linux-next:master 4744/6155] net/dcb/dcbnl.c:1230:1: warning:
 the frame size of 1244 bytes is larger than 1024 bytes
Thread-Index: AQHY8rbly5CzSMZTOUmUqRu03Vqiyq4zo7KAgABKlQA=
Date: Mon, 7 Nov 2022 20:34:52 +0000
Message-ID: <Y2luYj9zmLDuiTnl@DEN-LT-70577>
References: <202211072213.KSrsyiuE-lkp@intel.com> <87y1smpwe0.fsf@nvidia.com>
In-Reply-To: <87y1smpwe0.fsf@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5569:EE_|CY8PR11MB7108:EE_
x-ms-office365-filtering-correlation-id: 32c7b4db-a1aa-4742-4554-08dac0ff8638
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zsF5j8JzTajOuqRwVQ31d52mxxg56HvSDQhvVyv7OlAOb+FDpQHDEc3KVuPoe0DC+9YBMZN8CFlNCN5I/CcMy1jOctLpRoZI9noWbe8e301dl7Tvk22n5kijMiYBu+P7oEI5FtIJ4Uz1OcZnjn7WgfOtVJTjxv2iCC3a5VHbxRaDdtEjr7MiPAz+eR8rpwbNXvL1CxY3kpE1wyoPsI0SrC03Fl0rrAGQqPy/kTDXSBFCazDn8cog1iK4Ww8RVEz907VRTgFA49jl465IlbhCB7/qmXmSlu7nwJQch8GnNGPng72t6xOrrZl8KsEuFJ/iSIMfJ1S5An0KTbYwR3ROAJSOox5hbfMgo2kQZhMb/hnn1Yy+3qHrghwBAynEozSLi7RscE3NxGZCQEHy1L+FNjLSUEeb321XVtDK0nR4tq5/0B8i+bmdW4aPbovfi1WPnE+W2X6iEAYuTBJRhJm2U6ssoILisaARivgyDfit6U5j/oHHl6DuZb5PLqE+LT5AlpyS25wS5u7Sl/BW8f7xDDp2rBRkgPxYc76cz1TjqB9aqluSesjnrY59DieAGKHGeh0P3tUTs2yD8J3vPSWAg17jkt+eaoRsuEDUpDCjY7rAGHciDTeuMHTDxjNHEZwUVlHQOaG7RufJ69WcpAa24807qWVX9sezDrLMuyqxffmXTlLN3mdm2QdjPmK7Jgg0oLEuZLuIqtbb9BB9Dq5ltiUbwrpy4mgExtlBPUaU1d1z3siDnezy4WoTU5FYtYUHdOMSk2i5z+bGxWVS2stjSsFkTmOwyC8j8/Vi/8ZS7QsLinQITnSk48PQ+IBM8dwPZJfLNEYSx2tHfsemusdgtw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5569.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199015)(6506007)(64756008)(8936002)(8676002)(66446008)(4326008)(66476007)(66556008)(76116006)(91956017)(66946007)(26005)(9686003)(6512007)(186003)(5660300002)(86362001)(41300700001)(38100700002)(38070700005)(33716001)(122000001)(83380400001)(2906002)(71200400001)(966005)(6486002)(316002)(478600001)(54906003)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pjFUyECJlP/vdgyO21KcjCvk8wP1k1U5iWXQ0Z0gTF51kp/F+PRxlIlVqtW7?=
 =?us-ascii?Q?LmuogEh7BaHLSFq6j6COMqTt7MiyjBwsLRCz58EhBZq1YsAKxlsHoioXkfTG?=
 =?us-ascii?Q?wJ9sdCvO4w6rYbc8Z+x84Q1l4jIwCHg0ysgg59xwLxyo8OjZsl5h5KnVKxlN?=
 =?us-ascii?Q?6dqOS23BMbsDYCrIwg7TpUH9Myac6eo2FoLGX2HS0/mkhbBvFpfHtqfn0Vuj?=
 =?us-ascii?Q?UpROjwXMoOasheQEx3L97nJdwhH53v9J7HKvRGfppBNLAoDzW+Zo3q14Aca9?=
 =?us-ascii?Q?uKC+1sOg0KOEkqTMLwXcecfv+x70ZUh0Dw5Iqlk4ZaqTyVstG4AE+BRud2zM?=
 =?us-ascii?Q?zS2BK1jONer/4jx2P+SD/g0D93qf6W//jSj38z9h7egb3W5Gj3OYCMeR0hr/?=
 =?us-ascii?Q?3TJxpDany8ny/bddeRxhdHo3vcK5YqNTytg+Da2R1UqeLwZuYXiZiwKQJ7Pb?=
 =?us-ascii?Q?+YGPcwZlhNyXTnqkOj9CgPM9j254gcQzu1QtiElaNf3TZxKJmxpsFCGaGLxc?=
 =?us-ascii?Q?6U1DK3HIZK8gS6AdcR9HR9ySkwukYeebGr8h938D574Go4l2UgRWWiE/kBKZ?=
 =?us-ascii?Q?b3vA1oQt757tP/aGQTSWOdMlNrTyWdqSfdzxBLaH8PGgpu5xTuOCcL4CUm5C?=
 =?us-ascii?Q?3K57GSokrNoi3wXosmKGuqJ1P+o7OdcRn/q2VUuPP7bG46DOEaivju9Z7zUb?=
 =?us-ascii?Q?Rjeld3L+tw/OmOvdLV4pIEkZTEregLezIuEtX4BgL7e+RxiiXkafW/B+9BR7?=
 =?us-ascii?Q?euatvFFXJKf/KTH396XqUAlNC0fd9mQhjn+iQFVw1AydmfcNG0kwkQ9I9jui?=
 =?us-ascii?Q?JX4ECg+e2Iq3C2rTWWKrPUlCdb3j3AIAwf+C3VxIVaqZp46N7ltDMV6osHFR?=
 =?us-ascii?Q?rQ4+ZRVwN/Zpk78EYiAqlXFOVh1Kmm4Bdpy3We6YWWZabajCp3Em8xcGy0uB?=
 =?us-ascii?Q?EaQZEcyMpDzxnXgQYr3lEwis0nRd3o7uN4wjvHOD9bk/fsVUJjZQkh/14KZz?=
 =?us-ascii?Q?7M4qXVWeNhVzk47T4AM6TGPvXpYNENjG/g/kBJYJxEGH/aeBBZIq1DZ17F7e?=
 =?us-ascii?Q?qDp6Ie39YHlkSy0jZJrZTjnCe7pgdIUbg9fIKW1k2+keQBoZwDAFm9otqOjx?=
 =?us-ascii?Q?bCO+yOmHKsLFvHOr4f6sjN2WoL0v0Nn90+vSnyjng+b+dz1L+oiU7yrTxrt9?=
 =?us-ascii?Q?5ZV9wF+FbuQ0V8Qw6tV/Dzxd14mO8VFDJGL/I3zWmNtko8i0WKP5FO45Db3k?=
 =?us-ascii?Q?08SONSCpaYEb/ZY+bmXmmLTPDYd3Iu8Q963SyBbCPRikE0cxTXGjzXr6+4Fs?=
 =?us-ascii?Q?i1OcSvqOe1LNhRJ9ntCV68A+he4Qfc0QMJFCG7Yu3cMeprYPTdYfPlz4VyTj?=
 =?us-ascii?Q?s35nIVLhkWPvLAKTjY58GDgE4yTvKU8i2b+uwgELz8qqKrxk+TdfyD7IoU5g?=
 =?us-ascii?Q?91H7ETEfJfq/nHgY8baZtdYzR1feE3HEQnIrfTRVKfeVrRIOprHbCn1E62h+?=
 =?us-ascii?Q?9nYETHOE65L6dL4ZEZzhzWV8V77okG+aDyW+FPEMRzp+GpV+7HjKFJ9bs/3b?=
 =?us-ascii?Q?oX483bKnboWUwHo7cmJEEgK9qNsG3SLIWNt1aamNHwqN1R6oJnbQd+hKOE4h?=
 =?us-ascii?Q?yNd/6cdjhLAPLycLw6SqhWg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BF78BF427A929F44A1AD1532AF129174@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5569.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c7b4db-a1aa-4742-4554-08dac0ff8638
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 20:34:52.7062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCwxMWkJkSc8dc/AXTzUHX0N6e8tPHqfTarlUSqgX+jDx6Ov+sZqZzkZpuFc3woHnTDu/tgBoPlifYoWJeDgrrNJ12o7WGcry9q2mnDIxhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108

> kernel test robot <lkp@intel.com> writes:
>=20
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   d8e87774068af213ab5b058b1b114dc397b577aa
> > commit: 6182d5875c330a5a611687caa05f47752455720c [4744/6155] net: dcb: =
add new apptrust attribute
> > config: i386-buildonly-randconfig-r006-20221107
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > reproduce (this is a W=3D1 build):
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3D6182d5875c330a5a611687caa05f47752455720c
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 6182d5875c330a5a611687caa05f47752455720c
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash net/dcb/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >    net/dcb/dcbnl.c: In function 'dcbnl_ieee_fill':
> >>> net/dcb/dcbnl.c:1230:1: warning: the frame size of 1244 bytes is larg=
er than 1024 bytes [-Wframe-larger-than=3D]
>=20
> The on-stack array that was added is pushing things:
>=20
> > 6182d5875c330a Daniel Machon   2022-11-01  1170       if (ops->dcbnl_ge=
tapptrust) {
> > 6182d5875c330a Daniel Machon   2022-11-01  1171               u8 select=
ors[IEEE_8021QAZ_APP_SEL_MAX + 1] =3D {0};
> > 6182d5875c330a Daniel Machon   2022-11-01  1172               int nsele=
ctors, i;
> > 6182d5875c330a Daniel Machon   2022-11-01  1173
> > 6182d5875c330a Daniel Machon   2022-11-01  1174               apptrust =
=3D nla_nest_start(skb, DCB_ATTR_DCB_APP_TRUST_TABLE);
> > 6182d5875c330a Daniel Machon   2022-11-01  1175               if (!appt=
rust)
> > 6182d5875c330a Daniel Machon   2022-11-01  1176                       r=
eturn -EMSGSIZE;
> > 6182d5875c330a Daniel Machon   2022-11-01  1177
> > 6182d5875c330a Daniel Machon   2022-11-01  1178               err =3D o=
ps->dcbnl_getapptrust(netdev, selectors, &nselectors);
> > 6182d5875c330a Daniel Machon   2022-11-01  1179               if (!err)=
 {
> > 6182d5875c330a Daniel Machon   2022-11-01  1180                       f=
or (i =3D 0; i < nselectors; i++) {
> > 6182d5875c330a Daniel Machon   2022-11-01  1181                        =
       enum ieee_attrs_app type =3D
> > 6182d5875c330a Daniel Machon   2022-11-01  1182                        =
               dcbnl_app_attr_type_get(selectors[i]);
> > 6182d5875c330a Daniel Machon   2022-11-01  1183                        =
       err =3D nla_put_u8(skb, type, selectors[i]);
> > 6182d5875c330a Daniel Machon   2022-11-01  1184                        =
       if (err) {
> > 6182d5875c330a Daniel Machon   2022-11-01  1185                        =
               nla_nest_cancel(skb, apptrust);
> > 6182d5875c330a Daniel Machon   2022-11-01  1186                        =
               return err;
> > 6182d5875c330a Daniel Machon   2022-11-01  1187                        =
       }
> > 6182d5875c330a Daniel Machon   2022-11-01  1188                       }
> > 6182d5875c330a Daniel Machon   2022-11-01  1189               }
> > 6182d5875c330a Daniel Machon   2022-11-01  1190
> > 6182d5875c330a Daniel Machon   2022-11-01  1191               nla_nest_=
end(skb, apptrust);
> > 6182d5875c330a Daniel Machon   2022-11-01  1192       }
>=20
> I think this should either be converted to dynamic allocation, or the
> array size should be reduced to number of unique selectors, instead of
> the value of the highest selector.

Yep. Dynamic allocation sounds good to me. Alternatively, could we move
the getapptrust part to a separate noinline function?

/ Daniel=
