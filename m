Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38A13EBF21
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 08:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884177; cv=none; b=oZbCc/hCix2YaHYx/d+61mHoDHt8cbB3v+WyDTlE+HpPHGJjRo7y90gp0an0nRIMH38nimukp6kFEZKUfE5oK5K4VAn53bSCPUa61+XfKwfbHJ8ADiiXBGkZ/p+GbzG1thxIxCZ2CoqlVyoABZQ2iD5QDU3wWJBPukGIQpLuip0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884177; c=relaxed/simple;
	bh=uH30cbIy6f/ZSRSaaB/JnFmizq9h+1IY+MBueagYJT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHJxlIkxVnmLcVp/lA0JP1Ab9brDmVshzFnwOavhuBL61sn8VYDATpgbxxjkw7DeNWdua3MefHyG05kQYb1a/pOfDpY8unMRdhjGVD/qMPvPaoMQPS/pdWsBxS4oeB9S8u9MIvE1kLieCTM/wSMrG+0DiwkBE5iOHwwVm0hWU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lkgHAZ1A; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lkgHAZ1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770884176; x=1802420176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uH30cbIy6f/ZSRSaaB/JnFmizq9h+1IY+MBueagYJT8=;
  b=lkgHAZ1AHJnrhh4Wg+Y55G6UOLED/M82HEOrO5t/uA3WS/WXd+4hNu+N
   icP7J3A7lMzBO42P1jeeGfCGvvj3fKYUL/0Q7IXC0ph4NpLnysBewpTst
   qThTOD9dK60kaQBnH7YEilicqADXFCA3LQpAUeGwJUZD7ZjK0JKPU8Pxy
   375gZ0aomdxOVz0Vr6dec2GgtFKuvkz8RdCkt8KhunqUBb5chSGx+N0J8
   Qz0gBETkbt54xB1KY+PqJFqPV9k7A1cUuq1TBv50qON7xr1+A5wTN9t2m
   9+orFx0/D37hjt/k+xZIGJpJh3i44GzJenA56rnfS7xVEY40Kh8beGIp5
   Q==;
X-CSE-ConnectionGUID: x5aeoRvRRRuyjHB39lPRtg==
X-CSE-MsgGUID: pyqkXp86SQ6zLh/d0eR/iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82688616"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="82688616"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 00:16:15 -0800
X-CSE-ConnectionGUID: bLau98BlTn2cLg97Nrdq/w==
X-CSE-MsgGUID: CHLkqVqTQgGmGrqr6ysFKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="242151099"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2026 00:16:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqRru-00000000qpA-1ND9;
	Thu, 12 Feb 2026 08:16:10 +0000
Date: Thu, 12 Feb 2026 16:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org,
	ast@kernel.org, andrii@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, daniel@iogearbox.net,
	martin.lau@linux.dev, kernel-team@fb.com, yonghong.song@linux.dev,
	eddyz87@gmail.com
Subject: Re: [PATCH bpf-next 3/3] bpf: rename bpf_reg_state->off to
 bpf_reg_state->delta
Message-ID: <202602121659.1A9PJm39-lkp@intel.com>
References: <20260211-ptrs-off-migration-v1-3-996c2a37b063@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-ptrs-off-migration-v1-3-996c2a37b063@gmail.com>

Hi Eduard,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4475cdac12c46fc26ee815de1b43cfe9f8375140]

url:    https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf-split-check_reg_sane_offset-in-two-parts/20260212-063425
base:   4475cdac12c46fc26ee815de1b43cfe9f8375140
patch link:    https://lore.kernel.org/r/20260211-ptrs-off-migration-v1-3-996c2a37b063%40gmail.com
patch subject: [PATCH bpf-next 3/3] bpf: rename bpf_reg_state->off to bpf_reg_state->delta
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260212/202602121659.1A9PJm39-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121659.1A9PJm39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121659.1A9PJm39-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/netronome/nfp/bpf/verifier.c: In function 'nfp_bpf_map_update_value_ok':
>> drivers/net/ethernet/netronome/nfp/bpf/verifier.c:101:19: error: 'const struct bpf_reg_state' has no member named 'off'
     101 |         off = reg3->off + reg3->var_off.value;
         |                   ^~
   drivers/net/ethernet/netronome/nfp/bpf/verifier.c: In function 'nfp_bpf_stack_arg_ok':
   drivers/net/ethernet/netronome/nfp/bpf/verifier.c:140:39: error: 'const struct bpf_reg_state' has no member named 'off'
     140 |         off = reg->var_off.value + reg->off;
         |                                       ^~
