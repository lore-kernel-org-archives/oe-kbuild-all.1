Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5886B3242AB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 08:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686978; cv=fail; b=Dzzdfb3qGPdqZL0OHgHO4/bL5mvJD+E2c6Nf2ZkxUycTyEnrcsVkLZyFF8NED+0U3VuQiPcz48R86ZaNiw43h2wHZre6Mm0GeNCFuHF7A1niS+nvnp0L3MNMwhLhFQrI7cY/bmv0unYkoUFatvA0qPji8qabB8wi7uT7fcRrnKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686978; c=relaxed/simple;
	bh=8lQARGxegIHxnEvCl/0HrttH+noRni+1Qm6hm/plLVY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WhW2C8sGYJ/qG9/ZUQe+nG105LeYr1O58GennozqsMHvmZcKHhHGW54jCHOex2dH3/oj/0IsrnAunVB5DJ0JOLgL9WxSXFMkdxDy1k416UVzcBhWsjrCn2xU2z1M6iaBUJWn1sx1Qs6/laFnAgl+bx1bHqkawsfYnKuWhnW6ths=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uap86KIP; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uap86KIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767686976; x=1799222976;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8lQARGxegIHxnEvCl/0HrttH+noRni+1Qm6hm/plLVY=;
  b=Uap86KIPvdH5ds9wzvzZNi89vDobhm2GWyTy/QFbnQd4PZQ/smuupa1e
   nEgMaSb8UrJh3HOPmvzJTwlujwPRwQs0XuKrCxl9ruE/qvq1GDxProfqP
   Amy51jakcdJt5VqcS+YdERBhy+IUL0mMAMnVrwOpePvbGK1Gp13C4Au77
   h9vyfMavsjzFL6sA0iQCj/zOiCzSnQ5BntdBSPZVID6W5RKRHrOLTQ06c
   /t7360DtqKp4CkvdlajSM5MNI3TmWoGUFBh3xpNaVfr8d4ClP2s9x3PWX
   xhbwht+PsH+rG4+A24MwEHwfzrWnDyflyg0JsXr2Q51i3Vwl0L8o+8z9D
   Q==;
X-CSE-ConnectionGUID: XqfELd6aSX+niuG4UIZt9g==
X-CSE-MsgGUID: DdKfr5ZZRN6l5pkB/x/D3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71630527"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="71630527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 00:09:35 -0800
X-CSE-ConnectionGUID: lz+xMcCZTN+3689XOvme4A==
X-CSE-MsgGUID: xjWhfCiWRJmOA+iZW/of/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="226145744"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 00:09:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 00:09:35 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 00:09:35 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 00:09:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w52NnroUjT/aLEN8EMyRdFHNLt+evJYckae3wGGHzbRcqEMYjgQaD6edVuPOgoXDripZNhNI5nMEWsUOciXJAjUshKc6tyHMW78eK5pR0Wl8rzRNypkUWXEeMFwd5crVpLPbN0DX5WOVPosoPFPf3bwttkTAvYIzqSbGkGfLVABFobSwfh+9zWIwTVh3mlc5xykJvLSUdm2VNvVfgof2S1NUOIC03HxYodil5sqMm56M9D3M7YP2JcWMCb34IkokGJyL9x+SNXnyH5+OQOanDi6r7LN1nsw975jKtGAKfpBwKnP1p4b/S68Q9SUe/V1FkD+p+VcuJAKRkxMTHcgLqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V09ahbJiGI2BVr6pUhudr4pvBk6+f3VRnhDVQ7r7Gfc=;
 b=TLucjZr3EFR9LX51JkisFFh9d6AgIwcIEMBq43EAoLQFPJJ/IiTQIZ5P7tCWJ+j6NgLY5FA4nSN5iX6JGhxBiHnT294pHpzXfWsrb37hR37gNYRMNgX0UQ3UE4jtcMoKLadvSshg9aYcs4UfLM7wQERNVOJZJa19GxBZlHh60TpxEw8/0Av47rko7UNUyDsDxDei/zzAXpFfWFgonJezBBKBOxj4jo+i9kIwQM3yyux9f2lbiH21qdDXvRJzrALfxeivAgm7A3qSusTaA2n0+JQpljWCFfzwdWro/HpaY04zLUofiXKJvbG7WIz39wlQ09B3jyz+Ef2/uQ3i26azUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5271.namprd11.prod.outlook.com (2603:10b6:208:31a::21)
 by MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 08:09:33 +0000
