Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC21022D9F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 03:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771038006; cv=none; b=dHMHvWNlExwM45BxquXRi2lznIpJgA2hQWmaTRh0l5w6hLsgT9UX5I+4WuilpiJUSIV57WdgJ3MVsxeI94lpNvY35ddL9V4TYngL/eWku46TJt4sG5gfUq1pT36711dt10Y+m/zZU5CT6gnUCo8nUiKPgSzZW73COgpMi+3Nx8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771038006; c=relaxed/simple;
	bh=QCfazbWaBTLRX1hnsiu19DeqiHwehuf8UWdcsKhmX2c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lw0oZJEP/jRNLl0TiCPuLM9ajiI9Hg6xZ3CuD9/Ato6m5zCh0IB9LJAU88tBn0XqGhzxs+Ef78cG/fz9PLfqIhEyMDie8a8cgMTBG2AkUopTmkYbAziuNUaWJyuAbbPEAa+bFoRAh63K3k6pmegGGsOk2a0uZP0gj8dUJyb0sjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YH4ZDbB9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YH4ZDbB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771038005; x=1802574005;
  h=date:from:to:cc:subject:message-id;
  bh=QCfazbWaBTLRX1hnsiu19DeqiHwehuf8UWdcsKhmX2c=;
  b=YH4ZDbB9FiJse9JK5XW6iaJubDcRlHcGYZ35UEvHNp1bZQwk59LNftph
   8Q1Ol84U8bRRGfTpfCznFHtV7U86DbHuv7+sFZb5gzkzuftB1szVHNNQN
   AXuQVvD96G015r8QJPjNgEReaLTXJ/slrR3mgCevG/eMWsnhAOC65g8oA
   sCRo72eVCG0t4gjxFIpnsLVFrw0QDtG/W5qrJ+i6w4u1xmZqbjgin9YHO
   kNesC7AhJ6LbNE+iXzHEXYzA+JjCSfe1kcI6F+mqsxn6DywZhQTL6hfAa
   T0vWkdXlGHqMfNTgreKWXUjrMU68Ng/a5MhH40dOgvnF+H6vbt4Wv4iQA
   Q==;
X-CSE-ConnectionGUID: pjYAovtvRxCcY/f9t6O12Q==
X-CSE-MsgGUID: XPro3CSGSAma17C2bqABiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72124401"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72124401"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 19:00:04 -0800
X-CSE-ConnectionGUID: ALe/zt4xTeazfH/qjAixfQ==
X-CSE-MsgGUID: /lggqpmeSF25eTk0nSPm/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="243680556"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Feb 2026 19:00:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr5t1-00000000w5I-3Zqg;
	Sat, 14 Feb 2026 02:59:59 +0000
Date: Sat, 14 Feb 2026 10:59:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 5/15]
 arch/riscv/net/bpf_jit_comp64.c:1265:46: error: passing argument 3 of
 '__arch_prepare_bpf_trampoline' from incompatible pointer type
Message-ID: <202602141024.12ffvFZw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   3bb11e809e06ec473ee881de417d36f0d164f3fe
commit: 9d5c97a3c65fa6f74af1b36dcfdce91e0c2ab81c [5/15] bpf: Add struct bpf_tramp_node object
config: riscv-randconfig-001-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141024.12ffvFZw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141024.12ffvFZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141024.12ffvFZw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/net/bpf_jit_comp64.c: In function 'invoke_bpf_prog':
   arch/riscv/net/bpf_jit_comp64.c:936:7: error: 'struct bpf_tramp_link' has no member named 'cookie'
     if (l->cookie) {
          ^~
   arch/riscv/net/bpf_jit_comp64.c:937:24: error: 'struct bpf_tramp_link' has no member named 'cookie'
      emit_imm(RV_REG_T1, l->cookie, ctx);
                           ^~
   arch/riscv/net/bpf_jit_comp64.c: At top level:
   arch/riscv/net/bpf_jit_comp64.c:995:14: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
          struct bpf_tramp_links *tlinks,
                 ^~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c: In function '__arch_prepare_bpf_trampoline':
   arch/riscv/net/bpf_jit_comp64.c:1003:42: error: invalid use of undefined type 'struct bpf_tramp_links'
     struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
                                             ^
   arch/riscv/net/bpf_jit_comp64.c:1003:42: error: dereferencing pointer to incomplete type 'struct bpf_tramp_links'
   arch/riscv/net/bpf_jit_comp64.c:1004:41: error: invalid use of undefined type 'struct bpf_tramp_links'
     struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
                                            ^
   arch/riscv/net/bpf_jit_comp64.c:1005:44: error: invalid use of undefined type 'struct bpf_tramp_links'
     struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
                                               ^
   arch/riscv/net/bpf_jit_comp64.c:1151:16: warning: assignment to 'int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      branches_off = kcalloc(fmod_ret->nr_links, sizeof(int), GFP_KERNEL);
                   ^
   arch/riscv/net/bpf_jit_comp64.c: At top level:
   arch/riscv/net/bpf_jit_comp64.c:1256:16: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
            struct bpf_tramp_links *tlinks, void *func_addr)
                   ^~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1255:5: error: conflicting types for 'arch_bpf_trampoline_size'
    int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/net/bpf_jit_comp64.c:9:
   include/linux/bpf.h:1271:5: note: previous declaration of 'arch_bpf_trampoline_size' was here
    int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c: In function 'arch_bpf_trampoline_size':
