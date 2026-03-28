Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF0B282F13
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 01:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774660309; cv=fail; b=JoeTxKZCfy+0Z0XhA4Yx35mrYDdDw2Ijr7j5SEbwftPP2e91FjqoF41LczsLV8k23vrNKW539I+vopBIJXOx2L87ajRDk/Zz5cG03QzfgYqF/sy/DWG+erkXHSbbhaLI4jWUVT38vz5pu1lnLhVSaqrzJMHe+pjWumFq2Kp/zyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774660309; c=relaxed/simple;
	bh=qJy14Psz64vBmoFNJ6T7w4gISVOU4KeSdfYawZgtP+A=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qtyGSXBtUZ2Co8u6FO9OryhNniH9AZztMbqVb87EPtYDusG9WSsoB7l2d+SmNqgH20LY5zwOUYa5J1/G7ZrVAiBng6zI3dh0LKsBSBxlnAaq7/eU3x+MvnBJTaBxPI0AhTLJTnS/EBECpMJNsFv0EoIkysc0+DyLCdculFeAjKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rvz1aCdx; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rvz1aCdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774660308; x=1806196308;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qJy14Psz64vBmoFNJ6T7w4gISVOU4KeSdfYawZgtP+A=;
  b=Rvz1aCdxsAabJZKmd3PeC0IcmybKzyZUGQZ2iOCihNryMTJu6w6VZ6sX
   +MnIWTdGFz8KgLiWD8JJUsvU5NXURqUsHyVPkQ2nuE+EsuAn+bbdBr1ju
   pGap93uq80B163ARbEYijkwt4krvR/KOT9IvAUzgvlKOXiba0IvJA9jYQ
   a5ltbiHVDa73HyXFNdxcBx7hf4fySSUUVMCbcmlcbbpIPKMUbXxdhGTdI
   B5O3c608YpYZiX8lAfMX02V98V1cki3ontjEFbLAiKDPKv+MBsisSYLQU
   JthGAyltG+SN4ML4x8WMqHI6Ha34Xn7E4XE+cTuxaUAOTtf2wx1umoC/t
   w==;
X-CSE-ConnectionGUID: m3aSj3EBRCGtXls6+DF6Jw==
X-CSE-MsgGUID: PGivhDDHQgK6q11w+2BDUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93319443"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="93319443"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 18:11:47 -0700
X-CSE-ConnectionGUID: XFjjUDzKR1ag0t/K7zFsgQ==
X-CSE-MsgGUID: bWJ8CWSCQYu58Rqf6yWrlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="225721748"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 18:11:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 18:11:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 18:11:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 18:11:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7GukvQtC+56feadUQjOhXCwHcdHf2PyQaWmUddqlIrQFRm33R6FPsc8Ca9XFvbVePqgC+PPvRnVrTnaFqmEHb+PdjxzfLfhssXDiYxc1Tm26XucIcg87DQZZLW4JkF0NasSemMV5vktS4N2xykeEUpfqhPNiQUgHR//zT5O37FRWFnXX3xr9PVkYRNb1/sXe2mamp5CU6HJd7P3dTmBu9+dHgeXFRMqIT8K49w5uHL6A5okRGQ5uQsLEiVglstAKuSqwVVtZHWf2klj+52TyQURT6xWumnfMkzw/b1hk+evQ1e0aqRc5Wq09eEmpmNkX+4EoQ6bf/YRKbsYY+ma3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmPJCNyaj5ODo3HyW+qDYrQo5PKHGV/c5PYgbBaUW64=;
 b=GURDAMJoRe7RCHrnuQlUHv0bvXtV4TJih13mf4WWWCmvOlm3NBLbFVuZ7UawLV+q9eLHHoW4fIn6fs+LxTRFABFBkw2Z5xjgId6Hw/RykQ+e0ltAnPQpHq56BseuSIhPhMPNfBlabdJAs+IT5m69imP+6RVQ43hSHaLujKvblGTMZRtux/dLSjB+eNfy93eDiJU7zznapER4aIVN9O88yjXKlrkQuXlXjoqkBoFfrPBivcWw+Quoy2Zzt2is47XpBJAumfhUbKp0y0efmU0RHAhhJmAw/o10RDncrEBENX1U4ePOqOKW93A0ZEc37T/xI96AYGd9MtLaEFcMJOT2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2810.namprd11.prod.outlook.com (2603:10b6:5:ce::26) by
 DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.10; Sat, 28 Mar 2026 01:11:38 +0000
Received: from DM6PR11MB2810.namprd11.prod.outlook.com
 ([fe80::ea30:bd76:b054:6c8c]) by DM6PR11MB2810.namprd11.prod.outlook.com
 ([fe80::ea30:bd76:b054:6c8c%6]) with mapi id 15.20.9745.007; Sat, 28 Mar 2026
 01:11:37 +0000
