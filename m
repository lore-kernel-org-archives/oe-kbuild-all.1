Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05940370
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 04:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723522569; cv=fail; b=urbomylKw+1nO1f7PChJNn5oC11fwwB4AndCGP3rb07XSn2TaacAMOu54gczKxz4SJeN/5B4Ke34x1bl9Ows+IEvvn5zBgGaIwdwCGNe8nogSN1KVqoPbqCdnNY/458puqALxY+Itq8PvF17SRL/GptN8k7jvx1Iy2vUfZJc/wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723522569; c=relaxed/simple;
	bh=72IFm4vde6Qyq0tSvQ1sE2ANskPKHrwmY7o5aR9YV5g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VoXxcFYopV+AepyUcs1gJYMqm/Wi2dGM+qDK8i1QwF/MHkZhhvRgEdn0Tn62aDhn9Q4mHVuuGYkhQm6V8yRLoYA24thTNvJVAcs84rJ0OwWue5ey0N0tZvvtKcchLRDFuPqIvOmjd5x7ViYZ950hej2Q+h0nrRkxSA77lRKlpgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFr++3zR; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFr++3zR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723522565; x=1755058565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=72IFm4vde6Qyq0tSvQ1sE2ANskPKHrwmY7o5aR9YV5g=;
  b=BFr++3zR+a63KMcSmw3kyXyClMxbZfST6sSqpsSSK4A15jKpOIq3jIMo
   mHd4MLb9Pi/9hZB9hUMlzXwtfjnklI9bWwy/7XyjVxRffZtVvdl3ZQweS
   TJxwWxTjXjEY746X2k3kPLfYBIWmCUBcFXPZNiHKKr5veGBvix/RoyNpP
   Ch/g1YTzm8tebVpd3j/YUjcc7VN+pXM8lgKxMCprZT4aHj0Q6VpDvs9Ny
   UM6MsyWZfb3As5NEIu7lXe+Q4r5MellswKgnUP787LV5vK51h/OGzi8KJ
   lfHmfxtYhKIkukF6wjBBocJgvuncV8/tH5JSe4lpBGsre/9mTFmUP1n8G
   A==;
X-CSE-ConnectionGUID: e+OYcCg0TMOXt4u5ljXwOA==
X-CSE-MsgGUID: xwf++vPrRuiL93VN9Gfq6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21224873"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21224873"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 21:16:03 -0700
X-CSE-ConnectionGUID: RiVlQnc+RH20xQhBzyJucw==
X-CSE-MsgGUID: Gs1Q5XfhRBWNevnwnWeyPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="89193708"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 21:16:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 21:16:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 21:16:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 21:16:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2enJItN7d3lE8612QVtpd/ZY9O74P5LIR11PJo0weHRCrvRT0qQZOmtrhxInn4y3RJOyUEcTrSUtci4AqNIvpATau1n/ZrtJNiWE1n7JCzJ/de1p5kvKQyULwTJVm6/banqkbhCK/iYLxX4tquI9mWLqsKVSRUOZ7NmNfV+X136qORnc1rcID179ZXGWea4RtKOQTxNw1EkICPKlI8zJkLpXq520yfovZh9/PZpCESqSmGTgsD140uW7zsW5TQEM3jZ+liKBQfNZB/u1wM28Kvxglhq6KQJwE9YdQLuN/P5ikN7nJvGmV44SzUULVEYrbuUALlOQp9iUSzXvB22Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM4iafOeX56lZbcHeTiMmIUm7ddausfdyYteUJ6jnJw=;
 b=flsW2I8TYHtHDVNz0fepko4sMXyewLhgSv8O3DGrWymHAoVfi6A3qPE/DMpW3zlJLkNbUuNEhSslp3CiXEo1vDwifZJoY0tiuUvCLZzUUyywmanJFLIIOWiQiuv1O/bzPZz8F1VI++YoeJ7113DJY7vfetaQixHSPNhzirevpRydKMfUyRTNIqhWaGd0Aug1zMQRoRPR+bfJtgkg9pBogMkXdya/7Okx/8d+36r3r7IQ56uyB6VdTzxd9MmW4q7PdrHaBhrWyBGvTLvmublcBUpd21oy9RCDI1NkOL45m4CZipUf8BcxbPRTXe4weSp3x9OAt0XCoAN1+Mqm2ujc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA0PR11MB7813.namprd11.prod.outlook.com (2603:10b6:208:402::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 13 Aug
 2024 04:16:00 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 04:16:00 +0000
Date: Tue, 13 Aug 2024 12:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 40/79]
 arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /odroid-reboot: failed to
 match any schema with compatible: ['odroid,reboot']
