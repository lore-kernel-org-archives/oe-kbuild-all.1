Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B721D317144
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779014585; cv=fail; b=hARgUYlPnWO9zmDQ7JYzp9r1SCpm3jKS2hSL7SWgeYPBN1xsZKRT0bO3bYQnqPay5MzzVwYSlmZMeRiQXUosk7tkzJ5l+3MkBI0K3SpZT+u6YwIBQdoH0p5AloayLDXY/4ZUlnvnaLE/ape1bIA6yaJlVyARuVrgZQ2/pNrW69M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779014585; c=relaxed/simple;
	bh=EJJ7GctLSQUsyVkskEOIyCYebOskslR7TYEN6PXXM4s=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NkmtHpegoSDrLIR4A79IXAk8Yx5kYr7oMeQaQcXOp6WU8YiuYlZapNMBrge1B8FjHmVbrmq/+rPf1Tckekr67J7UZvzvCks7LhDuPrqRbyf5tAjp9M54ERSJwOcB79+ZmK3XFBxWlibQtXI7b37BxgaDjUggnrrhTdwNeVRKGQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhSz262j; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhSz262j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779014584; x=1810550584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJJ7GctLSQUsyVkskEOIyCYebOskslR7TYEN6PXXM4s=;
  b=UhSz262jACGB6k076941iBB0n/vmnZPNEQiSxal+PyFifSXF7Ba+WlKU
   6f+3vl7mK+jj90hqUYM7dkMTp0fr5EqTqqBxNTWweflOIieXHf8WjfNqT
   uS1rAYCp4aFy2qdlf1nA6T93Di1+4I3tR/CLkYaQ+uJ0WsN76wbhT1aVh
   mwcbzYg1oqpKj0kEjV+OZoqIO/f3QgolBYslnLecROdEBYB6ikziP5PYl
   16yWDK3xFwLbiEMSD9Pn6WY/BJmAAO5HyOFwrDwFBX0jkMkhHX50IPjR2
   zz+ODv30+HbIjpDmZ7WwHYhvYOHTbiIk26Ps0WRShCjnB84vv+ji7CI3Z
   A==;
X-CSE-ConnectionGUID: WuMBuZKWS/uSv6kqSan3nQ==
X-CSE-MsgGUID: 7S2spfvpRCCLNnyn2xd4xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="67422379"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="67422379"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 03:42:58 -0700
X-CSE-ConnectionGUID: ONT1/4DPTnauZdfoN7ajKg==
X-CSE-MsgGUID: vW5SigpdTcih7ipaW9hS0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="239016476"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 03:42:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 03:42:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 03:42:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 03:42:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGBHnHJDszD5aKo9Xpo4nedepkFHZj43Ej89gMe2vP9oWo6Tbb+HxZ1phPZQ3H8B8COzZAAYaU0QuAelK6VpgGsTwSlS3w/yFiiqq8HAKqe955O4xzaW9PCXtmMsmqm//KXwg3EQzeJx5DiLioyldOeNGrlgU8Rq0YhV8An9vxJbsqHotszwkuss3J4FpuQcgFMG6QNz3JOmXExaHPp489uV7tNFSHnFtEyCNZXjErI2agPPsFZ8TyKBLseeOPj0whyES7jSQGMhGLTEm15krOFrXbtfNfSHQsQigvJk4+bIV/06j/bsD+lU0wAwXtAzxnIyy/Aa0md0DgOKQ0kIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcChSBI3yuywMyFVNxlYuOKYDWGpKO5Xki9TtHMMh04=;
 b=Px/9GIWpf4CCLAQaJzv+eXTCojH7loUhod5N2M60+toDpo2t3XpAMWnfMF4upBbOqxj+frYmoDjYkZmlGgh4oM/LaiU8V5VcQhJM0T1yVTtCZDxO18ysHHXnsNZ3p3imFahHY5Td4XlH23jzyYYgegyZukP1KihEh/xsd6PMTTggN4NczcIAS7Gp7vyt22vPHCiMoy2fnJG1YBQIAxwsIko5xDrw30DJpU6HpJm4+Ml/F2nVClN4JhsS8RCM92mYPuXDaswd4TAUIbwTQbue882Kz+SIxVA1haSYabQB4+I4WDJ1okAlgPyzCd3L1iXwAljaZtxxY13l0DO9x/g1Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sun, 17 May
 2026 10:42:51 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 10:42:51 +0000
