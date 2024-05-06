Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF451EB36
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 07:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714981182; cv=fail; b=lQ7C1VWFpO16vvlf5sOK6DuW1BF3PzcmgdDOpVJjTiTJK/bXzIfw8ofybycc9Hlk96Sei33wvVKwp+5KgU/eOQk+ZkkRtn91QlIuI8uaZJRbxuGV55t8xIEEAGL7bHG9n/OKtcfgNJ051w28hWe/6vxzvhXMAaSwdmQlWMgFBwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714981182; c=relaxed/simple;
	bh=CVMxtfABVbhzrgGYZN47QyPxm5yriGiXGSbNl0OCteU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Zumhslpy6GksyHh/tlLGNylgWiHOBmBgdgI1whAdV5prmcX579IyLqWvhtqH8VZIDhoAnZ2bO9BGLS93Eh0Sy+G88VGK3JFT+0ztiEJb9XMWIcosTCSgxVHdCww3FtuJHWwIvFu3+jlhtffDBAprvBxSQPgwpUf32WMVGK/O63w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jL1mr/0T; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jL1mr/0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714981180; x=1746517180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CVMxtfABVbhzrgGYZN47QyPxm5yriGiXGSbNl0OCteU=;
  b=jL1mr/0TSJWLfGKYaPL3bCc1BaWzq4P8zpjPrQhfOJH6q/OpgTPEJ4jG
   OL11mDI12E/fVh3qD/28nqe3h/opfCvygj3ijaTSQZTD7yuFn573JiWfR
   +Wai8HXHJ/I2KmCRoP5ezlxW+Tp/UE+KLVhYSpF4wt4SnvYxZUoSmWGZg
   5vy0ON3XEEknWLzG9FID8MOkBsXgW0jrvsfUVYM3oqhBpopW+i717pNK3
   sPxS70agGc3riLcf52uUvFq04nmbKhHgtkoS0y3YJaTfoj/I3OfLqLvQK
   3XNdTwraoG2qr8uy13IfqKLfvRbbJvRztu88YecPQBtq4zPZeFvbpmMnv
   Q==;
X-CSE-ConnectionGUID: mXseCDpJRCm67qU7DG6Mag==
X-CSE-MsgGUID: hqmkdPdNQsyTCsr2w4SKVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10557273"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10557273"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 00:39:40 -0700
X-CSE-ConnectionGUID: AFGFoIdgSkKgZkMe/WSzQQ==
X-CSE-MsgGUID: xGPt5jslTlahXtITGA977w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28087814"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 May 2024 00:39:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:39:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 00:39:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 00:39:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 00:39:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mg5aKQrFp7Wp8+eDPp0GtY6x0V4sqd/NKlK8D+AMvSIXL0q8MCjtHu3CtXrhUtEsZ5a9HsKra3yhDj82qFWPgM6C3PHzChUuRaTS+jSUzBkvnqTfGJ8+DTkbAh0urJ9f6tqFWREmgH2+KHyg+mr7+rpSumoYhx09c1NOJDhP0bVUDzuLXOEAOQyO25iO1CCYWBnJHPCN01iGmQRlMJI8wIArz2rjbJlqsf58R4cn9IaEuaR/uO8DoJ3dStNed4RmwureUFB6HGT75bFVEEk/IzRV8uRF64f82KDpvBtdN9jpe+KD9BjtDtaz+8yATnvIzrG86OjvfMlyV8hnnxVcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mbip4o47FCXvvH/OgObigC6axRPE8UzswZbdbIPvzw=;
 b=bgW+FViMCJO1T7MNXGVJS15odbp4/myaAvYPt8Jzr1hdskj8MLUpQVUojMrAVsWqM9O9ZMjkbWXMkQFw/YtyXimDz/EW73b4qZ0piLA+tl22IenX9/xO6sFhCryUbeX6NRqJbZEfk3ngt3dewi+Rtt3cDf9mxI8IFTn/Wl+qxG4bibMJahLJuvSLFTAWgraUWqC/heZk0f39IZWqhGSdO8q3O7IJ+j55LVgWemv7AodnVx6LI0M9SC92o93IhLm3Rbb7poQdNJkF/amInF8F213sofKTkHZ8fdmlpMvWs2Nsif8KNHbxerrFdxif2y0g2WIMS2S86+3QaFCiB23wDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 07:39:34 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 07:39:33 +0000
Date: Mon, 6 May 2024 15:39:29 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Joel Stanley <joel@jms.id.au>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [shenki:aspeed-6.9-rebase 932/1143] dtbs_check:
 Documentation/devicetree/bindings/i3c/i3c.yaml: ignoring, error parsing file
