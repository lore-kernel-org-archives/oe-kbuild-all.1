Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC56136B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 02:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675910780; x=1707446780;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UP3+qd1vLbZzVdt9eN4RHntJDZXIjMVA7UXKAT9Xp2g=;
  b=ltHiMd77y8UTt0oTGWN+bXdkDYK7PaH3sKSN5yEtlG1uPWpHm7frIeSQ
   aHYy3FpxUMuuY3ZCUje0j+DVpHbYH/TJjsz/3WJF5DXms6SqhvBnwOvWM
   PaPCLZGSXQKQ+stL7c41TBWOq2RQ4HhIMNgQhZOZw4X6iubhz27RmIEvj
   S81WUshqEMWkUBclpRIh0kUQgF2Yozp+xOpXOM6KcBuO4kS2smTinTusH
   ydU/T07b1kjDQ0S8MwYeEnVUDoBrgG0gLKjDeJvlywxx98ns/D0EQUE8s
   ilPeqt8SkWzj/DJmoDa90dAYDAraZIt2lJRHcKlmwmzVRvS+VxunBjML7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="394587357"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="394587357"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 18:46:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="645095400"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="645095400"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 18:46:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 18:46:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 8 Feb 2023 18:46:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 8 Feb 2023 18:46:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ0nkZjxXtIB23rX/lNSjeVeVoNdIafIuioqVWC2dycpZsgfk+VM3amXSZXeP4OSH+z0u1ZDfTTH984DKE5xDTI0Moe+4TdiOxcTttBiBmDRpjoAnefVqDl6B70zD6uAF7cUFXddisBFzrb5DYIa3F5j2PUXsf0rfJ6FiKjNbdrD9fO66lORSbYsUftEbTlO8gQ3hIXARd5G6rjsDtayn4/tpn901503NBfPHIeqFdjKjIJOaZpE3gEx9r/Bjw1+sBdlznzpb7ALPxldDGWLYaCzzhJ3y1xs2t7uev/Ug5W4BouEWElYa7SLmV/zsg4p+1zHmlF+p5c1aGWIYuWY5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2nRGhp79atLUj83aXdmuR8wPXBJnAMQDuvE1lgtCa8=;
 b=Tn2D7ISIuUAFn3i3pyQFVIoRCT+NnWYjD3Jw+ZxRA4fXzgBOg4N8t50BfvBMTc/MEtrtXrM5yfaGtuSd7kv/Cx2uajEa4P7ZdkFJR8j21LvmxNSF5cGZd3aHfO7MlVD/7tjrzEpSZ19qRDK3O6u1POAQbHwPZH7DDpSyx2gEj/KutCFd1caaEXwdImrMaH+k+DnVwV15DlDW4mW4HD/iGNnHJ9qp7SThVB/rZAcvRzWubQq7WDL+QYB8BXrG4RmPk3yBMwEqenHMGm/6miox1j/ZudkP+KuvKXRT7dgw2icSxbiw85Q+Hnd1R/PNzUpx/j69GXhG47HnKX6kQAvG1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by CH3PR11MB7841.namprd11.prod.outlook.com (2603:10b6:610:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Thu, 9 Feb
 2023 02:46:15 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::66b1:16ec:b971:890c]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::66b1:16ec:b971:890c%4]) with mapi id 15.20.6064.034; Thu, 9 Feb 2023
 02:46:15 +0000
Date: Thu, 9 Feb 2023 10:46:01 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Florian Westphal <fw@strlen.de>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC nf-next 3/3] bpf: minimal support for programs hooked into
 netfilter framework
