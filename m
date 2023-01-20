Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DE120FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 12:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674218222; x=1705754222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HsyRF7SqKlJY0wwWJgd1qhKccWyr894bEAQhHPxFOpQ=;
  b=Oqnp806x1Lplz/a0kHnHXqLUEyEROU8dxSEYcjVA+EZPEbViVJcIOW5z
   cDlM2b2jz0yy9ZdAXRfoqa62D49OwCvmGOKqq9w1re3oF3BHLZSVqLWVZ
   0F6STL7n3qCn+ziZ6gaWIt8z8HnLeV0Nb0dn0zu8baPu2qYRj8ahmsABB
   oUvIfDJCJ9lyF+AnlhjsEMMli5Gt+Cg22nKIrRXaflCy86+uVTUc1G0g+
   4bnRAgw+QGdwWMH+7ctcLGwnPagqdk67CP6tCSZuLfYISsXY/l0FNEYDw
   fdhJOg4lxAhYTjCAWQtpu/I16ASup4RpwkkLk/Yq7UIRebHoyDl6pWO/w
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323260614"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="323260614"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 04:37:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834397442"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="834397442"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 04:37:00 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIqdf-0002YQ-2I;
	Fri, 20 Jan 2023 12:36:59 +0000
Date: Fri, 20 Jan 2023 20:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] kernel/locking: introduce stack_handle for tracing
 the callstack
Message-ID: <202301202044.BV8UDGp5-lkp@intel.com>
References: <1674204502-32123-1-git-send-email-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674204502-32123-1-git-send-email-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang",

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/locking/core]
[also build test WARNING on tip/master tip/auto-latest arm-perf/for-next/perf linus/master v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/kernel-locking-introduce-stack_handle-for-tracing-the-callstack/20230120-165013
patch link:    https://lore.kernel.org/r/1674204502-32123-1-git-send-email-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH] kernel/locking: introduce stack_handle for tracing the callstack
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301202044.BV8UDGp5-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c9baeb14c923660caa4fc53f7b0c97c2473880b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhaoyang-huang/kernel-locking-introduce-stack_handle-for-tracing-the-callstack/20230120-165013
        git checkout 4c9baeb14c923660caa4fc53f7b0c97c2473880b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function '__rwsem_set_reader_owned':
   kernel/locking/rwsem.c:180:37: error: implicit declaration of function 'set_track_prepare' [-Werror=implicit-function-declaration]
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                                     ^~~~~~~~~~~~~~~~~
>> kernel/locking/rwsem.c:180:57: warning: pointer/integer type mismatch in conditional expression
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                                                         ^
>> kernel/locking/rwsem.c:180:27: warning: assignment to 'depot_stack_handle_t' {aka 'unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                           ^
   kernel/locking/rwsem.c: At top level:
   kernel/locking/rwsem.c:406:36: error: conflicting types for 'set_track_prepare'; have 'depot_stack_handle_t(void)' {aka 'unsigned int(void)'}
     406 | static inline depot_stack_handle_t set_track_prepare(void)
         |                                    ^~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:180:37: note: previous implicit declaration of 'set_track_prepare' with type 'int()'
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                                     ^~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c: In function 'set_track_prepare':
   kernel/locking/rwsem.c:413:24: error: implicit declaration of function 'stack_depot_save'; did you mean 'stack_trace_save'? [-Werror=implicit-function-declaration]
     413 |         trace_handle = stack_depot_save(entries, nr_entries, GFP_NOWAIT);
         |                        ^~~~~~~~~~~~~~~~
         |                        stack_trace_save
   cc1: some warnings being treated as errors


vim +180 kernel/locking/rwsem.c

   161	
   162	/*
   163	 * The task_struct pointer of the last owning reader will be left in
   164	 * the owner field.
   165	 *
   166	 * Note that the owner value just indicates the task has owned the rwsem
   167	 * previously, it may not be the real owner or one of the real owners
   168	 * anymore when that field is examined, so take it with a grain of salt.
   169	 *
   170	 * The reader non-spinnable bit is preserved.
   171	 */
   172	static inline void __rwsem_set_reader_owned(struct rw_semaphore *sem,
   173						    struct task_struct *owner)
   174	{
   175		unsigned long val = (unsigned long)owner | RWSEM_READER_OWNED |
   176			(atomic_long_read(&sem->owner) & RWSEM_NONSPINNABLE);
   177	
   178		atomic_long_set(&sem->owner, val);
   179	#ifdef CONFIG_TRACE_RWSEMS
 > 180		sem->trace_handle = owner ? set_track_prepare() : NULL;
   181	#endif
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
