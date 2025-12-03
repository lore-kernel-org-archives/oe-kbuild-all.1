Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB66E238C0D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 02:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728635; cv=fail; b=qt7b8gVage/kJ4OdFYUmIiCZ7GdoRo00tzHs3M1lMXKUbZPZ2GE8cJflVM+rMbUYI4jSgRM8b6F6k5kvEBuSi3VqgTs99U/FtKkONw+/chiXV+dwOiQ3lvnae7nSgY52ilwNUoot3JGHsVD7wre97xNPMp9zTh0Gk5KBFSXTdDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728635; c=relaxed/simple;
	bh=sHJ+S9S/TBCM4DwIdSatAN6iPzHHX4EgELY3qZ5uzWI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=s/at1fwx/kIf41+DsyIV/DO9dg5kbITbjF5Pe73zwzDvQXJHzfQMams7CIdPklJ5/v48dBfupnw3aGza7d+757Qx6BiaMBOlcmeAT0uhAn5GBRQd9Wb7i8D3MLNQJDpnk7ae1V6p+AEXiYa6nfF6IR4c/UWFPrsUMuTqhpSOvLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bipDtt3L; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bipDtt3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764728634; x=1796264634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sHJ+S9S/TBCM4DwIdSatAN6iPzHHX4EgELY3qZ5uzWI=;
  b=bipDtt3LKVg5kKXsrevoVgS5e7CO39wcIy5r45Q2dNiPgFBoeUqm/3UL
   XQ1xZzPnEW+V2/YrEx5BdkISG6bmQ+zFW01zFYINF9m7tHtdVmtPaFiIJ
   D5c7TD7LLvBcvAjx4Rr+1CJanvTWrOgAf/QsPSGt3KA/ZjnGmBBRdkPQI
   z+fbZZG8/bGToKZ4pikf95PNz6GAPGkGbceA+wleuW9O67/LFME7pKb96
   Y6OLeES5ZNAsLYzv8ftQWhHpEkEMfrhSYoxUYfsTCr0I8ufZA9lKGgATQ
   vOxUz4SdgGJRnL9irzNq6oOpk7nDDBiYfzJrcKEa4s2cEKYcRBDEB82sL
   w==;
X-CSE-ConnectionGUID: 6Bqiw3NGQ9uxAg4B2ETD6Q==
X-CSE-MsgGUID: QmgBw/l0RHW7ju5KqFZTKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66601975"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66601975"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:23:51 -0800
X-CSE-ConnectionGUID: jVQVDfV+RtSI3VnSZFeSxw==
X-CSE-MsgGUID: lMkiReK7SpO9B02UISXBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194432990"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:23:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:23:37 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 18:23:37 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:23:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtyn8F/EgaLwzEsuJrteU1g+luPnavF4Ex4NmlvkFWc0L0+zMdu4mIQqDpP3G9caNJPbC5qr5YoeRUtIeUc1frzKKlO1vvv5on4RqtFpIsomRjdCBiQ8Od2sfgoQH0Xfe0q/jEy5zrdzqdFSkBQN1hAzfm81+gfwAT0yxhBNA0qCbawc+9vrRbCjwfZrQiOAxUgm8DAhgmwv+sVz65IctgDgAQYxvntAHUxQPEZAICP7JfMXYqUWy62gGuf7zeKlOwofAqC9PB+Tb8tOrS5e5VxMSi+7Fe99HcNHIZFL5lWrKZOGl5hQPzcxIFTtyvvhn1pGuigyedX3jTzzuhaXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXdqO1vnY2mrpW+VkUUdMEG98c6ZTVtHVjPq0OuFB+Q=;
 b=lUi1Ia4zNW8eDCC8MQQUQAl5Da0M14aVxv7IpxZp9iZYIUPFKk1fi9eTKP4sz5pHe/TddUDQXKJSyyhYkO3pxvMXGDkVUdvJCsTOfBSlSaV2RDDdbf2X8fe/dQfTgTsZu+XrPSpJeDg/Di2xGJeZI00AXXUYwQYFpmF0+S5N8WTh2tF6SGM3INIcJlwBBDep9kyTZJS8gNVeoEkWXJCxTSWQ/J3MZi0erbm/Fgj7pxt1riXC9SgWciKBleL6ZfZYXimV9aL5JUqPk75/NKA17kcSj10QSC1CCzhocz6ABDDux892XBSEIGCbIB2mV26W/m1LbsBQXUeRdYAfBKV3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 02:23:35 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:23:34 +0000
