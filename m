Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E992452B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 04:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692849662; x=1724385662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UKROYECo5UmCglfBR3Ip8Kznqk46JzWECplsEFwZJGM=;
  b=JYUAdZQk+5wY0HC39yUUoH9YSIXEc0AN7M9pF0AvtCob9rfXkq8z6Y+z
   W79dOY4rD3DVJpvHnBdGM31NinrLzjywTes/DWnH6EGuuQTeFLaFmeD2Q
   vC0VqyeDVLq97d8Ahl+r/xkLJsOAfNeVgvTv8QROUkzJCRcHP0BJHYrWC
   fM/+/jT31M/86umDMXnbn7bDjiFtjH6Iqa6z3qI/rVn2mVGBJ6Whlguno
   QYNTcxOJH+l27/Bf6ZUKpshUrgMKxh0u9+dN1u83fJ96OqFK244Nc9aYh
   HmBrhXrAXIFzsWnftVm8ty9LSDFLdAGVp5+/6WUJXiMCo8xFMFzfRdCwv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="364508442"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="364508442"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 21:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="983547630"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="983547630"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 23 Aug 2023 21:00:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ1Wk-0001kC-0L;
	Thu, 24 Aug 2023 04:00:58 +0000
Date: Thu, 24 Aug 2023 12:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] mm: Add vmalloc_user_node()
Message-ID: <202308241135.xT3iALjI-lkp@intel.com>
References: <20230821202016.2910321-3-willy@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821202016.2910321-3-willy@infradead.org>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on acme/perf/core]
[also build test ERROR on tip/perf/core akpm-mm/mm-everything linus/master v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/perf-Convert-perf_mmap_-alloc-free-_page-to-folios/20230822-042131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git perf/core
patch link:    https://lore.kernel.org/r/20230821202016.2910321-3-willy%40infradead.org
patch subject: [RFC PATCH 2/4] mm: Add vmalloc_user_node()
config: arm-randconfig-001-20230824 (https://download.01.org/0day-ci/archive/20230824/202308241135.xT3iALjI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241135.xT3iALjI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241135.xT3iALjI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/nommu.c:184:7: error: conflicting types for 'vmalloc_user'; have 'void *(long unsigned int)'
     184 | void *vmalloc_user(unsigned long size)
         |       ^~~~~~~~~~~~
   In file included from include/asm-generic/io.h:994,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from mm/nommu.c:23:
   include/linux/vmalloc.h:171:21: note: previous definition of 'vmalloc_user' with type 'void *(size_t)' {aka 'void *(unsigned int)'}
     171 | static inline void *vmalloc_user(size_t size)
         |                     ^~~~~~~~~~~~


vim +184 mm/nommu.c

ed81745a4c9684 Andrii Nakryiko 2019-11-23  183  
ed81745a4c9684 Andrii Nakryiko 2019-11-23 @184  void *vmalloc_user(unsigned long size)
ed81745a4c9684 Andrii Nakryiko 2019-11-23  185  {
ed81745a4c9684 Andrii Nakryiko 2019-11-23  186  	return __vmalloc_user_flags(size, GFP_KERNEL | __GFP_ZERO);
ed81745a4c9684 Andrii Nakryiko 2019-11-23  187  }
f905bc447c303f Paul Mundt      2008-02-04  188  EXPORT_SYMBOL(vmalloc_user);
f905bc447c303f Paul Mundt      2008-02-04  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