>> drivers/net/ethernet/netronome/nfp/bpf/verifier.c:150:60: error: 'struct bpf_reg_state' has no member named 'off'
     150 |         old_off = old_arg->reg.var_off.value + old_arg->reg.off;
         |                                                            ^
   drivers/net/ethernet/netronome/nfp/bpf/verifier.c: In function 'nfp_bpf_check_stack_access':
   drivers/net/ethernet/netronome/nfp/bpf/verifier.c:361:28: error: 'struct bpf_reg_state' has no member named 'off'
     361 |         old_off = meta->ptr.off + meta->ptr.var_off.value;
         |                            ^
   drivers/net/ethernet/netronome/nfp/bpf/verifier.c:362:22: error: 'const struct bpf_reg_state' has no member named 'off'
     362 |         new_off = reg->off + reg->var_off.value;
         |                      ^~
   drivers/net/ethernet/netronome/nfp/bpf/verifier.c: In function 'nfp_bpf_map_mark_used':
   drivers/net/ethernet/netronome/nfp/bpf/verifier.c:431:56: error: 'const struct bpf_reg_state' has no member named 'off'
     431 |         off = reg->var_off.value + meta->insn.off + reg->off;
         |                                                        ^~
--
   drivers/net/ethernet/netronome/nfp/bpf/jit.c: In function 'map_call_stack_common':