Message-ID: <Zrrd9hwKwV81mTHX@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA0PR11MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: fd32ab3f-60c9-45a4-6a90-08dcbb4ea2fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P1jsSbxtSnKqyMeypNYI6rR8TH6T7O+MZYRZSzvrePyUGw/F0XfLAfigQnuJ?=
 =?us-ascii?Q?x/mX9UguwCkcyTnb+sDFDlHTLn/PaNE0ytszLnXdmsbB0SD1SAZ1Vj/oYLtR?=
 =?us-ascii?Q?RmkSr9RBWk5ekSsle20s6r1LzcWHPA5lyvzAARs4tZrPrBR/bNJahhySNogu?=
 =?us-ascii?Q?pRhDlTY7H0x9eAdZlJx+C9caZlQQ7EehaA2c8FaaE24Gofxb1eg47DZE69WX?=
 =?us-ascii?Q?G5DFpVv4jaq8Og9PoYAwe1wPQX8HKCKjfL98+pajzQruF1dG6YZB32iFZ6L7?=
 =?us-ascii?Q?QN4WNULECq2C4iEteV3/X2SXXJpbJ7rxi6x6Ol0mENjs82JoOOwHeErqop95?=
 =?us-ascii?Q?5VJs4mxyJV6LFEly/TlQMLC6D6GmVUTQ7aPyNddrWHXZv1D+0Njtv+buRXYn?=
 =?us-ascii?Q?ueJrhucnMvO+mEVGvCaR3xd+9VS1fA7y+K3VdjN4XCDl+T9cDXEPuOcpEg1C?=
 =?us-ascii?Q?DJ/mYIZYT4PNRRZdXHZMWp7kSgnT6HGMEFyW9PHn9cWTgY8AmMo7uKDLqW2g?=
 =?us-ascii?Q?ktNMEPsCchFOJ7ndYn2U1n0mpPKewmbgQA3QZwQsmEKswYsKmwhGoTd2q1Ay?=
 =?us-ascii?Q?vPXGYFNASglbo6iu4X0f6Mqsv8LjWufzbvi4j3mhg0GUNmAbMsi6m5d3GiYZ?=
 =?us-ascii?Q?iW7RVm+Xy4erJy1R+nDQh3ptOhEtfSMbhab8+G0jGj1vfnwtMgcv8T9p+oik?=
 =?us-ascii?Q?8mUCptoYd6VAm7aqOET1L3tuuWx26BqERY6zn4ml1tiGxJU6m13sf4dVUk1s?=
 =?us-ascii?Q?heFtJxVcSbnhTZEdIgAu1KrCJjkBdbe8x9MqTy53hsvOfAf52+oPv5m0ZZ2T?=
 =?us-ascii?Q?56Mw+y4LY9XmVjhEkTRTl7TigpSG95utPVO293JU4jdHHjF3NW9eqKlOQHqz?=
 =?us-ascii?Q?nbR7BC62/x/bQD1hOzJP0L00BRyJJtQ+TSeH1KuNphjrPH/wNdRYqt4jJlZr?=
 =?us-ascii?Q?XD9Jo9XdGluUAP+X7a9rIeQqRMIXl/6zIBIVogH08TPFLi9pAH7WqmzQdAhd?=
 =?us-ascii?Q?pIG0xZktNtcae7re4hnH7ExEY6y5HNQQWOBI5W32wCnesb8zLlhc5WRXUuEs?=
 =?us-ascii?Q?oIXpS/mHFuBJfh4pPbsU92mejYhCSKz7Bd1H3BsCWOAmTOKp6kokRX8Mcbk+?=
 =?us-ascii?Q?1mGPDKkyj++LK/36V51B44DSLEuYu96JvFTM0W0kVUfaSUY7M1jo6xrOrrgw?=
 =?us-ascii?Q?oU5sWZikr0iR75QWDbPKhTXi+SNvkiZUu5wHGXBZQJFU40PHulnR/9FF/4pk?=
 =?us-ascii?Q?aL8UnyiKHYisH4lb27rd9Jm5ldoDoWVF83t08+zZhYtHrugNtyl1hcsPtyIX?=
 =?us-ascii?Q?3nU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E9P/CBheTSr1KhlT1CIhZaRyrg/KZzz2Ku8sAGqFWMlBXrxWjy3LW47mF6t+?=
 =?us-ascii?Q?3HCU0eaAJCJNEx634K1X6txJBfxaxSc+nDprkVB98OOiB4cStey8D/ki+LIq?=
 =?us-ascii?Q?UBU6FZ0tEBRICVmowLIp6o6izjFdF9k+KMDEhNpOMygl0JrDhxcFQdnN+UX6?=
 =?us-ascii?Q?O7zPSQNck+KTtr8M6UknbKSM5tx5q2KEFMZMnGTJafhKBbsI5BLpAvAMLBoK?=
 =?us-ascii?Q?taJ6yi3CqvNjMS+J36dDcgvoWXOnWjq4V5ApWp/0tiwgRlaelWhIuFYl+dKk?=
 =?us-ascii?Q?zB70rEPmb7QCuWv/fuVehFb8SKg9FWzZbrzj2GuSTlF78WjliNSonvyuwmEq?=
 =?us-ascii?Q?kQ7pu92utddUQlJh+KWrOL5HhKwwcv/F1YnTFJQxn2ai+w+QK8kTKUuK41Hf?=
 =?us-ascii?Q?5a2kno4yZNbdukia2oL+vnDRI7Mj70lWVgZCUh9JZ05Hxt3ktGvJTvzpb9V/?=
 =?us-ascii?Q?hwDM1cqv2EVSjvqQosDiQgZjj4UjESiCrDsRknXItNBuoIRsTCFn91U8HUmg?=
 =?us-ascii?Q?mTmV4T7ZuOC+XkF1u9poZDWwRoJCEniYjRxmQ8hslyyxCQVu13PTrfbaX5Vq?=
 =?us-ascii?Q?IrnTvNLBLEmoIyHye79IjE+jP78d+aa3YC8Lf9CiliHnnoRm/hZ/45DJ2u91?=
 =?us-ascii?Q?i6ptdPAJHmBK05UqleQO4OnBY+CjoSvZhhmHkfy6Am3IIOqz4PT9+bGMsDdk?=
 =?us-ascii?Q?ef9xhz4QJ5unla95A3kqAkx6TgK5JRZiUOYMkHfQ7lebN3bwip+q/JpQQQ3X?=
 =?us-ascii?Q?PEWE1VqCieDb/11I0woiuU8yBXH1byqcchrQqKnb4pohM/+aDRN/uPUrZNip?=
 =?us-ascii?Q?gso7lXWhVAbNxcPpL8Ou9lL4MJIOp2vWYxkaCVqxCzWmma4PoGs9tE2selt/?=
 =?us-ascii?Q?xN3B8SaPRH+IvkyweeV0GzwFWtAlhrxkAvg8GjDd+79xDqpvPWh55r4+B8zo?=
 =?us-ascii?Q?JTzEngfh35gXa8rfY0O9CIUhlRe4IZemayrEuIXfEjbIK3S3JXAexJUoRW2C?=
 =?us-ascii?Q?5AZ/9/FPb68/cbZX0+JOvY/yo85wgVVEBUWjXZGXZb9A65F+ooygRprg6Ikf?=
 =?us-ascii?Q?mgPRgski92b+G1U1vM2GnsQ/dY9skXiw0KDUxdhySRf0GOhjON/ltn9lNtA8?=
 =?us-ascii?Q?9t7AthUUE+DYutnRPxNn+frAw4TVZy1rRjnehsNIj+5k/FDY3BXyEUsAKyCR?=
 =?us-ascii?Q?8bfV5Vp6ZyHRncNEfnlm3201HgPmpDGAvO1sGaDsDJa9qf3WnlNFrWdO5htR?=
 =?us-ascii?Q?yTZpALiITsy9czHmAnPUDEc6LDyIpMbQJH2UYtrosRx1/3Gb8H7A2mbdogJt?=
 =?us-ascii?Q?DQBnW4PaXtAf4ucwpMwwX0XiHAf/JitOpWS8BpH498Ec0+x+Fxw8l0djoVU8?=
 =?us-ascii?Q?+XYgYiOP+5N9bkyi/yx/cTjjjNHWkwClXIyTSTOKEaUkvGK5y+rBH8yUoQsN?=
 =?us-ascii?Q?py3BVirKprOePhs0SFtNtD9Yuwozq75is8Qi+D2w366CCtmA5nw+8wzHm8QR?=
 =?us-ascii?Q?iOTrEf2p4kHMu+bmKfAM7Pdnxm90WxJEXTpwuDVzxEcU2Waax7EWeKEFWY2F?=
 =?us-ascii?Q?hUO/ODBE2aFGFrAX7sBbh+gqOhEEsY6kY/clUpH85p8UawbM3zk6hLRfHqLJ?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd32ab3f-60c9-45a4-6a90-08dcbb4ea2fb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 04:16:00.1643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ar4GMDLPDrSXmSO81gBgDEc1OS3uvWqMqoWiyMQa8GMC02Ni6swBXyvgll28f4AEsicqDFCn5Ag/N2TUBfFllg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7813
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   3ad420f3e23c17d1cf883549675112ee8dd308e4
commit: ef1e460af81f037884cf497d051bae77e62583b4 [40/79] ODROID-N2/C4: arm64:dts: reboot/power off support for ODROID-N2/N2Plus/C4
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240813/202408130706.VOoQKXFD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130706.VOoQKXFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408130706.VOoQKXFD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

