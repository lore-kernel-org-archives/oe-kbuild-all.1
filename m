Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335492F12AF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 00:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774052813; cv=none; b=OL9Mf4+nc5ivSztX9Y3iyyPMRxS1S08EXSuQI5AhtPyCIjVQRUtFr21TI4cVSNL/puMLjptAh0ZZV6wgkDeWhmSv/9A4j7OiMpd0SrwF0OSc8pCYYvIsxMCGRfxxK03gmsF9cMf6gwRjkNVIb3SvukezHyLsQza8VdcoBJezbmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774052813; c=relaxed/simple;
	bh=j2WAVyANDsQlI3myoTEysVqFQjgF9XaCOxNC5+ijpNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qlhcdMAlVPjhBW7Z9nhpbzU/sbEWblIoHmnSoF1CvvbX02dCAhnHx1r8TrOgkkCuJod29kYqosmQTe6bW0l+d+5AzuBRx6bwdZc2zH0CscH3ikftRMHMkeK444RrrOS7zKH/0iLdNJq7/LFWJBd8NvpfG0+kv3Q31D5yLVy+uWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbLwcP6k; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbLwcP6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774052812; x=1805588812;
  h=date:from:to:cc:subject:message-id;
  bh=j2WAVyANDsQlI3myoTEysVqFQjgF9XaCOxNC5+ijpNA=;
  b=PbLwcP6k21sTkXoU0eRzJV9NXD/Xz3HEqycjMEoGldTbAA3WoXLp6BfD
   DhFZxdYj9kv883U8rl2bxFxDj5QO8P60oSQ9liwh+ZB0ck3U5DGehUT+F
   e1r3Azr39k4hHm6uvHiJwzCrHFClhe0VV219vTciMsxmTSY4GaiqDBvo9
   V0OWEo+BW3afaLoTL8dd15CRYc5zsRZWkRLW5cpwHVFO701HwHoWwn6Vs
   wlf1xibBO6aSkrAOCArEreBIbKn6b+QWiQARakimaTjSqOITyTrY7IK6k
   Hstm4FofjBT/qMikRqnGHiBdKib3UYgFLyfe+q8FwxfWu4kiLfgtK2jW+
   g==;
X-CSE-ConnectionGUID: I6AVzcVIQwa7zvYTNgwtSQ==
X-CSE-MsgGUID: 7ei7vOo9QZuhDTqq5P4CiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86621346"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="86621346"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 17:26:50 -0700
X-CSE-ConnectionGUID: DMt/HBrBQ+WGFYL3qDeL9w==
X-CSE-MsgGUID: jLmqP5gCSJyWJIn074pxtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="219182517"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2026 17:26:46 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3kAt-0000000005h-4C3R;
	Sat, 21 Mar 2026 00:26:44 +0000
Date: Sat, 21 Mar 2026 08:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 4/14] arch/x86/kernel/irq.c:134:31:
 error: 'IRQ_COUNT_X86_PLATFORM_IPI' undeclared
Message-ID: <202603210843.u3wiVCCg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   9e85c64195f3479abcad77115c7d5626e6905546
commit: d5debb2dd149e388fe3fdc1660437d2362579d28 [4/14] x86/irq: Make irqstats array based
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260321/202603210843.u3wiVCCg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210843.u3wiVCCg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210843.u3wiVCCg-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/irq.c: In function 'irq_init_stats':
>> arch/x86/kernel/irq.c:134:31: error: 'IRQ_COUNT_X86_PLATFORM_IPI' undeclared (first use in this function)
     134 |                 irq_stat_info[IRQ_COUNT_X86_PLATFORM_IPI].skip_vector = 1;
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/irq.c:134:31: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:598,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:17,
                    from arch/x86/events/intel/core.c:14:
   arch/x86/events/intel/core.c: In function 'handle_pmi_common':
>> arch/x86/include/asm/hardirq.h:70:62: error: 'IRQ_COUNT_APIC_PERF' undeclared (first use in this function)
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:501:41: note: in expansion of macro '__pcpu_size_call'
     501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:511:41: note: in expansion of macro 'this_cpu_add'
     511 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~
   arch/x86/include/asm/hardirq.h:70:33: note: in expansion of macro 'this_cpu_inc'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                 ^~~~~~~~~~~~
   arch/x86/events/intel/core.c:3507:9: note: in expansion of macro 'inc_irq_stat'
    3507 |         inc_irq_stat(APIC_PERF);
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/hardirq.h:70:62: note: each undeclared identifier is reported only once for each function it appears in
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:501:41: note: in expansion of macro '__pcpu_size_call'
     501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:511:41: note: in expansion of macro 'this_cpu_add'
     511 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~
   arch/x86/include/asm/hardirq.h:70:33: note: in expansion of macro 'this_cpu_inc'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                 ^~~~~~~~~~~~
   arch/x86/events/intel/core.c:3507:9: note: in expansion of macro 'inc_irq_stat'
    3507 |         inc_irq_stat(APIC_PERF);
         |         ^~~~~~~~~~~~
