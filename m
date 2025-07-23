Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B743122068B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 17:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753292741; cv=none; b=bhTEV/yow7DstjIv5Z1n+cNLIpr7PrT5+G4V6SORI+Lo+brQOEymBMqgR+9DPzqcW4WqLz0oqfjGijKANEdR1+bdRI33AzMtSGDIsVp16Ob+MifPAF0Il9iptsfjgilkDSsqP5rGHLjPvhiOYt6LgxzyqT2J7soTQGC4KmduSCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753292741; c=relaxed/simple;
	bh=vSd5IxIMTFoG04xInqYCcqRHYfNAw9bTgQcvAP8DN4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RgJnqYgIvYpVZcBzFgpPVqzS6/HoUoK8GShrNHte6yrov7OMWKbvhz6i4+u8uouWEa7IWuirivFVsSyitUBhG82EfBTMR0TvRwBKpi4Nvru/2/h7O58Z3GqFUBjx8YQmAEFntmamqm2MJxCw0aJAO9tkACMGYfyMJ9JFy8B1YTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClXwOPG0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClXwOPG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753292740; x=1784828740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vSd5IxIMTFoG04xInqYCcqRHYfNAw9bTgQcvAP8DN4E=;
  b=ClXwOPG0YrzKUjQbKyO1e7U4CjJyxaHGHcWesogxS38wQXNAz09MImZU
   FA8cdGfBvz1rF38Pg8KwBi3Il3ZY8IL2yBFO9L3uPnry/kWY9az1iLVRA
   hsjS5LuE62lu18SglXxm25B/5Ni5XduL4rDAEocC7S4PoTrZtktxuXCLZ
   0GCBWZbohyhEtNL2xyBC8B/aHYAhriywC028t2c3lduiPQjiMDoi36kMn
   e8IyAjUKHh3Gsbb3Z8XEaMdvYmzOW+K1a57Rt+hOMiZHYojFs6ENsxnVY
   VNanosYsBPeqErDxwB6LsUDIu4ycUGwoeMS2HZnMElaeEk8Yqi6SDNSjk
   Q==;
X-CSE-ConnectionGUID: +Ax164X0Tky497e4mCNHUg==
X-CSE-MsgGUID: 0hD0oEGxQpGYr3oSI187/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73043051"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="73043051"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:45:40 -0700
X-CSE-ConnectionGUID: Gnjdr7XnT+2+7BWDnAZsNw==
X-CSE-MsgGUID: 5RKxKxVLTCmgYtY7YazgMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="183291648"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jul 2025 10:45:38 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uedX5-0000Av-2c;
	Wed, 23 Jul 2025 17:45:35 +0000
Date: Wed, 23 Jul 2025 19:39:05 +0200
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.3 16/16] kernel/sched/bpf_psi.c:80:42: error:
 invalid use of undefined type 'struct cgroup'
