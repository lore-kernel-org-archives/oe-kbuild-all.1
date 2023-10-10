Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7F718AF4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6tlX2C6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696936677; x=1728472677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EkyWNHp1vT6Z/U7iZXwKcw5w3CgnGHncF0R2jGDNf+A=;
  b=G6tlX2C6tzXCAK//+Ww9SRu5V5QvzuNx2yyZIutQSzGO+5lbJcvhEQ2W
   XWOuzmB6w7bnxs0FgPCQtJTrHk/cUtHwamEX8BJsKADIZlhrasHd/gksf
   hnl+qH2AQ7GDtEgn+YazrrOGMTRMR1AUzbfEB8Hxa4l8Ih++E0MSNBjdI
   Ee5F/1Jhjo8i+U1zVbAgE/XjTpEabpd7ftJVbRgsAvq4FC5699oCNIyhi
   6PD9Io8dXh5UkVg0IouiuHtOOFwF/Z9C/BFGdK64T27vPhIjeM+UXZcp3
   6vPYFsrM1Mytl/79hZW63qk7lRxo5Whrj6m1iizSAFl+t2S3tE2BNRHE3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="470632316"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="470632316"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 04:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="927102041"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="927102041"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Oct 2023 04:17:55 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqAkI-0000JN-2l;
	Tue, 10 Oct 2023 11:17:51 +0000
Date: Tue, 10 Oct 2023 19:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: arch/powerpc/include/asm/book3s/64/pgtable-64k.h:60:1: error: no
 return statement in function returning non-void
Message-ID: <202310101939.1583QpNt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94f6f0550c625fab1f373bb86a6669b45e9748b3
commit: 172aad81a882443eefe1bd860c4eddc81b14dd5b kbuild: enforce -Werror=return-type
date:   3 years ago
config: powerpc64-randconfig-003-20231009 (https://download.01.org/0day-ci/archive/20231010/202310101939.1583QpNt-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101939.1583QpNt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310101939.1583QpNt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/book3s/64/pgtable.h:302,
                    from arch/powerpc/include/asm/book3s/64/mmu-hash.h:20,
                    from arch/powerpc/include/asm/book3s/64/mmu.h:46,
                    from arch/powerpc/include/asm/mmu.h:369,
                    from arch/powerpc/include/asm/lppaca.h:46,
                    from arch/powerpc/include/asm/paca.h:17,
                    from arch/powerpc/include/asm/current.h:13,
                    from include/linux/thread_info.h:21,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   arch/powerpc/include/asm/book3s/64/pgtable-64k.h: In function 'get_hugepd_cache_index':
>> arch/powerpc/include/asm/book3s/64/pgtable-64k.h:60:1: error: no return statement in function returning non-void [-Werror=return-type]
      60 | }
         | ^
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1 shuffle=1921690789
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1206: prepare0] Error 2 shuffle=1921690789
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2 shuffle=1921690789
   make: Target 'prepare' not remade because of errors.


vim +60 arch/powerpc/include/asm/book3s/64/pgtable-64k.h

a9252aaefe7e72 Aneesh Kumar K.V 2016-04-29  53  
fadd03c615922d Aneesh Kumar K.V 2018-06-14  54  /*
fadd03c615922d Aneesh Kumar K.V 2018-06-14  55   * This should never get called
fadd03c615922d Aneesh Kumar K.V 2018-06-14  56   */
fadd03c615922d Aneesh Kumar K.V 2018-06-14  57  static inline int get_hugepd_cache_index(int index)
fadd03c615922d Aneesh Kumar K.V 2018-06-14  58  {
fadd03c615922d Aneesh Kumar K.V 2018-06-14  59  	BUG();
fadd03c615922d Aneesh Kumar K.V 2018-06-14 @60  }
fadd03c615922d Aneesh Kumar K.V 2018-06-14  61  

:::::: The code at line 60 was first introduced by commit
:::::: fadd03c615922d8521a2e76d4ba2335891cb2790 powerpc/mm/hash/4k: Free hugetlb page table caches correctly.

:::::: TO: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
