Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A941839F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694645867; x=1726181867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mGu+6SGLu3cDH/AYs0TR6bH6F0/9OOjChs6jiW1wBWQ=;
  b=JFueXszfQO68yiXWt/nSfwXyGfNA32VXM0Dg62SkW0KIiSuKxawpaP2d
   uJPxaidtcOC7++K8Jua30XeE4hFWyiaeG5gptNCJc9ZZ3xZMXTq+58CCh
   8iC7xYDxrTgAw+PfTlLQNoht1kx+xbtIwk84r2awzZkG2CYrprtFza6MD
   6VrEV0C9QOBNo3zbaM3i9saQEycTHBEz4YEHCc/+ND09zF2FaQfVVzxGI
   BF6pTt6MFKEKJ3HRkGZJIkDEwnkJ9+ybP070emDw9ykSyrVG323Gol5/4
   B6Iu3W86aY3BCbRFN+kjme9RIAcvEIgSQ6SvB+iSokwkMnfssEN6YLfRf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442833243"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="442833243"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 15:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="868009019"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="868009019"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Sep 2023 15:57:44 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgYnm-0000mH-1g;
	Wed, 13 Sep 2023 22:57:42 +0000
Date: Thu, 14 Sep 2023 06:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] add statmnt(2) syscall
Message-ID: <202309140628.cbfucE4v-lkp@intel.com>
References: <20230913152238.905247-3-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913152238.905247-3-mszeredi@redhat.com>

Hi Miklos,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/asm]
[also build test ERROR on linux/master linus/master v6.6-rc1 next-20230913]
[cannot apply to arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miklos-Szeredi/add-unique-mount-ID/20230913-232732
base:   tip/x86/asm
patch link:    https://lore.kernel.org/r/20230913152238.905247-3-mszeredi%40redhat.com
patch subject: [RFC PATCH 2/3] add statmnt(2) syscall
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230914/202309140628.cbfucE4v-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140628.cbfucE4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140628.cbfucE4v-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/namespace.c:11:0:
   include/linux/syscalls.h:412:15: warning: 'struct statmnt' declared inside parameter list will not be visible outside of this definition or declaration
           struct statmnt __user *buf, size_t bufsize,
                  ^~~~~~~
>> fs/namespace.c:4690:18: warning: no previous declaration for 'lookup_mnt_in_ns' [-Wmissing-declarations]
    struct vfsmount *lookup_mnt_in_ns(u64 id, struct mnt_namespace *ns)
                     ^~~~~~~~~~~~~~~~
   fs/namespace.c:4750:10: error: unknown type name 'stmt_str_t'; did you mean 'stmt_func_t'?
             stmt_str_t *str)
             ^~~~~~~~~~
             stmt_func_t
   fs/namespace.c: In function 'do_statmnt':
   fs/namespace.c:4946:2: error: implicit declaration of function 'stmt_string'; did you mean 'stmt_string_seq'? [-Werror=implicit-function-declaration]
     stmt_string(s, STMT_MNT_ROOT, stmt_mnt_root, &sm->mnt_root);
     ^~~~~~~~~~~
     stmt_string_seq
   In file included from fs/namespace.c:11:0:
   fs/namespace.c: At top level:
>> include/linux/syscalls.h:244:18: error: conflicting types for 'sys_statmnt'
     asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
                     ^
   include/linux/syscalls.h:230:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:223:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:4960:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(statmnt, u64, mnt_id,
    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:411:17: note: previous declaration of 'sys_statmnt' was here
    asmlinkage long sys_statmnt(u64 mnt_id, u64 mask,
                    ^~~~~~~~~~~
   fs/namespace.c:4720:12: warning: 'stmt_string_seq' defined but not used [-Wunused-function]
    static int stmt_string_seq(struct stmt_state *s, stmt_func_t func)
               ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/sys_statmnt +244 include/linux/syscalls.h

1bd21c6c21e848 Dominik Brodowski   2018-04-05  233  
e145242ea0df6b Dominik Brodowski   2018-04-09  234  /*
e145242ea0df6b Dominik Brodowski   2018-04-09  235   * The asmlinkage stub is aliased to a function named __se_sys_*() which
e145242ea0df6b Dominik Brodowski   2018-04-09  236   * sign-extends 32-bit ints to longs whenever needed. The actual work is
e145242ea0df6b Dominik Brodowski   2018-04-09  237   * done within __do_sys_*().
e145242ea0df6b Dominik Brodowski   2018-04-09  238   */
1bd21c6c21e848 Dominik Brodowski   2018-04-05  239  #ifndef __SYSCALL_DEFINEx
bed1ffca022cc8 Frederic Weisbecker 2009-03-13  240  #define __SYSCALL_DEFINEx(x, name, ...)					\
bee20031772af3 Arnd Bergmann       2018-06-19  241  	__diag_push();							\
bee20031772af3 Arnd Bergmann       2018-06-19  242  	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
bee20031772af3 Arnd Bergmann       2018-06-19  243  		      "Type aliasing is used to sanitize syscall arguments");\
83460ec8dcac14 Andi Kleen          2013-11-12 @244  	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
e145242ea0df6b Dominik Brodowski   2018-04-09  245  		__attribute__((alias(__stringify(__se_sys##name))));	\
c9a211951c7c79 Howard McLauchlan   2018-03-21  246  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
e145242ea0df6b Dominik Brodowski   2018-04-09  247  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
e145242ea0df6b Dominik Brodowski   2018-04-09  248  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
e145242ea0df6b Dominik Brodowski   2018-04-09  249  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
1a94bc34768e46 Heiko Carstens      2009-01-14  250  	{								\
e145242ea0df6b Dominik Brodowski   2018-04-09  251  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
07fe6e00f6cca6 Al Viro             2013-01-21  252  		__MAP(x,__SC_TEST,__VA_ARGS__);				\
2cf0966683430b Al Viro             2013-01-21  253  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));	\
2cf0966683430b Al Viro             2013-01-21  254  		return ret;						\
1a94bc34768e46 Heiko Carstens      2009-01-14  255  	}								\
bee20031772af3 Arnd Bergmann       2018-06-19  256  	__diag_pop();							\
e145242ea0df6b Dominik Brodowski   2018-04-09  257  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
1bd21c6c21e848 Dominik Brodowski   2018-04-05  258  #endif /* __SYSCALL_DEFINEx */
1a94bc34768e46 Heiko Carstens      2009-01-14  259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
