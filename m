Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC1A3161B3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 18:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764786506; cv=none; b=j45kCPdgIzflfYhmX73/Mnii9GBYb42TI3Kq/dureqPjH6Oy+qfKjbaxe4TN2J/sq/Bwf0TEimt6ku4MFKoPDbzHiSToOV2MctyMne8KW4NYDA1S0HMxNlx6xuaHOCjes4cunM8wo2I91t5MRIwZbariRDABJ5hMPSXpAzVa9Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764786506; c=relaxed/simple;
	bh=s/9qlO7/u7PxzT5ZWxol0nwK3UfXy47mb63HOMRXcqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dJaY5QpDXwM0WIGyoS/7MQ5qg5eg7oc2Dkl3tVfUlFQCHwhGzauqX9GRjuyStv918xWoqls5ogMtCDry6okEkFPlJAnieJw7OICdeqBwcElguIylgd5pGmwrfkmm5YeVq2DO1h3dGXzMlhXD9S+GAKCpxiJIVZWLP/Ww4Fmtbd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mu5KBgCe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mu5KBgCe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764786504; x=1796322504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/9qlO7/u7PxzT5ZWxol0nwK3UfXy47mb63HOMRXcqg=;
  b=mu5KBgCetSKknWcKN6Sjt6D5/t6KvHHs7PLwnhtBXOYz8CAdj+CiWDbX
   7GkMHItv9rv+bAju03C3KohBjif5ooaw71LtQE/9RWnEjbKMhRgP2/p8T
   ObdIeX0FHswE0VUaD9JKwFwLJvGEPcrHZmA2TkPqal8CFh4Fn0p+BvAlZ
   Y9U1qLp3pQK/h3kvbT64ECQtsv5weoeHH/BgPv26NNJa2GUzaQLq4EeVy
   eY79U01wrc1+DlKit17RB4eKsvuHcwmwiDUppP2vIfzEeFfXsvJLJVpsz
   p+YeHrVSQ+L1HfQ2CNXgVIgYHw3QXdbTJBvuATkWEo0ru5jySN/nO+pmd
   A==;
X-CSE-ConnectionGUID: SmHcbyEVRba4PfwdTS0KwQ==
X-CSE-MsgGUID: 5Sb4Tpd9QZC/z0OiRBC/7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77900467"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="77900467"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 10:28:23 -0800
X-CSE-ConnectionGUID: 53xltkynTC2Anbtl+SOe9w==
X-CSE-MsgGUID: sNdmSbA+QOWpnaW9bExh7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="195565436"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Dec 2025 10:28:22 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQraO-00000000Cx9-1GgM;
	Wed, 03 Dec 2025 18:28:20 +0000
Date: Thu, 4 Dec 2025 02:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 1/1] libbpf.c:7842:16: error: implicit
 declaration of function 'BIT'
