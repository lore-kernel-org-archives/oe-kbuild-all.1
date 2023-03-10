Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D6123AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678440290; x=1709976290;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HY7DzCMvEDWROTUpHteeeQ/fo70aGH7qWWNkDV5LM4U=;
  b=F+LRMB8CeP4Mrhf62m/9WdEw9sNOUXwQUQ83taMIllsL/gIDFm02k/nw
   d/9b4H6q6jE+z6jA6XFwxXyjaRYiVd73Ooy+Woiy8727hL2PyQVPSjwRF
   MtnsI7ZP67s+r8ZqwfXoKWbyhS+NmcOFbmhLCbCMJ004PBHw50QQTwJe+
   pO+AD7YavC7OUUPOr/AI8uhiCiD9BLBkKm8lBIcV/dOzOVr3l2VO86tXb
   eQi8T78Zg2OCMS7b0MWRvMSMj29AvU+j2fnjhSNRHsNUcguVa3VJGWqf1
   82BArgd/bsdmjRbsV6Zs7X/6nKpkcpjDkQHCEqSJZyDZmqRe80lEFrXb4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="325039675"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="325039675"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 01:24:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="923589605"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="923589605"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 01:24:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 01:24:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 01:24:49 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 01:24:49 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 01:24:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcxmHgrbRTK3lbz41amb1iLMgGCn3zsYYMM0YHs1h0WUxmsiwA3js+U312K3G/9Kt+1qL1XEaGcpwfiABQabY5ZzDD6CVrOYCCaJIzn0zMvdFc3shgSu2H5A6Yid8BeBG+48OhYd9tQQQ4T0vN+IdAYnye3WZcf/GYhMlv5fG5YUPcYV7pfHyBQQ8VvKAORdXLDxkUFtKM7GGV6IjOeRlaQ9OGNulzKyLDG/JKNuicQveKJp9eIkaqKzS0xivpVli61Ejgbjdkgei9m+D4vs7v+j8K5/VTTmv+uiYKqRPjbpbgzgOiJNSYpp89JVey1xiq7gg8oA3ksqqeYzC/mhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhrYLT0XqAtyl7FODb/IsOfDXsGxE5q0xleAKlCyTY0=;
 b=egOm8vVSrtA+IDCnquy5SDu/x2Ml3lVmf7ZM4r4nScIn0cLjcEfe1WvTVsyYjkQuORESPSTDOwnwrK/RO4mImR5OncQOGLhwqyutsLWBmAjoOe3xkt0oV8gl9k5hSnSPQm1CA7btjB3i7SVqzBfMrwBZdYk0bENO3vg2KEQDDtOB91gYadEWiFdIMBgCwweMBdltRnWYy7UNkTDZEK7GkYrzf1JniYlrf0sOnorwgQbZtX8MBXwbaFSEZgR7IkkDFX0EdABT0+egYblDAFZ/rKjkoKe5Vn1XOc0/FyA0yLIZWTr1/z7OUPrx/zkbABLQ5UWidLz3qKlfuewrWIu8Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by IA0PR11MB7953.namprd11.prod.outlook.com (2603:10b6:208:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 09:24:47 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::6f7:944a:aaad:301f%8]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 09:24:47 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "Liu, Yujie" <yujie.liu@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: RE: [yiliu1765-iommufd:tmp/for-baol-0303 30/53]
 drivers/iommu/iommu.c: iommu-priv.h is included more than once.
Thread-Topic: [yiliu1765-iommufd:tmp/for-baol-0303 30/53]
 drivers/iommu/iommu.c: iommu-priv.h is included more than once.
