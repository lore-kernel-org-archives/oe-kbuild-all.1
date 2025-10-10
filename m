Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22CC2882AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760097819; cv=none; b=Kv2rvR91NKjyz6RQAgR93MrpRUIjrjSs312GKY7cubpR9UleuYpSJA5Pn/1cGQxdQV04knq0gKdFHyuYwPlttJDgvbbxBIpAFdZ8MbqDa+H09IkbuRRv35PD+tPq6dxAA2uXYaa2ebkcOq/qzG1CZsJ3y1kGQJfTtdm8E/6hVJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760097819; c=relaxed/simple;
	bh=yXbwUz9Y6BWi37tmUXRWrDTz703vftTXaJLStUC5UUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+xs+4LKOFng3c5ax9u0wu8i5AXNpbM8X/fYFYn+qbnfxJmHna1MQCbqshPVTVabAgXV94ju/nQCGuXHl6joQ/qnF7qEXop/1IwhnosxFduwrnwPD3LGy9/1v1biEY+9qvFoc/LjRctqke/W2u6CXfN+C/pLsJ+3iKHT0xMVJrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WI08XLKq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WI08XLKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760097817; x=1791633817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yXbwUz9Y6BWi37tmUXRWrDTz703vftTXaJLStUC5UUo=;
  b=WI08XLKqYKsendjKqn7YaVz7AGOuOhkg9q4tRPiXcoKb+nJzEwHprjWo
   uvwkuUrDCvHO4qTP99sDRk8nuPGw1mMdiSHrsAhRmDvSrvfQCwit1/oPs
   NYHOUKEJ+tGQoDusvdX3B9k6haBkjWxND51qTDp4SHlAbCwAJKA1hG0jv
   WVYoNcUo7TAZ+1Xg/bK2v6QV1BSBvrjzk6+RSneZ9Tf+XH7YGuj78ZCDw
   SSZnzZKOuz8VcdtwkSQAXa03JEOCbTqu8fgXsorMQVVCybREjaL5iUdJY
   TsSuxPEXZJlne6pKLeZEZtelSsz8NOpjDW9+4WqIk7KbAZ60bQ0D1QKk2
   w==;
X-CSE-ConnectionGUID: a+MzxOu0RZqF8hHn5vy+rA==
X-CSE-MsgGUID: DD+jTOozQ9enH7mJpS27og==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="72572962"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="72572962"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 05:03:31 -0700
X-CSE-ConnectionGUID: jQ+fUu+MQrmzLxWOCbJ+8w==
X-CSE-MsgGUID: /Oa6kgfgRlSZt1KY8Y8BNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="180981284"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Oct 2025 05:03:30 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7BqJ-0002bz-2I;
	Fri, 10 Oct 2025 12:03:27 +0000
Date: Fri, 10 Oct 2025 20:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] bpf: Fall back to nospec for sanitization-failures
Message-ID: <202510101931.Kf9p6Ivj-lkp@intel.com>
References: <20251005103518.996383-1-luis.gerhorst@fau.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005103518.996383-1-luis.gerhorst@fau.de>

