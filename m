Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EEBDF6C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769959; cv=none; b=ImlFwV5MUzsXyIzRDidk3JuAfl/9GXlhj2gI3AEckQjef9l5nXnb4qnFPcFom8F5qGFuMDrMvgkjH3qodjDPQVv2iNvAWSfcy9O8u2jvdx/7oSkHplh39T/Y2mSPwJ3eq7ZA/f2dAUEbSfdJ4VYuiSrgLnCaUK6WvqBwgWwMrtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769959; c=relaxed/simple;
	bh=SeGBbJz+RtRbYJ1bOtRmYM2cmMiZiXiXmbalH/HmS2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WImj9RbZQdpl311ERjtG+0xe7ut7LB2xEQT5Fa2d6KhTsc/UqUpvDN3RDA+SvC0PUPEaQbQWRA+YkReFSxKWQ0yiJUz4XrdnY7c4FTmWKlyyenl72ZttkujiieikscGJPvmPGapXvLhNXg9jABbQuqCfcQ5bmXbedy+FTC3agoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZIE83sB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZIE83sB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764769958; x=1796305958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SeGBbJz+RtRbYJ1bOtRmYM2cmMiZiXiXmbalH/HmS2w=;
  b=PZIE83sBcTdEf9M8pLc5buXtCCGs0Kh54EBEDHngyNzw693ASm8QaHUz
   AmIBdSjZOFvIJVfP+jBF54rw7K1wFBSVxl/Nzgmh4LHYfgMAJsRAjLFot
   2fW6eNJyJkuIq1qnpWrgC2ui9rP3gJ3Lf/xQ8bVAzAT1L4miaevo3f9Ge
   tHp9d/DL2EQeKiji/0EQfl4len3WUsdSodexfnCV1eaIwse3Yf7BYOnD+
   tLEWK3/sTT8ICTVQ49nS9cgpO7OHy++eWuA0Hu06Vn8deskcOliJ+XFiI
   jGSeZf1144xEiWqgo9uv0nVDDMbM8//rQaoxbiGG/XFn6SNhhIWa9uG8B
   Q==;
X-CSE-ConnectionGUID: e9Os3XfoT/ur2u3c2D+9rg==
X-CSE-MsgGUID: Nj9g3NXXRvGPDmzmXTOIHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70377695"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="70377695"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 05:52:38 -0800
X-CSE-ConnectionGUID: sdCdnEJzRTu9hz367bVvHA==
X-CSE-MsgGUID: iDRiXAEfT5S4JzM7d++Maw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="194782613"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Dec 2025 05:52:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQnHW-00000000B1c-0Mrb;
	Wed, 03 Dec 2025 13:52:34 +0000
Date: Wed, 3 Dec 2025 21:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 1/1] libbpf.c:7842:9: error: implicit
 declaration of function 'BIT'
