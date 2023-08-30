Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93461C08
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693389619; x=1724925619;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-transfer-encoding;
  bh=vpsKAWYcGLquj+dX1fd9ouPzWW/dnCFJ8i0vuz7bLA8=;
  b=E1cnRpVysmdeaWy/mdq7q60I11WJ95pXTdHkUBdYQO6Vm9Ibpp0iZOZn
   U9z0gxpeNCyIaiYuXL0iFRMljoslT7cSp0MhSBFo4kb6LZ1c/ZMtKr2AP
   et3mX0EZbMbFA+gXsyxaQPbqRS3b6mHWAxCfOOVjkNPOYT/9Vo2rvYD7m
   bKGmSw0H/2ZsUDKrntVCVHZmhthsio+tGUyTRl/vFEY5Z12NOHpcmDjNX
   /IJofRdThPWM3/JeK63FCzbYnPLjqLRbf0UkTEMPybCcekqTGaJ4SS+ZM
   c547xfTfHmuVU1CYsdjydJzn7yjIe1yHXadD6f9XDgnBAD6UtyGKBO14W
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441963385"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="441963385"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 03:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688835407"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="688835407"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP; 30 Aug 2023 03:00:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 03:00:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 03:00:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 03:00:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuX3CD0EiXkhu1iC+BrMosPkdI2ZXTxjOvVbz14rG6aUldMaCZvSFP9gwlPK86HFojBHuU8ngl8iNLe3O3TORWD+bW36kf5sZkXVNO7+PqWSQUMzgMFe3KBbvSwnvdnh4wgMI+cjVZJ3MCGCIoVDdkWaYOqfX2xBmzaDKSHydoE+Y/c1sybqBc02RAirNpGIGgzwhmLXJLNICh0QaHluvloUllx9OPNlKAP/qEIB9GgOzljybOdEFbu9K0LTEjy/rC0Iai4wxd5qZmn47YvxkM3VifKtPaegCuUcFP0TzW1u4ddrFv/A4m/4oaxTXY8rSpnTJf+tat/Y7XTw2mVcwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVDTMbQPHPWuD4GYuGKYJeWQnihmzjjNGEkSK3bi64g=;
 b=crtbdw4JuGQzoTxEFtXXt1r2MjLhTmRez3Uon04L27yATJYZkM/BYhW2Ne1HwOrdWqdZ3JgoA8Sdaei/4ikNHfoAYxLfQetBqlcMEIq9tdUIodvi3bLFxpcUhxAsuDiq+eFxtuYmDHUUWVOResRHWeQmeuCfMPRc/y2VgUxqngvomzlF2KYlNRaQu2UTtpFBRRIxzWOuDg7rw+iOG2XQBPg9BKudmhGlgY7qJMhlpvNpBeosEQVbWnzKd+zpTTVKgBzRAK48V91wE8WGrSYH7hJn+FQppFrLhPcCFv86rDWAAtCTsOwcSSZTO9431Fe8cGmaya+yoPT2Nx5fw1Izpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 10:00:14 +0000
