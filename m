Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95059366
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Jun 2025 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749945652; cv=none; b=uzTBRK2ir9WrVM8llGd/XGdD6ctENtG+JoLl2CO3Cu7WFt6ah6vF+nKOHY59cDbnEJJhnDDF6yPP8xx1JTyEuV1cXoyFOrzs2YWnjuP1N6FCgm8n3VpLGBPj2xKd+ZRSGQlWTOmGq7JWZQtOZXwKSsDuupNdREVnrLeG+0oA/qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749945652; c=relaxed/simple;
	bh=r5cAqfcXLvEj36O+aThhjZF3goRlP9Hv9r+oLul3K4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtCje3uv/2jbUjkYMd8iTu9sscGI/EUggsCKIv6zI8DElcD1EdiVvtcYV1rfYC+g3Mm6D0zv2mpqSbud7G/Pxpgz9CS3iIC1qRrYMA5t93CvE3WxKuInO29PHIPfY5kfOp9MZOPqkDRCCW60OQ2TrLDC42CYGcp4qUz/BjLV7O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4UqyvN2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4UqyvN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749945650; x=1781481650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r5cAqfcXLvEj36O+aThhjZF3goRlP9Hv9r+oLul3K4A=;
  b=W4UqyvN2Nmjj5S7R3iCM13xaAvdqntvFQ2boZPK+zNG8S1wVbS0mlZ5e
   VC2KC6cx4ppAVxLi0jMXTT7/THOH6FwuUxUvEdHc7rzCvH02Y4o/bImvT
   EgXVJ+KMATcsEMAz6NERq9sqOIxjY8l2cwGXdzU0RNmNb7DXVEvPDvROV
   c9W+YI1wzyYDN7PucYJVzIXPlODlycvnRA0a1XBopZ5mfPijfoBR7+BXP
   DJjuBczhLD+NrUTnD2mv8Mm2UU2L5zbU3Vqa81g/FJXN4cLzxddUT7DKh
   Xg6J8EmVswa36zsqyjT2kpTlKk8Xpff2VPQ25V4PzbS/VuYljqSA7isfs
   A==;
X-CSE-ConnectionGUID: HrEs7a8kQliewxGkqxFcYw==
X-CSE-MsgGUID: GCfqGftgTXCF+U5t9AvkyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="51841347"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="51841347"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 17:00:50 -0700
X-CSE-ConnectionGUID: E1/PoGJ+Tn6LpTUgssgVpg==
X-CSE-MsgGUID: fUR/5B5MTKyBfpgZONn6nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="148119744"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2025 17:00:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQanm-000Dxo-39;
	Sun, 15 Jun 2025 00:00:46 +0000
Date: Sun, 15 Jun 2025 08:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v2 2/4] bpf: Generating a stubbed version of BPF
 program for termination
Message-ID: <202506150740.6zrpghl0-lkp@intel.com>
References: <20250614064056.237005-3-sidchintamaneni@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614064056.237005-3-sidchintamaneni@gmail.com>

Hi Siddharth,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Siddharth-Chintamaneni/bpf-Introduce-new-structs-and-struct-fields/20250614-144332
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250614064056.237005-3-sidchintamaneni%40gmail.com
patch subject: [RFC bpf-next v2 2/4] bpf: Generating a stubbed version of BPF program for termination
config: arm-randconfig-003-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150740.6zrpghl0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150740.6zrpghl0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150740.6zrpghl0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'clone_patch_prog':
>> kernel/bpf/verifier.c:24504:2: warning: 'strncpy' output truncated before terminating nul copying 6 bytes from a string of the same length [-Wstringop-truncation]
     strncpy(patch_prog->aux->name, patch_prefix, strlen(patch_prefix));
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'clone_patch_prog',
       inlined from 'prepare_patch_prog' at kernel/bpf/verifier.c:24562:8,
       inlined from 'bpf_check' at kernel/bpf/verifier.c:24784:9:
>> kernel/bpf/verifier.c:24509:2: warning: 'strncat' output may be truncated copying between 0 and 9 bytes from a string of length 15 [-Wstringop-truncation]
     strncat(patch_prog->aux->name, prog->aux->name, prog_name_len);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +24504 kernel/bpf/verifier.c

 24416	
 24417	static int clone_patch_prog(struct bpf_verifier_env *env)
 24418	{
 24419		gfp_t gfp_flags = bpf_memcg_flags(GFP_KERNEL | __GFP_ZERO | GFP_USER);
 24420		unsigned int size, prog_name_len;
 24421		struct bpf_prog *patch_prog, *prog = env->prog;
 24422		struct bpf_prog_aux *aux;
 24423	
 24424		size = prog->pages * PAGE_SIZE;
 24425		patch_prog = __vmalloc(size, gfp_flags);
 24426		if (!patch_prog)
 24427			return -ENOMEM;
 24428	
 24429		aux = kzalloc(sizeof(*aux), bpf_memcg_flags(GFP_KERNEL | GFP_USER));
 24430		if (!aux) {
 24431			vfree(patch_prog);
 24432			return -ENOMEM;
 24433		}
 24434	
 24435		/*
 24436		 * Copying prog fields
 24437		 */
 24438		patch_prog->pages = prog->pages;
 24439		patch_prog->jited = 0;
 24440		patch_prog->jit_requested = prog->jit_requested;
 24441		patch_prog->gpl_compatible = prog->gpl_compatible;
 24442		patch_prog->blinding_requested = prog->blinding_requested;
 24443		patch_prog->is_termination_prog = 1;
 24444		patch_prog->len = prog->len;
 24445		patch_prog->type = prog->type;
 24446		patch_prog->aux = aux;
 24447	
 24448		/*
 24449		 * Copying prog aux fields
 24450		 */
 24451		patch_prog->aux->used_map_cnt = prog->aux->used_map_cnt;
 24452		patch_prog->aux->used_btf_cnt = prog->aux->used_btf_cnt;
 24453		patch_prog->aux->max_ctx_offset = prog->aux->max_ctx_offset;
 24454		patch_prog->aux->stack_depth = prog->aux->stack_depth;
 24455		patch_prog->aux->func_cnt = prog->aux->func_cnt; /* will be populated by jit_subprogs */
 24456		patch_prog->aux->real_func_cnt = prog->aux->real_func_cnt; /* will be populated by jit_subprogs */
 24457		patch_prog->aux->func_idx = prog->aux->func_idx; /* will be populated by jit_subprogs */
 24458		patch_prog->aux->attach_btf_id = prog->aux->attach_btf_id;
 24459		patch_prog->aux->attach_st_ops_member_off = prog->aux->attach_st_ops_member_off;
 24460		patch_prog->aux->ctx_arg_info_size = prog->aux->ctx_arg_info_size;
 24461		patch_prog->aux->max_rdonly_access = prog->aux->max_rdonly_access;
 24462		patch_prog->aux->max_rdwr_access = prog->aux->max_rdwr_access;
 24463		patch_prog->aux->verifier_zext = prog->aux->verifier_zext;
 24464		patch_prog->aux->dev_bound = prog->aux->dev_bound;
 24465		patch_prog->aux->offload_requested = prog->aux->offload_requested;
 24466		patch_prog->aux->attach_btf_trace = prog->aux->attach_btf_trace;
 24467		patch_prog->aux->attach_tracing_prog = prog->aux->attach_tracing_prog;
 24468		patch_prog->aux->func_proto_unreliable = prog->aux->func_proto_unreliable;
 24469		patch_prog->aux->tail_call_reachable = prog->aux->tail_call_reachable;
 24470		patch_prog->aux->xdp_has_frags = prog->aux->xdp_has_frags;
 24471		patch_prog->aux->exception_cb = prog->aux->exception_cb;
 24472		patch_prog->aux->exception_boundary = prog->aux->exception_boundary;
 24473		patch_prog->aux->is_extended = prog->aux->is_extended;
 24474		patch_prog->aux->jits_use_priv_stack = prog->aux->jits_use_priv_stack;
 24475		patch_prog->aux->priv_stack_requested = prog->aux->priv_stack_requested;
 24476		patch_prog->aux->changes_pkt_data = prog->aux->changes_pkt_data;
 24477		patch_prog->aux->might_sleep = prog->aux->might_sleep;
 24478		patch_prog->aux->prog_array_member_cnt = prog->aux->prog_array_member_cnt;
 24479		patch_prog->aux->size_poke_tab = prog->aux->size_poke_tab;
 24480		patch_prog->aux->cgroup_atype = prog->aux->cgroup_atype;
 24481		patch_prog->aux->linfo = prog->aux->linfo; 
 24482		patch_prog->aux->func_info_cnt = prog->aux->func_info_cnt;
 24483		patch_prog->aux->nr_linfo = prog->aux->nr_linfo;
 24484		patch_prog->aux->linfo_idx = prog->aux->linfo_idx;
 24485		patch_prog->aux->num_exentries = prog->aux->num_exentries;
 24486	
 24487		patch_prog->aux->poke_tab = kmalloc_array(patch_prog->aux->size_poke_tab, 
 24488						sizeof(struct bpf_jit_poke_descriptor), GFP_KERNEL);
 24489		if (!patch_prog->aux->poke_tab) {
 24490			kfree(patch_prog->aux);
 24491			vfree(patch_prog);
 24492			return -ENOMEM;
 24493		}
 24494		
 24495		for (int i = 0; i < patch_prog->aux->size_poke_tab; i++) {
 24496			memcpy(&patch_prog->aux->poke_tab[i], &prog->aux->poke_tab[i], 
 24497					sizeof(struct bpf_jit_poke_descriptor));
 24498		}
 24499	
 24500		memcpy(patch_prog->insnsi, prog->insnsi, bpf_prog_insn_size(prog));
 24501	
 24502		char *patch_prefix = "patch_";
 24503		prog_name_len = strlen(prog->aux->name);
 24504		strncpy(patch_prog->aux->name, patch_prefix, strlen(patch_prefix));
 24505	
 24506		if (prog_name_len + strlen(patch_prefix) + 1 > BPF_OBJ_NAME_LEN) {
 24507			prog_name_len = BPF_OBJ_NAME_LEN - strlen(patch_prefix) - 1;
 24508		}
 24509		strncat(patch_prog->aux->name, prog->aux->name, prog_name_len);
 24510		
 24511		prog->term_states->patch_prog = patch_prog;
 24512	
 24513		return 0;
 24514	}
 24515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
