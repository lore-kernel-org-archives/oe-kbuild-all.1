Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1622772D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 21:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765747852; cv=none; b=buwAHrRNGk7hL3wTlQVdXue6I5zyjqR/rSOXyMsFr2a64QeRpXEteuXZZHhO9qaXxe+Qj3yjeFKighCK8DBb3xoav7dI4+QOlJcRVX9jIsYy2PywOAhLYAV2a/Hg/YnzC1tFrcDBHQzJuI7nQIxyLn4lu0N7c9TW2P6tmx7OHjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765747852; c=relaxed/simple;
	bh=9Tr+uMNCJ7dYWNPOvgl7EasrdfkYMNdfqrm+0uwQfI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNQ8nI33Tpd471Ns0T+nU7Hsm6WOFvRZekG9kfkDliczBH3FG7dwaiwyXXWRPFypVLLFyk2qN1o7L6/U9hc0WxnSsODO9mwSWyCYRqL58gYXtI0lfw5ay0bLJ5r8b7sDPj7Jvg3ezuNdqPXy9O/Ty2s1oS5WEmPDzz+xcO4bRWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DL+KKE/m; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DL+KKE/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765747851; x=1797283851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Tr+uMNCJ7dYWNPOvgl7EasrdfkYMNdfqrm+0uwQfI0=;
  b=DL+KKE/mh3zgvX7FhzsJUJ2B8C77q7O+6hies6AJs9x1cfhwdt/GeYTE
   rDBilcMhATn04Fyep416qoxzSTLKf/SBVhRuCEg/iSJrQAgBB9+ioeDzK
   wvVNem31aQwBaYDc0tVbTasTD6NIb9hfKaolefEDSJ/qADwoo1qUF8ILT
   awdqyw9VDCn8Db3VK1AabAnsgb26PxLeiyFZdduxZgpmj79726Gsx1Efx
   UOn3Mk+yZSxcIqPnQ7WQU5m81GWgV5JIHHyxPv5M5O7sruT6brNHFV9w1
   VmjQXbHKF/b1XspXTviz1g5gHwwE1xcSphD3WVeVTMuUDdQHqQS0mGEnh
   Q==;
X-CSE-ConnectionGUID: 63gH1a8aTQ6XnhRQlGbwHw==
X-CSE-MsgGUID: xWpr+lPERtCkXRbbE4sq1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="71508264"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="71508264"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 13:30:50 -0800
X-CSE-ConnectionGUID: 97KRI7RyQn2eZ6VA1dE3FQ==
X-CSE-MsgGUID: /8Wu/UgVQMyGdKW9qPcfRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228222127"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2025 13:30:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUtfy-000000002TU-445d;
	Sun, 14 Dec 2025 21:30:46 +0000
Date: Sun, 14 Dec 2025 22:30:02 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 1/3] libbpf.c:7842:16: error: nested
 extern declaration of 'BIT'
Message-ID: <202512142235.OE13xyiR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux coroutine/base
head:   3d1468dcf813bc71d425b7ce656a6877d98684e9
commit: cca61fab89ddd68516451ea9e37c8533cfc8cf71 [1/3] Basic pass
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20251214/202512142235.OE13xyiR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512142235.OE13xyiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512142235.OE13xyiR-lkp@intel.com/

All errors (new ones prefixed by >>):

   libbpf.c: In function 'coro_reg_bit':
   libbpf.c:7842:16: error: implicit declaration of function 'BIT' [-Werror=implicit-function-declaration]
    7842 |         return BIT(reg - BPF_REG_6);
         |                ^~~
>> libbpf.c:7842:16: error: nested extern declaration of 'BIT' [-Werror=nested-externs]
   libbpf.c: In function 'coro_stack_slot':
>> libbpf.c:7870:29: error: implicit declaration of function 'BIT_ULL' [-Werror=implicit-function-declaration]
    7870 |         live->stack_mask |= BIT_ULL(slot);
         |                             ^~~~~~~
   libbpf.c:7870:29: error: nested extern declaration of 'BIT_ULL' [-Werror=nested-externs]
   libbpf.c: In function 'append_coro_save':
   libbpf.c:8012:17: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
    8012 |                 int stack_off = -(int)(CORO_SLOT_SIZE * (slot + 1));
         |                 ^~~
   In file included from libbpf.c:33:
   libbpf.c:8015:45: error: 'BPF_REG_AX' undeclared (first use in this function); did you mean 'BPF_REG_A'?
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
   libbpf.c:8194:17: error: attempt to use poisoned "s64"
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
   make[6]: *** [tools/build/Makefile.build:85: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o] Error 1
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [Makefile:152: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2
   make[5]: Target 'tools/bpf/resolve_btfids/libbpf/libbpf.a' not remade because of errors.
   make[4]: *** [Makefile:61: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:76: bpf/resolve_btfids] Error 2
   make[2]: *** [Makefile:1461: tools/bpf/resolve_btfids] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
