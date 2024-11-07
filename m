Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467721E9083
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975350; cv=none; b=W4H5bnFtPw+KqucGpYps/yqh4AiTB5k0g1K+ADuk9dcX48hRvBg8evpDH1hIipZdpjRe7439ChIQ8UvmO8VKjyOOs8IVL+hWA4eq+giIzNg21FX9J2HDGXHSGdothgcm6t7LrFzw9lzIigYLKo4sTs+DklCp5fbD28/FG5nZ3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975350; c=relaxed/simple;
	bh=5+6qXJUj5AvDfvwa7+19DdGxwfqobs+ZHH3eNDMvkfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUQN5ImV+QVuMLKfmZKDCDCtiwwBjqqtP4vvjfscXHWuxZibC2dU+7MpoQtAqZbJ7XD6a12PPHSPRdd1955miymbEN+nrFqVkucaXmiIdL6eLB+wSMubdQVUkXUXK6UH2oMPcZsPC/1vefJvSc9i/DLuM0gGnv/udamkZo6hfx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbLmnenu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbLmnenu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730975348; x=1762511348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+6qXJUj5AvDfvwa7+19DdGxwfqobs+ZHH3eNDMvkfk=;
  b=kbLmnenu+S4FB3dftQ88Dk6/mfoO7iGMMa0pgRPwUzCwRCc3ZztAJxTb
   koAkbssREj9DOpEOmAjTL2xKJag8ppYf/jdigpWI2H00W6mD2VMWfNXSB
   hdHWJwSvtaMOMasqco8HsHdOfBIbK2gchl+jVXrWJGZB48rgV81FASBbM
   Fzuz+nU3NpbWzoTPmg1EF0HdxZwSA1jcOCdYfzelYMzSkzus66MLGx7GV
   45BzClYkNVWApm9aQou01IdF7vg09hdlPZvperDX9D3XiJd0LdQeLku5A
   YEWnbjE4ZIfmpQSKzK+qKBMSjJyUHc8k4350ve0xpEVA4NXlMt2v08esT
   Q==;
X-CSE-ConnectionGUID: yddTaFDuRnya+aGiSKSUSw==
X-CSE-MsgGUID: dMPLPACVQpeoev+4MxwSLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41427912"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="41427912"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:29:08 -0800
X-CSE-ConnectionGUID: lK4Ikr8cRzu0eHs7h4GrLA==
X-CSE-MsgGUID: VIB0CVPqSQqfmdiDx4IuPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="90142176"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2024 02:29:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8zl9-000q61-2X;
	Thu, 07 Nov 2024 10:29:03 +0000
Date: Thu, 7 Nov 2024 18:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 arch/arm64/kernel/mpam/mpam_ctrlmon.c:201: warning: Function parameter or
 member 'rdtgrp' not described in 'resctrl_group_resync_domain_ctrls'
Message-ID: <202411071854.JMBS7gBz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bafa65a8c91fb9c99706d2d22210690199f95779
commit: 273a0966b93355cd69473db4ab13e2f727623a0e [1231/1231] mpam: update monitor rmid and group configuration
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241107/202411071854.JMBS7gBz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071854.JMBS7gBz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071854.JMBS7gBz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/mpam/mpam_ctrlmon.c:596:5: warning: no previous prototype for 'resctrl_group_mondata_show' [-Wmissing-prototypes]
     596 | int resctrl_group_mondata_show(struct seq_file *m, void *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_ctrlmon.c: In function 'resctrl_mkdir_mondata_all_subdir':
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:786:54: warning: variable 'rr' set but not used [-Wunused-but-set-variable]
     786 |                         struct raw_resctrl_resource *rr;
         |                                                      ^~
>> arch/arm64/kernel/mpam/mpam_ctrlmon.c:201: warning: Function parameter or member 'rdtgrp' not described in 'resctrl_group_resync_domain_ctrls'
>> arch/arm64/kernel/mpam/mpam_ctrlmon.c:201: warning: Function parameter or member 'r' not described in 'resctrl_group_resync_domain_ctrls'
>> arch/arm64/kernel/mpam/mpam_ctrlmon.c:201: warning: Function parameter or member 'dom' not described in 'resctrl_group_resync_domain_ctrls'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:472: warning: Function parameter or member 's' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:472: warning: Function parameter or member 'r' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:472: warning: Function parameter or member 'schema_name' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:472: warning: Function parameter or member 'type' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:472: warning: Function parameter or member 'closid' not described in 'show_doms'


vim +201 arch/arm64/kernel/mpam/mpam_ctrlmon.c

   191	
   192	/**
   193	 * Resync resctrl group domain ctrls, use rdtgrp->resync to indicate
   194	 * whether the resync procedure will be called. When resync==1, all
   195	 * domain ctrls of this group be synchronized again. This happens
   196	 * when rmid of this group is changed, and all configurations need to
   197	 * be remapped again accordingly.
   198	 */
   199	static void resctrl_group_resync_domain_ctrls(struct rdtgroup *rdtgrp,
   200				struct resctrl_resource *r, struct rdt_domain *dom)
 > 201	{
   202		int i;
   203		int staged_start, staged_end;
   204		struct resctrl_staged_config *cfg;
   205		struct sd_closid closid;
   206		struct list_head *head;
   207		struct rdtgroup *entry;
   208		struct msr_param para;
   209		bool cdp_both_ctrl;
   210	
   211		cfg = dom->staged_cfg;
   212		para.closid = &closid;
   213	
   214		staged_start = (r->cdp_enable) ? CDP_CODE : CDP_BOTH;
   215		staged_end = (r->cdp_enable) ? CDP_DATA : CDP_BOTH;
   216	
   217		for (i = staged_start; i <= staged_end; i++) {
   218			cdp_both_ctrl = cfg[i].cdp_both_ctrl;
   219			/*
   220			 * for ctrl group configuration, hw_closid of cfg[i] equals
   221			 * to rdtgrp->closid.intpartid.
   222			 */
   223			closid.intpartid = hw_closid_val(cfg[i].hw_closid);
   224			resctrl_cdp_mpamid_map_val(rdtgrp->closid.reqpartid,
   225					cfg[i].conf_type, closid.reqpartid);
   226			resctrl_dom_ctrl_config(cdp_both_ctrl, r, dom, &para);
   227	
   228			/*
   229			 * we should synchronize all child mon groups'
   230			 * configuration from this ctrl rdtgrp
   231			 */
   232			head = &rdtgrp->mon.crdtgrp_list;
   233			list_for_each_entry(entry, head, mon.crdtgrp_list) {
   234				resctrl_cdp_mpamid_map_val(entry->closid.reqpartid,
   235						cfg[i].conf_type, closid.reqpartid);
   236				resctrl_dom_ctrl_config(cdp_both_ctrl, r, dom, &para);
   237			}
   238		}
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
