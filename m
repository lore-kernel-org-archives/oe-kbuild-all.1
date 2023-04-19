Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AD333EC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681937430; x=1713473430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8N1CgxRtxVL6/R1ThpT6dYfdRwr5dHaJK4lmKsxOtn0=;
  b=TMK+Xa14N/t4Tp7MQ9YDeh/1B46qPqmu9vVcksAWXjgo3jyeDLs5/VjK
   QkNGfvncWg/zn+JrnmjqTx4EzV1NBabOseDRtsr1uz0ieMnxwYuV0MoIJ
   uW0HlQxr1Qjwk92IPVZscb6fND/LX1Er1dweYht0IwE4yKQCHuOIv/269
   1/eoV+eEfYyWXQCgR/ZVz7TmQQI9HH619zLXwhIdSabUFxI/YfQ84x2Ac
   2p6aXvjXp5TRT/WrDvpkAzEwWcxUm/UAne8D9WR4/DCrY+jFMqbOUTYT1
   8s7qzRkMhltKy8Zz72PADJk3meICY7B9lxGM3d2GWI7uhjUQHDzd6B4dj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325891033"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="325891033"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 13:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="865975494"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; 
   d="scan'208";a="865975494"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Apr 2023 13:50:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppEkd-000fBY-1g;
	Wed, 19 Apr 2023 20:50:03 +0000
Date: Thu, 20 Apr 2023 04:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 103/107]
 kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6
 arguments, but only 5 given
Message-ID: <202304200441.x7OGUJJ0-lkp@intel.com>
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
commit: 2d2bb2d557ed87977276fd2993fbb318d424c69a [103/107] tracing: Define new ftrace event "func_repeats"
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304200441.x7OGUJJ0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=2d2bb2d557ed87977276fd2993fbb318d424c69a
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 2d2bb2d557ed87977276fd2993fbb318d424c69a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304200441.x7OGUJJ0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/io.h:6,
                    from include/linux/clocksource.h:21,
                    from kernel/trace/trace.h:9,
                    from kernel/trace/trace_selftest_dynamic.c:3:
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
   In file included from kernel/trace/trace.h:93:
   kernel/trace/trace_entries.h: At top level:
>> kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:72: note: macro "FTRACE_ENTRY" defined here
      72 | #define FTRACE_ENTRY(name, struct_name, id, tstruct, print, filter)     \
         | 
>> kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
>> kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   In file included from kernel/trace/trace.h:1945:
>> kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:1933: note: macro "FTRACE_ENTRY" defined here
    1933 | #define FTRACE_ENTRY(call, struct_name, id, tstruct, print, filter)     \
         | 
>> kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
>> kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   cc1: some warnings being treated as errors
--
   In file included from arch/parisc/include/asm/io.h:6,
                    from include/linux/clocksource.h:21,
                    from kernel/trace/ftrace.c:18:
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
                    from kernel/trace/trace_output.h:6,
                    from kernel/trace/ftrace.c:45:
   kernel/trace/trace_entries.h: At top level:
>> kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:72: note: macro "FTRACE_ENTRY" defined here
      72 | #define FTRACE_ENTRY(name, struct_name, id, tstruct, print, filter)     \
         | 
>> kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
>> kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   In file included from kernel/trace/trace.h:1945:
>> kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:1933: note: macro "FTRACE_ENTRY" defined here
    1933 | #define FTRACE_ENTRY(call, struct_name, id, tstruct, print, filter)     \
         | 
>> kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
>> kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   kernel/trace/ftrace.c:308:5: warning: no previous prototype for '__register_ftrace_function' [-Wmissing-prototypes]
     308 | int __register_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:349:5: warning: no previous prototype for '__unregister_ftrace_function' [-Wmissing-prototypes]
     349 | int __unregister_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:588:5: warning: no previous prototype for 'ftrace_profile_pages_init' [-Wmissing-prototypes]
     588 | int ftrace_profile_pages_init(struct ftrace_profile_stat *stat)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:3709:15: warning: no previous prototype for 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
    3709 | char * __weak arch_ftrace_match_adjust(char *str, const char *search)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c: In function 'process_mod_list':
   kernel/trace/ftrace.c:4020:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    4020 |         int ret;
         |             ^~~
   kernel/trace/ftrace.c: In function 'ftrace_regex_release':
   kernel/trace/ftrace.c:5064:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    5064 |         int ret;
         |             ^~~
   cc1: some warnings being treated as errors
