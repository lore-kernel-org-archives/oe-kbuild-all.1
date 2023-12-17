Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA0B1FB2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBSG+CYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702806172; x=1734342172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzuoLlBt1VUF9LTMrFiSg8bhoJgN6kDhVsNJ0EQ9EFY=;
  b=KBSG+CYUlLAfWtoqEucZEQle/6pZpr3lBki+yYHhYzF8e3IrtDTzzduq
   0yTR6gblxx1vjWY2BArYk9XCDLh8GxeHRIiipHymkQEjnfeJ5yauM/rsa
   CR/tKTLI4EJANnILw1iHyeuEV3ZV7Kjapufkka4uIgRyDLebdgB/9+O7e
   IVjec00/7p6sYWF/5S74+mU30rBSwo37Bgh4j6E1sCEAM1Q2b6N49N/z8
   a9ur5O9Smqsct8D06Dy9a85FZZe10vT4Gu1O+iJwoGhXDffxxkCagHJbL
   gJFgE35x5VD9wSZcfzSpVpUfu/xd7kD+lbftSRCXxnrMOPoAM8VhWJGC2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="395145529"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="395145529"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 01:42:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="778766620"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="778766620"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 17 Dec 2023 01:42:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEnfb-0002uS-0u;
	Sun, 17 Dec 2023 09:42:47 +0000
Date: Sun, 17 Dec 2023 17:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [dinguyen:socfpga_dts_for_v6.8 12/38]
 arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function
 'emit_extwb'; did you mean 'emit_stxw'?
Message-ID: <202312171758.OQySgWeF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.8
head:   d8c9ac7c343fb906b096c627c50eac9ae5b15cbd
commit: e14f87f602204dd5413bbb239bfcae06c5328b75 [12/38] LoongArch: BPF: Support sign-extension mov instructions
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231217/202312171758.OQySgWeF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171758.OQySgWeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171758.OQySgWeF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/net/bpf_jit.c:7:
   arch/loongarch/net/bpf_jit.c: In function 'build_insn':
>> arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_extwb'; did you mean 'emit_stxw'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:482:25: note: in expansion of macro 'emit_insn'
     482 |                         emit_insn(ctx, extwb, dst, t1);
         |                         ^~~~~~~~~
>> arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_extwh'; did you mean 'emit_stxw'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:486:25: note: in expansion of macro 'emit_insn'
     486 |                         emit_insn(ctx, extwh, dst, t1);
         |                         ^~~~~~~~~
>> arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_addw'; did you mean 'emit_addd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:489:25: note: in expansion of macro 'emit_insn'
     489 |                         emit_insn(ctx, addw, dst, src, LOONGARCH_GPR_ZERO);
         |                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldb'; did you mean 'emit_ldd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:914:41: note: in expansion of macro 'emit_insn'
     914 |                                         emit_insn(ctx, ldb, dst, src, off);
         |                                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldxb'; did you mean 'emit_ldxd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:920:41: note: in expansion of macro 'emit_insn'
     920 |                                         emit_insn(ctx, ldxb, dst, src, t1);
         |                                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldh'; did you mean 'emit_ldd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:928:41: note: in expansion of macro 'emit_insn'
     928 |                                         emit_insn(ctx, ldh, dst, src, off);
         |                                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldxh'; did you mean 'emit_ldxd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:934:41: note: in expansion of macro 'emit_insn'
     934 |                                         emit_insn(ctx, ldxh, dst, src, t1);
         |                                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldw'; did you mean 'emit_llw'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:942:41: note: in expansion of macro 'emit_insn'
     942 |                                         emit_insn(ctx, ldw, dst, src, off);
         |                                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldxw'; did you mean 'emit_ldxd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:948:41: note: in expansion of macro 'emit_insn'
     948 |                                         emit_insn(ctx, ldxw, dst, src, t1);
         |                                         ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +34 arch/loongarch/net/bpf_jit.h

5dc615520c4dfb Tiezhu Yang 2022-10-12  29  
5dc615520c4dfb Tiezhu Yang 2022-10-12  30  #define emit_insn(ctx, func, ...)						\
5dc615520c4dfb Tiezhu Yang 2022-10-12  31  do {										\
5dc615520c4dfb Tiezhu Yang 2022-10-12  32  	if (ctx->image != NULL) {						\
5dc615520c4dfb Tiezhu Yang 2022-10-12  33  		union loongarch_instruction *insn = &ctx->image[ctx->idx];	\
5dc615520c4dfb Tiezhu Yang 2022-10-12 @34  		emit_##func(insn, ##__VA_ARGS__);				\
5dc615520c4dfb Tiezhu Yang 2022-10-12  35  	}									\
5dc615520c4dfb Tiezhu Yang 2022-10-12  36  	ctx->idx++;								\
5dc615520c4dfb Tiezhu Yang 2022-10-12  37  } while (0)
5dc615520c4dfb Tiezhu Yang 2022-10-12  38  

:::::: The code at line 34 was first introduced by commit
:::::: 5dc615520c4dfb358245680f1904bad61116648e LoongArch: Add BPF JIT support

:::::: TO: Tiezhu Yang <yangtiezhu@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
