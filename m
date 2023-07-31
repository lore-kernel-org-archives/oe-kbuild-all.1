Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E28612D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 07:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690788629; x=1722324629;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=VjtGenLlsd/NM+Ck0absx81wCngLHwJDM+aYzUJNE5Y=;
  b=S4hb3BMws+k9p89jXn7de4ij7RDZkoYsAexcpAmC0diniStIeJCmPlxt
   04BzZjXXFeYBTXOBEiJIs91qGBqvpT7X/mpvuT1O6m8xa8K3Dye/78RD3
   iR+3Jef6cPOyH4ilU1AyZMn9O9totCuVhWhNIqcS+AppCBWgm6o7Geqf9
   J6SFwg3IUmsbVH8GGy5IeO9yZV/23vK03M0G9tXMbO4dHccyJPpY3AxvL
   +MEy7NwvMQoZEsCXV4V8ArPzLTQYzNvnDuVF76UzWUSFTuVf4ihMDH49y
   O4oEBouIpJLVrTExBG/JARdGJ1JSVuMI1+Y2zOYCvtTJqz6Ug3f61WHti
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="371654456"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="371654456"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 00:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="721967475"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="721967475"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP; 31 Jul 2023 00:30:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 00:30:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 00:30:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 00:30:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Au2XJjfNpkcgmMq+jevzkbKQgGmPAJHTygdsRPxOGDFM/uaHklTfz/0V7fPTonKtti6cRFU6XyVSlMkw3AwkIzNJGiJUpdViTBNsELCfdCQwUrLqUwQYRje0vVwMdenuNfzo3/YNM80PkqvQC5W73h/5us5guEnEBC/dxX/RKT+Knfm+7xS/UMyCAkaK6aXDwwcIXPJXNz9xsBlLiakCUnqn9kAYCDjx2v7nnDHbI1snwkHJftt7xvl7oL2M0cCjIrRE2tjUc49GPVpe6kEyiiw69vxZav5dL4CZlYNGBMqfaM601ZjpLY54xe3U8UUmX2ZXfWEjR3tWvbgWMHh4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mMRZG0oAFTtKCLbXKfzX7simrJr/TFQTPv7vvYsXis=;
 b=hynd5Lb0l2IiMG8daqden6ecgR+FpjhPGr0mI/A6j4U34k+Ky7QWORsC0b+jKuYXY/NabEtLBQLpcnXoY5Q/UzyKwQWPdjuL7WVLSi+54s35LSxTSGZnrUyeH6OcvKX3CaHkkvXWhkE49iiOhGNhGG4o+Pv2RwLWCZRCpWq6EX+YXJ4uZKRBRZP4wzdhjHYX9uRo2Ncdd0Wko/OPQ0wTWumxOwVEFdwxvz+sOOTZ5HyZBm3Xy55GLtWCb/XcBxuTJXH4HL/LHlby7CvCdarbwUe3sUnTCQ1k0uhSuStdyS/hB33+jZ+fhJw4xbaF7iE3SxQCFU+xOTV9pPGfCCt8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6206.namprd11.prod.outlook.com (2603:10b6:208:3c6::8)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 07:30:25 +0000
Received: from MN0PR11MB6206.namprd11.prod.outlook.com
 ([fe80::d9d9:1535:1180:603a]) by MN0PR11MB6206.namprd11.prod.outlook.com
 ([fe80::d9d9:1535:1180:603a%2]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 07:30:25 +0000
Date: Mon, 31 Jul 2023 15:30:09 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Julia Lawall <julia.lawall@inria.fr>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH 4/7] sched/fair: Calculate the scan depth for idle
 balance based on system utilization (fwd)