--
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:598,
                    from arch/x86/include/asm/current.h:11,
                    from include/linux/sched.h:12,
                    from include/linux/ptrace.h:6,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from include/linux/perf_event.h:18,
                    from arch/x86/events/intel/knc.c:4:
   arch/x86/events/intel/knc.c: In function 'knc_pmu_handle_irq':
>> arch/x86/include/asm/hardirq.h:70:62: error: 'IRQ_COUNT_APIC_PERF' undeclared (first use in this function)
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:501:41: note: in expansion of macro '__pcpu_size_call'
     501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:511:41: note: in expansion of macro 'this_cpu_add'
     511 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~
   arch/x86/include/asm/hardirq.h:70:33: note: in expansion of macro 'this_cpu_inc'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                 ^~~~~~~~~~~~
   arch/x86/events/intel/knc.c:241:9: note: in expansion of macro 'inc_irq_stat'
     241 |         inc_irq_stat(APIC_PERF);
         |         ^~~~~~~~~~~~
   arch/x86/include/asm/hardirq.h:70:62: note: each undeclared identifier is reported only once for each function it appears in
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:501:41: note: in expansion of macro '__pcpu_size_call'
     501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:511:41: note: in expansion of macro 'this_cpu_add'
     511 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~
   arch/x86/include/asm/hardirq.h:70:33: note: in expansion of macro 'this_cpu_inc'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                 ^~~~~~~~~~~~
   arch/x86/events/intel/knc.c:241:9: note: in expansion of macro 'inc_irq_stat'
     241 |         inc_irq_stat(APIC_PERF);
         |         ^~~~~~~~~~~~
--
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:598,
                    from arch/x86/include/asm/current.h:11,
                    from include/linux/sched.h:12,
                    from include/linux/ptrace.h:6,
                    from include/uapi/asm-generic/bpf_perf_event.h:4,
                    from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1,
                    from include/uapi/linux/bpf_perf_event.h:11,
                    from include/linux/perf_event.h:18,
                    from arch/x86/events/intel/p4.c:10:
   arch/x86/events/intel/p4.c: In function 'p4_pmu_handle_irq':
>> arch/x86/include/asm/hardirq.h:70:62: error: 'IRQ_COUNT_APIC_PERF' undeclared (first use in this function)
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:501:41: note: in expansion of macro '__pcpu_size_call'
     501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:511:41: note: in expansion of macro 'this_cpu_add'
     511 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~
   arch/x86/include/asm/hardirq.h:70:33: note: in expansion of macro 'this_cpu_inc'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                 ^~~~~~~~~~~~
   arch/x86/events/intel/p4.c:1080:17: note: in expansion of macro 'inc_irq_stat'
    1080 |                 inc_irq_stat(APIC_PERF);
         |                 ^~~~~~~~~~~~
   arch/x86/include/asm/hardirq.h:70:62: note: each undeclared identifier is reported only once for each function it appears in
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                                              ^~~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:501:41: note: in expansion of macro '__pcpu_size_call'
     501 | #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:511:41: note: in expansion of macro 'this_cpu_add'
     511 | #define this_cpu_inc(pcp)               this_cpu_add(pcp, 1)
         |                                         ^~~~~~~~~~~~
   arch/x86/include/asm/hardirq.h:70:33: note: in expansion of macro 'this_cpu_inc'
      70 | #define inc_irq_stat(index)     this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
         |                                 ^~~~~~~~~~~~
   arch/x86/events/intel/p4.c:1080:17: note: in expansion of macro 'inc_irq_stat'
    1080 |                 inc_irq_stat(APIC_PERF);
         |                 ^~~~~~~~~~~~


vim +/IRQ_COUNT_X86_PLATFORM_IPI +134 arch/x86/kernel/irq.c

   123	
   124	void __init irq_init_stats(void)
   125	{
   126		struct irq_stat_info *info = irq_stat_info;
   127	
   128		for (unsigned int i = 0; i < ARRAY_SIZE(irq_stat_info); i++, info++) {
   129			if (info->skip_vector && test_bit(info->skip_vector, system_vectors))
   130				info->skip_vector = 0;
   131		}
   132	
   133		if (!x86_platform_ipi_callback)
 > 134			irq_stat_info[IRQ_COUNT_X86_PLATFORM_IPI].skip_vector = 1;
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
