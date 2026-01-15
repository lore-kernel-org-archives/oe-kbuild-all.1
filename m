Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EA025776
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768508357; cv=none; b=YI7hgh9CgcaoKnSVPDh4IEbI98PrLCbCaqejG1OKGAFb7r85X4J0oJ6pF0wmlzVpvFfCFvB8ruXQ0GsEXtf5Xk3l7nmbDFxVRRP7GpENzpUwh8P5/dENB5hJAmALpO4FnlIecSGewpQ+paOEkfn6YONgN4Z9Ziy2ddoI+r1XWN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768508357; c=relaxed/simple;
	bh=jFhJPFt+DeJ9BvQ81Hn4th6rWWE1XGTZyYmoSkigSKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+HF//a3CZMnlR+A4RKo3PT71qdnyKNuRiepKpxLV60cNe2Dr7BH/kH7V4iE748MNK640h32CKNBDrw/jddnajfjA4JF9Ohj5Z34DWKubwSJ0PE3rZpLfZv8AQhEDG+ceK6QAWgst0BuRoG1nk64aFLac9n3HTqXHodnKPsoLaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXbQRX6S; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXbQRX6S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768508356; x=1800044356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jFhJPFt+DeJ9BvQ81Hn4th6rWWE1XGTZyYmoSkigSKo=;
  b=mXbQRX6SPEp9zVGBAnOGVOj79MyoFmxhxq/QESnr2o7XSewSwsbDssPb
   itbfLK/x3S+/MHbkEk0PGLaVZdkOqVkgOzJShm9oeh31PveQTa1KAJAx3
   7tAZvm9gpRtVdXBeUKU/np3HT5AOT0MJ5riiYJfhC1Pvoquoqg2NZMgrp
   u1/3rLDu/Qk3FLI7bmC52w5zucJzxJxDtjOTh4iI60UxmmLMgvoO+v3Qz
   wt8zZvs3sLAjQVO8MfWfh/ow8eL5T413+TianZSMSkHpLy7MRUGze9LRa
   B4ET+fuNra/3BVSW8sRDbWe1yv+S/e7peT6uRiTqGA0AVMrxy3zOddjQt
   g==;
X-CSE-ConnectionGUID: DO/fSi/tR4ebc23EbNvEYw==
X-CSE-MsgGUID: uD/0HgGISZ6/W9tIVQWQUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80467326"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="80467326"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 12:19:15 -0800
X-CSE-ConnectionGUID: LZZnUslrTjKGaRhbp7NcFw==
X-CSE-MsgGUID: uqfmSmGUQUaFPVwZR6VC2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="209187000"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jan 2026 12:19:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgToF-00000000JxU-0pie;
	Thu, 15 Jan 2026 20:19:11 +0000
Date: Fri, 16 Jan 2026 04:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 2/3] mm: add support for bpf based numa
 balancing