Thread-Index: AQHZUy9JI2gNpHxs8Eez1kCz6H9zEq7zveHg
Date: Fri, 10 Mar 2023 09:24:46 +0000
Message-ID: <DS0PR11MB75294BF4816B196E9A7169D7C3BA9@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <ZArx54NEtzmf/574@yujie-X299>
In-Reply-To: <ZArx54NEtzmf/574@yujie-X299>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|IA0PR11MB7953:EE_
x-ms-office365-filtering-correlation-id: a6c21210-56bb-4955-73da-08db21494a8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FRCqIRDqUn9/MMFpUvTqQe3pnJ2LwVAherxU2iDMqbfLyDrDlC37fZ75BRg3Q3S1gmJc6H+jtfqm++jfvQBe37/R9jyfuX5xLimHpglgpTFBUTn/I008/Vmadc2VDQXDdpKGMKq/3gCQdwfvjVTdTFSnxVS7ykuJA03uw6BQlvW4A5dEt0h9luf48PzJBg5vTyfkknt8Gjdgncq3svMDetIfMGYFKQwlqf0HL7iDi+GY01qmQ3UZ1tYGFMXMQ1klE3x26/bLy/whwiI97uhNyH3oqQ8fwBfW1CVnqBi0OPQnyn2S4e+vDRjkznCAtzijO0O75z8QbZDI8/XGJkVcuZfhOaKxagac4gzxg0mkD4cE4ORvisQl5A3DAY+Pxnw1DaULORBl5VPhvZMOLlM5tehc0c8Y0Wl3M1JS8QhMtW3Aw23K+igiJIxyRNnbUmAU0psKd+i9iKpIwNs75aaN+vVDxo4FS7P2QCues1il6VxhYMpwIRdpFDhsCiqcCC+5nBOSS/Ndf4Nx2cYDAfjdM8dVcUmLC+xae48hBnY26z87GzIBBOGWV1JgUVyvVFL5jy7zZ6X502omT0TR/bRP1Jv9YPslfWAFi6Qu4P1ShmViieBWNkPL2vSsKgd5IXiER//ACdWqF5j/+OGt8g9/3q1EQAKsS7wHBm5XKlHzpgry3hiJrT/BV8MFkUtLEy+s8WVTM5S3bIwDDOXiyDqk+aY9J9fioQOUInoythokrFdr3jF5JsyuwfMJJ3kQfjhU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7529.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199018)(33656002)(110136005)(316002)(6636002)(478600001)(966005)(7696005)(71200400001)(5660300002)(52536014)(2906002)(4001150100001)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(8936002)(41300700001)(122000001)(82960400001)(38070700005)(55016003)(86362001)(38100700002)(186003)(53546011)(9686003)(6506007)(26005)(83380400001)(13296009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IYZ5Kr46RBmj7+coKfbHeWSOzINdXXCmPjtz/gMlcxnN0Pm4JoZZgraXB8n5?=
 =?us-ascii?Q?rer/vNHUXoAW8sIYl3eL9hyqjS4eePqbqnX4E/tbAnuD8vlvkm/9y3Nala3U?=
 =?us-ascii?Q?WfjRwwUhC02d6IoJVwV+/7zj0ATVyQKRNoEuvUI03zA6E7Lo/amJ3HBPwDrb?=
 =?us-ascii?Q?SPmX3v46VbL0l7m3ucduVFWmKoKE4sERYHwCN3JZB6Vx/8Oo+0Nx8G1S6ICz?=
 =?us-ascii?Q?GbVuzSPqcxyPXT3eopmMdqsn6jF1HtPMz/4bFtKA9SkyWCNY6EIOEf/7y8nE?=
 =?us-ascii?Q?eNhCmUx/S4HLwJSDucHlK6pu32w48scyta/iPJVMVdhGnQhADYSYIVBhnMnX?=
 =?us-ascii?Q?FQN7hUeQII/L5Mo8XtX7RPTZEi/s9CIBLTc1+abzTZUIlD37Wr2ZTgj6Genq?=
 =?us-ascii?Q?hjEQPsdPXjzxPjEx83xDvOPptyUrd0rg/vHwQhEVxA/NuIz2U8PKut3kLkyK?=
 =?us-ascii?Q?o4ap0i/1txJ4B39WNV953NTZrO2xYFMOEubxB8FAyEepL/r+dxg93lIvQGgt?=
 =?us-ascii?Q?6YFEEz7KSRvOoUZCCSHaShu0d/j47sSoudiQ4kOvNsPG3lJmEi/E6j3SNzXO?=
 =?us-ascii?Q?8h4mfUhiDJABA92LbpWVpg3FrgkFYKnS37nlZv4qsFKwcuPtuwbjd4kFM6q4?=
 =?us-ascii?Q?ieDIT5Ii8hoRxgDu0jg7gNv/fEOi6hmQ+dm7Jm/m+2G5Y4ms5G8iCuQGeflz?=
 =?us-ascii?Q?DjO1BxDSLXCJnOulG1YR/fECwJCJ5/nFeb+bykEgcGfvvU5UbVCNnERuz8jn?=
 =?us-ascii?Q?5V4fbXhH4rXq9UJavxush8dB4n5KOy4OxHv/U8HzIz0jvBGfMxftKSZWUa1r?=
 =?us-ascii?Q?4xrjlFQl4akQBoxUsS8KzFNA2s/juge+3QEBFGBCl8mpa+YbUfKq5rtjAcUY?=
 =?us-ascii?Q?2XV9vWLYGzv4Xao6uJCIKU9VvQ5Ye3mUGGFgeNiXE9CWjiXm35wA8yOl2ofD?=
 =?us-ascii?Q?CMLVCdUUvbpYgdBAFxOcAntkKuqiXdBqac+B6KP0QFyRzPeBwnDou780f64j?=
 =?us-ascii?Q?0EB/3CkFEFZmyzAV5/doVjfNBg++DnYePRPG5iiXE+xlU4urjnDu1aAEewQc?=
 =?us-ascii?Q?IV7+ODoovTJDLlbXIWyf/W5jw+Zsd+djJy6hWDK9GJGHuYTTz0EE8Xmg6ZnV?=
 =?us-ascii?Q?piKG1PK9x0jy9hU+diTmXNFIq5qVhrCT9s6hr9Tg+/vtW/fzPO6VMBXgSiAt?=
 =?us-ascii?Q?C1ArTn5eP34fUP0ejlj2EsRH97jzeEx0RbVeBffB0iQoy1DSEyPl18G+lHif?=
 =?us-ascii?Q?hges3nEIYK14aNKADYqbtI3++OSYsREV+dIq/eQKBjK5UDIoD2uO+ZXgtVCn?=
 =?us-ascii?Q?W8JR1vLPpgFTb0aVH/pBCp6QebriuVlIsJYeH2UycrgtLv8mUXiKpeWVn8Jg?=
 =?us-ascii?Q?OgynLeAOfQK5Y2VZS4QdjscsSzla+TRI6oET9K3P/WMlXUcem3lghFMR9FK7?=
 =?us-ascii?Q?WXsx4JXW/eQ+hQWnwi5/kl3u71IxNIOzCme6fbjPfGEnEHOFoezMkpScjVIo?=
 =?us-ascii?Q?b6kI9FTv1I4UFyrs2sUInzotZLIuZzMecpKmzVQbm8beNUmjjn7bmqpR5Qt6?=
 =?us-ascii?Q?YDQ1CLZIV7aN8I6W/n5o1haImhc8S1tAzxS138mK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c21210-56bb-4955-73da-08db21494a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 09:24:47.0014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PDlE9AJFG8ZRil0DHigK5Ay3R8RTizpP56tRVqtuSlgpnpoABFI7KLrCf8RwKXJwQHqDFNFyfzyXm0746os9og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7953
