Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0974D2FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 21:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681940469; x=1713476469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JXZbBZQdGjx+OzUxDBbyrTX3lAsl6ieloeFFg6zL6e0=;
  b=OQkxdF75J2JMMDbrhqXQUnYJNkCstMob4nonHvFUdHhEzqS/6+wiPTqs
   O13C51KOOUMjBXJ+8XTiq4Rz5PoKZDmShD9yEw9jZJEy/L1v9oUt21ia2
   ZWpXjeFw1ZbVYDK+QN8478OMR41rKC4lB0oRT3NnXcv0kknG4D+OOjMj+
   URdVCmSgg1shY1OWNxZU9wc1BQ+2CboCdXKn/TMc1ViDUcrCQWkYc8Jdb
   YL9otuoRs2JouRi7d0qYbn8rnPF++aeNzDbfqqshlodLdd7cq4j2Oal6N
   VSRx8uPJrW5I2xg5r7robn6mTIO50bUG7RD02XcQNS7L1JZO4Hpl+xWT2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="408479362"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="408479362"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 14:41:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="669128213"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="669128213"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Apr 2023 14:41:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppFY0-000fDC-1L;
	Wed, 19 Apr 2023 21:41:04 +0000
Date: Thu, 20 Apr 2023 05:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 104/107] kernel/trace/trace.c:930:17:
 error: implicit declaration of function 'trace_array_puts'; did you mean
 'trace_array_put'?
Message-ID: <202304200553.GV9iErzR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   26a53fe91e5138d18c724c59835efc603d0213ec
commit: 1f3ddc8d1741b8fcc1a722a217946fcf13ff3946 [104/107] tracing: Have tracing_snapshot_instance_cond() write errors to the appropriate instance
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304200553.GV9iErzR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=1f3ddc8d1741b8fcc1a722a217946fcf13ff3946
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 1f3ddc8d1741b8fcc1a722a217946fcf13ff3946
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304200553.GV9iErzR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:100,
                    from include/linux/ring_buffer.h:5,
                    from kernel/trace/trace.c:15:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
   arch/parisc/include/asm/pgtable.h:91:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
   arch/parisc/include/asm/pgtable.h:91:23: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   In file included from kernel/trace/trace.h:93,
                    from kernel/trace/trace.c:49:
   kernel/trace/trace_entries.h: At top level:
   kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:72: note: macro "FTRACE_ENTRY" defined here
      72 | #define FTRACE_ENTRY(name, struct_name, id, tstruct, print, filter)     \
         | 
   kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
   kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   In file included from kernel/trace/trace.h:1945:
   kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:1933: note: macro "FTRACE_ENTRY" defined here
    1933 | #define FTRACE_ENTRY(call, struct_name, id, tstruct, print, filter)     \
         | 
   kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
   kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   kernel/trace/trace.c:924:6: warning: no previous prototype for 'tracing_snapshot_instance_cond' [-Wmissing-prototypes]
     924 | void tracing_snapshot_instance_cond(struct trace_array *tr, void *cond_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c: In function 'tracing_snapshot_instance_cond':
>> kernel/trace/trace.c:930:17: error: implicit declaration of function 'trace_array_puts'; did you mean 'trace_array_put'? [-Werror=implicit-function-declaration]
     930 |                 trace_array_puts(tr, "*** SNAPSHOT CALLED FROM NMI CONTEXT ***\n");
         |                 ^~~~~~~~~~~~~~~~
         |                 trace_array_put
   kernel/trace/trace.c: At top level:
   kernel/trace/trace.c:8437:21: warning: no previous prototype for 'trace_array_create' [-Wmissing-prototypes]
    8437 | struct trace_array *trace_array_create(const char *name)
         |                     ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8560:5: warning: no previous prototype for 'trace_array_destroy' [-Wmissing-prototypes]
    8560 | int trace_array_destroy(struct trace_array *this_tr)
         |     ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +930 kernel/trace/trace.c

   922	
   923	#ifdef CONFIG_TRACER_SNAPSHOT
   924	void tracing_snapshot_instance_cond(struct trace_array *tr, void *cond_data)
   925	{
   926		struct tracer *tracer = tr->current_trace;
   927		unsigned long flags;
   928	
   929		if (in_nmi()) {
 > 930			trace_array_puts(tr, "*** SNAPSHOT CALLED FROM NMI CONTEXT ***\n");
   931			trace_array_puts(tr, "*** snapshot is being ignored        ***\n");
   932			return;
   933		}
   934	
   935		if (!tr->allocated_snapshot) {
   936			trace_array_puts(tr, "*** SNAPSHOT NOT ALLOCATED ***\n");
   937			trace_array_puts(tr, "*** stopping trace here!   ***\n");
   938			tracer_tracing_off(tr);
   939			return;
   940		}
   941	
   942		/* Note, snapshot can not be used when the tracer uses it */
   943		if (tracer->use_max_tr) {
   944			trace_array_puts(tr, "*** LATENCY TRACER ACTIVE ***\n");
   945			trace_array_puts(tr, "*** Can not use snapshot (sorry) ***\n");
   946			return;
   947		}
   948	
   949		local_irq_save(flags);
   950		update_max_tr(tr, current, smp_processor_id(), cond_data);
   951		local_irq_restore(flags);
   952	}
   953	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
