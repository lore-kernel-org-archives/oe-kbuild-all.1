Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0233B8D61
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768494142; cv=none; b=Z7r36pKNAxDaGAp51GpWykG1CDNYiEQuLVT2Mp4dP9p65nfYFu6hgB/tN0lkIL5db+DXaYIWhb1M64ekzOiLQxBSybA8hxMBrnhOnPwXuFIY/gk4dzIdQY0F5f7OD5qDxPpkqrugKs4BrnIEbLETsRI2b1gVojUsQb+OvCtFlIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768494142; c=relaxed/simple;
	bh=AZ9ALpoxRMsqB1wk058MFJec7ZDc9Obthxm2I1Sb9Gk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WkZi85KotpUPEqJp0vcxWmtdUu/YaOpBl5jfQLyLrNoKxjBYWa+C/D0ORnFNNFl5aJkSnhUpesaydk9aoKi4njVhplRtNyDuMUL08d87WekOaah6BNLJaA47sqQ40YZ2KBfOkf3SYW8I3l9RErtfG5fYHbt4m/VRXhnnRJp0bko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zbx4Tnc3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zbx4Tnc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768494139; x=1800030139;
  h=date:from:to:cc:subject:message-id;
  bh=AZ9ALpoxRMsqB1wk058MFJec7ZDc9Obthxm2I1Sb9Gk=;
  b=Zbx4Tnc3jjtPh6+b6bVGYjPMhbqc0KgxVmxAYX3JyDoi6h6eHf3o2O1P
   pR4BS3wL3u6cYwgkXO7mnbJ2D3pw022SXTfSV11Fqn4Z6VnK9+SdZ1p7F
   yCjZRQsEO2CL2wjndvFKb5gEsBZ0NC3yiOobmm0dkKJ8vByo4DlLwTO39
   aj7qeGLrN6nC8slZmMTNrVFaqXsTo2V7YLO/Rr5j2Ltb+YFQTC+za/kr8
   bVgI3rHGmPFTmf7NMqb9W+reX6wY1SqVbz66ynAWZRcCFFKcfwFs7Wuob
   T0n1veXYMCe/bSTqL9DINWMPbz7hvvlp32MbI2xDg0pUCTgOvQdN1gbWY
   Q==;
X-CSE-ConnectionGUID: 106lUsqzSRmaUKseMGidFw==
X-CSE-MsgGUID: 41YXNLVmQU6nmdkGRhvALw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69969507"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69969507"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 08:22:17 -0800
X-CSE-ConnectionGUID: E2IIir0fQEucgdtppwWAGQ==
X-CSE-MsgGUID: kc7q+djxTG2uYOlDYtLOQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209852798"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 08:22:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgQ6v-00000000ICw-1xDi;
	Thu, 15 Jan 2026 16:22:13 +0000
Date: Fri, 16 Jan 2026 00:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.9 8/16] mm/bpf_oom.c:51:58: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202601160003.NdBB6pVR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.9
head:   9d2b723568aae6a6f7e41fc66f65f8b009690b6e
commit: 36dfd96fa3fbd7d4057fe22dfa657b62a9b6865b [8/16] mm: introduce BPF OOM struct ops
config: s390-randconfig-r133-20260115 (https://download.01.org/0day-ci/archive/20260116/202601160003.NdBB6pVR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160003.NdBB6pVR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160003.NdBB6pVR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/bpf_oom.c:51:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct bpf_map *map @@     got struct bpf_map [noderef] __rcu *map @@
   mm/bpf_oom.c:51:58: sparse:     expected struct bpf_map *map
   mm/bpf_oom.c:51:58: sparse:     got struct bpf_map [noderef] __rcu *map
>> mm/bpf_oom.c:125:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/bpf_oom.c:125:9: sparse:    struct bpf_struct_ops_link [noderef] __rcu *
   mm/bpf_oom.c:125:9: sparse:    struct bpf_struct_ops_link *

vim +51 mm/bpf_oom.c

    28	
    29	bool bpf_handle_oom(struct oom_control *oc)
    30	{
    31		struct bpf_struct_ops_link *st_link;
    32		struct bpf_oom_ops *bpf_oom_ops;
    33		struct mem_cgroup *memcg;
    34		int ret = 0;
    35	
    36		/*
    37		 * System-wide OOMs are handled by the struct ops attached
    38		 * to the root memory cgroup
    39		 */
    40		memcg = oc->memcg ? oc->memcg : root_mem_cgroup;
    41	
    42		rcu_read_lock_trace();
    43	
    44		/* Find the nearest bpf_oom_ops traversing the cgroup tree upwards */
    45		for (; memcg; memcg = parent_mem_cgroup(memcg)) {
    46			st_link = rcu_dereference_check(memcg->css.cgroup->bpf.bpf_oom_link,
    47							rcu_read_lock_trace_held());
    48			if (!st_link)
    49				continue;
    50	
  > 51			bpf_oom_ops = bpf_struct_ops_data(st_link->map);
    52			/* Call BPF OOM handler */
    53			ret = bpf_ops_handle_oom(bpf_oom_ops, st_link, oc);
    54	
    55			if (ret && oc->bpf_memory_freed)
    56				break;
    57			ret = 0;
    58		}
    59	
    60		rcu_read_unlock_trace();
    61	
    62		return ret && oc->bpf_memory_freed;
    63	}
    64	
    65	static int __handle_out_of_memory(struct oom_control *oc,
    66					  struct bpf_struct_ops_link *st_link)
    67	{
    68		return 0;
    69	}
    70	
    71	static struct bpf_oom_ops __bpf_oom_ops = {
    72		.handle_out_of_memory = __handle_out_of_memory,
    73	};
    74	
    75	static const struct bpf_func_proto *
    76	bpf_oom_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
    77	{
    78		return tracing_prog_func_proto(func_id, prog);
    79	}
    80	
    81	static bool bpf_oom_ops_is_valid_access(int off, int size,
    82						enum bpf_access_type type,
    83						const struct bpf_prog *prog,
    84						struct bpf_insn_access_aux *info)
    85	{
    86		return bpf_tracing_btf_ctx_access(off, size, type, prog, info);
    87	}
    88	
    89	static const struct bpf_verifier_ops bpf_oom_verifier_ops = {
    90		.get_func_proto = bpf_oom_func_proto,
    91		.is_valid_access = bpf_oom_ops_is_valid_access,
    92	};
    93	
    94	static int bpf_oom_ops_reg(void *kdata, struct bpf_link *link)
    95	{
    96		struct bpf_struct_ops_link *st_link = (struct bpf_struct_ops_link *)link;
    97		struct cgroup *cgrp;
    98	
    99		/* The link is not yet fully initialized, but cgroup should be set */
   100		if (!link)
   101			return -EOPNOTSUPP;
   102	
   103		cgrp = st_link->cgroup;
   104		if (!cgrp)
   105			return -EINVAL;
   106	
   107		if (cmpxchg(&cgrp->bpf.bpf_oom_link, NULL, st_link))
   108			return -EEXIST;
   109	
   110		return 0;
   111	}
   112	
   113	static void bpf_oom_ops_unreg(void *kdata, struct bpf_link *link)
   114	{
   115		struct bpf_struct_ops_link *st_link = (struct bpf_struct_ops_link *)link;
   116		struct cgroup *cgrp;
   117	
   118		if (!link)
   119			return;
   120	
   121		cgrp = st_link->cgroup;
   122		if (!cgrp)
   123			return;
   124	
 > 125		WARN_ON(cmpxchg(&cgrp->bpf.bpf_oom_link, st_link, NULL) != st_link);
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