X-OriginatorOrg: intel.com

Yes, it is. Thanks.

> -----Original Message-----
> From: Liu, Yujie <yujie.liu@intel.com>
> Sent: Friday, March 10, 2023 5:01 PM
> To: Liu, Yi L <yi.l.liu@intel.com>; Tian, Kevin <kevin.tian@intel.com>
> Cc: oe-kbuild-all@lists.linux.dev
> Subject: [yiliu1765-iommufd:tmp/for-baol-0303 30/53]
> drivers/iommu/iommu.c: iommu-priv.h is included more than once.
>=20
> tree:   https://github.com/yiliu1765/iommufd.git tmp/for-baol-0303
> head:   028abaf51f935755b020cbb2c8f196862dd3a312
> commit: 9df01e25af3a064a860025a38d73d05c418b08eb [30/53] iommu:
> Move dev_iommu_ops() to private header
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Link: https://lore.kernel.org/r/202303050926.Nu8TXzXW-lkp@intel.com/
>=20
> includecheck warnings: (new ones prefixed by >>)
> >> drivers/iommu/iommu.c: iommu-priv.h is included more than once.
>=20
>=20
> 40ad7dcd77887 drivers/iommu/iommu.c (Nicolin Chen              2022-12-21
> 18:21:32 -0800   36) #inclu
> de "iommu-priv.h"
> f2042ed21da7f drivers/iommu/iommu.c (Robin Murphy              2022-08-16
> 18:28:05 +0100   37)
> 757636ed2607a drivers/iommu/iommu.c (Lu Baolu                  2022-10-31
> 08:59:17 +0800   38) #inclu
> de "iommu-sva.h"
> 8cc93159f9196 drivers/iommu/iommu.c (Lu Baolu                  2022-10-31
> 08:59:15 +0800   39)
> 9df01e25af3a0 drivers/iommu/iommu.c (Yi Liu                    2023-01-18=
 20:28:07
> -0800   40) #include "iommu-priv.h"
>=20
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

