Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2742E8460
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 06:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdWGyz1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699080354; x=1730616354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Me29R1kluXeqIU1BJypSnqIInZmWBufe4R9k7SIB6Sg=;
  b=TdWGyz1DE0FOGNcI/AP+Us8Z5ANM6FDT/3WkQkTmJCI+YxbjQ4tqhu6J
   y5DJOrfEvxsQ8pRfnm9ZAYh5Ugo/dI4bD8poCeO6QXzC4OXtNnekjAizO
   e01fZjagScasEtBibAnz0nWIwJ8v2wgzBRuWDMySvJ4m+ztaVUmUBVjjS
   rCU0EMTEQflAkz4ZKorqgFsALdndfFxzsCMm5QnCQ/4O5qm5e9/Pe2qqT
   qM/EIxMJoBZ9/oQ6Hj5riWcXVFjngv4mI4fv4jyU+TojJD9dVKlyRvn6P
   GQiECoTT1Gu0ASQdykrhZ7nKcph2pFlXKRaYPGEfG5vYLdBBopdcAV6zL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388890170"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="388890170"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 23:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="761826597"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="761826597"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Nov 2023 23:45:52 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzAPl-0003ZT-2S;
	Sat, 04 Nov 2023 06:45:49 +0000
Date: Sat, 4 Nov 2023 14:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.mount 5/7] include/linux/syscalls.h:246:18: error:
 conflicting types for 'sys_listmount'
Message-ID: <202311041413.3qQbgHTL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mount
head:   9b8879c4124d7313b6ca2301d44be30e71c6dd2e
commit: 4412ca803757b94873a2298c7b14ed750230ec9b [5/7] add listmount(2) syscall
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231104/202311041413.3qQbgHTL-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041413.3qQbgHTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041413.3qQbgHTL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/namespace.c:11:0:
   include/linux/syscalls.h:416:44: warning: 'struct __mount_arg' declared inside parameter list will not be visible outside of this definition or declaration
    asmlinkage long sys_listmount(const struct __mount_arg __user *req,
                                               ^~~~~~~~~~~
>> include/linux/syscalls.h:246:18: error: conflicting types for 'sys_listmount'
     asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \
                     ^
   include/linux/syscalls.h:232:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:224:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/namespace.c:5017:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(listmount, const struct mnt_id_req __user *, req,
    ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:416:17: note: previous declaration of 'sys_listmount' was here
    asmlinkage long sys_listmount(const struct __mount_arg __user *req,
                    ^~~~~~~~~~~~~


vim +/sys_listmount +246 include/linux/syscalls.h

1bd21c6c21e8489 Dominik Brodowski   2018-04-05  235  
e145242ea0df6b7 Dominik Brodowski   2018-04-09  236  /*
e145242ea0df6b7 Dominik Brodowski   2018-04-09  237   * The asmlinkage stub is aliased to a function named __se_sys_*() which
e145242ea0df6b7 Dominik Brodowski   2018-04-09  238   * sign-extends 32-bit ints to longs whenever needed. The actual work is
e145242ea0df6b7 Dominik Brodowski   2018-04-09  239   * done within __do_sys_*().
e145242ea0df6b7 Dominik Brodowski   2018-04-09  240   */
1bd21c6c21e8489 Dominik Brodowski   2018-04-05  241  #ifndef __SYSCALL_DEFINEx
bed1ffca022cc87 Frederic Weisbecker 2009-03-13  242  #define __SYSCALL_DEFINEx(x, name, ...)					\
bee20031772af3d Arnd Bergmann       2018-06-19  243  	__diag_push();							\
bee20031772af3d Arnd Bergmann       2018-06-19  244  	__diag_ignore(GCC, 8, "-Wattribute-alias",			\
bee20031772af3d Arnd Bergmann       2018-06-19  245  		      "Type aliasing is used to sanitize syscall arguments");\
83460ec8dcac141 Andi Kleen          2013-11-12 @246  	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))	\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  247  		__attribute__((alias(__stringify(__se_sys##name))));	\
c9a211951c7c79c Howard McLauchlan   2018-03-21  248  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  249  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  250  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));	\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  251  	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
1a94bc34768e463 Heiko Carstens      2009-01-14  252  	{								\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  253  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
07fe6e00f6cca6f Al Viro             2013-01-21  254  		__MAP(x,__SC_TEST,__VA_ARGS__);				\
2cf0966683430b6 Al Viro             2013-01-21  255  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));	\
2cf0966683430b6 Al Viro             2013-01-21  256  		return ret;						\
1a94bc34768e463 Heiko Carstens      2009-01-14  257  	}								\
bee20031772af3d Arnd Bergmann       2018-06-19  258  	__diag_pop();							\
e145242ea0df6b7 Dominik Brodowski   2018-04-09  259  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
1bd21c6c21e8489 Dominik Brodowski   2018-04-05  260  #endif /* __SYSCALL_DEFINEx */
1a94bc34768e463 Heiko Carstens      2009-01-14  261  

:::::: The code at line 246 was first introduced by commit
:::::: 83460ec8dcac14142e7860a01fa59c267ac4657c syscalls.h: use gcc alias instead of assembler aliases for syscalls

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