Received: from DM4PR11MB5359.namprd11.prod.outlook.com
 ([fe80::6470:e05b:d9bb:f996]) by DM4PR11MB5359.namprd11.prod.outlook.com
 ([fe80::6470:e05b:d9bb:f996%6]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 10:00:14 +0000
From: "Berg, Johannes" <johannes.berg@intel.com>
To: lkp <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"Greenman, Gregory" <gregory.greenman@intel.com>, "Ben Ami, Golan"
	<golan.ben.ami@intel.com>, "Golant, Michael" <michael.golant@intel.com>
Subject: RE: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o: warning:
 objtool: kfd_mem_dmaunmap_attachment()+0x201: unreachable instruction
Thread-Topic: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o: warning:
 objtool: kfd_mem_dmaunmap_attachment()+0x201: unreachable instruction
Thread-Index: AQHZ2yh5xBVLv4Tn+USFCTj/c6jb/rACmsrg
Date: Wed, 30 Aug 2023 10:00:13 +0000
Message-ID: <DM4PR11MB5359C10CDCFD07E05B0F5935E9E6A@DM4PR11MB5359.namprd11.prod.outlook.com>
References: <202308301712.gQOqyzU8-lkp@intel.com>
In-Reply-To: <202308301712.gQOqyzU8-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5359:EE_|SJ1PR11MB6252:EE_
x-ms-office365-filtering-correlation-id: 05630b8a-bc5c-4bf8-0995-08dba93fe7c0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N8jT2QQSjcDid0Z15FyGBwv6UO3BHU9G7y0OOsvfLCOP8lFVblollKoH4wIMRXdqQUuY0YQmaMApOqj8DKGb3P4yRD9QV0yV1aBFP3kAbb3lKFRzX/DwJzNgYGDaiwEKr8ONgLp7QY/CL4v9VZ2IfMptiZff9QZhU00aVs3x3I/8ohg24pfzS55xPl7zQs0qPC8lrKqk4yecBqWHVhIG29MdpRCGkz8JVV/QcdeW/jsvFY1rB2N0c9Ww3QcKHdx8/Ep8dznOkD1G2B/Gc1EoFoUdYIXSdo0jl1Hox3ezUgIZjwxE249tSbUr6/5Hc0g/FzyeskWsiwS5Wh4RgCqR6xMeOtg8C/5C8gk/bgzhcG6b0W55pJmslAV7w1tIqMu8cdk5Oy/9hfft8kph927oR8H15XKIvAnL0ff313OuMXn5dJHxHDNbdRp36Jy5KFdYKDS4GqYrRxPJtB1MvyJ0aq8NafpxXfBqhPzviNyWWZpjzNAmWK+tdooieAD/XqdWjEXCXiV8pPvYOtzPZOEpeTSChDYoqKo25CP4yNY82/wZQrefq0FKfq6Gs3/hMgNK+BvZvaNJ8qRJxgmZ627IeOnZVvuPz3yStLgHlJn7qtw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5359.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(346002)(136003)(186009)(1800799009)(451199024)(6506007)(7696005)(9686003)(71200400001)(966005)(478600001)(107886003)(4744005)(64756008)(66446008)(6636002)(316002)(41300700001)(66556008)(66946007)(66476007)(52536014)(54906003)(4326008)(5660300002)(8936002)(2906002)(6862004)(76116006)(8676002)(33656002)(86362001)(122000001)(55016003)(38100700002)(38070700005)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RNufkS2gKFem9Hh1E5GDTrA6U2eOftHLoGrBwbk2703tMRrzYYY1kq/wZrya?=
 =?us-ascii?Q?RvEZRAww6j1mbYnG8NAyN0wMxixHeiEfc1+trPEnxDpt5fLQXLXkhxDhFZM8?=
 =?us-ascii?Q?VaKiT69MZOCGitA0uAm/APpzQCk3jIK6RGAIUrSSF314K+yZXRRT3SJ+fGX5?=
 =?us-ascii?Q?ra62BVUfU/nvG9SUtzI6xdpwAAQXeJr7Gwfr/tnHbGKocmqYHOqm3148qTND?=
 =?us-ascii?Q?atTEFbe7jxzsNcaDCAugZb6yBzLnWo56w4S+gQNGv50WMHer2aMgqwZsXDdu?=
 =?us-ascii?Q?j0oQwXxNAeFDSpbOcNZWYyU4Uo0YoDI+VvXtCa81rBZaimNgUXdDRhB7G7Vx?=
 =?us-ascii?Q?Ht2dJsvTWWfu/nPeTpb5TnB/7/ghRr9cjvfj20THcO3bTXj95gNHPyoFiYWg?=
 =?us-ascii?Q?VbuOOgPu7tyjrbs1qHcsqRJfavdHn2z4fHVATQRh+rQ2YME6+aSNnodlEYPd?=
 =?us-ascii?Q?qPbdECH1V1nxUIu+acJz+s57mhBvTIT3WqmymZMMIYHNt6OTn6J/q2AcuaQu?=
 =?us-ascii?Q?BYCyb1+gRS/vBYteRvU/s5IbqFjeH4IEizQlaK4vZDpqyjBunsjQQHPCHwb3?=
 =?us-ascii?Q?ibNyv+v1B6yxtLClEe8wNC8bk1C2XeryiagcLuPJG0iQ2HWc5nTgBnKJdCZk?=
 =?us-ascii?Q?py+DoW7oIqe8WAeZBca0AGlyHav+N+turWcOGkrPn9mcnRJv2U6mwzNlUZJf?=
 =?us-ascii?Q?eIdHpV7g2YTKzjwjSHLeLeH6CDljUmTAzZSBAIvamejk8w4GFFpXmbIFKY26?=
 =?us-ascii?Q?irmYoG9ncsw9AtsYzkvK+HXmqWFsT+vdW3nqSRG0zONxpsRXZt4WHV7hnbXO?=
 =?us-ascii?Q?HjYAp9kcDU48D7wNOuYsUHmo+ePd+KLMWidwwQ/diGzhmB1BxB+gaho6isDJ?=
 =?us-ascii?Q?bVvdYrx2e+KLp9KEUt9eo1XqWudPhx+U3eCjuEIP8El0z5MZWrWXXYeYbA6S?=
 =?us-ascii?Q?C/brol4GFH9Spu7NcGsxPiMarh9vLVFMpAszEybEjfNoiblecrgckhCluVsh?=
 =?us-ascii?Q?0kAOAWyyWgQmWd/y88w5PHRdtnJg8CLouxmoB8T9CqX5EAUMc9q0FqdkfnVy?=
 =?us-ascii?Q?pg0NQkeun1lfeb+ZO+ypdh9eAg+cW9/3XZ+ObWNS2xOK+Q4vKaK4lxrnJB/+?=
 =?us-ascii?Q?/PG+PxHyMcs7BzIw3fvhePU1yxUFM6o/N0e5RtwuuzyliTG8GvS12YL4I8P2?=
 =?us-ascii?Q?x11TarL5dmhpjKzII0dIP0SiKd3SiyUCaYdxXooAC8g4xyhxYoogF0xTib7M?=
 =?us-ascii?Q?wjnNt/SJT7PfIsGW3qQgn9c2O7jX4opa4dPHGWQ1Z+WXmIGaxxzFrNA/+Ejs?=
 =?us-ascii?Q?aUihZPwur7oXA90AnysMSJgjREHJAU/aEGdl2JD90xpJVi3vyeTjCZ95GuwR?=
 =?us-ascii?Q?tG4Q5BDlC9QUXaPNICigBr4q3sy1ctUtexjUmApcIs+YGJ6i38fGTUdANKI9?=
 =?us-ascii?Q?pUYzYx+p+54cpkrLjgiMDkS+f8EMoyoa6wEggBuyLth/2mfFga2C5Cdbto89?=
 =?us-ascii?Q?v9sBhCwDXffw1tXTWzTMRoItH/a8nrXlgpRMo94Z6ys9OV3QaDzXBt+hZezk?=
 =?us-ascii?Q?d/fh2LpB0/XTRgIZj3mN97Lw5cxcvu2fXv+8Z3qW+wLQ9ldrJLZqYS+A6vvV?=
 =?us-ascii?Q?ytsXjmzkXgsW7HHbltJUQW4vXYlv6Z8R/TcDFF/K2iSv?=
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5359.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05630b8a-bc5c-4bf8-0995-08dba93fe7c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 10:00:13.9088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmJq6+3FEuUdyLqZG3bzzZC/33BN08Nsq2qPVBNA62uDGhU66PNSwBIWyriaBc+X2XK8kkmwGXOT/mdlzB48wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable

Hi,

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.=
git
> chromeos-5.10__release/core63-43
> head:   61b59f76f27b6ba04eb55fcc6b6d84d2bf4e76b6
> commit: 42e6a211eecffbf811f5d643272779a72500e774 UPSTREAM:
> drm/amdgpu: DMA map/unmap when updating GPU mappings
> date:   2 years, 2 months ago

Can you say why this is churning through some really old code/branches now?

We really appreciate the service, but looking at all these ancient branches=
 is pretty much pointless?

Thanks,
johannes
Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  =

Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