Date: Wed, 3 Dec 2025 10:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>, "Chaitanya
 Kumar Borah" <chaitanya.kumar.borah@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_color.c:3865:20: error: invalid
 use of undefined type 'struct drm_color_ctm_3x4'
Message-ID: <aS+fHrlm+dwY1ad9@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 3001374e-43e9-422f-359c-08de3212f5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ckxtWKaFEwO3T77eEFvuu0Hzj1DhgM2MSGVbS4tgpCziCcXkzfSp0luHDJED?=
 =?us-ascii?Q?+blMF0SIIeYdFccZfhZ1/XOvoeYbyZWqdO3LXEGw1cQo8vD3ruz6KothR3Ao?=
 =?us-ascii?Q?mAMc8BfZX4UToMEH4b6pzeIkxKJqf1zB+ThwwU6MYpUT7Rae+VyYmXAspvIl?=
 =?us-ascii?Q?dm80Gyyf6SlRitHO2sDg1reqb3chduSHo2v5vn/MtRPbZFilhshS9BDnR2ZF?=
 =?us-ascii?Q?SqOqTlwgvoKW7SEGpFm97IEbe29IL657WxBRgWHN/jsfwwv6mBuG6RyyL/34?=
 =?us-ascii?Q?yT2dDKHuWTy3NiI+LsBk0h2gdBjU5uuBxlGu7GwiwQrmf2GwIk7DkMnPu9Z0?=
 =?us-ascii?Q?m3iA7fsRqcSmJP0loRWA+/4j+w6ath8TtiRZdIAkqniesFo+8A9faFIo9s+v?=
 =?us-ascii?Q?VnV+TZIOGsHRV43hhNqNXk10k5+1xVdHNUuKrt0OMrDQrZDYmMBY2AVsCzg7?=
 =?us-ascii?Q?4FsRI5/bkvIhfbWD5SCbai7xy5oCfRHReTV/B3fvM1+gGBQ7UHrKQ0TOzUt5?=
 =?us-ascii?Q?X84XEOlKpwVwoV5HZxCLbPOaXdcIbitrXfaxhEZbA7dF1T5vkYJ17502cwWM?=
 =?us-ascii?Q?w3/XbeNDvVOmwB7Z0hhZ+lcMDvYPG/8m+i9WNwF0UbTjobSmUQA5aNndrDMm?=
 =?us-ascii?Q?Oe4LPxuQ5Z9bJH1f4bTZVvam8244Eb3fgSxt9YMW7zGD423E2VfQp69U1O4i?=
 =?us-ascii?Q?974HA+Laf1n1ESmNSjpHWBD63bvFGloSaq8OOVauo6BG4PvQ3GMOctubEGTl?=
 =?us-ascii?Q?0bv1yI0poNAdNKX/YjIpKLN4wyomkqpgJ205NQ4UhxWKzzlaK1jv6nfz5YFN?=
 =?us-ascii?Q?G0xk+xxxMhPwRg2js2WC55EPHX4+/7MO2pqAtXbbYPZezElu1XBh16B5HE9q?=
 =?us-ascii?Q?byaIPbjrXd6+DjokaTRhTs0RGcUXkhK6CadAzxyNotfvlMYXK2exRK/AS7iI?=
 =?us-ascii?Q?hGqegTW31zqnYoOKPloYOvyj+yub/47QRKmz8YXqf7IVUkMUno+/DG45GLIs?=
 =?us-ascii?Q?W/Ff7YCfXADUqwYLP7nb2L02xKOpuqmR0cRovFZ5bIx4l7GobtbNCzHYz9LA?=
 =?us-ascii?Q?fqbZbwqWT1VGxzDGS+tkAXw6NfDbdZNv+zUWE7mKablEgrSi3oueY9xSX+p+?=
 =?us-ascii?Q?K0yku4txBd2f0Fw2z85FrJylB8vJcS9CssmLx4g3ihpo9Wls1OZsYn6624C9?=
 =?us-ascii?Q?GqYKZjm3LK/AUvZ7xc6Hwn7OVS2EQseAwU1SrGzyxQ2PzySg8dCuoXao8Z8Y?=
 =?us-ascii?Q?ZrtLuK2jyzY/6V6B0UhDuYydy8ygFqQmSH8TlwAM+zOS682a8O+eSyKK6QdT?=
 =?us-ascii?Q?VYHpzAqbOggETzELB28sQiGJ2jcISKtqjk0NNW8lwvLLaRbNuOIraD4kUsmD?=
 =?us-ascii?Q?ICbQQqk7kmFWsg4s6UD0TLpxawDRzvOiHDN39GI2wwsD6/ANJcqExVi+2zRL?=
 =?us-ascii?Q?c4MLMEGBSzbfFG0+9qZu7tzpT4G/7zqBf/zIN/ZT89qISq03k/gEYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8gL/sY+DhM9aAR5CiFSpQRb1Z8p3mj1UUC+uZnH3mKQxUlB25SAJ280ymGLY?=
 =?us-ascii?Q?rVoKLNqsVjyWWUknqnirCtUuksJYUKGh9XsW03e5/4gckjTY5f0qCVFONJ9f?=
 =?us-ascii?Q?1vlpehz3UvFvkU2Y8MORhp2bSG/qv9CKAF+JtTSuoo+lsLp9TvLWo1TQ1mnZ?=
 =?us-ascii?Q?w8z4g/NxJUgQOqayoVyW1KQ4fdApapRA5QmBA0ukEsZXcwzSQAMiJfGYv2uL?=
 =?us-ascii?Q?xyBJIZeMdjFZxiqk06bjl409Ou/T2A7ALr+X3LoZAx4NPHvbt7viOx1IQpUU?=
 =?us-ascii?Q?IYrBBm4XO8Zgw7/BUXbBuc1cEPiyzFSv5UmNvz+8dZ/VZo/dIGkcARZ9ddVc?=
 =?us-ascii?Q?LIxLvRfv/uFvQUw1t3kFxB8scnSSErxzCAB/foYMlkeZgkSRygwJonUEieti?=
 =?us-ascii?Q?JpzK9slM5ev5JHqX1TeZTR70No6iQmgsGAlQLT9C9pKQhYrr/6qVaz+0XedC?=
 =?us-ascii?Q?X65MpPLgLKn9tmYUdz4D6jqmxv+In2walStt8rRtZypwcPoB6YwpiXaqP/e2?=
 =?us-ascii?Q?/JZ4E79E39vaKpq1oZivO6n5sIrI3syTp7VlcoUaBcA5bpPQgQjbTef9EsGT?=
 =?us-ascii?Q?CsFb9AdrzPoB0f9gj8m9ekBxFc2sl0DlQmU2uNs5NA0zt1CKqiUjvHZBJUDG?=
 =?us-ascii?Q?4AhPs2PYdfx+HEH/voO2FkCefxToezNIl9rRP7l0iRO31np/4WtRxe6auN8m?=
 =?us-ascii?Q?0MKsa++xc+Nl2Z021TowvikRdL572TUFMRX4gDnRiv8SSbbVstU5F55UoMIJ?=
 =?us-ascii?Q?BY6u9HlL68FIQkpquM9rXRrLhScxFs6nVwkdqvN6gLVPrTy3ID162jEPwJSZ?=
 =?us-ascii?Q?Wjn0E9vLvUiL3MOEBX/loNlhyuppxoFhdmXsPjPw6TxrllDW2i28/2y1itVT?=
 =?us-ascii?Q?oImkH63TyjyJfA0H/MN63xq2NSRJ9ejJwPn0URPCUATypBYpxnYdla/ENb21?=
 =?us-ascii?Q?OPKvEywykVj2z3yWdm7F6YtPxlv2ww+HR0qqe3YKlUOAP9UeA/r54SsBBsKf?=
 =?us-ascii?Q?2RhH4VIDzgrdLefFJhOm8C1ix2bCqnOp/8YNYyXH8q4PHQFxPbNiUPT4rZns?=
 =?us-ascii?Q?2OEFkSyYSrQSISpHZTtIf4vndI5piPk6HuIf9Mtqjirt8Jbfg+ur4Nk9jyUl?=
 =?us-ascii?Q?r2Tn5DYQ+85Orrdv6qNlglW05oDbZGPJUzXVegDw0t+B0r/ADRs/1JIZQt+z?=
 =?us-ascii?Q?nYGVs2Y4qWcD9E1jNqrV/wgkkqbuwS2xoojIh/5uS3XWbFbOZAIrS2pQAE4e?=
 =?us-ascii?Q?y0Xajnocj2Us4+UvyCoiSD1xN6vG/UBFVid/+PWfxbKZwPk+78xhRXOV7gUN?=
 =?us-ascii?Q?peUDVP8ylfbSKCN3qRVtGqBfY5oMScHkZb5PsNLk3+5DXZJV30l/X2Yu7OJK?=
 =?us-ascii?Q?OTSSD60ml2Cmo0z3+9TxCPxUEM7C+Dh/VYBjpT6kLG745oKx0LOeLQ2Z8AZa?=
 =?us-ascii?Q?U7+4iZr/MJXjYSam/lNkXoyPk/az31BTSmv0LlpgDGL1ErgpzxzT5zID89yb?=
 =?us-ascii?Q?HaEd9RS6X3Hx1TWov5nkHUHMo2nfAxma69ntcMvGzD9kxP6mo/++JBzBI+X8?=
 =?us-ascii?Q?tMiuO6bE9BXYcWDnsrhv5Kl61GQxXeiDJkSr1LN3NXs9Mq/GezHFNvkaH8M+?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3001374e-43e9-422f-359c-08de3212f5b9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:23:34.8889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnzHPFRPoXxMRMoj2RIA+BbYOZ1LcVgnnV3EQUuYNLzruX/klsUOe2FY6ZIJjh/E5tEZh5IBnGWWQiMFsz4seQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: 531d2c65d4e35c5aaa31efc318fa7de4771695a9 drm/i915/color: Add plane CTM callback for D12 and beyond
