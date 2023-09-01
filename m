Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E1F3FF4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693547691; x=1725083691;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-transfer-encoding;
  bh=hZ7+21HQ402Rw3vVh4iqOwPz0uN0GJplHC8h2Cjj39I=;
  b=I3hyp1TzP7DjQ9T+8H6nt0Oplr17O54xwrf/YP2PJqcLIMPwd6DAd4+Q
   j1nT6J21ckZGGmQ8G2WwqUbnFwRE9mSZQI6Q26zHcjFOw4Q9YaPOH+9mk
   xoJi6TDNjcFThA00iTOa8uU9gtr4ocq1QC+8XsDoIxZLOVmXxN0BRoFeH
   DLvteDQsX5zTX3F5U5aXVX3g4PpzpizHToRSBMImlDHajvY/+BlAsD61G
   JmzHrUaSKd/HhNT6rJAhVFe8yaNZvGtDwsH2KlE5qYE0eERO//s45J2vx
   oFsmISOwm0qjr9Mq3VbJEssUWHvPfStG/wqbnWwx4yqfTz9/ZCoTD84P7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378871500"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="378871500"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 22:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742994121"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="742994121"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Aug 2023 22:54:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 22:54:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 22:54:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 22:54:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 22:54:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hnvvb44g5CPX0WGE3FssEf/CDiXhzDA3caY6GsdPtNWLykhGk+pgOJhlxuC7CLY+IUfiCUIZSzVW36DSaX5b5DicvueiDhsmhE2Jg7iPnTC/tOBkZZ3xsICGhFbfA04meXiMZJBH15DLFsKnqSKl8+uS/Q2MKQVxVN0V59lMkGnTenqkFWmb4r1m2KNeavSM87y5ekkrSisOZLwDBFOV7knnrfMgIfF8la3qZK0mMwV4FZVtxlBXfAD4qBNBnTclTaMdNurRuGhkeyz6NH5ghukobE4k/NkLv52D43XSlO86UTudFLUPvWvLjrOK0U/CDYmV4mxV3+lEIgTwGN+bVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACM51mTMc59EES3Mj9mfDyNx/UaWTwiuxuPAj3NM+TQ=;
 b=eZGvRK7/v/zXNPGL/McJRboNFhzmfjNnI4EMj11X0OaktHUyaB7uUU/cBe9iNHKuluezKM2x/k/xb1yJjEkIfyLBqw7QvcEX0Tz7q6SGtm66sHxWis3k1zNsFf/Iyw7ZhQe8nZK4hPYDj1xkLnCy3G6WqLlYZ6d3VETWx+MP6GTRQVZOFj6KTwdCYVDPIxglDvmIppYRGzHH/5KO3BjtcrVvml5Ht570JmGBEiRAec59M/4w4zZHtETcY3He8CBzdUn0WDx41bO7/7lx6VI+kqqB3OX9J3BXii0eE0503YWibfH1Njg8txpdHUz4qW6InjIJrNCs3MIcRuvELf9s9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5359.namprd11.prod.outlook.com (2603:10b6:5:396::21)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 05:54:44 +0000
Received: from DM4PR11MB5359.namprd11.prod.outlook.com
 ([fe80::6470:e05b:d9bb:f996]) by DM4PR11MB5359.namprd11.prod.outlook.com
 ([fe80::6470:e05b:d9bb:f996%6]) with mapi id 15.20.6745.023; Fri, 1 Sep 2023
 05:54:44 +0000
From: "Berg, Johannes" <johannes.berg@intel.com>
To: "Liu, Yujie" <yujie.liu@intel.com>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "Greenman, Gregory"
	<gregory.greenman@intel.com>, "Ben Ami, Golan" <golan.ben.ami@intel.com>,
	"Golant, Michael" <michael.golant@intel.com>
Subject: RE: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o: warning:
 objtool: kfd_mem_dmaunmap_attachment()+0x201: unreachable instruction
Thread-Topic: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o: warning:
 objtool: kfd_mem_dmaunmap_attachment()+0x201: unreachable instruction