Message-ID: <202601160304.QBjfltaz-lkp@intel.com>
References: <20260113121238.11300-3-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113121238.11300-3-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/sched-add-helpers-for-numa-balancing/20260113-201425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260113121238.11300-3-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next 2/3] mm: add support for bpf based numa balancing
config: nios2-randconfig-001-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160304.QBjfltaz-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160304.QBjfltaz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160304.QBjfltaz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/bpf_numa_balancing.c:25:5: warning: no previous prototype for 'bpf_numab_hook' [-Wmissing-prototypes]
      25 | int bpf_numab_hook(struct task_struct *p)
         |     ^~~~~~~~~~~~~~
   mm/bpf_numa_balancing.c: In function 'bpf_numab_reg':
   mm/bpf_numa_balancing.c:123:17: error: implicit declaration of function 'mem_cgroup_get_from_ino'; did you mean 'mem_cgroup_get_oom_group'? [-Werror=implicit-function-declaration]
     123 |         memcg = mem_cgroup_get_from_ino(ops->cgroup_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 mem_cgroup_get_oom_group
>> mm/bpf_numa_balancing.c:123:15: warning: assignment to 'struct mem_cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     123 |         memcg = mem_cgroup_get_from_ino(ops->cgroup_id);
         |               ^
   mm/bpf_numa_balancing.c: In function 'bpf_numab_unreg':
   mm/bpf_numa_balancing.c:149:15: warning: assignment to 'struct mem_cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     149 |         memcg = mem_cgroup_get_from_ino(ops->cgroup_id);
         |               ^
   mm/bpf_numa_balancing.c: In function 'bpf_numab_update':
   mm/bpf_numa_balancing.c:169:15: warning: assignment to 'struct mem_cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     169 |         memcg = mem_cgroup_get_from_ino(ops->cgroup_id);
         |               ^
   In file included from mm/bpf_numa_balancing.c:3:
   mm/bpf_numa_balancing.c: In function 'bpf_numab_ops_init':
   include/linux/bpf.h:2128:50: warning: statement with no effect [-Wunused-value]
    2128 | #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
         |                                                  ^~~~~~~~~~~~~~~~
   mm/bpf_numa_balancing.c:219:15: note: in expansion of macro 'register_bpf_struct_ops'
     219 |         err = register_bpf_struct_ops(&bpf_bpf_numab_ops, bpf_numab_ops);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/bpf_numab_hook +25 mm/bpf_numa_balancing.c

    24	
  > 25	int bpf_numab_hook(struct task_struct *p)
    26	{
    27		struct bpf_numab_ops *bpf_numab;
    28		struct mem_cgroup *task_memcg;
    29		int ret = 0;
    30	
    31		if (!p->mm)
    32			return 0;
    33	
    34		/* We can cache memcg::bpf_numab to mm::bpf_numab if it becomes a bettleneck */
    35		rcu_read_lock();
    36		task_memcg = mem_cgroup_from_task(rcu_dereference(p->mm->owner));
    37		if (!task_memcg)
    38			goto out;
    39	
    40		/* Users can install BPF NUMA policies on leaf memory cgroups.
    41		 * This eliminates the need to traverse the cgroup hierarchy or
    42		 * propagate policies during registration, simplifying the kernel design.
    43		 */
    44		bpf_numab = rcu_dereference(task_memcg->bpf_numab);
    45		if (!bpf_numab || !bpf_numab->numab_hook)
    46			goto out;
    47	
    48		ret = bpf_numab->numab_hook(p);
    49	
    50	out:
    51		rcu_read_unlock();
    52		return ret;
    53	}
    54	
    55	static const struct bpf_func_proto *
    56	bpf_numab_get_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
    57	{
    58		return bpf_base_func_proto(func_id, prog);
    59	}
    60	
    61	static bool bpf_numab_ops_is_valid_access(int off, int size,
    62						  enum bpf_access_type type,
    63						  const struct bpf_prog *prog,
    64						  struct bpf_insn_access_aux *info)
    65	{
    66		return bpf_tracing_btf_ctx_access(off, size, type, prog, info);
    67	}
    68	
    69	static const struct bpf_verifier_ops bpf_numab_verifier_ops = {
    70		.get_func_proto = bpf_numab_get_func_proto,
    71		.is_valid_access = bpf_numab_ops_is_valid_access,
    72	};
    73	
    74	static int bpf_numab_init(struct btf *btf)
    75	{
    76		return 0;
    77	}
    78	
    79	static int bpf_numab_check_member(const struct btf_type *t,
    80					  const struct btf_member *member,
    81					  const struct bpf_prog *prog)
    82	{
    83		/* The call site operates under RCU protection. */
    84		if (prog->sleepable)
    85			return -EINVAL;
    86		return 0;
    87	}
    88	
    89	static int bpf_numab_init_member(const struct btf_type *t,
    90				       const struct btf_member *member,
    91				       void *kdata, const void *udata)
    92	{
    93		const struct bpf_numab_ops *ubpf_numab;
    94		struct bpf_numab_ops *kbpf_numab;
    95		u32 moff;
    96	
    97		ubpf_numab = (const struct bpf_numab_ops *)udata;
    98		kbpf_numab = (struct bpf_numab_ops *)kdata;
    99	
   100		moff = __btf_member_bit_offset(t, member) / 8;
   101		switch (moff) {
   102		case offsetof(struct bpf_numab_ops, cgroup_id):
   103			/* bpf_struct_ops only handles func ptrs and zero-ed members.
   104			 * Return 1 to bypass the default handler.
   105			 */
   106			kbpf_numab->cgroup_id = ubpf_numab->cgroup_id;
   107			return 1;
   108		}
   109		return 0;
   110	}
   111	
   112	static int bpf_numab_reg(void *kdata, struct bpf_link *link)
   113	{
   114		struct bpf_numab_ops *ops = kdata;
   115		struct mem_cgroup *memcg;
   116		int err = 0;
   117	
   118		/* Only the link mode is supported. */
   119		if (!link)
   120			return -EOPNOTSUPP;
   121	
   122		/* Depends on CONFIG_SHRINKER_DEBUG */
 > 123		memcg = mem_cgroup_get_from_ino(ops->cgroup_id);
   124		if (!memcg || IS_ERR(memcg))
   125			return -ENOENT;
   126	
   127		spin_lock(&numab_ops_lock);
   128		/* Each memory cgroup can have at most one attached BPF program to ensure
   129		 * exclusive control and avoid interference between different BPF policies.
   130		 */
   131		if (rcu_access_pointer(memcg->bpf_numab)) {
   132			err = -EBUSY;
   133			goto out;
   134		}
   135		rcu_assign_pointer(memcg->bpf_numab, ops);
   136		spin_unlock(&numab_ops_lock);
   137		static_branch_inc(&bpf_numab_enabled_key);
   138	
   139	out:
   140		mem_cgroup_put(memcg);
   141		return err;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
