Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD19186F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Nov 2022 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667571892; x=1699107892;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BI+qHhJP/gW9qiBzgNfJtgkLeFCCSz06cM+lJz/Bgbw=;
  b=SOeN9q0yQAhe1AF+uPsk20HZ1v3+UMfEWmox28bCm08BoTSGWciVeByZ
   i3aScwgEYlOU0/q0Sy/U/11491v5KM5fdHNvX+ez1LjKwJfnMItblTu07
   2KTe3Ed9KlJ+igAqZ5//0kDLhmSiGVYdMZljJDOpVDRGjjjuOzW1pkUWR
   gg3v1Q2jhqZ1XRS7LysMQi+wY9Ryzl3BcaVeS+crb53a/OVQ6K6OaoA92
   3w/4VGPC/9iaMLQMFzVQVmOJtCaFKl8qVUOyKK6ZZOfdfIKTLGzi306kI
   zGigeKs29ZWIYE3csc45TZOZTM8NBeEEn27R/GGnYsCNC9pqTG4rAz1St
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="309966778"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="309966778"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 07:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="666380263"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="666380263"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 04 Nov 2022 07:24:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 07:24:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 07:24:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 4 Nov 2022 07:24:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 4 Nov 2022 07:24:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWHsC+RQVJoiTQ3Z2W+9fCkaB2zlCiV7KPqj6T2PssK2px3hLsL8ruRqaBHXSaZgfiJ/2/ReEpMoVdJzguqakhbNZ+prrujpYpIQi4gx8vQEqc+dimqZpzc69m5id6+krMPZWugYNIiTbSQXk5faqDJXPZHreOCEypxK0f2VxB9Qem9MnhvlhJe+9Q+/jIDlbhrRXW6qAd+xXmhz5z9QjPcdyC8CfinU5oQOAzfvC6tCWNYDv7cDLizm33ATZX143pQZf2SU8L8jFsf0g+YKyhhYrSvuik1QWuznMzstlLWtbx6QyS2SLuhN+3xRsGhngz3BnvWhBwX5ADA+eSZHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ5hNBoUsziEiMyFupXhZwALzGQ6seNsPBb8ecxkL0E=;
 b=k0pcaPQX5mWUiKttrs4wqempIYEK7ZlyEZjBRa0eXDG0e/Zt8/HWCs7zC4Kc/2345iERvoTMGiWTCHy5FLvbAtbijfT1zH998ra7+eHBBd/cyaBnwQ1J6bTiYVgozXmoM+YP4NVieUkoXyUzcFlnI5Z7TyOF4eoPzIafvfVkiooabcIkAoo7djwP6qMwoD/H6uY6AP5/c9nZKpE8w+dZmNz4wnFbpBLLqSV7wUvFqnN5D2DFeKVjETCUoeq+wbDcs8eMtNs+5DZt/lkrXf7QfFPlxi5RIw9C0oqe7jYv14VD6fpO1+cnaH1pKE5gS3VbUVxt2ynthqefgd2XfkR4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by SA2PR11MB5209.namprd11.prod.outlook.com (2603:10b6:806:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 14:24:40 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::c00f:264f:c005:3a5b]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::c00f:264f:c005:3a5b%3]) with mapi id 15.20.5769.021; Fri, 4 Nov 2022
 14:24:40 +0000
Date: Fri, 4 Nov 2022 22:21:08 +0800
From: Feng Tang <feng.tang@intel.com>
To: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-mm@kvack.org>, Vlastimil Babka
	<vbabka@suse.cz>
Subject: Re: [vbabka-slab:slab/for-6.1-rc4/fixes 2/2] ERROR: modpost:
 "__kmem_cache_alloc_node" [arch/um/drivers/hostaudio.ko] undefined!
