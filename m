Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8811A23A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 06:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681106595; x=1712642595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYNlkVJbffviZ0FLLDP+kkit8wo2ZfNAek+mtZk23Ds=;
  b=iVwDIJ3SrX5awGGJ1qmulb5kaFvfr1MCEAF9yrT4iBe7wDutwhl/g77j
   +HV+2Yh6quCNckVw9sJ2MJOOU2MufTfQ/baneSWno84G6xtsjOcKVDb+p
   Opr8LqUnoAEDWUIEBxCG5pmdszEVODPqd27K7IQVZo7KgkvAS7QokQLC2
   eACht2Zh/7D8IJcnCc5Lo1xb84/C5u1GeQduzD1JBepTCminIrXJmHncU
   rXwKow6M2ceWNhXk1ZEHGFgimpkMhUATX5RP/QOuy3SKu7nKq6NZffFv1
   1wsYR9C30pcXnG9mIm0kkX4m63nPTCdH1HGcSPPlG0E+oMm0mRBQxxwjH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="429580768"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="429580768"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 23:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="1017883725"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="1017883725"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2023 23:03:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plkcS-000V8P-2k;
	Mon, 10 Apr 2023 06:03:12 +0000
Date: Mon, 10 Apr 2023 14:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/old/tree_nocb.vscode.index 2/2]
 include/linux/percpu-defs.h:91:33: error: static declaration of
 '__pcpu_scope_rcu_data' follows non-static declaration
