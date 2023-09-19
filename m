Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EC434CC3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 04:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695096154; x=1726632154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QZtJ169XLNB/hgirj4TxxTNmDKW2Zzz320oct2Pelaw=;
  b=C11TCeMJPY5nF5bSqG7RhERBEq391TJ+QTjckNRYtWPofLWrxRunWNUl
   kTEmklRoUDQ0gsJo6rIwlUw7b7DP7TPdqB3iDQRGk+0JIbCYYVjtnzmyW
   61LoiQTwOO1fpMk3cw3rmAlX9rugaVauF0Hxlu3/SUFmH29PoOqpsgePp
   cHzDR6HiVSkfjhPLp8AjOnUekXuC7QLRqBKqiWArOAMQ7M5Xsdr3QTtJ3
   C0GUHhkkVNPEsajMWRITO0ojxdDguoM70frwRqKit5qQ1r97JtGFD+adC
   238lGxiBElMz7ZjAzHbTnT7MDd6DFMeUommD4+M+qb4nS+mAbZ2yt/7Qh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446319634"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="446319634"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 21:02:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722713301"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="722713301"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Sep 2023 21:02:32 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiRwT-0006sE-2z;
	Tue, 19 Sep 2023 04:02:29 +0000
Date: Tue, 19 Sep 2023 12:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zhen Lei <thunder.leizhen@huawei.com>
Subject: [linux-next:master 5741/5912] kernel/crash_core.c:214:13: warning:
 argument 2 null where non-null expected
Message-ID: <202309191144.B0MToaPG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fc7222d9680366edeecc219c21ca96310bdbc10
commit: 5c322f6aad10f0920f842a4ccf82e9b9f351c0a5 [5741/5912] crash_core.c: remove unneeded functions
config: s390-buildonly-randconfig-r006-20220512 (https://download.01.org/0day-ci/archive/20230919/202309191144.B0MToaPG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191144.B0MToaPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309191144.B0MToaPG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/atomic.h:12,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from kernel/crash_core.c:7:
   kernel/crash_core.c: In function 'parse_crashkernel_suffix.constprop':
>> kernel/crash_core.c:214:13: warning: argument 2 null where non-null expected [-Wnonnull]
     214 |         if (strncmp(cur, suffix, strlen(suffix))) {
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   kernel/crash_core.c:214:9: note: in expansion of macro 'if'
     214 |         if (strncmp(cur, suffix, strlen(suffix))) {
         |         ^~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from kernel/crash_core.c:7:
   include/linux/string.h:51:12: note: in a call to function 'strncmp' declared 'nonnull'
      51 | extern int strncmp(const char *,const char *,__kernel_size_t);
         |            ^~~~~~~


vim +214 kernel/crash_core.c

692f66f26a4c19 Hari Bathini 2017-05-08  193  
692f66f26a4c19 Hari Bathini 2017-05-08  194  /*
692f66f26a4c19 Hari Bathini 2017-05-08  195   * That function parses "suffix"  crashkernel command lines like
692f66f26a4c19 Hari Bathini 2017-05-08  196   *
692f66f26a4c19 Hari Bathini 2017-05-08  197   *	crashkernel=size,[high|low]
692f66f26a4c19 Hari Bathini 2017-05-08  198   *
692f66f26a4c19 Hari Bathini 2017-05-08  199   * It returns 0 on success and -EINVAL on failure.
692f66f26a4c19 Hari Bathini 2017-05-08  200   */
692f66f26a4c19 Hari Bathini 2017-05-08  201  static int __init parse_crashkernel_suffix(char *cmdline,
692f66f26a4c19 Hari Bathini 2017-05-08  202  					   unsigned long long	*crash_size,
692f66f26a4c19 Hari Bathini 2017-05-08  203  					   const char *suffix)
692f66f26a4c19 Hari Bathini 2017-05-08  204  {
692f66f26a4c19 Hari Bathini 2017-05-08  205  	char *cur = cmdline;
692f66f26a4c19 Hari Bathini 2017-05-08  206  
692f66f26a4c19 Hari Bathini 2017-05-08  207  	*crash_size = memparse(cmdline, &cur);
692f66f26a4c19 Hari Bathini 2017-05-08  208  	if (cmdline == cur) {
692f66f26a4c19 Hari Bathini 2017-05-08  209  		pr_warn("crashkernel: memory value expected\n");
692f66f26a4c19 Hari Bathini 2017-05-08  210  		return -EINVAL;
692f66f26a4c19 Hari Bathini 2017-05-08  211  	}
692f66f26a4c19 Hari Bathini 2017-05-08  212  
692f66f26a4c19 Hari Bathini 2017-05-08  213  	/* check with suffix */
692f66f26a4c19 Hari Bathini 2017-05-08 @214  	if (strncmp(cur, suffix, strlen(suffix))) {
692f66f26a4c19 Hari Bathini 2017-05-08  215  		pr_warn("crashkernel: unrecognized char: %c\n", *cur);
692f66f26a4c19 Hari Bathini 2017-05-08  216  		return -EINVAL;
692f66f26a4c19 Hari Bathini 2017-05-08  217  	}
692f66f26a4c19 Hari Bathini 2017-05-08  218  	cur += strlen(suffix);
692f66f26a4c19 Hari Bathini 2017-05-08  219  	if (*cur != ' ' && *cur != '\0') {
692f66f26a4c19 Hari Bathini 2017-05-08  220  		pr_warn("crashkernel: unrecognized char: %c\n", *cur);
692f66f26a4c19 Hari Bathini 2017-05-08  221  		return -EINVAL;
692f66f26a4c19 Hari Bathini 2017-05-08  222  	}
692f66f26a4c19 Hari Bathini 2017-05-08  223  
692f66f26a4c19 Hari Bathini 2017-05-08  224  	return 0;
692f66f26a4c19 Hari Bathini 2017-05-08  225  }
692f66f26a4c19 Hari Bathini 2017-05-08  226  

:::::: The code at line 214 was first introduced by commit
:::::: 692f66f26a4c19d73249736aa973c13a1521b387 crash: move crashkernel parsing and vmcore related code under CONFIG_CRASH_CORE

:::::: TO: Hari Bathini <hbathini@linux.vnet.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
