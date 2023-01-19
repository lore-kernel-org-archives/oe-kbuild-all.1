Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ACA33FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674118638; x=1705654638;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=5teKAxvZvZC7w75pdGlK2L+DpUySiQSak7BOJJX77VQ=;
  b=mBBnkd/uVBH+7yPNsmqKWcsM8Ln5We307F/XCOpW8EVw88iipSE4XRLj
   007jcq216iVcLQNBICSP3ftTxOl2pQ3VHPnkCjyysqQzovJ1dAeTEdh2e
   cMUjQuSuP9pep0+EfN3SMom4mJVLUxow182jDefjxEwCMGt9POWzzqBRv
   OKTeHWVDJji/5jR4ctr1qvxPVVbeE1MRSNgklKbVw2yoctR1ejNBRhtUM
   YGDA2y5wkjyZ6zgDv9zbBsMAgwuSg7FRGXteMxCNZB57zl14ivMhSzzS9
   oiJpoC/41xZIHRNS6oXJwjVUJU6A/QB+iXW9UEdNk7IzXYDYwc9MTnGEQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308791292"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="308791292"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 00:56:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692337510"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="692337510"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2023 00:56:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 00:56:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 00:56:30 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 00:56:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTXJ9sqZuTJKHxc8ZRS5LczOuJXfrmPiCG6rBKQMNHMjBs/5lUqlV6Dv3bm6EVHJJUjjd3DnaBvZJyvu1vSHCJ9pPUByC7Nk3um2OSH3Iar7xjEFiM/VcBxlYNIVvTuvEYQ5GppnzlOhq1baI6XJYnGdUNfSq+Kr2+f3ySSr3vWIvgWmGdPKPj2L1F7wlKzldWMeVagNPQOjO0ZJT2TZQpaDP21LzKkorzSLJK/gFl3K6zDsFYEOpkEl4VBEiNCqJYLkT/joxSHtsByHrNKoYgW2TunmC30ECeCGHVkQocIgCOmjDoOYGY1uGsPlhjGVtBI+tZWJcQ2jB7hiK2HWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGfkEYWKBIcR1M142a2SvsYpSEjZOB51NDbSXeEoQ6Q=;
 b=jXv3ti7PJYDmCkBbu5p7V1EJ/h+yxsC4azUjpiFr/Ec63IjqdEg/6cPk8hwu7VMIslUFjOKmsleGfLJ23lMMOK9tSe3iowTUjazKJGDgzUCMUru5Gw4umdiIzYCORq/7nim82h7vxESbm7nEmyCgmd6/KlVY7FpqxUoR8XgkhWQwYmExpc9+77KYijSwsKGbwK6Nr2a/rtqxKt9ArhdMboEK0lD9wvcAFCrwUCdc2KpcCz8AkSve9rzi7HreYDDvIG0oI4UFi8Ewo461azfp5L7bdQwAQtueeNqvEWojnl79/V+7i6vGQG7lvvGO2xGwMjgUKGSuHsaL/da6EnPBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BY1PR11MB8077.namprd11.prod.outlook.com (2603:10b6:a03:527::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Thu, 19 Jan
 2023 08:56:27 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb%9]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 08:56:27 +0000
