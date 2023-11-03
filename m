Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244B414281
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a262HP3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699003403; x=1730539403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=caxLlzN5XKc6UxZPqX21DUdjJqLfek1l6k5WzgqWzj4=;
  b=a262HP3GZ0EaLM1k8QsKPQvBMg0Pr+QImZFPPjC6SFaPpawqVTSuMEwp
   GRW9Zr2GDB+Z83v9Sz3qpYEJ+N45Fcv7aXg8uLNlaUM0lweOcV8r740h/
   jaxbEl4aQL8oah/yYxefqjtxG8+WqVU+Ym193iqHpYYJTeH1FmsA8ruQY
   XeDqm9drcprxdoQnxGx+Jie3SPjRGyRS46O2Zid7ke+03cwEpewc5eV+w
   ykZgo6fRnPX59SVWpna7+F4ElP9NmqGlTqZouCSOoOB9QkiChfJLHjNi0
   eDlm33n+lA0fTXFsoIrBIPTblCUWvGSWHGLnD4UCcH0bW+fpS3gyaIVOD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="369117550"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="369117550"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 02:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="9671039"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2023 02:23:20 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyqOc-0002PL-1t;
	Fri, 03 Nov 2023 09:23:18 +0000
Date: Fri, 3 Nov 2023 17:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 16110/16252]
 arch/riscv/kernel/cpufeature.c:560:6: error: conflicting types for
 'check_unaligned_access'; have 'void(int)'
