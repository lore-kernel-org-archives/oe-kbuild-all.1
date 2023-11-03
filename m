Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916757E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G03BWPXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698997387; x=1730533387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PTYMmRf8wJpR+N+VQLB0G+axTAlUMD9GI/rG9ykRsBw=;
  b=G03BWPXMpGF1LPYuJ5f0SyR6LCP4bI+3nVOxfxentkIYeCsILveijfVD
   P4rkExR/UORoB2lS/VWpFtoZFqW5zExJwnJ6p4hDZP6CX7Jt5MWQqGunF
   JQsSokR6Mz4m5IYiW8r4yQdlDsVIkzuAz3SISjRRpW/s9zF7tjJaR7sJA
   kqKIZDsKT3nbc1Ugvr3Kyak04xmm+mpWtH8Y4LJ2hiXwH2JuvRIcrZrOp
   JokRDuZBTTbft8dmbrZpiQ1kLNXC86toPld7dXQUI5x2hetTAYwZlqCcU
   NCXY1K8WWGX9q8waKgMYGzycHwNzg/4zt/ThebPatK6R6xGfqPeMdLtNw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="392777058"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="392777058"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 00:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008734285"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1008734285"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Nov 2023 00:43:05 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyopb-0002LX-0V;
	Fri, 03 Nov 2023 07:43:03 +0000
Date: Fri, 3 Nov 2023 15:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: greearb@candelatech.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH/RFC] debugobjects/slub:  Print slab info and backtrace.
Message-ID: <202311031516.58fWVP0y-lkp@intel.com>
References: <20231103013704.1232723-1-greearb@candelatech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103013704.1232723-1-greearb@candelatech.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on vbabka-slab/for-next]
[also build test ERROR on tip/core/debugobjects linus/master v6.6 next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/greearb-candelatech-com/debugobjects-slub-Print-slab-info-and-backtrace/20231103-093945
base:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-next
patch link:    https://lore.kernel.org/r/20231103013704.1232723-1-greearb%40candelatech.com
patch subject: [PATCH/RFC] debugobjects/slub:  Print slab info and backtrace.
config: arc-randconfig-001-20231103 (https://download.01.org/0day-ci/archive/20231103/202311031516.58fWVP0y-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031516.58fWVP0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031516.58fWVP0y-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/debugobjects.c: In function 'set_track_prepare':
>> lib/debugobjects.c:237:22: error: implicit declaration of function 'stack_trace_save'; did you mean 'stack_depot_save'? [-Werror=implicit-function-declaration]
     237 |         nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 3);
         |                      ^~~~~~~~~~~~~~~~
         |                      stack_depot_save
   cc1: some warnings being treated as errors


vim +237 lib/debugobjects.c

   230	
   231	static noinline depot_stack_handle_t set_track_prepare(void)
   232	{
   233		depot_stack_handle_t trace_handle;
   234		unsigned long entries[DEBUG_OBJ_ADDRS_COUNT];
   235		unsigned int nr_entries;
   236	
 > 237		nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 3);
   238		trace_handle = stack_depot_save(entries, nr_entries, GFP_NOWAIT);
   239	
   240		return trace_handle;
   241	}
   242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
