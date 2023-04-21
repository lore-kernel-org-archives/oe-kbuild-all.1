Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FE83C05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682083579; x=1713619579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ruDau9ByHDupDkIsTuiDARbWHmhvm6jTe5oXnhGBFyA=;
  b=P6U+Dp1w/pRYmEj+Ked9zLtJxWV9PTJFEfEXAUROsFmL2u4W5pf412w5
   iWe8bzbQ139R/wviV5QmlRza5hl4wwVHpDDgzTknV5iCsYZcW26igOPms
   DsMfJu2RtmCX/xzKurFGFQxkzaJPLe0hT07ybHWZO7tiMRnFE3vfcLjxP
   6x8XvgY9K/eXYW0lV4StTbtmYlPlhCG9rlvgL6rXLK0kSuKTVB8xMg7sC
   bYhaasxCOhTaMkfOO4qMSz5U9RDyCzxUmttLVzARbvwurZk1A6yX9S9Ce
   VLrKzY5StT2eqco/ALcAz/Q0idgCeYtaECB7UKoqpHQu233TCH9mWX21v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325590634"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="325590634"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 06:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="761578193"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="761578193"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2023 06:26:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppqmE-000gc4-1V;
	Fri, 21 Apr 2023 13:26:14 +0000
Date: Fri, 21 Apr 2023 21:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Eric Dumazet <edumazet@google.com>,
	Waiman Long <longman@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v4 2/3] mm, page_owner: Add page_owner_stacks file to
 print out only stacks and their counte
Message-ID: <202304212153.jLLmROz6-lkp@intel.com>
References: <20230421101415.5734-3-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421101415.5734-3-osalvador@suse.de>

Hi Oscar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc7]
[cannot apply to akpm-mm/mm-everything next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/lib-stackdepot-Add-a-refcount-field-in-stack_record/20230421-181709
patch link:    https://lore.kernel.org/r/20230421101415.5734-3-osalvador%40suse.de
patch subject: [PATCH v4 2/3] mm, page_owner: Add page_owner_stacks file to print out only stacks and their counte
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230421/202304212153.jLLmROz6-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6c6dfc43015e1939f433f4371d33418ab4d03411
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oscar-Salvador/lib-stackdepot-Add-a-refcount-field-in-stack_record/20230421-181709
        git checkout 6c6dfc43015e1939f433f4371d33418ab4d03411
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash M=lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304212153.jLLmROz6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/page_ext.h:7,
                    from include/linux/mm.h:22,
                    from include/linux/mman.h:5,
                    from lib/test_user_copy.c:13:
>> include/linux/stackdepot.h:120:26: warning: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration
     120 | void *stack_start(struct seq_file *m, loff_t *ppos);
         |                          ^~~~~~~~
   include/linux/stackdepot.h:121:25: warning: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration
     121 | void *stack_next(struct seq_file *m, void *v, loff_t *ppos);
         |                         ^~~~~~~~
   include/linux/stackdepot.h:122:24: warning: 'struct seq_file' declared inside parameter list will not be visible outside of this definition or declaration
     122 | int stack_print(struct seq_file *m, void *v);
         |                        ^~~~~~~~


vim +120 include/linux/stackdepot.h

    99	
   100	/**
   101	 * stack_depot_save - Save a stack trace to stack depot
   102	 *
   103	 * @entries:		Pointer to the stack trace
   104	 * @nr_entries:		Number of frames in the stack
   105	 * @alloc_flags:	Allocation GFP flags
   106	 *
   107	 * Context: Contexts where allocations via alloc_pages() are allowed.
   108	 *          See __stack_depot_save() for more details.
   109	 *
   110	 * Return: Handle of the stack trace stored in depot, 0 on failure
   111	 */
   112	depot_stack_handle_t stack_depot_save(unsigned long *entries,
   113					      unsigned int nr_entries, gfp_t gfp_flags);
   114	depot_stack_handle_t stack_depot_save_action(unsigned long *entries,
   115						     unsigned int nr_entries,
   116						     gfp_t gfp_flags,
   117						     bool counter);
   118	
   119	#ifdef CONFIG_PAGE_OWNER
 > 120	void *stack_start(struct seq_file *m, loff_t *ppos);
   121	void *stack_next(struct seq_file *m, void *v, loff_t *ppos);
   122	int stack_print(struct seq_file *m, void *v);
   123	#endif
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
