Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97483184523
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723474238; cv=fail; b=olTAT+40vyso7JKRGaXIIixycbmSUn941H/WbGQ/+yA2JOuaGn8k6ScbwhN6dbOGXkizCHifL1a7JxDm6e5rcoOFjI5+I6XgRgkIFjq4EX6ZCx4dnaAgDeK/Bd5uvyvNN6usCje/FVK9IfUOZqXssKnOENzxqJNJMRtjo5gUMZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723474238; c=relaxed/simple;
	bh=gujOaRjFoLEYo8LSKV/0hgs9yxXQNIqVvSK4fJfpfgo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=D5PhqjqZg3BnF66pMJBSU4zJpCoowPHP+XFeE4fwDHW1LCwhVvp/QTODcLZViJ9Ef7Z1ReuSjVD/TPIcQOxFQpysSVcrTx3pteOApCyKTmURPCiIjAuk1nBAlGqXRLEviSvAA+1JYIyuOnt0LM+05Ybf17Nu2YzY3qdGBK/ZQZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/53izC1; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/53izC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723474236; x=1755010236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gujOaRjFoLEYo8LSKV/0hgs9yxXQNIqVvSK4fJfpfgo=;
  b=H/53izC1lusKTqt/RMYkm4iZrFGr2PATwNS5J33C2CQ3eijufDQ65OYk
   dqEM5E4w4xiD7ZTP0LZCbHyWhVFLEXvBwp6qf1veHmAhpAewwsvqX5pSL
   J59GzqE9Bp7MaVrnz30ylY8NN/8qq3lKM35x3G3FZuZd6m8YWdIk51x2X
   FktFGURX4ZGMsgr06DDxuMhWphgobD0XzvSgYbXjqE0z3IOWBMxkg1dY4
   y+mO+7Yt78E/fCrMXfDBITkPZVD6/gvNNT+nYnHmx1ctyOA640KypzVAd
   vpSWwgO/TvTG4r+gCVwTnTE8kvCvb/yf9BRR3uLNZPhPCUZG3VSdCNxJD
   A==;
X-CSE-ConnectionGUID: 9u3vUAw8QhG3yjRarwVM4g==
X-CSE-MsgGUID: lgWhkLgiQQyg0LZ8UXrpMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="12965019"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="12965019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 07:50:35 -0700
X-CSE-ConnectionGUID: VUv/NGqdTbiuWlStnJxOdQ==
X-CSE-MsgGUID: qRogZvPyTzSoNTKR2EfEGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58235549"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 07:50:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 07:50:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 07:50:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 07:50:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r29eVddN04CSh2LwJ5kzrOBv5ht3gooqOOQin1ng8ajNhJmq+8k1oS1Jj2l/37qG9B43oAWLnIPvgjMoxgXYBMkIxAxvTC3VMSqApYbJyqHjV2rAghcHJiZaxg5YNZx/SdO/A9v8gIGVbYTDWJPdzOlCbeeiWwSYL9+sSTkbfmFWW9LVetvUwXMVwASWfjCzk83kgOHM0QPrxPn+jyKEiNnVhB/blM+xN04EIOlbOa7QXHVTrdak/ocLOtgbhibl+XUZMh/olabBeVPc7viPMkeEISR2NKX2k1LsMPpkIXAmB87hjbak3+IjsK64Lf3ZYj0JvmXOXu+D05rZb2iblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZmtI2LE0EmvICurbb3tdxpkXxSbK11VRqDH2Wcvpyo=;
 b=y048pPcD/uSWQUBJ8PlUOfn6nMxfyGoimy1OcHIwH8bLUEGVgZgVBdj5satsHo0cUdAkop6f0FSOJxCPNBJeyr3pz55YNUBfVUCyAa4SaP8N7EOWoBFmDwjpYHuIEWnsjHK2X3sqjIrAy0W0tj6WdlAjhM43VYlixgxPrd8/kRFoZpNdc5SJf8MGy73IDB/H24pnPHlh3Jar59u20Hi5VJxKZPgZ3tgWuVakW2kAB7S2zGNLKuS1O9CWmCEIghfSSIVjnnRUdGH8QXMXLnawX+mD9u+2L5gwiJQyFmbJJlXaFG3dbRpMtFTRMbVV+qauyfgXIZ3YUJac8KWfqONZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Mon, 12 Aug
 2024 14:50:32 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 14:50:31 +0000
