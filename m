Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2069341AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 21:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJ3NuaFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702760692; x=1734296692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EuCngM21OYko6ZqMU/A0Tg42ydMFf9bKwCUq27rjSPg=;
  b=OJ3NuaFEON18lPoJX+CGlBk7SM2ljed7CV8u2+TvHE4c6BersgltocNk
   JUZh0avtyeBgmC+x9mg00P6bTBz1kOPIqUYOUMvcRsJ6cF3zr2hw4zASK
   tj/BotWKhNzk7P55LLptTpFRhfBgajTPuw1DvCf3chiu6YH2Zb2/PJ9TV
   pMdJ2ceYytufN9EU/gtVhwwgxETLY3dR4eYNHa9D8+OtOoOEzBt0XzY+H
   ws+zwDhj9IjESHq7WpsraVLv1A7ehDl4fdYxNDDhlkgLR0iArjhpBfH6b
   Bth5REXdk61tG1zKDYkhwS14yIM6+hY0BoMhiFGCgRS/T5pLVZZAERaJC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2241107"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="2241107"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 13:04:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="918815302"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="918815302"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2023 13:04:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEbq3-0002DC-0b;
	Sat, 16 Dec 2023 21:04:47 +0000
Date: Sun, 17 Dec 2023 05:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [dinguyen:socfpga_dts_for_v6.8 11/38]
 arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function
 'emit_ldb'; did you mean 'emit_ldd'?
Message-ID: <202312170518.j7MTN6u1-lkp@intel.com>
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
commit: 18a6fb215c2a1e1a9fe62bc3baab86c356d2a4c5 [11/38] LoongArch: BPF: Support sign-extension load instructions
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231217/202312170518.j7MTN6u1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170518.j7MTN6u1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170518.j7MTN6u1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/net/bpf_jit.c:7:
   arch/loongarch/net/bpf_jit.c: In function 'build_insn':
>> arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldb'; did you mean 'emit_ldd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:899:41: note: in expansion of macro 'emit_insn'
     899 |                                         emit_insn(ctx, ldb, dst, src, off);
         |                                         ^~~~~~~~~
>> arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldxb'; did you mean 'emit_ldxd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:905:41: note: in expansion of macro 'emit_insn'
     905 |                                         emit_insn(ctx, ldxb, dst, src, t1);
         |                                         ^~~~~~~~~
>> arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldh'; did you mean 'emit_ldd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:913:41: note: in expansion of macro 'emit_insn'
     913 |                                         emit_insn(ctx, ldh, dst, src, off);
         |                                         ^~~~~~~~~
>> arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldxh'; did you mean 'emit_ldxd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:919:41: note: in expansion of macro 'emit_insn'
     919 |                                         emit_insn(ctx, ldxh, dst, src, t1);
         |                                         ^~~~~~~~~
>> arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldw'; did you mean 'emit_llw'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:927:41: note: in expansion of macro 'emit_insn'
     927 |                                         emit_insn(ctx, ldw, dst, src, off);
         |                                         ^~~~~~~~~
>> arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldxw'; did you mean 'emit_ldxd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:933:41: note: in expansion of macro 'emit_insn'
     933 |                                         emit_insn(ctx, ldxw, dst, src, t1);
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
