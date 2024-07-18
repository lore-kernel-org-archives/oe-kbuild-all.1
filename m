Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1899C3716D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 00:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721262658; cv=fail; b=bFGeTjSDzbLe+tY0nRRvqtqQs0/ULtaBgEHsM8lrRUGWnYqUSi98nnxxwvlsQnMN1G8FEFw+mRwAOJFHpjlvjqfX8DF9mbj3mfEvw+8jOOOLl+/zGMzH4v/FGN0dyUW7g0q0EgXqOxpq3l4Q5LmF/TES0B8Sa8vwqKdSy4KJ0So=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721262658; c=relaxed/simple;
	bh=23ccZSqGzWjMyc4aSFtDqirp0s87Yt5By/F94CBdQ54=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fZqbXzsCviu3zRoQ0SgoXjzpACL8b6E2Lbl/UhLeKvbaBDiZ5CXrN8/mTGwoU58+G+w6BgXkP0XicK7TbcuxrCaOWYP51ke+NWfoetJ1JnEZxHVBkWFWmHxe7xE40mlNZGN8xnUpIi+KnkDHWigHY9i6iooYYYmIipDcW5MB2Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu4K8Umb; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu4K8Umb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721262657; x=1752798657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=23ccZSqGzWjMyc4aSFtDqirp0s87Yt5By/F94CBdQ54=;
  b=mu4K8Umb5IeXPAPKLgIuS7B2l6vrEgKo8EpQ2NnnF9XHt+kUc4G5o6l/
   RXJYlWd2maSgLyEpaYmOAl/C0Jvzv0tedJiHoPUYzOt4WY2erd95OSjAJ
   sVWX5kJLzJrpcroG+15+yT1LLTXODaNlLgsSKKzoxsRRtTGgd98axATqa
   OJJoHESZgE7wSt0VCZIbZuiUb3qjRRyrWAKIdXw//0prxpJoDCejY3HUA
   iWVeyY/epb7M46qouStMakXSoKC8MBtJkWWcZWvmhSXasuzWM0TWPA23h
   45lNRH/FuJEUNGgmlYp2qJgB/TIsrXipmYbTGQI0BRpim/bSyTPxXhLGd
   g==;
X-CSE-ConnectionGUID: SnC4dYYXR/qkomWx7eRQlA==
X-CSE-MsgGUID: XxniPEH/QqCFZDOxaX/aZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18423107"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="18423107"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 17:30:56 -0700
X-CSE-ConnectionGUID: eZUDF5fJSZC2Ydy3I0D3LQ==
X-CSE-MsgGUID: lT/ObI6nRF+ePwo2AWhHsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="50451833"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Jul 2024 17:30:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 17:30:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 17:30:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 17:30:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWnBrEVMZMswBiNnkyfguRXDe/EETZ3F2TA2EhTVU7h0f+M7uBhsgQmJBD2MxVT0zzTJjqjnV3mYDIz0wyskV3R9BZfLaahgzKajMBoVwILPW86bwDX08JVxR3H+ALzwAeLKGkKl9+cEx5Ay1NmqeQeOGYWzkK8Zes702TLdS//+RizBt7FPhRD19LwOrDrTWR8aywMbHLcZ0hlth39Uu9IjbU6P6XNwAxfP1abf37Osbc/2dH2dqVKuIcyAAyo+ZFLt7pavSm9SVfV+YNkv4h4p1sUZu9AAb1aQu6I2WKgvg2haxKa94VFTJKelg4mMcR5MHzXbvHqNL2+cTVHxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yeA/t9/J02jEeB9VcsRcuVDQCUmDRjTGJiv/CCRerQ=;
 b=GtDMcXGLMdEwbrDmM2H0GpNx+4QVrbuG64BP4H3Faz1XP8+vuN5Yh/myNWjpmlJpKNsiJrxZEAfqbHnrGDhNZfdk4Za9Uj2zuFr2YMBy4I0olMBxel/FI0jn33FslXGveDQAblHRm5Nsel40e1P/FPFCiTH4cblkZMe4d5GrQstYK0wyppgTXUltSKOYwZjTJeXQ8T3ghdegpXYBUGBG9ZnSYdA0OD9ONuHK0VnGACcxRgs5fKOmYGYPx6T9bqHGgFuL3ucgWGV6TbTB/C1E+ffonRQaIPyuhBbdsUcvytd52UOKB/rR5sUtx/sZf/1fmvksYgNMjXx6I7SoOhDANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Thu, 18 Jul
 2024 00:30:52 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7784.013; Thu, 18 Jul 2024
 00:30:52 +0000