Message-ID: <Y+ReaRQxUX3Iv4SU@rli9-mobl>
References: <20230208160307.27534-4-fw@strlen.de>
 <202302090245.nehZXsVh-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202302090245.nehZXsVh-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|CH3PR11MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 440c9732-9590-4cb1-90d9-08db0a47cfea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 55+i2p3u88PWLx5o5KkHmVaa2V2KIX40puzkH4hAG22qoEO2o+mVfxbbgXS+4582MYC5miG9HfZV3W2AZKui9l52uX7XRgX7CefYSCK7vIKsW3lDBKtXsPjcEw2elP17o3azOy1laWTSILPp6hUdXN5eztSEXX6DYN9s89s92A2H9TnAVBVcEF+5niozcbHQ3FjKqxCmPvKGnnivr6dFVJeyAoepwBDMNSr11E3j+uVxGEeBrvk16SxamG3Bma7xXPceBueHvNrfi3Wb4tYijWDHOxE6opWSZ3YArHg2QZ2NILS/Tzbjo1hCvHOyP8edoTdJhdBDQqPg1HFdNZQ6WrHPRWaIhCNbrhFkUzBRKatmZ0/ScMt1Y+1+lR2L+iIFF/IrptGVcLTDCBvJApvd8mbkijH6qRR7yVSSlAS6oJzvZivaeKbUQr0GM5WSp4F1x3oWSRrIgyVgs5pj3VomLBWsDT3Fxb+iJa7ygmrtA+xx65CZuC34MdGP7S90tsSq8Wfuqe/lAg0rHvy48tJng6lmG97nnJVZJ1Ez75lDxeWZj+X3lTSC7VLgs44RorOMUN6DCU0qHLs5UYXpSt2Fx/cPweL92f0qk6LPJtf4DsIANUbSj3YA3TZpTVGs52/gBcs3ljiXqNeSZA9ouGWor6dapwUlHLl+HWL2dNBzDfw9pDcFyi+GvlfaUcH2rr1g027aqJD6hoKBNB6vlWDcBgehtXakkBDxTnZaVmlk1IT1hJ6unazeJWKzkrZo63Mg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199018)(6506007)(966005)(9686003)(478600001)(6486002)(186003)(6512007)(26005)(6666004)(6636002)(316002)(83380400001)(66476007)(66946007)(66556008)(82960400001)(38100700002)(8676002)(4326008)(2906002)(8936002)(41300700001)(44832011)(86362001)(5660300002)(33716001)(6862004)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U92lXRG47tdjy5YzOZboJKnUaCAAmoHHVmrQYP8dcANuXe9610zzpoQ3xJ15?=
 =?us-ascii?Q?hPYGiZndRWC001K1C5nI/cPuXussdc9c8uuEfREbt43MvgLsRaV4kAtBr1q8?=
 =?us-ascii?Q?oc8wVUvugVj6iUjb6t5fUEaGBGzBMv+S3Ae5svQ/fHEu5Jdyat5Im4upBiZQ?=
 =?us-ascii?Q?rIVe7dC4S+xZ+3UvrMUuZN0DFpEWA3Vh3X5/8kdgX4nY+rD9OseuIIaJscpG?=
 =?us-ascii?Q?HrIfhhTOihQgmJdWLDoLyjQ0c0zbM8gdGZd0wdNiKyp+Bim/VeoInK2JmO6g?=
 =?us-ascii?Q?UiSrHvgTem7/w7eoXu+6qt+pIy7HhNa4mpKnrmSx5oOsFkilAPPIsubQEEIq?=
 =?us-ascii?Q?MzuLHbhkBKpql5FKyKtivLHrr5YQ55ZkyhhNyTz+mmJUhxkyD9DaazsAfP1r?=
 =?us-ascii?Q?xk/amRrogd+8sXSBDyK9MXgEttpIzrcufrXV1dIlR/AuDysk4sDwL2a6146y?=
 =?us-ascii?Q?Y+LcNormeJAJYAG2ztHj9iGYLTzkLyUW8xOycP47ptafmg5Dd+m+IdmAv+HD?=
 =?us-ascii?Q?VojuSPGpFDNVEuIhalphF9QcioFtwJOPty+ndcUt1Vy2J+s/8VQpA/ia0jpx?=
 =?us-ascii?Q?Oj99vyEwLg9JGkjeo+91cGX0gENgS1AHwcg4zvb5BVVvUI3j98T2tlp4xNy/?=
 =?us-ascii?Q?kPGoNvRAMBj8U+CHQmbNK4GXASPoehO/0IfILjT1N8KOWTjYUrSF2q6UafLK?=
 =?us-ascii?Q?aJGihszgBqKk/XnOWfvhz8R6xghcxbick55Vbb9llQxsIF44QopyuH69Z5aO?=
 =?us-ascii?Q?AeBXSUgpHWao57UXAOfXXRNeSSfnP4RjFox0GuVLVY92Em9aCoQ+BRBSIehc?=
 =?us-ascii?Q?EQva41vK63Q9+B4j+9/O+BjJhQqIFozJJZqmQ/ivCnXN0itdKJnmGltJBHtd?=
 =?us-ascii?Q?IfQ03FCTLQVUb10cRw+f6WK4OJ5pEnBWF0TG4Hjhsn4z7hy/isx4+EfjA8qs?=
 =?us-ascii?Q?RXJbbXqlP28C4DbWU9X0k7gbUFY+aFQl5uuZNfhh10ss5kTyKU2CrS4Hm0g7?=
 =?us-ascii?Q?ftPFIfq/gN6M8f4NGBGcWIOrbcxAcgDi7VeLP19/C1oqzrPObmlM1ZTQE2s3?=
 =?us-ascii?Q?/wy3vVWEuemuWp5nCpnkZo4s8o9a1aKqnEc2U9T61Vq5kUec4Pt/pYFFcNaS?=
 =?us-ascii?Q?FPK4ygoVP+HmcR/eBFILr68kClWVTUo2UyqiffpQY4qf2V7qcP4FeOlusvmY?=
 =?us-ascii?Q?VhDtCfNm4BJF/dBdHg9H0BEmrPk3knEu+csCOJj/k2CH1ZLW/ULCw4GS29QM?=
 =?us-ascii?Q?vgbVWIUqsnXekQ/hxcHdQW8hKNc/iZzzCRkpEKNXkTA2/7Wuk9T3NKJ0+wHu?=
 =?us-ascii?Q?2p0Pua8qCvOg4OzSPLHd3tLilgIkklDmUwdYsta/Ba2TflX8PD4XjRT75dzJ?=
 =?us-ascii?Q?G09RWaVEnSkWwAG3lPC34a+PA83l6uG+jJSBws495qj99NdXmeVjl7DWoeQF?=
 =?us-ascii?Q?hfbMVa4kcAjG32uAh9rXyA9c0TcS+M/J4py/ePrE1DbU/IUcoTXBcOjNPOc5?=
 =?us-ascii?Q?D9s71yjsQQXQ3+tAYDgPGCyYzqnXpjT5SNyNbeBV61LNI0sICCsrt6GL1eSs?=
 =?us-ascii?Q?DhnIPP1HOJHvOkbl1q/W6kW8HcmzRYsWPrZ8dQD+IfmYJvGNM3rKGrf7Tz8X?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 440c9732-9590-4cb1-90d9-08db0a47cfea
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 02:46:15.2925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24kmYGwDIvBIGsuR75oRcPYXPlf22/NoMizeB9Ip2IeTlkxYhnPqlZZlH7MPcuEdyoIjCcDq7FZN1EJ2J0XKXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7841
X-OriginatorOrg: intel.com

