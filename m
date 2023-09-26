Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83967E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 05:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695704697; x=1727240697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I2MQsTM+LdcAjBxjpr7mI0TnQu/hJhLN9UzSKfF4a2U=;
  b=cJsykEtU1m0bTrVjVxER2j1Gqyr29bEmcQc7CdR8qz17EUgt+WOcsMLe
   5YqbtkyE6qMYqZaN7tzlIg63lPt5K0TGBq6WVMmXU456IMapO3YEhOx+O
   L2oHj+gawIQbiFpyAZTIf72db81qqxJ66zRC/9yCKfPOuujBu+EeseDU4
   os07d5dWk2h++IRzFnhXhvobBFzWvugujva2nR/Soyy3AsMZSiHxwgvh0
   xg5pkBtqGxtnJh200Ms+wP3Fa+w1eE3NZaOSTfCOSMYfCNXdhCN7cBa/D
   LKkJAab7kAU7HsWosSzvyrrEhGxgS5jMbNpOrR2L6jm/ccZk1jNdVMwzl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371818630"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="371818630"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 22:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995681179"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="995681179"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Sep 2023 22:04:56 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql0Fi-0002Rx-00;
	Tue, 26 Sep 2023 05:04:54 +0000
Date: Tue, 26 Sep 2023 13:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liu-song-6:bpf-tramp-to-prog-pack-test 405/428]
 arch/riscv/net/bpf_jit_comp64.c:1049:44: warning: passing argument 2 of
 'arch_bpf_trampoline_size' makes integer from pointer without a cast
Message-ID: <202309261358.o5cPscCI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/liu-song-6/linux.git bpf-tramp-to-prog-pack-test
head:   49175e9536aa1b8df9326f079e25985a72589d8a
commit: b75b5de71337f52a134a5434c1bacaa5fb536c93 [405/428] bpf: Add arch_bpf_trampoline_size()
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230926/202309261358.o5cPscCI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309261358.o5cPscCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309261358.o5cPscCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/net/bpf_jit_comp64.c: In function 'arch_bpf_trampoline_size':
   arch/riscv/net/bpf_jit_comp64.c:1036:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
    1036 |         ret = __arch_prepare_bpf_trampoline(&im, m, tlinks, func_addr, flags, &ctx);
         |         ^~~
         |         net
   arch/riscv/net/bpf_jit_comp64.c:1036:9: note: each undeclared identifier is reported only once for each function it appears in
   arch/riscv/net/bpf_jit_comp64.c:1038:48: error: invalid type argument of '->' (have 'struct rv_jit_context')
    1038 |         return ret < 0 ? ret : ninsns_rvoff(ctx->ninsns);
         |                                                ^~
   arch/riscv/net/bpf_jit_comp64.c: In function 'arch_prepare_bpf_trampoline':
   arch/riscv/net/bpf_jit_comp64.c:1049:40: error: passing argument 1 of 'arch_bpf_trampoline_size' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1049 |         ret = arch_bpf_trampoline_size(im, m, flags, tlinks, func_addr);
         |                                        ^~
         |                                        |
         |                                        struct bpf_tramp_image *
   arch/riscv/net/bpf_jit_comp64.c:1027:59: note: expected 'const struct btf_func_model *' but argument is of type 'struct bpf_tramp_image *'
    1027 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>> arch/riscv/net/bpf_jit_comp64.c:1049:44: warning: passing argument 2 of 'arch_bpf_trampoline_size' makes integer from pointer without a cast [-Wint-conversion]
    1049 |         ret = arch_bpf_trampoline_size(im, m, flags, tlinks, func_addr);
         |                                            ^
         |                                            |
         |                                            const struct btf_func_model *
   arch/riscv/net/bpf_jit_comp64.c:1027:66: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'const struct btf_func_model *'
    1027 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |                                                              ~~~~^~~~~
>> arch/riscv/net/bpf_jit_comp64.c:1049:47: warning: passing argument 3 of 'arch_bpf_trampoline_size' makes pointer from integer without a cast [-Wint-conversion]
    1049 |         ret = arch_bpf_trampoline_size(im, m, flags, tlinks, func_addr);
         |                                               ^~~~~
         |                                               |
         |                                               u32 {aka unsigned int}
   arch/riscv/net/bpf_jit_comp64.c:1028:54: note: expected 'struct bpf_tramp_links *' but argument is of type 'u32' {aka 'unsigned int'}
    1028 |                              struct bpf_tramp_links *tlinks, void *func_addr)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1049:15: error: too many arguments to function 'arch_bpf_trampoline_size'
    1049 |         ret = arch_bpf_trampoline_size(im, m, flags, tlinks, func_addr);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1027:5: note: declared here
    1027 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c: In function 'arch_bpf_trampoline_size':
   arch/riscv/net/bpf_jit_comp64.c:1039:1: error: control reaches end of non-void function [-Werror=return-type]
    1039 | }
         | ^
   cc1: some warnings being treated as errors


vim +/arch_bpf_trampoline_size +1049 arch/riscv/net/bpf_jit_comp64.c

  1040	
  1041	int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image,
  1042					void *image_end, const struct btf_func_model *m,
  1043					u32 flags, struct bpf_tramp_links *tlinks,
  1044					void *func_addr)
  1045	{
  1046		int ret;
  1047		struct rv_jit_context ctx;
  1048	
> 1049		ret = arch_bpf_trampoline_size(im, m, flags, tlinks, func_addr);
  1050		if (ret < 0)
  1051			return ret;
  1052	
  1053		if (ret > (long)image_end - (long)image)
  1054			return -EFBIG;
  1055	
  1056		ctx.ninsns = 0;
  1057		/*
  1058		 * The bpf_int_jit_compile() uses a RW buffer (ctx.insns) to write the
  1059		 * JITed instructions and later copies it to a RX region (ctx.ro_insns).
  1060		 * It also uses ctx.ro_insns to calculate offsets for jumps etc. As the
  1061		 * trampoline image uses the same memory area for writing and execution,
  1062		 * both ctx.insns and ctx.ro_insns can be set to image.
  1063		 */
  1064		ctx.insns = image;
  1065		ctx.ro_insns = image;
  1066		ret = __arch_prepare_bpf_trampoline(im, m, tlinks, func_addr, flags, &ctx);
  1067		if (ret < 0)
  1068			return ret;
  1069	
  1070		bpf_flush_icache(ctx.insns, ctx.insns + ctx.ninsns);
  1071	
  1072		return ninsns_rvoff(ret);
  1073	}
  1074	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