Message-ID: <Y2Uf1C6LuEwvPITh@feng-clx>
References: <202211042045.NO2o0j4e-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202211042045.NO2o0j4e-lkp@intel.com>
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To MN0PR11MB6304.namprd11.prod.outlook.com
 (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|SA2PR11MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: a10e3a96-a764-4a9f-95a0-08dabe704f5b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buEQp2BsS+Jx2ZYR0+8mDTi0dIBQf+cZuLX4bDcO8SEpcP8aXnTKnevWcMbLPeGztYUc+3IT0dCxarwh3rGuTRnLG1IBGFJbIRX9lpnzwAg4mEYqd/9chwVElSzIlFBfBC6pNusZnbpO4ul6CQ1hlZQAU8d6hTwN9z+DYC9/IEEGaOdgnDAnxwac1U7R36u7aPLtCbpuGwXooCjzEzeVDvsLB4w7mP8MBgDaGrYX0/VPbngDQ875cCkZt6PoKo3gbvoON5u8JPoFbRU+6MfZkjq9x1Jd/UW6/XZiA4qz3eGaEJOtMD6q2nCpm6UQDht4E6IeWWEcjiHdM7lmWywDLQeufziKl0xRWkW4AxalMILrINMUvKEqxt6mgQtY/Jk/CQRB4ckxK2AH+YMI0uKDsmhKqZ53RDWAgvbJtOx4sZizj44ZwSvy9A/lWGTiYRk4RyEXIXfc+HJT84yfdtB0UK8eJu6POFwQbd6miIbEe1G6gQX4Eke4/BpwOgOJqjNpUR7b564ItiuXn+ITc5VcbQbtgQMgbnW9aZSorAW6m7bl6IzOB3iLmPUn8YNsBrSSAO5MKOIl46ZhhVOCJJ/Tor4ylTotHBzEEIiQjW/dpuZDRG8G8JSz7SnxpC7oqXWVggno2Y0AsKG0NSvrEroTpmxJEjgaJIIHcL6ebtcWEJFlaw97oS6+4hFsesk+HjP3U7AKQ8oY7I7JaVV71O6hBRBY6LviQoCvuRktF+3rQjEtVb4LuwvMKqwQ3a5ZkXokwW2YT7wYJ0P7MoOrLCpFfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(83380400001)(316002)(6512007)(66946007)(26005)(44832011)(41300700001)(86362001)(38100700002)(2906002)(66556008)(66476007)(6862004)(8676002)(8936002)(33716001)(6506007)(4326008)(6486002)(186003)(6666004)(9686003)(6636002)(966005)(478600001)(5660300002)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4r6fWwdNOSeoftN8f3VLNaXFa0kGH9dd0TS6iT4aHaBp2adBnCG0ksb6x4nz?=
 =?us-ascii?Q?GK4OxY+cC47A8Jf/ErTNYY9iAs9khTht1z6l3hWghbMFI1LhtUmJw54w2bZW?=
 =?us-ascii?Q?u8l3aMLIuQoh0uFVvdgKYEvTuIItLQWwK5cOSSuwo0IcnZbty5MSQiXs1Sz6?=
 =?us-ascii?Q?Blbe2QuvLPBG9+PFY1KpTparkccZ9nZ3pXoiHfnqy5up05Q6nVkn7seHbGzq?=
 =?us-ascii?Q?r3Vayvtoap0MN+3PuK9AwbtzStcAxNXpxzmu4G0e04mucXORXJ/7E3WIXYRf?=
 =?us-ascii?Q?E/q6bq7rOxi4NGy+K02kJYl3zbcjLGFlZRJaMFFWKkXg+9wex4AldaC8ceRI?=
 =?us-ascii?Q?pndmo6G6N0YjJYbptYZY0PeCiarl/DGT+1A6bidzNmxaqzOU4fiTPsSksdi6?=
 =?us-ascii?Q?b3WXtKi9PoyAQiGtXhqKvg3JYWKtnnvlDXY+QisAItQHATPf1g5dSV7XIOc5?=
 =?us-ascii?Q?lpgkXnksDjExHQJDZgCo8CY0EeSgVpZ1cYPgffmfV5cWHBWEVU04NxZORO7R?=
 =?us-ascii?Q?aksSj+Guda1PkLm7Un56x9W3N7CZi/FYvM4WmTEx7vUYEV587I4+nrI5Vz7H?=
 =?us-ascii?Q?z7eYN2tBkRcHgc7BWVT1IAj6eRPISVXwadkIM8ws/Ko1nbds1H4/tUXAeazi?=
 =?us-ascii?Q?0HrUXf5lvppsGYcSOo83zc436o53N41zIMJBNEOGasU4HEJEIS2dpXv/Wp3M?=
 =?us-ascii?Q?OD/bIAUTYw02YvuBpZqTiqIpuoIWPLujp2kVpXRM8ykv2AvmG5cWp0rTsF7V?=
 =?us-ascii?Q?zd2hjG/7Jf9cTgauf4XnfUkcU9jkJE3UBzp2/X/ounQ3JuL9q1apSWMLv7ww?=
 =?us-ascii?Q?ZLGFnNrkapWGUj81m2Usid5BZKMKWYTL+0vRYTkDOUyMMd1Tk83LbNu85QsV?=
 =?us-ascii?Q?JCmkBmHxfLs1DrxNyCfOGne7CJXa8E6vF7Jy8ZG+pQTK+E02HmmDFWraxU58?=
 =?us-ascii?Q?kFVcbhmDutgXkPEl1HgOjrrwDzLSmHIxG4c7qdiWy4/e5a296uI+Nmu3f5Qg?=
 =?us-ascii?Q?PfwiI4yPma1xMUa0JloTTR2IZFpFOk2TBYILwRDmMHNKfM3BOrQkppRPGRlJ?=
 =?us-ascii?Q?KQ2+uNV8MCVvoGoqbDwgpvXe1OnBEOJysviXeyX9a0zmc3K06NMIwiIIgNKT?=
 =?us-ascii?Q?QQEs8AJlN0N7qc8OJuu5Mny4bmo8j/OaTv/tfYujejiDKUrvb9RBsh30nDc2?=
 =?us-ascii?Q?Hq3T0+KT37+uN6XlJY8v16+SX4HT+1U2NPqSUtPk635kNe5P2ThY7iakTJvD?=
 =?us-ascii?Q?M598C9GvR+lenvYMNldqQ6D1k0Fi8PkEiEvQgtRHc069vkAZmcejJkUbiS20?=
 =?us-ascii?Q?sSVSAF4g4sc2cKcE+KaopDvH41pJ/05mm2NRzZBCvfZy+Lv8okMYgPnOFAM6?=
 =?us-ascii?Q?k6pju4i3S1hUDL1CXprdt9jPbXZdrHtK44tUqRci6WSPdV9/foZgSF7Jc8Fi?=
 =?us-ascii?Q?jTNcwThHec+jBCmSAQ+dSIIZliZ2N+Btu0mShC6d5zqTHQM39DHMwpk3sc+j?=
 =?us-ascii?Q?YYL+IgeE3OKYytdf9OENGCI7r3wgFaGyBvBYKNRcNXAIYSNL86eribsIPDEd?=
 =?us-ascii?Q?FxsXxe/psUHD2oqVpcWUO0+RAfjkXvRpKF229F4+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a10e3a96-a764-4a9f-95a0-08dabe704f5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 14:24:40.7581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyMR7WoSNeSV5l7/6cX/hGSaIELb55eVuRlJEAVxwrgwHMJ8uLazpI1Bd0wDRRniW9l2EEzYviZ92Hp6B+Ltbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5209
X-OriginatorOrg: intel.com

On Fri, Nov 04, 2022 at 08:44:34PM +0800, kernel test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git slab/for-6.1-rc4/fixes
> head:   8a36db3f251813ecc2c1978a5853ab998f42734e
> commit: 8a36db3f251813ecc2c1978a5853ab998f42734e [2/2] mm/slub: Add missing orig_size parameter for wastage debug
> config: um-x86_64_defconfig
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/commit/?id=8a36db3f251813ecc2c1978a5853ab998f42734e
>         git remote add vbabka-slab git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
>         git fetch --no-tags vbabka-slab slab/for-6.1-rc4/fixes
>         git checkout 8a36db3f251813ecc2c1978a5853ab998f42734e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=um SUBARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "__kmem_cache_alloc_node" [arch/um/drivers/hostaudio.ko] undefined!
> >> ERROR: modpost: "__kmem_cache_alloc_node" [fs/isofs/isofs.ko] undefined!
> >> ERROR: modpost: "__kmem_cache_alloc_node" [fs/autofs/autofs4.ko] undefined!
> >> ERROR: modpost: "__kmem_cache_alloc_node" [block/bfq.ko] undefined!
> >> ERROR: modpost: "__kmem_cache_alloc_node" [drivers/block/loop.ko] undefined!
> >> ERROR: modpost: "__kmem_cache_alloc_node" [drivers/block/nbd.ko] undefined!
> >> ERROR: modpost: "__kmem_cache_alloc_node" [drivers/net/tun.ko] undefined!
> >> ERROR: modpost: "__kmem_cache_alloc_node" [drivers/net/ppp/ppp_generic.ko] undefined!
> >> ERROR: modpost: "__kmem_cache_alloc_node" [drivers/net/slip/slip.ko] undefined!
> >> ERROR: modpost: "__kmem_cache_alloc_node" [sound/soundcore.ko] undefined!

Thanks for the report! We also noticed the error in earlier thread
https://lore.kernel.org/lkml/Y2SMZ0%2F%2FdReS%2FNMV@feng-clx/

And this commit will be replaced by Vlastimil's new patch 
https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/commit/?h=slab/for-6.1-rc4/fixes

Thanks,
Feng

> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
