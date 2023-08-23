Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26181F196
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 18:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692813693; x=1724349693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/z5tW8hKIuWpB/gPa7TjObf3b5/ItQRWUN+0mgcN9Q4=;
  b=D+yEkzA/3eP1j8OCkzlLJLQEjZC+qiVyWD411bhyOOW2OaBZTmdRio/W
   eNoDduuhNnfO9BFN0CpYGSwTsv1oFNeUHnlXuA4kX14XjQdEth3Ex5RNC
   fW7DrqSllFvNVeswmslDbugd9INdY1aAFYpCFcijuLUjpSv1y15Di+v/x
   C+aOBRwlZ7bQRtYXXlyLHQTsTFjj+ObzCBPO/Lto83bFbn6k4txVjbBpn
   XdwiqKVbugjAR1Um6fHM5dSRWwa/jRuiNCvMt4JM4VD5qc4JHXan+C+Nj
   W8WnxCTAfwN0HsD/W0rdbsXG9lH2gYvmOvflZbcR44MiL9tiN7H76GsB7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="373118621"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="373118621"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 10:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826823123"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826823123"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 10:55:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYs57-0001Oa-1J;
	Wed, 23 Aug 2023 17:55:49 +0000
Date: Thu, 24 Aug 2023 01:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-lpa2-v4 53/61] arch/arm64/mm/ptdump.c:393:71: warning:
 passing argument 1 of 'virt_to_pfn' makes pointer from integer without a
 cast
Message-ID: <202308240115.FeLm3N0E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-lpa2-v4
head:   9008d04c49a096b76a306257c177ad6220d6e37f
commit: 14003365534a302f5fdc339f43564baf207c8d51 [53/61] arm64: ptdump: Disregard unaddressable VA space
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230824/202308240115.FeLm3N0E-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240115.FeLm3N0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240115.FeLm3N0E-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/memory.h:350,
                    from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from arch/arm64/mm/ptdump.c:12:
   arch/arm64/mm/ptdump.c: In function 'ptdump_init':
>> arch/arm64/mm/ptdump.c:393:71: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     393 |                         (unsigned long)virt_to_page(kernel_ptdump_info.base_addr);
         |                                                     ~~~~~~~~~~~~~~~~~~^~~~~~~~~~
         |                                                                       |
         |                                                                       long unsigned int
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/arm64/mm/ptdump.c:393:40: note: in expansion of macro 'virt_to_page'
     393 |                         (unsigned long)virt_to_page(kernel_ptdump_info.base_addr);
         |                                        ^~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:352:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     352 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~


vim +/virt_to_pfn +393 arch/arm64/mm/ptdump.c

   381	
   382	static int __init ptdump_init(void)
   383	{
   384		address_markers[PAGE_END_NR].start_address = PAGE_END;
   385	#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
   386		address_markers[KASAN_START_NR].start_address = KASAN_SHADOW_START;
   387	#endif
   388		address_markers[VMALLOC_END_NR].start_address = VMALLOC_END;
   389		ptdump_initialize();
   390		if (vabits_actual < VA_BITS) {
   391			kernel_ptdump_info.base_addr = _PAGE_OFFSET(vabits_actual);
   392			address_markers[VMEMMAP_START_NR].start_address =
 > 393				(unsigned long)virt_to_page(kernel_ptdump_info.base_addr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
