Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FCE1862A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 01:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721959142; cv=fail; b=I3Hf/ZOzKeUqf52zrrfQmXvOcIdTuF59JBbQ3anWoKUKGwci1XgzbxLUkiCVGOferHasnG4rjQ5fIewmpB38oeuys8EhgRFO6M3JRsXr6BDSSstqCoLF8wcHD55a+tOZBOljixfDkRP0YeKMgFCJStbPT4yiW5C06vG5tFRRkAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721959142; c=relaxed/simple;
	bh=tfrjjBigegCV4wsUdg+aajXzPj1OAuR8fs+y16TyzD4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oTiAzKXPDs/fowTzslP19P0Fr33gxHntkxwdyvUJHHC4CW6IYfx+p9ffw1cv0nUdvvCK/asjrvWXkDx4mqUEW4eQc5FSJuGQXhpZ35THrYbtwOUipudyfXZJ9PKuacnTTRHdEg+rsS1s/Tbts0d1iYdBo/cZhCU2w+hL8fcib88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=br+0C3fV; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="br+0C3fV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721959139; x=1753495139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tfrjjBigegCV4wsUdg+aajXzPj1OAuR8fs+y16TyzD4=;
  b=br+0C3fVXoEBV9hmn6ROdyxCi2VWVZJOt4uLnJdfGzqKt24cvgU4UhWx
   dFKWFQxd3pXHsspReXoHuVfqbztNlhXJcHekOL15QkilU8FLiH/z4tN+/
   AtWkApJhsDwLoCwEGti7egfXe3ySHAo1GbV41f4SnvvYdDHtyKHJFsCjJ
   LZDX1Vy+DLFQiINY1fI4bFmK7asGY3vxiu5zfzoBtG6RsqWEXqSosHLSd
   9ZQAODJZDzuHoY/zVlSy8e3JxC+Ris+Yd7P58NXNgxkiPjSk8LwaJUoGL
   76PAIWoIKSzkag3PPWB42WEw2zPqU0+08oK5XAyquR0a+8dRnyxsf9MDi
   g==;
X-CSE-ConnectionGUID: 6Ixp4dRpRR2zQggyA/Yo/A==
X-CSE-MsgGUID: N83o1AdRQxuYvo5yGDKUPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37253105"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="37253105"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 18:58:58 -0700
X-CSE-ConnectionGUID: pXz4IcNfQF+s26z0vEo+MA==
X-CSE-MsgGUID: L9NxvkqSRayx3xwxdr/Ljw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="57940505"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jul 2024 18:58:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 18:58:57 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 18:58:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 18:58:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 18:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgET3tMyhhASKX+Z8dWYlGTtDvfVTBcpGvPK/OzeNnY5d4kfEJzDEfS5b7uHf9eiYr4Yl5A3LQ393UtuU2Az9PSMn51JkdxEP24nLU9GjR6jAlb34vSwQtRWbH9LFhFPCABsl+l6Qg1dnvfGl0Zuniy07S1vcdbj1zafSS2k1A11ziF8V/vc9o6beTf+ube0mpPPAyN8nPJvGA/eyJEfBrJYtgmFVhrwXqDqSIlKMq4H0kWUiAULSbG3FK9C93nhpdeTfKvsBUYYH6WiPhvYftNdORNnwu8gFy2dKpfUZMZ6ZAHKcsu+BUiG8Iul5RYB5/g8Bezf9Bxjhnlsp8UGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/r7u9jsm95yr5eN5RdtLlqpetXIdnJxkwR/hwy5qWkY=;
 b=EELxCAsnu8rb3k8S6iABKZqaTHd3Oeryp5nY0Zwaf/m5JxYVatDmlLFR/SLFAnN41vV+R+xxNn4VtN4OCHjbXL9KBvH77/u1iuj/W54WUuhwp5BHEXMg3ViiwHnNMFMcaFjWOWWMsjgkmCoD+/cXCi41nBxkLSa3Vng/LzTc45HqJQBqaDK5DH7IMhMKgk0j7KF0j0Dn8dvPD6bt0pKcAlT4m3SF0BlJvj6rNfvrQCypbfNhMa7CR7FpcuJqgKnHNrmJ/hSDyYSGplk6sup7k+kLIJfnt44EXk9RAf2aP75fVziHZF+XFE8oTyBXhMQk3qDz9cDYUEJz7TWIIcJX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.20; Fri, 26 Jul 2024 01:58:53 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 01:58:53 +0000
Date: Fri, 26 Jul 2024 09:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.1.y 14/91]
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated
 properties are not allowed ('power-domains' was unexpected)