Date: Thu, 18 Jul 2024 08:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 47/74]
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <ZphiNRHorulZX7zr@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 172a9cf1-5baa-40a9-314a-08dca6c0e16e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MeZDBrYdUyKfakTgfRabn0PRE8sCqFOENlP2csdvVtx8aZqDC66dmk9TRMg7?=
 =?us-ascii?Q?IGQA+pyh7JGfQEf2Bte/l8HxIx3h0oiTzYXMlGLZ3seBzWORj+64zAj3Su5F?=
 =?us-ascii?Q?z4giWybQDprBeg/tYMesiJ/P90XoMskUJTsKDx/HyILn2sVAf3a/LMGOV+sE?=
 =?us-ascii?Q?sv5la7GT/WhoH5DeHE1+7q8m8YNBpSCsIuvaYQ9dBB8yYbt9EzVIHW1EcGXP?=
 =?us-ascii?Q?nWgbquznjwKIQKaRST1DbVChOzg2jXHWh8EstJbiHCa+FkwmgwhFmM/92hUi?=
 =?us-ascii?Q?JbNOZxiPub/qrqEDNfs8BjTl3sDWHaE+Y4d01VgLZW/5MqX34B0QGAIGxHxf?=
 =?us-ascii?Q?6h+V72GMW0B1Fqa84e0ZK5ZiLtKF1Q1uNBpnkD2S4N+RMOKl2xgF43EM77dn?=
 =?us-ascii?Q?Xec47efYL2/5ILmWWEZbsIRLnek+s07+2nMH0vjOQcZr+exgNIpwilyMPIUV?=
 =?us-ascii?Q?uo9S6SfXAutgzw9SK7fcA3fvQe8U2KiwDTDNshk1TIgIXxzDvNtMJTeXLNsw?=
 =?us-ascii?Q?mKPoAAmSqlDWioENrB0qbOh0+Rvd5C678sL1ag6zjrYd7OjhkGxb99voy07+?=
 =?us-ascii?Q?6B6QiNiQBZsovIwBM0xgU0rO/g4Jdc9T6URJaRI+zOLaFw0EsblzzeIFK9Z+?=
 =?us-ascii?Q?0nDICzSYvGjSPo2198wNtJ9w53VLOTge76xzHJ3gjxogwqk886faAvAAOLer?=
 =?us-ascii?Q?1Re5GVvuzl9clXTUgsNBQ2R5OqxR2z1ZdENEmnegFLs3edutIQoNV04jkqWO?=
 =?us-ascii?Q?n7yDDT7eSvzfOiELdHJtR0vyWrmWHLM+moV/kx5I7ScQFO6zS9KrE3rir2X5?=
 =?us-ascii?Q?1vf6ozLSC0MJiDIwvN9uXsu2K/ix7cl06Qc011rhzwMmRUs7WsvSTXLd9Bbm?=
 =?us-ascii?Q?+WQp1AKeCjk/k/qktCArqR/qurtyqf19RQnRRIUKy9Q+WP1t+gOdh2kthY29?=
 =?us-ascii?Q?YUYHJZKVoWa79jENlk8zOYebBoQJjI1Ng8WVbxuoRUX+V2sICAFPcNREKWZi?=
 =?us-ascii?Q?FNJB0jk+rxj5f3VTrHUZu+jv4cO2zMgkBYO0azD1lk2kBnkbmDPa8MQP3biL?=
 =?us-ascii?Q?wvvaHlWlmfiNZKIImhUn36utIE66M/ptyuzKb810rD+guMPwYP9wf++YhdUW?=
 =?us-ascii?Q?NwqAHn/SgnpVdZ5A1RDjsVNYQhTvUubEbfNoAF+08sTRgfe+8HeX2H8FZ2Wf?=
 =?us-ascii?Q?fctSg/k3I3Vqu3rxxSxCBRS6EH6o8XWN7RypLneK8dbC6eWMX68bh2jpVbCH?=
 =?us-ascii?Q?TdbuoCR7n7gI9KM0G5qLfJswkOsvhB7WFpaSbewAJIj+S5kv8V3WvYRHFTnm?=
 =?us-ascii?Q?Gg0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pWhX83W3jpvOBYcw+loO4wwMA/rFAkWMawiuMNiWqYGfZSDjMF7U7udjmHXI?=
 =?us-ascii?Q?wbylmaMh1zVOgukas7Bgog09grgC6mCuApvbURtmFrWnAaG3LL4Wmc4LGBus?=
 =?us-ascii?Q?lUNnDKfQ5qqVP8BhJuhsyqD1ODhKSnKrXb1UDeslhvUixJchF5IYiycjicP8?=
 =?us-ascii?Q?GuxJkNc55pzjSHdGa6HpOWiKSwc1JE89Z0UvSxZv7BNTrNn6dB2Y1nx++LJz?=
 =?us-ascii?Q?fuwML94+dhwt9k3wBfFMz0lzWH5zNEFp9RvhUsYQqWksMQdbBP0O/csVjYWn?=
 =?us-ascii?Q?TLvNyX+omRyPsgyP5j5qg1lpOovt1Q3Lza/Wsk/GedzH51KqEM2KP4wfKtzp?=
 =?us-ascii?Q?eQqKyHfFwkOFjZh1hFxglfWbaU8JIWQ8aJEtWYKEwLDVLwkDGXLi4NBUBTk8?=
 =?us-ascii?Q?GSm7dP6UcjSiH6Q1uyFDtbDhp/MwRHf2PBi+eW38QxhPtQcBn1qxpkxFZEML?=
 =?us-ascii?Q?X1VltjnHfod+YFQ8+E3xEsC0WPf9aY98+WKZr0ilGwHgyXXWU/LE3t/LcoGa?=
 =?us-ascii?Q?5STO0g/pAh+ym/y+gVrChb6iXo4315JRVK+pvKo0E+rX0WOn0rX61+YXsTOd?=
 =?us-ascii?Q?OpiQQvQVcdUHcp66I20RceDW3EawA6AifdyO7bwla3ogPTf5zc22BggeIJIj?=
 =?us-ascii?Q?xsYRJsyYl0B0WzIGpnrHPsIwq8qnnpbBoaI+AE9hZA0YOrrS3SuETrUN9ipC?=
 =?us-ascii?Q?PZBjKjKMJoX4BdsNEEHKn7YHm8AIrT+/QEyxpXNu4Scv8FRjjbug35XtQd7Q?=
 =?us-ascii?Q?DKV9pV4qE7JHmutdjCabtY0ifUeYDzFrWqvD9uXnEQDy7BRviVE4Rx82feSq?=
 =?us-ascii?Q?DBq27dKmABSnzhUzkWKz0jbL5qdvd8qZM6kcq8IsuPut9KK2CdJdPvy+TVvQ?=
 =?us-ascii?Q?hNT7LUEDIDubHmwYHWJgbvVDSlQN4Gfdm6PuAYEsYeDiTqXNGSjlb+qynIsh?=
 =?us-ascii?Q?cH4B/eXjTLM/m9UZ2jgEv8RU7FJkiiw1l3nyGM+XycIhpRZy3XIYoqBmysUn?=
 =?us-ascii?Q?SlgMinGD+rl65uK9gxR+iGYccAF1HkMXWfgji+1Umyeq2ypWOBInEM5C0f4+?=
 =?us-ascii?Q?kmWGJGpJJRsETqLzxEdilUyg/Ibv2CTP0RCbWd5IPQv1fBT1/U9AWSyFPsCi?=
 =?us-ascii?Q?VyB6jf+Mn5837Ng8hX7k2ZbALx1bm8C8W9d5UKqzH4BsAWUJ98UilTScJ4aE?=
 =?us-ascii?Q?9WsBiNTVxtFG/4PUoukaON59vvjqrfn9WLXGKSjTKJ9F4p0BUeJlpT2eEWWn?=
 =?us-ascii?Q?MTB00aJRiwO/S3ceCKc3p1cvKhrPhh3kW1H5wjWonXhPifvix7SPQZSfsrr4?=
 =?us-ascii?Q?wpXnpQrYD15bXA4HfkY9Ov/AocNkMPCsEv2okgdalinvUXT3HXxabRyRb/hy?=
 =?us-ascii?Q?W5EmQ+p2QnwrueQNMTRp8HYQaAFak4Oicsl2aDGSYidLpkPTrfSQYHTQ9Ti5?=
 =?us-ascii?Q?TwQylpj6fYWNhvKN61U1Xixs9L+DFrbUOot0Q4g1kNogchn3ESFnD2cSt91F?=
 =?us-ascii?Q?NXz1xSAU6NaUIg36Hhrq12ctF2LOlH25B6iuCRh09y2wM7FQbhIJEztHBsQe?=
 =?us-ascii?Q?vHNu/Fei/6mkz4yUcv6+ng8becaXzdU+BpicLTU3pFKSimuS4xr7uqJrQu70?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 172a9cf1-5baa-40a9-314a-08dca6c0e16e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 00:30:52.8623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBAy5NrAEdcdLC/o5ogqCr5cY+pHmh2fp6XsYppU2/kowfsLyDeSCRoXPvoUa6FxLw5Zd9jkE8t3BSPZYA1Xlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   fdb4709395deb4bfd668475eec2c0d482f12e1e1
