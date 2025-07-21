Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503A2D0C82
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099942; cv=none; b=Cf75ue0UMKdrkyF8ePhB//eo0/VRI4mh6TwakpPt4/PAdtVEzLQTIBK2Cr5VXlXA4bqdNtp8xOcj2CBIFkzx1IyEHAdENeRPXB/jFusihRuzPKceJYyz2uQOB73hkMU8iFo6zAZPECHcgfoxE9wQIEX9e0KNmsSDjO6+7zI9uvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099942; c=relaxed/simple;
	bh=5PRsXo/IrfodUiHNDdknMSn3X/Czt7H4Tog+URgxaKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdLQXxgat/bOMXdYdGSWKaouwuDwRQXSEmrnPrfCpzpkds8KaOXsmro9p7hj4KkeSpTdLXuXYt+2ddUJP87NvqV3g90CpdzXvAiYR49hCgpDiFL2topmvg6X0KtEEVNB1VoOfaUtQJaOPI+Z1KBF3QpyBEEnO4tRZxYhSMDN2mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4DpVx98; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4DpVx98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753099940; x=1784635940;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5PRsXo/IrfodUiHNDdknMSn3X/Czt7H4Tog+URgxaKY=;
  b=K4DpVx98Pu6CK4wwEmOaky8YZzJfJ31XEm1myFeern6WBWuggblTe6bF
   vnGk5BNDEmLvMS36oiQZ0Dw4IzG51+aexpzzIgJp3gBfE8a4LwY6vzh9E
   QVa9LrQ+RQUKn5eGyM3/49UZv0tgudX4w98fwaYcrGwcRa4RurMU8Irp1
   kbPhdXX3UGwQ0r+fviTc4yjKS+UJZ6VxHidDtJbsRs1Un/RE7Yycw64TA
   G74A5a+t69djMX9jGcJIU0BwPhvvhRQO63l4RlsrqkpX3HudApU53LOGT
   kboJX4KCaPU8kIE2fts6iiQ9eF4K/9UVL+FhHU28KG4e+YZEJ4ScUIrs1
   A==;
X-CSE-ConnectionGUID: Vyb2GaIrQwSHmQ6NF1+zuQ==
X-CSE-MsgGUID: B3l+6sYOQWawHhYBGQURBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66660986"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="66660986"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 05:12:18 -0700
X-CSE-ConnectionGUID: kUcdyTdtQRi2SHdcZxF9YA==
X-CSE-MsgGUID: DAoLJVhITkS97wGfn7lgJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="159373079"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2025 05:12:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udpNO-000Gmb-2n;
	Mon, 21 Jul 2025 12:12:14 +0000
Date: Mon, 21 Jul 2025 20:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 13/22]
 arch/riscv/net/bpf_jit_comp64.c:1010:49: warning: 'struct bpf_tramp_links'
 declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202507212035.fgXzf5Ju-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   d0503d4013c49a3fde856947dfffe6c80c178eb1