>> arch/riscv/net/bpf_jit_comp64.c:1265:46: error: passing argument 3 of '__arch_prepare_bpf_trampoline' from incompatible pointer type [-Werror=incompatible-pointer-types]
     ret = __arch_prepare_bpf_trampoline(&im, m, tlinks, func_addr, flags, &ctx);
                                                 ^~~~~~
   arch/riscv/net/bpf_jit_comp64.c:995:31: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
          struct bpf_tramp_links *tlinks,
          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/riscv/net/bpf_jit_comp64.c: At top level:
   arch/riscv/net/bpf_jit_comp64.c:1282:23: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
        u32 flags, struct bpf_tramp_links *tlinks,
                          ^~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1280:5: error: conflicting types for 'arch_prepare_bpf_trampoline'
    int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/net/bpf_jit_comp64.c:9:
   include/linux/bpf.h:1264:5: note: previous declaration of 'arch_prepare_bpf_trampoline' was here
    int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image_end,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c: In function 'arch_prepare_bpf_trampoline':
   arch/riscv/net/bpf_jit_comp64.c:1297:45: error: passing argument 3 of '__arch_prepare_bpf_trampoline' from incompatible pointer type [-Werror=incompatible-pointer-types]
     ret = __arch_prepare_bpf_trampoline(im, m, tlinks, func_addr, flags, &ctx);
                                                ^~~~~~
   arch/riscv/net/bpf_jit_comp64.c:995:31: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
          struct bpf_tramp_links *tlinks,
          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/__arch_prepare_bpf_trampoline +1265 arch/riscv/net/bpf_jit_comp64.c

49b5e77ae3e214 Pu Lehui 2023-02-15  1254  
96d1b7c081c0c9 Song Liu 2023-12-06  1255  int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
96d1b7c081c0c9 Song Liu 2023-12-06  1256  			     struct bpf_tramp_links *tlinks, void *func_addr)
96d1b7c081c0c9 Song Liu 2023-12-06  1257  {
96d1b7c081c0c9 Song Liu 2023-12-06  1258  	struct bpf_tramp_image im;
96d1b7c081c0c9 Song Liu 2023-12-06  1259  	struct rv_jit_context ctx;
96d1b7c081c0c9 Song Liu 2023-12-06  1260  	int ret;
96d1b7c081c0c9 Song Liu 2023-12-06  1261  
96d1b7c081c0c9 Song Liu 2023-12-06  1262  	ctx.ninsns = 0;
96d1b7c081c0c9 Song Liu 2023-12-06  1263  	ctx.insns = NULL;
96d1b7c081c0c9 Song Liu 2023-12-06  1264  	ctx.ro_insns = NULL;
96d1b7c081c0c9 Song Liu 2023-12-06 @1265  	ret = __arch_prepare_bpf_trampoline(&im, m, tlinks, func_addr, flags, &ctx);
96d1b7c081c0c9 Song Liu 2023-12-06  1266  
96d1b7c081c0c9 Song Liu 2023-12-06  1267  	return ret < 0 ? ret : ninsns_rvoff(ctx.ninsns);
96d1b7c081c0c9 Song Liu 2023-12-06  1268  }
96d1b7c081c0c9 Song Liu 2023-12-06  1269  

:::::: The code at line 1265 was first introduced by commit
:::::: 96d1b7c081c0c96cbe8901045f4ff15a2e9974a2 bpf: Add arch_bpf_trampoline_size()

:::::: TO: Song Liu <song@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
