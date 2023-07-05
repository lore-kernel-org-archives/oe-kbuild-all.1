Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC646B6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688548238; x=1720084238;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nL8y3s9zE8+P6pdIsNU++TrQrMThog1Cef2Svt0j4P0=;
  b=gKkZLj58nDnPWt1VjTuaR7+BkjO/K6CygcLaTrkrcNozvVJIxcvVixfq
   +luz3Pco5dVPzK7jKs8PEKiZccz4EY4gzpkckt8w+hGt/qvrVOky4yTtc
   KYc97vLqHFgjVgvHjrkzSravkh4+jTV1kPwCqOowOlYzi1Lj8Pu1mFYXx
   j53ijSirS3EdSkHK00jMZaA8TdS4w/eF7veVOiWDBNGlAdkaLm6krNxd4
   rE0MMA6lrB8htkGZf6n3OYuRU6MZ8paOwSUkqtOHGlJqVwt/5BJ+4Qi4b
   P8YDvCkZptP5DRxQeDHwIRhE+y1BK7FG6gzH/xXLNgnHkYYXkkLjSzcQn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="429325191"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="429325191"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 02:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="843230113"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="843230113"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 05 Jul 2023 02:10:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 02:10:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 02:10:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 02:10:36 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 02:10:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+zWSL2PE08aqNHegvzmIIauR+uzAWeXkMua/yHqGiBEUX0lOlbU44lUE7BbTtBRwtw82UGcD6y7ezgvhFAESmISC43lswsCJIZe5OvCkftoe9lN4rLzkkbwoOKON1JYX35H3PMZkQNT1VJIE1XBmaeH4Z6kDw4dHBXbscS0NkMdHQ1GWTY/21uQmQcVtlcw4gHSwvsTHw45bIucmoc+t6EK+bmeolXpCtNcLL7/PvJsYhnZ72hI62pBgPNtOj1/Qhv0uZVydUyidg9SQTGQwFyXttHH3ntwma0APAPhUIChnzetS65amW8UIufNEF8JcQqcgLJmJoGYZ5OJfvSI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhblqBbUr+LUpjmM787taFB/6RCnScgR1OjC6goTMiw=;
 b=hIpwQFoSC+CojPGIn8RWBTh8uG5lQgDR19BlBszlS1rOvkpjnxpa4lTKFFGi9YV9LtiHe75xiwcV0Su82YHYXApKNhWi6yf/+R+4BsP32cvaFMo0255dsjL/emWlweLBPOodDgQRdunlmh3ZLlLFh3nEh+sSUrhHVJFjwD3YWd+lavkJeAtZ56FTIOTGr/MSiY1Li7Rh8Ent4fkecO3xugnNZVDvdRnva4elGSNOzRe8YVaB86TOLRU2MIIeKxaUBo+cF2n5QhZc8JJVf2uXZenHKrLzgpygn/bQm/NLY9Zvql1gN5TPuVF2BCQiAHsmLhZFHdoxtCKoWzwPWqqDJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by CY8PR11MB7363.namprd11.prod.outlook.com (2603:10b6:930:86::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 09:10:32 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::e7db:878:dfab:826d]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::e7db:878:dfab:826d%3]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 09:10:32 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "Liu, Yujie" <yujie.liu@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [yiliu1765-iommufd:wip/iommufd_nesting-07032023-yi 1/65]
 drivers/iommu/iommu.c: iommu-priv.h is included more than once.
Thread-Topic: [yiliu1765-iommufd:wip/iommufd_nesting-07032023-yi 1/65]
 drivers/iommu/iommu.c: iommu-priv.h is included more than once.
