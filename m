Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20486DDC3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696323967; x=1727859967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GTX762O6BWkpD5Vd62Klk2SrONM6HOyGqcfe6GmREVc=;
  b=l0Q6uuMt7h4yNu96bpA0vjpwIlqnygyuRqYpfZh3EovtbTDb0+hce3M3
   XY01SuuwYvNpZpu/BVIcVyIUOs9I4RbEc7ZxpS9jkzFw1nTU9J5pFx7FA
   PM81fsnKug/LlD+0BIMRzliX3b9PGrOUfDXNXKQRyRkUStm/EyRrccwN/
   +cae0Xt6C1N3iOyVYBWSxwRH7JDqx68app8E6OAsua6Xe3gTsM3481dmI
   d0Eliiln7KnGG+XtVMI1MFtrbNEMfXUzXVzt6+X2tAQqwuMFhiZolCQTr
   41s84UEgZLFESthwl1nqLRQxHA1y4KhNOeBvoTP7TCPs2uwpyd+1oI2MO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367876618"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367876618"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816614080"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="816614080"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 03 Oct 2023 02:06:05 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnbLu-0006wu-2T;
	Tue, 03 Oct 2023 09:06:02 +0000
Date: Tue, 3 Oct 2023 17:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/4] mm/mempolicy: Implement set_mempolicy2 and
Message-ID: <202310031608.fouTeKWe-lkp@intel.com>
References: <20231003002156.740595-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003002156.740595-3-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-refactor-do_set_mempolicy-for-code-re-use/20231003-082354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231003002156.740595-3-gregory.price%40memverge.com
patch subject: [RFC PATCH v2 2/4] mm/mempolicy: Implement set_mempolicy2 and
config: sh-defconfig (https://download.01.org/0day-ci/archive/20231003/202310031608.fouTeKWe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031608.fouTeKWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031608.fouTeKWe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mempolicy.c:99:
>> include/linux/syscalls.h:244:25: error: conflicting types for 'sys_set_mempolicy2'; have 'long int(const struct mempolicy_args *, size_t)' {aka 'long int(const struct mempolicy_args *, unsigned int)'}
     244 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   mm/mempolicy.c:1683:1: note: in expansion of macro 'SYSCALL_DEFINE2'
    1683 | SYSCALL_DEFINE2(set_mempolicy2, const struct mempolicy_args __user *, args,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:818:17: note: previous declaration of 'sys_set_mempolicy2' with type 'long int(struct mempolicy_args *, size_t)' {aka 'long int(struct mempolicy_args *, unsigned int)'}
     818 | asmlinkage long sys_set_mempolicy2(struct mempolicy_args __user *args,
         |                 ^~~~~~~~~~~~~~~~~~


vim +244 include/linux/syscalls.h

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