Date: Sat, 28 Mar 2026 09:11:25 +0800
From: Philip Li <philip.li@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: tc358746.c:(.text.tc358746_probe+0x472): undefined reference to
 `devm_clk_hw_register'
Message-ID: <accqvWNLYhW0ABeV@rli9-mobl>
References: <202603260904.0mYHPZwr-lkp@intel.com>
 <CAFr9PX=WBVw9jzokOLpsiPG6zh54_V20M53ZNP85UJmOJ9Jy3Q@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFr9PX=WBVw9jzokOLpsiPG6zh54_V20M53ZNP85UJmOJ9Jy3Q@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2810:EE_|DS7PR11MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 934ff9a0-a6dc-485c-752c-08de8c66f3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: baBj7he3Eh7B8J72KehjRhgfqxj62XR+TX3pLW/nkHeZ1+VLZHkOeVhkuUwxPz3AkVQ48oyH3YsYo6GSqvxio7iM/sdEmvmI+Fb/0/zzmoT9Oe7spf9zwUqz+BuLhd5nTqCPp7bN8H66cH0tmMcYT7TFDE4Wd1iToTrPboktRH2r0a/3X0Dap9eX3e6xyGllD4sIj+puSm1YzH6nclSzQM0GpVGntrC/whyREb1+G5CN0TfyOqY2lcfaJldo2gzwz/Yq16H/0RsNky4h0mMtpvmwGYMM1MNRA+U75RIjK/eq+BcZy/kxSQz8gFBpsywrDlNnJhpy9AGRDMOze4bgzW0ZJIvITe5F+isdWK3ZGkzwjF/TjbGjXD+D2LyxQJWheTdekwzril7KdQLgudBkvZ2Oj+3720r6PAgokB11qv92uOLLc5+uM/N9rduN0Om1+jJaeZP719Lc1fUcwigokAGw1SUNr4jK5zsgmEaxHYl8+/A+kcZvbI6/3m/DqoNRORQNOcDnaOCesssv6opSmnkXm3WMoobtKv4K3OZM6dpk4PRwxSRf6ymTtjwjQRj1Vm47nWGzq8g9TFnB1nXV/TxIIffRcLpqpZzCLenq2C+6hhYuyvs93Rs2T0GGKroQGsrtnDShEut0AlNnlrsxUCRNOgrrxbaf21Bif7xzPfQ1xj/NetgAWP3d+kE41Hrj2P/7CIx2cqrUbioluXFLe9N3kgoPAktdKrwRZSi8bJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2810.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bFBnrRq2kmyW1HOEWMNl5St6Pbc3OwhwU2EQ2suE4HS6jT9jirFOC7UyBoUB?=
 =?us-ascii?Q?rr2gFLXzOfAwdHYIndfi7HlnkxOwRYWCv1OzsEMfFDVo0ksxuUIlM0JsXPB8?=
 =?us-ascii?Q?w6JPEunvSH1uvthnOj2lu5PeWC041JzHWgH8cmsqURvr+V7DK+zE1Vgsx1BC?=
 =?us-ascii?Q?q/e+dLygv2OOxOvxavTiribEr08iYvOcxFCMAHStiMx3kjRQrFEuSk1oWCxX?=
 =?us-ascii?Q?fonHwuXhtKnqJTcNNgYp5MwaYoLK2rGkrGURppR9xj9zqOIfY3PCAx0PPK38?=
 =?us-ascii?Q?9297KzRRF3U+kcJKDdN/cOtEMX6LevjQCh4tjC36PjfjyBG0WeZr7JLZspJm?=
 =?us-ascii?Q?ksELrByrAD/kg+ScVkirdXMElTXm0xfY30HTXlf9ArLRuNU6ApT84eSqtykz?=
 =?us-ascii?Q?h03vMd8DZRTZyaJnOE/sg+QQnoTEAC+f0xSqSTRXvt2rLqUFzsVkisrmcwEx?=
 =?us-ascii?Q?/GQ1PV43Ax+p0E4gsf2p4fqi6JhWVu3ikVOfVUxkZhl+rXYUsc23b/ONnL2v?=
 =?us-ascii?Q?0kyvkUqKJOHYKKQTd6gqNLJbZtzFmVhTwvQV1IqjZSlnIyCSP3Y/aW4L2chy?=
 =?us-ascii?Q?+fVx+XNdQRuQsR8HqqXwH+u6IOqYK0qVEbcQWRUarzCP3pTtVVEWUmzj1fXu?=
 =?us-ascii?Q?2Gm2giEszuxIwD9J8sTA+UHC1UQROjkcFDhBNKUfYQJljQisKFg3gNj+Or5j?=
 =?us-ascii?Q?SZNIUv9dWBTIqka0VcUYOgHrJDPuYA+nFpyuIHDOMIQwFYGt1ODqTi75LglR?=
 =?us-ascii?Q?5BRAhnu7vdWAufpSHdx1v72g0Iu6dhYQYGOr9mbhI2W5ROuy0l/3l/sEPrCC?=
 =?us-ascii?Q?mrl69eDzyaYbL9pE/bGqmCJD0yyxkRSOC6B4J01i6qARSW3Df/tNdgh/ctVL?=
 =?us-ascii?Q?07xM6XrOFJyYBcVXKXD1w9XglqoJ72C0oi3cEhrS9bJYYLgOLxUlmyNaozaq?=
 =?us-ascii?Q?5jXW4WhiSeKsQwMR+k4gEoOFANojn8PqeFQ0fLZ2w6+IKR1gpF6cwG/am5Ia?=
 =?us-ascii?Q?QOeNefei998izK3sl6Guxv/y4Ulqp9ucvXUz0G/o3uIuY9UJxvjFxKBkd8X0?=
 =?us-ascii?Q?Q/3nWUirPLUWObBtN05JFHozf6zKEqFF4EbZ2ZnV4/ml5tsCQpXMsy5yOZSS?=
 =?us-ascii?Q?KNC5t2X+LZht0Pi8jfknDrsu5zMZ++B0rLZoeD1MXXTNhaMzAmi410PVCLIQ?=
 =?us-ascii?Q?AxzN3Se6jGU93LicW8KnLRcitg3cSVF5sEuNjyebAgASERoFYxHjvbaVCXxa?=
 =?us-ascii?Q?y34hxcx1tf9M98cEImfoSMvITDb22PkgJet8jbNw7YZE9HFQpS6Ze7GetctH?=
 =?us-ascii?Q?oRns4n/evJND6gqKldJcezPf09l2QF5suQt1lN32h8gang5H8PbDf7VbicbW?=
 =?us-ascii?Q?6Cc07WNyE0JI+L/R00pkfUQ5hRKzQGxAMIZaHM8wleD2CfLks+ZqO5pW0rtU?=
 =?us-ascii?Q?CEGewzvcZgp7MAX5WwZQJrNs3SexrQprFfFgvZEmFl7zato7nJkS6UtaqEog?=
 =?us-ascii?Q?VazuHa/Wnz2DwT78kSggfyRe6Zp1CWypwxfM7Un5tDce73dwxXZy5FA6hIiy?=
 =?us-ascii?Q?B42J60egcU0zf402hL1YEY4NbE1uMlRtunGaIHduxXpJuVgjRSQGTY6+S6AP?=
 =?us-ascii?Q?RI++7TtFM66a1Q/OLKkasA+B/L9OngnWuTsVe8P55+IYsrsOtcsAdpa+X9qf?=
 =?us-ascii?Q?W3k9bifNFCV6o55tjN4T9gsazxp8+jKB1NJ+3lGs+PqBcs042BClHZDMzc18?=
 =?us-ascii?Q?fYWiC7V8Bg=3D=3D?=
X-Exchange-RoutingPolicyChecked: TAijLGns7cJtjWOOEZwJtFGG13R4Qdw0XekIkbzLAYqcm0rgawpq4IVO8wBRr4WDPRG89LO0SfqUvx8cOsn1gD2mbKtJ13Si+YtzpPp08fGGs85zTvn5Q1FSljBoK0DcrkhKetWI4AmIfi7EN4M3UnCjM54P0r+QgKy4djhO/UfUv67nyX6c7pMp9PiIcuvu6rjQyEvF1/ddCHw61CT68z05UKojHjb53njHmtuIu/Tansp7/m/AFugqeKKJc3Lco00LjjFwshl2tPKaUu0YsmEWcMI0LjajpOmNm1F5VdxVYq2gZtJqY9K8/S1/nPuUDDxZjrywkQdkZBIzOeg4UA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 934ff9a0-a6dc-485c-752c-08de8c66f3e1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 01:11:37.8622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESZWvyjCwTvOUJndzZCdplbp2sKh50lVW1LvESoTAbtClvS253asS+TVaYEz6hmwg+jpmtvof+G+7hh56cLxFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6039
X-OriginatorOrg: intel.com

On Thu, Mar 26, 2026 at 09:56:27PM +0900, Daniel Palmer wrote:
> Hello robot,
> 
> On Thu, 26 Mar 2026 at 10:13, kernel test robot <lkp@intel.com> wrote:
> > All errors (new ones prefixed by >>):
> >
> >    m68k-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
> > >> tc358746.c:(.text.tc358746_probe+0x472): undefined reference to `devm_clk_hw_register'
> 
> Fix is sent but the issue seems to have nothing to do with my commit.

Thanks for the info, and sorry for the false positive. I will do investigation
to see what the cause is for the wrong bisection.

> The driver isn't depending on the common clock framework but using it.
> This would have failed to build even without the blamed commit as far
> as I can tell.
> 
> Cheers,
> 
> Daniel
> 
