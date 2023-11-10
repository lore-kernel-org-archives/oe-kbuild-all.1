Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E183136B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 00:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXSq85r7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699575901; x=1731111901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/wTbpe8ENOlTSrYWOa5kHjZtppscEMT5Yrkvy6ySz0=;
  b=OXSq85r758s2EcB38Qn/eZKz12oFWO+nnJAZPYYuFUuHIGEVg71ZGm6X
   WB4KuYlVhMLMPqRBg7al+VvT4wMM2vI4UY94KKKtSe2+Gpk6rVtKWNCKA
   2BYWp4XuyVtAm+7omNmK46QnFVPWGZOYLhuay1Dsi07ytyFnWvReHTntZ
   7MSb3OAsbKEfuldmGju3uVOI+MoWHIDKuxk19caxOzO8U7mba5Hpz0khs
   pzLUxoCZ2msCoR8rgH3h0n6zLkclJC1ljfpTbtmMJEeTsJkGzxt+/zGz0
   287IXmnnNAJYvtUXgBxbvshtC2mdL3oOnkVZ+IiN5WYomUg+9X7lkYyi8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="369437292"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="369437292"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 16:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887196353"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="887196353"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 16:24:59 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1FKT-0009I9-0J;
	Fri, 10 Nov 2023 00:24:57 +0000
Date: Fri, 10 Nov 2023 08:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-fixes 39/41]
 arch/openrisc/include/asm/cmpxchg.h:160:24: error: call to
 '__xchg_called_with_bad_pointer' declared with attribute error: Bad argument
 size for xchg
Message-ID: <202311100750.jAnqvzlp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-fixes
head:   75a3bc7cc3bd84295e596d1a3c2528f5d6d60b67
commit: a28bddd8212862afdcbb53e210e2ff92e991d2a9 [39/41] afs: Overhaul invalidation handling to better support RO volumes
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20231110/202311100750.jAnqvzlp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100750.jAnqvzlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100750.jAnqvzlp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/openrisc/include/asm/atomic.h:131,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from fs/afs/callback.c:16:
   In function '__arch_xchg',
       inlined from '__afs_break_callback' at fs/afs/callback.c:82:6:
>> arch/openrisc/include/asm/cmpxchg.h:160:24: error: call to '__xchg_called_with_bad_pointer' declared with attribute error: Bad argument size for xchg
     160 |                 return __xchg_called_with_bad_pointer();
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__xchg_called_with_bad_pointer +160 arch/openrisc/include/asm/cmpxchg.h

489e0f802db708 Stafford Horne      2017-03-23  134  
3f1e931d158124 Mark Rutland        2021-05-25  135  #define arch_cmpxchg(ptr, o, n)						\
11595172537788 Stefan Kristiansson 2014-05-13  136  	({								\
11595172537788 Stefan Kristiansson 2014-05-13  137  		(__typeof__(*(ptr))) __cmpxchg((ptr),			\
11595172537788 Stefan Kristiansson 2014-05-13  138  					       (unsigned long)(o),	\
11595172537788 Stefan Kristiansson 2014-05-13  139  					       (unsigned long)(n),	\
11595172537788 Stefan Kristiansson 2014-05-13  140  					       sizeof(*(ptr)));		\
11595172537788 Stefan Kristiansson 2014-05-13  141  	})
11595172537788 Stefan Kristiansson 2014-05-13  142  
11595172537788 Stefan Kristiansson 2014-05-13  143  /*
11595172537788 Stefan Kristiansson 2014-05-13  144   * This function doesn't exist, so you'll get a linker error if
11595172537788 Stefan Kristiansson 2014-05-13  145   * something tries to do an invalidly-sized xchg().
11595172537788 Stefan Kristiansson 2014-05-13  146   */
489e0f802db708 Stafford Horne      2017-03-23  147  extern unsigned long __xchg_called_with_bad_pointer(void)
489e0f802db708 Stafford Horne      2017-03-23  148  	__compiletime_error("Bad argument size for xchg");
11595172537788 Stefan Kristiansson 2014-05-13  149  
068550631fbe0b Andrzej Hajda       2023-01-18  150  static inline unsigned long
068550631fbe0b Andrzej Hajda       2023-01-18  151  __arch_xchg(volatile void *ptr, unsigned long with, int size)
11595172537788 Stefan Kristiansson 2014-05-13  152  {
489e0f802db708 Stafford Horne      2017-03-23  153  	switch (size) {
489e0f802db708 Stafford Horne      2017-03-23  154  	case 1:
489e0f802db708 Stafford Horne      2017-03-23  155  	case 2:
489e0f802db708 Stafford Horne      2017-03-23  156  		return xchg_small(ptr, with, size);
489e0f802db708 Stafford Horne      2017-03-23  157  	case 4:
489e0f802db708 Stafford Horne      2017-03-23  158  		return xchg_u32(ptr, with);
489e0f802db708 Stafford Horne      2017-03-23  159  	default:
489e0f802db708 Stafford Horne      2017-03-23 @160  		return __xchg_called_with_bad_pointer();
11595172537788 Stefan Kristiansson 2014-05-13  161  	}
11595172537788 Stefan Kristiansson 2014-05-13  162  }
11595172537788 Stefan Kristiansson 2014-05-13  163  

:::::: The code at line 160 was first introduced by commit
:::::: 489e0f802db708c69004f64d92a3e1b70731614a openrisc: add 1 and 2 byte cmpxchg support

:::::: TO: Stafford Horne <shorne@gmail.com>
:::::: CC: Stafford Horne <shorne@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
