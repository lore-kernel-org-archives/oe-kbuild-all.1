Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7112FE02
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSovExHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699368796; x=1730904796;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vJApq7QmoPOt4BVYaWVFW2ClZvTPzc2xMmjF5XcwB0A=;
  b=ZSovExHFT8sXRqYKJYGfIi3NcSslROyhmxt/LeZRcBCVtFqrLU4HGVMw
   tBf7QqRq1RR+2eDvVHEpc2jzluo6lZjIDvgJW8K/CT74ZhmPf3ijsHoE7
   9OOcsDRx0M6ISkcUkDxaxCtimn9vCTAZzmfs0zSSrvMJvXx3cbuj1vn5A
   rrM2bziozGrv+oLU0Dlv4p/qer8OwoXc450JGnNUz4H+FMEqmBvDTJkiZ
   4sn/VU0EnbZYxasrhTzI37iSglAcBCcdh6RQIqboxPECTJZcMPBrOVqG7
   s/qGnzUoT0PcOh2o4IyohlQ57BHXPuGufYZx7GZgJ7sx9Tg691RqbBoQJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2461087"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="2461087"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 06:53:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="10849157"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Nov 2023 06:53:15 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 06:53:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 06:53:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 06:53:14 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 06:53:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msDkY2ojskb08O3u2tQ94SP03af+u07XanHlAlP3GboG2gIgTdjoFLPwZwT0YJFbTwisws4IE1t73M9PSfafcx9pUwCptifijSOTP4FGOrj1fmJVTH1kDSHoqvrQopM8nq2xb89bFeD5oWlpdchZ/wp0rWPjAVuWGcEJ+dh/fS+c6khlsc6JJ+M50IZvg6zDnlWgNO99pJlcm/s4Jw/RYczIABO/CfZb0xQbs2zgN0Je60f5+DckDQ0W3Mm8rsRGA5m0gZ7+Ak+6kg2OY/AmYtQJR61qtGvdA3ewWVTdjGwTVvr31qZVgeH8irm+cb1BZXp1ZKPKN3Q0a4bbIwnKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXpVJTc9R8xROKOxXG+aq/UxSmQMX1xhMJfBGWjwTbo=;
 b=LD2vUcmaW84gSmRqyf+vyauiEFlG+gVRU40FQc0LPy3AyYyIE6T0fjeAa/mx+eZoZ6ka2EFlFaCDR90YGIW/8+3xZIJDRFClYZvyxl8QtyizRNo1l6JDeqCCRoCjHwYZN8aOLVDxmK0S8wTOFYEam0gXLxr/nHTH2G/ZtmrVjxp37kK6VWdQP0QD/WMGqg8a5jKGa12q6549dOa4qucdeoFl499wFY0HNGhHd/vRYD0aY1jLiSnbe/B/Zk/4R2jT3nXlp0onzWQIpNoxQe+yANpWR71x2jBfVPlpFWPLYCzEOKf1lo1YMQvymy0fdoT/7yPAKV4Vv6ngTiZsTyDNZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MN2PR11MB4710.namprd11.prod.outlook.com (2603:10b6:208:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 14:53:11 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.6954.024; Tue, 7 Nov 2023
 14:53:11 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "Liu, Yujie" <yujie.liu@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is included
 more than once.
Thread-Topic: [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is included
 more than once.
Thread-Index: AQHaEVZSyoP7kKDTDUuUguhbgek1ALBu8Vgw
Date: Tue, 7 Nov 2023 14:53:11 +0000
Message-ID: <SA1PR11MB6991FC481162E57D045AC2AB92A9A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <202311070416.8nPv4n6G-lkp@intel.com> <87a5rqymy8.fsf@intel.com>
In-Reply-To: <87a5rqymy8.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MN2PR11MB4710:EE_
x-ms-office365-filtering-correlation-id: 840f5dee-0ca7-4d15-e233-08dbdfa14333
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SfaU5oKJ3plZoIzTnpKLgxUpEHFZvLct7CBUXew8h5GkFoN/ZMB4tVwqbfjeIxpQUyVWehY8ZfBI3HbvfMDEjyYTwlPHr1qjSHUXrIHh67D9ZfshrbpBTxZMxBbOJ8tiHlyt80wUMzP/pIjQTl/IKphEbrWaVipVNlNmJuixr5rQN2GeKJEqFNBFMtfbmB7na93o57LNaV7Dbi0Acfe+3S1tmBCqsKvrSck0gqrxnosAdzzVvhWnzLzcG05S6NYnPjaFRsBJ66bGlXNiztcwhszVBAcVgmwQ8pBu0SRQNWZFHWEF6iwI44o3jA1aJ/X1bxS67VueTNGFRiNpwqfsEy1gjPM3zhmlmGE8XeXdJUZKt8uODci7Opzuedr3cWkX31Gfi/YQAgruarM7eLMioMDvIUSlxnDgRL3bIW5I8Gdp3/jnVBHYwyQCla9Ci78R8sWnzo7LpBssEjIgLW4/+KsSdWoYMOmqjzL7kpvG0NYFBaV3uzbynkkhl7gYomcgOBlhfVqPUrYzov64VnJYonIHvgkGpdn6q+mweqiG17tDdHI/8dC8JoY6Rh+xeZUpAABXrFuRV6SNZMu4lj454P6WL7o18n+lIJ9Dys+kTu69w0JXIy4HVkNtlCmaVqVlSKhCULZ8nEASCfIq+VDkhLuz4ccZQVt7yNScXBLFLWfL80GQ94ACpRse88+66YQx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6991.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(55016003)(38100700002)(7696005)(71200400001)(6506007)(53546011)(83380400001)(9686003)(107886003)(82960400001)(122000001)(41300700001)(86362001)(76116006)(2906002)(33656002)(52536014)(966005)(4326008)(5660300002)(8676002)(8936002)(66556008)(66946007)(110136005)(64756008)(66476007)(54906003)(316002)(6636002)(66446008)(26005)(478600001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AXEKB5DT44z6fTECvsIUi2fDp1Gg51RPAiHFw7bjBfb518jWCDE7H3vNu4WK?=
 =?us-ascii?Q?xAJ+M3J+aAEMXYVfeJlCDW8T+ym5PXdn1ixdbOqPeOgNkzlil9AHxYKB9C9b?=
 =?us-ascii?Q?TuBOq/43PCwEc6u/sh7dsm9yQYGOo3l9v7zu/UwPPMQmFtgCkl7e49ejq57n?=
 =?us-ascii?Q?STvxKxq9KMbstFJNdKGSIA9RD4tbTtvNI4stZhn59rV7LZA3btAkr9xpBlyG?=
 =?us-ascii?Q?GZ40QHFYMIedBe0j2sk+Q70Zv9ZdTKn2oKsk55CzKHHhenBcfEXxYgNJcyNI?=
 =?us-ascii?Q?oeC/VXGlkEMa587y2EV7QhqGM7qZfOO/lECUo/lkpz8PSbLI2ZVJ6CPjxV4X?=
 =?us-ascii?Q?WA+AssoLGp62E6sbdwbc5B+b3pSck+BSJERoVmm+uM18WcwMdoxQkV+nLm3q?=
 =?us-ascii?Q?lURrcwsuK56Fy+/sZP/7LCl3eY+5Svsd3dQ9KlyQ53mjMqU7ZTW8GUtRo+9S?=
 =?us-ascii?Q?SSZwzvyYO7F11q+ITU8pUK9nABTINcCwB5wRI+2eIB0biFHO2jc3flRPMx8J?=
 =?us-ascii?Q?HYbQpRbPNL2/krYdv95NdGIVzXwPubViu8fepsR/tHBeaBmKSNi2Z/eKFq57?=
 =?us-ascii?Q?IY5PMLLTGxXjU/BFMxydaq/Re+23DLDXOpJX0+1q4VPXS3NJ0C5Cy7mgzCsD?=
 =?us-ascii?Q?Uq3UHgLgwgF9gWW1kiWTXph3Vj6QkJ1RyTzumySVfQwJIaN+22SeK/W2Fl1q?=
 =?us-ascii?Q?bQJeA6oiZrndqKUFqQrTxEeJoXlrUqNz0+P1UQX8YOGofe3yPoTtOhdy3znm?=
 =?us-ascii?Q?llyxf64vVVrOwudc0IaMPzZwMLgQUN7Rzb14fm3u8YUus3+6pcPGbf/QxUd4?=
 =?us-ascii?Q?44JvHZfrHs/nQ9L5koRd1UIwwc/ERLE8YfdGGA7j8MvQWjopzeIplgpPAH0j?=
 =?us-ascii?Q?le0gG4DkYfnDhkmA/ucrXEdCkbyPOij5IGdPDWQMXtkcaPGeK8IbZJ5oww/Y?=
 =?us-ascii?Q?Sp0SCi7wE/0jeh/KZYn2//GyYwLOEoNC9mr3As9NhxOKF7HDxypSaqBIYoTk?=
 =?us-ascii?Q?0omUd87gKqS7/rB7Cyofwte16MwIMg9U+r2sOSCGlIAP2sth7YNtrtzNWTfB?=
 =?us-ascii?Q?cR/DZt5cLtQXvb4qVDDGZEb4dUHFHDa+BrNwcbsWoWpptss0290t9JdATVTZ?=
 =?us-ascii?Q?9E/Q4K5qtjn2Asi3OPcK/WHwxy7K9pm7HofPeFmI7oViDMbPvL5Er5tKlxp/?=
 =?us-ascii?Q?jexekGdYdiD+MEO3ne1IW5Z/o2hgNFEQkLt7y9Th6Hu+A9f6H8PlY7/OQBO2?=
 =?us-ascii?Q?X5ogLgE+zSQ87BP8Tt7UKegggtsvy7ZqhsPlkbxcFpYrAFfHySmwA1D5bOqq?=
 =?us-ascii?Q?8BES5ofHWVDJErKBbo7/jbNnjKZH0BSFVX7uryAUVkSMG56WmQNwaxkYKaE+?=
 =?us-ascii?Q?Q4bCQnuO1xNOcuRQYf+S/NR8fsOdHl7YqVGw/+z57GMjSSqMePGyOllgQyuK?=
 =?us-ascii?Q?f+mH5aq3iHMrqRIQsK8ogAWScmxjPw0RfC720w9Y3DU8g1bzT/uNEozf2DMJ?=
 =?us-ascii?Q?zWyiX/NbdLdTj+YdbyweI0dQH06cx2If+3Y4Irl/l1ubnAd/6W3srzd5J2C0?=
 =?us-ascii?Q?btK1r2cCVOISJOLHz2g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840f5dee-0ca7-4d15-e233-08dbdfa14333
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2023 14:53:11.2793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lj7TIbe1+fSTq/OzmcHHEveJZyBtsvUVr2tF4k9soWG7pxIoFBfx+WeVeR1lkU6lCMCoT3LyGwwJ5XJeXVyCDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4710
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Tuesday, November 7, 2023 3:42 AM
> To: Liu, Yujie <yujie.liu@intel.com>; Zeng, Oak <oak.zeng@intel.com>
> Cc: oe-kbuild-all@lists.linux.dev; intel-xe@lists.freedesktop.org; Vivi, =
Rodrigo
> <rodrigo.vivi@intel.com>
> Subject: Re: [drm-xe:oak/drm-evictable-lru 2911/3055]
> drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is incl=
uded
> more than once.
>=20
> On Tue, 07 Nov 2023, kernel test robot <yujie.liu@intel.com> wrote:
> > tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evicta=
ble-lru
>=20
> Why do we have this stale branch? I don't think developers should push
> their branches to xe/kernel.git but their own repos instead.

Jani, I didn't know we are not allowed so. Branch deleted.

Oak

>=20
> BR,
> Jani.
>=20
>=20
> > head:   d1f59526925ae851c6abf77af8ae6f8c3cffeebd
> > commit: 304baa8c20cfad330a6c7cad47d86043e968642c [2911/3055] FIXME:
> drm/i915: add a lot of includes in intel_display_power.h
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <yujie.liu@intel.com>
> > | Closes: https://lore.kernel.org/r/202311070416.8nPv4n6G-lkp@intel.com=
/
> >
> > includecheck warnings: (new ones prefixed by >>)
> >>> drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is
> included more than once.
> >>> drivers/gpu/drm/i915/display/intel_display_power.h: linux/workqueue.h=
 is
> included more than once.
> >
> > vim +9 drivers/gpu/drm/i915/display/intel_display_power.h
> >
> >      8
> >    > 9	#include <linux/mutex.h>
> >     10	#include <linux/workqueue.h>
> >     11
> >     12	#include "intel_wakeref.h"
> >     13	#include <linux/types.h>
> >     14	#include <linux/bitops.h>
> >   > 15	#include <linux/mutex.h>
> >     16	#include <linux/workqueue.h>
> >     17	#include "intel_runtime_pm.h"
> >     18
>=20
> --
> Jani Nikula, Intel