Message-ID: <202507231948.2n1ov0Mx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.3
head:   f6d7d74251a82ec19e7d4e92627a6faf008dca8d
commit: f6d7d74251a82ec19e7d4e92627a6faf008dca8d [16/16] sched: psi: introduce BPF_PSI struct ops
config: x86_64-buildonly-randconfig-2004-20250721 (https://download.01.org/0day-ci/archive/20250723/202507231948.2n1ov0Mx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231948.2n1ov0Mx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231948.2n1ov0Mx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/bpf_psi.c: In function 'bpf_psi_cgroup_free':
>> kernel/sched/bpf_psi.c:80:42: error: invalid use of undefined type 'struct cgroup'
      80 |         struct psi_group * group = cgroup->psi;
         |                                          ^~
   kernel/sched/bpf_psi.c: In function 'bpf_psi_ops_reg':
>> kernel/sched/bpf_psi.c:154:26: error: implicit declaration of function 'cgroup_get_from_id'; did you mean 'cgroup_id_from_mm'? [-Werror=implicit-function-declaration]
     154 |                 cgroup = cgroup_get_from_id(ops->cgroup_id);
         |                          ^~~~~~~~~~~~~~~~~~
         |                          cgroup_id_from_mm
>> kernel/sched/bpf_psi.c:154:24: warning: assignment to 'struct cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |                 cgroup = cgroup_get_from_id(ops->cgroup_id);
         |                        ^
>> kernel/sched/bpf_psi.c:158:25: error: implicit declaration of function 'cgroup_psi'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
     158 |                 group = cgroup_psi(cgroup);
         |                         ^~~~~~~~~~
         |                         cgroup_init
>> kernel/sched/bpf_psi.c:158:23: warning: assignment to 'struct psi_group *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     158 |                 group = cgroup_psi(cgroup);
         |                       ^
>> kernel/sched/bpf_psi.c:187:17: error: implicit declaration of function 'cgroup_put'; did you mean 'cgroup_init'? [-Werror=implicit-function-declaration]
     187 |                 cgroup_put(cgroup);
         |                 ^~~~~~~~~~
         |                 cgroup_init
   cc1: some warnings being treated as errors


vim +80 kernel/sched/bpf_psi.c

    77	
    78	void bpf_psi_cgroup_free(struct cgroup *cgroup)
    79	{
  > 80		struct psi_group * group = cgroup->psi;
    81		static LIST_HEAD(to_destroy);
    82		struct psi_trigger *t, *p;
    83	
    84		mutex_lock(&group->bpf_trigger_lock);
    85		list_for_each_entry_safe(t, p, &group->bpf_triggers, bpf_node) {
    86			mutex_lock(&t->bpf_psi->lock);
    87			if (t->bpf_psi->trigger) {
    88				t->bpf_psi->trigger = NULL;
    89				list_move(&t->bpf_node, &to_destroy);
    90			}
    91			mutex_unlock(&t->bpf_psi->lock);
    92		}
    93		mutex_unlock(&group->bpf_trigger_lock);
    94	
    95		list_for_each_entry_safe(t, p, &to_destroy, bpf_node) {
    96			bpf_psi_cgroup_free_handle(t, cgroup);
    97			psi_trigger_destroy(t);
    98		}
    99	}
   100	
   101	void bpf_psi_event_handle(struct psi_trigger *t)
   102	{
   103		struct bpf_psi *bpf_psi = t->bpf_psi;
   104		struct bpf_psi_ops *ops;
   105		int idx;
   106	
   107		idx = srcu_read_lock(&bpf_psi->srcu);
   108		ops = READ_ONCE(bpf_psi->ops);
   109		if (ops && ops->handle_psi_event)
   110			ops->handle_psi_event(t);
   111		srcu_read_unlock(&bpf_psi->srcu, idx);
   112	}
   113	
   114	// bpf struct ops
   115	
   116	static void __handle_psi_event(struct psi_trigger *t)
   117	{
   118	}
   119	
   120	static struct bpf_psi_ops __bpf_psi_ops = {
   121		.handle_psi_event = __handle_psi_event,
   122	};
   123	
   124	static const struct bpf_func_proto *
   125	bpf_psi_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
   126	{
   127		return tracing_prog_func_proto(func_id, prog);
   128	}
   129	
   130	static bool bpf_psi_ops_is_valid_access(int off, int size,
   131						enum bpf_access_type type,
   132						const struct bpf_prog *prog,
   133						struct bpf_insn_access_aux *info)
   134	{
   135		return bpf_tracing_btf_ctx_access(off, size, type, prog, info);
   136	}
   137	
   138	static const struct bpf_verifier_ops bpf_psi_verifier_ops = {
   139		.get_func_proto = bpf_psi_func_proto,
   140		.is_valid_access = bpf_psi_ops_is_valid_access,
   141	};
   142	
   143	static int bpf_psi_ops_reg(void *kdata, struct bpf_link *link)
   144	{
   145		struct bpf_psi_ops *ops = kdata;
   146		struct cgroup *cgroup = NULL;
   147		struct psi_group *group;
   148		struct bpf_psi *bpf_psi;
   149		struct psi_trigger *t;
   150		struct psi_trigger_params params;
   151		int ret;
   152	
   153		if (ops->cgroup_id) {
 > 154			cgroup = cgroup_get_from_id(ops->cgroup_id);
   155			if (IS_ERR_OR_NULL(cgroup))
   156				return PTR_ERR(cgroup);
   157	
 > 158			group = cgroup_psi(cgroup);
   159		} else {
   160			group = &psi_system;
   161		}
   162	
   163		bpf_psi = bpf_psi_create(ops, ops->cgroup_id);
   164		if (!bpf_psi) {
   165			ret = -ENOMEM;
   166			goto exit;
   167		}
   168	
   169		params.type = PSI_BPF;
   170		params.privileged = capable(CAP_SYS_RESOURCE);
   171		params.res = ops->res;
   172		params.full = ops->full;
   173		params.threshold_us = ops->threshold_us;
   174		params.window_us = ops->window_us;
   175		params.bpf_psi = bpf_psi;
   176	
   177		t = psi_trigger_create(group, &params);
   178		if (IS_ERR_OR_NULL(t)) {
   179			bpf_psi_free(bpf_psi);
   180			ret = PTR_ERR(t);
   181			goto exit;
   182		}
   183	
   184		ops->bpf_psi = bpf_psi;
   185	exit:
   186		if (cgroup)
 > 187			cgroup_put(cgroup);
   188		return ret;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