--
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
>> kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:72: note: macro "FTRACE_ENTRY" defined here
      72 | #define FTRACE_ENTRY(name, struct_name, id, tstruct, print, filter)     \
         | 
>> kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
>> kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   In file included from kernel/trace/trace.h:1945:
>> kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:1933: note: macro "FTRACE_ENTRY" defined here
    1933 | #define FTRACE_ENTRY(call, struct_name, id, tstruct, print, filter)     \
         | 
>> kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
>> kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   kernel/trace/trace.c:924:6: warning: no previous prototype for 'tracing_snapshot_instance_cond' [-Wmissing-prototypes]
     924 | void tracing_snapshot_instance_cond(struct trace_array *tr, void *cond_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8437:21: warning: no previous prototype for 'trace_array_create' [-Wmissing-prototypes]
    8437 | struct trace_array *trace_array_create(const char *name)
         |                     ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8560:5: warning: no previous prototype for 'trace_array_destroy' [-Wmissing-prototypes]
    8560 | int trace_array_destroy(struct trace_array *this_tr)
         |     ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/mm.h:100,
                    from include/linux/kallsyms.h:12,
                    from include/linux/ftrace.h:11,
                    from kernel/trace/trace_output.c:10:
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
                    from kernel/trace/trace_output.h:6,
                    from kernel/trace/trace_output.c:14:
   kernel/trace/trace_entries.h: At top level:
>> kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:72: note: macro "FTRACE_ENTRY" defined here
      72 | #define FTRACE_ENTRY(name, struct_name, id, tstruct, print, filter)     \
         | 
>> kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
>> kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   In file included from kernel/trace/trace.h:1945:
>> kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:1933: note: macro "FTRACE_ENTRY" defined here
    1933 | #define FTRACE_ENTRY(call, struct_name, id, tstruct, print, filter)     \
         | 
>> kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
>> kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   kernel/trace/trace_output.c: In function 'trace_output_raw':
   kernel/trace/trace_output.c:306:9: warning: function 'trace_output_raw' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     306 |         trace_seq_vprintf(s, fmt, ap);
         |         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_output.c: In function 'trace_func_repeats_raw':
>> kernel/trace/trace_output.c:1372:31: error: invalid use of undefined type 'struct func_repeats_entry'
    1372 |                          field->ip,
         |                               ^~
   kernel/trace/trace_output.c:1373:31: error: invalid use of undefined type 'struct func_repeats_entry'
    1373 |                          field->parent_ip,
         |                               ^~
   kernel/trace/trace_output.c:1374:31: error: invalid use of undefined type 'struct func_repeats_entry'
    1374 |                          field->count,
         |                               ^~
>> kernel/trace/trace_entries.h:371:23: error: invalid use of undefined type 'struct func_repeats_entry'
     371 |         (((u64)(entry)->top_delta_ts << 32) | (entry)->bottom_delta_ts) \
         |                       ^~
   kernel/trace/trace_output.c:1375:26: note: in expansion of macro 'FUNC_REPEATS_GET_DELTA_TS'
    1375 |                          FUNC_REPEATS_GET_DELTA_TS(field));
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_entries.h:371:54: error: invalid use of undefined type 'struct func_repeats_entry'
     371 |         (((u64)(entry)->top_delta_ts << 32) | (entry)->bottom_delta_ts) \
         |                                                      ^~
   kernel/trace/trace_output.c:1375:26: note: in expansion of macro 'FUNC_REPEATS_GET_DELTA_TS'
    1375 |                          FUNC_REPEATS_GET_DELTA_TS(field));
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_output.c: In function 'trace_func_repeats_print':
   kernel/trace/trace_output.c:1389:34: error: invalid use of undefined type 'struct func_repeats_entry'
    1389 |         seq_print_ip_sym(s, field->ip, flags);
         |                                  ^~
   kernel/trace/trace_output.c:1391:34: error: invalid use of undefined type 'struct func_repeats_entry'
    1391 |         seq_print_ip_sym(s, field->parent_ip, flags);
         |                                  ^~
   kernel/trace/trace_output.c:1392:61: error: invalid use of undefined type 'struct func_repeats_entry'
    1392 |         trace_seq_printf(s, " (repeats: %u, last_ts:", field->count);
         |                                                             ^~