>> drivers/net/ethernet/netronome/nfp/bpf/jit.c:1734:64: error: 'struct bpf_reg_state' has no member named 'off'
    1734 |         lm_off += meta->arg2.reg.var_off.value + meta->arg2.reg.off;
         |                                                                ^
   drivers/net/ethernet/netronome/nfp/bpf/jit.c: In function 'mem_ldx':
   drivers/net/ethernet/netronome/nfp/bpf/jit.c:2878:47: error: 'struct bpf_reg_state' has no member named 'off'
    2878 |                                      meta->ptr.off + meta->ptr.var_off.value);
         |                                               ^
   drivers/net/ethernet/netronome/nfp/bpf/jit.c: In function 'mem_stx':
   drivers/net/ethernet/netronome/nfp/bpf/jit.c:2989:47: error: 'struct bpf_reg_state' has no member named 'off'
    2989 |                                      meta->ptr.off + meta->ptr.var_off.value);
         |                                               ^
   drivers/net/ethernet/netronome/nfp/bpf/jit.c: In function 'cross_mem_access':
   drivers/net/ethernet/netronome/nfp/bpf/jit.c:4156:65: error: 'struct bpf_reg_state' has no member named 'off'
    4156 |         head_ld_off = head_ld_meta->insn.off + head_ld_meta->ptr.off;
         |                                                                 ^
   drivers/net/ethernet/netronome/nfp/bpf/jit.c:4157:65: error: 'struct bpf_reg_state' has no member named 'off'
    4157 |         head_st_off = head_st_meta->insn.off + head_st_meta->ptr.off;
         |                                                                 ^
   drivers/net/ethernet/netronome/nfp/bpf/jit.c:4158:45: error: 'struct bpf_reg_state' has no member named 'off'
    4158 |         ld_off = ld->off + head_ld_meta->ptr.off;
         |                                             ^
   drivers/net/ethernet/netronome/nfp/bpf/jit.c: In function 'nfp_bpf_opt_pkt_cache':
   drivers/net/ethernet/netronome/nfp/bpf/jit.c:4329:30: error: 'struct bpf_reg_state' has no member named 'off'
    4329 |                     meta->ptr.off == range_ptr_off) {
         |                              ^
   drivers/net/ethernet/netronome/nfp/bpf/jit.c:4364:48: error: 'struct bpf_reg_state' has no member named 'off'
    4364 |                 range_ptr_off = range_node->ptr.off;
         |                                                ^


vim +101 drivers/net/ethernet/netronome/nfp/bpf/verifier.c

8231f8444110c3 Jakub Kicinski 2017-12-14   82  
527db74b71ee5a Jakub Kicinski 2018-10-16   83  static bool nfp_bpf_map_update_value_ok(struct bpf_verifier_env *env)
527db74b71ee5a Jakub Kicinski 2018-10-16   84  {
527db74b71ee5a Jakub Kicinski 2018-10-16   85  	const struct bpf_reg_state *reg1 = cur_regs(env) + BPF_REG_1;
527db74b71ee5a Jakub Kicinski 2018-10-16   86  	const struct bpf_reg_state *reg3 = cur_regs(env) + BPF_REG_3;
527db74b71ee5a Jakub Kicinski 2018-10-16   87  	struct bpf_offloaded_map *offmap;
527db74b71ee5a Jakub Kicinski 2018-10-16   88  	struct bpf_func_state *state;
527db74b71ee5a Jakub Kicinski 2018-10-16   89  	struct nfp_bpf_map *nfp_map;
527db74b71ee5a Jakub Kicinski 2018-10-16   90  	int off, i;
527db74b71ee5a Jakub Kicinski 2018-10-16   91  
527db74b71ee5a Jakub Kicinski 2018-10-16   92  	state = env->cur_state->frame[reg3->frameno];
527db74b71ee5a Jakub Kicinski 2018-10-16   93  
527db74b71ee5a Jakub Kicinski 2018-10-16   94  	/* We need to record each time update happens with non-zero words,
527db74b71ee5a Jakub Kicinski 2018-10-16   95  	 * in case such word is used in atomic operations.
527db74b71ee5a Jakub Kicinski 2018-10-16   96  	 * Implicitly depend on nfp_bpf_stack_arg_ok(reg3) being run before.
527db74b71ee5a Jakub Kicinski 2018-10-16   97  	 */
527db74b71ee5a Jakub Kicinski 2018-10-16   98  
527db74b71ee5a Jakub Kicinski 2018-10-16   99  	offmap = map_to_offmap(reg1->map_ptr);
527db74b71ee5a Jakub Kicinski 2018-10-16  100  	nfp_map = offmap->dev_priv;
527db74b71ee5a Jakub Kicinski 2018-10-16 @101  	off = reg3->off + reg3->var_off.value;
527db74b71ee5a Jakub Kicinski 2018-10-16  102  
527db74b71ee5a Jakub Kicinski 2018-10-16  103  	for (i = 0; i < offmap->map.value_size; i++) {
527db74b71ee5a Jakub Kicinski 2018-10-16  104  		struct bpf_stack_state *stack_entry;
527db74b71ee5a Jakub Kicinski 2018-10-16  105  		unsigned int soff;
527db74b71ee5a Jakub Kicinski 2018-10-16  106  
527db74b71ee5a Jakub Kicinski 2018-10-16  107  		soff = -(off + i) - 1;
527db74b71ee5a Jakub Kicinski 2018-10-16  108  		stack_entry = &state->stack[soff / BPF_REG_SIZE];
527db74b71ee5a Jakub Kicinski 2018-10-16  109  		if (stack_entry->slot_type[soff % BPF_REG_SIZE] == STACK_ZERO)
527db74b71ee5a Jakub Kicinski 2018-10-16  110  			continue;
527db74b71ee5a Jakub Kicinski 2018-10-16  111  
527db74b71ee5a Jakub Kicinski 2018-10-16  112  		if (nfp_map->use_map[i / 4].type == NFP_MAP_USE_ATOMIC_CNT) {
527db74b71ee5a Jakub Kicinski 2018-10-16  113  			pr_vlog(env, "value at offset %d/%d may be non-zero, bpf_map_update_elem() is required to initialize atomic counters to zero to avoid offload endian issues\n",
527db74b71ee5a Jakub Kicinski 2018-10-16  114  				i, soff);
527db74b71ee5a Jakub Kicinski 2018-10-16  115  			return false;
527db74b71ee5a Jakub Kicinski 2018-10-16  116  		}
527db74b71ee5a Jakub Kicinski 2018-10-16  117  		nfp_map->use_map[i / 4].non_zero_update = 1;
527db74b71ee5a Jakub Kicinski 2018-10-16  118  	}
527db74b71ee5a Jakub Kicinski 2018-10-16  119  
527db74b71ee5a Jakub Kicinski 2018-10-16  120  	return true;
527db74b71ee5a Jakub Kicinski 2018-10-16  121  }
527db74b71ee5a Jakub Kicinski 2018-10-16  122  
2f46e0c1273512 Jakub Kicinski 2018-03-28  123  static int
2f46e0c1273512 Jakub Kicinski 2018-03-28  124  nfp_bpf_stack_arg_ok(const char *fname, struct bpf_verifier_env *env,
2f46e0c1273512 Jakub Kicinski 2018-03-28  125  		     const struct bpf_reg_state *reg,
2f46e0c1273512 Jakub Kicinski 2018-03-28  126  		     struct nfp_bpf_reg_state *old_arg)
2f46e0c1273512 Jakub Kicinski 2018-03-28  127  {
2f46e0c1273512 Jakub Kicinski 2018-03-28  128  	s64 off, old_off;
2f46e0c1273512 Jakub Kicinski 2018-03-28  129  
2f46e0c1273512 Jakub Kicinski 2018-03-28  130  	if (reg->type != PTR_TO_STACK) {
2f46e0c1273512 Jakub Kicinski 2018-03-28  131  		pr_vlog(env, "%s: unsupported ptr type %d\n",
2f46e0c1273512 Jakub Kicinski 2018-03-28  132  			fname, reg->type);
2f46e0c1273512 Jakub Kicinski 2018-03-28  133  		return false;
2f46e0c1273512 Jakub Kicinski 2018-03-28  134  	}
2f46e0c1273512 Jakub Kicinski 2018-03-28  135  	if (!tnum_is_const(reg->var_off)) {
2f46e0c1273512 Jakub Kicinski 2018-03-28  136  		pr_vlog(env, "%s: variable pointer\n", fname);
2f46e0c1273512 Jakub Kicinski 2018-03-28  137  		return false;
2f46e0c1273512 Jakub Kicinski 2018-03-28  138  	}
2f46e0c1273512 Jakub Kicinski 2018-03-28  139  
2f46e0c1273512 Jakub Kicinski 2018-03-28  140  	off = reg->var_off.value + reg->off;
2f46e0c1273512 Jakub Kicinski 2018-03-28  141  	if (-off % 4) {
2f46e0c1273512 Jakub Kicinski 2018-03-28  142  		pr_vlog(env, "%s: unaligned stack pointer %lld\n", fname, -off);
2f46e0c1273512 Jakub Kicinski 2018-03-28  143  		return false;
2f46e0c1273512 Jakub Kicinski 2018-03-28  144  	}
2f46e0c1273512 Jakub Kicinski 2018-03-28  145  
2f46e0c1273512 Jakub Kicinski 2018-03-28  146  	/* Rest of the checks is only if we re-parse the same insn */
2f46e0c1273512 Jakub Kicinski 2018-03-28  147  	if (!old_arg)
2f46e0c1273512 Jakub Kicinski 2018-03-28  148  		return true;
2f46e0c1273512 Jakub Kicinski 2018-03-28  149  
2f46e0c1273512 Jakub Kicinski 2018-03-28 @150  	old_off = old_arg->reg.var_off.value + old_arg->reg.off;
2f46e0c1273512 Jakub Kicinski 2018-03-28  151  	old_arg->var_off |= off != old_off;
2f46e0c1273512 Jakub Kicinski 2018-03-28  152  
2f46e0c1273512 Jakub Kicinski 2018-03-28  153  	return true;
2f46e0c1273512 Jakub Kicinski 2018-03-28  154  }
2f46e0c1273512 Jakub Kicinski 2018-03-28  155  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
