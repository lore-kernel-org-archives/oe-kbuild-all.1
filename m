Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C7B210D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 05:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692164197; x=1723700197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+RIZJ6IaXKMp4GAl13lCJ+NM941Dha7c6dXVHO1IsTE=;
  b=CgmRieWzdlegpR/blDvuMDgf7kyeqyZ8Tv8o3IHP6bI1Td1r98s0znry
   4Mts9i89pnmVTUPyqRzlS668h0rAw+RVaJ8d7xIf+qfqQDNtsMZ+wzIut
   TrCL6rDzz49r2meHJWrBh3F1cfXnJIB1cIwW9dq25kJ4YelC5Qs/nOXKa
   Qfb3YYYA7PkaRkrmleqEF4Ez1YXgb6K7FKaxDe7mixqZBx8Ge/yP5mz+K
   KQwR8I60PhaPke3QT4Mrp69ti3EA8jhdPnAi2+Lpujh17O2VnzezppJR4
   NHxKwx8k8hQOfuO4qOBKnfk1bEi9jY+nWybo+EwNAfFDXFqz7O/x725RL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458796863"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="458796863"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 22:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="727634115"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="727634115"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Aug 2023 22:36:34 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW9Cs-000013-0I;
	Wed, 16 Aug 2023 05:36:34 +0000
Date: Wed, 16 Aug 2023 13:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm 4/6] include/linux/kern_levels.h:5:25:
 warning: format '%d' expects argument of type 'int', but argument 2 has type
 'long unsigned int'
Message-ID: <202308161348.NnNxubXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
head:   c95bf4c16099f2ed29a7f6949559bc4187d30710
commit: adf03dd2204acf7eab000a02bdfe50099f2fa089 [4/6] KVM: PPC: Book3s HV: Hold LPIDs in an unsigned long
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230816/202308161348.NnNxubXr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161348.NnNxubXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161348.NnNxubXr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from arch/powerpc/kvm/book3s_hv_uvmem.c:89:
   arch/powerpc/kvm/book3s_hv_uvmem.c: In function 'kvmppc_h_svm_init_done':
>> include/linux/kern_levels.h:5:25: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:528:9: note: in expansion of macro 'printk'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:528:16: note: in expansion of macro 'KERN_INFO'
     528 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   arch/powerpc/kvm/book3s_hv_uvmem.c:860:9: note: in expansion of macro 'pr_info'
     860 |         pr_info("LPID %d went secure\n", kvm->arch.lpid);
         |         ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
