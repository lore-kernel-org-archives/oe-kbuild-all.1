Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F601EB48
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 04:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717649590; cv=fail; b=DL0R54mg3cjKKISGZuF3hcFVtkBAz0xd2LGBzyx9J4ZAIngVZhBSk5g8RxgZJKpFPLqdVnHQrttecMBdYoKgtN8m9BA3jQFcUllSTkA6U5i8fOTU9csJMlY4FcHIpNZZBs3N17wWxMjpayUTIm30YDTbV8biSY0z3YMavrZvZZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717649590; c=relaxed/simple;
	bh=c5dmvm/YWegjne4R7I4FviN/L2q99fAuw8CaRCtoxrY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=r0wYkMSRXybLTl6raaB53mM+D2f6G2g+Ky9luHIbGJoifCFaQroVNkD965kiayQq8FQxNGHbcZqmxip+EUihtgQ0R5X7cpf6wcm4b8q6Ovr1tCEoyCWoWatMVuga1OufPbDW2l2IhuKWnGTwXxVnVnUWF+m4BSTjehi0GcFE2os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjVReHSM; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjVReHSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717649588; x=1749185588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c5dmvm/YWegjne4R7I4FviN/L2q99fAuw8CaRCtoxrY=;
  b=UjVReHSMwgCMlsdccOeJfDMxo4qzhVBqRveb8mkeDN6WLupCFKNxfRRP
   td9vyy9FG5NlTBHwFRQEfTEHq9rXjndIlcLWZhDcqvpOGUOSGrSAtoh31
   +eWrak4kI11n4illyKtlN9F1HLTnV8BY6cMvw2gWVNgpQ1Flp8qmYqY6E
   MfeH+bPQ9jrpbv/+wXeOMUssEZEKXqE2a/z0WK8RGkAsX2hYi0pmJFAhZ
   kR4Ho1OshZM8jG0mOk7GHxIOaZW2ltE1hYwxp62KGblI9LxryWi4WNgfm
   Q06oJ74G1Bpm3WFXLrQSyLvQIr40o8lnVTt8eD/jG1ZancgDCbSWOOH/o
   Q==;
X-CSE-ConnectionGUID: nfkuD3guRn23qVdojE4eHg==
X-CSE-MsgGUID: +s37qF+PTm+ChJ46UfUrbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24952141"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="24952141"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 21:53:07 -0700
X-CSE-ConnectionGUID: cMVAk0yGSuWqQLmgNZpbrA==
X-CSE-MsgGUID: hZTdip6HRZaDW+vsEh8lMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="42756578"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Jun 2024 21:53:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 21:53:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 21:53:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 21:53:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 21:53:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfiHBLNzMIO6RgNa6HUA5vyJkmZ9UL7HwO6q1TKY1wsGSTA1vfBSiyiG4XN0l8TMQ8rzy7S1lDZBDJuFNUz2pL3KGbBewyktSOBkxrkgGj/KMnGqQmeQggMs/4UCLxmsEU6q4D99DObh2TyH6djOLLegfPpL6A0MgA427ahuNCVc7C0RyZVHnLtSVoXF+dHbGWM8W2PSi/wqewtZeXoA6GVKoHObawfsHtY9Rbwi3DwEMAMAdvRSAhs4U/7RISZ9B0naM38xg+2zKXhU0oYJeQF0QVq6uRXYedFeV+oN+yxzFNM293vwN2w9wTk1ejaPGPZ6fGXOUgswbtqWzAvHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zto3E3WRZlVbsO5iFWJZVMoRj9FqtG3DIixvxrHGKKw=;
 b=E1tQW1aSenl9NQRTCRHgouFNrFi9v6lKC9bONjtmIt9Lj04proZ+Z7MJUmwy1n55lA5J8CSYzsblnKeKq5NWUZEjEcy0JAt1NCJ59ySfBZB/Q0lpFvfmW1MfQvyDZy8JAspD7AFFYm2/DmXMUek7dO9XLfiSr5jubMjEtR24b+XhRaQz2y4ebtyBZG0Iza7/4Cw09A03rbKufbH6/Y+JlhpYgo3uepu65OnAWaPCczUkfqd997UVcpb1nRJ9Fiq5cLotCv6dfLGeJRRt3l7I18U55CFEPFWg6bXcUWK0AyeYBfxGv5R9BrIb6GelPkj5bMujTAeyWdRsrxL8p6QRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 6 Jun
 2024 04:53:04 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 04:53:04 +0000