Message-ID: <202304101347.bcrDtNDz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/old/tree_nocb.vscode.index
head:   06474d6fd35371bdcdf95ac2ec08500fd892333c
commit: 06474d6fd35371bdcdf95ac2ec08500fd892333c [2/2] kernel: rcu: Try to get vscode to index tree_nocb.h (half working)
config: sh-randconfig-r022-20230409 (https://download.01.org/0day-ci/archive/20230410/202304101347.bcrDtNDz-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=06474d6fd35371bdcdf95ac2ec08500fd892333c
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/old/tree_nocb.vscode.index
        git checkout 06474d6fd35371bdcdf95ac2ec08500fd892333c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101347.bcrDtNDz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from ./arch/sh/include/generated/asm/percpu.h:1,
                    from include/linux/irqflags.h:17,
                    from include/linux/spinlock.h:59,
                    from kernel/rcu/tree_includes.h:6,
                    from kernel/rcu/tree.c:20:
>> include/linux/percpu-defs.h:91:33: error: static declaration of '__pcpu_scope_rcu_data' follows non-static declaration
      91 |         __PCPU_DUMMY_ATTRS char __pcpu_scope_##name;                    \
         |                                 ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:143:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     143 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_SHARED_ALIGNED_SECTION) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:29:8: note: in expansion of macro 'DEFINE_PER_CPU_SHARED_ALIGNED'
      29 | static DEFINE_PER_CPU_SHARED_ALIGNED(struct rcu_data, rcu_data) = {
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:91:33: note: previous declaration of '__pcpu_scope_rcu_data' with type 'char'
      91 |         __PCPU_DUMMY_ATTRS char __pcpu_scope_##name;                    \
         |                                 ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:143:9: note: in expansion of macro 'DEFINE_PER_CPU_SECTION'
     143 |         DEFINE_PER_CPU_SECTION(type, name, PER_CPU_SHARED_ALIGNED_SECTION) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_includes.h:70:8: note: in expansion of macro 'DEFINE_PER_CPU_SHARED_ALIGNED'
      70 | extern DEFINE_PER_CPU_SHARED_ALIGNED(struct rcu_data, rcu_data);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:843:13: error: static declaration of 'trace_rcu_this_gp' follows non-static declaration
     843 | static void trace_rcu_this_gp(struct rcu_node *rnp, struct rcu_data *rdp,
         |             ^~~~~~~~~~~~~~~~~
   kernel/rcu/tree_includes.h:77:13: note: previous declaration of 'trace_rcu_this_gp' with type 'void(struct rcu_node *, struct rcu_data *, long unsigned int,  const char *)'
      77 | extern void trace_rcu_this_gp(struct rcu_node *rnp, struct rcu_data *rdp,
         |             ^~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:1070:13: error: static declaration of 'rcu_advance_cbs' follows non-static declaration
    1070 | static bool rcu_advance_cbs(struct rcu_node *rnp, struct rcu_data *rdp)
         |             ^~~~~~~~~~~~~~~
   kernel/rcu/tree_includes.h:62:13: note: previous declaration of 'rcu_advance_cbs' with type 'bool(struct rcu_node *, struct rcu_data *)' {aka '_Bool(struct rcu_node *, struct rcu_data *)'}
      62 | extern bool rcu_advance_cbs(struct rcu_node *rnp, struct rcu_data *rdp);
         |             ^~~~~~~~~~~~~~~
   kernel/rcu/tree.c:1093:28: error: static declaration of 'rcu_advance_cbs_nowake' follows non-static declaration
    1093 | static void __maybe_unused rcu_advance_cbs_nowake(struct rcu_node *rnp,
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_includes.h:60:28: note: previous declaration of 'rcu_advance_cbs_nowake' with type 'void(struct rcu_node *, struct rcu_data *)'
      60 | extern void __maybe_unused rcu_advance_cbs_nowake(struct rcu_node *rnp,
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:2000:13: error: static declaration of 'rcu_do_batch' follows non-static declaration
    2000 | static void rcu_do_batch(struct rcu_data *rdp)
         |             ^~~~~~~~~~~~
   kernel/rcu/tree_includes.h:66:13: note: previous declaration of 'rcu_do_batch' with type 'void(struct rcu_data *)'
      66 | extern void rcu_do_batch(struct rcu_data *rdp);
         |             ^~~~~~~~~~~~
   kernel/rcu/tree.c:2368:13: error: static declaration of 'invoke_rcu_core' follows non-static declaration
    2368 | static void invoke_rcu_core(void)
         |             ^~~~~~~~~~~~~~~
   kernel/rcu/tree_includes.h:68:13: note: previous declaration of 'invoke_rcu_core' with type 'void(void)'
      68 | extern void invoke_rcu_core(void);
         |             ^~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:4903:
   kernel/rcu/tree_plugin.h:17:13: error: redefinition of 'rcu_rdp_is_offloaded'
      17 | static bool rcu_rdp_is_offloaded(struct rcu_data *rdp)
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree_nocb.h:23,
                    from kernel/rcu/tree.c:4902:
   kernel/rcu/tree_plugin.h:17:13: note: previous definition of 'rcu_rdp_is_offloaded' with type 'bool(struct rcu_data *)' {aka '_Bool(struct rcu_data *)'}
      17 | static bool rcu_rdp_is_offloaded(struct rcu_data *rdp)
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:45:20: error: redefinition of 'rcu_bootup_announce_oddness'
      45 | static void __init rcu_bootup_announce_oddness(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:45:20: note: previous definition of 'rcu_bootup_announce_oddness' with type 'void(void)'
      45 | static void __init rcu_bootup_announce_oddness(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:819:6: error: redefinition of 'rcu_read_unlock_strict'
     819 | void rcu_read_unlock_strict(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:819:6: note: previous definition of 'rcu_read_unlock_strict' with type 'void(void)'
     819 | void rcu_read_unlock_strict(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:835:20: error: redefinition of 'rcu_bootup_announce'
     835 | static void __init rcu_bootup_announce(void)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:835:20: note: previous definition of 'rcu_bootup_announce' with type 'void(void)'
     835 | static void __init rcu_bootup_announce(void)
         |                    ^~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:847:13: error: redefinition of 'rcu_qs'
     847 | static void rcu_qs(void)
         |             ^~~~~~
   kernel/rcu/tree_plugin.h:847:13: note: previous definition of 'rcu_qs' with type 'void(void)'
     847 | static void rcu_qs(void)
         |             ^~~~~~
   kernel/rcu/tree_plugin.h:866:6: error: redefinition of 'rcu_all_qs'
     866 | void rcu_all_qs(void)
         |      ^~~~~~~~~~
   kernel/rcu/tree_plugin.h:866:6: note: previous definition of 'rcu_all_qs' with type 'void(void)'
     866 | void rcu_all_qs(void)
         |      ^~~~~~~~~~
   kernel/rcu/tree_plugin.h:892:6: error: redefinition of 'rcu_note_context_switch'
     892 | void rcu_note_context_switch(bool preempt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:892:6: note: previous definition of 'rcu_note_context_switch' with type 'void(bool)' {aka 'void(_Bool)'}
     892 | void rcu_note_context_switch(bool preempt)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:912:12: error: redefinition of 'rcu_preempt_blocked_readers_cgp'
     912 | static int rcu_preempt_blocked_readers_cgp(struct rcu_node *rnp)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:912:12: note: previous definition of 'rcu_preempt_blocked_readers_cgp' with type 'int(struct rcu_node *)'
     912 | static int rcu_preempt_blocked_readers_cgp(struct rcu_node *rnp)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree_plugin.h:920:13: error: redefinition of 'rcu_preempt_has_tasks'
     920 | static bool rcu_preempt_has_tasks(struct rcu_node *rnp)


vim +/__pcpu_scope_rcu_data +91 include/linux/percpu-defs.h

62fde54123fb64 Tejun Heo          2014-06-17   38  
5028eaa97dd1da David Howells      2009-04-21   39  /*
5028eaa97dd1da David Howells      2009-04-21   40   * Base implementations of per-CPU variable declarations and definitions, where
5028eaa97dd1da David Howells      2009-04-21   41   * the section in which the variable is to be placed is provided by the
7c756e6e19e71f Tejun Heo          2009-06-24   42   * 'sec' argument.  This may be used to affect the parameters governing the
5028eaa97dd1da David Howells      2009-04-21   43   * variable's storage.
5028eaa97dd1da David Howells      2009-04-21   44   *
5028eaa97dd1da David Howells      2009-04-21   45   * NOTE!  The sections for the DECLARE and for the DEFINE must match, lest
5028eaa97dd1da David Howells      2009-04-21   46   * linkage errors occur due the compiler generating the wrong code to access
5028eaa97dd1da David Howells      2009-04-21   47   * that section.
5028eaa97dd1da David Howells      2009-04-21   48   */
7c756e6e19e71f Tejun Heo          2009-06-24   49  #define __PCPU_ATTRS(sec)						\
e0fdb0e050eae3 Rusty Russell      2009-10-29   50  	__percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))	\
7c756e6e19e71f Tejun Heo          2009-06-24   51  	PER_CPU_ATTRIBUTES
7c756e6e19e71f Tejun Heo          2009-06-24   52  
7c756e6e19e71f Tejun Heo          2009-06-24   53  #define __PCPU_DUMMY_ATTRS						\
33def8498fdde1 Joe Perches        2020-10-21   54  	__section(".discard") __attribute__((unused))
7c756e6e19e71f Tejun Heo          2009-06-24   55  
7c756e6e19e71f Tejun Heo          2009-06-24   56  /*
7c756e6e19e71f Tejun Heo          2009-06-24   57   * s390 and alpha modules require percpu variables to be defined as
7c756e6e19e71f Tejun Heo          2009-06-24   58   * weak to force the compiler to generate GOT based external
7c756e6e19e71f Tejun Heo          2009-06-24   59   * references for them.  This is necessary because percpu sections
7c756e6e19e71f Tejun Heo          2009-06-24   60   * will be located outside of the usually addressable area.
7c756e6e19e71f Tejun Heo          2009-06-24   61   *
7c756e6e19e71f Tejun Heo          2009-06-24   62   * This definition puts the following two extra restrictions when
7c756e6e19e71f Tejun Heo          2009-06-24   63   * defining percpu variables.
7c756e6e19e71f Tejun Heo          2009-06-24   64   *
7c756e6e19e71f Tejun Heo          2009-06-24   65   * 1. The symbol must be globally unique, even the static ones.
7c756e6e19e71f Tejun Heo          2009-06-24   66   * 2. Static percpu variables cannot be defined inside a function.
7c756e6e19e71f Tejun Heo          2009-06-24   67   *
7c756e6e19e71f Tejun Heo          2009-06-24   68   * Archs which need weak percpu definitions should define
7c756e6e19e71f Tejun Heo          2009-06-24   69   * ARCH_NEEDS_WEAK_PER_CPU in asm/percpu.h when necessary.
7c756e6e19e71f Tejun Heo          2009-06-24   70   *
7c756e6e19e71f Tejun Heo          2009-06-24   71   * To ensure that the generic code observes the above two
7c756e6e19e71f Tejun Heo          2009-06-24   72   * restrictions, if CONFIG_DEBUG_FORCE_WEAK_PER_CPU is set weak
7c756e6e19e71f Tejun Heo          2009-06-24   73   * definition is used for all cases.
7c756e6e19e71f Tejun Heo          2009-06-24   74   */
7c756e6e19e71f Tejun Heo          2009-06-24   75  #if defined(ARCH_NEEDS_WEAK_PER_CPU) || defined(CONFIG_DEBUG_FORCE_WEAK_PER_CPU)
7c756e6e19e71f Tejun Heo          2009-06-24   76  /*
7c756e6e19e71f Tejun Heo          2009-06-24   77   * __pcpu_scope_* dummy variable is used to enforce scope.  It
7c756e6e19e71f Tejun Heo          2009-06-24   78   * receives the static modifier when it's used in front of
7c756e6e19e71f Tejun Heo          2009-06-24   79   * DEFINE_PER_CPU() and will trigger build failure if
7c756e6e19e71f Tejun Heo          2009-06-24   80   * DECLARE_PER_CPU() is used for the same variable.
7c756e6e19e71f Tejun Heo          2009-06-24   81   *
7c756e6e19e71f Tejun Heo          2009-06-24   82   * __pcpu_unique_* dummy variable is used to enforce symbol uniqueness
7c756e6e19e71f Tejun Heo          2009-06-24   83   * such that hidden weak symbol collision, which will cause unrelated
7c756e6e19e71f Tejun Heo          2009-06-24   84   * variables to share the same address, can be detected during build.
7c756e6e19e71f Tejun Heo          2009-06-24   85   */
7c756e6e19e71f Tejun Heo          2009-06-24   86  #define DECLARE_PER_CPU_SECTION(type, name, sec)			\
7c756e6e19e71f Tejun Heo          2009-06-24   87  	extern __PCPU_DUMMY_ATTRS char __pcpu_scope_##name;		\
dd17c8f72993f9 Rusty Russell      2009-10-29   88  	extern __PCPU_ATTRS(sec) __typeof__(type) name
7c756e6e19e71f Tejun Heo          2009-06-24   89  
7c756e6e19e71f Tejun Heo          2009-06-24   90  #define DEFINE_PER_CPU_SECTION(type, name, sec)				\
7c756e6e19e71f Tejun Heo          2009-06-24  @91  	__PCPU_DUMMY_ATTRS char __pcpu_scope_##name;			\
0f5e4816dbf38c Tejun Heo          2009-10-29   92  	extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;		\
7c756e6e19e71f Tejun Heo          2009-06-24   93  	__PCPU_DUMMY_ATTRS char __pcpu_unique_##name;			\
b1a0fbfdde65df Tejun Heo          2013-12-04   94  	extern __PCPU_ATTRS(sec) __typeof__(type) name;			\
69a60bc75fe735 Alexander Pateenok 2018-10-30   95  	__PCPU_ATTRS(sec) __weak __typeof__(type) name
7c756e6e19e71f Tejun Heo          2009-06-24   96  #else
7c756e6e19e71f Tejun Heo          2009-06-24   97  /*
7c756e6e19e71f Tejun Heo          2009-06-24   98   * Normal declaration and definition macros.
7c756e6e19e71f Tejun Heo          2009-06-24   99   */
7c756e6e19e71f Tejun Heo          2009-06-24  100  #define DECLARE_PER_CPU_SECTION(type, name, sec)			\
dd17c8f72993f9 Rusty Russell      2009-10-29  101  	extern __PCPU_ATTRS(sec) __typeof__(type) name
7c756e6e19e71f Tejun Heo          2009-06-24  102  

:::::: The code at line 91 was first introduced by commit
:::::: 7c756e6e19e71f0327760d8955f7077118ebb2b1 percpu: implement optional weak percpu definitions

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
