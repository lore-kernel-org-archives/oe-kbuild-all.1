Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5116AB1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Nov 2022 09:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667986026; x=1699522026;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tNY0+X7VkxPq5AKpKsGr19szO9fP9natneztRHeV45A=;
  b=ztumjxp9OqxPZCk+u/cP1Sb3i3Pvi3j0BxRTtwA8V3gdD6V9sQtqp1Vl
   XuoPaIjT6MrMfcr1z/N7SaVdPh6GboL5rzIeA6WgIKPyzv/a2xQbLjZJu
   0dnF8pA/3ovIlfWv2hinUCS+RHb0+Ndw25XjqaBE2WLipSaQoK5z7Wm+j
   xoamZRRaojayBZ9o2x1EBIuCqOyUjkRbRKPVGbLbdrVMZWNsnhpI7412L
   k1LBNBLEGrjrHtFXRvAK6pZmz87E6M8ZVjMOI7Ao4KfToK/GHxqu/xPEx
   7+UdlHSJm9l7ujTsnX8K1UGva+ESGMkX/s9/4qCWf5p/UkpKfjOwPF60l
   g==;
X-IronPort-AV: E=Sophos;i="5.96,150,1665471600"; 
   d="scan'208";a="182636238"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Nov 2022 02:26:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 9 Nov 2022 02:26:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 9 Nov 2022 02:26:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6qcv5QIqOmFQB4MewBVRF4y3Ux8uikOSQaZhu3X+kjG5sr+T9P6nMIEvBnwssT/yl7MuhzVdKSyTT5k+UYcGF0tdWyCgYpYTEpX/NKNpbBhI0FvcJ4uA9KJJl462bUITX1TX/wpxWzqiF/jK1ut/v0L1HXUJcMcwjUWbYiyYIubFfjdwAooY+3EDJ0Zm/HciG90WpXgixJq5LNmkIScmP3Qra5iCK/vEz5/HiYQx2fsAYGy8MIHFzRA1WGp01rm4GD1Xzm9JRK3/EsbggQSho2nkIaOvGfE4xvp2ch+URakJpvitrLUHVnuaP47eLOHf94vMjsUf7bUy1qD7UL9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQyVYzu18Mic4By6tfmY0b66m2aM+Mkxmw3O03pRdSk=;
 b=GQPLRf+7P8vmFVxOMl900cqckE8VLXXgj6tvEdkkfoTk0+hX3Kb1T0jc/XWGkX6amOKV6vJIeqzO68q7I5fvH00P2pLQuCbxeVXvn9RZmfu96b4+ym8LDkPMFniRzgySEhhCYAmkURTC5jBQdgs68ILMECfnUXq3JX07RbHVAST0EK1fxDvDPIfW4jgSX0zKpT4i8u0Mz9wardHgoTnTVyFdqurLe4+I7SVEeTkaNOAfICgu1nUPYgcE8s4InsWP1dQPNM8LoikNlmEX84Su/blY5FQUyj7ZdPi3riqcSJ8tEAEjfyry+Hwgfmwp3coqNESJE1Uu2AhQeoNs/n1mPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQyVYzu18Mic4By6tfmY0b66m2aM+Mkxmw3O03pRdSk=;
 b=dX5WLKZtA4kcCWyd5Lb+mnbNpSGupZIET9q6Hwl2kKxtq28qDCZSMpezRrh6KxhwsmKO8s/FbqcXYRBeinhFKCR0azE9VZfSinJlollh+8nU8QjUpOm1bsYjXAonUwyqIg6FnL6Yl9DUQP8gvjsA8OnWdY+tOIoXQsE9fb7vobo=
Received: from CO6PR11MB5569.namprd11.prod.outlook.com (2603:10b6:303:139::20)
 by SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Wed, 9 Nov
 2022 09:26:52 +0000
