Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469E63195FC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 11:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745554; cv=none; b=VcInc9xoad/Tn1QCixNthbZF6j3IZiAZGzkOrASw+VoWhACM5CQFLcUExa+gU+XbsPb16UHnacG2D/Uzgrt+Hmqukq34u0KdGFQ+hd0q512YkM4J0mf0Epq9uusThn7twPgAHVXMHz1bFxSzM3gK2fOS4abOJrdQiPg2UnsDpQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745554; c=relaxed/simple;
	bh=QqfnEG8ys6X3t6DwE0H/2+7wYXmn88F6Zos5lpRF+7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=miAn0HW7CEUSnyJZd4P+BXWLx5I4t1lKh03frmtix5ofTCz266tXW1dslznMY3o1xYgvu7ID0bGhwaC0co9YHCwg+Vl4y4b0HvmdmDLQmNtkCeEiCNReZWBbNFgEVqgtGRStWIXisRtU9EnFCmige84WE2MIYjUgn6W+ItsEMbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgoBLub5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgoBLub5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773745551; x=1805281551;
  h=date:from:to:cc:subject:message-id;
  bh=QqfnEG8ys6X3t6DwE0H/2+7wYXmn88F6Zos5lpRF+7A=;
  b=NgoBLub5+1z97FAhxgKmjaW/kqvbfrhYovmFYr8e+gm0wPDfZc0AJm1Y
   be1hAMKHr3NjYiWuBhQamW5WBAxn0hkNfN3NLaacVtsEZy978SMdvic7L
   lF9Om6s6dwjKBVoYbV4k4BA8bFRIwczVe4Lsn7ViJ3VdaHXpReGXOO/+e
   rdooag8N/jwWEG5Yfl2hC9wBPMTabnxiRYU0JrbtZDseQ1KQlli3LrWND
   7CjLO6+ROhc1sJms4C1svoGrQhLOopEWrjFWU+4Gl6uFaO/dh+EQiijeb
   sa7bb4/i/Q4/FqEoVTLcZzfOa7jgUH88ZHhIbbBd0NogzBxtwRBI88U/s
   Q==;
X-CSE-ConnectionGUID: 1ehoGwgxSse55OXgY7U2bw==
X-CSE-MsgGUID: La+G3FPwRrqg/MwkUIyqfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85090754"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85090754"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:05:51 -0700
X-CSE-ConnectionGUID: 9A9QgoaXTJCPjzm0olGTPw==
X-CSE-MsgGUID: drjVXwF7QRGTXMTOFhAMOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="246932887"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2026 04:05:48 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2SF7-000000000IH-2WNp;
	Tue, 17 Mar 2026 11:05:45 +0000
Date: Tue, 17 Mar 2026 19:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:stacklive 12/22] kernel/bpf/liveness.c:2152:1:
 warning: the frame size of 1520 bytes is larger than 1280 bytes
Message-ID: <202603171822.smgcd5B7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git stacklive
head:   f4d911f1115995504320e415e04768858065221b
commit: d9d806381e9caf5be8c404e90b7997fd39bacf63 [12/22] bpf: Add per-subprog arg tracking analysis
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260317/202603171822.smgcd5B7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603171822.smgcd5B7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603171822.smgcd5B7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/liveness.c: In function 'compute_subprog_arg_tracking':
>> kernel/bpf/liveness.c:2152:1: warning: the frame size of 1520 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    2152 | }
         | ^


