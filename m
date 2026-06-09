Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366EE2DE6F8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003800; cv=none; b=diFOwmrz9C2JnuMOg/waHA+1ugZNc5579KfSjv9g0VUXAI3fc5MqBBtGMVAfTdBB8ueDf1V79cSIdG4RdJWRftIWlmQdbEP15jjav712Wn2KDTO3Bk+UQkI71XRurEYKJFtah3FQ7Aftn8BjCfUteVQHPZubZykHZ55A7OdTKhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003800; c=relaxed/simple;
	bh=baQk5mzzLPemsWLGYwQRlA0qhwJac83jVCrTeY+t448=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KKqNFUAD/s6cDuYrMyGEk/svOmbJKPJ7WjgtCqOTK65DJpMc/+z0dqCGZ9Al7Ec9pEV7jrjD29/zUzsRqffzXQTxX1PXPMVXmWCweisRxou5SWzeX83gmxMSjZeMicHYtAZGZoJrXZn63s127IZVAbYPEBaBG3hl/x0RqFNBsTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHOGc7kl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHOGc7kl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781003796; x=1812539796;
  h=date:from:to:cc:subject:message-id;
  bh=baQk5mzzLPemsWLGYwQRlA0qhwJac83jVCrTeY+t448=;
  b=OHOGc7kl/f15jeEaDbVbknQ5HlGCq6aFGn/uiHTTvcZP0Io5L6R/0T/0
   G7kc2N4IBlMXUVYgb6fTJADcSSVsv2eQwxVsl0VESX8HG9FwA/kQM9otR
   gJ8vVcdLyqZ3YVr7jeQDgn1kKKZe9040EtZhltxfmRUHtnkkKE278q4sA
   LQ0UALAUM0L4T0+hQOXS8TnUIlBUqeudBO+TG88BlKhMeg5V7M3+xHJM2
   bF73VWfCa3GRuacxH8NEo0ILw7uq5xe1u0G/aT3pq4us1HzjJVqnGgzxU
   9Ql9drip7FebdQmNbEzqDZpNCH9R6n1yP9GeUE9pStTAyaLRGsJ2JF9AN
   A==;
X-CSE-ConnectionGUID: 5eTng7FCRKiopqdkxQtCYw==
X-CSE-MsgGUID: G6oOQWLfR5OiTG11ZD/T1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85650791"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="85650791"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 04:16:34 -0700
X-CSE-ConnectionGUID: 0eCixkbwSC6k1P6FdG0X6w==
X-CSE-MsgGUID: /9YGwX1BRpS89WJVUnaz9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="283916245"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Jun 2026 04:16:32 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWuRZ-00000000Jww-0Ur8;
	Tue, 09 Jun 2026 11:16:29 +0000
Date: Tue, 09 Jun 2026 19:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:verifier/errors/v1 11/17]
 kernel/bpf/verifier.c:13012:1: warning: the frame size of 1448 bytes is
 larger than 1280 bytes
Message-ID: <202606091910.O46Ovata-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux verifier/errors/v1
head:   bd319f349f948035a4c5b93b96b109695d7eb130
commit: 091742f087145044c61adf274356e80f73fa3ef0 [11/17] bpf: Report Call Type Safety argument errors
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260609/202606091910.O46Ovata-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606091910.O46Ovata-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606091910.O46Ovata-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'check_kfunc_args':
>> kernel/bpf/verifier.c:13012:1: warning: the frame size of 1448 bytes is larger than 1280 bytes [-Wframe-larger-than=]
   13012 | }
         | ^


vim +13012 kernel/bpf/verifier.c

