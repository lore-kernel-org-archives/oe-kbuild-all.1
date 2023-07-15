Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EEE7EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 01:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689384718; x=1720920718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bxOJ1aoxicvqTgtsDFdh4DRjYVhq42oPtmMKNaCElwE=;
  b=HK1zUNqC2QkmoL9sU46qgHC4fpU+GvmOmEOrH/rEuItdGjbdTJ0nZ4Bf
   xAckoiKwoj/Bn/ptPQqlZEzqR8eaYfoMWUG5ZJWiHWtE/A/OXfqs02qHw
   pRdDAaMq+QaxCcmqb8e6tA4GvMznalHVnaK6+j2iAHZWuDTvH4kSWCCjf
   uANNxDJkb2LBJ2nzsk/TP5iYPuCYeKMVl6/y6YrSUXHgkJ9HlTAfJVs6F
   v97CbJRZFnPE8BJXYfMLEOFg+OkG7dFYidDhtqL0oLtO4Zgzple6Ig0tX
   3ayH/06sIhDdkiQosjEr/nVZBfHrc0bdkhK2IYBd4Qb5G3zivj5TmIS0s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="431794540"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="431794540"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 18:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="788013170"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="788013170"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2023 18:31:47 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKU8Q-0007oT-37;
	Sat, 15 Jul 2023 01:31:46 +0000
Date: Sat, 15 Jul 2023 09:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2m 14/22] include/linux/compiler.h:215:60: error:
 initializer element is not constant
