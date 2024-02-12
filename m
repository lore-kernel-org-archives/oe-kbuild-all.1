Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530D139FF3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707739513; cv=fail; b=VMmLjbUSKIAhuZ1hKSxAe6Vt7BAG0ju6ER6Y9BV0YgSPU0TwvtSi9HZ8H07rRp7CSfvVB5AM7oI5gOgkE8s0v5XyvLWW1RTH6UiDQUv1BWl3gOm7jXs0Jm8k7Mpc5e2W3tr72vPfi1ZlimJI60Lj5672bXH+OmKjMgpDmS4AC0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707739513; c=relaxed/simple;
	bh=hGeU0tDR2vKb3/FdMiXxxlDLEBPDLmiPFdr/EKSmBsI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VFYmis7+5TkdKPzlakMFjGB4/nXx1s/u3T6gy9O+OrmBDNX0FbEIew1l/e70JF5Bqx0lk3jdVRqMrAA0l1jd8F6WjoRE3mE8YzaSgoJOL2ll8zygJA4EOXuGWVh1Lb17SuZTVWffgHP/11NnUoGsDgh18gE6qkPbry/BPszF5Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKak9U4i; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKak9U4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707739511; x=1739275511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hGeU0tDR2vKb3/FdMiXxxlDLEBPDLmiPFdr/EKSmBsI=;
  b=LKak9U4idbxRB8QBU0OSwPRBFigmwcSlJDz14jK9Jnb6S5XkEmIdIVF1
   5RCVyNUjbnMYhZZOXO2sDAXCPxGOZ8vYo59xjsZBhq0lSfRprK9U4diWN
   OXrNY/Ib20ZqGrRRA8297mK5BmnIOWJOM81o56AJiFkTZP4G/ZZWCM6cb
   nsY3cNh1gXPj0I7ROeMcikCw6pHP/3MlFcppTX9uJCMM98U4l6QvzifTo
   r6BZFjwPq+qXb65wTYO5VQElWqx6hx1gPclilFMGHuVOwlcQnP1wE5Q3N
   Nk70L9HrCCdCSGpjnR5D0TT7lGnbl93otT7iFdLLxmd8HOAwPWbeG/wGy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1839055"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="1839055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 04:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="2539718"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Feb 2024 04:05:10 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 04:05:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 04:05:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 04:05:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaRRPwod8WNa9yDkg5emmqj1kR/E1HovpfyfxFz6McKkOkuwTIal/mK3dcYVhgAT8jWBZSUWanjtQRoEQUG0F6sC1X1Zm72vFaAEGZVMoTY8hZH5B1YlHHZ8sqChndkMw4N/T+0MtEzmaVQagi9nI+JrA5ah/rS7W+wJatSYdfW3Vq1UCtF2Pf2JHdYj6YSsjoPcWj0YqiNnkqOQ6O+t5ftNOVfIPerIBE0E0InME1SJ3gc55qQqfM7Eqdc8fNzkG+qmI7s1yZBJn9nsmBYZrtp0fTBN+YpOMEpXS0sMGI9K/I8rBhTTkXbUO7+p6NHYUSGvPG1G8d33/v/QTEGtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikAlAT8bIe8VJTMMgRKGgsAEtAvYvLIWwWZ+aRqEJbw=;
 b=CPtZTj6DGCtjCHycfZWjKtfCubi8qO1bOuA1DPlU7Zo2ziLX2Mll2pxRgzkWt2iVWkyiTyQi7nTYKvu/5mi72EJ2umM0wYdf0qaUqnYwKpVHHB1Dw8vWwvA57Th+gweqjEuYTxofmv9y9l07fG8Pc7vPTc2HihVU3+DuK8O6Gn4G/gpae4d/EH5atfhm/gHjYT/p+dWx/+EdSAQrVic+enKsLzCkfghlA6KOWnmbWlNXLfx7w2I542Sh6r4YkdLqq1To5CzECvdSj7BZ/pus6gNeO8G8IddytzquSQzTeaVecHTT5NNJNu/OueFzQDpN7/fj41PaUe9lAA/jZzOQVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Mon, 12 Feb
 2024 12:05:07 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7270.033; Mon, 12 Feb 2024
 12:05:07 +0000
