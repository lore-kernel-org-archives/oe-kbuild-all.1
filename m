Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F8E171B7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g9dkjhIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699016639; x=1730552639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FsD06x5UCgk9ONSIWgTvy3xa5K8gC/T7Mnss80q+a8E=;
  b=g9dkjhIcV0o2/iKM+b6LfJtCKTiEkKwNIeW0vlhjTP/VAPmpISEVlpyw
   xOZuxsAE4eLyHmeD34Tr5HzjV/alCnhyMueHblXgjbSokP7UQTTWm4xZ/
   Aifzd3X30TGrHFfIywKG+KSQzLTg3HSRXyHKS52NEZSpXjMiGROQYuXrx
   4ZD7mv/8E3GBhWvffB0Fjo5+o2GJBbAUyvlCiDqeYuBIKpmZaCQ9G49OZ
   FW+aVytHtEZ+lX9mFeabrXOYqivOi7GTSw4q7UeH3sCT6HrDahx4m2GxB
   7eOqhlb9HSAj7y7woTlnKAFSyrCzP+yOdY8QVg34CypEbtMtjFImN9c/6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="373979186"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="373979186"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 06:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="9716938"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2023 06:03:38 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qytpo-0002Wa-2B;
	Fri, 03 Nov 2023 13:03:36 +0000
Date: Fri, 3 Nov 2023 21:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: greearb@candelatech.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH/RFC] debugobjects/slub:  Print slab info and backtrace.
Message-ID: <202311032039.FDBKxz0N-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on vbabka-slab/for-next]
[also build test WARNING on tip/core/debugobjects linus/master v6.6 next-20231103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/greearb-candelatech-com/debugobjects-slub-Print-slab-info-and-backtrace/20231103-093945
base:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-next
patch link:    https://lore.kernel.org/r/20231103013704.1232723-1-greearb%40candelatech.com
patch subject: [PATCH/RFC] debugobjects/slub:  Print slab info and backtrace.
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231103/202311032039.FDBKxz0N-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311032039.FDBKxz0N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311032039.FDBKxz0N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/debugobjects.c: In function 'set_track_prepare':
>> lib/debugobjects.c:245:1: warning: no return statement in function returning non-void [-Wreturn-type]
     245 | static depot_stack_handle_t set_track_prepare(void) { }
         | ^~~~~~
   lib/debugobjects.c: At top level:
   lib/debugobjects.c:245:29: warning: 'set_track_prepare' defined but not used [-Wunused-function]
     245 | static depot_stack_handle_t set_track_prepare(void) { }
         |                             ^~~~~~~~~~~~~~~~~


vim +245 lib/debugobjects.c

   242	
   243	#else
   244	static void debug_print_stack_info(struct debug_obj *object) { }
 > 245	static depot_stack_handle_t set_track_prepare(void) { }
   246	#endif
   247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