Date: Thu, 6 Jun 2024 12:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>, Guenter Roeck
	<groeck@google.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chrome-os:chromeos-6.1 68/68] dtbs_check:
 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml:54:1: but
 found another document
Message-ID: <ZmFAqOTF92KNnCB1@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: bc90edf2-4b59-46c2-9278-08dc85e48c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XLDNNPNGfRz3FOu0q1mpcQs/s6pciiE6S1iwZUtKgDoQqKVGPzSRETzx3L9F?=
 =?us-ascii?Q?g/Dz9iHM94icA7flXYuxQw6n/EDTiMMUTnOvy0qDz7w/ZCHG+39zAV5b+AY7?=
 =?us-ascii?Q?um43PYL40YkVtulex/CglAAe8jxYkH4o5/SRYPwKsHKJzOXNir2ZlAnEn0WE?=
 =?us-ascii?Q?LBUuDa4JPjirtRyGwpAiNcEUHrARKc471jyInJzT2crdXRfCFgpvudxl6Db8?=
 =?us-ascii?Q?WWkZzW3gErTyChqxbAHy/6WUAkS9AAZaeYDhzdu3rCAB0A5qppA1FuPienQk?=
 =?us-ascii?Q?W8SGSyWryuuYg5bKZOq5j/t5tqSEU+wiLvb33yjKeS+x2ClSErOT6PQwQRkX?=
 =?us-ascii?Q?ySv0BW03m2zisrp2sm1ss0oaVAfxzkulAP6iOgMff6Fk8HGbwDIvAr88zxn/?=
 =?us-ascii?Q?NT4r9NU7izO4Opvt7L9KnyFWpD8GiqDZxJo0CSJc6FoErc1MAE+F2fIiyxnT?=
 =?us-ascii?Q?VkSJY8Xxg4+Np+MOXMqfbfBHDUp3JywiLbPpQX1l/mdNL3mrdIxhtsDv+M5l?=
 =?us-ascii?Q?ol7tcHiA7tXNdf2DZIGjk8aZYotEUbwllkWKygCtVVIZQySA9Pb1wm2F9BXi?=
 =?us-ascii?Q?sHHVu4ecjiFA42PzsjOjRtlWQADYbMb06gr+vjTxSGADpJ1IeMItHqrzgmj9?=
 =?us-ascii?Q?yCcqDw6DIikKWkryV7jeHcMHYCZs0uKJiIAkCgYnTYi1Q+eWgTEK9q/u5p6Z?=
 =?us-ascii?Q?QNakBCbsy0kKiezJN/isZdxU5UlqRChd62RCA7lKp77ysdkDyDfGR7zU8j/X?=
 =?us-ascii?Q?BnLCZWB8P5l6nHre1Vtq/Sa0G1m7YynWOEzbev6SCW88yQh8pPhoooww35tE?=
 =?us-ascii?Q?ufAwKnL5gtoV1gGpaesVzY+HTOIFdEqfCw0ASOzG13BTX8mmzojIhiOTM26g?=
 =?us-ascii?Q?Xi7prvpBJS2AwFCGrKza4JIVkESqqs/lhUXcVCXjoEP0ZQsZD8PMCMrjlUoi?=
 =?us-ascii?Q?lMK2Ns7Hmz4f/rqs3Pgc+r0/WSsTZoyWUmzrarnQuKqoY2b0Wca0PuDTpHS7?=
 =?us-ascii?Q?K5cwEqRiJSYNDgVsYs5O5xHQ8JANovwoWFR/eKUjFwGAfciV/azOIl0ffhTW?=
 =?us-ascii?Q?hE65s+bTK2GxgprDwGqCncOPy6yk5TSj14BWU835AnpFgu6Mt5wGTHq5pILg?=
 =?us-ascii?Q?XLbwgpfVGc0OMjrNyVZz9LAFuA+/3o8pq1cJV+rBbaoITOB+XCyR5mOaJusm?=
 =?us-ascii?Q?LiDnWvZyPEtmi9ZSRuiNjleaJRyu+urP3xoVYovmCQsPyzkXtzYYsgdGCaIV?=
 =?us-ascii?Q?RUfFA1kcaHfU49vGNMCcnpfFJIYZIOIK0IbxTu+2LA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AaqhgwEv4ZJxxWRiNvtJLdLtIneWfgPDP4oQ7ufReOxSAjHOBbZHThXK6D8x?=
 =?us-ascii?Q?BOmKwKL3tGxc/6COFaJO78v8fBg06kFNtgnFr7oL8o0YkvZZIwXOndXkLuzY?=
 =?us-ascii?Q?UKIRIShU8G72g7VwoqNvMm9JKEEOooy6ChQKCHmgKuSsbExIYJyscclKhRDS?=
 =?us-ascii?Q?xWcfs+cvmTmULqjT5uJECDqAHe8tj5Jl0ivRz6DX5xE6VWH03Qyk0oMGvgVb?=
 =?us-ascii?Q?+CY4uAd8/5mBE1PC9rX6z741nWBc1owvwXUyG48mXGt9rKIeRgf9sQjhj/Ea?=
 =?us-ascii?Q?KbSFlXh9+eMhXtJrmMuGawLkiUArqOXe3Xmun0SdeX84afhOV/TyMIBeFtPm?=
 =?us-ascii?Q?iwaR8UIKfejUoQdc+vQn1P05ud1DCi1HBzqf2TUwrJxCHHWUdaK4jXpvNrWy?=
 =?us-ascii?Q?obhvhZ5fX9vBM9oTNGqA25QR5csy7ntzA5EMJhcaymgdy9eaa0gOgufos5ky?=
 =?us-ascii?Q?zky5gJiX4F7IUHRYfG2ECgMue3X/lBKz4CDocoM0Ec/Guq6raCY5rjd+pNiq?=
 =?us-ascii?Q?r74biw2LswXIQRhwpqeFXDbUqxkSTGb7XFfxN7Z79jixfoIzxGVqIH24PLol?=
 =?us-ascii?Q?JN1/OLNAJKdoKp2VSdggWJg96KDL84FK0cLhfKbWfPNMtoHRIAe0m/Mz4n3h?=
 =?us-ascii?Q?99V3K9dv4PnGIEkV5lZVYQWz3ZWe8fhWJ3KwGLmFMKaIoFhCk+LcwMbWlVTi?=
 =?us-ascii?Q?/AEOtX125O7iRTjGFis1lumFxF6V/33a/pliOwmVpN8zVcL4KSg+mYJ4x0T7?=
 =?us-ascii?Q?+yn+DwmBlEESZdc5RdH7CvyxGqKwdpFMfQlfoqPOyvzUdpgCXfkSxaNsI+A5?=
 =?us-ascii?Q?ImZDryHqAsIolndohmNuotpgolpyGr5auoonEIRy6pBr92hJcudJ47x0IU61?=
 =?us-ascii?Q?fsz4h8G44DhNP3yOOve0WGXw9KaCS4Qitx3gO9e0yc5tygh9muu3Io0PrksW?=
 =?us-ascii?Q?660UpvLvwBK942kajzg8rF6+P5KoipVukJOI0vGPS43/57AFRlS405g1CCpK?=
 =?us-ascii?Q?r6tyksxjbdoID0tBYSpn5EPv6xt/cUiCGIt2npKZK6Ie19iOl2+CJXAcImFG?=
 =?us-ascii?Q?RMdBCLQOu9NaFQ1XbjcNrkoP5YUc/djlhCDvKs0/AgnZdc6isncji6HwIaeA?=
 =?us-ascii?Q?1YWpNkAYCnj0bavVraZlqKAVXoFs55LBQgibyzeEqUG0gzsOvDmuzBORRt1s?=
 =?us-ascii?Q?4yAHkDOl1nyOftGO+tIWkEQ8at+s2qLSzjOuLtpkfGbdVnnQsJm8c4+51DVa?=
 =?us-ascii?Q?CiVcybn8C39NRPXt6GxZSzTWZ1LogTdMHiIGNCGu0fwl5IikB0NkIpHw4h9p?=
 =?us-ascii?Q?IThsubd950R4W8a+M9N1Pxz/KSZHska8+Dg3JfcegBRbzGbdXRXU+P47OU0t?=
 =?us-ascii?Q?ywU0wsIKGmfj6y0co+Hj4QshoJeL/rpb5A18nH7is/odeHaKwDu2/uVlN8+k?=
 =?us-ascii?Q?d+HMaLt9jNdT0ak+sNFlvtVPE09zuef9mdSg+Wmjspk1gOefF/3HgltFOxki?=
 =?us-ascii?Q?Hyh9tyg/26Z0JhOf4NB3lufaLqa6iAao2tyCmAm18e2CDTkisNppv2fnDR+W?=
 =?us-ascii?Q?Vb101ltrHa2VDJDFOvlnX2XUSGjG+4eU+WH8tj+6+Gw1NWObbJg0ieImeGte?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc90edf2-4b59-46c2-9278-08dc85e48c5b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 04:53:03.9776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SAAUM6aF3ldODr6Q5vR4VqwWy8klwzvMFbI3iHYzLzjHnC/WcuvFUXpG9VgYGGOfL688YFx7PQBGqITeYRGXDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