Date: Mon, 12 Feb 2024 20:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [broonie-misc:regmap-kunit-random-change 6/6]
 drivers/base/regmap/regmap-kunit.c:1322:24: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <ZcoJbDxHAqt9dOSm@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|SA0PR11MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: bf646ab9-c420-4252-d6f7-08dc2bc2dadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y05A5iD+zIAPvnw/2HNsxHyg+EjNDwGskS77PAtdlX0UZO+5aw7HmWkFSds3MxZbg22uQw5wEVuhMZpPDaLliXLQixsPoLBP4vTx2wCCToM4BPz6ezuAyOqSfcaPipN/i5mCQN0zGIHAHiWZ3IVJ6IsO6LmLHX4hcOpwWkDQFKsbenECiVM6EN3bAYj4KE3o0QxgaCzlpeLLDllWuBdtPaEDAlPg2CkS9BbGzBcdzbdmnlRhHLxsxMZw5/54RWZo0k5aYzC+vkQ/N2qH0cPJl98Vba3z+wkTgqK8xHDCkGR22T+YqCI2szyIzH3FCDU2FR2dmZccKTjtVIuJRCHUmdBI3zhAK3EW2uJeGjXi2MvM1OzcqoB4wUurm0pePZxumvFXN0C7kzqMWKEGOvY3V9rQ3GLnPDrClfh98HX89dlyGei2lWcHX0q7ljT/ejHZuyUs4SQQuKdpWeLWQcBqxfn15iUZOaGomc00SUFl/V7y90a+s2Ke5BX1efdHtgRbfR9y72D6gV32r8jKSLfYpmVrM85DzYpdV7EgL9V1uSx+Rezy0cjYzyh7bu1ci0cX2+MFlJ8Ifc25VOjKz84cGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(136003)(396003)(346002)(376002)(366004)(230273577357003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(9686003)(478600001)(6512007)(6486002)(966005)(41300700001)(33716001)(8936002)(4326008)(8676002)(2906002)(5660300002)(66476007)(6506007)(6666004)(316002)(66946007)(66556008)(6916009)(83380400001)(86362001)(82960400001)(26005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AWFrl785Jam3xwD7t66Xryk+xTWjRmqR1Q2ukz0jecZIXiQj7vAw6djBye3V?=
 =?us-ascii?Q?tbZq0GBjoEF4H+yhGxpYlJRqA1gXbMGDeGvPsO95m2rz/7g4Xl1qmRozcAu+?=
 =?us-ascii?Q?0W3/RAiamVriU6jrzux4Am1UpLr1/KsSbOqEWUVLDOrUwJN/ddZPYDNWMb5b?=
 =?us-ascii?Q?bATdQYF0wrXNWRFMbiJicCkXkSOFXFSiQGvx9Z0S+WKo1/A4gOUCEuFt/cq0?=
 =?us-ascii?Q?8k4GnNBMK3987dwh3fL+AMyAD9rw7O78HAnyNpL3GQ9sDiSUNk0Rw1HJMQRp?=
 =?us-ascii?Q?ysY4t2rl5o1VQbmy3w8WmiAet8YYgzhuwBn+Suy0Q10Goe17kpiSghCJB1l9?=
 =?us-ascii?Q?JxC/bSFhn2S6DJRQUqC9b1OZFV7pp4mY6+FWUpxwX7TfcO+lHRh3+tCN+q7C?=
 =?us-ascii?Q?Fr1OcMTsa8ivSuVmuLwcDKttb9NDeogTP2gjh7EwChInMov9MucLdhjGw++7?=
 =?us-ascii?Q?18zs0WYUEB3LFs+TJ9y27r0JFMi5njbl+sDRNhFZZ57gU8KVx7rE82W1Nr7e?=
 =?us-ascii?Q?pODkLl4lw0wC5ST1DodJFtBTCOAAXYQkaapqaoJXD1TX4sK6GzeyqIPr69Fv?=
 =?us-ascii?Q?X5lsZ4mOPZv0++gUQtFCqpNFiwwiF1DsSH8CCQ6ZTR0lqhXiJAwxWnJB1NYK?=
 =?us-ascii?Q?nUqUvND/PIc/kplp2R7roJyxJbPMvzmKiWZxh7KUA8JwEztn1Unqidz43W0C?=
 =?us-ascii?Q?gYtn4+sjw2QX+B9Vr1BbZqnsglNCPwhKRt43IUJiIo03yl34ZbGDUcCaqSoP?=
 =?us-ascii?Q?DfqGXnjH8R7je+wquRDBXdPXU1VnN/FeDz2g2nxj1nwaEsxQYxC7CryjbHGj?=
 =?us-ascii?Q?eM6hSbVjDo9H98ULpZdsDOEDneuvjqJFB1WZxiRhdGevz+4iBhXEK/zBK7X7?=
 =?us-ascii?Q?tJm/SXxz1mcUN5cpbFfdzM3Pa+O8R6JvxYeaiFjEypUFVG7Xx3ZGGzsXNBzX?=
 =?us-ascii?Q?3CgWyFfOoAib2PYJVOIGEwGcY+3pnaR+avtqHVS3vbPIXccIYfo1pKvBhp7z?=
 =?us-ascii?Q?L2fnD8WlVJ3TXGYBfuB0kw2IfVl6R1s9zcDC+PRaEC1F4005trpdqnw2UVH6?=
 =?us-ascii?Q?rqa3lGmsO7R2z26aAHmqDZPUcEeSOislRloUYtD7tRR4GXvAvdODqebLK+fY?=
 =?us-ascii?Q?dE/iZessKm6BMIC8j39YbiIhu+ooPym5EEweaiDRa2lEMrVS52rg72mqnWfd?=
 =?us-ascii?Q?yoTEuZyGKS81/MHec2B4Tfp7rkc1WTR3HxI8wwTA1oR/nw72RXIqYBPVpk/N?=
 =?us-ascii?Q?/GLvZMPo1gY/TnIl53O2fWyEOzQOBqQF1OCQLfILJAbgbf8yuSaOCGED13R/?=
 =?us-ascii?Q?SURv4q1nEH81GAODNElwsmnR/uuxOzxF2uh/CQU/97+JfS91LIMb7uwWRSjp?=
 =?us-ascii?Q?DsItt2rwwzBOqYenky1d+rgS5buzUytVB9cqUE97sdzHft5JX1xW71GOLguK?=
 =?us-ascii?Q?5mO+FuuWCvXgGzTGzYskzHwgNzCUnI03EcoOIyM84z3tbZ3LUXLsGisDeROY?=
 =?us-ascii?Q?CacWpQ+h4Z91bfNKTV3M6o1GXj/icm6Lg1dW8i7l1G3bMdmBfEEO9FsyvQBI?=
 =?us-ascii?Q?X0TY+QOmdllw8laTRdbSNql1/PcajofDCWlw+6qnQev7QfdrViSY/WMZ/6oI?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf646ab9-c420-4252-d6f7-08dc2bc2dadb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 12:05:07.8149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Cb/F5fsrIXZz+JtmeGZB+MiKdFD+MuEoMpMRdA+gJaBVpmsnIfOx2s4I/x6lVmfzeWsB5y+x4z17cEK91Hrkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git regmap-kunit-random-change
head:   3a0dac62f102669c43510607ddf5f630210bcc6a
commit: 3a0dac62f102669c43510607ddf5f630210bcc6a [6/6] regmap: kunit: Ensure that changed bytes are actually different
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-061-20240212 (https://download.01.org/0day-ci/archive/20240212/202402121635.CG6PEwhN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240212/202402121635.CG6PEwhN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402121635.CG6PEwhN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/base/regmap/regmap-kunit.c:1038:43: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1041:43: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1118:25: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1118:25: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1120:25: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1120:25: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1187:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1187:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1190:33: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1190:33: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1240:28: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1241:28: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1243:28: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1244:28: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1301:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1301:33: sparse: sparse: cast to restricted __be16
   drivers/base/regmap/regmap-kunit.c:1304:33: sparse: sparse: cast to restricted __le16
   drivers/base/regmap/regmap-kunit.c:1304:33: sparse: sparse: cast to restricted __le16
>> drivers/base/regmap/regmap-kunit.c:1322:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/base/regmap/regmap-kunit.c:1322:24: sparse:     expected unsigned short
   drivers/base/regmap/regmap-kunit.c:1322:24: sparse:     got restricted __be16 [usertype]
>> drivers/base/regmap/regmap-kunit.c:1324:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/base/regmap/regmap-kunit.c:1324:24: sparse:     expected unsigned short
   drivers/base/regmap/regmap-kunit.c:1324:24: sparse:     got restricted __le16 [usertype]

vim +1322 drivers/base/regmap/regmap-kunit.c

d958d97848a660 Ben Wolsieffer 2023-11-02  1264  
155a6bd6375b58 Mark Brown     2023-06-11  1265  static void raw_sync(struct kunit *test)
155a6bd6375b58 Mark Brown     2023-06-11  1266  {
155a6bd6375b58 Mark Brown     2023-06-11  1267  	struct raw_test_types *t = (struct raw_test_types *)test->param_value;
155a6bd6375b58 Mark Brown     2023-06-11  1268  	struct regmap *map;
155a6bd6375b58 Mark Brown     2023-06-11  1269  	struct regmap_config config;
155a6bd6375b58 Mark Brown     2023-06-11  1270  	struct regmap_ram_data *data;
3a0dac62f10266 Mark Brown     2024-02-09  1271  	u16 val[3];
155a6bd6375b58 Mark Brown     2023-06-11  1272  	u16 *hw_buf;
155a6bd6375b58 Mark Brown     2023-06-11  1273  	unsigned int rval;
155a6bd6375b58 Mark Brown     2023-06-11  1274  	int i;
155a6bd6375b58 Mark Brown     2023-06-11  1275  
155a6bd6375b58 Mark Brown     2023-06-11  1276  	config = raw_regmap_config;
155a6bd6375b58 Mark Brown     2023-06-11  1277  
155a6bd6375b58 Mark Brown     2023-06-11  1278  	map = gen_raw_regmap(&config, t, &data);
155a6bd6375b58 Mark Brown     2023-06-11  1279  	KUNIT_ASSERT_FALSE(test, IS_ERR(map));
155a6bd6375b58 Mark Brown     2023-06-11  1280  	if (IS_ERR(map))
155a6bd6375b58 Mark Brown     2023-06-11  1281  		return;
155a6bd6375b58 Mark Brown     2023-06-11  1282  
155a6bd6375b58 Mark Brown     2023-06-11  1283  	hw_buf = (u16 *)data->vals;
155a6bd6375b58 Mark Brown     2023-06-11  1284  
3a0dac62f10266 Mark Brown     2024-02-09  1285  	get_changed_bytes(&hw_buf[2], &val[0], sizeof(val));
155a6bd6375b58 Mark Brown     2023-06-11  1286  
155a6bd6375b58 Mark Brown     2023-06-11  1287  	/* Do a regular write and a raw write in cache only mode */
155a6bd6375b58 Mark Brown     2023-06-11  1288  	regcache_cache_only(map, true);
3a0dac62f10266 Mark Brown     2024-02-09  1289  	KUNIT_EXPECT_EQ(test, 0, regmap_raw_write(map, 2, val,
3a0dac62f10266 Mark Brown     2024-02-09  1290  						  sizeof(u16) * 2));
3a0dac62f10266 Mark Brown     2024-02-09  1291  	KUNIT_EXPECT_EQ(test, 0, regmap_write(map, 4, val[2]));
155a6bd6375b58 Mark Brown     2023-06-11  1292  
155a6bd6375b58 Mark Brown     2023-06-11  1293  	/* We should read back the new values, and defaults for the rest */
155a6bd6375b58 Mark Brown     2023-06-11  1294  	for (i = 0; i < config.max_register + 1; i++) {
155a6bd6375b58 Mark Brown     2023-06-11  1295  		KUNIT_EXPECT_EQ(test, 0, regmap_read(map, i, &rval));
155a6bd6375b58 Mark Brown     2023-06-11  1296  
155a6bd6375b58 Mark Brown     2023-06-11  1297  		switch (i) {
155a6bd6375b58 Mark Brown     2023-06-11  1298  		case 2:
155a6bd6375b58 Mark Brown     2023-06-11  1299  		case 3:
155a6bd6375b58 Mark Brown     2023-06-11  1300  			if (config.val_format_endian == REGMAP_ENDIAN_BIG) {
155a6bd6375b58 Mark Brown     2023-06-11  1301  				KUNIT_EXPECT_EQ(test, rval,
3a0dac62f10266 Mark Brown     2024-02-09  1302  						be16_to_cpu(val[i - 2]));
155a6bd6375b58 Mark Brown     2023-06-11  1303  			} else {
155a6bd6375b58 Mark Brown     2023-06-11  1304  				KUNIT_EXPECT_EQ(test, rval,
3a0dac62f10266 Mark Brown     2024-02-09  1305  						le16_to_cpu(val[i - 2]));
155a6bd6375b58 Mark Brown     2023-06-11  1306  			}
155a6bd6375b58 Mark Brown     2023-06-11  1307  			break;
3a0dac62f10266 Mark Brown     2024-02-09  1308  		case 4:
3a0dac62f10266 Mark Brown     2024-02-09  1309  			KUNIT_EXPECT_EQ(test, rval, val[i - 2]);
3a0dac62f10266 Mark Brown     2024-02-09  1310  			break;
155a6bd6375b58 Mark Brown     2023-06-11  1311  		default:
155a6bd6375b58 Mark Brown     2023-06-11  1312  			KUNIT_EXPECT_EQ(test, config.reg_defaults[i].def, rval);
155a6bd6375b58 Mark Brown     2023-06-11  1313  			break;
155a6bd6375b58 Mark Brown     2023-06-11  1314  		}
155a6bd6375b58 Mark Brown     2023-06-11  1315  	}
155a6bd6375b58 Mark Brown     2023-06-11  1316  
3a0dac62f10266 Mark Brown     2024-02-09  1317  	/*
3a0dac62f10266 Mark Brown     2024-02-09  1318  	 * The value written via _write() was translated by the core,
3a0dac62f10266 Mark Brown     2024-02-09  1319  	 * translate the original copy for comparison purposes.
3a0dac62f10266 Mark Brown     2024-02-09  1320  	 */
3a0dac62f10266 Mark Brown     2024-02-09  1321  	if (config.val_format_endian == REGMAP_ENDIAN_BIG)
3a0dac62f10266 Mark Brown     2024-02-09 @1322  		val[2] = cpu_to_be16(val[2]);
3a0dac62f10266 Mark Brown     2024-02-09  1323  	else
3a0dac62f10266 Mark Brown     2024-02-09 @1324  		val[2] = cpu_to_le16(val[2]);
3a0dac62f10266 Mark Brown     2024-02-09  1325  	
155a6bd6375b58 Mark Brown     2023-06-11  1326  	/* The values should not appear in the "hardware" */
3a0dac62f10266 Mark Brown     2024-02-09  1327  	KUNIT_EXPECT_MEMNEQ(test, &hw_buf[2], &val[0], sizeof(val));
155a6bd6375b58 Mark Brown     2023-06-11  1328  
155a6bd6375b58 Mark Brown     2023-06-11  1329  	for (i = 0; i < config.max_register + 1; i++)
155a6bd6375b58 Mark Brown     2023-06-11  1330  		data->written[i] = false;
155a6bd6375b58 Mark Brown     2023-06-11  1331  
155a6bd6375b58 Mark Brown     2023-06-11  1332  	/* Do the sync */
155a6bd6375b58 Mark Brown     2023-06-11  1333  	regcache_cache_only(map, false);
155a6bd6375b58 Mark Brown     2023-06-11  1334  	regcache_mark_dirty(map);
155a6bd6375b58 Mark Brown     2023-06-11  1335  	KUNIT_EXPECT_EQ(test, 0, regcache_sync(map));
155a6bd6375b58 Mark Brown     2023-06-11  1336  
155a6bd6375b58 Mark Brown     2023-06-11  1337  	/* The values should now appear in the "hardware" */
3a0dac62f10266 Mark Brown     2024-02-09  1338  	KUNIT_EXPECT_MEMEQ(test, &hw_buf[2], &val[0], sizeof(val));
155a6bd6375b58 Mark Brown     2023-06-11  1339  
155a6bd6375b58 Mark Brown     2023-06-11  1340  	regmap_exit(map);
155a6bd6375b58 Mark Brown     2023-06-11  1341  }
155a6bd6375b58 Mark Brown     2023-06-11  1342  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