Date: Thu, 19 Jan 2023 16:54:34 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Jingbo Xu <jefflexu@linux.alibaba.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH 6/6] erofs: enable page cache sharing in fscache mode
Message-ID: <Y8kFSupdVIrhd1nA@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230106125330.55529-7-jefflexu@linux.alibaba.com>
X-ClientProxiedBy: SG2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:3:17::25) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|BY1PR11MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: fea24084-5c80-47b2-21e3-08daf9fb0cd2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ah2I00KiGOf1XRWwgBXfmRPlyM2XkyU9srGtH521vwtSMfgp5tlXJvq5wUzCDOtvpNgWIh3/viMQdKexmW3NBvt9jV0xy8OQzAOwDS2Afn7E9VL2FHA1Pd87WlWOc8YGe0NcyKsSwpZI6Ubu7l8ISgUKb2On3EahWO5vBOtHZQY4XHIGmW6Q6CZdNPWVXYeCO6Cjg22ntoqxtO1Bzf6pHQMrgK1g0d6/euD7T1piUMSYA8S66QeqHcys13t26s4BNx/2c9EPnT392mzN30kVCRxMpWN7Y5fyaHNV2clYFNHCMJN86crSCoSWgdJ4Pi4dbuUYBmqdB2wtVRN9E7CbZv5vDwCEXcd9HtKk+orpUs1sAwckPhi0SQOqN4dBlEYJPHWGvZid6T9Tymv3I3RoCk7+NvvcElg3AjJAEFzSxUoxaBB2U8gZsEBbICsCDqLAIdPu5UGEt1F4gGVYVp5U/7Ar0kjBhky9KjtRg8GPoZWaw6nG1Titm7AbT0sb6dK6zIIGo0s1ri9kMaty+sWZufR51f2Ez6Ctkv2RLGbRKwZJt5n1ZY+Yinn24aRCPoUp5wqXyEvbDmIEFkULpy8goPj9mrS1wpqRDEV2SJe/gj/+dCDt2je249lntPg2jIOtU1wHdyS6Fomvlg/lyW8/n72ELZlwXSmnYhUunop3Wl4xIImCmlbw7KZ6KNRXxVGUbUMD7Yqh5fdGlMhMg42QaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199015)(6512007)(9686003)(66476007)(66556008)(66946007)(186003)(26005)(4326008)(6916009)(8676002)(41300700001)(6666004)(478600001)(966005)(6486002)(316002)(6506007)(86362001)(33716001)(83380400001)(5660300002)(82960400001)(8936002)(38100700002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uNkll+/nrIHA73AIYkCoCK2KPIJL8WuOrFGbi1VPMp8T0lyrTcmFgpxkWSht?=
 =?us-ascii?Q?TGvyjhyKOIgF8ZTQNNcYvWEOvmhdAQQsaPYJYb7AG/1jrBaAftortAdbg0S5?=
 =?us-ascii?Q?QCpDMBZ1BnpbpyLzOJ0aC/buhznthINDl+FSwivz/JqzY8faoJ1VN3QbqwJ/?=
 =?us-ascii?Q?6IoXYQ5eHs/uUJ986qZzwr4Fu6eUrWvhEpTav6GxM6OLxyoSeA60whpAgW6c?=
 =?us-ascii?Q?hCkGZwlCaxxEv5yVJRpsEFlF3Cresd29x7ygirwQAZvtz7rXgOIF65xc8eY/?=
 =?us-ascii?Q?3NcOvkO7958V1of/JHYe9T9p6xKmsyiwb5a1WUhDsW1RmirSnS41jofXWTs4?=
 =?us-ascii?Q?uuQPXEXvOEB33eVYELlDdcK1o+Jk/GfyTVi2scNJROJ9uQTpBdpBYjRxLX5f?=
 =?us-ascii?Q?8bBNgyZxTU1Ao/Lq/tQ6RVYGR/rMcvCaMgVupNWYbbxM5ME13vJ2HaeVtnYI?=
 =?us-ascii?Q?4HyJsCuwhLcf8LVDc6/uVYIe6wBT8gUyQcC8aZRvrqKxWuJIXmIlZ66x4O1g?=
 =?us-ascii?Q?aeSd0p3B8M0Q2ad0CQ5VYJY2iZvH+bdQYp9I9VqSSFqEqasidVdJbHxR4WWR?=
 =?us-ascii?Q?HYuu/mL00+K5xq3uUKZTD1ESeGtQbkMWK1mD9+GzABoHFxDJcGhQatprVq6F?=
 =?us-ascii?Q?ldocRShQeZzZ81hBx72yXsisIFg0pbAJ9ZJ7k46zE0TI1fHjw5jNJTrFyRou?=
 =?us-ascii?Q?+yCks9ZezLrSl3/gT1JVQgUkqj70HmsiWN3gC/YSD8wJjIAh+omiadLAvb6J?=
 =?us-ascii?Q?KFvgRTzITYHJRvpT+meuMkQ5wWSgleYi59AMqFJX078d8gODe1n6WehYwi8Z?=
 =?us-ascii?Q?kna9oZAg53YbJ3F9V75ur8bso7bz3vCMtR9oFNhs+SkWaWPbHfDrC0THOIWc?=
 =?us-ascii?Q?dOpXohCvLDG+7svPc4+3Pr5g+gm7gpZPkBFH2xzpNAL4wlmt3RhfJTLoiYju?=
 =?us-ascii?Q?/ZNij3qCEYR1l5GrnZdVLX0yBlVpEKgHAxGZcXeZqIMysXVLXIABwTVbkERs?=
 =?us-ascii?Q?u9ZSvBHyogUy4wLizeGZBSAnWnTxelyF137KSIPYOu168sUeSOmcr4MTJn3U?=
 =?us-ascii?Q?22iZ2zzZ2CkKQgcViUsWJ58hnzvFcnYhlIoPnYK8+wyC1Dh1J7evdYru7i9y?=
 =?us-ascii?Q?efY6VI7RFitRlCJnjq7QLtRPVBfi9id9jEZMW0KUnH+XWCV+ftKu55JOq/zD?=
 =?us-ascii?Q?uhf7Xfom6V1Vq/B30Tb9UHzETuhxRTIgN2hmvuNfXhq6widU8OEx1tLoE6sS?=
 =?us-ascii?Q?WnVRlrKHDlPrZeKcfGFYYle1CdKKDmlV/NNv/cprNawLT8FRP6NfdvEgSjOm?=
 =?us-ascii?Q?9XVgkZydag3ipbIWTksCIW+g5RnqQInMHTvIj5gxAoTfwIxsWZIZSOsQ58H+?=
 =?us-ascii?Q?7YbSE6bj+NDWht8MA+71fev7wmtpemmmC/6syDu0FRwuMjkm0AMFWJPrwWam?=
 =?us-ascii?Q?Fkzp6y7EhMGnFsMru/H3PEAA895VcKDeQfGVRgFui/X7cutMkAN1r8DnSVT/?=
 =?us-ascii?Q?ACh3yV40sfg95JKtvMTZDA8KnCJE/N26vy7ZHOYGNP5VxPXtAc6p0F9rBd/L?=
 =?us-ascii?Q?q9yMg9UgQXMIsMeY1SMZeVmQFDZXW6Lgt+xKzY0s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fea24084-5c80-47b2-21e3-08daf9fb0cd2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 08:56:27.7312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3RBB/83tlCIod2E9cfzeXxlBc+yJpmi5VDCr6tZLbx7QkQ/u8f5rMWecHenlGdo+XrT/GFkWEIB7rPR2AVfazQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8077
X-OriginatorOrg: intel.com

Hi Jingbo,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.2-rc4 next-20230118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingbo-Xu/erofs-remove-unused-device-mapping-in-the-meta-routine/20230106-205600
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20230106125330.55529-7-jefflexu%40linux.alibaba.com
patch subject: [RFC PATCH 6/6] erofs: enable page cache sharing in fscache mode
config: i386-randconfig-a004-20220328 (https://download.01.org/0day-ci/archive/20230119/202301190654.hZ4dPPlb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/5c565bd6afacc699309e9fc20119d91501a5d3ae
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jingbo-Xu/erofs-remove-unused-device-mapping-in-the-meta-routine/20230106-205600
        git checkout 5c565bd6afacc699309e9fc20119d91501a5d3ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/ lib//

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/erofs/inode.c:244:13: warning: 'erofs_can_share_page_cache' defined but not used [-Wunused-function]
     244 | static bool erofs_can_share_page_cache(struct inode *inode)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


Please consider guarding the implementation of erofs_can_share_page_cache with CONFIG_EROFS_FS_ONDEMAND.


vim +/erofs_can_share_page_cache +244 fs/erofs/inode.c

431339ba90423a0 drivers/staging/erofs/inode.c Gao Xiang 2018-07-26  243  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06 @244  static bool erofs_can_share_page_cache(struct inode *inode)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  245  {
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  246  	struct erofs_inode *vi = EROFS_I(inode);
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  247  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  248  	/* enable page cache sharing only in share domain mode */
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  249  	if (!erofs_is_fscache_mode(inode->i_sb) ||
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  250  	    !EROFS_SB(inode->i_sb)->domain_id)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  251  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  252  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  253  	if (vi->datalayout != EROFS_INODE_CHUNK_BASED)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  254  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  255  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  256  	/* avoid crossing multi devicces/blobs */
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  257  	if (inode->i_size > 1UL << vi->chunkbits)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  258  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  259  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  260  	/* avoid data leakage in mmap routine */
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  261  	if (EROFS_BLKSIZ % PAGE_SIZE)
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  262  		return false;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  263  
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  264  	return true;
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  265  }
5c565bd6afacc69 fs/erofs/inode.c              Jingbo Xu 2023-01-06  266  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