Message-ID: <202307150935.aQJzea99-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2m
head:   5500fe67fcd8b3d2924577403c7996cd47121074
commit: 521d3621f94878ff0c0245f66d4f9fcb83040386 [14/22] dyndbg: add for_each_boxed_vector
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230715/202307150935.aQJzea99-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150935.aQJzea99-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150935.aQJzea99-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_class_name':
   lib/dynamic_debug.c:1074:12: error: invalid storage class for function 'ddebug_proc_show'
    1074 | static int ddebug_proc_show(struct seq_file *m, void *p)
         |            ^~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1074:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1074 | static int ddebug_proc_show(struct seq_file *m, void *p)
         | ^~~~~~
   lib/dynamic_debug.c:1110:13: error: invalid storage class for function 'ddebug_proc_stop'
    1110 | static void ddebug_proc_stop(struct seq_file *m, void *p)
         |             ^~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1118:17: error: initializer element is not constant
    1118 |         .show = ddebug_proc_show,
         |                 ^~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1118:17: note: (near initialization for 'ddebug_proc_seqops.show')
   lib/dynamic_debug.c:1119:17: error: initializer element is not constant
    1119 |         .stop = ddebug_proc_stop
         |                 ^~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1119:17: note: (near initialization for 'ddebug_proc_seqops.stop')
   lib/dynamic_debug.c:1122:12: error: invalid storage class for function 'ddebug_proc_open'
    1122 | static int ddebug_proc_open(struct inode *inode, struct file *file)
         |            ^~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1130:17: error: initializer element is not constant
    1130 |         .open = ddebug_proc_open,
         |                 ^~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1130:17: note: (near initialization for 'ddebug_proc_fops.open')
   lib/dynamic_debug.c:1138:22: error: initializer element is not constant
    1138 |         .proc_open = ddebug_proc_open,
         |                      ^~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1138:22: note: (near initialization for 'proc_fops.proc_open')
   lib/dynamic_debug.c:1153:13: error: invalid storage class for function 'ddebug_sync_classbits'
    1153 | static void ddebug_sync_classbits(const struct ddebug_class_param *dcp, const char *modname)
         |             ^~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1165:13: error: invalid storage class for function 'ddebug_match_apply_kparam'
    1165 | static void ddebug_match_apply_kparam(const struct kernel_param *kp,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1183:13: error: invalid storage class for function 'ddebug_apply_params'
    1183 | static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *modnm)
         |             ^~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1207:13: error: invalid storage class for function 'ddebug_attach_module_classes'
    1207 | static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1237:13: error: invalid storage class for function 'ddebug_attach_client_module_classes'
    1237 | static void ddebug_attach_client_module_classes(struct ddebug_table *dt, const struct _ddebug_info *di)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1273:12: error: invalid storage class for function 'ddebug_add_module'
    1273 | static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
         |            ^~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1316:12: error: invalid storage class for function 'ddebug_dyndbg_param_cb'
    1316 | static int ddebug_dyndbg_param_cb(char *param, char *val,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1337:12: error: invalid storage class for function 'ddebug_dyndbg_boot_param_cb'
    1337 | static int ddebug_dyndbg_boot_param_cb(char *param, char *val,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1355:13: error: invalid storage class for function 'ddebug_table_free'
    1355 | static void ddebug_table_free(struct ddebug_table *dt)
         |             ^~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1367:12: error: invalid storage class for function 'ddebug_remove_module'
    1367 | static int ddebug_remove_module(const char *mod_name)
         |            ^~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1386:12: error: invalid storage class for function 'ddebug_module_notify'
    1386 | static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
         |            ^~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1407:26: error: initializer element is not constant
    1407 |         .notifier_call = ddebug_module_notify,
         |                          ^~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1407:26: note: (near initialization for 'ddebug_module_nb.notifier_call')
   lib/dynamic_debug.c:1413:13: error: invalid storage class for function 'ddebug_remove_all_tables'
    1413 | static void ddebug_remove_all_tables(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1427:19: error: invalid storage class for function 'dynamic_debug_init_control'
    1427 | static int __init dynamic_debug_init_control(void)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1450:19: error: invalid storage class for function 'dynamic_debug_init'
    1450 | static int __init dynamic_debug_init(void)
         |                   ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/export.h:33,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from lib/dynamic_debug.c:16:
>> include/linux/compiler.h:215:60: error: initializer element is not constant
     215 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                                                            ^
   include/linux/compiler.h:217:9: note: in expansion of macro '___ADDRESSABLE'
     217 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:239:9: note: in expansion of macro '__ADDRESSABLE'
     239 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:244:9: note: in expansion of macro '__define_initcall_stub'
     244 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:257:9: note: in expansion of macro '____define_initcall'
     257 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:263:9: note: in expansion of macro '__unique_initcall'
     263 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:265:35: note: in expansion of macro '___define_initcall'
     265 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:272:41: note: in expansion of macro '__define_initcall'
     272 | #define early_initcall(fn)              __define_initcall(fn, early)
         |                                         ^~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1536:1: note: in expansion of macro 'early_initcall'
    1536 | early_initcall(dynamic_debug_init);
         | ^~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21:
>> include/linux/build_bug.h:78:41: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/init.h:249:9: note: in expansion of macro 'static_assert'
     249 |         static_assert(__same_type(initcall_t, &fn));
         |         ^~~~~~~~~~~~~
   include/linux/init.h:257:9: note: in expansion of macro '____define_initcall'
     257 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:263:9: note: in expansion of macro '__unique_initcall'
     263 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:265:35: note: in expansion of macro '___define_initcall'
     265 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:272:41: note: in expansion of macro '__define_initcall'
     272 | #define early_initcall(fn)              __define_initcall(fn, early)
         |                                         ^~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1536:1: note: in expansion of macro 'early_initcall'
    1536 | early_initcall(dynamic_debug_init);
         | ^~~~~~~~~~~~~~
>> include/linux/compiler.h:215:60: error: initializer element is not constant
     215 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                                                            ^
   include/linux/compiler.h:217:9: note: in expansion of macro '___ADDRESSABLE'
     217 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:239:9: note: in expansion of macro '__ADDRESSABLE'
     239 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:244:9: note: in expansion of macro '__define_initcall_stub'
     244 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:257:9: note: in expansion of macro '____define_initcall'
     257 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:263:9: note: in expansion of macro '__unique_initcall'
     263 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:265:35: note: in expansion of macro '___define_initcall'
     265 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:291:41: note: in expansion of macro '__define_initcall'
     291 | #define fs_initcall(fn)                 __define_initcall(fn, 5)
         |                                         ^~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1539:1: note: in expansion of macro 'fs_initcall'
    1539 | fs_initcall(dynamic_debug_init_control);
         | ^~~~~~~~~~~
>> include/linux/compiler.h:214:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     214 |         static void * __used __attrs \
         |         ^~~~~~
   include/linux/compiler.h:217:9: note: in expansion of macro '___ADDRESSABLE'
     217 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:239:9: note: in expansion of macro '__ADDRESSABLE'
     239 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:244:9: note: in expansion of macro '__define_initcall_stub'
     244 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:257:9: note: in expansion of macro '____define_initcall'
     257 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:263:9: note: in expansion of macro '__unique_initcall'
     263 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:265:35: note: in expansion of macro '___define_initcall'
     265 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:291:41: note: in expansion of macro '__define_initcall'
     291 | #define fs_initcall(fn)                 __define_initcall(fn, 5)
         |                                         ^~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1539:1: note: in expansion of macro 'fs_initcall'
    1539 | fs_initcall(dynamic_debug_init_control);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/init.h:249:9: note: in expansion of macro 'static_assert'
     249 |         static_assert(__same_type(initcall_t, &fn));
         |         ^~~~~~~~~~~~~
   include/linux/init.h:257:9: note: in expansion of macro '____define_initcall'
     257 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:263:9: note: in expansion of macro '__unique_initcall'
     263 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:265:35: note: in expansion of macro '___define_initcall'
     265 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:291:41: note: in expansion of macro '__define_initcall'
     291 | #define fs_initcall(fn)                 __define_initcall(fn, 5)
         |                                         ^~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1539:1: note: in expansion of macro 'fs_initcall'
    1539 | fs_initcall(dynamic_debug_init_control);
         | ^~~~~~~~~~~
   lib/dynamic_debug.c:1539:1: error: expected declaration or statement at end of input
   lib/dynamic_debug.c: At top level:
   lib/dynamic_debug.c:1349:5: warning: 'ddebug_dyndbg_module_param_cb' defined but not used [-Wunused-function]
    1349 | int ddebug_dyndbg_module_param_cb(char *param, char *val, const char *module)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +215 include/linux/compiler.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  206  
7290d58095712a Ard Biesheuvel 2018-08-21  207  /*
7290d58095712a Ard Biesheuvel 2018-08-21  208   * Force the compiler to emit 'sym' as a symbol, so that we can reference
7290d58095712a Ard Biesheuvel 2018-08-21  209   * it from inline assembler. Necessary in case 'sym' could be inlined
7290d58095712a Ard Biesheuvel 2018-08-21  210   * otherwise, or eliminated entirely due to lack of references that are
7290d58095712a Ard Biesheuvel 2018-08-21  211   * visible to the compiler.
7290d58095712a Ard Biesheuvel 2018-08-21  212   */
92efda8eb15295 Sami Tolvanen  2022-09-08  213  #define ___ADDRESSABLE(sym, __attrs) \
92efda8eb15295 Sami Tolvanen  2022-09-08 @214  	static void * __used __attrs \
563a02b0c9704f Josh Poimboeuf 2020-08-18 @215  		__UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
92efda8eb15295 Sami Tolvanen  2022-09-08  216  #define __ADDRESSABLE(sym) \
92efda8eb15295 Sami Tolvanen  2022-09-08  217  	___ADDRESSABLE(sym, __section(".discard.addressable"))
7290d58095712a Ard Biesheuvel 2018-08-21  218  

:::::: The code at line 215 was first introduced by commit
:::::: 563a02b0c9704f69c0364befedd451f57fe88092 compiler.h: Make __ADDRESSABLE() symbol truly unique

:::::: TO: Josh Poimboeuf <jpoimboe@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
