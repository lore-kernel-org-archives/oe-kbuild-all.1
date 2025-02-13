Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC124227EB4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739449351; cv=none; b=mP2w4q0YQaNkR5vTpn1EGFgdG7JlOtMOMcU2PJGg8T4H5pM86b/9WAF12wjedAJn/V/D5HdIPWD38+A+98TSy2SGTwpgKU+S+QeQOKkbkiOMTVXMmD8e0y3QYGvct55W0t7/E0Wt7xGWnkJmikOPkE6ockcTnGBoMFo6yvrQvAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739449351; c=relaxed/simple;
	bh=lUhxwF4L1i4ZvAiMDnEbfuX312eaIg0xAzSMoYXFVYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tQSRclkeGRwunZR+HZCIZK3inz+HZcbU/bhWwGeiLFr2Dobfk2uXYJNI/GvPBeb805uVdbvYmd913dA9LmfKbEzFLcaFro5p+4Rlu/yzT0zrZjmyb2WFuDV5EMx9D4hv5GBgK4Nj5RV34gcXUd9hqVMuGcA0lPBshzpRnBDfgMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1g2Gdiu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1g2Gdiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739449349; x=1770985349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lUhxwF4L1i4ZvAiMDnEbfuX312eaIg0xAzSMoYXFVYM=;
  b=R1g2GdiuvVdJQOc4Eh3mH0XSpL9Tk/S1PofoU7ETyCd59TS2U1+ktD4+
   gWkdrpkZrs5dFALprhpxvuk21tPtA8yFH5ifF/p9LMtslDG6X5mr4s6le
   grX8goL6TuSSCBdxYt2KSJ0sKXagQkvftU9fwmYH8amL6OyGNFji6O16L
   XNP+w2hm9+XWyFeUfblVsDvlXtRUxWO60Vn8fGdGP0fI9GEbqqN7hFJPj
   7coV/I2Lzjl2w2WKERyuWLi5KfOZL9hx24QXBkEF9D9O+xgVXuIXghbPZ
   6CVXWcdRWYYXg7gWxsndTSiMN8nOS5hbd83yHuE0E+qX3wsYBZjgSteqs
   Q==;
X-CSE-ConnectionGUID: zi0zijgNRriFaZuPAgTPvw==
X-CSE-MsgGUID: sImNZQXdRcmilnyR/HMdtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43916189"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="43916189"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 04:22:28 -0800
X-CSE-ConnectionGUID: 55+KXmyhRTm7hdrXBMQflg==
X-CSE-MsgGUID: +/2VaWhTQhOk7TnQhwY8nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112965160"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2025 04:22:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiYEa-00171T-35;
	Thu, 13 Feb 2025 12:22:24 +0000
Date: Thu, 13 Feb 2025 20:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:time_stats_sched 62/63]
 include/uapi/linux/bits.h:9:19: warning: right shift count >= width of type
Message-ID: <202502132010.skykaB4f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs time_stats_sched
head:   d9b1e57f3b38d16fdd7177f3b9636dcbb4c749ed
commit: d88e92952e4e9a1f2a3c82712dec611043885ab1 [62/63] trace_sched_wakeup_backtrace
config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250213/202502132010.skykaB4f-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502132010.skykaB4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502132010.skykaB4f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:7,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/cmpxchg.h:9,
                    from arch/riscv/include/asm/barrier.h:14,
                    from include/linux/list.h:11,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
   kernel/sched/core.c: In function 'try_to_wake_up':
>> include/uapi/linux/bits.h:9:19: warning: right shift count >= width of type [-Wshift-count-overflow]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:32:32: note: in expansion of macro 'GENMASK'
      32 |                 ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)   \
         |                                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:74:17: note: in expansion of macro '__arch_xchg_masked'
      74 |                 __arch_xchg_masked(sc_sfx, ".b" swap_sfx,               \
         |                 ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:108:9: note: in expansion of macro '_arch_xchg'
     108 |         _arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
         |         ^~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/core.c:4226:28: note: in expansion of macro 'xchg'
    4226 |             (sleep_start = xchg(&p->sleep_timestamp, 0)))
         |                            ^~~~
>> include/uapi/linux/bits.h:9:19: warning: right shift count >= width of type [-Wshift-count-overflow]
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^~
   include/linux/bits.h:34:38: note: in expansion of macro '__GENMASK'
      34 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:32:32: note: in expansion of macro 'GENMASK'
      32 |                 ulong __mask = GENMASK(((sizeof(*p)) * BITS_PER_BYTE) - 1, 0)   \
         |                                ^~~~~~~
   arch/riscv/include/asm/cmpxchg.h:79:17: note: in expansion of macro '__arch_xchg_masked'
      79 |                 __arch_xchg_masked(sc_sfx, ".h" swap_sfx,               \
         |                 ^~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/cmpxchg.h:108:9: note: in expansion of macro '_arch_xchg'
     108 |         _arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
         |         ^~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/sched/core.c:4226:28: note: in expansion of macro 'xchg'
    4226 |             (sleep_start = xchg(&p->sleep_timestamp, 0)))
         |                            ^~~~
   kernel/sched/core.c: Assembler messages:
   kernel/sched/core.c:4226: Error: unrecognized opcode `amoswap.d.aqrl a4,a4,0(a3)'


vim +9 include/uapi/linux/bits.h

3c7a8e190bc580 Paolo Bonzini 2023-12-12   6  
3c7a8e190bc580 Paolo Bonzini 2023-12-12   7  #define __GENMASK(h, l) \
3c7a8e190bc580 Paolo Bonzini 2023-12-12   8          (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
3c7a8e190bc580 Paolo Bonzini 2023-12-12  @9           (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
3c7a8e190bc580 Paolo Bonzini 2023-12-12  10  

:::::: The code at line 9 was first introduced by commit
:::::: 3c7a8e190bc580813ddd9259f62971c8d2a6b5ad uapi: introduce uapi-friendly macros for GENMASK

:::::: TO: Paolo Bonzini <pbonzini@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