Date: Sun, 17 May 2026 18:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
CC: <oe-kbuild-all@lists.linux.dev>, <git@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18 765/871]
 mtd_virt_concat.c:(.exit.text+0x0): multiple definition of `cleanup_module';
 drivers/mtd/mtdcore.o:mtdcore.c:(.exit.text+0x0): first defined here
Message-ID: <agmbok76P4wsI9Wk@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0017.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::11) To CH0PR11MB5428.namprd11.prod.outlook.com
 (2603:10b6:610:d3::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|SJ0PR11MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4376b4-3bc6-4a18-490e-08deb4010af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: indL5+FyC3+fzsY3igQuWB4RpBRQskoaYQPstrFf5o2vuD+RKQqLNJXCLeVlAkl+LARohfu1XTThrmZ0L2IoGef8n5yJx/7Hk8he0DdDX4PlslQVBXVKxtIXTa8PUsSzuVJLHbbcwbtfsrLMZK48OoleKS7qCWqYyUsg1V62blZ5U7ILOEn/KbOc+dR1tAEhVs/2A8OUW+zsAIicOgq5k4gDh3mBE8rD4MXzpRR3cn3q69L7hWNzThQO2GGV879+9+hVjTmrwVeK0wGUmwrMYr332UCx9R+OBdXHTx/Hj46Onqu6cQNWTQQuLS63bCys14KljJCj+whHdAK5tRHAre5EVZfrHm11a/UPEbFhswczA1EV6MZBJiWVLvxOCBux833Fkn27S93lBVPN6DiL5MA5TzoqQvH9EE85HRp5uGvp/5FY2jX600fOP5Wk/HL1p/RnAjgrIOIGdLiwQSM/plZmpefDSuflSSBuPAsDMwTWke8r13m8frVVqdYuqbwWd6LBQaSXSwXrABQu+AMv5PIvpbSTlFRcW9a48RDgwVWDNBQFTMiUByXt2exrHIaNyHDdexk4EUkgkncOsSJdyH/7mO4QExwG+0LlJe/M5z/pu/sUFK+J4oXP0IhJKbfR+MmVGmiqT44GurMIpiVW1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RpucYV2U0xkhyPdzd5MD5NnuZTb9UrxnetkVBWRy0nq93sP0ixX//pxWzY/d?=
 =?us-ascii?Q?mRbcquR0S2a51JmDNegE1kLDbXr2c/KQKmKTK2WruZYSCqMfd9nQX6Ew/yCd?=
 =?us-ascii?Q?UBnSQ8l4cr8p25ZkbYn3/9y/vvKebEjrKV2tB6ark5FcWZyPFVo3LRSkrURK?=
 =?us-ascii?Q?faAJLaqqo9y5SACU2qbxb+dLUwuEZ1CPYVned/bi3p3yP7RRITycfkk/fqks?=
 =?us-ascii?Q?TCa+htfTDBCRLoTtgwNVr9DCww0EAAi73qG/fE/i/56daUyD7++dy7XUC2u/?=
 =?us-ascii?Q?cPUdmz2LyfNkev5T0XEH89UJOsDu3nzU8/qxVfkdTWetx54+VkRU9volVgru?=
 =?us-ascii?Q?VCPzvZvYK3Ropjy7uJXOgGh61XnbXDdM4qlR6Ah3j+Xhnm6Jwgngju2nEqXk?=
 =?us-ascii?Q?my4rlS6ukq1dyW79LyQts/DQMWav+Rq0sqbB95zsjqE7laBJv8IKVX+tEHI2?=
 =?us-ascii?Q?QFG5C4Fw9pjtPxYWTKS5pgH7E40xR+DUxwmcXIPJjPJ3EXvJNSTb0hYRZ6Aw?=
 =?us-ascii?Q?6P16sr3L50Re+PwH6eVbs0H4trtYQCt5HN49spZzjC5+egUKj9xkyOBd1WvV?=
 =?us-ascii?Q?ui8QfEvquapjcoz274YFPHgIXSv3xBk+le5auQySJEu11l00Gg9mAh1AH/3B?=
 =?us-ascii?Q?RRMsWK6lrqcfByjiUsRU0SvuRCBRU88mTrr12KWD4WMDm8jRBaxjNTdF2STC?=
 =?us-ascii?Q?RmQ+r22Sdz2o5HDDW9InxzvNymLI1sgg4YDfleewh3yZKASgtkK6NKwTXzkH?=
 =?us-ascii?Q?GqK5+8ZzEAtnCFK8iW96+9nY7b1pn9uJaSKZGVWY56lP12YvIDfxDvD3WXlF?=
 =?us-ascii?Q?LPq4I8ZhWCrK6ViWlqRMNAE0Xh2ne0AskwWzr0cJLInfIVUB7wQu7ak3k0m3?=
 =?us-ascii?Q?g9chFwl4Os5FLjCmTfJZkzlrPZEJGGJgx+NTkryPgzIt/8z5PQUjNQtQltp3?=
 =?us-ascii?Q?jXYXSClN/zWjr4uYQ+lPy27jQ0pN7BSLsPYHOSY+wshyOKLGr7MzClteZOvF?=
 =?us-ascii?Q?VDVV2AIrWBTOPmIpl0xw5+4xxYTSnzRRKtiI1ie6s4tumWf9F1gQl/EOYqu2?=
 =?us-ascii?Q?sWLaMxBqeecT98U+GQgy9/juzW/dBT4q5jwmglbymZ4VuCi1KoN+uvhJO89T?=
 =?us-ascii?Q?6gnNf6NKS6qFt2Z25vdnYwpgUUeXAETybspg4dKi9DWrY6+6dTKibshWIJWv?=
 =?us-ascii?Q?lxyyRRQ7czmtn2u4SdiwK1UTqmsjC2rpO2rUaVBqclW2wCTKyqD2pS0y7r4Y?=
 =?us-ascii?Q?S58afuScEdKOv4XnoHjTOQRiWUaOB/pqHXJ/YyfuyFpx1iedb4KTa0znmEOY?=
 =?us-ascii?Q?2PB4TSgwkqJ39auNfr9al/2PLtGQyPlJbk66yarAn4IQbfXya2j8rIEFD4Qp?=
 =?us-ascii?Q?G17eXZ1EgWARfLNVqpVV2Oq9SLczN0edX2hZFJySfoxeLCTVUA8b/SsGfCXS?=
 =?us-ascii?Q?nRRKuTufw66CP+fAynhaJFLZFL3Gyr4p6vUDj0Ra9oXZxqwlhWZDcZT2SZJC?=
 =?us-ascii?Q?hRnXKgbIHOSfxiupib8B7CKX3CzGSNEJkjXKcFRnndCSHbRUfL5r/HQSXcev?=
 =?us-ascii?Q?9jLfZ89c02rfnRw7Igo/5eoeBvQtP3eFHeYKLiBN5j9H9kno2UKEmtmuMDCS?=
 =?us-ascii?Q?rakCFGgzhyRqk1C4lamo98FUHUHq6SDJPTLfsLeOV5R1L4I2QMMShfVwtENf?=
 =?us-ascii?Q?xRYzymrLlR7MZnkiqWfBD83KpQuegIwIeIWQczHkE/eJVJjhy6fflYEV1jRw?=
 =?us-ascii?Q?9vUaXl2ZVQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: xdcxN9DFvT93UoroW5WbTDKNezm0sbTUyKu+AKTjJzmXsz8DMrVnoBIh8tnSYLqoZxN4LoXJwsqsMN1/QTQkKNfZ66PamFRkf8fslx7MnSJ+XbgDXeleO9zpuystm+mFOn8dpeiTZojxrj9azQ82fylldJWhT9mLk6YIdE5HBeFwmJApwwMPJ9ywTIDg8g0b2cbJ0B67UGeGExBwhxUlvq9k8bni8QyUWmViofZR5eM/aTbzJN9d7qiYLSci5Pg7sXCTh3GWZDYkZHk8dg+85nRrPxO3ixFYmPp9gcVQHHP7vKNQpY50FZehpG8UibG2aZ+H+6Bkxia/xrOifSyiww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4376b4-3bc6-4a18-490e-08deb4010af5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 10:42:51.2183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWDz3S7iGPsj8gEMrwq1btTPUPVAkYW8cKF6pNWa5M+Ek8/ncwK84Fd55kvx2xCoqvD6ZKjBXTnTwGJBucqw0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
X-OriginatorOrg: intel.com

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18
head:   8ad23fcb26beeb807a7f0f3341137ec98e93f390
commit: 57335cb7376d59e7c4946a731db22867c7809203 [765/871] mtd: fix modpost errors for mtd_virt_concat symbols
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605162231.dvgcqSjR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605162231.dvgcqSjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605162231.dvgcqSjR-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/mtd/mtd_virt_concat.o: in function `mtd_virt_concat_exit':
>> mtd_virt_concat.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/mtd/mtdcore.o:mtdcore.c:(.exit.text+0x0): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