Message-ID: <202512032115.1SawB9K5-lkp@intel.com>
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
config: arm64-randconfig-002-20251203 (https://download.01.org/0day-ci/archive/20251203/202512032115.1SawB9K5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512032115.1SawB9K5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512032115.1SawB9K5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> libbpf.c:7842:9: error: implicit declaration of function 'BIT' [-Werror,-Wimplicit-function-declaration]
    7842 |         return BIT(reg - BPF_REG_6);
         |                ^
>> libbpf.c:7870:22: error: implicit declaration of function 'BIT_ULL' [-Werror,-Wimplicit-function-declaration]
    7870 |         live->stack_mask |= BIT_ULL(slot);
         |                             ^
   libbpf.c:7931:26: error: implicit declaration of function 'BIT_ULL' [-Werror,-Wimplicit-function-declaration]
    7931 |                                 live->stack_mask &= ~BIT_ULL(slot);
         |                                                      ^
   libbpf.c:7951:26: error: implicit declaration of function 'BIT_ULL' [-Werror,-Wimplicit-function-declaration]
    7951 |                                 live->stack_mask &= ~BIT_ULL(slot);
         |                                                      ^
   libbpf.c:8010:22: error: implicit declaration of function 'BIT_ULL' [-Werror,-Wimplicit-function-declaration]
    8010 |                 if (!(stack_mask & BIT_ULL(slot)))
         |                                    ^
>> libbpf.c:8015:24: error: use of undeclared identifier 'BPF_REG_AX'
    8015 |                         BPF_LDX_MEM(BPF_DW, BPF_REG_AX, BPF_REG_10, stack_off),
         |                                             ^
   libbpf.c:8016:35: error: use of undeclared identifier 'BPF_REG_AX'
    8016 |                         BPF_STX_MEM(BPF_DW, BPF_REG_0, BPF_REG_AX, ctx_off),
         |                                                        ^
>> libbpf.c:8019:46: error: invalid application of 'sizeof' to an incomplete type 'struct bpf_insn[]'
    8019 |                 err = append_insns(insns, cnt, cap, spill, ARRAY_SIZE(spill));
         |                                                            ^~~~~~~~~~~~~~~~~
   tools/include/linux/kernel.h:91:32: note: expanded from macro 'ARRAY_SIZE'
      91 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
>> libbpf.c:8012:7: error: mixing declarations and code is a C99 extension [-Werror,-Wdeclaration-after-statement]
    8012 |                 int stack_off = -(int)(CORO_SLOT_SIZE * (slot + 1));
         |                     ^
>> libbpf.c:7989:13: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
    7989 |                                          (1ULL << CORO_STACK_SLOTS) - 1)
         |                                                ^  ~~~~~~~~~~~~~~~~
   libbpf.c:8045:22: error: implicit declaration of function 'BIT_ULL' [-Werror,-Wimplicit-function-declaration]
    8045 |                 if (!(stack_mask & BIT_ULL(slot)))
         |                                    ^
   libbpf.c:8050:24: error: use of undeclared identifier 'BPF_REG_AX'
    8050 |                         BPF_LDX_MEM(BPF_DW, BPF_REG_AX, BPF_REG_0, ctx_off),
         |                                             ^
   libbpf.c:8051:36: error: use of undeclared identifier 'BPF_REG_AX'
    8051 |                         BPF_STX_MEM(BPF_DW, BPF_REG_10, BPF_REG_AX, stack_off),
         |                                                         ^
   libbpf.c:8054:45: error: invalid application of 'sizeof' to an incomplete type 'struct bpf_insn[]'
    8054 |                 err = append_insns(insns, cnt, cap, fill, ARRAY_SIZE(fill));
         |                                                           ^~~~~~~~~~~~~~~~
   tools/include/linux/kernel.h:91:32: note: expanded from macro 'ARRAY_SIZE'
      91 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   libbpf.c:8047:7: error: mixing declarations and code is a C99 extension [-Werror,-Wdeclaration-after-statement]
    8047 |                 int stack_off = -(int)(CORO_SLOT_SIZE * (slot + 1));
         |                     ^
   libbpf.c:8034:13: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
    8034 |                                          (1ULL << CORO_STACK_SLOTS) - 1)
         |                                                ^  ~~~~~~~~~~~~~~~~
>> libbpf.c:8192:3: error: attempt to use a poisoned identifier
    8192 |                 u8 class = BPF_CLASS(orig_insn->code);
         |                 ^
   libbpf.c:8193:3: error: attempt to use a poisoned identifier
    8193 |                 u8 opcode = BPF_OP(orig_insn->code);
         |                 ^
   libbpf.c:8194:3: error: attempt to use a poisoned identifier
    8194 |                 s64 new_off, target;
         |                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
   make[6]: *** [tools/build/Makefile.build:85: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o] Error 1 shuffle=2899571258
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [Makefile:152: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2 shuffle=2899571258
   make[5]: Target 'tools/bpf/resolve_btfids/libbpf/libbpf.a' not remade because of errors.
   make[4]: *** [Makefile:61: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2 shuffle=2899571258
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:76: bpf/resolve_btfids] Error 2 shuffle=2899571258
   make[2]: *** [Makefile:1449: tools/bpf/resolve_btfids] Error 2 shuffle=2899571258
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2899571258
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2899571258
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