commit: c00978529119701b9f4401a706df1448fcba2228 [47/74] ODROID-M1S: arm64: dts: rockchip: Add Hardkernel's ODROID-M1S board
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240717/202407172205.TkaTYXhh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407172205.TkaTYXhh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407172205.TkaTYXhh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3566-odroid-m1s', 'rockchip,rk3566'] is too short
   	'vamrs,ficus' was expected
   	'vamrs,rock960' was expected
   	'amarula,vyasa-rk3288' was expected
   	'anbernic,rg351m' was expected
   	'anbernic,rg353p' was expected
   	'anbernic,rg353ps' was expected
   	'anbernic,rg353v' was expected
   	'anbernic,rg353vs' was expected
   	'anbernic,rg503' was expected
--
   	'vamrs,rk3288-vmarc-som' was expected
   	'vamrs,rk3399pro-vmarc-som' was expected
   	'rockchip,rk3036' was expected
   	'rockchip,px3' was expected
   	'rockchip,px30' was expected
   	'rockchip,px5' was expected
   	'rockchip,rk3128' was expected
   	'rockchip,rk3228' was expected
   	'rockchip,rk3318' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /: failed to match any schema with compatible: ['rockchip,rk3566-odroid-m1s', 'rockchip,rk3566']
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: tcs4525@1c: Unevaluated properties are not allowed ('regulator-compatible', 'regulator-init-microvolt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: pmic@20: '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe410000: Unevaluated properties are not allowed ('rockchip,clk-trcm' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: phy@fe830000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-naneng-combphy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: usb2phy@fe8a0000: otg-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: leds: 'blue', 'red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