date:   35 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512021955.KJmvBhUB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021955.KJmvBhUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021955.KJmvBhUB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_color.c:31:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/intel_color.c: In function 'xelpd_load_plane_csc_matrix':
>> drivers/gpu/drm/i915/display/intel_color.c:3865:20: error: invalid use of undefined type 'struct drm_color_ctm_3x4'
    3865 |         input = ctm->matrix;
         |                    ^~


vim +3865 drivers/gpu/drm/i915/display/intel_color.c

b4ab7aa848acaf Swati Sharma 2020-03-17  3846  
531d2c65d4e35c Uma Shankar  2025-12-01  3847  static void
531d2c65d4e35c Uma Shankar  2025-12-01  3848  xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
531d2c65d4e35c Uma Shankar  2025-12-01  3849  			    const struct intel_plane_state *plane_state)
531d2c65d4e35c Uma Shankar  2025-12-01  3850  {
531d2c65d4e35c Uma Shankar  2025-12-01  3851  	struct intel_display *display = to_intel_display(plane_state);
531d2c65d4e35c Uma Shankar  2025-12-01  3852  	const struct drm_plane_state *state = &plane_state->uapi;
531d2c65d4e35c Uma Shankar  2025-12-01  3853  	enum pipe pipe = to_intel_plane(state->plane)->pipe;
531d2c65d4e35c Uma Shankar  2025-12-01  3854  	enum plane_id plane = to_intel_plane(state->plane)->id;
531d2c65d4e35c Uma Shankar  2025-12-01  3855  	const struct drm_property_blob *blob = plane_state->hw.ctm;
531d2c65d4e35c Uma Shankar  2025-12-01  3856  	struct drm_color_ctm_3x4 *ctm;
531d2c65d4e35c Uma Shankar  2025-12-01  3857  	const u64 *input;
531d2c65d4e35c Uma Shankar  2025-12-01  3858  	u16 coeffs[9] = {};
531d2c65d4e35c Uma Shankar  2025-12-01  3859  	int i, j;
531d2c65d4e35c Uma Shankar  2025-12-01  3860  
531d2c65d4e35c Uma Shankar  2025-12-01  3861  	if (!icl_is_hdr_plane(display, plane) || !blob)
531d2c65d4e35c Uma Shankar  2025-12-01  3862  		return;
531d2c65d4e35c Uma Shankar  2025-12-01  3863  
531d2c65d4e35c Uma Shankar  2025-12-01  3864  	ctm = blob->data;
531d2c65d4e35c Uma Shankar  2025-12-01 @3865  	input = ctm->matrix;
531d2c65d4e35c Uma Shankar  2025-12-01  3866  
531d2c65d4e35c Uma Shankar  2025-12-01  3867  	/*
531d2c65d4e35c Uma Shankar  2025-12-01  3868  	 * Convert fixed point S31.32 input to format supported by the
531d2c65d4e35c Uma Shankar  2025-12-01  3869  	 * hardware.
531d2c65d4e35c Uma Shankar  2025-12-01  3870  	 */
531d2c65d4e35c Uma Shankar  2025-12-01  3871  	for (i = 0, j = 0; i < ARRAY_SIZE(coeffs); i++) {
531d2c65d4e35c Uma Shankar  2025-12-01  3872  		u64 abs_coeff = ((1ULL << 63) - 1) & input[j];
531d2c65d4e35c Uma Shankar  2025-12-01  3873  
531d2c65d4e35c Uma Shankar  2025-12-01  3874  		/*
531d2c65d4e35c Uma Shankar  2025-12-01  3875  		 * Clamp input value to min/max supported by
531d2c65d4e35c Uma Shankar  2025-12-01  3876  		 * hardware.
531d2c65d4e35c Uma Shankar  2025-12-01  3877  		 */
531d2c65d4e35c Uma Shankar  2025-12-01  3878  		abs_coeff = clamp_val(abs_coeff, 0, CTM_COEFF_4_0 - 1);
531d2c65d4e35c Uma Shankar  2025-12-01  3879  
531d2c65d4e35c Uma Shankar  2025-12-01  3880  		/* sign bit */
531d2c65d4e35c Uma Shankar  2025-12-01  3881  		if (CTM_COEFF_NEGATIVE(input[j]))
531d2c65d4e35c Uma Shankar  2025-12-01  3882  			coeffs[i] |= 1 << 15;
531d2c65d4e35c Uma Shankar  2025-12-01  3883  
531d2c65d4e35c Uma Shankar  2025-12-01  3884  		if (abs_coeff < CTM_COEFF_0_125)
531d2c65d4e35c Uma Shankar  2025-12-01  3885  			coeffs[i] |= (3 << 12) |
531d2c65d4e35c Uma Shankar  2025-12-01  3886  				      ILK_CSC_COEFF_FP(abs_coeff, 12);
531d2c65d4e35c Uma Shankar  2025-12-01  3887  		else if (abs_coeff < CTM_COEFF_0_25)
531d2c65d4e35c Uma Shankar  2025-12-01  3888  			coeffs[i] |= (2 << 12) |
531d2c65d4e35c Uma Shankar  2025-12-01  3889  				      ILK_CSC_COEFF_FP(abs_coeff, 11);
531d2c65d4e35c Uma Shankar  2025-12-01  3890  		else if (abs_coeff < CTM_COEFF_0_5)
531d2c65d4e35c Uma Shankar  2025-12-01  3891  			coeffs[i] |= (1 << 12) |
531d2c65d4e35c Uma Shankar  2025-12-01  3892  				      ILK_CSC_COEFF_FP(abs_coeff, 10);
531d2c65d4e35c Uma Shankar  2025-12-01  3893  		else if (abs_coeff < CTM_COEFF_1_0)
531d2c65d4e35c Uma Shankar  2025-12-01  3894  			coeffs[i] |= ILK_CSC_COEFF_FP(abs_coeff, 9);
531d2c65d4e35c Uma Shankar  2025-12-01  3895  		else if (abs_coeff < CTM_COEFF_2_0)
531d2c65d4e35c Uma Shankar  2025-12-01  3896  			coeffs[i] |= (7 << 12) |
531d2c65d4e35c Uma Shankar  2025-12-01  3897  				      ILK_CSC_COEFF_FP(abs_coeff, 8);
531d2c65d4e35c Uma Shankar  2025-12-01  3898  		else
531d2c65d4e35c Uma Shankar  2025-12-01  3899  			coeffs[i] |= (6 << 12) |
531d2c65d4e35c Uma Shankar  2025-12-01  3900  				      ILK_CSC_COEFF_FP(abs_coeff, 7);
531d2c65d4e35c Uma Shankar  2025-12-01  3901  
531d2c65d4e35c Uma Shankar  2025-12-01  3902  		/* Skip postoffs */
531d2c65d4e35c Uma Shankar  2025-12-01  3903  		if (!((j + 2) % 4))
531d2c65d4e35c Uma Shankar  2025-12-01  3904  			j += 2;
531d2c65d4e35c Uma Shankar  2025-12-01  3905  		else
531d2c65d4e35c Uma Shankar  2025-12-01  3906  			j++;
531d2c65d4e35c Uma Shankar  2025-12-01  3907  	}
531d2c65d4e35c Uma Shankar  2025-12-01  3908  
531d2c65d4e35c Uma Shankar  2025-12-01  3909  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 0),
531d2c65d4e35c Uma Shankar  2025-12-01  3910  			   coeffs[0] << 16 | coeffs[1]);
531d2c65d4e35c Uma Shankar  2025-12-01  3911  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 1),
531d2c65d4e35c Uma Shankar  2025-12-01  3912  			   coeffs[2] << 16);
531d2c65d4e35c Uma Shankar  2025-12-01  3913  
531d2c65d4e35c Uma Shankar  2025-12-01  3914  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 2),
531d2c65d4e35c Uma Shankar  2025-12-01  3915  			   coeffs[3] << 16 | coeffs[4]);
531d2c65d4e35c Uma Shankar  2025-12-01  3916  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 3),
531d2c65d4e35c Uma Shankar  2025-12-01  3917  			   coeffs[5] << 16);
531d2c65d4e35c Uma Shankar  2025-12-01  3918  
531d2c65d4e35c Uma Shankar  2025-12-01  3919  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 4),
531d2c65d4e35c Uma Shankar  2025-12-01  3920  			   coeffs[6] << 16 | coeffs[7]);
531d2c65d4e35c Uma Shankar  2025-12-01  3921  	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 5),
531d2c65d4e35c Uma Shankar  2025-12-01  3922  			   coeffs[8] << 16);
531d2c65d4e35c Uma Shankar  2025-12-01  3923  
531d2c65d4e35c Uma Shankar  2025-12-01  3924  	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 0), 0);
531d2c65d4e35c Uma Shankar  2025-12-01  3925  	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 1), 0);
531d2c65d4e35c Uma Shankar  2025-12-01  3926  	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 2), 0);
531d2c65d4e35c Uma Shankar  2025-12-01  3927  
531d2c65d4e35c Uma Shankar  2025-12-01  3928  	/*
531d2c65d4e35c Uma Shankar  2025-12-01  3929  	 * Conversion from S31.32 to S0.12. BIT[12] is the signed bit
531d2c65d4e35c Uma Shankar  2025-12-01  3930  	 */
531d2c65d4e35c Uma Shankar  2025-12-01  3931  	intel_de_write_dsb(display, dsb,
531d2c65d4e35c Uma Shankar  2025-12-01  3932  			   PLANE_CSC_POSTOFF(pipe, plane, 0),
531d2c65d4e35c Uma Shankar  2025-12-01  3933  			   ctm_to_twos_complement(input[3], 0, 12));
531d2c65d4e35c Uma Shankar  2025-12-01  3934  	intel_de_write_dsb(display, dsb,
531d2c65d4e35c Uma Shankar  2025-12-01  3935  			   PLANE_CSC_POSTOFF(pipe, plane, 1),
531d2c65d4e35c Uma Shankar  2025-12-01  3936  			   ctm_to_twos_complement(input[7], 0, 12));
531d2c65d4e35c Uma Shankar  2025-12-01  3937  	intel_de_write_dsb(display, dsb,
531d2c65d4e35c Uma Shankar  2025-12-01  3938  			   PLANE_CSC_POSTOFF(pipe, plane, 2),
531d2c65d4e35c Uma Shankar  2025-12-01  3939  			   ctm_to_twos_complement(input[11], 0, 12));
531d2c65d4e35c Uma Shankar  2025-12-01  3940  }
531d2c65d4e35c Uma Shankar  2025-12-01  3941  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