9c66dc94b62aef Chuyi Zhou              2023-10-18  12225  
1d18feb2c915c5 Joanne Koong            2023-03-01  12226  static int check_kfunc_args(struct bpf_verifier_env *env, struct bpf_kfunc_call_arg_meta *meta,
1d18feb2c915c5 Joanne Koong            2023-03-01  12227  			    int insn_idx)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12228  {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12229  	const char *func_name = meta->func_name, *ref_tname;
e0b7b91c72db6d Yonghong Song           2026-05-12  12230  	struct bpf_func_state *caller = cur_func(env);
e0b7b91c72db6d Yonghong Song           2026-05-12  12231  	struct bpf_reg_state *regs = cur_regs(env);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12232  	const struct btf *btf = meta->btf;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12233  	const struct btf_param *args;
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12234  	struct btf_record *rec;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12235  	u32 i, nargs;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12236  	int ret;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12237  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12238  	args = (const struct btf_param *)(meta->func_proto + 1);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12239  	nargs = btf_type_vlen(meta->func_proto);
e0b7b91c72db6d Yonghong Song           2026-05-12  12240  	if (nargs > MAX_BPF_FUNC_ARGS) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12241  		verbose(env, "Function %s has %d > %d args\n", func_name, nargs,
e0b7b91c72db6d Yonghong Song           2026-05-12  12242  			MAX_BPF_FUNC_ARGS);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12243  		return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12244  	}
e0b7b91c72db6d Yonghong Song           2026-05-12  12245  	if (nargs > MAX_BPF_FUNC_REG_ARGS && !bpf_jit_supports_stack_args()) {
e0b7b91c72db6d Yonghong Song           2026-05-12  12246  		verbose(env, "JIT does not support kfunc %s() with %d args\n",
e0b7b91c72db6d Yonghong Song           2026-05-12  12247  			func_name, nargs);
e0b7b91c72db6d Yonghong Song           2026-05-12  12248  		return -ENOTSUPP;
e0b7b91c72db6d Yonghong Song           2026-05-12  12249  	}
e0b7b91c72db6d Yonghong Song           2026-05-12  12250  
cdff134a431533 Kumar Kartikeya Dwivedi 2026-06-04  12251  	ret = check_outgoing_stack_args(env, caller, nargs, func_name);
e0b7b91c72db6d Yonghong Song           2026-05-12  12252  	if (ret)
e0b7b91c72db6d Yonghong Song           2026-05-12  12253  		return ret;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12254  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12255  	/* Check that BTF function arguments match actual types that the
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12256  	 * verifier sees.
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12257  	 */
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12258  	for (i = 0; i < nargs; i++) {
e0b7b91c72db6d Yonghong Song           2026-05-12  12259  		struct bpf_reg_state *reg = get_func_arg_reg(caller, regs, i);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12260  		const struct btf_type *t, *ref_t, *resolve_ret;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12261  		enum bpf_arg_type arg_type = ARG_DONTCARE;
9b9f0b42703ceb Yonghong Song           2026-04-22  12262  		argno_t argno = argno_from_arg(i + 1);
e0b7b91c72db6d Yonghong Song           2026-05-12  12263  		int regno = reg_from_argno(argno);
e0b7b91c72db6d Yonghong Song           2026-05-12  12264  		u32 ref_id, type_size;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12265  		bool is_ret_buf_sz = false;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12266  		int kf_arg_type;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12267  
aed57a36387135 Ihor Solodrai           2026-01-20  12268  		if (is_kfunc_arg_prog_aux(btf, &args[i])) {
aed57a36387135 Ihor Solodrai           2026-01-20  12269  			/* Reject repeated use bpf_prog_aux */
bc049387b41f41 Kumar Kartikeya Dwivedi 2025-05-13  12270  			if (meta->arg_prog) {
0df1a55afa832f Paul Chaignon           2025-07-01  12271  				verifier_bug(env, "Only 1 prog->aux argument supported per-kfunc");
bc049387b41f41 Kumar Kartikeya Dwivedi 2025-05-13  12272  				return -EFAULT;
bc049387b41f41 Kumar Kartikeya Dwivedi 2025-05-13  12273  			}
e0b7b91c72db6d Yonghong Song           2026-05-12  12274  			if (regno < 0) {
e0b7b91c72db6d Yonghong Song           2026-05-12  12275  				verbose(env, "%s prog->aux cannot be a stack argument\n",
e0b7b91c72db6d Yonghong Song           2026-05-12  12276  					reg_arg_name(env, argno));
e0b7b91c72db6d Yonghong Song           2026-05-12  12277  				return -EINVAL;
e0b7b91c72db6d Yonghong Song           2026-05-12  12278  			}
bc049387b41f41 Kumar Kartikeya Dwivedi 2025-05-13  12279  			meta->arg_prog = true;
bc049387b41f41 Kumar Kartikeya Dwivedi 2025-05-13  12280  			cur_aux(env)->arg_prog = regno;
bc049387b41f41 Kumar Kartikeya Dwivedi 2025-05-13  12281  			continue;
bc049387b41f41 Kumar Kartikeya Dwivedi 2025-05-13  12282  		}
bc049387b41f41 Kumar Kartikeya Dwivedi 2025-05-13  12283  
d457072576a6a6 Ihor Solodrai           2026-03-27  12284  		if (is_kfunc_arg_ignore(btf, &args[i]) || is_kfunc_arg_implicit(meta, i))
d457072576a6a6 Ihor Solodrai           2026-03-27  12285  			continue;
d457072576a6a6 Ihor Solodrai           2026-03-27  12286  
d457072576a6a6 Ihor Solodrai           2026-03-27  12287  		t = btf_type_skip_modifiers(btf, args[i].type, NULL);
d457072576a6a6 Ihor Solodrai           2026-03-27  12288  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12289  		if (btf_type_is_scalar(t)) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12290  			if (reg->type != SCALAR_VALUE) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12291  				char reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12292  
9b9f0b42703ceb Yonghong Song           2026-04-22  12293  				verbose(env, "%s is not a scalar\n", reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12294  				scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12295  					  "the kfunc expects an integer scalar, but %s is %s",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12296  					  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12297  					  bpf_diag_reg_type_plain(env, reg->type));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12298  				bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12299  							  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12300  							  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12301  							  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12302  							  "Pass an integer scalar value for this argument, not a pointer or resource object.");
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12303  				return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12304  			}
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12305  
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12306  			if (is_kfunc_arg_constant(meta->btf, &args[i])) {
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12307  				if (meta->arg_constant.found) {
0df1a55afa832f Paul Chaignon           2025-07-01  12308  					verifier_bug(env, "only one constant argument permitted");
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12309  					return -EFAULT;
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12310  				}
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12311  				if (!tnum_is_const(reg->var_off)) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12312  					char reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12313  
9b9f0b42703ceb Yonghong Song           2026-04-22  12314  					verbose(env, "%s must be a known constant\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12315  						reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12316  					scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12317  						  "the kfunc requires this scalar argument to be a verifier-known constant, but %s is variable on this path",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12318  						  reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12319  					bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12320  								  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12321  								  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12322  								  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12323  								  "Pass a compile-time constant or a value the verifier can prove is constant at this call.");
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12324  					return -EINVAL;
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12325  				}
e0b7b91c72db6d Yonghong Song           2026-05-12  12326  				if (regno >= 0)
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12327  					ret = mark_chain_precision(env, regno);
e0b7b91c72db6d Yonghong Song           2026-05-12  12328  				else
e0b7b91c72db6d Yonghong Song           2026-05-12  12329  					ret = mark_stack_arg_precision(env, i);
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12330  				if (ret < 0)
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12331  					return ret;
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12332  				meta->arg_constant.found = true;
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12333  				meta->arg_constant.value = reg->var_off.value;
a50388dbb328a4 Kumar Kartikeya Dwivedi 2022-11-18  12334  			} else if (is_kfunc_arg_scalar_with_name(btf, &args[i], "rdonly_buf_size")) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12335  				meta->r0_rdonly = true;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12336  				is_ret_buf_sz = true;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12337  			} else if (is_kfunc_arg_scalar_with_name(btf, &args[i], "rdwr_buf_size")) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12338  				is_ret_buf_sz = true;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12339  			}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12340  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12341  			if (is_ret_buf_sz) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12342  				if (meta->r0_size) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12343  					verbose(env, "2 or more rdonly/rdwr_buf_size parameters for kfunc");
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12344  					return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12345  				}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12346  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12347  				if (!tnum_is_const(reg->var_off)) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12348  					char reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12349  
9b9f0b42703ceb Yonghong Song           2026-04-22  12350  					verbose(env, "%s is not a const\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12351  						reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12352  					scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12353  						  "the kfunc uses this argument as a return-buffer size, but %s is variable on this path",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12354  						  reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12355  					bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12356  								  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12357  								  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12358  								  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12359  								  "Pass a verifier-known constant size for this kfunc buffer argument.");
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12360  					return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12361  				}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12362  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12363  				meta->r0_size = reg->var_off.value;
e0b7b91c72db6d Yonghong Song           2026-05-12  12364  				if (regno >= 0)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12365  					ret = mark_chain_precision(env, regno);
e0b7b91c72db6d Yonghong Song           2026-05-12  12366  				else
e0b7b91c72db6d Yonghong Song           2026-05-12  12367  					ret = mark_stack_arg_precision(env, i);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12368  				if (ret)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12369  					return ret;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12370  			}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12371  			continue;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12372  		}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12373  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12374  		if (!btf_type_is_ptr(t)) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12375  			verbose(env, "Unrecognized %s type %s\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12376  				reg_arg_name(env, argno), btf_type_str(t));
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12377  			return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12378  		}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12379  
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12380  		ref_t = btf_type_skip_modifiers(btf, t->type, &ref_id);
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12381  		ref_tname = btf_name_by_offset(btf, ref_t->name_off);
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12382  
c82834a5a11f74 Alexei Starovoitov      2026-04-12  12383  		if ((bpf_register_is_null(reg) || type_may_be_null(reg->type)) &&
a069190b590e10 Puranjay Mohan          2026-01-02  12384  		    !is_kfunc_arg_nullable(meta->btf, &args[i])) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12385  			char expected_type[64], reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12386  
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12387  			bpf_diag_format_btf_type(expected_type,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12388  						 sizeof(expected_type), ref_t,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12389  						 ref_tname);
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12390  			scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12391  				  "the pointer may be NULL, but this kfunc requires a non-NULL pointer to %s",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12392  				  expected_type);
9b9f0b42703ceb Yonghong Song           2026-04-22  12393  			verbose(env, "Possibly NULL pointer passed to trusted %s\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12394  				reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12395  			bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12396  						  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12397  						  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12398  						  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12399  						  "Add a NULL check and call the kfunc only on the non-NULL path.");
caf713c338bd95 David Vernet            2023-01-25  12400  			return -EACCES;
caf713c338bd95 David Vernet            2023-01-25  12401  		}
caf713c338bd95 David Vernet            2023-01-25  12402  
bcfcb15fde94ed Amery Hung              2026-05-28  12403  		if (regno == meta->release_regno && !is_kfunc_arg_dynptr(meta->btf, &args[i]) &&
bcfcb15fde94ed Amery Hung              2026-05-28  12404  		    !reg_is_referenced(env, reg) && !bpf_register_is_null(reg)) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12405  			char expected_type[64], reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12406  
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12407  			bpf_diag_format_btf_type(expected_type,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12408  						 sizeof(expected_type), ref_t,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12409  						 ref_tname);
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12410  			scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12411  				  "release kfuncs require a resource-owning pointer to %s returned by a matching acquire kfunc",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12412  				  expected_type);
bcfcb15fde94ed Amery Hung              2026-05-28  12413  			verbose(env, "release kfunc %s expects referenced PTR_TO_BTF_ID passed to %s\n",
bcfcb15fde94ed Amery Hung              2026-05-28  12414  				func_name, reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12415  			bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12416  						  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12417  						  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12418  						  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12419  						  "Pass the resource-owning pointer returned by the matching acquire kfunc, and avoid calling the release kfunc after ownership has "
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12420  						  "already been transferred or released.");
e0b7b91c72db6d Yonghong Song           2026-05-12  12421  			return -EINVAL;
e0b7b91c72db6d Yonghong Song           2026-05-12  12422  		}
bcfcb15fde94ed Amery Hung              2026-05-28  12423  
bcfcb15fde94ed Amery Hung              2026-05-28  12424  		if (reg_is_referenced(env, reg))
bcfcb15fde94ed Amery Hung              2026-05-28  12425  			update_ref_obj(&meta->ref_obj, reg);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12426  
e0b7b91c72db6d Yonghong Song           2026-05-12  12427  		kf_arg_type = get_kfunc_ptr_arg_type(env, caller, regs, meta, t, ref_t, ref_tname,
e0b7b91c72db6d Yonghong Song           2026-05-12  12428  						     args, i, nargs, argno, reg);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12429  		if (kf_arg_type < 0)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12430  			return kf_arg_type;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12431  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12432  		switch (kf_arg_type) {
cb3ecf7915a1d7 Chuyi Zhou              2023-10-18  12433  		case KF_ARG_PTR_TO_NULL:
cb3ecf7915a1d7 Chuyi Zhou              2023-10-18  12434  			continue;
8d94f1357c00d7 Alexei Starovoitov      2024-03-06  12435  		case KF_ARG_PTR_TO_MAP:
ad2c03e691be32 Benjamin Tissoires      2024-04-20  12436  			if (!reg->map_ptr) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12437  				verbose(env, "pointer in %s isn't map pointer\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12438  					reg_arg_name(env, argno));
ad2c03e691be32 Benjamin Tissoires      2024-04-20  12439  				return -EINVAL;
ad2c03e691be32 Benjamin Tissoires      2024-04-20  12440  			}
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12441  			if (meta->map.ptr && (reg->map_ptr->record->wq_off >= 0 ||
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12442  					      reg->map_ptr->record->task_work_off >= 0)) {
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12443  				/* Use map_uid (which is unique id of inner map) to reject:
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12444  				 * inner_map1 = bpf_map_lookup_elem(outer_map, key1)
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12445  				 * inner_map2 = bpf_map_lookup_elem(outer_map, key2)
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12446  				 * if (inner_map1 && inner_map2) {
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12447  				 *     wq = bpf_map_lookup_elem(inner_map1);
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12448  				 *     if (wq)
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12449  				 *         // mismatch would have been allowed
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12450  				 *         bpf_wq_init(wq, inner_map2);
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12451  				 * }
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12452  				 *
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12453  				 * Comparing map_ptr is enough to distinguish normal and outer maps.
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12454  				 */
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12455  				if (meta->map.ptr != reg->map_ptr ||
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12456  				    meta->map.uid != reg->map_uid) {
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12457  					if (reg->map_ptr->record->task_work_off >= 0) {
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12458  						verbose(env,
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12459  							"bpf_task_work pointer in R2 map_uid=%d doesn't match map pointer in R3 map_uid=%d\n",
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12460  							meta->map.uid, reg->map_uid);
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12461  						return -EINVAL;
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12462  					}
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12463  					verbose(env,
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12464  						"workqueue pointer in R1 map_uid=%d doesn't match map pointer in R2 map_uid=%d\n",
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12465  						meta->map.uid, reg->map_uid);
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12466  					return -EINVAL;
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12467  				}
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12468  			}
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12469  			meta->map.ptr = reg->map_ptr;
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12470  			meta->map.uid = reg->map_uid;
ad2c03e691be32 Benjamin Tissoires      2024-04-20  12471  			fallthrough;
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  12472  		case KF_ARG_PTR_TO_ALLOC_BTF_ID:
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12473  		case KF_ARG_PTR_TO_BTF_ID:
308c7a0ae8859b Amery Hung              2026-05-28  12474  			if (!is_trusted_reg(env, reg)) {
fca1aa75518c03 Yonghong Song           2022-12-03  12475  				if (!is_kfunc_rcu(meta)) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12476  					char expected_type[64], reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12477  
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12478  					bpf_diag_format_btf_type(expected_type,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12479  								 sizeof(expected_type),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12480  								 ref_t, ref_tname);
9b9f0b42703ceb Yonghong Song           2026-04-22  12481  					verbose(env, "%s must be referenced or trusted\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12482  						reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12483  					scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12484  						  "the kfunc requires a trusted or resource-owning pointer to %s, but %s is %s",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12485  						  expected_type,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12486  						  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12487  						  bpf_diag_reg_type_plain(env, reg->type));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12488  					bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12489  								  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12490  								  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12491  								  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12492  								  "Pass a pointer acquired from a verifier-tracked source, or call this kfunc only inside the required protection if it accepts RCU "
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12493  								  "pointers.");
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12494  					return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12495  				}
fca1aa75518c03 Yonghong Song           2022-12-03  12496  				if (!is_rcu_reg(reg)) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12497  					char expected_type[64], reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12498  
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12499  					bpf_diag_format_btf_type(expected_type,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12500  								 sizeof(expected_type),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12501  								 ref_t, ref_tname);
9b9f0b42703ceb Yonghong Song           2026-04-22  12502  					verbose(env, "%s must be a rcu pointer\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12503  						reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12504  					scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12505  						  "the kfunc requires an RCU-protected pointer to %s, but %s is %s",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12506  						  expected_type,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12507  						  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12508  						  bpf_diag_reg_type_plain(env, reg->type));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12509  					bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12510  								  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12511  								  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12512  								  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12513  								  "Use this kfunc with a pointer that is valid in an RCU read lock region.");
fca1aa75518c03 Yonghong Song           2022-12-03  12514  					return -EINVAL;
fca1aa75518c03 Yonghong Song           2022-12-03  12515  				}
fca1aa75518c03 Yonghong Song           2022-12-03  12516  			}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12517  			fallthrough;
06accc8779c1d5 Andrii Nakryiko         2023-03-08  12518  		case KF_ARG_PTR_TO_ITER:
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12519  		case KF_ARG_PTR_TO_LIST_HEAD:
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12520  		case KF_ARG_PTR_TO_LIST_NODE:
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12521  		case KF_ARG_PTR_TO_RB_ROOT:
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12522  		case KF_ARG_PTR_TO_RB_NODE:
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12523  		case KF_ARG_PTR_TO_MEM:
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12524  		case KF_ARG_PTR_TO_MEM_SIZE:
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  12525  		case KF_ARG_PTR_TO_CALLBACK:
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12526  		case KF_ARG_PTR_TO_REFCOUNTED_KPTR:
045edee19d591e Song Liu                2023-11-06  12527  		case KF_ARG_PTR_TO_CONST_STR:
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12528  		case KF_ARG_PTR_TO_WORKQUEUE:
19bd300e22c2be Mykyta Yatsenko         2026-01-31  12529  		case KF_ARG_PTR_TO_TIMER:
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12530  		case KF_ARG_PTR_TO_TASK_WORK:
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12531  		case KF_ARG_PTR_TO_IRQ_FLAG:
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12532  		case KF_ARG_PTR_TO_RES_SPIN_LOCK:
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12533  			break;
bcfcb15fde94ed Amery Hung              2026-05-28  12534  		case KF_ARG_PTR_TO_DYNPTR:
bcfcb15fde94ed Amery Hung              2026-05-28  12535  			arg_type = ARG_PTR_TO_DYNPTR;
bcfcb15fde94ed Amery Hung              2026-05-28  12536  			break;
ae5ef001aa981e Kumar Kartikeya Dwivedi 2026-04-06  12537  		case KF_ARG_PTR_TO_CTX:
ae5ef001aa981e Kumar Kartikeya Dwivedi 2026-04-06  12538  			arg_type = ARG_PTR_TO_CTX;
ae5ef001aa981e Kumar Kartikeya Dwivedi 2026-04-06  12539  			break;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12540  		default:
0df1a55afa832f Paul Chaignon           2025-07-01  12541  			verifier_bug(env, "unknown kfunc arg type %d", kf_arg_type);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12542  			return -EFAULT;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12543  		}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12544  
bcfcb15fde94ed Amery Hung              2026-05-28  12545  		if (regno == meta->release_regno)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12546  			arg_type |= OBJ_RELEASE;
9b9f0b42703ceb Yonghong Song           2026-04-22  12547  		ret = check_func_arg_reg_off(env, reg, argno, arg_type);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12548  		if (ret < 0)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12549  			return ret;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12550  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12551  		switch (kf_arg_type) {
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12552  		case KF_ARG_PTR_TO_CTX:
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12553  			if (reg->type != PTR_TO_CTX) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12554  				char reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12555  
9b9f0b42703ceb Yonghong Song           2026-04-22  12556  				verbose(env, "%s expected pointer to ctx, but got %s\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12557  					reg_arg_name(env, argno), reg_type_str(env, reg->type));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12558  				scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12559  					  "the kfunc expects a context pointer, but %s is %s",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12560  					  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12561  					  bpf_diag_reg_type_plain(env, reg->type));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12562  				bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12563  								  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12564  								  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12565  								  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12566  								  "Pass the original program context pointer or preserve it before modifying registers.");
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12567  				return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12568  			}
fd264ca020948a Yonghong Song           2022-11-20  12569  
fd264ca020948a Yonghong Song           2022-11-20  12570  			if (meta->func_id == special_kfunc_list[KF_bpf_cast_to_kern_ctx]) {
fd264ca020948a Yonghong Song           2022-11-20  12571  				ret = get_kern_ctx_btf_id(&env->log, resolve_prog_type(env->prog));
fd264ca020948a Yonghong Song           2022-11-20  12572  				if (ret < 0)
fd264ca020948a Yonghong Song           2022-11-20  12573  					return -EINVAL;
fd264ca020948a Yonghong Song           2022-11-20  12574  				meta->ret_btf_id  = ret;
fd264ca020948a Yonghong Song           2022-11-20  12575  			}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12576  			break;
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  12577  		case KF_ARG_PTR_TO_ALLOC_BTF_ID:
36d8bdf75a9319 Yonghong Song           2023-08-27  12578  			if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC)) {
d457072576a6a6 Ihor Solodrai           2026-03-27  12579  				if (!is_bpf_obj_drop_kfunc(meta->func_id)) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12580  					verbose(env, "%s expected for bpf_obj_drop()\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12581  						reg_arg_name(env, argno));
36d8bdf75a9319 Yonghong Song           2023-08-27  12582  					return -EINVAL;
36d8bdf75a9319 Yonghong Song           2023-08-27  12583  				}
36d8bdf75a9319 Yonghong Song           2023-08-27  12584  			} else if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC | MEM_PERCPU)) {
d457072576a6a6 Ihor Solodrai           2026-03-27  12585  				if (!is_bpf_percpu_obj_drop_kfunc(meta->func_id)) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12586  					verbose(env, "%s expected for bpf_percpu_obj_drop()\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12587  						reg_arg_name(env, argno));
36d8bdf75a9319 Yonghong Song           2023-08-27  12588  					return -EINVAL;
36d8bdf75a9319 Yonghong Song           2023-08-27  12589  				}
36d8bdf75a9319 Yonghong Song           2023-08-27  12590  			} else {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12591  				char reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12592  
9b9f0b42703ceb Yonghong Song           2026-04-22  12593  				verbose(env, "%s expected pointer to allocated object\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12594  					reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12595  				scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12596  					  "the kfunc expects an allocated object pointer, but %s is %s",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12597  					  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12598  					  bpf_diag_reg_type_plain(env, reg->type));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12599  				bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12600  							  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12601  							  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12602  							  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12603  							  "Pass a pointer returned by the matching BPF object allocation path.");
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  12604  				return -EINVAL;
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  12605  			}
308c7a0ae8859b Amery Hung              2026-05-28  12606  			if (!reg_is_referenced(env, reg)) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12607  				char reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12608  
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  12609  				verbose(env, "allocated object must be referenced\n");
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12610  				scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12611  					  "the allocated object pointer in %s must still carry verifier-tracked ownership, but this pointer no longer owns a live resource",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12612  					  reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12613  				bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12614  							  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12615  							  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12616  							  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12617  							  "Pass the owned object pointer before it is released or transferred.");
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  12618  				return -EINVAL;
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  12619  			}
36d8bdf75a9319 Yonghong Song           2023-08-27  12620  			if (meta->btf == btf_vmlinux) {
4d585f48ee6b38 Dave Marchevsky         2023-05-10  12621  				meta->arg_btf = reg->btf;
4d585f48ee6b38 Dave Marchevsky         2023-05-10  12622  				meta->arg_btf_id = reg->btf_id;
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  12623  			}
ac9f06050a3580 Kumar Kartikeya Dwivedi 2022-11-18  12624  			break;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12625  		case KF_ARG_PTR_TO_DYNPTR:
d96d937d7c5c12 Joanne Koong            2023-03-01  12626  		{
d96d937d7c5c12 Joanne Koong            2023-03-01  12627  			enum bpf_arg_type dynptr_arg_type = ARG_PTR_TO_DYNPTR;
d96d937d7c5c12 Joanne Koong            2023-03-01  12628  
d96d937d7c5c12 Joanne Koong            2023-03-01  12629  			if (is_kfunc_arg_uninit(btf, &args[i]))
d96d937d7c5c12 Joanne Koong            2023-03-01  12630  				dynptr_arg_type |= MEM_UNINIT;
d96d937d7c5c12 Joanne Koong            2023-03-01  12631  
361f129f3cc185 Joanne Koong            2023-04-20  12632  			if (meta->func_id == special_kfunc_list[KF_bpf_dynptr_from_skb]) {
b5964b968ac64c Joanne Koong            2023-03-01  12633  				dynptr_arg_type |= DYNPTR_TYPE_SKB;
361f129f3cc185 Joanne Koong            2023-04-20  12634  			} else if (meta->func_id == special_kfunc_list[KF_bpf_dynptr_from_xdp]) {
05421aecd4ed65 Joanne Koong            2023-03-01  12635  				dynptr_arg_type |= DYNPTR_TYPE_XDP;
89d912e494f786 Jakub Sitnicki          2025-08-14  12636  			} else if (meta->func_id == special_kfunc_list[KF_bpf_dynptr_from_skb_meta]) {
89d912e494f786 Jakub Sitnicki          2025-08-14  12637  				dynptr_arg_type |= DYNPTR_TYPE_SKB_META;
8d8771dc03e483 Mykyta Yatsenko         2025-10-26  12638  			} else if (meta->func_id == special_kfunc_list[KF_bpf_dynptr_from_file]) {
8d8771dc03e483 Mykyta Yatsenko         2025-10-26  12639  				dynptr_arg_type |= DYNPTR_TYPE_FILE;
8d8771dc03e483 Mykyta Yatsenko         2025-10-26  12640  			} else if (meta->func_id == special_kfunc_list[KF_bpf_dynptr_file_discard]) {
31f61ac33032ee Amery Hung              2026-04-14  12641  				dynptr_arg_type |= DYNPTR_TYPE_FILE | OBJ_RELEASE;
361f129f3cc185 Joanne Koong            2023-04-20  12642  			} else if (meta->func_id == special_kfunc_list[KF_bpf_dynptr_clone] &&
361f129f3cc185 Joanne Koong            2023-04-20  12643  				   (dynptr_arg_type & MEM_UNINIT)) {
b5c0a07eb2c23b Amery Hung              2026-05-28  12644  				enum bpf_dynptr_type parent_type = meta->dynptr.type;
361f129f3cc185 Joanne Koong            2023-04-20  12645  
361f129f3cc185 Joanne Koong            2023-04-20  12646  				if (parent_type == BPF_DYNPTR_TYPE_INVALID) {
0df1a55afa832f Paul Chaignon           2025-07-01  12647  					verifier_bug(env, "no dynptr type for parent of clone");
361f129f3cc185 Joanne Koong            2023-04-20  12648  					return -EFAULT;
361f129f3cc185 Joanne Koong            2023-04-20  12649  				}
361f129f3cc185 Joanne Koong            2023-04-20  12650  
361f129f3cc185 Joanne Koong            2023-04-20  12651  				dynptr_arg_type |= (unsigned int)get_dynptr_type_flag(parent_type);
361f129f3cc185 Joanne Koong            2023-04-20  12652  			}
b5964b968ac64c Joanne Koong            2023-03-01  12653  
b5c0a07eb2c23b Amery Hung              2026-05-28  12654  			ret = process_dynptr_func(env, reg, argno, insn_idx, dynptr_arg_type,
b7dd2b388657d9 Amery Hung              2026-05-28  12655  						  &meta->ref_obj, &meta->dynptr);
6b75bd3d036745 Kumar Kartikeya Dwivedi 2022-12-08  12656  			if (ret < 0)
6b75bd3d036745 Kumar Kartikeya Dwivedi 2022-12-08  12657  				return ret;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12658  			break;
d96d937d7c5c12 Joanne Koong            2023-03-01  12659  		}
06accc8779c1d5 Andrii Nakryiko         2023-03-08  12660  		case KF_ARG_PTR_TO_ITER:
9c66dc94b62aef Chuyi Zhou              2023-10-18  12661  			if (meta->func_id == special_kfunc_list[KF_bpf_iter_css_task_new]) {
9c66dc94b62aef Chuyi Zhou              2023-10-18  12662  				if (!check_css_task_iter_allowlist(env)) {
3091b667498b0a Chuyi Zhou              2023-10-31  12663  					verbose(env, "css_task_iter is only allowed in bpf_lsm, bpf_iter and sleepable progs\n");
9c66dc94b62aef Chuyi Zhou              2023-10-18  12664  					return -EINVAL;
9c66dc94b62aef Chuyi Zhou              2023-10-18  12665  				}
9c66dc94b62aef Chuyi Zhou              2023-10-18  12666  			}
9b9f0b42703ceb Yonghong Song           2026-04-22  12667  			ret = process_iter_arg(env, reg, argno, insn_idx, meta);
06accc8779c1d5 Andrii Nakryiko         2023-03-08  12668  			if (ret < 0)
06accc8779c1d5 Andrii Nakryiko         2023-03-08  12669  				return ret;
06accc8779c1d5 Andrii Nakryiko         2023-03-08  12670  			break;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12671  		case KF_ARG_PTR_TO_LIST_HEAD:
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12672  			if (reg->type != PTR_TO_MAP_VALUE &&
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12673  			    reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12674  				verbose(env, "%s expected pointer to map value or allocated object\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12675  					reg_arg_name(env, argno));
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12676  				return -EINVAL;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12677  			}
308c7a0ae8859b Amery Hung              2026-05-28  12678  			if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC) &&
308c7a0ae8859b Amery Hung              2026-05-28  12679  			    !reg_is_referenced(env, reg)) {
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12680  				verbose(env, "allocated object must be referenced\n");
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12681  				return -EINVAL;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12682  			}
9b9f0b42703ceb Yonghong Song           2026-04-22  12683  			ret = process_kf_arg_ptr_to_list_head(env, reg, argno, meta);
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12684  			if (ret < 0)
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12685  				return ret;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12686  			break;
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12687  		case KF_ARG_PTR_TO_RB_ROOT:
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12688  			if (reg->type != PTR_TO_MAP_VALUE &&
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12689  			    reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12690  				verbose(env, "%s expected pointer to map value or allocated object\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12691  					reg_arg_name(env, argno));
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12692  				return -EINVAL;
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12693  			}
308c7a0ae8859b Amery Hung              2026-05-28  12694  			if (reg->type == (PTR_TO_BTF_ID | MEM_ALLOC) &&
308c7a0ae8859b Amery Hung              2026-05-28  12695  			    !reg_is_referenced(env, reg)) {
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12696  				verbose(env, "allocated object must be referenced\n");
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12697  				return -EINVAL;
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12698  			}
9b9f0b42703ceb Yonghong Song           2026-04-22  12699  			ret = process_kf_arg_ptr_to_rbtree_root(env, reg, argno, meta);
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12700  			if (ret < 0)
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12701  				return ret;
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12702  			break;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12703  		case KF_ARG_PTR_TO_LIST_NODE:
7c8c71591b7682 Kaitao Cheng            2026-05-21  12704  			if (is_kfunc_arg_nonown_allowed(btf, &args[i]) &&
308c7a0ae8859b Amery Hung              2026-05-28  12705  			    type_is_non_owning_ref(reg->type) && !reg_is_referenced(env, reg)) {
7c8c71591b7682 Kaitao Cheng            2026-05-21  12706  				/* Allow bpf_list_front/back return value for
7c8c71591b7682 Kaitao Cheng            2026-05-21  12707  				 * __nonown_allowed list-node arguments.
7c8c71591b7682 Kaitao Cheng            2026-05-21  12708  				 */
7c8c71591b7682 Kaitao Cheng            2026-05-21  12709  				goto check_ok;
7c8c71591b7682 Kaitao Cheng            2026-05-21  12710  			}
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12711  			if (reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12712  				verbose(env, "%s expected pointer to allocated object\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12713  					reg_arg_name(env, argno));
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12714  				return -EINVAL;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12715  			}
308c7a0ae8859b Amery Hung              2026-05-28  12716  			if (!reg_is_referenced(env, reg)) {
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12717  				verbose(env, "allocated object must be referenced\n");
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12718  				return -EINVAL;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12719  			}
7c8c71591b7682 Kaitao Cheng            2026-05-21  12720  check_ok:
9b9f0b42703ceb Yonghong Song           2026-04-22  12721  			ret = process_kf_arg_ptr_to_list_node(env, reg, argno, meta);
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12722  			if (ret < 0)
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12723  				return ret;
8cab76ec634995 Kumar Kartikeya Dwivedi 2022-11-18  12724  			break;
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12725  		case KF_ARG_PTR_TO_RB_NODE:
d457072576a6a6 Ihor Solodrai           2026-03-27  12726  			if (is_bpf_rbtree_add_kfunc(meta->func_id)) {
b183c0123d9ba1 Martin KaFai Lau        2025-05-05  12727  				if (reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12728  					verbose(env, "%s expected pointer to allocated object\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12729  						reg_arg_name(env, argno));
a40d3632436b16 Dave Marchevsky         2023-02-13  12730  					return -EINVAL;
a40d3632436b16 Dave Marchevsky         2023-02-13  12731  				}
308c7a0ae8859b Amery Hung              2026-05-28  12732  				if (!reg_is_referenced(env, reg)) {
b183c0123d9ba1 Martin KaFai Lau        2025-05-05  12733  					verbose(env, "allocated object must be referenced\n");
a40d3632436b16 Dave Marchevsky         2023-02-13  12734  					return -EINVAL;
a40d3632436b16 Dave Marchevsky         2023-02-13  12735  				}
a40d3632436b16 Dave Marchevsky         2023-02-13  12736  			} else {
308c7a0ae8859b Amery Hung              2026-05-28  12737  				if (!type_is_non_owning_ref(reg->type) &&
308c7a0ae8859b Amery Hung              2026-05-28  12738  				    !reg_is_referenced(env, reg)) {
2ddef1783c43ba Martin KaFai Lau        2025-05-05  12739  					verbose(env, "%s can only take non-owning or refcounted bpf_rb_node pointer\n", func_name);
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12740  					return -EINVAL;
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12741  				}
b183c0123d9ba1 Martin KaFai Lau        2025-05-05  12742  				if (in_rbtree_lock_required_cb(env)) {
9e3e66c553f705 Martin KaFai Lau        2025-05-05  12743  					verbose(env, "%s not allowed in rbtree cb\n", func_name);
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12744  					return -EINVAL;
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12745  				}
a40d3632436b16 Dave Marchevsky         2023-02-13  12746  			}
a40d3632436b16 Dave Marchevsky         2023-02-13  12747  
9b9f0b42703ceb Yonghong Song           2026-04-22  12748  			ret = process_kf_arg_ptr_to_rbtree_node(env, reg, argno, meta);
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12749  			if (ret < 0)
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12750  				return ret;
cd6791b4b6f66f Dave Marchevsky         2023-02-13  12751  			break;
8d94f1357c00d7 Alexei Starovoitov      2024-03-06  12752  		case KF_ARG_PTR_TO_MAP:
8d94f1357c00d7 Alexei Starovoitov      2024-03-06  12753  			/* If argument has '__map' suffix expect 'struct bpf_map *' */
8d94f1357c00d7 Alexei Starovoitov      2024-03-06  12754  			ref_id = *reg2btf_ids[CONST_PTR_TO_MAP];
8d94f1357c00d7 Alexei Starovoitov      2024-03-06  12755  			ref_t = btf_type_by_id(btf_vmlinux, ref_id);
8d94f1357c00d7 Alexei Starovoitov      2024-03-06  12756  			ref_tname = btf_name_by_offset(btf, ref_t->name_off);
8d94f1357c00d7 Alexei Starovoitov      2024-03-06  12757  			fallthrough;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12758  		case KF_ARG_PTR_TO_BTF_ID:
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12759  			/* Only base_type is checked, further checks are done here */
3f00c52393445e David Vernet            2022-11-19  12760  			if ((base_type(reg->type) != PTR_TO_BTF_ID ||
fca1aa75518c03 Yonghong Song           2022-12-03  12761  			     (bpf_type_has_unsafe_modifiers(reg->type) && !is_rcu_reg(reg))) &&
3f00c52393445e David Vernet            2022-11-19  12762  			    !reg2btf_ids[base_type(reg->type)]) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12763  				verbose(env, "%s is %s ", reg_arg_name(env, argno),
9b9f0b42703ceb Yonghong Song           2026-04-22  12764  					reg_type_str(env, reg->type));
3f00c52393445e David Vernet            2022-11-19  12765  				verbose(env, "expected %s or socket\n",
3f00c52393445e David Vernet            2022-11-19  12766  					reg_type_str(env, base_type(reg->type) |
3f00c52393445e David Vernet            2022-11-19  12767  							  (type_flag(reg->type) & BPF_REG_TRUSTED_MODIFIERS)));
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12768  				return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12769  			}
9b9f0b42703ceb Yonghong Song           2026-04-22  12770  			ret = process_kf_arg_ptr_to_btf_id(env, reg, ref_t, ref_tname, ref_id, meta, i, argno);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12771  			if (ret < 0)
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12772  				return ret;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12773  			break;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12774  		case KF_ARG_PTR_TO_MEM:
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12775  			resolve_ret = btf_resolve_size(btf, ref_t, &type_size);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12776  			if (IS_ERR(resolve_ret)) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12777  				verbose(env, "%s reference type('%s %s') size cannot be determined: %ld\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12778  					reg_arg_name(env, argno), btf_type_str(ref_t),
9b9f0b42703ceb Yonghong Song           2026-04-22  12779  					ref_tname, PTR_ERR(resolve_ret));
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12780  				return -EINVAL;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12781  			}
9b9f0b42703ceb Yonghong Song           2026-04-22  12782  			ret = check_mem_reg(env, reg, argno, type_size);
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12783  			if (ret < 0) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12784  				char arg_name[32], expected_type[64], reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12785  
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12786  				strscpy(arg_name, reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12787  					sizeof(arg_name));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12788  				bpf_diag_format_btf_type(expected_type,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12789  							 sizeof(expected_type),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12790  							 ref_t, ref_tname);
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12791  				scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12792  					  "the kfunc expects %u bytes of memory for %s, but it is %s and not verifier-known memory",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12793  					  type_size, expected_type,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12794  					  bpf_diag_reg_type_plain(env,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12795  								  reg->type));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12796  				bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12797  							  func_name, arg_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12798  							  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12799  							  "Pass stack, map, context, or other verifier-known memory of the expected type and size, not an integer cast to a pointer.");
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12800  				return ret;
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12801  			}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12802  			break;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12803  		case KF_ARG_PTR_TO_MEM_SIZE:
66e3a13e7c2c44 Joanne Koong            2023-03-01  12804  		{
e0b7b91c72db6d Yonghong Song           2026-05-12  12805  			struct bpf_reg_state *buff_reg = reg;
3bda08b63670c3 Daniel Rosenberg        2023-05-05  12806  			const struct btf_param *buff_arg = &args[i];
e0b7b91c72db6d Yonghong Song           2026-05-12  12807  			struct bpf_reg_state *size_reg = get_func_arg_reg(caller, regs, i + 1);
66e3a13e7c2c44 Joanne Koong            2023-03-01  12808  			const struct btf_param *size_arg = &args[i + 1];
9b9f0b42703ceb Yonghong Song           2026-04-22  12809  			argno_t next_argno = argno_from_arg(i + 2);
66e3a13e7c2c44 Joanne Koong            2023-03-01  12810  
c82834a5a11f74 Alexei Starovoitov      2026-04-12  12811  			if (!bpf_register_is_null(buff_reg) || !is_kfunc_arg_nullable(meta->btf, buff_arg)) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12812  				ret = check_kfunc_mem_size_reg(env, buff_reg, size_reg,
9b9f0b42703ceb Yonghong Song           2026-04-22  12813  							       argno, next_argno);
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12814  				if (ret < 0) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12815  					char mem_arg[32], size_arg[32];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12816  					char reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12817  
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12818  					strscpy(mem_arg, reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12819  						sizeof(mem_arg));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12820  					strscpy(size_arg, reg_arg_name(env, next_argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12821  						sizeof(size_arg));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12822  					verbose(env, "%s and ", mem_arg);
9b9f0b42703ceb Yonghong Song           2026-04-22  12823  					verbose(env, "%s memory, len pair leads to invalid memory access\n",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12824  						size_arg);
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12825  					scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12826  						  "it is the memory pointer in a memory/length pair with %s, but it is %s and does not point to verifier-readable memory for the "
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12827  						  "requested length",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12828  						  size_arg,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12829  						  bpf_diag_reg_type_plain(env,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12830  									  buff_reg->type));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12831  					bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12832  								  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12833  								  mem_arg,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12834  								  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12835  								  "Pass a stack, map, context, or other verifier-known memory pointer, and keep the paired length within that object.");
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12836  					return ret;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12837  				}
3bda08b63670c3 Daniel Rosenberg        2023-05-05  12838  			}
66e3a13e7c2c44 Joanne Koong            2023-03-01  12839  
66e3a13e7c2c44 Joanne Koong            2023-03-01  12840  			if (is_kfunc_arg_const_mem_size(meta->btf, size_arg, size_reg)) {
66e3a13e7c2c44 Joanne Koong            2023-03-01  12841  				if (meta->arg_constant.found) {
0df1a55afa832f Paul Chaignon           2025-07-01  12842  					verifier_bug(env, "only one constant argument permitted");
66e3a13e7c2c44 Joanne Koong            2023-03-01  12843  					return -EFAULT;
66e3a13e7c2c44 Joanne Koong            2023-03-01  12844  				}
66e3a13e7c2c44 Joanne Koong            2023-03-01  12845  				if (!tnum_is_const(size_reg->var_off)) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12846  					char reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12847  
9b9f0b42703ceb Yonghong Song           2026-04-22  12848  					verbose(env, "%s must be a known constant\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12849  						reg_arg_name(env, next_argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12850  					scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12851  						  "the kfunc requires the paired memory size argument %s to be a verifier-known constant, but it is variable on this path",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12852  						  reg_arg_name(env, next_argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12853  					bpf_diag_report_call_type(env, insn_idx,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12854  								  reg_from_argno(next_argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12855  								  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12856  								  reg_arg_name(env, next_argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12857  								  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12858  								  "Pass a compile-time constant or verifier-known constant for this memory size argument.");
66e3a13e7c2c44 Joanne Koong            2023-03-01  12859  					return -EINVAL;
66e3a13e7c2c44 Joanne Koong            2023-03-01  12860  				}
66e3a13e7c2c44 Joanne Koong            2023-03-01  12861  				meta->arg_constant.found = true;
66e3a13e7c2c44 Joanne Koong            2023-03-01  12862  				meta->arg_constant.value = size_reg->var_off.value;
66e3a13e7c2c44 Joanne Koong            2023-03-01  12863  			}
66e3a13e7c2c44 Joanne Koong            2023-03-01  12864  
66e3a13e7c2c44 Joanne Koong            2023-03-01  12865  			/* Skip next '__sz' or '__szk' argument */
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12866  			i++;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  12867  			break;
66e3a13e7c2c44 Joanne Koong            2023-03-01  12868  		}
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  12869  		case KF_ARG_PTR_TO_CALLBACK:
06d686f771ddc2 Kumar Kartikeya Dwivedi 2023-09-13  12870  			if (reg->type != PTR_TO_FUNC) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12871  				verbose(env, "%s expected pointer to func\n", reg_arg_name(env, argno));
06d686f771ddc2 Kumar Kartikeya Dwivedi 2023-09-13  12872  				return -EINVAL;
06d686f771ddc2 Kumar Kartikeya Dwivedi 2023-09-13  12873  			}
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  12874  			meta->subprogno = reg->subprogno;
5d92ddc3de1b44 Dave Marchevsky         2023-02-13  12875  			break;
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12876  		case KF_ARG_PTR_TO_REFCOUNTED_KPTR:
7793fc3babe9fe Dave Marchevsky         2023-06-01  12877  			if (!type_is_ptr_alloc_obj(reg->type)) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12878  				char expected_type[64], reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12879  
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12880  				bpf_diag_format_btf_type(expected_type,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12881  							 sizeof(expected_type),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12882  							 ref_t, ref_tname);
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12883  				scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12884  					  "the kfunc expects a pointer to BPF-managed refcounted object type %s, but this argument is not such an object pointer",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12885  					  expected_type);
9b9f0b42703ceb Yonghong Song           2026-04-22  12886  				verbose(env, "%s is neither owning or non-owning ref\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12887  					reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12888  				bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12889  							  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12890  							  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12891  							  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12892  							  "Pass a pointer returned by the matching BPF object allocation or lookup operation for this kfunc.");
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12893  				return -EINVAL;
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12894  			}
7793fc3babe9fe Dave Marchevsky         2023-06-01  12895  			if (!type_is_non_owning_ref(reg->type))
7793fc3babe9fe Dave Marchevsky         2023-06-01  12896  				meta->arg_owning_ref = true;
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12897  
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12898  			rec = reg_btf_record(reg);
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12899  			if (!rec) {
0df1a55afa832f Paul Chaignon           2025-07-01  12900  				verifier_bug(env, "Couldn't find btf_record");
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12901  				return -EFAULT;
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12902  			}
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12903  
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12904  			if (rec->refcount_off < 0) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12905  				verbose(env, "%s doesn't point to a type with bpf_refcount field\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12906  					reg_arg_name(env, argno));
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12907  				return -EINVAL;
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12908  			}
ba2464c86f182c Dave Marchevsky         2023-08-21  12909  
4d585f48ee6b38 Dave Marchevsky         2023-05-10  12910  			meta->arg_btf = reg->btf;
4d585f48ee6b38 Dave Marchevsky         2023-05-10  12911  			meta->arg_btf_id = reg->btf_id;
7c50b1cb76aca4 Dave Marchevsky         2023-04-15  12912  			break;
045edee19d591e Song Liu                2023-11-06  12913  		case KF_ARG_PTR_TO_CONST_STR:
045edee19d591e Song Liu                2023-11-06  12914  			if (reg->type != PTR_TO_MAP_VALUE) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12915  				char reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12916  
9b9f0b42703ceb Yonghong Song           2026-04-22  12917  				verbose(env, "%s doesn't point to a const string\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12918  					reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12919  				scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12920  					  "the kfunc expects a pointer to a constant string stored in verifier-known memory, but %s is %s",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12921  					  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12922  					  bpf_diag_reg_type_plain(env, reg->type));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12923  				bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12924  							  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12925  							  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12926  							  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12927  							  "Pass a constant string pointer that the verifier recognizes, such as a string stored in a read-only map value.");
045edee19d591e Song Liu                2023-11-06  12928  				return -EINVAL;
045edee19d591e Song Liu                2023-11-06  12929  			}
9b9f0b42703ceb Yonghong Song           2026-04-22  12930  			ret = check_arg_const_str(env, reg, argno);
045edee19d591e Song Liu                2023-11-06  12931  			if (ret)
045edee19d591e Song Liu                2023-11-06  12932  				return ret;
045edee19d591e Song Liu                2023-11-06  12933  			break;
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12934  		case KF_ARG_PTR_TO_WORKQUEUE:
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12935  			if (reg->type != PTR_TO_MAP_VALUE) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12936  				verbose(env, "%s doesn't point to a map value\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12937  					reg_arg_name(env, argno));
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12938  				return -EINVAL;
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12939  			}
9b9f0b42703ceb Yonghong Song           2026-04-22  12940  			ret = check_map_field_pointer(env, reg, argno, BPF_WORKQUEUE, &meta->map);
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12941  			if (ret < 0)
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12942  				return ret;
d940c9b94d7e6d Benjamin Tissoires      2024-04-20  12943  			break;
19bd300e22c2be Mykyta Yatsenko         2026-01-31  12944  		case KF_ARG_PTR_TO_TIMER:
19bd300e22c2be Mykyta Yatsenko         2026-01-31  12945  			if (reg->type != PTR_TO_MAP_VALUE) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12946  				verbose(env, "%s doesn't point to a map value\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12947  					reg_arg_name(env, argno));
19bd300e22c2be Mykyta Yatsenko         2026-01-31  12948  				return -EINVAL;
19bd300e22c2be Mykyta Yatsenko         2026-01-31  12949  			}
9b9f0b42703ceb Yonghong Song           2026-04-22  12950  			ret = process_timer_kfunc(env, reg, argno, meta);
19bd300e22c2be Mykyta Yatsenko         2026-01-31  12951  			if (ret < 0)
19bd300e22c2be Mykyta Yatsenko         2026-01-31  12952  				return ret;
19bd300e22c2be Mykyta Yatsenko         2026-01-31  12953  			break;
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12954  		case KF_ARG_PTR_TO_TASK_WORK:
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12955  			if (reg->type != PTR_TO_MAP_VALUE) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12956  				verbose(env, "%s doesn't point to a map value\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12957  					reg_arg_name(env, argno));
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12958  				return -EINVAL;
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12959  			}
9b9f0b42703ceb Yonghong Song           2026-04-22  12960  			ret = check_map_field_pointer(env, reg, argno, BPF_TASK_WORK, &meta->map);
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12961  			if (ret < 0)
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12962  				return ret;
5c8fd7e2b5b0a5 Mykyta Yatsenko         2025-09-23  12963  			break;
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12964  		case KF_ARG_PTR_TO_IRQ_FLAG:
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12965  			if (reg->type != PTR_TO_STACK) {
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12966  				char reason[256];
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12967  
9b9f0b42703ceb Yonghong Song           2026-04-22  12968  				verbose(env, "%s doesn't point to an irq flag on stack\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12969  					reg_arg_name(env, argno));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12970  				scnprintf(reason, sizeof(reason),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12971  					  "the kfunc expects a stack pointer to an IRQ flag slot, but %s is %s",
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12972  					  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12973  					  bpf_diag_reg_type_plain(env, reg->type));
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12974  				bpf_diag_report_call_type(env, insn_idx, regno,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12975  							  func_name,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12976  							  reg_arg_name(env, argno),
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12977  							  reason,
091742f0871450 Kumar Kartikeya Dwivedi 2026-06-03  12978  							  "Pass the same stack slot used by bpf_local_irq_save() or bpf_res_spin_lock_irqsave().");
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12979  				return -EINVAL;
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12980  			}
9b9f0b42703ceb Yonghong Song           2026-04-22  12981  			ret = process_irq_flag(env, reg, argno, meta);
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12982  			if (ret < 0)
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12983  				return ret;
c8e2ee1f3df05d Kumar Kartikeya Dwivedi 2024-12-03  12984  			break;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12985  		case KF_ARG_PTR_TO_RES_SPIN_LOCK:
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12986  		{
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12987  			int flags = PROCESS_RES_LOCK;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12988  
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12989  			if (reg->type != PTR_TO_MAP_VALUE && reg->type != (PTR_TO_BTF_ID | MEM_ALLOC)) {
9b9f0b42703ceb Yonghong Song           2026-04-22  12990  				verbose(env, "%s doesn't point to map value or allocated object\n",
9b9f0b42703ceb Yonghong Song           2026-04-22  12991  					reg_arg_name(env, argno));
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12992  				return -EINVAL;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12993  			}
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12994  
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12995  			if (!is_bpf_res_spin_lock_kfunc(meta->func_id))
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12996  				return -EFAULT;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12997  			if (meta->func_id == special_kfunc_list[KF_bpf_res_spin_lock] ||
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12998  			    meta->func_id == special_kfunc_list[KF_bpf_res_spin_lock_irqsave])
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  12999  				flags |= PROCESS_SPIN_LOCK;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  13000  			if (meta->func_id == special_kfunc_list[KF_bpf_res_spin_lock_irqsave] ||
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  13001  			    meta->func_id == special_kfunc_list[KF_bpf_res_spin_unlock_irqrestore])
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  13002  				flags |= PROCESS_LOCK_IRQ;
9b9f0b42703ceb Yonghong Song           2026-04-22  13003  			ret = process_spin_lock(env, reg, argno, flags);
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  13004  			if (ret < 0)
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  13005  				return ret;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  13006  			break;
0de2046137f976 Kumar Kartikeya Dwivedi 2025-03-15  13007  		}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  13008  		}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  13009  	}
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  13010  
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  13011  	return 0;
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18 @13012  }
00b85860feb809 Kumar Kartikeya Dwivedi 2022-11-18  13013  

:::::: The code at line 13012 was first introduced by commit
:::::: 00b85860feb809852af9a88cb4ca8766d7dff6a3 bpf: Rewrite kfunc argument handling

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