Message-ID: <ZMdjAf8a+3bHjOhh@chenyu5-mobl2>
References: <fb27b69c-3321-64c1-48ee-55a83cca982@inria.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fb27b69c-3321-64c1-48ee-55a83cca982@inria.fr>
X-ClientProxiedBy: KL1PR01CA0130.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::22) To MN0PR11MB6206.namprd11.prod.outlook.com
 (2603:10b6:208:3c6::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6206:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e00d8f-6b6c-4d60-aaf7-08db91980186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZlHhIEsNB8DpmSgmN86ygjvhQRr7g/53rFC5/jxho7mTdaRBEql/sDtLV0lWuwQtzXViqc2+7pMA43LKfRD8h5RHdQvZfaNxL6mqR+K5zDJaDUBQ191ymJUP8IFYBNtU82okUD/Bbey3dgsCTjoU9tzexg7wRKgWExGbzTx7UgGqEXLtuVU90u3cKMgIccWj462n9qLTAdWFZKuGbNAheWl6SGqvJrPh4J+hgXOvb8c0CybpXdMXIRXS7cB7yLLQdA/RRW5RlsP2H2a22wdNzm01oJyxw/kNn4e7AtRvtvlk2Nz359Gjpi8VrcgTErfksH6T3k5v4azBj+8RVOQZ6BlKAhIlB1209nQjng2Yu9yxbdyBCFEtvsuOTB98DUyO2T0G2eU7LMbmzL1iZPWARtsv0MZ996hZD5owcgqszbDMS3+ScgwVG1IJIPWGY7lNl7pPOiz7ugZVC7YiIKRdt8669wce6/+pSdfGr4voclJQCgISxR2AlTtNtgOfucuHC/JkDHnc0BiAhFc+qdBqcAxgCqeV4myuchc3KOSrRr/V9jtMki80QbzzOO98HINfosb1v+DMG+fLZFSBtdoQdCtHDcUND6jr5xtxJEB7xuRM0giuIN53yZXRc8nIfId/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6206.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199021)(2906002)(5660300002)(8676002)(8936002)(316002)(4326008)(6916009)(66476007)(66556008)(66946007)(41300700001)(33716001)(53546011)(26005)(6506007)(186003)(82960400001)(38100700002)(83380400001)(9686003)(966005)(6486002)(6512007)(6666004)(478600001)(86362001)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gj+5cs6PiRJ7TGfCImsJodaL/JKwVnnQqgBoi2W3LWJ4zZqg+awhEO/6d4HZ?=
 =?us-ascii?Q?mHypnNm0CO4gly9kIfX5uFtYYz9MxLSPPtkxnD0cUXZ8pWxrjWCiAJadQff8?=
 =?us-ascii?Q?ikbtWI+JwmI/tGvncNOX2zaYSGvsjCHoXCOv785uauBP173Vma1Ha+KK6OK8?=
 =?us-ascii?Q?NOwU52qt9gtEMnlA+rNvlDCcwnJd7W6NnxY2ZR5Irlq6RsiBpC9S0Gi2pTaY?=
 =?us-ascii?Q?Cub3Xp3l7Q4atGgsVpHm9f1ykmAP7YvxSawwu8OS4ZpuMv9t4nHyH6rLgO8C?=
 =?us-ascii?Q?t4CVb3wmiwkfx6d/RY/+/2ZVN4tfu1H44aZN/lUsiMvvB8OoT30xlA7p9GxU?=
 =?us-ascii?Q?mlf7kBtTcpEdf8ADqAnLwM1XOss3/rPFMy2FjfkUCWvV7pMClyL7DhZ9lrvk?=
 =?us-ascii?Q?ZTrIbFtn9/9wWlGFa3gi+ieC0Tjovr7tCztWN5LMsjh2dk8uHtm8CKU9qYzJ?=
 =?us-ascii?Q?z/wqCYYJzA/R2/ND7asxvrc/LCUpecTptkHTRFcqJL1hA0qTEnpPhnalHUf3?=
 =?us-ascii?Q?azOerJWl4jgz8VzhSlaAWe36r82np2cvU1/T2gi7Z6yOwT4Dtk5Z7oXq5k7f?=
 =?us-ascii?Q?+biqp2qu0u9H8igbRJiKkfzAb7SmerEkv+pGzeBMJRypViaCMc0+cikPLrgo?=
 =?us-ascii?Q?1uN3h2KWE8q0JQrQ9GGIAeZpth9mdHFykPi3d4AkUIUe5LfR7n0XLuRixufm?=
 =?us-ascii?Q?fRwigjlXpSilEwjjkcG3SOHePdBFiWdBsA7HtQ/LkukorSjwXU3i0mW3xr+Z?=
 =?us-ascii?Q?HHIkqglLwzETD2pEQXv/eWNJ+MbzGm9ZTpQdwNQqfI6Uha6W5ImVw2qS9dak?=
 =?us-ascii?Q?VGMi9UsUQNapW/XyAPxW4k9K/UbzAyiMDujDfnvn45F8SWDx2RysoAffB4Sv?=
 =?us-ascii?Q?IBpw0Nb2e79ikX20exss6gctiS/S3wEt7pjT3TPpi+6Ln33q9Kyq2oLtLmT+?=
 =?us-ascii?Q?puJsslXwPl5wjA12pyTS3lPM+iWcEtHJ7MLrqkFt9TgmBF6dy6pSTrDLzRUS?=
 =?us-ascii?Q?SrMjTO/lir4lI7uvEasgLwV+8wWKRZH1RH/DlPbs2E0arXejWmC1JFu9aV+3?=
 =?us-ascii?Q?ISftzNTiDS+Mzu887ryQ/uiJsohJO+kNAszEn3WmZUxBLLVd2fkhvPXt8i6g?=
 =?us-ascii?Q?hR4VdL6Zw7K8JeIZtAduMzOJp2ZK3XP1RY5mGiqQx4nLT8OGH1lTgyy4tcF2?=
 =?us-ascii?Q?7Ztzme00cIkqrKm1aSyjcsO8KtCoxQ9dqBiRk0tMEKmTI9xkAMsEcTin5Fk+?=
 =?us-ascii?Q?MDGXpKcN7/3q1lSJirrRJWzPIigsT8M5w+i67uVf0GOanSWZ1IWthzsHkREg?=
 =?us-ascii?Q?FyTn6PPYgHeTm/4OiUYTOBE1juY6g8wH/Cp4u6znpAclXy9SoQcY2/qZDbRn?=
 =?us-ascii?Q?GwYSEZopTRS5m7WLzVf55DfyFKPyIqX0zlCHml/JmwqFiahNLEucuV56+eUY?=
 =?us-ascii?Q?UCWSXwVprC1AT49K7xzrx0Ally0ylI4aE+cMX30+pgsYsbmRNfXozPGYEUSa?=
 =?us-ascii?Q?k/fmJp5J6cl78ZrtKjZZoeHi3z+Q4qXiFpcfBRsD0hRyhwxLg+zYTY3a7c7f?=
 =?us-ascii?Q?ygJhnBidEP8u2MnaYIcRHhfw3o61vogR6ANGGlUh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e00d8f-6b6c-4d60-aaf7-08db91980186
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6206.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 07:30:25.1836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8WNfWIHttG6+RzMDC4zXTWasRn9MF93VH5Pg4Tszt5jtlBNdL/R+Ntfq+waRoEotLveJJNwhvUxuqcgQdpb+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
X-OriginatorOrg: intel.com