Message-ID: <202512040226.An2L3ZDd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux coroutine/base
head:   62b213e3013e4604001d012307697bdefd018582
commit: 62b213e3013e4604001d012307697bdefd018582 [1/1] Basic pass
config: sparc-randconfig-001-20251203 (https://download.01.org/0day-ci/archive/20251204/202512040226.An2L3ZDd-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040226.An2L3ZDd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040226.An2L3ZDd-lkp@intel.com/

All errors (new ones prefixed by >>):

   libbpf.c: In function 'coro_reg_bit':
>> libbpf.c:7842:16: error: implicit declaration of function 'BIT' [-Werror=implicit-function-declaration]
    7842 |         return BIT(reg - BPF_REG_6);
         |                ^~~
>> libbpf.c:7842:16: error: nested extern declaration of 'BIT' [-Werror=nested-externs]
   libbpf.c: In function 'coro_stack_slot':
>> libbpf.c:7870:29: error: implicit declaration of function 'BIT_ULL' [-Werror=implicit-function-declaration]
    7870 |         live->stack_mask |= BIT_ULL(slot);
         |                             ^~~~~~~
>> libbpf.c:7870:29: error: nested extern declaration of 'BIT_ULL' [-Werror=nested-externs]
   libbpf.c: In function 'append_coro_save':
>> libbpf.c:8012:17: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    8012 |                 int stack_off = -(int)(CORO_SLOT_SIZE * (slot + 1));
         |                 ^~~
   In file included from libbpf.c:33:
>> libbpf.c:8015:45: error: 'BPF_REG_AX' undeclared (first use in this function); did you mean 'BPF_REG_A'?
    8015 |                         BPF_LDX_MEM(BPF_DW, BPF_REG_AX, BPF_REG_10, stack_off),
         |                                             ^~~~~~~~~~
   tools/include/linux/filter.h:175:28: note: in definition of macro 'BPF_LDX_MEM'
     175 |                 .dst_reg = DST,                                 \
         |                            ^~~
   libbpf.c:8015:45: note: each undeclared identifier is reported only once for each function it appears in
    8015 |                         BPF_LDX_MEM(BPF_DW, BPF_REG_AX, BPF_REG_10, stack_off),
         |                                             ^~~~~~~~~~
   tools/include/linux/filter.h:175:28: note: in definition of macro 'BPF_LDX_MEM'
     175 |                 .dst_reg = DST,                                 \
         |                            ^~~
   libbpf.c: In function 'append_coro_restore':
   libbpf.c:8047:17: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    8047 |                 int stack_off = -(int)(CORO_SLOT_SIZE * (slot + 1));
         |                 ^~~
   libbpf.c:8050:45: error: 'BPF_REG_AX' undeclared (first use in this function); did you mean 'BPF_REG_A'?
    8050 |                         BPF_LDX_MEM(BPF_DW, BPF_REG_AX, BPF_REG_0, ctx_off),
         |                                             ^~~~~~~~~~
   tools/include/linux/filter.h:175:28: note: in definition of macro 'BPF_LDX_MEM'
     175 |                 .dst_reg = DST,                                 \
         |                            ^~~
   libbpf.c: In function 'bpf_program_transform_coro':
   libbpf.c:8150:9: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    8150 |         size_t point_idx = 0;
         |         ^~~~~~
>> libbpf.c:8192:17: error: attempt to use poisoned "u8"
    8192 |                 u8 class = BPF_CLASS(orig_insn->code);
         |                 ^
   In file included from libbpf.c:53:
   libbpf_internal.h:38:20: note: poisoned here
      38 | #pragma GCC poison u8 u16 u32 u64 s8 s16 s32 s64
         |                    ^~
   libbpf.c:8193:17: error: attempt to use poisoned "u8"
    8193 |                 u8 opcode = BPF_OP(orig_insn->code);
         |                 ^
   libbpf_internal.h:38:20: note: poisoned here
      38 | #pragma GCC poison u8 u16 u32 u64 s8 s16 s32 s64
         |                    ^~
>> libbpf.c:8194:17: error: attempt to use poisoned "s64"
    8194 |                 s64 new_off, target;
         |                 ^
   libbpf_internal.h:38:46: note: poisoned here
      38 | #pragma GCC poison u8 u16 u32 u64 s8 s16 s32 s64
         |                                              ^~~
   libbpf.c:8202:35: error: attempt to use poisoned "s64"
    8202 |                         target = (s64)i + orig_insn->imm + 1;
         |                                   ^
   libbpf_internal.h:38:46: note: poisoned here
      38 | #pragma GCC poison u8 u16 u32 u64 s8 s16 s32 s64
         |                                              ^~~
   libbpf.c:8207:36: error: attempt to use poisoned "s64"
    8207 |                         new_off = (s64)orig_start[target] - (s64)orig_loc[i] - 1;
         |                                    ^
   libbpf_internal.h:38:46: note: poisoned here
      38 | #pragma GCC poison u8 u16 u32 u64 s8 s16 s32 s64
         |                                              ^~~
   libbpf.c:8207:62: error: attempt to use poisoned "s64"
    8207 |                         new_off = (s64)orig_start[target] - (s64)orig_loc[i] - 1;
         |                                                              ^
   libbpf_internal.h:38:46: note: poisoned here
      38 | #pragma GCC poison u8 u16 u32 u64 s8 s16 s32 s64
         |                                              ^~~
   libbpf.c:8215:27: error: attempt to use poisoned "s64"
    8215 |                 target = (s64)i + orig_insn->off + 1;
         |                           ^
   libbpf_internal.h:38:46: note: poisoned here
      38 | #pragma GCC poison u8 u16 u32 u64 s8 s16 s32 s64
         |                                              ^~~
   libbpf.c:8221:28: error: attempt to use poisoned "s64"
    8221 |                 new_off = (s64)orig_start[target] - (s64)orig_loc[i] - 1;
         |                            ^
   libbpf_internal.h:38:46: note: poisoned here
      38 | #pragma GCC poison u8 u16 u32 u64 s8 s16 s32 s64
         |                                              ^~~
   libbpf.c:8221:54: error: attempt to use poisoned "s64"
    8221 |                 new_off = (s64)orig_start[target] - (s64)orig_loc[i] - 1;
         |                                                      ^
   libbpf_internal.h:38:46: note: poisoned here
      38 | #pragma GCC poison u8 u16 u32 u64 s8 s16 s32 s64
         |                                              ^~~
   cc1: all warnings being treated as errors
   make[6]: *** [tools/build/Makefile.build:85: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o] Error 1 shuffle=1954080873
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [Makefile:152: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2 shuffle=1954080873
   make[5]: Target 'tools/bpf/resolve_btfids/libbpf/libbpf.a' not remade because of errors.
   make[4]: *** [Makefile:61: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2 shuffle=1954080873
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:76: bpf/resolve_btfids] Error 2 shuffle=1954080873
   make[2]: *** [Makefile:1449: tools/bpf/resolve_btfids] Error 2 shuffle=1954080873
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1954080873
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1954080873
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
