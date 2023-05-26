Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E402523D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685091326; x=1716627326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NoXeR+8LiLzqev1qqUypIpPGdmYYqQf59cCQEmQWVaQ=;
  b=n16Dr1zwrdDG+nikzrjZWCb3294b4SW/AEbXMIyOeqqcgoBD7rEBzR1K
   ufUZR4c4RxvLSZn0snpiLajWmo4rWbjWgXgzA6uLMcGJogn0CuDKJfLKC
   dUhBp0CaFe4Wh8K3gjUSlRd1/M1ABOIBBxJZfEC4O0CAq+aAGExleQO/W
   5QjfoioW98gK+5cSsYbZibNms8rbEyOX+xnVXdNIfGqbIF7SBoJ2hWyVi
   w/cnlI4XlpPDIsKRpEjfnbNXfLwkYhmECuQncEVb/NBb3l0qQq2GQsCt9
   Seux+nQ3552I/4N9Ti0ZQHNuKIxgJ6E/jCpkJhNBYBY5M6kvm1mbmTU+i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="333783533"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="333783533"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 01:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="829441521"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="829441521"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 May 2023 01:55:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2TEJ-000JCT-3B;
	Fri, 26 May 2023 08:55:24 +0000
Date: Fri, 26 May 2023 16:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/monitors_and_locking/v4 15/24]
 arch/x86/kernel/cpu/resctrl/monitor.c:339:26: warning: ordered comparison of
 pointer with integer zero
Message-ID: <202305261607.Q5HfO51W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/monitors_and_locking/v4
head:   7a2faaa86a608f308185f2dc0c503e6c103a9206
commit: 7b6c0f41fa6f30fef835940b8f10b37bddbeaf11 [15/24] x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()
config: x86_64-randconfig-x061-20230525 (https://download.01.org/0day-ci/archive/20230526/202305261607.Q5HfO51W-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=7b6c0f41fa6f30fef835940b8f10b37bddbeaf11
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse mpam/monitors_and_locking/v4
        git checkout 7b6c0f41fa6f30fef835940b8f10b37bddbeaf11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/resctrl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261607.Q5HfO51W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/resctrl/monitor.c: In function '__check_limbo':
>> arch/x86/kernel/cpu/resctrl/monitor.c:339:26: warning: ordered comparison of pointer with integer zero [-Wextra]
     339 |         if (arch_mon_ctx < 0)
         |                          ^
   arch/x86/kernel/cpu/resctrl/monitor.c: In function 'mbm_update':
   arch/x86/kernel/cpu/resctrl/monitor.c:760:37: warning: ordered comparison of pointer with integer zero [-Wextra]
     760 |                 if (rr.arch_mon_ctx < 0)
         |                                     ^
   arch/x86/kernel/cpu/resctrl/monitor.c:771:37: warning: ordered comparison of pointer with integer zero [-Wextra]
     771 |                 if (rr.arch_mon_ctx < 0)
         |                                     ^


vim +339 arch/x86/kernel/cpu/resctrl/monitor.c

   321	
   322	/*
   323	 * Check the RMIDs that are marked as busy for this domain. If the
   324	 * reported LLC occupancy is below the threshold clear the busy bit and
   325	 * decrement the count. If the busy count gets to zero on an RMID, we
   326	 * free the RMID
   327	 */
   328	void __check_limbo(struct rdt_domain *d, bool force_free)
   329	{
   330		struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
   331		u32 idx_limit = resctrl_arch_system_num_rmid_idx();
   332		struct rmid_entry *entry;
   333		u32 idx, cur_idx = 1;
   334		void *arch_mon_ctx;
   335		bool rmid_dirty;
   336		u64 val = 0;
   337	
   338		arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
 > 339		if (arch_mon_ctx < 0)
   340			return;
   341	
   342		/*
   343		 * Skip RMID 0 and start from RMID 1 and check all the RMIDs that
   344		 * are marked as busy for occupancy < threshold. If the occupancy
   345		 * is less than the threshold decrement the busy counter of the
   346		 * RMID and move it to the free list when the counter reaches 0.
   347		 */
   348		for (;;) {
   349			idx = find_next_bit(d->rmid_busy_llc, idx_limit, cur_idx);
   350			if (idx >= idx_limit)
   351				break;
   352	
   353			entry = __rmid_entry(idx);
   354			if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid,
   355						   QOS_L3_OCCUP_EVENT_ID, &val,
   356						   arch_mon_ctx)) {
   357				rmid_dirty = true;
   358			} else {
   359				rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
   360			}
   361	
   362			if (force_free || !rmid_dirty) {
   363				clear_bit(idx, d->rmid_busy_llc);
   364				if (!--entry->busy)
   365					limbo_release_entry(entry);
   366			}
   367			cur_idx = idx + 1;
   368		}
   369	
   370		resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
   371	}
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