Thread-Index: AQHZrlIkkvx/Ex5efUid4bYmd6ElX6+q5FRw
Date: Wed, 5 Jul 2023 09:10:31 +0000
Message-ID: <DS0PR11MB75292E2AD2D01D3E000FB7F9C32FA@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <ZKPYhf7iEKZr9e+D@yujie-X299>
In-Reply-To: <ZKPYhf7iEKZr9e+D@yujie-X299>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|CY8PR11MB7363:EE_
x-ms-office365-filtering-correlation-id: 973bc4cb-2163-4660-e76c-08db7d37af05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VhDDK7GkHfN/Md3j/nvQ0/nQQMvYvmlZSiZYQipLV9dhoYG0vSTprcBC0GdKUwNN76vQv2Z1VcVPUZWhs+MTn5jkPkOczn0zvsTAzqcCu1pktmiHGWs3ZiRYBAX0+gUaoI/wWds3OT4EZBqfg8o5IXSR+BzF6iAvsegHG8oSa8shZiLyXgQ2fvUQzzoAAtRERjbNgGS1TRyUmzeB5I9poA5OM+m/zLdZ+SlTULtKv48iQXMGe/8fyYTiGf6JbTPP9QDOhX/D8zYe73eU6mnKM/DNznOP4Xf2tPONHsW1t1tRPEicqIrQig1k3llazRBzHwtBDZLcjTN5SGrutwVrmFMEnhkUuQpVHxg71Y7N380m9Pu2RZf/MDJ6nZYQ+KqVD626weI8gA0JIFK7nwVhcjcb3kMzcdpU0025iqIp6ja0/qdyA4HC3h972lzoklbVkhguCjKPIK8xrUM1vdmEdiUUDrQbb4WyRR1Z1TC5fTsJz6Oj+tMow4j8hXCMrpbBbvASZF70RdFEiTTlfoyPhAOT8LykqH4fd9k/Nt2QxM3lfc5PbTmqZS/hIkzPpBz62yAqlxu41VN++xyXXFBda7jfKyOJrrtzeiIPKmrsIaLUe6UinLDT3Ib/3t93fDSFT8+6Jjic63gDm5xKWEO19A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7529.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199021)(41300700001)(4744005)(478600001)(38070700005)(966005)(9686003)(110136005)(86362001)(38100700002)(7696005)(122000001)(71200400001)(82960400001)(6636002)(4326008)(316002)(66446008)(83380400001)(33656002)(66476007)(64756008)(66556008)(76116006)(66946007)(55016003)(2906002)(186003)(6506007)(26005)(8676002)(8936002)(5660300002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9qF+tL2KTu//+o0GvztmXMdsfQnnj9v6hR4HV7e6LafAoPPwqrSMzAknGKlV?=
 =?us-ascii?Q?Tf+UDu69PENG+c1x3KYiGWGbLj8x4YYcTuOluEsVgJRW7Wk9pjidfuqLactM?=
 =?us-ascii?Q?2U8BIo41yyYet5ApvB7TqfSgq6Hch5QQ7X7nQKvwhwRJjnMtNB/KppNxLe/R?=
 =?us-ascii?Q?QUfQwHe1UYFQ4ZZVOxsBFg1SwTYmF4kWxKhNswqb2k9ft2lg/e7WxrPfP13a?=
 =?us-ascii?Q?02VOZaBzwTMls1b8tUtWf3MbEXQk3jIi3UVUxkKLpBlSbHvtLmywmGItuIFu?=
 =?us-ascii?Q?lOnxZqBt3MmxKqzB473zPyQxlZw180ifNqla++4aAHuRUceJH0zX/j1UkcjK?=
 =?us-ascii?Q?Fwtf7rdQXe9voZKF1WUCW7ZzxqltFtXDzAUJlEkr3XPohLX6ZQRBt/eUTkQX?=
 =?us-ascii?Q?L5uM8022epXCvcFLre/NIzLwDb2dHgpI+nJ6qR+TyXGfCVNsgBmKA5gBVpp4?=
 =?us-ascii?Q?1KfVx8IZmp2egaiwY2hCpeIvpmeIDws+Q7SpadfQRVB7A36H1+oTXerNq1y9?=
 =?us-ascii?Q?fnF+nnWptkVz9PRt4MoTHVPr52l7sDbjt/ccXvgXgQAjs/nxeTCohthjnHYR?=
 =?us-ascii?Q?OJhSgw32l+O+UoQQUPswzMM+avV+a6Sr7Kk/6bbpgEEcEBhQCk9/PaZ8A9z/?=
 =?us-ascii?Q?TZZ/if2UUJJpwtDfDlqfD7KOO9idjkuyI85uoYDqBi7hEnbBK16n21oavkq8?=
 =?us-ascii?Q?KueFzYX4PU6yUuK6ugqHsJ4jct34ZTAIwoccLJog486n3sRpyoH6Ua+owgAD?=
 =?us-ascii?Q?2a594mAkB2p+O+8CifkqnZnGy2mal18ae/8iPfPfCagLyR5gbMGREUrj4XZv?=
 =?us-ascii?Q?iAapGLC8b76WsbpPPtTQdwICw3dC4Mw9ljf7eCIgpHvOy6y9EO3p+vRgdUuj?=
 =?us-ascii?Q?+yj83cRmT9u7ATq4SlDFluEdQ9OHnx/nwVppPAWzklf0t30x/bgJHwbjlgU2?=
 =?us-ascii?Q?HTBXsafbybTg0+0rmPFQ2AaNylXqnUJVBm1nWipWVPtRai9agANBF5t26pUA?=
 =?us-ascii?Q?m6EYwTdcuV5PaJpDUoE9oOrn6j7RjuhRBTV5TPthWJBjqeQBcadCAeXyhwFY?=
 =?us-ascii?Q?b9Xi9BVcJU1J3vZQQmq7PYzngpwZAo7nhyxF5D7f76h5WctvCSuWoX9Ms3b7?=
 =?us-ascii?Q?z81YXhL09dPLtPM6LX7QSidRQzr2xa/9ARzysHNJ5uXsrWSLeYcePRpk0ip6?=
 =?us-ascii?Q?3XfA0mOX2NS+NE5vap7VoNuny3N3eI2R9K3vJ4u5CMvVsVSQ3EFxR92mQ2RN?=
 =?us-ascii?Q?TkT7qgjj2HGo5ORK4uKRN26mQsGB5PCqyXEL3jRdlYK+1diOMi7r5TOWVrkg?=
 =?us-ascii?Q?CW1z3/p11Vjs8IXN3JyFWCkKIHxiYN5b4fY4/ckBAOxgiJY01bXAxyqrqh/k?=
 =?us-ascii?Q?T92TqwTELBB5jP3DdnfFzlZBkmc6ZWGMf+t2kwVgHT7hlF5xcEtArRF/ttg4?=
 =?us-ascii?Q?+pJSNZHF+VI95i4pKd8NiUjWspD8Y4FKs9EupVNVU+1YMUTW0GWDB0ReS3Y/?=
 =?us-ascii?Q?Azz8a/8FwoeQEEgQowm69igE9xhINxHyzpc+Gho0B2Ls6BMh5JCSg/IS9Gqx?=
 =?us-ascii?Q?lBacs6L0nSUu2k/j8Wu92dI7FwDIwea7yz59889f?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 973bc4cb-2163-4660-e76c-08db7d37af05
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 09:10:31.5993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nr2UFNViFoHGOB81uBF/4m7IqVRMqsjDpYyw/TgFQYzX0KJhvm/v6B+BLF1e4q+a7N4BI7iMh0HB6QdTmR2/Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
X-OriginatorOrg: intel.com

> From: Liu, Yujie <yujie.liu@intel.com>
> Sent: Tuesday, July 4, 2023 4:30 PM
>
> tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-0703=
2023-yi
> head:   ac623a6f5d61ed4f4d90a3f835c668728b07ab95
> commit: 8b5b28620d75c74b41568767094059fbf9529563 [1/65] iommu: Move
> dev_iommu_ops() to private header
> branch date: 15 hours ago
> commit date: 2 weeks ago
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>=20
> includecheck warnings: (new ones prefixed by >>)
> >> drivers/iommu/iommu.c: iommu-priv.h is included more than once.
>=20
> vim +37 drivers/iommu/iommu.c

Thanks, it's been fixed in the patch.

>     35
>     36	#include "dma-iommu.h"
>   > 37	#include "iommu-priv.h"
>     38
>     39	#include "iommu-sva.h"
>     40
>   > 41	#include "iommu-priv.h"
>     42
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

