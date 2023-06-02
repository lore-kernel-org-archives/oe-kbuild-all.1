Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EDE15BF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685711974; x=1717247974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H/r+/fEyYNxSoIF43rO/vcJaqZBkdyu8xfzigoncmEI=;
  b=WSu0zEY8gG990qb216XN5iC7W/6s7Puv13bfc1b9yTNSkCkOSUwFW55F
   MHXt8sf1IPze7gAZkuL1gN94PPq9FAYkWvE0hru5F7l4RJg4EjsvY4Cu8
   VXlC6+Z4YiJm1FxGmM2lhxrsinnXFMlgFhrq2tVWgR4+nQn3WYvhqtdgu
   HATC95lzHjflsEtkBwQvFJZ4LnQZcrIQjDXge0LzYcBA8nY35ePaajsHJ
   gsBqiGtxmMFkHmMOWvDI7NNgZD/IYlrZShHvCHqcvFYi57VV1toBmCcj+
   a3ecUrNBGPXXsZ0aV41x18XJpVgFAn7E2qkg1G5KXl/OG6U0EV5inpuzg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="384147882"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="384147882"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 06:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707851848"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="707851848"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 06:19:31 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q54gl-0000SX-04;
	Fri, 02 Jun 2023 13:19:31 +0000
Date: Fri, 2 Jun 2023 21:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Qiang Rao <qiang.rao@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Dutta, Ranjan" <ranjan.dutta@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 6609/30000]
 drivers/tcc/tcc_buffer.c:516:71: warning: cast from pointer to integer of
 different size
Message-ID: <202306022115.fXAI98tU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qiang,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   5610fff176c8ff3eb470b8270294bc7a7acb4a15
commit: d90e604cd471869c6f1a7942ab3b1d3f351e48d8 [6609/30000] Add new IOCTL to read error log buffer.
config: i386-randconfig-i052-20230531 (https://download.01.org/0day-ci/archive/20230602/202306022115.fXAI98tU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/d90e604cd471869c6f1a7942ab3b1d3f351e48d8
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/dovetail-xenomai
        git checkout d90e604cd471869c6f1a7942ab3b1d3f351e48d8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/ drivers/tcc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306022115.fXAI98tU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tcc/tcc_buffer.c:471:5: warning: no previous prototype for 'start_measure' [-Wmissing-prototypes]
     471 | int start_measure(void)
         |     ^~~~~~~~~~~~~
   In file included from include/linux/kernel.h:16,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/tcc/tcc_buffer.c:58:
   drivers/tcc/tcc_buffer.c: In function 'set_test_setup':
>> drivers/tcc/tcc_buffer.c:516:71: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     516 |                         pr_err("cache_info_k_virt_addr  0x%016llx\n", (u64)(cache_info_k_virt_addr));
         |                                                                       ^
   include/linux/printk.h:343:40: note: in definition of macro 'pr_err'
     343 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   drivers/tcc/tcc_buffer.c: At top level:
   drivers/tcc/tcc_buffer.c:1074:6: warning: no previous prototype for 'clear_mem' [-Wmissing-prototypes]
    1074 | void clear_mem(void *info)
         |      ^~~~~~~~~
   drivers/tcc/tcc_buffer.c: In function 'tcc_perf_fn':
>> drivers/tcc/tcc_buffer.c:469:1: warning: unsupported size for integer register
     469 | }
         | ^