Thread-Index: AQHZ2yh5xBVLv4Tn+USFCTj/c6jb/rACmsrggALdegCAAALOwA==
Date: Fri, 1 Sep 2023 05:54:44 +0000
Message-ID: <DM4PR11MB5359F5395D11F4411306FFB9E9E4A@DM4PR11MB5359.namprd11.prod.outlook.com>
References: <202308301712.gQOqyzU8-lkp@intel.com>
 <DM4PR11MB5359C10CDCFD07E05B0F5935E9E6A@DM4PR11MB5359.namprd11.prod.outlook.com>
 <ZPF6Gt2ZcA4kF8XT@yujie-X299>
In-Reply-To: <ZPF6Gt2ZcA4kF8XT@yujie-X299>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5359:EE_|MN2PR11MB4742:EE_
x-ms-office365-filtering-correlation-id: 68c3b145-d1ef-471a-d39d-08dbaaaff12a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SKoBW7gWCh3RIejSzuHs58Lx0C/JYitxret5vlf6uZEiYTCo5Pe9hRJchWIuAUK9gE7PQSLQrZeTSfcqFNqG4/2vR/uHdHVFlh2/Fi+nTCWgcjtLhdhQtweYGqL+7sTybkjmH5z5lNWTRi/cbPGlhX98nGTTZzK9c1dybHophaHS5QlAN0EtU2g9VNuACbwp+4ffCAEvpr07m0fcg0jvudfDoZ/KTvsZ2YXVg+QGQoahWcn1l1nAcI4silWG/fbxdGJY/NzNn8GcYzY6WAH4ppkNQvc4wtkMSAaKnRDqit8oi5R3TTpbuWKTPqfDgvxb3RWMYUIMH1f/KRfS1ZRwiJ4a8nBSa5Hus8yEl6kNty01uWOTFhd4l43yoKm+i0d8I/GPdgEQG6sMhlGMGkoXjmttAnx9LCvHdGqCBiWgCtcAzej+EgAa77n4Wz28CAriyo/LMLL3TPpUWBZm2q/koBxt8iUIZ4v9A9dGE91Xjr0pvyANGx5kigqt4r3OcDj6JZSneFpE6biiskhX08H+Enm72gr2/kAZ9LWx8USO1LtVZ/n1z4OlXLnvQHCmfyftuSC6J8sNR4pQHAkZs+u9HVkFykcBuW+Le1JXUDi70lKd2d3RcQ+11fC/pGKx9+gg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5359.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199024)(186009)(1800799009)(7696005)(6506007)(71200400001)(9686003)(478600001)(83380400001)(107886003)(4744005)(2906002)(6636002)(54906003)(64756008)(66446008)(66476007)(66556008)(316002)(41300700001)(66946007)(76116006)(52536014)(5660300002)(4326008)(6862004)(8676002)(8936002)(55016003)(82960400001)(33656002)(86362001)(38100700002)(38070700005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WJA55LlIuSGsSg/vIGxorK8JTe9RzC6LoWOZYp8r+LvUWF2pDoweSKcIM05q?=
 =?us-ascii?Q?4acoEdMPCErxT1fazVP3Dz3gnCfp5hO4GHk9A37yoHKqPa3WSm4Yp7ZRG701?=
 =?us-ascii?Q?pER/Zm3JhtMcCyKzdivEn10OMk6zeFonB/n3bJT5yDgWihzL43Y6BITOI/Jv?=
 =?us-ascii?Q?TePHN4GpWwnlTFrs3Yv6/GaFE6jlGPYwRiaCjViw9HNpZsAV/nYYGi2l5A9w?=
 =?us-ascii?Q?/Va/cggeRcikKGmunZ9YOAVJ5p3lAd6bBP6gg3kMHXA3A7Qq+nRiUJgcHfcf?=
 =?us-ascii?Q?2LjpIGIadYTetw+eUKlAxG0Ec1BKc2bf8g2MXQmsAQAhxeJVaxAg6Zbvbc0h?=
 =?us-ascii?Q?yNu3hX/3HZFoXiii3Q/7vTLcpHoT2piidGsQpLZ+0XzDuGiaNmD7YIhZAWx2?=
 =?us-ascii?Q?d7cVPE0mZjm+jdZmuK40wMqKZk4oqgr4PuVJv3Tvaaqv7K9ITSEdKElK4NcF?=
 =?us-ascii?Q?yCstGFyLz2UQb5k/ySv05IWHgiHBbgc5hh+ekLKcwwc6ZGfi71gauGQlSHa+?=
 =?us-ascii?Q?S0IBX7oVarxTkQ7GKQD4t4i6g2vJNUNUHP9S0QBk1ZZ0btcFqlCRUst3dJMy?=
 =?us-ascii?Q?cYloccafaVYtUiPIxjXSWs9XeCVzhlzW+poDWdyAiaPcWw3I4RUhVKWuloyB?=
 =?us-ascii?Q?N97tTVIIZrjpqPiNfBhDse9XoyDeDndj9y6c0Wm8RSEYwschgNnc1WE3Vbss?=
 =?us-ascii?Q?6D6DaR/WEWPPfCAVLDdvTyB5Gs0V0rzkBwdtlGCqOCyF7RqK/Q2Gc6B0kUno?=
 =?us-ascii?Q?se9kF4iKFasJgA1z1MwLzRV3zkdmlAiOWZGfIkZ3wHg0+gtV9Vs6RVjf+fPx?=
 =?us-ascii?Q?ICqZSNLQl2bCA24tYnH3RqCLhUyQWZ423vgdA/vWitT+zaUp9GHwOFc+jLlx?=
 =?us-ascii?Q?AyLGdqrrha3k2mhsJ4s4vsm9b7pwVt8DV6dhEMpoTYi6nM8/8fcaPPx1yT3s?=
 =?us-ascii?Q?zSuuXa8roUGrpimbx2olN/tCY884toRUbX31DSeFcRTQhSJ8aN00ruJouLKd?=
 =?us-ascii?Q?8b9m/2sktZbOK+gWGtRDvbywylZr787aDA0WRHFYDbi3vRNVWm9m9CmO95NC?=
 =?us-ascii?Q?r97FITsQvMreAui51MrctK+KoAOQzv2lCuHnNboRATiNl9Jh9FtSvdv/Ce1l?=
 =?us-ascii?Q?gho6WEaQ6rlL++HJo7dU0MYkehNvJyBSO3JxFg+lyyH/NEGUXjqhsn48TJeL?=
 =?us-ascii?Q?xQK9bICzZ6/Qp7MgHED1IalCPC2ZzWcDeWb9u4YV4V355NaUj2wCwKhQrqQF?=
 =?us-ascii?Q?xhrlWTwql3B4Niz7K0WvTbHh9QhdM6kIfMPp6hTBl7IskiQmlkq2HFid2/d0?=
 =?us-ascii?Q?6IYFAEy9n+6AuIzKJa8rdtIDml47hfeaJgx9hro0sAMTJ1aSqoCkwYhIJ9Yn?=
 =?us-ascii?Q?QeMHQZ7r+3dk8pfkcPeGtikJQ9+vLfXuFWtP0UC2LHyp3Wb7YY3D/kZpRGq6?=
 =?us-ascii?Q?1vuJ7frXEHy2K/dGsDH+a0jEQcg2cqJ8u2P81DQe0KaUG6t1Su7xF/gsEPHF?=
 =?us-ascii?Q?yyZM6Fw/GNLjLN1UoTytdjMSx81XNdvMgIxIUOj798KbfNm/mL0zOph/ByQr?=
 =?us-ascii?Q?85nvVAeY9Bxg8NosMlorLsp/kPxz/x9ayDE4hNItLhnbZ1SAIq8chhgjRqN0?=
 =?us-ascii?Q?DfzJ1VmM43L9h4FrJvzRVOTu0pYy6+/WxTKqaTFPjCWj?=
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5359.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c3b145-d1ef-471a-d39d-08dbaaaff12a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 05:54:44.4999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XhSE7g1sIyif9dXz+by8nqMe0SBS3qstV1Mjp0Je/H1V8mMVYi1MA4zke69SPWKAD7scowo+a9JW4/3T80raDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable

> > We really appreciate the service, but looking at all these ancient bran=
ches is
> pretty much pointless?
> =

> Sorry for the noise. We adjusted our test coverage recently and caused so=
me
> reports on old branches by accident. We will update the bot's configurati=
on to
> filter out these old issues.

OK, thanks for the explanation.

FWIW, I'm not really bothered by it, but figured you were wasting cycles on=
 something nobody really cares about any more...

Thanks,
johannes
Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  =

Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