Date: Mon, 12 Aug 2024 22:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 31/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <ZrohMIaFL11mDRo/@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: e9751e96-73aa-4dec-44fc-08dcbade1d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9VFrMIM8CKMyEmQ5ONXpRKet+RNsV/3XK197SpTNbY1byfdSglQx0by9s9Fx?=
 =?us-ascii?Q?drsOuok23FwEAwNIVb2SOHPFNoBQrSc04nnrkUCY8hVATq0X7+WVqeHujkfA?=
 =?us-ascii?Q?cXLZPaEHkPZuIKN2FUyVRKNDGapw3lTiSGE6ynsRFE8mVuvUOZcsg5UvcFXu?=
 =?us-ascii?Q?fPK+e4f0BYQBcWKTTj9jyOaivcuILVyFwo/nJNZInpzFLEZrhie4ZWyFbR26?=
 =?us-ascii?Q?+3oU8LEo/M4KsmwehY/RHdHA9zl8CMgETGFk3TirYIK2mSGp3FSK27JF4niX?=
 =?us-ascii?Q?LWKokCJ3rKMIZcDzu4/d3zCL9FYWTqWZjW0mqsnU7pYSEcWKAY5v+OlcFj+C?=
 =?us-ascii?Q?Ye+ZMeR16cVDJB//nVxyhoUqkqcVa/ORuFs/l+dzKEEag2MCoW4d5tKgp1t4?=
 =?us-ascii?Q?WWF/tqRS/9jV3tODXB8I16FtigLLDma/7oL2o19MrcX7rG0KhjtfdtVsdHq6?=
 =?us-ascii?Q?+Fnv5UiQ3ADDKalweW6+NuErUAa8U5REBaeYwediDeZxzIvOlyHTpTvjzu7/?=
 =?us-ascii?Q?AwHtli7oTx0j3jYXJ/Swwyei9G+KHShUx2pex2BbewkGPhnLamrLw7xeMMrN?=
 =?us-ascii?Q?Gz01B9ydP73LTAVuPCYw1xGg8n2Ti02lQUdQxpBpo2OQoJKRYk6JRJ7sojov?=
 =?us-ascii?Q?rGWxResFGJ4xOECLpvFagiW6IrgCuLNiLI8zdBt2swvYDh78Ph/+eHO398cB?=
 =?us-ascii?Q?yNSueqGLP0oN1eYqQyFblAB9bqWg8jiCHlHwFMiWwMf7If4i8k6lvADGy7Lu?=
 =?us-ascii?Q?qDG4D6XTy+NVbJjBG42Ib4pV6NKQbN4Q4DlqVEiBt3sk0b3n+bHBo8pdt44y?=
 =?us-ascii?Q?ogOneE3BqX3lG7F9STNmq3CWEgBqh+svRO/k47tB1DjZFe6jXwWXHRnGMRFR?=
 =?us-ascii?Q?YwIa9recA12XqlKpRcgaHUnZL1Md3dcSZRAZrnSqJ/7qegkd+BQ+RJN2NjHf?=
 =?us-ascii?Q?cTN38474krMREbcRa1QJv8o9D4pA9xRjWORlqxjElkoydrSq9H7C9AC1spBK?=
 =?us-ascii?Q?kljleemJ4hG3ZIb8GmC8wKqZmYOZPJVN42mD0OP7+SMSncKFG+XLbRkAsDdQ?=
 =?us-ascii?Q?bR4tDdi3CTfIh3LUKySGHwieOYyxTYbk08J4u4CovZmWfRHvfVlqDV7Xv31a?=
 =?us-ascii?Q?8KKtj1BWWzYQ4b7mZ6QHhvKsEQWUviqRR/nD8Kpx/CujGJbNDn/zL1N7bQAf?=
 =?us-ascii?Q?6RplkD9JrwMNhca0L96whmSk/zj+nMtiiII3Fn+NNAat5pclqyVq9IHMqufo?=
 =?us-ascii?Q?8NJo5COVHrFx98Ys3Dvwv50dVtXyKaiQ6wBhEe//cOEzfIguMeEDDsfmSnDa?=
 =?us-ascii?Q?Q/MnYVTT3lgg7pSuO4I0Exltk6ApaJtgLHSNl0IkjJuuUib5Dy9XB3vuLaVG?=
 =?us-ascii?Q?p7bFXUc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vP0hLZBqEYuq3dTbqfDK4hZl8FuAdOKc0xp0VvR3saE/dtY6bU7UKs+xqvmW?=
 =?us-ascii?Q?kkoHl+NydHu6vNhnfVCGrKxcaTBoFcraHOQbboFmPZ+gGereQFRSVm+xNMql?=
 =?us-ascii?Q?a0yc/HJm63ZPPFmF148D256S8uF6o+/G4nsc8EcX79PZi95RIhlvD1i4z+n6?=
 =?us-ascii?Q?5gTNXbBThyft6s7SbP4CJ2Kjy4Mh/wSEZWN6fMfqKTvWJjeorOPkyitr7Xvr?=
 =?us-ascii?Q?wFxhwliIdNOuBB2I9uWNorDD1hfxua80CmtNqrZvvPI3Q02do9ZOLAP46ERZ?=
 =?us-ascii?Q?coor0VPvTC9IVH9a4++1+rSshIuxbOteTMXaUxZokUzedI4k8+RSbCl0xm3I?=
 =?us-ascii?Q?39DJ9q1Arw9oVC5OpOPpu7416wqk/YcGZ12UBOr9Aa7Q5S+ySk2yoggXvvRS?=
 =?us-ascii?Q?nXZgTmyAgWuQAMU1cdi56OQxPM290B90xpmchscU+yByK+gRR7cLzYgnYpZv?=
 =?us-ascii?Q?4ce2Hjt60DptB7hwQee+ZTKlQkSZInwL1J75eR7dtJcT2Hv94qGT4LwPSLRU?=
 =?us-ascii?Q?lNvJe4ZROGolGRH9RCWnH7PnO+jugainI6/uVrPyKgeMAWnHoQJKeMWTVF/V?=
 =?us-ascii?Q?L/TEt8vjGaWoGFXY508OG35dGWuuH3DNIy4kPwWbpE8uyisfT6cYIedLcR7i?=
 =?us-ascii?Q?/cRbHI49yJGPwoybeJc9wZBTKqApmbzWoYSDvury+DN3yeggCZidb//ZuF92?=
 =?us-ascii?Q?SuhKN87WAMMa4gcbX18JtdJj1YMZN1B+wHtURr33qfRCAnDfif17ZejrHopw?=
 =?us-ascii?Q?HZjvtcGitNuW7zdrXcJ9xvMOrqOIZyW7BYwIt4RSR9CGpij8h8DRleBrG5E2?=
 =?us-ascii?Q?S1AI8rOzCcItL2tcWEhqoDVzumZxbouM1SQrhhE/56Q4LypY1wnkc7tY1R4L?=
 =?us-ascii?Q?Z7xcHXM26TgTZCV/sfUemv7ffypsyeKYFc3FMQpBeCTgdcS2jek/4EpJl8ed?=
 =?us-ascii?Q?OWFtg0Rd0uvQBA8ymhIRLzE2KKZLdi4vrpHAq9/pFVPh69Iv7pYq/8Dp/peK?=
 =?us-ascii?Q?QMBwQ5OMd1ULgWG4AaDkAkNxrVPy4zgwug5I8VMBpyJs6f5tO4mIDP/62A+v?=
 =?us-ascii?Q?AvXksGdGBH2Ok+jgnGv4Piwa+95HJ2/lSR7Pt10DcD3XPR/zj94SB5c000DP?=
 =?us-ascii?Q?5p4mUVl8LA7fqw3/X1eIjy6ialNOXOE5a+nGpmgdPzVdyksNzb4jfywpE0+K?=
 =?us-ascii?Q?Lerl1XiOeyUg3xFLweh2M+e7j0GacHmN+VCUZxpQooaTmhQZ/OY0KVf6erhH?=
 =?us-ascii?Q?ov5DYCxsJ/q87maNDA6WwkbOR+HitmtBFkCON5B87kxHTpTtnuK9U7+L8hIP?=
 =?us-ascii?Q?Qhdc3x38sL8W9ztgceJCPVO6Uu6Xgp4BvNKojaqh8IN6h6nvIUj1MpnBEPP/?=
 =?us-ascii?Q?YenGn0+jdpAkRtE9vbW5Al3vvclUrXx44zXmWREdiWbEOw4TdZIf8/PDH/2R?=
 =?us-ascii?Q?XXvEebbdgqjz0zw/lJlDQ0m9KadT6XgssUdpTc2EkhJKDR0p/7SFNwQFWOpP?=
 =?us-ascii?Q?tIIv0ENPXEntCaKsji5GcSAtLoQOCtd+9wX3khuwMVNHSe8CkY5sD7ppwbXD?=
 =?us-ascii?Q?E30ZQfp+Hs2ZmBq+FGPfWg2uu8ASwxQPEZAKWaZU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9751e96-73aa-4dec-44fc-08dcbade1d40
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:50:31.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7t0qmaD5QgKFzwGQxI4N5y/z6XvWtyA0nIrKhoOm/JCVQ7RD1cuqWe8/miP5kjuVfUz4RaRkMlOFnCpfQWHiUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 81becb0ae3e52ea78f9fe3aba30ccef729a4c343 [31/78] ODROID-C4: arm64/dts: add 'meson64_odroidc4.dts' for compability
:::::: branch date: 5 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240812/202408121052.eSvLq00q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408121052.eSvLq00q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408121052.eSvLq00q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

