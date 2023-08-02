Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654CB7E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 01:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690940280; x=1722476280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VCGslsSPULYPaeYAnO1WZWV4roZZehZt8Gc3eG3KMVI=;
  b=PFZqvjiTpdOZu8PCju1Y+DA80VIQTc37KGgt8pIdtQ1Y6PjrJkldlh+x
   Vmo8+dR3JqreMR6BC6WQCtP2LTdcBeF0s2rDWN4KEwk/CSoss6ad5WCjf
   rL7XRh5r1ZZMJTvD7BePSWvQ+CEdXFvKHMmalz7GQrGYliqtDKEaSnVDZ
   EvGXwm7J/l0+U8d2Sd9HvYDIGShukVWf2YnSGbvkbDO/ymPumUKWHgUYf
   f4oFWLkTd7DzW4z76qg99JcorPc27uchmfs700AaSOEzp+10G5Cgj6XbS
   3yzBNcUIddbG5c9SGb6/LKCAfTHtVZfD0gOVuexv6mJHY48iIS6kl0mCG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="373095653"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="373095653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 18:37:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="902796224"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="902796224"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Aug 2023 18:37:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR0oG-0000kV-2F;
	Wed, 02 Aug 2023 01:37:56 +0000
Date: Wed, 2 Aug 2023 09:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Tobin C. Harding" <tobin@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.14.y 6518/9999] include/linux/export.h:67:20: error:
 redefinition of '__kstrtab_stpcpy'
Message-ID: <202308020906.VgNAO3eQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
commit: fe072e50be403fc52c426c15073b8c38ce301416 [6518/9999] lib/string: Add strscpy_pad() function
config: i386-randconfig-i061-20230730 (https://download.01.org/0day-ci/archive/20230802/202308020906.VgNAO3eQ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020906.VgNAO3eQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020906.VgNAO3eQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/string.c:140:8: sparse: sparse: multiple definitions for function 'strlcpy'
   lib/string.c: note: in included file:
   include/linux/string.h:317:25: sparse:  the previous one is here
   lib/string.c:312:6: sparse: sparse: multiple definitions for function 'stpcpy'
   lib/string.c:255:6: sparse:  the previous one is here
   lib/string.c:936:15: sparse: sparse: multiple definitions for function 'memcmp'
   include/linux/string.h:405:22: sparse:  the previous one is here
   lib/string.c:1087:6: sparse: sparse: multiple definitions for function 'memchr_inv'
   include/linux/string.h:431:23: sparse:  the previous one is here
   lib/string.c:318:1: sparse: sparse: symbol '__kstrtab_stpcpy' has multiple initializers (originally initialized at lib/string.c:261)
   lib/string.c:318:1: sparse: sparse: symbol '__ksymtab_stpcpy' has multiple initializers (originally initialized at lib/string.c:261)
   lib/string.c:312:7: error: redefinition of 'stpcpy'
    char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
          ^~~~~~
   lib/string.c:255:7: note: previous definition of 'stpcpy' was here
    char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
          ^~~~~~
   In file included from include/linux/linkage.h:7:0,
                    from include/linux/kernel.h:7,
                    from lib/string.c:26:
>> include/linux/export.h:67:20: error: redefinition of '__kstrtab_stpcpy'
     static const char __kstrtab_##sym[]    \
                       ^
   include/linux/export.h:100:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:104:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "")
     ^~~~~~~~~~~~~~~
   lib/string.c:318:1: note: in expansion of macro 'EXPORT_SYMBOL'
    EXPORT_SYMBOL(stpcpy);
    ^~~~~~~~~~~~~
   include/linux/export.h:67:20: note: previous definition of '__kstrtab_stpcpy' was here
     static const char __kstrtab_##sym[]    \
                       ^
   include/linux/export.h:100:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:104:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "")
     ^~~~~~~~~~~~~~~
   lib/string.c:261:1: note: in expansion of macro 'EXPORT_SYMBOL'
    EXPORT_SYMBOL(stpcpy);
    ^~~~~~~~~~~~~
   include/linux/export.h:70:36: error: redefinition of '__ksymtab_stpcpy'
     static const struct kernel_symbol __ksymtab_##sym  \
                                       ^
   include/linux/export.h:100:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:104:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "")
     ^~~~~~~~~~~~~~~
   lib/string.c:318:1: note: in expansion of macro 'EXPORT_SYMBOL'
    EXPORT_SYMBOL(stpcpy);
    ^~~~~~~~~~~~~
   include/linux/export.h:70:36: note: previous definition of '__ksymtab_stpcpy' was here
     static const struct kernel_symbol __ksymtab_##sym  \
                                       ^
   include/linux/export.h:100:25: note: in expansion of macro '___EXPORT_SYMBOL'
    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                            ^~~~~~~~~~~~~~~~
   include/linux/export.h:104:2: note: in expansion of macro '__EXPORT_SYMBOL'
     __EXPORT_SYMBOL(sym, "")
     ^~~~~~~~~~~~~~~
   lib/string.c:261:1: note: in expansion of macro 'EXPORT_SYMBOL'
    EXPORT_SYMBOL(stpcpy);
    ^~~~~~~~~~~~~


vim +/__kstrtab_stpcpy +67 include/linux/export.h

f50169324df4ad Paul Gortmaker  2011-05-23  62  
f50169324df4ad Paul Gortmaker  2011-05-23  63  /* For every exported symbol, place a struct in the __ksymtab section */
f235541699bcf1 Nicolas Pitre   2016-01-22  64  #define ___EXPORT_SYMBOL(sym, sec)					\
f50169324df4ad Paul Gortmaker  2011-05-23  65  	extern typeof(sym) sym;						\
f50169324df4ad Paul Gortmaker  2011-05-23  66  	__CRC_SYMBOL(sym, sec)						\
f50169324df4ad Paul Gortmaker  2011-05-23 @67  	static const char __kstrtab_##sym[]				\
f50169324df4ad Paul Gortmaker  2011-05-23  68  	__attribute__((section("__ksymtab_strings"), aligned(1)))	\
b92021b09df70c Rusty Russell   2013-03-15  69  	= VMLINUX_SYMBOL_STR(sym);					\
b67067f1176df6 Nicholas Piggin 2016-08-24  70  	static const struct kernel_symbol __ksymtab_##sym		\
f50169324df4ad Paul Gortmaker  2011-05-23  71  	__used								\
b67067f1176df6 Nicholas Piggin 2016-08-24  72  	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
f50169324df4ad Paul Gortmaker  2011-05-23  73  	= { (unsigned long)&sym, __kstrtab_##sym }
f50169324df4ad Paul Gortmaker  2011-05-23  74  

:::::: The code at line 67 was first introduced by commit
:::::: f50169324df4ad942e544386d136216c8617636a module.h: split out the EXPORT_SYMBOL into export.h

:::::: TO: Paul Gortmaker <paul.gortmaker@windriver.com>
:::::: CC: Paul Gortmaker <paul.gortmaker@windriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