vim +516 drivers/tcc/tcc_buffer.c

   323	
   324	static int tcc_perf_fn(void)
   325	{
   326		u64 perf_l1h = 0, perf_l1m = 0, msr_bits_l1h = 0, msr_bits_l1m = 0;
   327		u64 perf_l2h = 0, perf_l2m = 0, msr_bits_l2h = 0, msr_bits_l2m = 0;
   328		u64 perf_l3h = 0, perf_l3m = 0, msr_bits_l3h = 0, msr_bits_l3m = 0;
   329		u64 i;
   330	
   331		u32 cacheline_len;
   332		u32 cacheread_size;
   333		void *cachemem_k;
   334	
   335		u64 start, end;
   336	
   337		pr_err("In %s\n", __func__);
   338	
   339		switch (boot_cpu_data.x86_model) {
   340		case INTEL_FAM6_ATOM_GOLDMONT:
   341		case INTEL_FAM6_ATOM_GOLDMONT_PLUS:
   342		case INTEL_FAM6_ATOM_TREMONT:
   343		case INTEL_FAM6_TIGERLAKE:
   344		case INTEL_FAM6_TIGERLAKE_L:
   345		case INTEL_FAM6_ALDERLAKE:
   346		case INTEL_FAM6_ALDERLAKE_L:
   347		case INTEL_FAM6_ICELAKE:
   348		case INTEL_FAM6_ICELAKE_L:
   349		case INTEL_FAM6_ICELAKE_X:
   350		case INTEL_FAM6_ICELAKE_D:
   351		{
   352			if (cache_info_k.cache_level == RGN_L2) {
   353				msr_bits_l2h = (MISC_MSR_BITS_COMMON) | (0x2  << 8);
   354				msr_bits_l2m = (MISC_MSR_BITS_COMMON) | (0x10 << 8);
   355				msr_bits_l1h = (MISC_MSR_BITS_COMMON) | (0x1  << 8);
   356				msr_bits_l1m = (MISC_MSR_BITS_COMMON) | (0x08 << 8);
   357			} else if (cache_info_k.cache_level == RGN_L3) {
   358				msr_bits_l2h = (MISC_MSR_BITS_COMMON) | (0x2  << 8);
   359				msr_bits_l2m = (MISC_MSR_BITS_COMMON) | (0x10 << 8);
   360				msr_bits_l3h = (MISC_MSR_BITS_COMMON) | (0x4  << 8);
   361				msr_bits_l3m = (MISC_MSR_BITS_COMMON) | (0x20 << 8);
   362			}
   363		}
   364		break;
   365		default:
   366			pr_err("Didn't catch this CPU Model in perf_fn()!\n");
   367			goto out;
   368		}
   369	
   370		asm volatile (" cli ");
   371	
   372		__wrmsr(MSR_MISC_FEATURE_CONTROL, hardware_prefetcher_disable_bits, 0x0);
   373	
   374		cachemem_k     = cache_info_k_virt_addr;
   375		cacheread_size = cache_info_k.cache_size;
   376		cacheline_len  = cache_info_k.cacheline_size;
   377	
   378		/* Disable events and reset counters. 4 pairs. */
   379		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0, MISC_MSR_BITS_ALL_CLEAR);
   380		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 1, MISC_MSR_BITS_ALL_CLEAR);
   381		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 2, MISC_MSR_BITS_ALL_CLEAR);
   382		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 3, MISC_MSR_BITS_ALL_CLEAR);
   383	
   384		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_PERFCTR0, MISC_MSR_BITS_ALL_CLEAR);
   385		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_PERFCTR0 + 1, MISC_MSR_BITS_ALL_CLEAR);
   386		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_PERFCTR0 + 2, MISC_MSR_BITS_ALL_CLEAR);
   387		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_PERFCTR0 + 3, MISC_MSR_BITS_ALL_CLEAR);
   388	
   389		/* Set and enable L3 counters if msr_bits_l3h is prepared */
   390		if (msr_bits_l3h > 0) {
   391			tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 2, msr_bits_l3h);
   392			tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 3, msr_bits_l3m);
   393		}
   394	
   395		/* Set and enable L1 counters if msr_bits_l1h is prepared */
   396		if (msr_bits_l1h > 0) {
   397			tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 2, msr_bits_l1h);
   398			tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 3, msr_bits_l1m);
   399		}
   400	
   401		/* Set and enable the L2 counters, which is always preapred */
   402		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0, msr_bits_l2h);
   403		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 1, msr_bits_l2m);
   404	
   405		/* capture the timestamp at the meantime while hitting buffer */
   406		start = rdtsc_ordered();
   407		for (i = 0; i < cacheread_size; i += cacheline_len) {
   408			asm volatile("mov (%0,%1,1), %%eax\n\t"
   409					:
   410					: "r" (cachemem_k), "r" (i)
   411					: "%eax", "memory");
   412		}
   413		end = rdtsc_ordered();
   414	
   415		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0, msr_bits_l2h & PERFMON_EVENTSEL_BITMASK);
   416		tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 1, msr_bits_l2m & PERFMON_EVENTSEL_BITMASK);
   417	
   418		if (msr_bits_l3h > 0) {
   419			tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 2, msr_bits_l3h & PERFMON_EVENTSEL_BITMASK);
   420			tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 3, msr_bits_l3m & PERFMON_EVENTSEL_BITMASK);
   421		}
   422	
   423		if (msr_bits_l1h > 0) {
   424			tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 2, msr_bits_l1h & PERFMON_EVENTSEL_BITMASK);
   425			tcc_perf_wrmsrl(MSR_ARCH_PERFMON_EVENTSEL0 + 3, msr_bits_l1m & PERFMON_EVENTSEL_BITMASK);
   426		}
   427	
   428		perf_l2h = native_read_pmc(0);
   429		perf_l2m = native_read_pmc(1);
   430	
   431		if (msr_bits_l3h > 0) {
   432			perf_l3h = native_read_pmc(2);
   433			perf_l3m = native_read_pmc(3);
   434		}
   435	
   436		if (msr_bits_l1h > 0) {
   437			perf_l1h = native_read_pmc(2);
   438			perf_l1m = native_read_pmc(3);
   439		}
   440	
   441		wrmsr(MSR_MISC_FEATURE_CONTROL, 0x0, 0x0);
   442		asm volatile (" sti ");
   443	
   444		if (cache_info_k.cache_level == RGN_L2) {
   445			pr_err("PERFMARK perf_l2h=%llu perf_l2m=%llu", perf_l2h, perf_l2m);
   446			pr_err("PERFMARK perf_l1h=%llu perf_l1m=%llu", perf_l1h, perf_l1m);
   447			cache_info_k.l1_hits = perf_l1h;
   448			cache_info_k.l1_miss = perf_l1m;
   449			cache_info_k.l2_hits = perf_l2h;
   450			cache_info_k.l2_miss = perf_l2m;
   451			cache_info_k.l3_hits = 0;
   452			cache_info_k.l3_miss = 0;
   453		} else if (cache_info_k.cache_level == RGN_L3) {
   454			pr_err("PERFMARK perf_l2h=%llu perf_l2m=%llu", perf_l2h, perf_l2m);
   455			pr_err("PERFMARK perf_l3h=%llu perf_l3m=%llu", perf_l3h, perf_l3m);
   456			cache_info_k.l1_hits = 0;
   457			cache_info_k.l1_miss = 0;
   458			cache_info_k.l2_hits = perf_l2h;
   459			cache_info_k.l2_miss = perf_l2m;
   460			cache_info_k.l3_hits = perf_l3h;
   461			cache_info_k.l3_miss = perf_l3m;
   462		}
   463		pr_err("start: %lld\n", start);
   464		pr_err("end:   %lld\n", end);
   465		pr_err("delta: %lld\n", (end-start));
   466	
   467	out:
   468		return 0;
 > 469	}
   470	
 > 471	int start_measure(void)
   472	{
   473		int ret = -1;
   474	
   475		hardware_prefetcher_disable_bits = get_hardware_prefetcher_disable_bits();
   476	
   477		switch (cache_info_k.testcase) {
   478		case TEST_CACHE_PERF:
   479			ret = tcc_perf_fn();
   480		break;
   481		default:
   482			goto out;
   483		}
   484	
   485		if (ret < 0)
   486			goto out;
   487		ret = 0;
   488	out:
   489		return ret;
   490	
   491	}
   492	
   493	
   494	static ssize_t set_test_setup(struct file *file, const char __user *ubuf, size_t count, loff_t *ppos)
   495	{
   496		if (count > BUFSIZE)
   497			return -EFAULT;
   498	
   499		if (copy_from_user((char *)(&cache_info_k), ubuf, BUFSIZE))
   500			return -EFAULT;
   501	
   502		switch (cache_info_k.testcase) {
   503		case TEST_CACHE_PERF:
   504		{
   505			pr_err("cache_info_k.phy_addr        0x%016llx\n", cache_info_k.phy_addr);
   506			pr_err("cache_info_k.cache_level     %d\n", cache_info_k.cache_level);
   507			pr_err("cache_info_k.cache_size      0x%08x\n", cache_info_k.cache_size);
   508			pr_err("cache_info_k.cacheline_size  %d\n", cache_info_k.cacheline_size);
   509			pr_err("cache_info_k.testcase        %d\n", cache_info_k.testcase);
   510	
   511			cache_info_k_virt_addr = memremap(cache_info_k.phy_addr, cache_info_k.cache_size, MEMREMAP_WB);
   512	
   513			if (cache_info_k_virt_addr == NULL)
   514				pr_err("cache_info_k_virt_addr == NULL\n");
   515			else
 > 516				pr_err("cache_info_k_virt_addr	0x%016llx\n", (u64)(cache_info_k_virt_addr));
   517	
   518			if (start_measure() != 0)
   519				pr_err("Something wrong with the cache performance measurement!");
   520	
   521			memunmap(cache_info_k_virt_addr);
   522			cache_info_k_virt_addr = NULL;
   523		}
   524		break;
   525		default:
   526			pr_err("This testcase is not handled yet.\n");
   527		return -EFAULT;
   528		}
   529	
   530		return BUFSIZE;
   531	}
   532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