commit: d6d4068c9dbaa7c77d3fc2d3e0d8ae03a9eac775 [13/22] bpf: Add struct bpf_tramp_node object
config: riscv-randconfig-r122-20250721 (https://download.01.org/0day-ci/archive/20250721/202507212035.fgXzf5Ju-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250721/202507212035.fgXzf5Ju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507212035.fgXzf5Ju-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/net/bpf_jit_comp64.c: In function 'invoke_bpf_prog':
   arch/riscv/net/bpf_jit_comp64.c:951:14: error: 'struct bpf_tramp_link' has no member named 'cookie'
     951 |         if (l->cookie) {
         |              ^~
   arch/riscv/net/bpf_jit_comp64.c:952:38: error: 'struct bpf_tramp_link' has no member named 'cookie'
     952 |                 emit_imm(RV_REG_T1, l->cookie, ctx);
         |                                      ^~
   arch/riscv/net/bpf_jit_comp64.c: At top level:
>> arch/riscv/net/bpf_jit_comp64.c:1010:49: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1010 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c: In function '__arch_prepare_bpf_trampoline':
   arch/riscv/net/bpf_jit_comp64.c:1018:49: error: invalid use of undefined type 'struct bpf_tramp_links'
    1018 |         struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
         |                                                 ^
   arch/riscv/net/bpf_jit_comp64.c:1019:48: error: invalid use of undefined type 'struct bpf_tramp_links'
    1019 |         struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
         |                                                ^
   arch/riscv/net/bpf_jit_comp64.c:1020:51: error: invalid use of undefined type 'struct bpf_tramp_links'
    1020 |         struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
         |                                                   ^
   arch/riscv/net/bpf_jit_comp64.c:1163:31: error: invalid use of undefined type 'struct bpf_tramp_links'
    1163 |         for (i = 0; i < fentry->nr_links; i++) {
         |                               ^~
   arch/riscv/net/bpf_jit_comp64.c:1164:45: error: invalid use of undefined type 'struct bpf_tramp_links'
    1164 |                 ret = invoke_bpf_prog(fentry->links[i], args_off, retval_off, run_ctx_off,
         |                                             ^~
   arch/riscv/net/bpf_jit_comp64.c:1170:21: error: invalid use of undefined type 'struct bpf_tramp_links'
    1170 |         if (fmod_ret->nr_links) {
         |                     ^~
   In file included from include/linux/percpu.h:5,
                    from include/linux/bpf.h:12,
                    from arch/riscv/net/bpf_jit_comp64.c:9:
   arch/riscv/net/bpf_jit_comp64.c:1171:48: error: invalid use of undefined type 'struct bpf_tramp_links'
    1171 |                 branches_off = kcalloc(fmod_ret->nr_links, sizeof(int), GFP_KERNEL);
         |                                                ^~
   include/linux/alloc_tag.h:239:16: note: in definition of macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1171:32: note: in expansion of macro 'kcalloc'
    1171 |                 branches_off = kcalloc(fmod_ret->nr_links, sizeof(int), GFP_KERNEL);
         |                                ^~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1171:48: error: invalid use of undefined type 'struct bpf_tramp_links'
    1171 |                 branches_off = kcalloc(fmod_ret->nr_links, sizeof(int), GFP_KERNEL);
         |                                                ^~
   include/linux/alloc_tag.h:243:24: note: in definition of macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1171:32: note: in expansion of macro 'kcalloc'
    1171 |                 branches_off = kcalloc(fmod_ret->nr_links, sizeof(int), GFP_KERNEL);
         |                                ^~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1171:48: error: invalid use of undefined type 'struct bpf_tramp_links'
    1171 |                 branches_off = kcalloc(fmod_ret->nr_links, sizeof(int), GFP_KERNEL);
         |                                                ^~
   include/linux/alloc_tag.h:246:24: note: in definition of macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:950:49: note: in expansion of macro 'alloc_hooks'
     950 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:989:41: note: in expansion of macro 'kmalloc_array'
     989 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1171:32: note: in expansion of macro 'kcalloc'
    1171 |                 branches_off = kcalloc(fmod_ret->nr_links, sizeof(int), GFP_KERNEL);
         |                                ^~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1171:30: error: assignment to 'int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1171 |                 branches_off = kcalloc(fmod_ret->nr_links, sizeof(int), GFP_KERNEL);
         |                              ^
   arch/riscv/net/bpf_jit_comp64.c:1177:41: error: invalid use of undefined type 'struct bpf_tramp_links'
    1177 |                 for (i = 0; i < fmod_ret->nr_links; i++) {
         |                                         ^~
   arch/riscv/net/bpf_jit_comp64.c:1178:55: error: invalid use of undefined type 'struct bpf_tramp_links'
    1178 |                         ret = invoke_bpf_prog(fmod_ret->links[i], args_off, retval_off,
         |                                                       ^~
   arch/riscv/net/bpf_jit_comp64.c:1204:47: error: invalid use of undefined type 'struct bpf_tramp_links'
    1204 |         for (i = 0; ctx->insns && i < fmod_ret->nr_links; i++) {
         |                                               ^~
   arch/riscv/net/bpf_jit_comp64.c:1210:30: error: invalid use of undefined type 'struct bpf_tramp_links'
    1210 |         for (i = 0; i < fexit->nr_links; i++) {
         |                              ^~
   arch/riscv/net/bpf_jit_comp64.c:1211:44: error: invalid use of undefined type 'struct bpf_tramp_links'
    1211 |                 ret = invoke_bpf_prog(fexit->links[i], args_off, retval_off,
         |                                            ^~
   arch/riscv/net/bpf_jit_comp64.c: At top level:
   arch/riscv/net/bpf_jit_comp64.c:1267:37: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1267 |                              struct bpf_tramp_links *tlinks, void *func_addr)
         |                                     ^~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c:1266:5: error: conflicting types for 'arch_bpf_trampoline_size'; have 'int(const struct btf_func_model *, u32,  struct bpf_tramp_links *, void *)' {aka 'int(const struct btf_func_model *, unsigned int,  struct bpf_tramp_links *, void *)'}
    1266 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:1209:5: note: previous declaration of 'arch_bpf_trampoline_size' with type 'int(const struct btf_func_model *, u32,  struct bpf_tramp_nodes *, void *)' {aka 'int(const struct btf_func_model *, unsigned int,  struct bpf_tramp_nodes *, void *)'}
    1209 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/net/bpf_jit_comp64.c: In function 'arch_bpf_trampoline_size':
   arch/riscv/net/bpf_jit_comp64.c:1276:53: error: passing argument 3 of '__arch_prepare_bpf_trampoline' from incompatible pointer type [-Wincompatible-pointer-types]
    1276 |         ret = __arch_prepare_bpf_trampoline(&im, m, tlinks, func_addr, flags, &ctx);


vim +1010 arch/riscv/net/bpf_jit_comp64.c

49b5e77ae3e214 Pu Lehui       2023-02-15  1007  
49b5e77ae3e214 Pu Lehui       2023-02-15  1008  static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
49b5e77ae3e214 Pu Lehui       2023-02-15  1009  					 const struct btf_func_model *m,
49b5e77ae3e214 Pu Lehui       2023-02-15 @1010  					 struct bpf_tramp_links *tlinks,
49b5e77ae3e214 Pu Lehui       2023-02-15  1011  					 void *func_addr, u32 flags,
49b5e77ae3e214 Pu Lehui       2023-02-15  1012  					 struct rv_jit_context *ctx)
49b5e77ae3e214 Pu Lehui       2023-02-15  1013  {
49b5e77ae3e214 Pu Lehui       2023-02-15  1014  	int i, ret, offset;
49b5e77ae3e214 Pu Lehui       2023-02-15  1015  	int *branches_off = NULL;
6801b0aef79db4 Pu Lehui       2024-07-02  1016  	int stack_size = 0, nr_arg_slots = 0;
6801b0aef79db4 Pu Lehui       2024-07-02  1017  	int retval_off, args_off, nregs_off, ip_off, run_ctx_off, sreg_off, stk_arg_off;
49b5e77ae3e214 Pu Lehui       2023-02-15  1018  	struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
49b5e77ae3e214 Pu Lehui       2023-02-15  1019  	struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
49b5e77ae3e214 Pu Lehui       2023-02-15  1020  	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
1732ebc4a26181 Pu Lehui       2024-01-23  1021  	bool is_struct_ops = flags & BPF_TRAMP_F_INDIRECT;
49b5e77ae3e214 Pu Lehui       2023-02-15  1022  	void *orig_call = func_addr;
49b5e77ae3e214 Pu Lehui       2023-02-15  1023  	bool save_ret;
49b5e77ae3e214 Pu Lehui       2023-02-15  1024  	u32 insn;
49b5e77ae3e214 Pu Lehui       2023-02-15  1025  
25ad10658dc106 Pu Lehui       2023-07-21  1026  	/* Two types of generated trampoline stack layout:
25ad10658dc106 Pu Lehui       2023-07-21  1027  	 *
25ad10658dc106 Pu Lehui       2023-07-21  1028  	 * 1. trampoline called from function entry
25ad10658dc106 Pu Lehui       2023-07-21  1029  	 * --------------------------------------
25ad10658dc106 Pu Lehui       2023-07-21  1030  	 * FP + 8	    [ RA to parent func	] return address to parent
25ad10658dc106 Pu Lehui       2023-07-21  1031  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1032  	 * FP + 0	    [ FP of parent func ] frame pointer of parent
25ad10658dc106 Pu Lehui       2023-07-21  1033  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1034  	 * FP - 8           [ T0 to traced func ] return address of traced
25ad10658dc106 Pu Lehui       2023-07-21  1035  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1036  	 * FP - 16	    [ FP of traced func ] frame pointer of traced
25ad10658dc106 Pu Lehui       2023-07-21  1037  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1038  	 * --------------------------------------
49b5e77ae3e214 Pu Lehui       2023-02-15  1039  	 *
25ad10658dc106 Pu Lehui       2023-07-21  1040  	 * 2. trampoline called directly
25ad10658dc106 Pu Lehui       2023-07-21  1041  	 * --------------------------------------
25ad10658dc106 Pu Lehui       2023-07-21  1042  	 * FP - 8	    [ RA to caller func ] return address to caller
49b5e77ae3e214 Pu Lehui       2023-02-15  1043  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1044  	 * FP - 16	    [ FP of caller func	] frame pointer of caller
49b5e77ae3e214 Pu Lehui       2023-02-15  1045  	 *					  function
25ad10658dc106 Pu Lehui       2023-07-21  1046  	 * --------------------------------------
49b5e77ae3e214 Pu Lehui       2023-02-15  1047  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1048  	 * FP - retval_off  [ return value      ] BPF_TRAMP_F_CALL_ORIG or
49b5e77ae3e214 Pu Lehui       2023-02-15  1049  	 *					  BPF_TRAMP_F_RET_FENTRY_RET
49b5e77ae3e214 Pu Lehui       2023-02-15  1050  	 *                  [ argN              ]
49b5e77ae3e214 Pu Lehui       2023-02-15  1051  	 *                  [ ...               ]
49b5e77ae3e214 Pu Lehui       2023-02-15  1052  	 * FP - args_off    [ arg1              ]
49b5e77ae3e214 Pu Lehui       2023-02-15  1053  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1054  	 * FP - nregs_off   [ regs count        ]
49b5e77ae3e214 Pu Lehui       2023-02-15  1055  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1056  	 * FP - ip_off      [ traced func	] BPF_TRAMP_F_IP_ARG
49b5e77ae3e214 Pu Lehui       2023-02-15  1057  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1058  	 * FP - run_ctx_off [ bpf_tramp_run_ctx ]
49b5e77ae3e214 Pu Lehui       2023-02-15  1059  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1060  	 * FP - sreg_off    [ callee saved reg	]
49b5e77ae3e214 Pu Lehui       2023-02-15  1061  	 *
49b5e77ae3e214 Pu Lehui       2023-02-15  1062  	 *		    [ pads              ] pads for 16 bytes alignment
6801b0aef79db4 Pu Lehui       2024-07-02  1063  	 *
6801b0aef79db4 Pu Lehui       2024-07-02  1064  	 *		    [ stack_argN        ]
6801b0aef79db4 Pu Lehui       2024-07-02  1065  	 *		    [ ...               ]
6801b0aef79db4 Pu Lehui       2024-07-02  1066  	 * FP - stk_arg_off [ stack_arg1        ] BPF_TRAMP_F_CALL_ORIG
49b5e77ae3e214 Pu Lehui       2023-02-15  1067  	 */
49b5e77ae3e214 Pu Lehui       2023-02-15  1068  
49b5e77ae3e214 Pu Lehui       2023-02-15  1069  	if (flags & (BPF_TRAMP_F_ORIG_STACK | BPF_TRAMP_F_SHARE_IPMODIFY))
49b5e77ae3e214 Pu Lehui       2023-02-15  1070  		return -ENOTSUPP;
49b5e77ae3e214 Pu Lehui       2023-02-15  1071  
6801b0aef79db4 Pu Lehui       2024-07-02  1072  	if (m->nr_args > MAX_BPF_FUNC_ARGS)
49b5e77ae3e214 Pu Lehui       2023-02-15  1073  		return -ENOTSUPP;
49b5e77ae3e214 Pu Lehui       2023-02-15  1074  
6801b0aef79db4 Pu Lehui       2024-07-02  1075  	for (i = 0; i < m->nr_args; i++)
6801b0aef79db4 Pu Lehui       2024-07-02  1076  		nr_arg_slots += round_up(m->arg_size[i], 8) / 8;
6801b0aef79db4 Pu Lehui       2024-07-02  1077  
25ad10658dc106 Pu Lehui       2023-07-21  1078  	/* room of trampoline frame to store return address and frame pointer */
25ad10658dc106 Pu Lehui       2023-07-21  1079  	stack_size += 16;
49b5e77ae3e214 Pu Lehui       2023-02-15  1080  
49b5e77ae3e214 Pu Lehui       2023-02-15  1081  	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
49b5e77ae3e214 Pu Lehui       2023-02-15  1082  	if (save_ret) {
7112cd26e606c7 Björn Töpel    2023-10-04  1083  		stack_size += 16; /* Save both A5 (BPF R0) and A0 */
49b5e77ae3e214 Pu Lehui       2023-02-15  1084  		retval_off = stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1085  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1086  
6801b0aef79db4 Pu Lehui       2024-07-02  1087  	stack_size += nr_arg_slots * 8;
49b5e77ae3e214 Pu Lehui       2023-02-15  1088  	args_off = stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1089  
49b5e77ae3e214 Pu Lehui       2023-02-15  1090  	stack_size += 8;
49b5e77ae3e214 Pu Lehui       2023-02-15  1091  	nregs_off = stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1092  
49b5e77ae3e214 Pu Lehui       2023-02-15  1093  	if (flags & BPF_TRAMP_F_IP_ARG) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1094  		stack_size += 8;
49b5e77ae3e214 Pu Lehui       2023-02-15  1095  		ip_off = stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1096  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1097  
49b5e77ae3e214 Pu Lehui       2023-02-15  1098  	stack_size += round_up(sizeof(struct bpf_tramp_run_ctx), 8);
49b5e77ae3e214 Pu Lehui       2023-02-15  1099  	run_ctx_off = stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1100  
49b5e77ae3e214 Pu Lehui       2023-02-15  1101  	stack_size += 8;
49b5e77ae3e214 Pu Lehui       2023-02-15  1102  	sreg_off = stack_size;
49b5e77ae3e214 Pu Lehui       2023-02-15  1103  
a5912c37faf723 Puranjay Mohan 2024-07-08  1104  	if ((flags & BPF_TRAMP_F_CALL_ORIG) && (nr_arg_slots - RV_MAX_REG_ARGS > 0))
6801b0aef79db4 Pu Lehui       2024-07-02  1105  		stack_size += (nr_arg_slots - RV_MAX_REG_ARGS) * 8;
6801b0aef79db4 Pu Lehui       2024-07-02  1106  
e944fc8152744a Xiao Wang      2024-05-23  1107  	stack_size = round_up(stack_size, STACK_ALIGN);
49b5e77ae3e214 Pu Lehui       2023-02-15  1108  
6801b0aef79db4 Pu Lehui       2024-07-02  1109  	/* room for args on stack must be at the top of stack */
6801b0aef79db4 Pu Lehui       2024-07-02  1110  	stk_arg_off = stack_size;
6801b0aef79db4 Pu Lehui       2024-07-02  1111  
1732ebc4a26181 Pu Lehui       2024-01-23  1112  	if (!is_struct_ops) {
25ad10658dc106 Pu Lehui       2023-07-21  1113  		/* For the trampoline called from function entry,
25ad10658dc106 Pu Lehui       2023-07-21  1114  		 * the frame of traced function and the frame of
25ad10658dc106 Pu Lehui       2023-07-21  1115  		 * trampoline need to be considered.
25ad10658dc106 Pu Lehui       2023-07-21  1116  		 */
25ad10658dc106 Pu Lehui       2023-07-21  1117  		emit_addi(RV_REG_SP, RV_REG_SP, -16, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1118  		emit_sd(RV_REG_SP, 8, RV_REG_RA, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1119  		emit_sd(RV_REG_SP, 0, RV_REG_FP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1120  		emit_addi(RV_REG_FP, RV_REG_SP, 16, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1121  
25ad10658dc106 Pu Lehui       2023-07-21  1122  		emit_addi(RV_REG_SP, RV_REG_SP, -stack_size, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1123  		emit_sd(RV_REG_SP, stack_size - 8, RV_REG_T0, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1124  		emit_sd(RV_REG_SP, stack_size - 16, RV_REG_FP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1125  		emit_addi(RV_REG_FP, RV_REG_SP, stack_size, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1126  	} else {
e63985ecd22681 Puranjay Mohan 2024-03-03  1127  		/* emit kcfi hash */
e63985ecd22681 Puranjay Mohan 2024-03-03  1128  		emit_kcfi(cfi_get_func_hash(func_addr), ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1129  		/* For the trampoline called directly, just handle
25ad10658dc106 Pu Lehui       2023-07-21  1130  		 * the frame of trampoline.
25ad10658dc106 Pu Lehui       2023-07-21  1131  		 */
25ad10658dc106 Pu Lehui       2023-07-21  1132  		emit_addi(RV_REG_SP, RV_REG_SP, -stack_size, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1133  		emit_sd(RV_REG_SP, stack_size - 8, RV_REG_RA, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1134  		emit_sd(RV_REG_SP, stack_size - 16, RV_REG_FP, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1135  		emit_addi(RV_REG_FP, RV_REG_SP, stack_size, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1136  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1137  
49b5e77ae3e214 Pu Lehui       2023-02-15  1138  	/* callee saved register S1 to pass start time */
49b5e77ae3e214 Pu Lehui       2023-02-15  1139  	emit_sd(RV_REG_FP, -sreg_off, RV_REG_S1, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1140  
49b5e77ae3e214 Pu Lehui       2023-02-15  1141  	/* store ip address of the traced function */
49b5e77ae3e214 Pu Lehui       2023-02-15  1142  	if (flags & BPF_TRAMP_F_IP_ARG) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1143  		emit_imm(RV_REG_T1, (const s64)func_addr, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1144  		emit_sd(RV_REG_FP, -ip_off, RV_REG_T1, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1145  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1146  
6801b0aef79db4 Pu Lehui       2024-07-02  1147  	emit_li(RV_REG_T1, nr_arg_slots, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1148  	emit_sd(RV_REG_FP, -nregs_off, RV_REG_T1, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1149  
6801b0aef79db4 Pu Lehui       2024-07-02  1150  	store_args(nr_arg_slots, args_off, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1151  
49b5e77ae3e214 Pu Lehui       2023-02-15  1152  	/* skip to actual body of traced function */
49b5e77ae3e214 Pu Lehui       2023-02-15  1153  	if (flags & BPF_TRAMP_F_SKIP_FRAME)
25ad10658dc106 Pu Lehui       2023-07-21  1154  		orig_call += RV_FENTRY_NINSNS * 4;
49b5e77ae3e214 Pu Lehui       2023-02-15  1155  
49b5e77ae3e214 Pu Lehui       2023-02-15  1156  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
9f1e16fb1fc982 Pu Lehui       2024-06-22  1157  		emit_imm(RV_REG_A0, ctx->insns ? (const s64)im : RV_MAX_COUNT_IMM, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1158  		ret = emit_call((const u64)__bpf_tramp_enter, true, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1159  		if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1160  			return ret;
49b5e77ae3e214 Pu Lehui       2023-02-15  1161  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1162  
49b5e77ae3e214 Pu Lehui       2023-02-15  1163  	for (i = 0; i < fentry->nr_links; i++) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1164  		ret = invoke_bpf_prog(fentry->links[i], args_off, retval_off, run_ctx_off,
49b5e77ae3e214 Pu Lehui       2023-02-15  1165  				      flags & BPF_TRAMP_F_RET_FENTRY_RET, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1166  		if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1167  			return ret;
49b5e77ae3e214 Pu Lehui       2023-02-15  1168  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1169  
49b5e77ae3e214 Pu Lehui       2023-02-15  1170  	if (fmod_ret->nr_links) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1171  		branches_off = kcalloc(fmod_ret->nr_links, sizeof(int), GFP_KERNEL);
49b5e77ae3e214 Pu Lehui       2023-02-15  1172  		if (!branches_off)
49b5e77ae3e214 Pu Lehui       2023-02-15  1173  			return -ENOMEM;
49b5e77ae3e214 Pu Lehui       2023-02-15  1174  
49b5e77ae3e214 Pu Lehui       2023-02-15  1175  		/* cleanup to avoid garbage return value confusion */
49b5e77ae3e214 Pu Lehui       2023-02-15  1176  		emit_sd(RV_REG_FP, -retval_off, RV_REG_ZERO, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1177  		for (i = 0; i < fmod_ret->nr_links; i++) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1178  			ret = invoke_bpf_prog(fmod_ret->links[i], args_off, retval_off,
49b5e77ae3e214 Pu Lehui       2023-02-15  1179  					      run_ctx_off, true, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1180  			if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1181  				goto out;
49b5e77ae3e214 Pu Lehui       2023-02-15  1182  			emit_ld(RV_REG_T1, -retval_off, RV_REG_FP, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1183  			branches_off[i] = ctx->ninsns;
49b5e77ae3e214 Pu Lehui       2023-02-15  1184  			/* nop reserved for conditional jump */
49b5e77ae3e214 Pu Lehui       2023-02-15  1185  			emit(rv_nop(), ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1186  		}
49b5e77ae3e214 Pu Lehui       2023-02-15  1187  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1188  
49b5e77ae3e214 Pu Lehui       2023-02-15  1189  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
6801b0aef79db4 Pu Lehui       2024-07-02  1190  		restore_args(min_t(int, nr_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
6801b0aef79db4 Pu Lehui       2024-07-02  1191  		restore_stack_args(nr_arg_slots - RV_MAX_REG_ARGS, args_off, stk_arg_off, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1192  		ret = emit_call((const u64)orig_call, true, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1193  		if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1194  			goto out;
49b5e77ae3e214 Pu Lehui       2023-02-15  1195  		emit_sd(RV_REG_FP, -retval_off, RV_REG_A0, ctx);
7112cd26e606c7 Björn Töpel    2023-10-04  1196  		emit_sd(RV_REG_FP, -(retval_off - 8), regmap[BPF_REG_0], ctx);
2382a405c581ae Pu Lehui       2024-06-22  1197  		im->ip_after_call = ctx->ro_insns + ctx->ninsns;
49b5e77ae3e214 Pu Lehui       2023-02-15  1198  		/* 2 nops reserved for auipc+jalr pair */
49b5e77ae3e214 Pu Lehui       2023-02-15  1199  		emit(rv_nop(), ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1200  		emit(rv_nop(), ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1201  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1202  
49b5e77ae3e214 Pu Lehui       2023-02-15  1203  	/* update branches saved in invoke_bpf_mod_ret with bnez */
49b5e77ae3e214 Pu Lehui       2023-02-15  1204  	for (i = 0; ctx->insns && i < fmod_ret->nr_links; i++) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1205  		offset = ninsns_rvoff(ctx->ninsns - branches_off[i]);
49b5e77ae3e214 Pu Lehui       2023-02-15  1206  		insn = rv_bne(RV_REG_T1, RV_REG_ZERO, offset >> 1);
49b5e77ae3e214 Pu Lehui       2023-02-15  1207  		*(u32 *)(ctx->insns + branches_off[i]) = insn;
49b5e77ae3e214 Pu Lehui       2023-02-15  1208  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1209  
49b5e77ae3e214 Pu Lehui       2023-02-15  1210  	for (i = 0; i < fexit->nr_links; i++) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1211  		ret = invoke_bpf_prog(fexit->links[i], args_off, retval_off,
49b5e77ae3e214 Pu Lehui       2023-02-15  1212  				      run_ctx_off, false, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1213  		if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1214  			goto out;
49b5e77ae3e214 Pu Lehui       2023-02-15  1215  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1216  
49b5e77ae3e214 Pu Lehui       2023-02-15  1217  	if (flags & BPF_TRAMP_F_CALL_ORIG) {
2382a405c581ae Pu Lehui       2024-06-22  1218  		im->ip_epilogue = ctx->ro_insns + ctx->ninsns;
9f1e16fb1fc982 Pu Lehui       2024-06-22  1219  		emit_imm(RV_REG_A0, ctx->insns ? (const s64)im : RV_MAX_COUNT_IMM, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1220  		ret = emit_call((const u64)__bpf_tramp_exit, true, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1221  		if (ret)
49b5e77ae3e214 Pu Lehui       2023-02-15  1222  			goto out;
49b5e77ae3e214 Pu Lehui       2023-02-15  1223  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1224  
49b5e77ae3e214 Pu Lehui       2023-02-15  1225  	if (flags & BPF_TRAMP_F_RESTORE_REGS)
6801b0aef79db4 Pu Lehui       2024-07-02  1226  		restore_args(min_t(int, nr_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1227  
7112cd26e606c7 Björn Töpel    2023-10-04  1228  	if (save_ret) {
49b5e77ae3e214 Pu Lehui       2023-02-15  1229  		emit_ld(RV_REG_A0, -retval_off, RV_REG_FP, ctx);
7112cd26e606c7 Björn Töpel    2023-10-04  1230  		emit_ld(regmap[BPF_REG_0], -(retval_off - 8), RV_REG_FP, ctx);
7112cd26e606c7 Björn Töpel    2023-10-04  1231  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1232  
49b5e77ae3e214 Pu Lehui       2023-02-15  1233  	emit_ld(RV_REG_S1, -sreg_off, RV_REG_FP, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1234  
1732ebc4a26181 Pu Lehui       2024-01-23  1235  	if (!is_struct_ops) {
25ad10658dc106 Pu Lehui       2023-07-21  1236  		/* trampoline called from function entry */
25ad10658dc106 Pu Lehui       2023-07-21  1237  		emit_ld(RV_REG_T0, stack_size - 8, RV_REG_SP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1238  		emit_ld(RV_REG_FP, stack_size - 16, RV_REG_SP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1239  		emit_addi(RV_REG_SP, RV_REG_SP, stack_size, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1240  
25ad10658dc106 Pu Lehui       2023-07-21  1241  		emit_ld(RV_REG_RA, 8, RV_REG_SP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1242  		emit_ld(RV_REG_FP, 0, RV_REG_SP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1243  		emit_addi(RV_REG_SP, RV_REG_SP, 16, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1244  
49b5e77ae3e214 Pu Lehui       2023-02-15  1245  		if (flags & BPF_TRAMP_F_SKIP_FRAME)
25ad10658dc106 Pu Lehui       2023-07-21  1246  			/* return to parent function */
25ad10658dc106 Pu Lehui       2023-07-21  1247  			emit_jalr(RV_REG_ZERO, RV_REG_RA, 0, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1248  		else
25ad10658dc106 Pu Lehui       2023-07-21  1249  			/* return to traced function */
25ad10658dc106 Pu Lehui       2023-07-21  1250  			emit_jalr(RV_REG_ZERO, RV_REG_T0, 0, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1251  	} else {
25ad10658dc106 Pu Lehui       2023-07-21  1252  		/* trampoline called directly */
25ad10658dc106 Pu Lehui       2023-07-21  1253  		emit_ld(RV_REG_RA, stack_size - 8, RV_REG_SP, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1254  		emit_ld(RV_REG_FP, stack_size - 16, RV_REG_SP, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1255  		emit_addi(RV_REG_SP, RV_REG_SP, stack_size, ctx);
49b5e77ae3e214 Pu Lehui       2023-02-15  1256  
49b5e77ae3e214 Pu Lehui       2023-02-15  1257  		emit_jalr(RV_REG_ZERO, RV_REG_RA, 0, ctx);
25ad10658dc106 Pu Lehui       2023-07-21  1258  	}
49b5e77ae3e214 Pu Lehui       2023-02-15  1259  
49b5e77ae3e214 Pu Lehui       2023-02-15  1260  	ret = ctx->ninsns;
49b5e77ae3e214 Pu Lehui       2023-02-15  1261  out:
49b5e77ae3e214 Pu Lehui       2023-02-15  1262  	kfree(branches_off);
49b5e77ae3e214 Pu Lehui       2023-02-15  1263  	return ret;
49b5e77ae3e214 Pu Lehui       2023-02-15  1264  }
49b5e77ae3e214 Pu Lehui       2023-02-15  1265  

:::::: The code at line 1010 was first introduced by commit
:::::: 49b5e77ae3e214acff4728595b4ac7bf776693ca riscv, bpf: Add bpf trampoline support for RV64

:::::: TO: Pu Lehui <pulehui@huawei.com>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