Message-ID: <ZqMC1abV1aa15kzA@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DS0PR11MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 92cb8724-93f5-488a-d98e-08dcad16805d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CE2ERBiSqlPzz2NGys+wc7dm4ReJHL/2LFgKUpIaOrk1rfeGoYEBNKE6bY8x?=
 =?us-ascii?Q?cHcqH/jSQNsvvRrdF8UOrK48FQrNLM93u3Cnl2HEX6X47Frm2Zjwo/qL7bCs?=
 =?us-ascii?Q?El15tVduY1yy525iE1R5GTwWedS59+UX49Ajy2QI8g0mDRd2XCl1ol0kfQIN?=
 =?us-ascii?Q?PO8TuWtDTwgGlKQNMrK8Pny48NZsW7OPxufty7iRrJ3ExLUfs8VtKaB6RZTn?=
 =?us-ascii?Q?DUM/oybrY4hrpDIpnJOkw3JY1qzuxcA+n4yuICULEgFP0ITbKhhxNaZZjte6?=
 =?us-ascii?Q?IFfqpu09VF7mvB6GtScp0qMhGU7ZOtjmOIQRjjrgO5WFFPXe6a+U09w5YIAN?=
 =?us-ascii?Q?/zbH0R3dniTJR84k3Xz51Lb1TsN2ncuVoC5lEBwRsUbO0efY0Qn9RotoHl6M?=
 =?us-ascii?Q?kCEV9ZcoZk9/+LP2abeHWlQaoC8TlC2zATdP/h239b6k9mzatDKwQJnWArl7?=
 =?us-ascii?Q?W0dLA/L4GVOCUnAhs3CkMusHQKCs6Nn6jEmxCddZR9a/8t3AYsVLYLLGQWOB?=
 =?us-ascii?Q?1SNVDEuXm7sUBZp6TEo3IRHIeklwQOHNHNAtP9GVBUmjaSAQ7JgUlEnVja78?=
 =?us-ascii?Q?UGS8qMb6He2smbszpgaKIhn1zQzr9S4blyuX96y8ow7h0gSuft+zBhq+O503?=
 =?us-ascii?Q?VjUzIpQsYaiNcaV9Dy8fmC8vXeXZvck9CxhoJIDkiL4GZlSKGz6NdXaRaVHN?=
 =?us-ascii?Q?CpLZPDcxXGEPlGLMrjXps/dTbGsBD9zq7x9RkGNXKKN2p8/56DJPTkJkYVOI?=
 =?us-ascii?Q?Swxf0I2SacOaEhJPc9a1TESqEZYZJg+S4ffIIkdP+SgJpFrrLOwHenjTkU6Q?=
 =?us-ascii?Q?af0yZjYJP4dU4ApH2JI9A0RT4Y8RO/PGiWFEHsKyGEDAAWaO3p7Vgiviex5X?=
 =?us-ascii?Q?/vapL+4yBlqrLDq9YmrkvDZRrG4wr+owruBG9SzvtoICvmimRph27zcE5873?=
 =?us-ascii?Q?tWbDPuFYfJqb7cXxPNAPnAJI+lLgwmCnTtBM0DCyLqI3bjiRnTy5JUM0p5fz?=
 =?us-ascii?Q?mLzXXIr+c6pVpMaMQhsq0cU+9E4GIEW6Gjez73+Agv3QewKzdehEyzbm1WxC?=
 =?us-ascii?Q?zH0Iejrc73HnZ0s95nyo0hf4GplDaQ/3stY3qgUDo6QaVEg3EsgU3M5PEssl?=
 =?us-ascii?Q?7Y7CesJJQIeTBXJ/XDHhWs1i6JlLETPW/HkWW7fUXXbHVr0jN8WHH/jyM5jr?=
 =?us-ascii?Q?aGzwVVZ1scdGipJMe/5NAagSLKnb8xZyK+z6Uxrs3vNP4Hpb/wOsbO1uXXVA?=
 =?us-ascii?Q?boAT34ApblegCfUYhTDMlTAEHrNG0IHA5jXozcdrqjHFRmy9vQn6chUKvzN+?=
 =?us-ascii?Q?8DFspg11Gje7bsRifGPQ+oUjDCFh6NtidcQysS2WvGm2cH71/B0mVeKuD2HY?=
 =?us-ascii?Q?tk9+P0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?otMvxrMUK3Y188+7PUhJBIaLuPYHmI7w4iukotn6uueOvuQCtRyrrXF76LjL?=
 =?us-ascii?Q?Ik4BNar3Vz7rfo8MbMVN0iWOkI5Y1sHcG9f4iIAgQLTU6Z8e64YzuQw8Xgaw?=
 =?us-ascii?Q?qeQR0++R6YCIf2yhLY9zgVoRO4X+QY+gVAUUI+LMlYZmWxbDSEdqAdeSat1M?=
 =?us-ascii?Q?A7K335LMs20Gj3zUSj5bJP5uobV8Se+oiuYZZZ02AOBL8YI9PwvQ7xOirByP?=
 =?us-ascii?Q?SQ9J+l1o9ZLE1sUQG603hQCylX913Nql7AIGNCt1s9cZUBN3zWgt4xruLKU2?=
 =?us-ascii?Q?13LCA0J++w5Qbwx25drUZvZeTiCVOmK4JhFtWSYHR1NSoub3tik2/ZR+vyaF?=
 =?us-ascii?Q?oKqwvatdb4HE3spWH+JuFAAMkUyFc08LO0f/f6tFwEDtl9Uc6YqZVs3Cmd/f?=
 =?us-ascii?Q?6XeSkGm5yjzQFY6hRiguoJ2+upaS0NnT6ULX+LX/X5xOD3lLTWUiHHPARi3e?=
 =?us-ascii?Q?4y9WbVDtf4pE59U3HnqyryjP8AdBs46tayh5/gVpKLD8Eg84+uM3lVGX5tZO?=
 =?us-ascii?Q?jGCN3yPeSmHe3lGnmbtWav2MgBZD7fEN0RS8XvvkJMB2UCAOTITFU3ahmVMU?=
 =?us-ascii?Q?Sbz6mjt4/DpboTmM9ryMdPEfxHiJeLxYLx5JwqXn3fPgzILH9NTbrG/n3wUJ?=
 =?us-ascii?Q?pTTrKWWOh+MNwPhxMP9htL7xGH5LaxrPTxT7iwNduPreZfCiB1e2vLEIGSMr?=
 =?us-ascii?Q?OaBw8ix4fnQTkam7rjnRj6OIQ8P+FoEOG3jd2OY1AjuG/J4l79AtMj8S4ZrA?=
 =?us-ascii?Q?3RXwauzK7rBNoUKLSksj55XAuNrmIzZVkF9KQfg7U6MxFzPCmpWVTHtiVmeA?=
 =?us-ascii?Q?C30cAt8b6W/FMAjiSClgbnNOT1S9SmSCoBi+9aqeHXhmKuIfPTCEBCXbZyQH?=
 =?us-ascii?Q?IBFPX7NbQEWCQGfylOMY7y3cnhI7NXI/IYr91BzA7Wbs/m55XGcRmWzqRnGJ?=
 =?us-ascii?Q?naMt4sxFJFbh2EMfw123JrwtjCAce+vJUs4raf/BPC1M+kU3vf1EpxoM0XV8?=
 =?us-ascii?Q?KCqplKgzOVv8Ux7IUG9XgQQjLndHTCADxc3OperYX0jXJny2XwQhObphTtVr?=
 =?us-ascii?Q?naF2OZSt3wvS30ru5Tg4LyIiqmrC0xj05KtCxaZtzoORxqeJRlj0zr9NYtRI?=
 =?us-ascii?Q?1YRB5A6l3w2JBiWmM9w0R7MBHLhjXx7xaacJZlBOwC+Hbfw30xHKZKXg9/Xb?=
 =?us-ascii?Q?qJIimNsmLk2spuPvLyKkfRY6xL48vzQ7lOutcnHOKzDstJ3EegoxXheWJ7zl?=
 =?us-ascii?Q?1NCS2rRnndccRmDGD4S1j12n5KaVtVBXui6QtmwqNCB3p/webkbKmHpPcKNi?=
 =?us-ascii?Q?/OgojHrDB2IM8nD7UpOaESXkJDL4laFNOKZsSKvKT0PCtGlv+0lUfIzGnUVU?=
 =?us-ascii?Q?eXU753wOeSe9KGur/U/Ls+p4KpaS/Bd4UfLkHnRVK2QfQjHIU/Cq3l313w3p?=
 =?us-ascii?Q?BqpkkP3ktHsehancBWzlH3jKuC6L8qgZWVtjqN3nO7mTelwLyZvaLZh+b1ao?=
 =?us-ascii?Q?w4SOgzgwLHmeR/8s1AaXD5xcO+qSwFFbTEMAK01Ns6HmCxF4hqJm1biDVpkb?=
 =?us-ascii?Q?vzp/LNDGl9WuisLvhuegqhBTxnCWeZ4P2qh2YVRrfd+j8N8K+B1hkk45b29w?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cb8724-93f5-488a-d98e-08dcad16805d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 01:58:53.7594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkHL9D46RIsJL4PTDGP9xruk7pe43IHgn1pdjc4JX5MfalPG4QJ+nqUiIWJKYKh1alSFqaGR3kJteLWmxuP0tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   33e59e3417fd2b46d422206b92040e1fe5b6c38d
commit: af52052e79e286b72d81618e6bc9ea37cb2ec2fb [14/91] arm64: dts: rockchip: Add Hardkernel ODROID-M1 board
:::::: branch date: 8 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240725/202407252246.LBRzBLII-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407252246.LBRzBLII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407252246.LBRzBLII-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: sata@fc800000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fcc00000: Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fcc00000: Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fcc00000: Unevaluated properties are not allowed ('dr_mode', 'extcon', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /i2c@fdd40000/regulator@1c: failed to match any schema with compatible: ['tcs,tcs4525']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: pmic@20: '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks', 'codec' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb2phy@fe8a0000: otg-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-inno-usb2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

