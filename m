Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884C840B6DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887975; cv=fail; b=f6vpOHbhbj1LdAvvoeH6HO/8lk5YwF6vjfRq7p1Jdr+PPKacnMTpIYKXYLLcDmJZdkA1CumY3+UIWYhJRsnndDngvgg825KPZ7jGZlsPOAZd0A6FAYhuaw43hY59lUzcEHuMH1DJa8gq+gWo+YfehBQZ7LkWwad/ayHCHqfz5L0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887975; c=relaxed/simple;
	bh=L0jlZv+5AnW7IDo41d9PTdWpDOQDHtp61E2TLyeXC5g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=fGE5po4imic/v4gvIuwjeZL8c8rynzkC7FSWYB4DW+9vBRj2q+DzcY/4sVOJYR+Jy3OuThVzaslall1dYa+ES2v11JyasunAZO+SAL/mvkMoMa/+E263ckM1eETrU0xxutc2AH4s3baGyFUFmWQOys6ywU+iiDO0av8bosTKlBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxzA5TbH; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxzA5TbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779887973; x=1811423973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0jlZv+5AnW7IDo41d9PTdWpDOQDHtp61E2TLyeXC5g=;
  b=kxzA5TbHXMG2caapTzUYjLauRI+Ray3MMr7qsog6PRlqSb3ayrE13Itc
   KW5DK+LNp0kutBrFaBrWkmCkNUtlDcAhQWPom84kEWNo817bfVQJMwJj1
   lhr1KRXkcZVABJrSdcNJD45Kk9RUJwY7SQQgYNrKC456przHuKNqFQYH/
   qi8L2tjADkDQadadvu5APu96JoK/aT11TREqtTD2nOAMpgz0qhxSe3a5q
   pPw8AaQRAAiD6UpQ3G6UCN2wv8sbLwJNl29VhqAooBfCFM3donitB7mS/
   rQdbsm8WTr0/l9y2auulp3jxCTh7iNiAVYSCsJXrqNM0QQ2Kvz4Zf3ZiP
   Q==;
X-CSE-ConnectionGUID: /qFVAbUdSXuxg2rk75uhPg==
X-CSE-MsgGUID: TQ/fpqo6Txa2J0LhHOb7og==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="83294301"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="83294301"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 06:19:33 -0700
X-CSE-ConnectionGUID: rssyhU/YSCCHHDnrustjaA==
X-CSE-MsgGUID: z8lpl4LVQ8ibXPX9L8OwEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="239643952"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 06:19:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 06:19:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 06:19:32 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 06:19:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSt6YwuY3oKXUipVZGA4S/AZF5KKBy3NAV5pBnFwFgdwdb8H1a88rgyZAZAkJfn2qUDypal9w3GBaw5Vvo9lc7pQ1BswShHsezYzE8u9jkWgwzcMSXjQRCfaflqXrwbN4UpzkIrqg2DgTeRUlUSERKELDw7rpUQ5T7QeBJGiFal6xe4xiK3ivowTAL9/0Qqtyx48GylyNMJQg189tDk/fB9soQ9+Fa+iXBTGnFw1QAJuqoMD/qrnZ9o8jCYbPwgWnpq+gb35KHi72s5oE/sz1uR3EKOFvEggjrjNQHNaupORx6F7moDOK59y0nanY1SBV5uJ2wW19yL6s8JogRzYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfqaJC8fSq4Ls9gYVJtlpZ7ulCMfMm91lqcMDCy5qNs=;
 b=ZPgD6dcbF372LLjiDBKfpqdHYeWbEdWXC0L9rWXpcMUlFejv3B14sPKYDCoXA6iAlJD0fRAamqdd/MWuUrpNRZNt8EzhMls3E+A5D2HeQSEKRkdRhLz1Jl/6DHDcHpBz4qay9J6XGQIUCkZdwPpuc3awne3RjLDehNqzGy4xZhgIu7jvf7yIUkZ7rcs2DUaD3RGJj3BgT6LUN6oupju04sPb7d+pJbsS8o/8r3FPD47O+hTyjNiEsefrh9n0LgTtBCclk5CzmBceNCe8jhLakMbpAP2AaLnmE54p8q3JwtwGvjmNHL8nqMeTBJVrEvdoOTh8KkrTiRF1y+DnoMpUCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
 by MN2PR11MB4629.namprd11.prod.outlook.com (2603:10b6:208:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 13:19:29 +0000
Received: from BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259]) by BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 13:19:29 +0000
Date: Wed, 27 May 2026 21:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: kernel/bpf/verifier.c:17312:51: warning: format '%ld' expects
 argument of type 'long int', but argument 3 has type 'int'