Message-ID: <202405031829.A2FmEJ8m-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0146.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::26) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: aee723ec-ab27-498b-d633-08dc6d9fabc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PTDPxBG5OOyyvBI41PnuSXpFUvyIiRUJzBj/dhZn+nUf8OxW4thUCq/HRmdo?=
 =?us-ascii?Q?A2j+5eQfxj9xyrm+podZZkowVX/UgbzB647iCAPZyB+cwnTXGgqU6UDHi/wB?=
 =?us-ascii?Q?bKcQbCZKHG46nCEMl8fdzWXmTVJWMrnjBuVI0MlPCiT2pd33C7u7LqHCxfdr?=
 =?us-ascii?Q?sB1KdKa3fjR/piL4akCQJiqLxMBwdZWt8rms0MzGMVNmhsAOvBRKiGn5dByo?=
 =?us-ascii?Q?Nq8x+yS9jObcdR9pduJubesfZZAxYxfYnMw+aIoCbu5Nn/3slR+Uf2kYPCAW?=
 =?us-ascii?Q?E7zobfaZU5OOrhgKUO4taAU+ACop+bfqGYh2KFqfOwbddI95MeAwZXt7DsRS?=
 =?us-ascii?Q?tswCArQtJtqmvTRt5latyry0F1ZRdCkTO6sJ8E6s5pVpQ/Y7fP1jCfFLYNtw?=
 =?us-ascii?Q?MldEgdyyXi62XqBORhPDrv9degzkFnURec3oNSQPkcw4irp1LhgOmCQzBBI9?=
 =?us-ascii?Q?hmpEMepUrAIiU12UCrzFVQ9IKYQF8gcJIN3aZ9G828tQZVrmUSUFwv0Yxn7d?=
 =?us-ascii?Q?sMGPAAhjYRcB6IcltcSCAcVkyO9wndv+HE3x7Xw3vXN5mzJBV5RdzXOzRpOI?=
 =?us-ascii?Q?FQrVcz1taZS044rm/RPf5bFoc0mO5WuzKTB2YfEnZYNOFsFge5/E2SfkyITt?=
 =?us-ascii?Q?NrftWA9gC2R30MYEUZdTWhnTpII+EH5diaKWaphN3RiyoKZKezt8a8F1AUw7?=
 =?us-ascii?Q?rLG6elEWs5YU85MKchmowqwok2Pd1Wp3fEtylqgoGxMQadrX6fMLYHSZeTYB?=
 =?us-ascii?Q?zqqi42/yup7Sktqk1dMzTBAmzW4ED4k6Vz+dvLUJYHAhezEXIbFeG2wDevg5?=
 =?us-ascii?Q?yjcENVvtTST0B0DHPIuPbg5sr01QtJIyY5wgHIS/u1TxiR4lPld7DDvAixMW?=
 =?us-ascii?Q?Vr0ktp6XXuDBCFsAyznJiuAJTED/2si7erc8PpRDa5EsQomRxxdkP+WG4K0l?=
 =?us-ascii?Q?DBzESVlIbjaMLhzhKe20CZul+dyvJWiXifM4Sh6r8KTc/GdMDRICQZg56I2V?=
 =?us-ascii?Q?SQmclNkXCD1NMUPmNoYPfJ44GSUja/IF+F3yqhzfjA9cTZLuP5BH/vyKEG71?=
 =?us-ascii?Q?LT1lUoW5PwqOgjw5pTbri56qvqCNo4jA4pbJo8hhgbuxcrUqo6SuQ0fimQHJ?=
 =?us-ascii?Q?9nw3ALd5hKgg86WCoDB/uDCZEJR2t9yfm7+XfGuJPEGM6vbrNgygq2vJYJaB?=
 =?us-ascii?Q?+x4JTB0RKi4psMsGgphUarWwSRzrSDKuntI9MnJd8epZdmHDVOY9LdTsfIU?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qJWVJ4o4YP/ECZ/zePOcj6+G0uBuHeYWQiga3n4duTTTjdqKlS/wPH+uqmbJ?=
 =?us-ascii?Q?MxgrcbxuJcgIZYKLJjwAOevm5TuU/XCa+C7waO6cSekqV5/MbxSZZFVMeazw?=
 =?us-ascii?Q?7Iq6SW4kQCXC1Xjmc1ijvHk1T4v79Q7UFuyU+qKP7QJ+x2SceUzypgX36YDM?=
 =?us-ascii?Q?Nw4Xt/rCoI+4OZPhvF1ofpUelF56dLNJki1bsNwCf0Dh5iReX0doXsxUlCAr?=
 =?us-ascii?Q?pJua3OrzGjlrEDvm3Dg2K0nkPbqm/WuaxLmzUjjMhERaM4yl1wFJgtzcQYVc?=
 =?us-ascii?Q?PwGlW2PEcpJBtcdeJ8RAHioEgFdjeTykwtS2VlQmZ4IoxmORbXnj4IqFRtS5?=
 =?us-ascii?Q?hZ4rPhy8XljH2zX7kYKXkwNqv7+XPKSwa5q8jl+Tq6bSj1IxcBNJ4B67dhxs?=
 =?us-ascii?Q?b5VjmgHrpH7N/w74RCDIkPTbjn3BGqKrlEEUKfvil17sR9vxEdY9nPwjXp+m?=
 =?us-ascii?Q?vdld1CxwLtc5IPZYyxKk9ao1xHKi1kMWND7RPLvrW8h3dufak1CK7CBl1SQy?=
 =?us-ascii?Q?zISeXlHFOnL738DHBnb0uvSSakyMOmNYBQP1Y99X3vU3m/fpQyhvS0ztAjkB?=
 =?us-ascii?Q?iqt6UDj2EzqmK7zqujHQonsp70sl9QotwcUuHTNwd1LeXqM4hcDGvHHgVthY?=
 =?us-ascii?Q?YahttSlck36mPncWaa4Nn5pOakdQDTnrYe96G6M72J7Xxmkn08SbaPOU7//d?=
 =?us-ascii?Q?EqL5W7InH0hyd7rM2hxAT1h5Vmdaxr5IQ01huopKkl1rsmzZcLLpPBNo3Mso?=
 =?us-ascii?Q?vj/nzw7giNhRh0+rc1VtymJBQsEQlh6jrKgZZuqD76nMWHRjF4gRoFpZQAnw?=
 =?us-ascii?Q?HjXfF2lW11qcb+wUAHJCpYEd2oWwlRPG/dSm49ZHhJikbV2yA7A1oPSz4QwD?=
 =?us-ascii?Q?r7wxXSutDbWFu9ZCRB4NpVoAzJXM8PBGupkrs9MafZuE6HEN/UQl+sEMTt97?=
 =?us-ascii?Q?vRQzQxPl8iNUho9G2ejmIlJrO8ROJuC580zWFoKS+TZ5ssQTgcPsLeqq/1Hi?=
 =?us-ascii?Q?CUZCVgDU0Gg5au/LiGcxpS5sMis7XjJHk3Bj+Yj8mC/r2uyzMW68v6Rp/ayw?=
 =?us-ascii?Q?RaZRo5+DdSL3sCJ/i4B4itPoRoG2JnhrTQvijl/GWmyvUwAFmK/D8uQcnsKA?=
 =?us-ascii?Q?EnGrCUyKDx+EgDtN5vEmzLTddZNR5VKlDNaLR04rKDllFhn3hAerh3q8KDUZ?=
 =?us-ascii?Q?UzR1XDfONhwwa4MCWk0M4lxquifJu/AUg865mBacSEJzZWJnM4sQK0Y6q615?=
 =?us-ascii?Q?BjvyEzpc03S2maMhUFtvyS2FBAapa0HliBSwbNOZsSS6OJyEFRNoxDmdn1Dx?=
 =?us-ascii?Q?d4Ma187ZDp5u4TGAr83bQFMvIkL4MgCdD69vKwWgHNR1SsX6xb/rvy5pdEUM?=
 =?us-ascii?Q?IE3/Cz0yWgYrr/l3MT36z4K7XCzSAegOI4EYZPK3bdGJ4he2sRETsJZdV3f6?=
 =?us-ascii?Q?db35SnqL+Nny5/hfZBpDRwzq5uetWNw0wPpNmVk+gnd5gfTS2UvK6wF2nYfn?=
 =?us-ascii?Q?IGh/L34xcw3VibdulzFiKDLq9PhkFyzPNDml0B7Wy2y+a6toPTxJuakGs8Na?=
 =?us-ascii?Q?yJHWvMH/feOjaSF5ihfzpAp+InCS7EbOD+E2F7Kv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aee723ec-ab27-498b-d633-08dc6d9fabc6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 07:39:32.9679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1RtHN9+d3DiL02WRxCOHpHTtdf1Ek9rMV/venK+l3yw/ZXxoiwAaFRqlA1TNIkK3H+liogFC+Wk/ofGElevQ1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
X-OriginatorOrg: intel.com

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 8f301c50a89b33cf21188f09d8fb460bdf54d5cf [932/1143] dt-bindings: i3c: Add mctp-controller property
dtschema version: 2024.4
reproduce: (https://download.01.org/0day-ci/archive/20240503/202405031829.A2FmEJ8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405031829.A2FmEJ8m-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/i3c/i3c.yaml:64:3: [error] duplication of key "mctp-controller" in mapping (key-duplicates)
>> Documentation/devicetree/bindings/i3c/i3c.yaml:64:3: found duplicate key "mctp-controller" with value "{}" (original value: "{}")
>> Documentation/devicetree/bindings/i3c/i3c.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