Received: from CO6PR11MB5569.namprd11.prod.outlook.com
 ([fe80::d02f:4ea6:e2ce:4a93]) by CO6PR11MB5569.namprd11.prod.outlook.com
 ([fe80::d02f:4ea6:e2ce:4a93%7]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 09:26:52 +0000
From: <Daniel.Machon@microchip.com>
To: <petrm@nvidia.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-mm@kvack.org>, <pabeni@redhat.com>
Subject: Re: [linux-next:master 4744/6155] net/dcb/dcbnl.c:1230:1: warning:
 the frame size of 1244 bytes is larger than 1024 bytes
Thread-Topic: [linux-next:master 4744/6155] net/dcb/dcbnl.c:1230:1: warning:
 the frame size of 1244 bytes is larger than 1024 bytes
Thread-Index: AQHY8rbly5CzSMZTOUmUqRu03Vqiyq4zo7KAgABKlQCAAPyQgIABbXwA
Date: Wed, 9 Nov 2022 09:26:52 +0000
Message-ID: <Y2t01hP4yx6aOnie@DEN-LT-70577>
References: <202211072213.KSrsyiuE-lkp@intel.com> <87y1smpwe0.fsf@nvidia.com>
 <Y2luYj9zmLDuiTnl@DEN-LT-70577> <87cz9xpslm.fsf@nvidia.com>
In-Reply-To: <87cz9xpslm.fsf@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5569:EE_|SJ2PR11MB7548:EE_
x-ms-office365-filtering-correlation-id: c7aca42c-ade7-4fae-8f3c-08dac2348920
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SgFsOaYxs+GcR2Ocse7HXsWK8lUzf9wAGxv6TBlrNyR+IVPaUyY6T4crmob2VPZQn1hHnZ/d+AvIROT5IUtLVYAaHk1kNXxaOM7qzYwHlF58qG1L/Ect+KdLnqVdJyDF6X0VJ3juKm5e0Wuiej58YSP4F4+EhYyGwRM1gBixA/2OrF4/KWgBLLmdQBzEWDHxQ3aR4ncSLE0LZNkzCYn7p+UJnGV86dENU6dSdFWGmmDSx/kCWHV5RU3iyRW87+TCImHuEospF4n22tRL3QPLYJxYkkvu5JFhEyri3hhqsfeYC3AND8aiQxOwOBtGCfm9Xsp9Uc8sBKlt/WsSbJJb/CdHGQGw6U00PFiXKyreG2b6+NDXo8X6tMiLPmcZUQ5RKPZD3xQBfq9ewvB+MaigONs2pNTMfCWTJR2oDJZjsRa75XU5Io+VdEC9RlBs/5g9COf8xUBRiguhOld7WlJbF6/vxVsDmA8fvCvg4gYWkdK5uSfHDScLSgJK0j9I4BAq+L3t4YhX1sRasafD5jtAsUCwklJBcc1VZZOioOHTssJFaQIu6J48okUVugZFya/9iCxrGQ+GJvQcCGtZQlg3BUc/EAI9BdxwAiSE4Pyv/Z2f6eEtNmO2crPaxugBFErNPsfRNTWksbVCD8GTfHX6ED0ID13APIl9BnWZwMpVxufuLb0wtWgT4vr7TWG6jKmI3uXFz8tsif7zWBMRaSJdCx9JvuKJqplbsLkrCUj3IMXryM2zJ+YU+mxOJQjEuNjMVE62kzFbNTftFwzwXJ1UuXfxP1YeB2aTpuUDBuMky3zWIPwMaGDliQb3xozhNZMSCRLW4ERAnDlJs6JBHPdhVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5569.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199015)(5660300002)(38100700002)(8936002)(41300700001)(6506007)(4326008)(76116006)(66446008)(66476007)(2906002)(83380400001)(71200400001)(316002)(86362001)(54906003)(6916009)(26005)(478600001)(66946007)(66556008)(122000001)(38070700005)(6512007)(64756008)(91956017)(6486002)(186003)(33716001)(9686003)(8676002)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6h8S4COAI/LYHkCL/s208XR6DFEbSZj7HMYGhq9BmuzY8pP0C4VoBILXJOdu?=
 =?us-ascii?Q?EkXg+L7wjmKeTGig1uy+YVx+fbCx8l6F4Iniil3UscnlHk3g+UKC2/NErzVB?=
 =?us-ascii?Q?LHhU1dW9+rfJfXPPxicVxWi7SP9L4X5npaFKp+Z2f1wax3HPkCBOkUK6uvYK?=
 =?us-ascii?Q?28W0QHI0tiv57+wPyMr5Gem+BriP1o72Esa2xGfPyv9HE5csxgbHig6TPwpa?=
 =?us-ascii?Q?jEQVajwJtJEVP3MT04KnT6WLv5rME7YYAj5afh6IoRU6GTRbT4PMLZi/qEXK?=
 =?us-ascii?Q?IMpKLroHD+gcWFymum6sc1vPFfZbohCmEffq11J4F72+SFmZ8FsQqVMtOixC?=
 =?us-ascii?Q?E2rbsAveeTyqTWM1C6bZmwdMrJoTPTbu5tA3m0pA9ZlKcAAWHO2SFaPXL5rF?=
 =?us-ascii?Q?++pozo9w9cj3xlwOH3yWuaobWJEn+tWE2s1DSf5W/lzBNyj8HcEc2akPyqbp?=
 =?us-ascii?Q?SsV1tyoTDdLDBt9oLtrU8/l3/ybObR0/4D1OmR5txTcB6w+FNTaZm6AH8UqO?=
 =?us-ascii?Q?tGvn7zv0yTsrNDVPkFG0chRJlzDlAVLGPSF1fM+y084vVMnw09rcU2kFNFz0?=
 =?us-ascii?Q?mQs03vmG7evyKeXXza1AEz4O5riYdShyXWjSUljIIeup8JrWyXLy4IF9ntnp?=
 =?us-ascii?Q?iKKOMu6vWbsbWHNtYRxBo5n84FBpH/LJKMzCupgjsR9jRcp5C3tRH4G8g2oE?=
 =?us-ascii?Q?NlORD/lNYP65bbU8D6uEugD9wajE65PWi0o3ZK9ev/2i6LgRszbTGPKR85mX?=
 =?us-ascii?Q?8zqwHvypR2aU0kz3C/gRScZcgeFw6rGA/5Zka7FlmX+yyEMO278ueqgZPvjq?=
 =?us-ascii?Q?NdlCztaCHipX7AbpvwBwIdJLtz2X9hR84aYgByScscPUmmt+7VP0/gz3AT/1?=
 =?us-ascii?Q?2065t3xQKogiua9/4+c6ajLwt3LBweoUNIYZCIwULVejf/MAQeWJlxQFedPQ?=
 =?us-ascii?Q?ihXvLf9k2OPpC1csx+04thERQRI0QIT4JHM8EQsCTW0fx+1HKFRyKYgsKKGS?=
 =?us-ascii?Q?f448ae1UDHgv6koD19Lxz7mDFkjt5crxtHIG2ILufdvWQphRB+dO+0a83YQk?=
 =?us-ascii?Q?6kxlaxoZL5O+/AV6xv0n/AS34usja2MAGfqL11rkMU6R6Y5pNuNAV7BnC338?=
 =?us-ascii?Q?OxbS32/1W7rvSeMqsJRCxf2KHWkt3uprsZfhAaHoM6BvBaze474IXxjClZj1?=
 =?us-ascii?Q?3I546qhrMhp1FGjU4n1ZRd2w72ZoCSnAQnqrFtoTWIvKSkPwUxpCZlyqxUq1?=
 =?us-ascii?Q?TrPy0/uzOkEKuG5MWVYYsOelmHqyQLSAavqlk0oJCeBfIKn8tz67LZ431fUY?=
 =?us-ascii?Q?639UtA9qHOkUc8+z+kcicAf5OhT+ilhOmptW2WbVrPh5AL/goCefbsFpubJg?=
 =?us-ascii?Q?kH0LrpZXc4d+XvMn9bnasTVh+/iwUV5LcQCZ084JaWUEy1MAfQ32NlkQ6gHw?=
 =?us-ascii?Q?493c1BYB+hIZ1155UQklYr/g3Q2UBZgGLWd4yhJ6+HVys9TzKmHa+uyVFxL5?=
 =?us-ascii?Q?Hy6biaGFN13esBVUEgHIE9UobpgNd4f8zJg0FrA1UFcyvC9GeBmV8C+FckF/?=
 =?us-ascii?Q?NlDJ/i9dfjnOMaMNOgz7cbHtpgWqJJVclGJla76f7es2cuaQae+T69hY+E9Y?=
 =?us-ascii?Q?zq+vYBRRY6hKgGK2QjvIQzc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3B2A1E1D0060654A9D637EA0129E8715@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5569.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7aca42c-ade7-4fae-8f3c-08dac2348920
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 09:26:52.0734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PldGFnJDBtVO2Xxwtj3JI2L/Q1YLTLZXpKoN9Q/6U468+LJPxzCL3yihWfbWj1rBu+S2VR3RPetRxB7QRkW1vCBfNKig8Tr2YhR6GNuuEDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548

