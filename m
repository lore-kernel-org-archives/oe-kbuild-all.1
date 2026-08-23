Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9096A3D6477
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787489729; cv=fail; b=PIfnTdILB76tgHA8IOYQ53x0MmWk4gL/+fUXEpBX46eh3nCe7d6bUBEvjg+e+NlO26ugkmT5luYB3FTgvnJZ4YUlOW7gRCN8gpIH+qzGjU5/96rToVDRDu8tePRGkExjYvBNw6494pMU5X2KtmAajH7Kc5OS9jO3VgNX1zzFbfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787489729; c=relaxed/simple;
	bh=/YkGX/9DiYSmLEu0ZlbD9Bpv2kP6nUYBu0YhwEomIL4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MrPn6XLOvYnYk7wllqvNQASUDXei0Vbgeyn72jtYSvkrt5iqOn7K0nyPK5B/u03mHIkS98XkexTXKd84ZdNH+sNf+82QhBegnY2DGCwDOJ3ajAQrpSRJqHg8K5iHP7KXEbJ9+3sq2uq+yELokipgk+6pRNIdHWGY/4z+96J8oL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E48KGXte; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E48KGXte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787489727; x=1819025727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/YkGX/9DiYSmLEu0ZlbD9Bpv2kP6nUYBu0YhwEomIL4=;
  b=E48KGXtelSmk5z+sfdZ63p4AjXN57HS3lNPhgwZ2HioB2jZYi9Pe5BuD
   CXpjUo9SBhRTDQNU3TqZzHjVGZvsYSLM4SjlEMyM06OjS0vfgddLsFs8u
   lLa+xfpIvPuzHNiD7BBo3lnsltmWEFKxGBxsCPs0ScP3Kfrtb44EINY0e
   ywSSkRqjorHYxcv8fk6T7IzS16k1mejiQcaez0cNGATq+cwNCqI+1ucMv
   4f8V/h2/hm3W3z6+zs5I88rg4XDYGDoEa9bwvVcQNhJkU62TMcclVT3Ra
   ntAX8molECtZJ26K68YLEQalD2w9yUQSSLFS3Q1kGffnkC+xsKWDWFH4E
   g==;
X-CSE-ConnectionGUID: 0E/keWjMTd2INSfJ53f44A==
X-CSE-MsgGUID: i1h84QyCRu2BEIYQkVKBdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="113497700"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="113497700"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:55:27 -0700
X-CSE-ConnectionGUID: V1PhEyJOQBG3Vb1oncrnMg==
X-CSE-MsgGUID: J2wL93b2Sl+EZkVRc3uKzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260607176"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:55:27 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:55:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:55:26 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEJIZ8We0zbQmPACs+CzznLx+psGsybVIIPgHyrfiatEwkbqM+Ay9sYWCo8EWKMqWAMuxx7ldVoiKnpnWVuI8sz+TWqg6CkIOwI3em3MlzcqSaP7vFmOD/XtGAACceiGb1g/9tto/rDLRh3pd6noPTr6jJheoKKqlDiOf+BW8ZUoufI2DKjvLnH/XL2CN/X3/tXQD48xsHsvgwzS2LEeMrginXK3la91kvf/Cepn1QVI5/EJ2OstuCBxPjl0P3ovvOxyt5ljP6eAz6Qo1ManzlZGPrdXgXzl70sy6G6PIaxB+3hgAUKv+0JRW4NYQulUG7gPj0DN4or4EDuZl3rk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqMChn6/bPt3ZyhZrcFI7woF7bltd4LVWXVysbqnlwc=;
 b=CmK0eNYF3Szp3h1nQKDq/bQp/Mf2KnVunpaKvnu02W9PyFy5ESHNqzcMbH0oDzeYE7cIoY4VPc5mBYAW2KrosLckzHhV//NecZwZLKDc4JzvOdUvgAv/c4CPfs5fyJhIze3kcCbsxgA6oXN11CzbBp+VbWZfz4drTEcOdy2WFg4stxppUz0CjiGchoGZ2o4GrCYIW5rwlqaaJsh/dWCnqZ4Awt/CUHI2CabeXno7/YqWmnc9w3XHT/tGCGrb+f2wW7ml1ThQH0AUA78+pgT33jrQt9S1vD6cw8Sg3G5H4Xr2lc+hfr4jweVNFyEaumfmHvz8Ab7zWIpo6QIf/via+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:55:24 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:55:24 +0000