X-OriginatorOrg: intel.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   2268a7004f002732576535c32b514ad4933e3d13
commit: 2268a7004f002732576535c32b514ad4933e3d13 [68/68] FROMLIST: dt-bindings: mailbox: Add mediatek,gce-props.yaml
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.5.dev4+ga5bbb3e
reproduce: (https://download.01.org/0day-ci/archive/20240603/202406032338.bHUEI7Vw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406032338.bHUEI7Vw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/wireless/microchip,wilc1000.yaml: title: 'Microchip WILC wireless devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/trivial-devices.yaml: title: 'Trivial I2C and SPI devices that have simple device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/display/bridge/ps8640.yaml: title: 'MIPI DSI to eDP Video Format Converter Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml:54:1: but found another document
   Documentation/devicetree/bindings/leds/leds-lp50xx.yaml: ^led@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
--
>> Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml: ignoring, error parsing file
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   Documentation/devicetree/bindings/mmc/sdhci-am654.yaml: sdhci-caps-mask: missing type definition
   Documentation/devicetree/bindings/mtd/ingenic,nand.yaml: ecc-engine: missing type definition
   Documentation/devicetree/bindings/serial/8250_omap.yaml: rs485-rts-active-high: missing type definition
   Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml: linux-keycodes: missing type definition
   Documentation/devicetree/bindings/media/renesas,vin.yaml: field-active-even: missing type definition
   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml: mediatek,default-timing-adjust: missing type definition

vim +54 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml

2268a7004f0027 Jason-jh Lin 2024-05-27   8  
2268a7004f0027 Jason-jh Lin 2024-05-27   9  maintainers:
2268a7004f0027 Jason-jh Lin 2024-05-27  10    - Houlong Wei <houlong.wei@mediatek.com>
2268a7004f0027 Jason-jh Lin 2024-05-27  11  
2268a7004f0027 Jason-jh Lin 2024-05-27  12  description:
2268a7004f0027 Jason-jh Lin 2024-05-27  13    The Global Command Engine (GCE) is an instruction based, multi-threaded,
2268a7004f0027 Jason-jh Lin 2024-05-27  14    single-core command dispatcher for MediaTek hardware. The Command Queue
2268a7004f0027 Jason-jh Lin 2024-05-27  15    (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
2268a7004f0027 Jason-jh Lin 2024-05-27  16    mailbox framework. It is used to receive messages from mailbox consumers
2268a7004f0027 Jason-jh Lin 2024-05-27  17    and configure GCE to execute the specified instruction set in the message.
2268a7004f0027 Jason-jh Lin 2024-05-27  18    We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mailbox
2268a7004f0027 Jason-jh Lin 2024-05-27  19    driver. A device driver that uses the CMDQ driver to configure its hardware
2268a7004f0027 Jason-jh Lin 2024-05-27  20    registers is a mailbox consumer. The mailbox consumer can request a mailbox
2268a7004f0027 Jason-jh Lin 2024-05-27  21    channel corresponding to a GCE hardware thread to send a message, specifying
2268a7004f0027 Jason-jh Lin 2024-05-27  22    that the GCE thread to configure its hardware. The mailbox provider can also
2268a7004f0027 Jason-jh Lin 2024-05-27  23    reserve a mailbox channel to configure GCE hardware register by the specific
2268a7004f0027 Jason-jh Lin 2024-05-27  24    GCE thread. This binding defines the common GCE properties for both mailbox
2268a7004f0027 Jason-jh Lin 2024-05-27  25    provider and consumers.
2268a7004f0027 Jason-jh Lin 2024-05-27  26  
2268a7004f0027 Jason-jh Lin 2024-05-27  27  properties:
2268a7004f0027 Jason-jh Lin 2024-05-27  28    mediatek,gce-events:
2268a7004f0027 Jason-jh Lin 2024-05-27  29      description:
2268a7004f0027 Jason-jh Lin 2024-05-27  30        GCE has an event table in SRAM, consisting of 1024 event IDs (0~1023).
2268a7004f0027 Jason-jh Lin 2024-05-27  31        Each event ID has a boolean event value with the default value 0.
2268a7004f0027 Jason-jh Lin 2024-05-27  32        The property mediatek,gce-events is used to obtain the event IDs.
2268a7004f0027 Jason-jh Lin 2024-05-27  33        Some gce-events are hardware-bound and cannot be changed by software.
2268a7004f0027 Jason-jh Lin 2024-05-27  34        For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX will
2268a7004f0027 Jason-jh Lin 2024-05-27  35        send an event signal to GCE, setting the value of event ID 597 to 1.
2268a7004f0027 Jason-jh Lin 2024-05-27  36        Similarly, in MT8188, the value of event ID 574 will be set to 1 when
2268a7004f0027 Jason-jh Lin 2024-05-27  37        VOD0_MUTEX is stream done.
2268a7004f0027 Jason-jh Lin 2024-05-27  38        On the other hand, some gce-events are not hardware-bound and can be
2268a7004f0027 Jason-jh Lin 2024-05-27  39        changed by software. For example, in MT8188, we can set the value of
2268a7004f0027 Jason-jh Lin 2024-05-27  40        event ID 855, which is not bound to any hardware, to 1 when the driver
2268a7004f0027 Jason-jh Lin 2024-05-27  41        in the secure world completes a task. However, in MT8195, event ID 855
2268a7004f0027 Jason-jh Lin 2024-05-27  42        is already bound to VDEC_LAT1, so we need to select another event ID to
2268a7004f0027 Jason-jh Lin 2024-05-27  43        achieve the same purpose. This event ID can be any ID that is not bound
2268a7004f0027 Jason-jh Lin 2024-05-27  44        to any hardware and is not yet used in any software driver.
2268a7004f0027 Jason-jh Lin 2024-05-27  45        To determine if the event ID is bound to the hardware or used by a
2268a7004f0027 Jason-jh Lin 2024-05-27  46        software driver, refer to the GCE header
2268a7004f0027 Jason-jh Lin 2024-05-27  47        include/dt-bindings/gce/<chip>-gce.h of each chip.
2268a7004f0027 Jason-jh Lin 2024-05-27  48      $ref: /schemas/types.yaml#/definitions/uint32-array
2268a7004f0027 Jason-jh Lin 2024-05-27  49      minItems: 1
2268a7004f0027 Jason-jh Lin 2024-05-27  50      maxItems: 32
2268a7004f0027 Jason-jh Lin 2024-05-27  51  
2268a7004f0027 Jason-jh Lin 2024-05-27  52  additionalProperties: true
2268a7004f0027 Jason-jh Lin 2024-05-27  53  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
2268a7004f0027 Jason-jh Lin 2024-05-27 @54  %YAML 1.2
2268a7004f0027 Jason-jh Lin 2024-05-27  55  ---
2268a7004f0027 Jason-jh Lin 2024-05-27  56  $id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
2268a7004f0027 Jason-jh Lin 2024-05-27  57  $schema: http://devicetree.org/meta-schemas/core.yaml#
2268a7004f0027 Jason-jh Lin 2024-05-27  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

