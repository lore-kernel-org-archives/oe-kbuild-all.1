Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709DF1094F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H49Vf3OH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702889573; x=1734425573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lWKVNk6UBN1YmyCiYJCnZqzls5uhdUTKRtEDqO/LeO4=;
  b=H49Vf3OHYcW7WVV+XuiwXc332OIhpjzMxWFIuzCs5yui2FNDHp3pmXcI
   9TOkSWvmK51Yd2ih5j8t4KUBTKIzb0vPLF31R3F9ZiiLL4M34n85js8ik
   Qdd8/3N5jFD6nve22WNgNJn4/BGAGCCf4mI827z092dGF/9wR6VYseLjp
   wvkrg2pec5UfPu6Sl/tPinVeGorFWI6UIFH3nnZT8fkGzW5qXeueBkerq
   Z1jjD54IFNlWadl1ReU0nUdfFpskQP/8GvcptapzRf3Q3vlRUy1lWHTd0
   MHWEwxOxb+aEwAeQAl9NoCHSjZ+iPdvWCUJaBExHUJ3EhfCynvx9GpGQw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="14165842"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="14165842"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 00:52:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="893740378"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="893740378"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2023 00:52:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF9Mi-0003wL-2e;
	Mon, 18 Dec 2023 08:52:44 +0000
Date: Mon, 18 Dec 2023 16:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [dinguyen:socfpga_dts_for_v6.8 16/38]
 arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function
 'emit_modd'; did you mean 'emit_moddu'?
Message-ID: <202312181608.SUFpVeBU-lkp@intel.com>
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
commit: da70771824374cc989619cc429d92563ab7a9c4d [16/38] LoongArch: BPF: Support signed mod instructions
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20231218/202312181608.SUFpVeBU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181608.SUFpVeBU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181608.SUFpVeBU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/loongarch/net/bpf_jit.c:7:
   arch/loongarch/net/bpf_jit.c: In function 'build_insn':
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_extwb'; did you mean 'emit_stxw'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:482:25: note: in expansion of macro 'emit_insn'
     482 |                         emit_insn(ctx, extwb, dst, t1);
         |                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_extwh'; did you mean 'emit_stxw'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:486:25: note: in expansion of macro 'emit_insn'
     486 |                         emit_insn(ctx, extwh, dst, t1);
         |                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_addw'; did you mean 'emit_addd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:489:25: note: in expansion of macro 'emit_insn'
     489 |                         emit_insn(ctx, addw, dst, src, LOONGARCH_GPR_ZERO);
         |                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_divd'; did you mean 'emit_divdu'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:566:25: note: in expansion of macro 'emit_insn'
     566 |                         emit_insn(ctx, divd, dst, dst, t1);
         |                         ^~~~~~~~~
>> arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_modd'; did you mean 'emit_moddu'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:601:25: note: in expansion of macro 'emit_insn'
     601 |                         emit_insn(ctx, modd, dst, dst, t1);
         |                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldb'; did you mean 'emit_ldd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:951:41: note: in expansion of macro 'emit_insn'
     951 |                                         emit_insn(ctx, ldb, dst, src, off);
         |                                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldxb'; did you mean 'emit_ldxd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:957:41: note: in expansion of macro 'emit_insn'
     957 |                                         emit_insn(ctx, ldxb, dst, src, t1);
         |                                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldh'; did you mean 'emit_ldd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:965:41: note: in expansion of macro 'emit_insn'
     965 |                                         emit_insn(ctx, ldh, dst, src, off);
         |                                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldxh'; did you mean 'emit_ldxd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:971:41: note: in expansion of macro 'emit_insn'
     971 |                                         emit_insn(ctx, ldxh, dst, src, t1);
         |                                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldw'; did you mean 'emit_llw'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:979:41: note: in expansion of macro 'emit_insn'
     979 |                                         emit_insn(ctx, ldw, dst, src, off);
         |                                         ^~~~~~~~~
   arch/loongarch/net/bpf_jit.h:34:17: error: implicit declaration of function 'emit_ldxw'; did you mean 'emit_ldxd'? [-Werror=implicit-function-declaration]
      34 |                 emit_##func(insn, ##__VA_ARGS__);                               \
         |                 ^~~~~
   arch/loongarch/net/bpf_jit.c:985:41: note: in expansion of macro 'emit_insn'
     985 |                                         emit_insn(ctx, ldxw, dst, src, t1);
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