Message-ID: <202311031714.Xwzfduzn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e27090b1413ff236ca1aec26d6b022149115de2c
commit: 8aefa036ccd9b3745e8f68c7a78ee4172296462f [16110/16252] Merge patch series "Add support to handle misaligned accesses in S-mode"
config: riscv-randconfig-r052-20230821 (https://download.01.org/0day-ci/archive/20231103/202311031714.Xwzfduzn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031714.Xwzfduzn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031714.Xwzfduzn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/cpufeature.c:560:6: error: conflicting types for 'check_unaligned_access'; have 'void(int)'
     560 | void check_unaligned_access(int cpu)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/include/asm/hwcap.h:73,
                    from arch/riscv/include/asm/alternative.h:19,
                    from arch/riscv/include/asm/errata_list.h:8,
                    from arch/riscv/include/asm/tlbflush.h:12,
                    from arch/riscv/include/asm/pgtable.h:117,
                    from include/linux/pgtable.h:6,
                    from include/linux/kasan.h:33,
                    from include/linux/slab.h:180,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from arch/riscv/kernel/cpufeature.c:9:
   arch/riscv/include/asm/cpufeature.h:33:5: note: previous declaration of 'check_unaligned_access' with type 'int(void *)'
      33 | int check_unaligned_access(void *unused);
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +560 arch/riscv/kernel/cpufeature.c

50724efcb370c6 Andy Chiu  2023-06-05  559  
584ea6564bcaea Evan Green 2023-08-18 @560  void check_unaligned_access(int cpu)
584ea6564bcaea Evan Green 2023-08-18  561  {
584ea6564bcaea Evan Green 2023-08-18  562  	u64 start_cycles, end_cycles;
584ea6564bcaea Evan Green 2023-08-18  563  	u64 word_cycles;
584ea6564bcaea Evan Green 2023-08-18  564  	u64 byte_cycles;
584ea6564bcaea Evan Green 2023-08-18  565  	int ratio;
584ea6564bcaea Evan Green 2023-08-18  566  	unsigned long start_jiffies, now;
584ea6564bcaea Evan Green 2023-08-18  567  	struct page *page;
584ea6564bcaea Evan Green 2023-08-18  568  	void *dst;
584ea6564bcaea Evan Green 2023-08-18  569  	void *src;
584ea6564bcaea Evan Green 2023-08-18  570  	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
584ea6564bcaea Evan Green 2023-08-18  571  
584ea6564bcaea Evan Green 2023-08-18  572  	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
584ea6564bcaea Evan Green 2023-08-18  573  	if (!page) {
584ea6564bcaea Evan Green 2023-08-18  574  		pr_warn("Can't alloc pages to measure memcpy performance");
584ea6564bcaea Evan Green 2023-08-18  575  		return;
584ea6564bcaea Evan Green 2023-08-18  576  	}
584ea6564bcaea Evan Green 2023-08-18  577  
584ea6564bcaea Evan Green 2023-08-18  578  	/* Make an unaligned destination buffer. */
584ea6564bcaea Evan Green 2023-08-18  579  	dst = (void *)((unsigned long)page_address(page) | 0x1);
584ea6564bcaea Evan Green 2023-08-18  580  	/* Unalign src as well, but differently (off by 1 + 2 = 3). */
584ea6564bcaea Evan Green 2023-08-18  581  	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
584ea6564bcaea Evan Green 2023-08-18  582  	src += 2;
584ea6564bcaea Evan Green 2023-08-18  583  	word_cycles = -1ULL;
584ea6564bcaea Evan Green 2023-08-18  584  	/* Do a warmup. */
584ea6564bcaea Evan Green 2023-08-18  585  	__riscv_copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
584ea6564bcaea Evan Green 2023-08-18  586  	preempt_disable();
584ea6564bcaea Evan Green 2023-08-18  587  	start_jiffies = jiffies;
584ea6564bcaea Evan Green 2023-08-18  588  	while ((now = jiffies) == start_jiffies)
584ea6564bcaea Evan Green 2023-08-18  589  		cpu_relax();
584ea6564bcaea Evan Green 2023-08-18  590  
584ea6564bcaea Evan Green 2023-08-18  591  	/*
584ea6564bcaea Evan Green 2023-08-18  592  	 * For a fixed amount of time, repeatedly try the function, and take
584ea6564bcaea Evan Green 2023-08-18  593  	 * the best time in cycles as the measurement.
584ea6564bcaea Evan Green 2023-08-18  594  	 */
584ea6564bcaea Evan Green 2023-08-18  595  	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
584ea6564bcaea Evan Green 2023-08-18  596  		start_cycles = get_cycles64();
584ea6564bcaea Evan Green 2023-08-18  597  		/* Ensure the CSR read can't reorder WRT to the copy. */
584ea6564bcaea Evan Green 2023-08-18  598  		mb();
584ea6564bcaea Evan Green 2023-08-18  599  		__riscv_copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
584ea6564bcaea Evan Green 2023-08-18  600  		/* Ensure the copy ends before the end time is snapped. */
584ea6564bcaea Evan Green 2023-08-18  601  		mb();
584ea6564bcaea Evan Green 2023-08-18  602  		end_cycles = get_cycles64();
584ea6564bcaea Evan Green 2023-08-18  603  		if ((end_cycles - start_cycles) < word_cycles)
584ea6564bcaea Evan Green 2023-08-18  604  			word_cycles = end_cycles - start_cycles;
584ea6564bcaea Evan Green 2023-08-18  605  	}
584ea6564bcaea Evan Green 2023-08-18  606  
584ea6564bcaea Evan Green 2023-08-18  607  	byte_cycles = -1ULL;
584ea6564bcaea Evan Green 2023-08-18  608  	__riscv_copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
584ea6564bcaea Evan Green 2023-08-18  609  	start_jiffies = jiffies;
584ea6564bcaea Evan Green 2023-08-18  610  	while ((now = jiffies) == start_jiffies)
584ea6564bcaea Evan Green 2023-08-18  611  		cpu_relax();
584ea6564bcaea Evan Green 2023-08-18  612  
584ea6564bcaea Evan Green 2023-08-18  613  	while (time_before(jiffies, now + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
584ea6564bcaea Evan Green 2023-08-18  614  		start_cycles = get_cycles64();
584ea6564bcaea Evan Green 2023-08-18  615  		mb();
584ea6564bcaea Evan Green 2023-08-18  616  		__riscv_copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
584ea6564bcaea Evan Green 2023-08-18  617  		mb();
584ea6564bcaea Evan Green 2023-08-18  618  		end_cycles = get_cycles64();
584ea6564bcaea Evan Green 2023-08-18  619  		if ((end_cycles - start_cycles) < byte_cycles)
584ea6564bcaea Evan Green 2023-08-18  620  			byte_cycles = end_cycles - start_cycles;
584ea6564bcaea Evan Green 2023-08-18  621  	}
584ea6564bcaea Evan Green 2023-08-18  622  
584ea6564bcaea Evan Green 2023-08-18  623  	preempt_enable();
584ea6564bcaea Evan Green 2023-08-18  624  
584ea6564bcaea Evan Green 2023-08-18  625  	/* Don't divide by zero. */
584ea6564bcaea Evan Green 2023-08-18  626  	if (!word_cycles || !byte_cycles) {
584ea6564bcaea Evan Green 2023-08-18  627  		pr_warn("cpu%d: rdtime lacks granularity needed to measure unaligned access speed\n",
584ea6564bcaea Evan Green 2023-08-18  628  			cpu);
584ea6564bcaea Evan Green 2023-08-18  629  
584ea6564bcaea Evan Green 2023-08-18  630  		goto out;
584ea6564bcaea Evan Green 2023-08-18  631  	}
584ea6564bcaea Evan Green 2023-08-18  632  
584ea6564bcaea Evan Green 2023-08-18  633  	if (word_cycles < byte_cycles)
584ea6564bcaea Evan Green 2023-08-18  634  		speed = RISCV_HWPROBE_MISALIGNED_FAST;
584ea6564bcaea Evan Green 2023-08-18  635  
584ea6564bcaea Evan Green 2023-08-18  636  	ratio = div_u64((byte_cycles * 100), word_cycles);
584ea6564bcaea Evan Green 2023-08-18  637  	pr_info("cpu%d: Ratio of byte access time to unaligned word access is %d.%02d, unaligned accesses are %s\n",
584ea6564bcaea Evan Green 2023-08-18  638  		cpu,
584ea6564bcaea Evan Green 2023-08-18  639  		ratio / 100,
584ea6564bcaea Evan Green 2023-08-18  640  		ratio % 100,
584ea6564bcaea Evan Green 2023-08-18  641  		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
584ea6564bcaea Evan Green 2023-08-18  642  
584ea6564bcaea Evan Green 2023-08-18  643  	per_cpu(misaligned_access_speed, cpu) = speed;
584ea6564bcaea Evan Green 2023-08-18  644  
584ea6564bcaea Evan Green 2023-08-18  645  out:
584ea6564bcaea Evan Green 2023-08-18  646  	__free_pages(page, get_order(MISALIGNED_BUFFER_SIZE));
584ea6564bcaea Evan Green 2023-08-18  647  }
584ea6564bcaea Evan Green 2023-08-18  648  

:::::: The code at line 560 was first introduced by commit
:::::: 584ea6564bcaead223840cdafe84e4947ba85509 RISC-V: Probe for unaligned access speed

:::::: TO: Evan Green <evan@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
