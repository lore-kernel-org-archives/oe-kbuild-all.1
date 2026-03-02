Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB39A3859F7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437762; cv=none; b=n2WT+dJ4HXTiqaZaCkFghxcVj+/lFm2+ngTYY1YwrmFvMCy/xfvDtTAO4LpW9XmNIz6ftsOtvIF9SL0WIciaunZxjXWn2lThLhQ71VHHOR4BSI8TnX+Eil4SQqbxle1u47S0ftWIPlfATI9nUgnvxUlG6eoKGVvuvp7/o0TEEHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437762; c=relaxed/simple;
	bh=/W0eA55hT9K2yiSmiC49FDAXilDyU4IqspcuwyNu6cw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pc6kkPaLeRjJjWgKYtv5GKMyjV9IUA/nD5flNwY9yfMA4gLC/yWhIRcUIGotebgiVHg9h3IOSnvmh4Cgda7gZld7vaxC1y5clg/em8De0+Vipq6+KUXo33VxENxq43wp76RvcFrTjPON5+lgSNfaql/yZZ2NH/GKE+7led8c39Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lfu7Dhfc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lfu7Dhfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772437761; x=1803973761;
  h=date:from:to:cc:subject:message-id;
  bh=/W0eA55hT9K2yiSmiC49FDAXilDyU4IqspcuwyNu6cw=;
  b=Lfu7Dhfc9/muhMySKPoRoJxGg7ErBA7JW9n6QScHdRPmGDNPKG0gP7u+
   v/Do8k6LQ8IMZVQAt0i6CIsrk76dBjlGkSGuTo+OXXa8gB4IpAVQHFpH2
   64E0pTPqQRtjYu2b29AiJn1AgIm+sBBrNnIU8eOSHRhEfad9U6rS5Vuno
   qk/H4YqckZrj6Nxjrs7Qg5ebvNY8FLUo2z5ygHXn7Pgv76eke0fCPFRnE
   EGGSp5big+zmfpXDCC/pIiIKtBho2z4ABm9od+ypcBJf/9/B8WYkue8Sc
   TarneDaKD1/tO5uNxH1Wx46uAmUU8taMP2NEHpKYs4Z9sghcOpfkvcgZv
   g==;
X-CSE-ConnectionGUID: rReD+HpuTX2HafCsS3TQUA==
X-CSE-MsgGUID: 5TewC0IUQwWZH7RQvIYjjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84904065"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="84904065"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 23:49:17 -0800
X-CSE-ConnectionGUID: M47PvQjgTCWvuPAt8PHv6A==
X-CSE-MsgGUID: XwdnvFvPTRyoCTuGUUCRQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="215589961"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2026 23:49:16 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwy1h-000000000ap-415e;
	Mon, 02 Mar 2026 07:49:13 +0000
Date: Mon, 02 Mar 2026 15:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 4/14]
 arch/x86/include/asm/hardirq.h:70:62: error: 'IRQ_COUNT_TLB' undeclared; did
 you mean 'IRQ_COUNT_MAX'?
Message-ID: <202603021534.VtXyZfFF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   81f5ad552e6edb1dcf872e7c1f4ea54298056007
commit: aed686b8876eb9fd2978b066562ba4c72f6696ef [4/14] x86/irq: Make irqstats array based
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260302/202603021534.VtXyZfFF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021534.VtXyZfFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021534.VtXyZfFF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:598,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from arch/x86/mm/tlb.c:4:
   arch/x86/mm/tlb.c: In function 'flush_tlb_func':
>> arch/x86/include/asm/hardirq.h:70:62: error: 'IRQ_COUNT_TLB' undeclared (first use in this function); did you mean 'IRQ_COUNT_MAX'?
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
   arch/x86/mm/tlb.c:1147:17: note: in expansion of macro 'inc_irq_stat'
    1147 |                 inc_irq_stat(TLB);
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
   arch/x86/mm/tlb.c:1147:17: note: in expansion of macro 'inc_irq_stat'
    1147 |                 inc_irq_stat(TLB);
         |                 ^~~~~~~~~~~~
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
                    from arch/x86/events/amd/core.c:2:
   arch/x86/events/amd/core.c: In function 'amd_pmu_v2_handle_irq':
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
   arch/x86/events/amd/core.c:1035:9: note: in expansion of macro 'inc_irq_stat'
    1035 |         inc_irq_stat(APIC_PERF);
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
   arch/x86/events/amd/core.c:1035:9: note: in expansion of macro 'inc_irq_stat'
    1035 |         inc_irq_stat(APIC_PERF);
         |         ^~~~~~~~~~~~


vim +70 arch/x86/include/asm/hardirq.h

    69	
  > 70	#define inc_irq_stat(index)	this_cpu_inc(irq_stat.counts[IRQ_COUNT_##index])
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