On Thu, Feb 09, 2023 at 03:11:55AM +0800, kernel test robot wrote:
> Hi Florian,
> 
> [FYI, it's a private test report for your RFC patch.]
> [auto build test WARNING on bpf-next/master]
> [also build test WARNING on linus/master v6.2-rc7 next-20230208]
> [cannot apply to nf-next/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Westphal/bpf-add-bpf_link-support-for-BPF_NETFILTER-programs/20230209-000601
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20230208160307.27534-4-fw%40strlen.de
> patch subject: [RFC nf-next 3/3] bpf: minimal support for programs hooked into netfilter framework
> config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230209/202302090245.nehZXsVh-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/594e7d0d1d1291101bd2250243e0be4e46e26985
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Florian-Westphal/bpf-add-bpf_link-support-for-BPF_NETFILTER-programs/20230209-000601
>         git checkout 594e7d0d1d1291101bd2250243e0be4e46e26985
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash net/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/20230208160307.27534-4-fw@strlen.de

Sorry that the link is wrong, it should be
	Link: https://lore.kernel.org/oe-kbuild-all/202302090245.nehZXsVh-lkp@intel.com/

> 
> All warnings (new ones prefixed by >>):
> 
> >> net/netfilter/nf_bpf_link.c:233:5: warning: no previous prototype for 'register_nf_hook_bpf' [-Wmissing-prototypes]
>      233 | int register_nf_hook_bpf(void)
>          |     ^~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/register_nf_hook_bpf +233 net/netfilter/nf_bpf_link.c
> 
>    232	
>  > 233	int register_nf_hook_bpf(void)
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
> 