vim +2152 kernel/bpf/liveness.c

  2003	
  2004	/*
  2005	 * Compute arg tracking dataflow for a single subprog.
  2006	 * Runs forward fixed-point with arg_track_xfer(), then records
  2007	 * memory accesses in a single linear pass over converged state.
  2008	 * Stores at_in and arg_use in info for later phases.
  2009	 */
  2010	static int compute_subprog_arg_tracking(struct bpf_verifier_env *env,
  2011						struct bpf_insn *insns,
  2012						int subprog,
  2013						struct subprog_arg_access *access,
  2014						struct subprog_at_info *info,
  2015						struct insn_live_regs *state)
  2016	{
  2017		int start = env->subprog_info[subprog].start;
  2018		int po_start = env->subprog_info[subprog].postorder_start;
  2019		int end = env->subprog_info[subprog + 1].start;
  2020		int po_end = env->subprog_info[subprog + 1].postorder_start;
  2021		int len = end - start;
  2022		struct arg_track (*at_in)[MAX_BPF_REG] = NULL;
  2023		struct arg_track at_out[MAX_BPF_REG];
  2024		struct arg_track (*at_stack_in)[MAX_ARG_SPILL_SLOTS] = NULL;
  2025		struct arg_track at_stack_out[MAX_ARG_SPILL_SLOTS];
  2026		u64 (*arg_use)[NUM_AT_IDS][2] = NULL;
  2027		struct arg_track unvisited = { .arg = ARG_UNVISITED };
  2028		struct arg_track none = { .arg = ARG_NONE };
  2029		bool changed;
  2030		int i, p, r, err;
  2031	
  2032		for (i = 0; i < NUM_AT_IDS; i++) {
  2033			spis_clear(access->read[i]);
  2034			spis_clear(access->write[i]);
  2035		}
  2036	
  2037		at_in = kvmalloc_array(len, sizeof(*at_in), GFP_KERNEL_ACCOUNT);
  2038		if (!at_in) {
  2039			err = -ENOMEM;
  2040			goto err_free;
  2041		}
  2042	
  2043		at_stack_in = kvmalloc_array(len, sizeof(*at_stack_in), GFP_KERNEL_ACCOUNT);
  2044		if (!at_stack_in) {
  2045			err = -ENOMEM;
  2046			goto err_free;
  2047		}
  2048	
  2049		arg_use = kvzalloc_objs(*arg_use, len, GFP_KERNEL_ACCOUNT);
  2050		if (!arg_use) {
  2051			err = -ENOMEM;
  2052			goto err_free;
  2053		}
  2054	
  2055		for (i = 0; i < len; i++) {
  2056			for (r = 0; r < MAX_BPF_REG; r++)
  2057				at_in[i][r] = unvisited;
  2058			for (r = 0; r < MAX_ARG_SPILL_SLOTS; r++)
  2059				at_stack_in[i][r] = unvisited;
  2060		}
  2061	
  2062		for (r = 0; r < MAX_BPF_REG; r++)
  2063			at_in[0][r] = none;
  2064	
  2065		/* Entry: R10 is FP; R1-R5 are arg-derived only for subprogs */
  2066		at_in[0][BPF_REG_FP] = arg_track_single(AT_FP, 0);
  2067	
  2068		if (subprog > 0) {
  2069			for (r = BPF_REG_1; r <= BPF_REG_5; r++)
  2070				at_in[0][r] = arg_track_single(r, 0);
  2071		}
  2072	
  2073		/* Entry: all stack slots are ARG_NONE. They cannot carry arg-derived pointers */
  2074		for (r = 0; r < MAX_ARG_SPILL_SLOTS; r++)
  2075			at_stack_in[0][r] = none;
  2076	
  2077		if (env->log.level & BPF_LOG_LEVEL2)
  2078			verbose(env, "subprog#%d: analyzing...\n", subprog);
  2079	
  2080		/* Forward fixed-point iteration in reverse post order */
  2081		changed = true;
  2082		while (changed) {
  2083			changed = false;
  2084			for (p = po_end - 1; p >= po_start; p--) {
  2085				int idx = env->cfg.insn_postorder[p];
  2086				int i = idx - start;
  2087				struct bpf_insn *insn = &insns[idx];
  2088				struct bpf_iarray *succ;
  2089	
  2090				if (at_in[i][0].arg == ARG_UNVISITED &&
  2091				    at_in[i][1].arg == ARG_UNVISITED)
  2092					continue;
  2093	
  2094				memcpy(at_out, at_in[i], sizeof(at_out));
  2095				memcpy(at_stack_out, at_stack_in[i], sizeof(at_stack_out));
  2096				arg_track_xfer(env, insn, idx, access, at_out, at_stack_out);
  2097				arg_track_log(env, insn, idx, at_in[i], at_stack_in[i], at_out, at_stack_out);
  2098	
  2099				/* Propagate to successors within this subprogram */
  2100				succ = bpf_insn_successors(env, idx);
  2101				for (int s = 0; s < succ->cnt; s++) {
  2102					int target = succ->items[s];
  2103					int ti;
  2104	
  2105					/* Filter: stay within the subprogram's range */
  2106					if (target < start || target >= end)
  2107						continue;
  2108					ti = target - start;
  2109	
  2110					for (r = 0; r < MAX_BPF_REG; r++)
  2111						changed |= arg_track_join(env, idx, target, r, &at_in[ti][r], at_out[r]);
  2112	
  2113					for (r = 0; r < MAX_ARG_SPILL_SLOTS; r++)
  2114						changed |= arg_track_join(env,idx, target, -r - 1, &at_stack_in[ti][r], at_stack_out[r]);
  2115				}
  2116			}
  2117		}
  2118	
  2119		kvfree(at_stack_in);
  2120	
  2121		/* Linear pass: record memory accesses using converged at_in */
  2122		for (i = 0; i < len; i++) {
  2123			struct bpf_insn *insn = &insns[start + i];
  2124	
  2125			if (at_in[i][0].arg == ARG_UNVISITED &&
  2126			    at_in[i][1].arg == ARG_UNVISITED)
  2127				continue;
  2128	
  2129			record_insn_mem_accesses(env, insn, access, arg_use, i,
  2130						at_in[i], &state[start + i]);
  2131	
  2132			if (BPF_CLASS(insn->code) == BPF_JMP &&
  2133			    BPF_OP(insn->code) == BPF_CALL)
  2134				set_call_stack_access_at(env, insn, start + i,
  2135							 &state[start + i],
  2136							 at_in[i]);
  2137		}
  2138	
  2139		if (env->log.level & BPF_LOG_LEVEL2)
  2140			print_subprog_arg_access(env, subprog, access);
  2141	
  2142		info->at_in = at_in;
  2143		info->arg_use = arg_use;
  2144		info->len = len;
  2145		return 0;
  2146	
  2147	err_free:
  2148		kvfree(arg_use);
  2149		kvfree(at_stack_in);
  2150		kvfree(at_in);
  2151		return err;
> 2152	}
  2153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
