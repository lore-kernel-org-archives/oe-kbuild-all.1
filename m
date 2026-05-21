Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE12F3C3459
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 11:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363189; cv=none; b=fQ3zOishe+xx3UuolG5U+42vVYgwzySyIkAKqKDe4V7z7U2VOgg4i2CBRP6g18vwFJYxeYOwTF69HPxB4UnpXzxSgDcuUe/3qde9XH0OlIz56Q0C4lwbSwYVp3MT3WIQBo6czt08h8NDRxRl6IhlQ+8BE0+E1pyYg66jBkscots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363189; c=relaxed/simple;
	bh=u4+rBy2MtM+SvClDAE0iAwj6vreNJPFl+wy3sxAGiqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XJSQnMWQIp55v8Hs/WxPdSavpFAP7UNxAEiLiaEVrz0qqWLU1jcr7Mn4ZceqiSlauhA6Oxv+a1IlBhFuTAIwRKHNwUwvvHc2FLsYmeuWDltTbIT3sGj/OUxKe8UemJjrRV41ihWfIUibSy440RQLqRfsyQZrZI3M6tlmHeY/Fu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mq3SOAVd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mq3SOAVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779363188; x=1810899188;
  h=date:from:to:cc:subject:message-id;
  bh=u4+rBy2MtM+SvClDAE0iAwj6vreNJPFl+wy3sxAGiqo=;
  b=Mq3SOAVdXsQMHfagaQo2pNWnlAjJ2O97g1CNvQD9wklTTBWWZL0iTUSy
   w2+mbhRX61kHpb5Q+cLBeblyuwZ7QNcAr0PULstf5maRRFYy7p4d8Ukya
   oigLjBmTRx2+TVd1e/ONDTUyh5bcLE6Rmf314VaUpfcGT90oLXIMswHb4
   j9sjGAMqg2AX00Kl866VJE6FB5Apw9zMcd8quDraDGvGJmYcKGU5e9dR0
   LPJlVztPu0ZHrb3UKI/1q+LkF1GrKni8Wzw1P76CisG2MdLfnrNaQsv+x
   eCatY5v4Lj+LXgi45lEpiFnBTHxO+r51Z6oPBpWvAYaJ9uAR4DfVvw+Mf
   A==;
X-CSE-ConnectionGUID: mzxt749AR4aOQRmzeyDkJw==
X-CSE-MsgGUID: 2HJstk63QKKQ2aWoigyFww==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90576139"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90576139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:33:05 -0700
X-CSE-ConnectionGUID: V/s9K/jNR0ergZK8L6uQ5A==
X-CSE-MsgGUID: Xr2gCfeDSamnzycDsPZeaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="236250096"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2026 04:33:04 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ1e9-000000000Cx-2Frd;
	Thu, 21 May 2026 11:33:01 +0000
Date: Thu, 21 May 2026 19:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 7/1130]
 include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs'
 address space pointer from disjoint generic address space pointer
Message-ID: <202605211955.SnyKLbHn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: a3571108d31b71f7c3975b42cb9facfb619e98ec [7/1130] cheri: net: Fix xt_counters for CHERI
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260521/202605211955.SnyKLbHn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211955.SnyKLbHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211955.SnyKLbHn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from arch/x86/include/asm/percpu.h:597,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:12,
                    from arch/x86/include/asm/ptrace.h:175,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/skbuff.h:15,
                    from net/core/flow_dissector.c:3:
   include/linux/netfilter/x_tables.h: In function 'xt_get_this_cpu_counter':
>> include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                                     ^
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/netfilter/x_tables.h:426:24: note: in expansion of macro 'this_cpu_ptr'
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                        ^~~~~~~~~~~~
   In file included from include/linux/compiler_types.h:179,
                    from <command-line>:
>> include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                                     ^
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:253:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:426:24: note: in expansion of macro 'this_cpu_ptr'
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                        ^~~~~~~~~~~~
>> include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                                     ^
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:253:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:426:24: note: in expansion of macro 'this_cpu_ptr'
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                        ^~~~~~~~~~~~
>> include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                                     ^
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:253:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:426:24: note: in expansion of macro 'this_cpu_ptr'
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                        ^~~~~~~~~~~~
>> include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                                     ^
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:253:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:426:24: note: in expansion of macro 'this_cpu_ptr'
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                        ^~~~~~~~~~~~
   include/linux/netfilter/x_tables.h: In function 'xt_get_per_cpu_counter':
   include/linux/netfilter/x_tables.h:435:36: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                                    ^
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/netfilter/x_tables.h:435:24: note: in expansion of macro 'per_cpu_ptr'
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                        ^~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:36: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                                    ^
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:24: note: in expansion of macro 'per_cpu_ptr'
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                        ^~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:36: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                                    ^
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:24: note: in expansion of macro 'per_cpu_ptr'
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                        ^~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:36: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                                    ^
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:24: note: in expansion of macro 'per_cpu_ptr'
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                        ^~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:36: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                                    ^
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:24: note: in expansion of macro 'per_cpu_ptr'
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                        ^~~~~~~~~~~
--
   In file included from include/asm-generic/percpu.h:7,
                    from arch/x86/include/asm/percpu.h:597,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:12,
                    from arch/x86/include/asm/ptrace.h:175,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/netfilter/x_tables.c:14:
   include/linux/netfilter/x_tables.h: In function 'xt_get_this_cpu_counter':
>> include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                                     ^
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/netfilter/x_tables.h:426:24: note: in expansion of macro 'this_cpu_ptr'
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                        ^~~~~~~~~~~~
   In file included from include/linux/compiler_types.h:179,
                    from <command-line>:
>> include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                                     ^
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:253:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:426:24: note: in expansion of macro 'this_cpu_ptr'
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                        ^~~~~~~~~~~~
>> include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                                     ^
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:253:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:426:24: note: in expansion of macro 'this_cpu_ptr'
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                        ^~~~~~~~~~~~
>> include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                                     ^
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:253:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:426:24: note: in expansion of macro 'this_cpu_ptr'
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                        ^~~~~~~~~~~~
>> include/linux/netfilter/x_tables.h:426:37: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                                     ^
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:253:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     253 |         SHIFT_PERCPU_PTR(ptr, my_cpu_offset);                           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:426:24: note: in expansion of macro 'this_cpu_ptr'
     426 |                 return this_cpu_ptr((void __percpu *)cnt->percpu);
         |                        ^~~~~~~~~~~~
   include/linux/netfilter/x_tables.h: In function 'xt_get_per_cpu_counter':
   include/linux/netfilter/x_tables.h:435:36: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                                    ^
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/netfilter/x_tables.h:435:24: note: in expansion of macro 'per_cpu_ptr'
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                        ^~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:36: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                                    ^
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:24: note: in expansion of macro 'per_cpu_ptr'
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                        ^~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:36: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                                    ^
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:24: note: in expansion of macro 'per_cpu_ptr'
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                        ^~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:36: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                                    ^
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:24: note: in expansion of macro 'per_cpu_ptr'
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                        ^~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:36: warning: cast to '__seg_fs' address space pointer from disjoint generic address space pointer
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                                    ^
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   include/linux/netfilter/x_tables.h:435:24: note: in expansion of macro 'per_cpu_ptr'
     435 |                 return per_cpu_ptr((void __percpu *)cnt->percpu, cpu);
         |                        ^~~~~~~~~~~
   net/netfilter/x_tables.c: In function 'xt_percpu_counter_alloc':
>> net/netfilter/x_tables.c:1939:27: warning: cast to generic address space pointer from disjoint '__seg_fs' address space pointer
    1939 |         counter->percpu = (void * __force)(state->mem + state->off);
         |                           ^


vim +/__seg_fs +426 include/linux/netfilter/x_tables.h

   421	
   422	static inline struct xt_counters *
   423	xt_get_this_cpu_counter(struct xt_counters *cnt)
   424	{
   425		if (nr_cpu_ids > 1)
 > 426			return this_cpu_ptr((void __percpu *)cnt->percpu);
   427	
   428		return cnt;
   429	}
   430	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