> >> kernel test robot <lkp@intel.com> writes:
> >>
> >> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-n=
ext.git master
> >> > head:   d8e87774068af213ab5b058b1b114dc397b577aa
> >> > commit: 6182d5875c330a5a611687caa05f47752455720c [4744/6155] net: dc=
b: add new apptrust attribute
> >> > config: i386-buildonly-randconfig-r006-20221107
> >> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> >> > reproduce (this is a W=3D1 build):
> >> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux=
-next.git/commit/?id=3D6182d5875c330a5a611687caa05f47752455720c
> >> >         git remote add linux-next https://git.kernel.org/pub/scm/lin=
ux/kernel/git/next/linux-next.git
> >> >         git fetch --no-tags linux-next master
> >> >         git checkout 6182d5875c330a5a611687caa05f47752455720c
> >> >         # save the config file
> >> >         mkdir build_dir && cp config build_dir/.config
> >> >         make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash net/d=
cb/
> >> >
> >> > If you fix the issue, kindly add following tag where applicable
> >> > | Reported-by: kernel test robot <lkp@intel.com>
> >> >
> >> > All warnings (new ones prefixed by >>):
> >> >
> >> >    net/dcb/dcbnl.c: In function 'dcbnl_ieee_fill':
> >> >>> net/dcb/dcbnl.c:1230:1: warning: the frame size of 1244 bytes is l=
arger than 1024 bytes [-Wframe-larger-than=3D]
> >>
> >> The on-stack array that was added is pushing things:
> >>
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1170       if (ops->dcbnl=
_getapptrust) {
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1171               u8 sel=
ectors[IEEE_8021QAZ_APP_SEL_MAX + 1] =3D {0};
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1172               int ns=
electors, i;
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1173
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1174               apptru=
st =3D nla_nest_start(skb, DCB_ATTR_DCB_APP_TRUST_TABLE);
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1175               if (!a=
pptrust)
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1176                     =
  return -EMSGSIZE;
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1177
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1178               err =
=3D ops->dcbnl_getapptrust(netdev, selectors, &nselectors);
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1179               if (!e=
rr) {
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1180                     =
  for (i =3D 0; i < nselectors; i++) {
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1181                     =
          enum ieee_attrs_app type =3D
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1182                     =
                  dcbnl_app_attr_type_get(selectors[i]);
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1183                     =
          err =3D nla_put_u8(skb, type, selectors[i]);
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1184                     =
          if (err) {
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1185                     =
                  nla_nest_cancel(skb, apptrust);
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1186                     =
                  return err;
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1187                     =
          }
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1188                     =
  }
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1189               }
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1190
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1191               nla_ne=
st_end(skb, apptrust);
> >> > 6182d5875c330a Daniel Machon   2022-11-01  1192       }
> >>
> >> I think this should either be converted to dynamic allocation, or the
> >> array size should be reduced to number of unique selectors, instead of
> >> the value of the highest selector.
> >
> > Yep. Dynamic allocation sounds good to me. Alternatively, could we move
> > the getapptrust part to a separate noinline function?
>=20
> I think the reasoning behind the warning is that functions with large
> frames consume too much stack space, which is scarce in kernel. Moving
> the logic to a separate function might silence the warning, but wouldn't
> make the issue go away.
>=20
> Extracting the logic to a separate function might still make sense,
> because it's going to make it easier to manage the dynamic allocation,
> but is not enough on its own.

Alright. Will submit a patch to net-next soon :-)

/ Daniel=