>> kernel/trace/trace_entries.h:371:23: error: invalid use of undefined type 'struct func_repeats_entry'
     371 |         (((u64)(entry)->top_delta_ts << 32) | (entry)->bottom_delta_ts) \
         |                       ^~
   kernel/trace/trace_output.c:1394:37: note: in expansion of macro 'FUNC_REPEATS_GET_DELTA_TS'
    1394 |                          iter->ts - FUNC_REPEATS_GET_DELTA_TS(field));
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_entries.h:371:54: error: invalid use of undefined type 'struct func_repeats_entry'
     371 |         (((u64)(entry)->top_delta_ts << 32) | (entry)->bottom_delta_ts) \
         |                                                      ^~
   kernel/trace/trace_output.c:1394:37: note: in expansion of macro 'FUNC_REPEATS_GET_DELTA_TS'
    1394 |                          iter->ts - FUNC_REPEATS_GET_DELTA_TS(field));
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/parisc/include/asm/io.h:6,
                    from include/linux/clocksource.h:21,
                    from kernel/trace/trace.h:9,
                    from kernel/trace/tracing_map.c:21:
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
   In file included from kernel/trace/trace.h:93:
   kernel/trace/trace_entries.h: At top level:
>> kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:72: note: macro "FTRACE_ENTRY" defined here
      72 | #define FTRACE_ENTRY(name, struct_name, id, tstruct, print, filter)     \
         | 
>> kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
>> kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   In file included from kernel/trace/trace.h:1945:
>> kernel/trace/trace_entries.h:390:1: error: macro "FTRACE_ENTRY" requires 6 arguments, but only 5 given
     390 | );
         | ^
   kernel/trace/trace.h:1933: note: macro "FTRACE_ENTRY" defined here
    1933 | #define FTRACE_ENTRY(call, struct_name, id, tstruct, print, filter)     \
         | 
>> kernel/trace/trace_entries.h:373:1: warning: data definition has no type or storage class
     373 | FTRACE_ENTRY(func_repeats, func_repeats_entry,
         | ^~~~~~~~~~~~
>> kernel/trace/trace_entries.h:373:1: error: type defaults to 'int' in declaration of 'FTRACE_ENTRY' [-Werror=implicit-int]
   kernel/trace/tracing_map.c:287:6: warning: no previous prototype for 'tracing_map_array_clear' [-Wmissing-prototypes]
     287 | void tracing_map_array_clear(struct tracing_map_array *a)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/tracing_map.c:298:6: warning: no previous prototype for 'tracing_map_array_free' [-Wmissing-prototypes]
     298 | void tracing_map_array_free(struct tracing_map_array *a)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/tracing_map.c:321:27: warning: no previous prototype for 'tracing_map_array_alloc' [-Wmissing-prototypes]
     321 | struct tracing_map_array *tracing_map_array_alloc(unsigned int n_elts,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +/FTRACE_ENTRY +390 kernel/trace/trace_entries.h

   369	
   370	#define FUNC_REPEATS_GET_DELTA_TS(entry)				\
 > 371		(((u64)(entry)->top_delta_ts << 32) | (entry)->bottom_delta_ts)	\
   372	
 > 373	FTRACE_ENTRY(func_repeats, func_repeats_entry,
   374	
   375		TRACE_FUNC_REPEATS,
   376	
   377		F_STRUCT(
   378			__field(	unsigned long,	ip		)
   379			__field(	unsigned long,	parent_ip	)
   380			__field(	u16	,	count		)
   381			__field(	u16	,	top_delta_ts	)
   382			__field(	u32	,	bottom_delta_ts	)
   383		),
   384	
   385		F_printk(" %ps <-%ps\t(repeats:%u  delta: -%llu)",
   386			 (void *)__entry->ip,
   387			 (void *)__entry->parent_ip,
   388			 __entry->count,
   389			 FUNC_REPEATS_GET_DELTA_TS(__entry))
 > 390	);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
