Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D628827
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682631029; x=1714167029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VLC2gKqTZ3TB+TL7hFbHzzoiWb5pwZ7e9/sJimqlYFc=;
  b=dJD4DnOPANeeNdDjekZjbnyw4QO5+MbsMkR9TcWlzEb2b/9cwLGOkKEb
   9MAmVIpH/+nDjK+sfkUGaVsEhZXkxnhd3JRIq+AYgxQDPvymNeTvGJJ4g
   gV3AIV3was/hAyKRo6alFpTfuAZnCiTCxNtx1F5Z5wOub6LLexMFYSfFa
   8tjYHn+fpAdYS7d+mPHPTlzksszLYuAtoliSLjQCC7YdgmgT4fwdo5j9R
   tRnoagMkryJCy/oPLQ5MQWv0zZXrh3uo/8sut8/ALTFW34Ar2JJDs3Gyj
   eDsTUVcf6CF52B0g6NlUaeeQUu43Skwz8D0oTr4iOZTtPzoj1bc7c1Ob8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="412934151"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="412934151"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 14:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727285720"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="727285720"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2023 14:30:27 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps9C6-00008L-2J;
	Thu, 27 Apr 2023 21:30:26 +0000
Date: Fri, 28 Apr 2023 05:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next/mm V2 1/2] page_pool: Remove workqueue in
 new shutdown scheme
Message-ID: <202304280541.EISCnBZz-lkp@intel.com>
References: <168262351129.2036355.1136491155595493268.stgit@firesoul>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168262351129.2036355.1136491155595493268.stgit@firesoul>

Hi Jesper,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on horms-ipvs/master linus/master v6.3 next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesper-Dangaard-Brouer/page_pool-Remove-workqueue-in-new-shutdown-scheme/20230428-032759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/168262351129.2036355.1136491155595493268.stgit%40firesoul
patch subject: [PATCH RFC net-next/mm V2 1/2] page_pool: Remove workqueue in new shutdown scheme
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230428/202304280541.EISCnBZz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d6fe37a8a681d3f95c9ac342d182e6fbeba61b72
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jesper-Dangaard-Brouer/page_pool-Remove-workqueue-in-new-shutdown-scheme/20230428-032759
        git checkout d6fe37a8a681d3f95c9ac342d182e6fbeba61b72
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280541.EISCnBZz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/page_pool.c:448:14: warning: no previous prototype for 'pp_read_hold_cnt' [-Wmissing-prototypes]
     448 | noinline u32 pp_read_hold_cnt(struct page_pool *pool)
         |              ^~~~~~~~~~~~~~~~


vim +/pp_read_hold_cnt +448 net/core/page_pool.c

   446	
   447	/* Avoid inlining code to avoid speculative fetching cacheline */
 > 448	noinline u32 pp_read_hold_cnt(struct page_pool *pool)
   449	{
   450		return READ_ONCE(pool->pages_state_hold_cnt);
   451	}
   452	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