Received: from BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::780e:4379:6988:f48b]) by BL1PR11MB5271.namprd11.prod.outlook.com
 ([fe80::780e:4379:6988:f48b%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 08:09:27 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: lkp <lkp@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joerg Roedel
	<joerg.roedel@amd.com>
Subject: RE: ERROR: modpost: "__pt_no_sw_bit"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Thread-Topic: ERROR: modpost: "__pt_no_sw_bit"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Thread-Index: AQHcc5pQhVZNJRjzq0y2CS83MzLOibVE3Pgw
Date: Tue, 6 Jan 2026 08:09:27 +0000
Message-ID: <BL1PR11MB5271B4C385F1205E98B8535B8C87A@BL1PR11MB5271.namprd11.prod.outlook.com>
References: <202512230720.9y9DtWIo-lkp@intel.com>
In-Reply-To: <202512230720.9y9DtWIo-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5271:EE_|MW3PR11MB4652:EE_
x-ms-office365-filtering-correlation-id: b9c8dfc6-68d6-437e-cfb7-08de4cfae934
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?ApnHsJKfmowMFkDOwwPOdwUJMdDSyk9fF+TXvIntqp5DPxEUIY4eIUYrwFYR?=
 =?us-ascii?Q?y1/uAzXEU9BJOX/vBql8m4Kl1sWwWWdY3i6BGIEKoi+HTKMo4G3LjKsfJ6tc?=
 =?us-ascii?Q?cu5EW8evI63SlYYgfzWo4xAeKu3QQWSSGAbo/dqx/xMJe+QFPs/SSEZBqyPu?=
 =?us-ascii?Q?FddWkDD7CmEEDMqnoQ2sK0QrRGvQTCenO1YYFaVy31Xq79jDjpvHlkXA5ugV?=
 =?us-ascii?Q?rpufoNIFychX6IzzSgkzp1vwEFuaWVEtEKXUcUzxk6NL27TXPRW/ReCni6M7?=
 =?us-ascii?Q?wq9IRwK9FlddXWlGDGztGoXnPx6N1yseZpN6E9aNCdUm9cdMgOgCVOEG+Wel?=
 =?us-ascii?Q?RuBYcGIYQyp69Zf3oH86CfrEFs5uJGzrMJh5y7DSygRgjHkJJUnax15wh4uo?=
 =?us-ascii?Q?AF4rhfLYSkFleRgh1YQxUFVG59dlN3/w0/5p3oyin27ScfiXM0KH5wvImKti?=
 =?us-ascii?Q?48NXN1pkm3fvmha2MUdMBm2JtLSmEoqZvCqBsaoCnhf2YT9+4G129AvVS77b?=
 =?us-ascii?Q?/t+Pd7jxFkfy6ICZJ8iShcoruoWS6aD/DbNC5OJY/aX6GXOClC9L+0U76tG7?=
 =?us-ascii?Q?lYv0kr/UwCJZmnqhVFctahw3yET2i84jTaEtYcfUVAFmSoVo5L3fyzg/9wMA?=
 =?us-ascii?Q?gZDWeyiNF2eOuSCbeDkqz6+5R1O/GhwAF0N1QT3C0TdTC8v5xpsncuw9ic7x?=
 =?us-ascii?Q?Bsbz0lGMkz/lqf17jEjc1hwzkvdgGo1ItUmc3d+5jlOnhpkcbWtAcSKsjcJb?=
 =?us-ascii?Q?QD+6zAL+LcBNAPu7S4eal1Rw50fJcnLI8VBPEnZU4HaywUtEBbGzlK4SEBCp?=
 =?us-ascii?Q?PfKf+8IJwsuC6j6LI1ZXY6qh5AL31wgIy3EolVXA318xNB+wZouuG6PigxOk?=
 =?us-ascii?Q?NYb0Q6lekyt9QrzvJWmKMyHSh7K8FbFw8rCTb6PEKIkF2Dv1sr5dmFa3ebIa?=
 =?us-ascii?Q?Cgs6RIy9WIl0kHVy89b5mChPODGnAp8VDRZldNPDyoiih66UIWqwmA8Fay9q?=
 =?us-ascii?Q?9azzUfwu4C66h10Iep1LAApxE4F7XSPzmb4uPp7wR4tYPN3U+hAWLAfpVVaT?=
 =?us-ascii?Q?/cx+oIPGrmsC/8BRW5Uq4Ebzu+GcxUSyVyXfStgBxDnZ/aEcJmYToj9pCZ0q?=
 =?us-ascii?Q?nElcsHMvzQD8XfJYobUePh7XP6N3g/pkqPt+41iGCp7W72xDrxq1n813jJjo?=
 =?us-ascii?Q?TSeurflCtnu8DoPw9aYto+XXM5v8kzS4v4cLy/WmIGNKSvTyZPtw/7O3Ga8y?=
 =?us-ascii?Q?3JgJh1RzYY8Uo9bR3X7GGeHf81YojiePU08yvPsicRZfey6Ol5E06jWG+lEH?=
 =?us-ascii?Q?2FctseICNB0MWXIKUbophXlE3UDS/e9PKYm3kzRTS3a30C96nvhfJ+cf2EGc?=
 =?us-ascii?Q?ECe3UZFpWzSNojISkD5/Ut9nMsgkY1KwQHUFmnhWu1LcTsiQ1Fu4kj9fXGmR?=
 =?us-ascii?Q?1BXPSmg7uLrGhKFmrKz8Dyeu62Sv5lmZrxyDUI5uG3N0cXYp+b+WYeLtX0U5?=
 =?us-ascii?Q?ONU7we6BrFXP0jqvsS3r7Sg1MYJpRAx/b0U8iLNjDmzxax4dIDzok6MPUg?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5271.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mqgfB35+zn/3zD0QbKo3A60MPrAW8HTOFCa6WQ7q0i1TCz/Tj1t+tDeg2h5a?=
 =?us-ascii?Q?K+338U7rbOAKoONPzAuVutxLYRZ7L9zhcjBwDNvw+hn1NrEVd493HMaFn1mt?=
 =?us-ascii?Q?p7a1poe1aF2dFrnXWhFU1KOf6U8qJwPQOPFYxwjszo+HjXUDpBKBsu6CojZu?=
 =?us-ascii?Q?JWutdx2qTu4/VoR5sDVksiXwXQdjOjclBfotn67x8oUNIDS7/AwlR/PszOIb?=
 =?us-ascii?Q?MgH2GlLTidCx+ETKG0AKgiIwYv5VWRqPpquEgxRbZlR7cOSEoMAK6dZ++mdq?=
 =?us-ascii?Q?jyFhTTwaG6hpuKXyl/MWq++KDt1pirTaxURnTFWJFezLWBRm310vCjiE+HVS?=
 =?us-ascii?Q?ArlVQiCacP9Q0XL/vEjVzCmglPQh9uUkxfcyODIHYf+9iPJTlKiCoOwVWftG?=
 =?us-ascii?Q?YcwU4Zi7JdlOqXw/iRby9jMUzwJ0Dv3awsLiZ0j2CAI7cujERFllvGwiRk3w?=
 =?us-ascii?Q?EqQs0ezNk/vyuehYBkgLheBcNq1gDgQjO+m1m+7VPmlE1b7F2X7xLHPm8juX?=
 =?us-ascii?Q?kf3ZixqQVaTmI4kmN9QXAe2GQPRd5swDTqT3ad2FnKXJKwACUxGUnQ5e8Rq4?=
 =?us-ascii?Q?0aMhs4LL/Zs0dLCbZX7U0xHn1o17DcN5NVL9HzIqBNoXU8RiZ0s76OEmgknc?=
 =?us-ascii?Q?myC1s28JfCOc1P1N9YK5pcwkfGEOd6OZgYhJcZ/KHzvebf9mFZ6klr4KfBjm?=
 =?us-ascii?Q?AOm3nE8jeGiEkFHC4/f5Ji5nSF/0Ynfo8X/MkKOY3maAa9/ZhnGtjWu8QzwK?=
 =?us-ascii?Q?Fl6PUEO9C8rpSnRzqZXwTr/7qRvHY/S/qaQv4C6iFktrVDbuUB3xGhkDHLLJ?=
 =?us-ascii?Q?5cmM62tk2SbACFXema7r+gFfRsDaFC86jWNfenEnNt53fx1L4YJVk6gn3hAv?=
 =?us-ascii?Q?SG0d1ldyQ8aE1pKEDAJXx9/b5kbyQT5kYEddKGSIv8Ll9L6oE/b+CDMsgKXW?=
 =?us-ascii?Q?ItiLLCNb69mbGniwN5a+rUVf5ajWZeXueZQUS3XrNOCL7Cj+b8e/IhvW0deK?=
 =?us-ascii?Q?dl9Zkll0be0k0x4P/kFiWz2kYE/AuahDr+DdTxhQ4vyvfxg3e0M/YgXr77PR?=
 =?us-ascii?Q?0abETiRs4G6HxDfrLSqSOqBxSjA80APQG4ChsaSvfhNVK+UaW5cfh/uwFMU4?=
 =?us-ascii?Q?8hxqubGxEurUlkufzTTgqoMw7NMH1VgzRSLV2oAFDYf6v76H6lgh5iJxKstT?=
 =?us-ascii?Q?KCnCEqxJhHSnNd7/hbmEf7tBObMwZ3X6CCDURD8Vx2Sui7uiaHoZ+YCVkZ7n?=
 =?us-ascii?Q?1WpNvcx77Gn4oudiorexXI6YaZ64Qw/i9uVYXeVCHYHPcmzohTwLCZeIR4mK?=
 =?us-ascii?Q?kNvqkhvWr5R9ViV/J1MYJZzRpFcxenFLTd2cxMeuEcKwFh0hBJA5Ia0KhOSY?=
 =?us-ascii?Q?LdlsSFi40o+Iz2wcrrbb2ynbCtb7o/w65UJITmzS4dKLnc2vU+sGurRUEX3I?=
 =?us-ascii?Q?ogcQ0qTVDPq90lJ9sxR9cMTmjKzbToazn8J1RI1FByu4krzAKeQFrANT5X/p?=
 =?us-ascii?Q?skfMNDwTl52LFWlPBoU6YlFX4MhASgihSjE0AT9zhDeRfaq1/ZHEHcpeiMmS?=
 =?us-ascii?Q?Y1WfQov0B7kXyfqExeclPBcNKaulSyPpGX+uVhYqqDRu7VtZejIwZ2TCn0Iu?=
 =?us-ascii?Q?0niu8KIlFm9QNDO6KJpGmrar7viyArQ87GEe+WJnMQCgAIqlAP6KpvtkUnGI?=
 =?us-ascii?Q?z3s0/HVWQcoEHUzeB5gxsdF6I79fI/lSffRdi0QIp+waSS3osSuDAHbgcxw+?=
 =?us-ascii?Q?Htko1D7wiQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c8dfc6-68d6-437e-cfb7-08de4cfae934
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 08:09:27.0980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DU45TiRL27ihBKp9jAEx9wcBdEMtYosHHWe2Pk+gxEhNi5skqkAQ58qKnITJl/bpUoivzpkyZk6QzJh9LYIygA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
X-OriginatorOrg: intel.com

> From: lkp <lkp@intel.com>
> Sent: Tuesday, December 23, 2025 7:25 AM
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t
> master
> head:   b927546677c876e26eba308550207c2ddf812a43
> commit: efa03dab7ce4ed786b131f412440e2fd45fba11f iommupt: Flush the
> CPU cache after any writes to the page table
> date:   7 weeks ago
> config: powerpc64-randconfig-r051-20251223
> (https://download.01.org/0day-
> ci/archive/20251223/202512230720.9y9DtWIo-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20251223/202512230720.9y9DtWIo-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512230720.9y9DtWIo-
> lkp@intel.com/
>=20
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>=20
> >> ERROR: modpost: "__pt_no_sw_bit"
> [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
>=20

Jason, are you deliberately leaving it undefined to catch config which shou=
ldn't
compile generic_pt in, or is it indeed a bug?

seems on x86 pt_feature() is inline built so all the reference to __pt_no_s=
w_bit
is removed statically due to:

        if (!PT_SUPPORTED_FEATURE(feature_nr))
                return false;

but ppc64 builds pt_feature() as an external symbol then hitting trouble on
undefined __pt_no_sw_bit...

Thanks
Kevin