Hi Luis,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/net]
[also build test WARNING on bpf-next/master bpf/master linus/master v6.17 next-20251009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Gerhorst/selftests-bpf-Fix-SPEC_V1-V4-for-other-archs/20251010-041318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/20251005103518.996383-1-luis.gerhorst%40fau.de
patch subject: [RFC 1/3] bpf: Fall back to nospec for sanitization-failures
config: riscv-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101931.Kf9p6Ivj-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101931.Kf9p6Ivj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101931.Kf9p6Ivj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'adjust_scalar_min_max_vals':
>> kernel/bpf/verifier.c:15354:6: warning: unused variable 'ret' [-Wunused-variable]
   15354 |  int ret;
         |      ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/ret +15354 kernel/bpf/verifier.c

0922c78f592c60 Cupertino Miranda 2024-05-06  15342  
07cd263148a53e John Fastabend    2020-03-24  15343  /* WARNING: This function does calculations on 64-bit values, but the actual
07cd263148a53e John Fastabend    2020-03-24  15344   * execution may occur on 32-bit values. Therefore, things like bitshifts
07cd263148a53e John Fastabend    2020-03-24  15345   * need extra checks in the 32-bit case.
07cd263148a53e John Fastabend    2020-03-24  15346   */
07cd263148a53e John Fastabend    2020-03-24  15347  static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
07cd263148a53e John Fastabend    2020-03-24  15348  				      struct bpf_insn *insn,
07cd263148a53e John Fastabend    2020-03-24  15349  				      struct bpf_reg_state *dst_reg,
07cd263148a53e John Fastabend    2020-03-24  15350  				      struct bpf_reg_state src_reg)
07cd263148a53e John Fastabend    2020-03-24  15351  {
07cd263148a53e John Fastabend    2020-03-24  15352  	u8 opcode = BPF_OP(insn->code);
3f50f132d8400e John Fastabend    2020-03-30  15353  	bool alu32 = (BPF_CLASS(insn->code) != BPF_ALU64);
a6aaece00a57fa Daniel Borkmann   2021-03-23 @15354  	int ret;
07cd263148a53e John Fastabend    2020-03-24  15355  
0922c78f592c60 Cupertino Miranda 2024-05-06  15356  	if (!is_safe_to_compute_dst_reg_range(insn, &src_reg)) {
07cd263148a53e John Fastabend    2020-03-24  15357  		__mark_reg_unknown(env, dst_reg);
07cd263148a53e John Fastabend    2020-03-24  15358  		return 0;
07cd263148a53e John Fastabend    2020-03-24  15359  	}
07cd263148a53e John Fastabend    2020-03-24  15360  
f528819334881f Daniel Borkmann   2021-03-24  15361  	if (sanitize_needed(opcode)) {
1a23548196c7d2 Luis Gerhorst     2025-10-05  15362  		sanitize_val_alu(env, insn);
f528819334881f Daniel Borkmann   2021-03-24  15363  	}
f528819334881f Daniel Borkmann   2021-03-24  15364  
3f50f132d8400e John Fastabend    2020-03-30  15365  	/* Calculate sign/unsigned bounds and tnum for alu32 and alu64 bit ops.
3f50f132d8400e John Fastabend    2020-03-30  15366  	 * There are two classes of instructions: The first class we track both
3f50f132d8400e John Fastabend    2020-03-30  15367  	 * alu32 and alu64 sign/unsigned bounds independently this provides the
3f50f132d8400e John Fastabend    2020-03-30  15368  	 * greatest amount of precision when alu operations are mixed with jmp32
3f50f132d8400e John Fastabend    2020-03-30  15369  	 * operations. These operations are BPF_ADD, BPF_SUB, BPF_MUL, BPF_ADD,
3f50f132d8400e John Fastabend    2020-03-30  15370  	 * and BPF_OR. This is possible because these ops have fairly easy to
3f50f132d8400e John Fastabend    2020-03-30  15371  	 * understand and calculate behavior in both 32-bit and 64-bit alu ops.
3f50f132d8400e John Fastabend    2020-03-30  15372  	 * See alu32 verifier tests for examples. The second class of
3f50f132d8400e John Fastabend    2020-03-30  15373  	 * operations, BPF_LSH, BPF_RSH, and BPF_ARSH, however are not so easy
3f50f132d8400e John Fastabend    2020-03-30  15374  	 * with regards to tracking sign/unsigned bounds because the bits may
3f50f132d8400e John Fastabend    2020-03-30  15375  	 * cross subreg boundaries in the alu64 case. When this happens we mark
3f50f132d8400e John Fastabend    2020-03-30  15376  	 * the reg unbounded in the subreg bound space and use the resulting
3f50f132d8400e John Fastabend    2020-03-30  15377  	 * tnum to calculate an approximation of the sign/unsigned bounds.
3f50f132d8400e John Fastabend    2020-03-30  15378  	 */
07cd263148a53e John Fastabend    2020-03-24  15379  	switch (opcode) {
07cd263148a53e John Fastabend    2020-03-24  15380  	case BPF_ADD:
3f50f132d8400e John Fastabend    2020-03-30  15381  		scalar32_min_max_add(dst_reg, &src_reg);
07cd263148a53e John Fastabend    2020-03-24  15382  		scalar_min_max_add(dst_reg, &src_reg);
3f50f132d8400e John Fastabend    2020-03-30  15383  		dst_reg->var_off = tnum_add(dst_reg->var_off, src_reg.var_off);
07cd263148a53e John Fastabend    2020-03-24  15384  		break;
07cd263148a53e John Fastabend    2020-03-24  15385  	case BPF_SUB:
3f50f132d8400e John Fastabend    2020-03-30  15386  		scalar32_min_max_sub(dst_reg, &src_reg);
07cd263148a53e John Fastabend    2020-03-24  15387  		scalar_min_max_sub(dst_reg, &src_reg);
3f50f132d8400e John Fastabend    2020-03-30  15388  		dst_reg->var_off = tnum_sub(dst_reg->var_off, src_reg.var_off);
07cd263148a53e John Fastabend    2020-03-24  15389  		break;
aced132599b3c8 Song Liu          2025-06-25  15390  	case BPF_NEG:
aced132599b3c8 Song Liu          2025-06-25  15391  		env->fake_reg[0] = *dst_reg;
aced132599b3c8 Song Liu          2025-06-25  15392  		__mark_reg_known(dst_reg, 0);
aced132599b3c8 Song Liu          2025-06-25  15393  		scalar32_min_max_sub(dst_reg, &env->fake_reg[0]);
aced132599b3c8 Song Liu          2025-06-25  15394  		scalar_min_max_sub(dst_reg, &env->fake_reg[0]);
aced132599b3c8 Song Liu          2025-06-25  15395  		dst_reg->var_off = tnum_neg(env->fake_reg[0].var_off);
aced132599b3c8 Song Liu          2025-06-25  15396  		break;
07cd263148a53e John Fastabend    2020-03-24  15397  	case BPF_MUL:
3f50f132d8400e John Fastabend    2020-03-30  15398  		dst_reg->var_off = tnum_mul(dst_reg->var_off, src_reg.var_off);
3f50f132d8400e John Fastabend    2020-03-30  15399  		scalar32_min_max_mul(dst_reg, &src_reg);
07cd263148a53e John Fastabend    2020-03-24  15400  		scalar_min_max_mul(dst_reg, &src_reg);
07cd263148a53e John Fastabend    2020-03-24  15401  		break;
07cd263148a53e John Fastabend    2020-03-24  15402  	case BPF_AND:
3f50f132d8400e John Fastabend    2020-03-30  15403  		dst_reg->var_off = tnum_and(dst_reg->var_off, src_reg.var_off);
3f50f132d8400e John Fastabend    2020-03-30  15404  		scalar32_min_max_and(dst_reg, &src_reg);
07cd263148a53e John Fastabend    2020-03-24  15405  		scalar_min_max_and(dst_reg, &src_reg);
07cd263148a53e John Fastabend    2020-03-24  15406  		break;
07cd263148a53e John Fastabend    2020-03-24  15407  	case BPF_OR:
3f50f132d8400e John Fastabend    2020-03-30  15408  		dst_reg->var_off = tnum_or(dst_reg->var_off, src_reg.var_off);
3f50f132d8400e John Fastabend    2020-03-30  15409  		scalar32_min_max_or(dst_reg, &src_reg);
07cd263148a53e John Fastabend    2020-03-24  15410  		scalar_min_max_or(dst_reg, &src_reg);
07cd263148a53e John Fastabend    2020-03-24  15411  		break;
2921c90d471889 Yonghong Song     2020-08-24  15412  	case BPF_XOR:
2921c90d471889 Yonghong Song     2020-08-24  15413  		dst_reg->var_off = tnum_xor(dst_reg->var_off, src_reg.var_off);
2921c90d471889 Yonghong Song     2020-08-24  15414  		scalar32_min_max_xor(dst_reg, &src_reg);
2921c90d471889 Yonghong Song     2020-08-24  15415  		scalar_min_max_xor(dst_reg, &src_reg);
2921c90d471889 Yonghong Song     2020-08-24  15416  		break;
07cd263148a53e John Fastabend    2020-03-24  15417  	case BPF_LSH:
3f50f132d8400e John Fastabend    2020-03-30  15418  		if (alu32)
3f50f132d8400e John Fastabend    2020-03-30  15419  			scalar32_min_max_lsh(dst_reg, &src_reg);
3f50f132d8400e John Fastabend    2020-03-30  15420  		else
07cd263148a53e John Fastabend    2020-03-24  15421  			scalar_min_max_lsh(dst_reg, &src_reg);
07cd263148a53e John Fastabend    2020-03-24  15422  		break;
07cd263148a53e John Fastabend    2020-03-24  15423  	case BPF_RSH:
3f50f132d8400e John Fastabend    2020-03-30  15424  		if (alu32)
3f50f132d8400e John Fastabend    2020-03-30  15425  			scalar32_min_max_rsh(dst_reg, &src_reg);
3f50f132d8400e John Fastabend    2020-03-30  15426  		else
07cd263148a53e John Fastabend    2020-03-24  15427  			scalar_min_max_rsh(dst_reg, &src_reg);
07cd263148a53e John Fastabend    2020-03-24  15428  		break;
07cd263148a53e John Fastabend    2020-03-24  15429  	case BPF_ARSH:
3f50f132d8400e John Fastabend    2020-03-30  15430  		if (alu32)
3f50f132d8400e John Fastabend    2020-03-30  15431  			scalar32_min_max_arsh(dst_reg, &src_reg);
3f50f132d8400e John Fastabend    2020-03-30  15432  		else
3f50f132d8400e John Fastabend    2020-03-30  15433  			scalar_min_max_arsh(dst_reg, &src_reg);
9cbe1f5a32dcd6 Yonghong Song     2018-04-28  15434  		break;
484611357c19f9 Josef Bacik       2016-09-28  15435  	default:
484611357c19f9 Josef Bacik       2016-09-28  15436  		break;
484611357c19f9 Josef Bacik       2016-09-28  15437  	}
484611357c19f9 Josef Bacik       2016-09-28  15438  
3f50f132d8400e John Fastabend    2020-03-30  15439  	/* ALU32 ops are zero extended into 64bit register */
3f50f132d8400e John Fastabend    2020-03-30  15440  	if (alu32)
3f50f132d8400e John Fastabend    2020-03-30  15441  		zext_32_to_64(dst_reg);
3844d153a41ade Daniel Borkmann   2022-07-01  15442  	reg_bounds_sync(dst_reg);
f1174f77b50c94 Edward Cree       2017-08-07  15443  	return 0;
f1174f77b50c94 Edward Cree       2017-08-07  15444  }
f1174f77b50c94 Edward Cree       2017-08-07  15445  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