Date: Sun, 23 Aug 2026 20:55:15 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android17-6.18-kminext 0/18]
 kernel/sched/fair.c:8997:14: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202608221518.UeEgsvqJ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KUZPR04CA0027.apcprd04.prod.outlook.com
 (2603:1096:d10:25::19) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: c53a53fd-89ab-43aa-8223-08df0115cb79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: EL1i4D3cPOw2Il3DBWnhrp1RFK4geEBpT8fTVPXxLx14l1pw1Z4STUxdAmHWgMRotQDr0O11ggiR+IrYY1XWEXdXFP6yr2i859tEALg31o/jj4T2mAItYFQaQpx+ZKCj6Ao/TH/l91besgy+TqEXoa4Zv4S67xra6diZ3mLhbOINIl/INg3wNUpSEyOB1OHfn+VOQmWKc8+rLU7KrDPYAPEQBPYKHRp3SOjCGxbXC6z3/RX3q/ZjHLHnS4LE5xjSSpyvo54oC+jYt9jNy8RMXJ+IU5yr02xnXA1WvQ1QtwATFGHG3b3MA2QzAgfpTMtTk3i+Nxfbz5EKs1kEDXdMquoIfkScAathWoy6EBY1jbTU4yIbmjLJ7KQcuCBqR7760aWV4ppFmMfjItIKfkW84qx8qmG1tfva62oSclifN+cAmR5z69JpLxLk7m+WxR2pn3NCdOm89djL2Rqwj91k67UmGaE95me0G73zo2wWWYi21t9JGvz6dptb/XVChXtnpWGLXUgL1eZmufGIDX5OBOKiC/Zxv3NTH+a5CDY7MP7hYWbn31/zYQUAIeEQ4bQypVuHez0CghF7BDCBapewmSKJpTx+e82YoCVw4L+cWv8w9vNvdYowXM1QzaW1+TtIFy61F+WOQON8QuB9g7/5SS9r3uIwzSiEhMg30ySS1Ug=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nqg50AY2Yb4wkiaGQ5+bTv4rU4AgXSiuHioRr0ZqZs7CwY+Au0phIOsHnf++?=
 =?us-ascii?Q?aHBh/5C1QQtI2dYkoQEqEbrtXgEBaedwPxv5IMBWVFigk/n+FrGhF1e+NsEg?=
 =?us-ascii?Q?ArTqAQJPljl0Kt1YL5Yys3ZPSeeAVla0vjNNO9AJLDKDXvuJZLPLE2+Nbd4N?=
 =?us-ascii?Q?zpnBLFkZHz7SPqnE+CxayA71GxZFNwxihQ//39nVORBmR8B2nfbzYC33ZMr4?=
 =?us-ascii?Q?xYf5AvA+5f8NYIMiKwMZm76cWdNcA57e59C0iS9I4SsjMUO0APUwjMZM3sb0?=
 =?us-ascii?Q?BNGmEwL02lzP3nLfSeHu1o6hzNOYx7vrV0URhPBx9BFf5wwUzx10Gh/xhUho?=
 =?us-ascii?Q?s4qZDLQ1Li5jH3U5OSytuecuY2kXO5LGPfCfplwvWMJpNEPne5Tc9dJlkMR2?=
 =?us-ascii?Q?GCTMbHnJp3s0OG2HtUGHHL7lflP0NXIv3Owuo3+AggZq9LGKoiklf8QbZrNl?=
 =?us-ascii?Q?JaxkBVNiMBQUjqIIsSqOnL7PlDzTFGYgpBNL9JWxYW/IvZ2QABA4v6r83p9B?=
 =?us-ascii?Q?vg+FPV2pbAOAFV1qHtSHvn1609p53qad2QcCqgippwPRuShXvhgV/0yuQ/Vv?=
 =?us-ascii?Q?vdGsTdTU/E96iBRhk4MFClE5bgF2PrCIk7nLYeMYgE5BiKATNk2aiRX3AlVa?=
 =?us-ascii?Q?pu1aI8fR2f4ejjyXwj4bIjGbn8kFDWgzIVnrHq1D+616lzqPUg4RMHlsCAnJ?=
 =?us-ascii?Q?RHDddwFFqH09rsR1CP8A7irvGnHwNEK+fvBeren1HmcU7qtMN/14arrlp4eQ?=
 =?us-ascii?Q?D9QUdHEJwsF8qIPOaHhFTSEMDRvK4VXogRKeg176hGDkcxpQqPxE5N7DXnLn?=
 =?us-ascii?Q?ZIBrxVAPfphiXCXckKLVR5NS2mXBtmBqBXlUQb30KV3NAdvn/WnM0q0+KGS/?=
 =?us-ascii?Q?ZyZtt6e1O2Q5DBYSYCfMYYxmbr+f7wfPU5V/ZqiixfHXWYV08XUd+vvp4ofU?=
 =?us-ascii?Q?Fylsi8gaxzrOfI/3DM2yI1LchFjF90FIvnkr3BAUHgeNHZfc+nbVEKichn6E?=
 =?us-ascii?Q?tKHhpXDwTapZF0tw6AT4cjQ92+25O1vPoqcdGn+bgy4zkFla9InOaCGRF5hJ?=
 =?us-ascii?Q?o6c+jgX5+oN3VlcOrAeD7Fn0mqobUQdH00iRWyf4OXgL8SnlR8LuawOj3mEG?=
 =?us-ascii?Q?/calGCXt+HZBQZISsMcSjZmfVEGAT93Rgxc4zoqWgj/VGaaYgjsnO20kL2ec?=
 =?us-ascii?Q?bfB4wi2AHPXQL3e4gVu4auDD3dBZCAOQHE1RSuaJzFe9W0eqSz6MU2BlcOBw?=
 =?us-ascii?Q?KyUxX3agBtxDQ0JzfSlOfxFCYQUm2AzlAqpAodFYD09aTiIN2zv8FcwUzSI+?=
 =?us-ascii?Q?WeiQJaVCCTnKkIDu72tLUgyAreSFa3CoOvp7zzOiwXksHK2MA3Ml3i+2fhGa?=
 =?us-ascii?Q?kAxqoZUeA8+UPy4VI4HSDvcpDc3XQLMAyWD6gJM07xerk6Ewq/y4cnn43uxC?=
 =?us-ascii?Q?tqir814VGFsvOHJf4EG6StLWiXnKoS2miJG779hLknN8IV2TfdsqbHtvN5es?=
 =?us-ascii?Q?HoqP6qb3N8hJBHdI9/tsiuE/rFvIQ0LZB0NMTfKVl1FVcxbyPLlaHFXy+dUd?=
 =?us-ascii?Q?rlX+dtpWE3y+o48b8Beso7Giz0tVmdI/SYXub3YkNjshr9WO2V1Nejye8ByV?=
 =?us-ascii?Q?zYK5RpDL6nq+Zw5iHI8bI+2IxE//XTcRGwF/PAVQgVe5CAPtUvH8s5OLVDU5?=
 =?us-ascii?Q?ZTp3KMTOpPQSh+dKwG/RErBlh9tYtRnJF+82SW/DnJyNwzCnUsHi180Wr9q2?=
 =?us-ascii?Q?JPGT+Oseeg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 2Dhu+5zVt/yalMnXf+Zty8NqX1vYkkOHj/yLMQ6WDEpNfVcMDxSZ+V5POgg+ho0AD8g14t+dopY7NQAKfITQ8tDMGj2i06JYzYRN4qKduQXw8nOJ/0aChA8Z6u74WZt31QN32jd0gxifz8Xs6N3gxA+tgR+hz/8GcYG69X9SwfeUxoQ5kuugDsnqS+x7H7QMYQZtw+HNaVRTIYg0VqzBw60pxpqECXpHN103KeHGkE/XIr5HnNe97BcStm3PJxbvFWa2e1jHZpo+moVj6CE3tThfKYuwlQEQHbdtDdjCAYrTOKJ77dPLGdTRxOW+8Ft3eRwLM/AdNsHEWADQawjU4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c53a53fd-89ab-43aa-8223-08df0115cb79
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:55:23.6611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svk/E9Z7eXwPk12sQktKothuKOQnQOXMB5NHvZLHTr19zmzyrjIcWsPzKz6T4CZSMFOwKQt8dQodM9FsmT+n4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   e90350ec69a7f156c6eda15a13e6671cd731749d
commit: c5c86c524cdc66dfa5514855826d380b85ce7abd [0/18] FROMLIST: sched: Rework pick_next_task() and prev_balance() to avoid stale prev references
config: x86_64-randconfig-122-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221518.UeEgsvqJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221518.UeEgsvqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221518.UeEgsvqJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1213:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1213:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1213:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1247:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1247:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1247:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:1305:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1305:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1305:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13025:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13025:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13025:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7092:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7092:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:7092:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8494:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8494:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8494:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8707:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8707:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8707:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8849:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8849:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8849:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8883:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8883:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8883:37: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair.c:8997:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8997:14: sparse:     expected struct task_struct *prev
   kernel/sched/fair.c:8997:14: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9117:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9117:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9117:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:10176:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10176:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10176:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10804:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10804:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10804:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12257:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12257:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12257:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11906:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11906:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11906:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12371:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12371:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12371:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6796:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2532:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2532:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2532:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2310:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2310:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2321:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2321:26: sparse:    struct task_struct *

vim +8997 kernel/sched/fair.c

  8984	
  8985	struct task_struct *
  8986	pick_next_task_fair(struct rq *rq, struct rq_flags *rf)
  8987	{
  8988		struct sched_entity *se;
  8989		struct task_struct *p, *prev;
  8990		int new_tasks;
  8991	
  8992	again:
  8993		/*
  8994		 * Re-read rq->donor at the top as it may have
  8995		 * changed across a rq lock drop
  8996		 */
> 8997		prev = rq->donor;
  8998		p = pick_task_fair(rq);
  8999		trace_android_rvh_replace_next_task_fair(rq, &p, prev);
  9000	
  9001		if (!p)
  9002			goto idle;
  9003		se = &p->se;
  9004	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
