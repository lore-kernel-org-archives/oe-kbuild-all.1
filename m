Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A68168A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688141195; x=1719677195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r6SrguwRaobJWPr5yCQ0ZYs3lOiZg/Ow4AI0MFee+co=;
  b=LW54z5533GpHaiw5Hl5iP5hvIwF5cmCA2nNUBXdC6mHm55JvdTQ4gjWi
   J4C0dMUUAo9H7dk7vYZ6lp4vw53RJsB8szZ6PezAtMAGjiGigUpuSnQaG
   hAapFDP+GQCepBAT5/giqGQUQRvYZYwk0CmWf6b07KKTEFJOAkadm5/NA
   WpOHNZaufhEj/uRNZsS4RvGg/O7KYf0JD5DwDlHyBYRr3xO3aDLDOnjrj
   2u62hy2Y1t10HR8ttjisGEBzVU7OdecWLscdPfmdgPgi8ZKBw3075npUX
   CGALkizVC/KrBniA54dWLLMHBj+PEovu6x6ygfBbltyMoG+V4CU/Cq/Vn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="365914917"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="365914917"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 09:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="841907746"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="841907746"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Jun 2023 09:06:34 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFGdl-000F7L-0F;
	Fri, 30 Jun 2023 16:06:33 +0000
Date: Sat, 1 Jul 2023 00:05:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 16583/29940]
 kernel/bpf/cgroup.c:195:6: warning: variable 'old_flags' set but not used
Message-ID: <202306302325.77TBtnlK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   e8c1340cbb0f24693dd9056f8d5a7808e4597b80
commit: 9e61c87b1f47b4dc3d48de83d85e9f17c320f91e [16583/29940] UPSTREAM: bpf: multi program support for cgroup+bpf
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230630/202306302325.77TBtnlK-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302325.77TBtnlK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302325.77TBtnlK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/cgroup.c: In function '__cgroup_bpf_attach':
>> kernel/bpf/cgroup.c:195:6: warning: variable 'old_flags' set but not used [-Wunused-but-set-variable]
     u32 old_flags;
         ^~~~~~~~~


vim +/old_flags +195 kernel/bpf/cgroup.c

   177	
   178	/**
   179	 * __cgroup_bpf_attach() - Attach the program to a cgroup, and
   180	 *                         propagate the change to descendants
   181	 * @cgrp: The cgroup which descendants to traverse
   182	 * @prog: A program to attach
   183	 * @type: Type of attach operation
   184	 *
   185	 * Must be called with cgroup_mutex held.
   186	 */
   187	int __cgroup_bpf_attach(struct cgroup *cgrp, struct bpf_prog *prog,
   188				enum bpf_attach_type type, u32 flags)
   189	{
   190		struct list_head *progs = &cgrp->bpf.progs[type];
   191		struct bpf_prog *old_prog = NULL;
   192		struct cgroup_subsys_state *css;
   193		struct bpf_prog_list *pl;
   194		bool pl_was_allocated;
 > 195		u32 old_flags;
   196		int err;
   197	
   198		if ((flags & BPF_F_ALLOW_OVERRIDE) && (flags & BPF_F_ALLOW_MULTI))
   199			/* invalid combination */
   200			return -EINVAL;
   201	
   202		if (!hierarchy_allows_attach(cgrp, type, flags))
   203			return -EPERM;
   204	
   205		if (!list_empty(progs) && cgrp->bpf.flags[type] != flags)
   206			/* Disallow attaching non-overridable on top
   207			 * of existing overridable in this cgroup.
   208			 * Disallow attaching multi-prog if overridable or none
   209			 */
   210			return -EPERM;
   211	
   212		if (prog_list_length(progs) >= BPF_CGROUP_MAX_PROGS)
   213			return -E2BIG;
   214	
   215		if (flags & BPF_F_ALLOW_MULTI) {
   216			list_for_each_entry(pl, progs, node)
   217				if (pl->prog == prog)
   218					/* disallow attaching the same prog twice */
   219					return -EINVAL;
   220	
   221			pl = kmalloc(sizeof(*pl), GFP_KERNEL);
   222			if (!pl)
   223				return -ENOMEM;
   224			pl_was_allocated = true;
   225			pl->prog = prog;
   226			list_add_tail(&pl->node, progs);
   227		} else {
   228			if (list_empty(progs)) {
   229				pl = kmalloc(sizeof(*pl), GFP_KERNEL);
   230				if (!pl)
   231					return -ENOMEM;
   232				pl_was_allocated = true;
   233				list_add_tail(&pl->node, progs);
   234			} else {
   235				pl = list_first_entry(progs, typeof(*pl), node);
   236				old_prog = pl->prog;
   237				pl_was_allocated = false;
   238			}
   239			pl->prog = prog;
   240		}
   241	
   242		old_flags = cgrp->bpf.flags[type];
   243		cgrp->bpf.flags[type] = flags;
   244	
   245		/* allocate and recompute effective prog arrays */
   246		css_for_each_descendant_pre(css, &cgrp->self) {
   247			struct cgroup *desc = container_of(css, struct cgroup, self);
   248	
   249			err = compute_effective_progs(desc, type, &desc->bpf.inactive);
   250			if (err)
   251				goto cleanup;
   252		}
   253	
   254		/* all allocations were successful. Activate all prog arrays */
   255		css_for_each_descendant_pre(css, &cgrp->self) {
   256			struct cgroup *desc = container_of(css, struct cgroup, self);
   257	
   258			activate_effective_progs(desc, type, desc->bpf.inactive);
   259			desc->bpf.inactive = NULL;
   260		}
   261	
   262		static_branch_inc(&cgroup_bpf_enabled_key);
   263		if (old_prog) {
   264			bpf_prog_put(old_prog);
   265			static_branch_dec(&cgroup_bpf_enabled_key);
   266		}
   267		return 0;
   268	
   269	cleanup:
   270		/* oom while computing effective. Free all computed effective arrays
   271		 * since they were not activated
   272		 */
   273		css_for_each_descendant_pre(css, &cgrp->self) {
   274			struct cgroup *desc = container_of(css, struct cgroup, self);
   275	
   276			bpf_prog_array_free(desc->bpf.inactive);
   277			desc->bpf.inactive = NULL;
   278		}
   279	
   280		/* and cleanup the prog list */
   281		pl->prog = old_prog;
   282		if (pl_was_allocated) {
   283			list_del(&pl->node);
   284			kfree(pl);
   285		}
   286		return err;
   287	}
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