Hi Julia,

On 2023-07-31 at 09:15:27 +0200, Julia Lawall wrote:
> Please check on the types involved in the division on line 10303.
> 

Thanks for letting me know. I'll fix it in next version.

thanks,
Chenyu

> julia
> 
> ---------- Forwarded message ----------
> Date: Mon, 31 Jul 2023 05:16:58 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: Re: [RFC PATCH 4/7] sched/fair: Calculate the scan depth for idle
>     balance based on system utilization
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> In-Reply-To: <61e6fce60ca738215b6e5ad9033fb692c3a8fbb1.1690273854.git.yu.c.chen@intel.com>
> References: <61e6fce60ca738215b6e5ad9033fb692c3a8fbb1.1690273854.git.yu.c.chen@intel.com>
> TO: Chen Yu <yu.c.chen@intel.com>
> 
> Hi Chen,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on tip/sched/core]
> [also build test WARNING on linus/master v6.5-rc4]
> [cannot apply to next-20230728]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu/sched-topology-Assign-sd_share-for-all-non-NUMA-sched-domains/20230727-144634
> base:   tip/sched/core
> patch link:    https://lore.kernel.org/r/61e6fce60ca738215b6e5ad9033fb692c3a8fbb1.1690273854.git.yu.c.chen%40intel.com
> patch subject: [RFC PATCH 4/7] sched/fair: Calculate the scan depth for idle balance based on system utilization
> :::::: branch date: 4 days ago
> :::::: commit date: 4 days ago
> config: m68k-randconfig-r052-20230730 (https://download.01.org/0day-ci/archive/20230731/202307310545.yIIAUNvV-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310545.yIIAUNvV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202307310545.yIIAUNvV-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> kernel/sched/fair.c:10303:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> vim +10303 kernel/sched/fair.c
> 
> 68d8d6c49d1ef0 Chen Yu 2023-07-27  10279
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10280  static void update_ilb_group_scan(struct lb_env *env,
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10281  				  unsigned long sum_util,
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10282  				  struct sched_domain_shared *sd_share)
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10283  {
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10284  	u64 tmp, nr_scan;
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10285
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10286  	if (!sched_feat(ILB_UTIL))
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10287  		return;
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10288
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10289  	if (!sd_share)
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10290  		return;
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10291
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10292  	if (env->idle == CPU_NEWLY_IDLE)
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10293  		return;
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10294
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10295  	/*
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10296  	 * Limit the newidle balance scan depth based on overall system
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10297  	 * utilization:
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10298  	 * nr_groups_scan = nr_groups * (1 - util_ratio)
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10299  	 * and util_ratio = sum_util / (sd_weight * SCHED_CAPACITY_SCALE)
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10300  	 */
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10301  	nr_scan = env->sd->nr_groups * sum_util;
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10302  	tmp = env->sd->span_weight * SCHED_CAPACITY_SCALE;
> f3d2a482eb6ae1 Chen Yu 2023-07-27 @10303  	do_div(nr_scan, tmp);
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10304  	nr_scan = env->sd->nr_groups - nr_scan;
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10305  	if ((int)nr_scan != sd_share->nr_sg_scan)
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10306  		WRITE_ONCE(sd_share->nr_sg_scan, (int)nr_scan);
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10307  }
> f3d2a482eb6ae1 Chen Yu 2023-07-27  10308
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