Message-ID: <ahbvWrmobBV1zZ4G@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0002.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::15) To BYAPR11MB3493.namprd11.prod.outlook.com
 (2603:10b6:a03:81::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3493:EE_|MN2PR11MB4629:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd5739b-2e65-4f8d-c53c-08debbf29530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: CfdDfvg+g2O7Zq3NpvF2LEzQ2hfD4jJni+goHC58qte/+tgQ1txmni759mcKpF+dP+EU9GexXD7PiqWdLUCGa/mTNUhmR3HqzaRrjngP6fVk1+RNECc9xme1KCdV0BCBLZ2qVpCVVjtAtlJNOLItBsNVssMsaOvCqGyOK9cT0PtA0cVHbvxFYEck5kP7hUMcjVMA1TgBwF+Hz4+j5fjYKeX8F+nyE2JovDNo9YuEICwzcNRiIzKQKIigZ5O1o1N/gqhCca2/ycv9fT7OSldUg4mM6/Busc3FZsCZuK/ze92Df7dLt+4S/WprBJzzl1FJobVCQfjWV3FuASyT+7dIIC9PZBTC9AOMIOOqisfdtwqetPHz5pGsj+07+G92U/ebxffKAg6ojDQQY1tU4F0mJWz5c8+rGaB65NPUEFKblBkuqvQZic+m5Lw0m4IXqqu1phWsqipyjYXRJKCOhigfaHn3zRghaqjILCqJDfDESU/iXgxA7rvHmLgXXug7aUndeKvL6gsW7C8rf0FiisvTgBo5m34ccHU+n6iGlWqnb/CbEB6yacCneeUscSV5kh57vg5/+1ZiahgL4lPruURVNIjtwEE3o4wqlBkRq0JUmp8muiIrgLagcMl6RSoKIpoojnqyJ8y8K/xjw5ejTflBqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yngfiau7veiQpYpTBsO++sz8cp8LbJ/TuPBhNMG3PV4eM4CSAE7Sztlr9uTY?=
 =?us-ascii?Q?vKcNHfVRrQciFgKehx5XbAvnftwUs5mm/HfK8hSTI8fL5fbQst5XdJ9cm+Ku?=
 =?us-ascii?Q?CSovDBbxHIMaYlstEjgb/2VD1SMwfY9+W1Jfmb/9Tms0ahT579i5NgGBe8hi?=
 =?us-ascii?Q?NGUjRlQdkW96nsI1IIqI0eL/D4LOJ4N5hEZUuwuOEsONZQL6Ql5zYYuIJb74?=
 =?us-ascii?Q?ZG1dUibcPQchfNSfIYb59eW/YQxQuvn+xeOcZktHkk6g6lS3ZHt9yJZsR2G/?=
 =?us-ascii?Q?0WFUcuXyVBqns1r6DKcpdn65tuPZ+CZPMYhWzqox0E0ww1C9WHxHNvV6MtH5?=
 =?us-ascii?Q?am/0kXxguihnCsCGZLtQohYGCmipHFrk4nLI0Xl3CJ0iWauhE2nNR7MEAhgr?=
 =?us-ascii?Q?Dh4+9sbiadNZw3Nzk4tUhh/thZ1QS20dkDBlmPPVNWQVzbwbLOgtASBs0Tao?=
 =?us-ascii?Q?dnvA+DJ4Go76AuAz8U/POusjdCWXvAYidLd+l3MswNHSzmHMOgtFxjOlVcJJ?=
 =?us-ascii?Q?uZHP+UH5Li5RCKZuI9qQdJGiPWxfXbU/CjnqL3dEI4ibbx3V6i60KG6LLKnZ?=
 =?us-ascii?Q?C0/zcy04qUgWirWwFXrqt9Vs7S4koIf53RPNSHuOkDbysje0N2FSMbjUC0zu?=
 =?us-ascii?Q?vnEIzHhICdWNqviCSOlXwqDPRqZP+PjPXaI0Rn0IFwgAs74KZYOp1iR3JMhX?=
 =?us-ascii?Q?DoaYhgZNCSblPRthFBkFlr9F3PTTj1o4IOCuhlk56Rf8vsngf7aQ/8E+qeMO?=
 =?us-ascii?Q?y7qxblkjsQgkrp0KNSXp3F1jZqCRQrtuldIbEzRXoX3PH24HFPKnL8EQ4x+u?=
 =?us-ascii?Q?nHvDaxXi/z7OttiMnUqaVpuSCgHDVJtu26h6IPHDeK7HM0TlU8eKP8u41lZf?=
 =?us-ascii?Q?9RjZZrvcZc36Ap4nrWDD185jGS1p0v1039a17HOhkXaaM20hMuHeIUs4RNs5?=
 =?us-ascii?Q?RYz9uMnq9eVQidtnquSNcT2H9ne7cZPWeqXg+vQHF9MFHa2VezSivB5czb+1?=
 =?us-ascii?Q?qpwY/KKxzQPuEk7XW3azOuuI8mi+OTKI31AV9mZbDX2wZ9usqNUZIzoBPC+d?=
 =?us-ascii?Q?DckNIUMD8AO6vr8ksHFtbUK8cdMyzw4fSd0aHEZuzKjerAB09DJdN0QlFpLK?=
 =?us-ascii?Q?R9cODBbvQ+y3PLI6t4ZPYfkLo7f1JYTOgDDIFWfPufLYU2F+qNcb8sMuLp+X?=
 =?us-ascii?Q?4oHS8Ydm2aGftTYN4fnTu78Hjg3Cue3Gxay+cucj3GQ+9YHbhZDBZy0qw1sf?=
 =?us-ascii?Q?PfgtggkB2+I1v6QSOg27KXIOC57qfsgUmfkJxV9Qv88aB/aq+dPj3PQM0EJE?=
 =?us-ascii?Q?egQpc0fAaPBGumDwvChY+ycdGVMv12uYu4eYOWQ4Fz/N2cNm/AgNbYCRtJlZ?=
 =?us-ascii?Q?7HQ1NvxLwxeRW/X5GDroHgAOJr7oa6LHWt/dczqXrEYhHDV6rKZiEjxbgAhE?=
 =?us-ascii?Q?c80L3qad/Lk5mXBjVt0EFj/4uFfS7boYa1LiyQVvMpBniL8I3A3RFrhWYmzH?=
 =?us-ascii?Q?44MlqO9nF9202FCDBNJK5c8nyIlr7o8VYmpf19AW6gOQIJ9o2sYPMd6Y0/r4?=
 =?us-ascii?Q?+hsYKqK0NRGpXFDWP/b54klzi9QgPjxJFRivHHZNwOiRl0t6kjnu7gPE33O9?=
 =?us-ascii?Q?rf8HgDCwqF4jOC/wr48HhT124kK3sNqF3tXSJ/LWEHeiBAR22nUAwOXZL1xn?=
 =?us-ascii?Q?eaFolyqsqB7qeOcgWvHGuvZRZL7RyJ1GWBoHfKXurA/Jo+sUMc+D7h8CKmMc?=
 =?us-ascii?Q?r+eCpxfLdA=3D=3D?=
X-Exchange-RoutingPolicyChecked: X5cHvY6JQbjV0j6a2l23/4h9IxI/JcV1TlESNARGUkq2mPLfrkg+kkYQbM1NhZTM57ZKhY0kQLNXXgfE+ehFw0RJYFPHXdzJgzfRakr4o+nlBGpX9uGYPARCHNMrM8NOCTodczztunTu8E8y9CZhVTfGi7ox3YeenKpieMGAMOLW5kX0eFf3nowktGfpO8SbdJM9bcU3N1pvLG9OMG3tOrBnW3tZAsaw2cvYsMmU8FAreel2uDB+fEIqa5dTwiWD+ookH/oNVmWrjFnKJR6uar/ux/q6XnJLEoSgsTkrs6ubLoK4VwggrIb7CYutseHqIM/gsO9kXNp5QF/8w6XGug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd5739b-2e65-4f8d-c53c-08debbf29530
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:19:29.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLHki4M1+guNgx8VucN8KBpK5isXPBzLu8Z7R8+Ta8ieEdQ6hn7cGJGg0Oc36f+hY3BM1SwH9RbFneC/WH02Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4629
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf-move-live-registers-and-scc-printout-to-a-standalone-function/20260526-180053
head:   71a332b01f49d441d062c1af011313255cbce050
commit: 2ce56afff3fb6a40dc9dd6fa274faddf8f4cd661 bpf: report hot simulated callchains when 1M instructions limit is met
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260527/202605270018.HUv1AvAl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270018.HUv1AvAl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605270018.HUv1AvAl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'print_callchain_entry':
>> kernel/bpf/verifier.c:17312:51: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
   17312 |                         verbose(env, "  subprog#%ld/%d", sub - env->subprog_info, insn_idx);
         |                                                 ~~^      ~~~~~~~~~~~~~~~~~~~~~~~
         |                                                   |          |
         |                                                   long int   int
         |                                                 %d
   kernel/bpf/verifier.c: In function 'disasm_subprog':
   kernel/bpf/verifier.c:17328:41: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'int' [-Wformat=]
   17328 |                 verbose(env, "subprog#%ld:\n", sub - env->subprog_info);
         |                                       ~~^      ~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |          |
         |                                         long int   int
         |                                       %d


vim +17312 kernel/bpf/verifier.c

2ce56afff3fb6a Eduard Zingerman 2026-05-26  17294  
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17295  static void print_callchain_entry(struct bpf_verifier_env *env,
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17296  				  struct bpf_callchain_entry *entry, int idx)
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17297  {
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17298  	struct bpf_callchain *cc = &entry->cc;
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17299  	const struct bpf_line_info *linfo;
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17300  	struct bpf_subprog_info *sub;
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17301  	int i, insn_idx;
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17302  
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17303  	verbose(env, "#%d most visited simulated stacktrace (visited %llu times):\n",
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17304  		idx, entry->count);
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17305  	for (i = 0; i <= cc->curframe; i++) {
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17306  		insn_idx = cc->insn_idx[i];
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17307  		sub = bpf_find_containing_subprog(env, insn_idx);
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17308  		linfo = bpf_find_linfo(env->prog, insn_idx);
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17309  		if (sub->name)
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17310  			verbose(env, "  %s/%d", sub->name, insn_idx);
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17311  		else
2ce56afff3fb6a Eduard Zingerman 2026-05-26 @17312  			verbose(env, "  subprog#%ld/%d", sub - env->subprog_info, insn_idx);
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17313  		if (linfo)
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17314  			verbose(env, " (%s:%u)",
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17315  				btf_name_by_offset(env->prog->aux->btf, linfo->file_name_off),
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17316  				BPF_LINE_INFO_LINE_NUM(linfo->line_col));
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17317  		verbose(env, "\n");
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17318  	}
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17319  }
2ce56afff3fb6a Eduard Zingerman 2026-05-26  17320  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

