Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E85F537FF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730905643; cv=none; b=gV6SWS66fFHZjSA6B1T8eAJX1o+CVaAk07l8Qbz8u5/OJqjnbxJ97IzfIs3GHUFicKeMOGV16u8OCsu0KniSEWxZVIp+ng7H2SXEl3jQB8EqI6kSEG0G4fy998C3vL3YplFm5ua+QzoQUMYWe6ixIxqt3BWJYz05/7kXwcuiiLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730905643; c=relaxed/simple;
	bh=QXdFgJsqRT9yX5LwERhiViDxzKliY05PPAv1Y3g3vHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OvQfX7J/++myF3HSSF6CeeV2wvifD3JXYCM+Qb3xNRPpFc008MSbOfXGwJRsZ5qwHWmHGKutFB7OCoHvq7CL2SdeEhe1ORphT8svMh1JidxS+qO8WXrfCVwHJEkwC5Iecb1oLaaF7lsvj6Upvvu/BUWf3X88LLMt5a8byXOp3u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/J3z73m; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/J3z73m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730905641; x=1762441641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QXdFgJsqRT9yX5LwERhiViDxzKliY05PPAv1Y3g3vHk=;
  b=l/J3z73mU5lHEa6kxaELgpC5R0Nf7spWDlLs+k/VGxkEMouQRS0aqnNQ
   2tiCvaeqyL2uwLtk5I7Dyxu9XW+kGMEq+AGBRfrqi17DVv+BJJTSzEoa9
   5MCtt7Xa4ImR13mXwhhfVv9E0pfwax2QBrpPqTZMEZXhP76ByQZk55Vbm
   OB5dKsDfxu7KcwK1JDnGUIqKkQ0H7KFfzG01oYoQhCT9yV4HswvjUJx8x
   FhEXXQ0pt3YZwRSj0iGdCsj0M1VJOEd89QA9/iCNCGM/7JS9L6vPyJqQd
   hlWs05L6Ell+KyLmOn0wuaRg8kDlXp84mfIlGmt6MbG7V5ogLGSGCT1Bv
   Q==;
X-CSE-ConnectionGUID: NflnJ60ES6+RN0sCI/vZYQ==
X-CSE-MsgGUID: Tkv6Qtk1QXqIBtLFlJsn+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41805825"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41805825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 07:07:19 -0800
X-CSE-ConnectionGUID: +w9TnZMtTbOKGAVBm2V/9Q==
X-CSE-MsgGUID: s79L72VLRHGODxoMqe60QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89119150"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2024 07:07:18 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8hcq-000p2U-0l;
	Wed, 06 Nov 2024 15:07:16 +0000
Date: Wed, 6 Nov 2024 23:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 arch/arm64/kernel/mpam/mpam_ctrlmon.c:560:5: warning: no previous prototype
 for 'resctrl_group_mondata_show'
Message-ID: <202411062351.mcuwA9ll-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: 6892e52d6ed229b7973aae9e1e98819867c34dd7 [1231/1231] arm64/mpam: Split header files into suitable location
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241106/202411062351.mcuwA9ll-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411062351.mcuwA9ll-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411062351.mcuwA9ll-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/mpam/mpam_ctrlmon.c: In function 'add_schema':
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:54:37: warning: variable 'sc_hdl' set but not used [-Wunused-but-set-variable]
      54 |         struct resctrl_schema_ctrl *sc_hdl = NULL;
         |                                     ^~~~~~
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:53:37: warning: variable 'sc_pri' set but not used [-Wunused-but-set-variable]
      53 |         struct resctrl_schema_ctrl *sc_pri = NULL;
         |                                     ^~~~~~
   arch/arm64/kernel/mpam/mpam_ctrlmon.c: At top level:
>> arch/arm64/kernel/mpam/mpam_ctrlmon.c:560:5: warning: no previous prototype for 'resctrl_group_mondata_show' [-Wmissing-prototypes]
     560 | int resctrl_group_mondata_show(struct seq_file *m, void *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_ctrlmon.c: In function 'resctrl_mkdir_mondata_all_subdir':
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:745:54: warning: variable 'rr' set but not used [-Wunused-but-set-variable]
     745 |                         struct raw_resctrl_resource *rr;
         |                                                      ^~
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:430: warning: Function parameter or member 's' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:430: warning: Function parameter or member 'r' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:430: warning: Function parameter or member 'schema_name' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:430: warning: Function parameter or member 'type' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:430: warning: Function parameter or member 'closid' not described in 'show_doms'


vim +/resctrl_group_mondata_show +560 arch/arm64/kernel/mpam/mpam_ctrlmon.c

d157854c756daf4 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  559  
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29 @560  int resctrl_group_mondata_show(struct seq_file *m, void *arg)
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  561  {
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  562  	struct kernfs_open_file *of = m->private;
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  563  	struct rdtgroup *rdtgrp;
594105ff55056b6 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  564  	struct rdt_domain *d;
594105ff55056b6 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  565  	struct resctrl_resource *r;
f2a58a19ec564be arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  566  	union mon_data_bits md;
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  567  	int ret = 0;
0f4c524c39b330a arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  568  	char *resname = get_resource_name(kernfs_node_name(of));
594105ff55056b6 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  569  	u64 usage;
75008419705983d arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  570  	int pmg;
0f4c524c39b330a arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  571  
0f4c524c39b330a arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  572  	if (!resname)
0f4c524c39b330a arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  573  		return -ENOMEM;
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  574  
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  575  	rdtgrp = resctrl_group_kn_lock_live(of->kn);
0bf8b142ee73268 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  576  	if (!rdtgrp) {
14405c9eb792d93 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-04-28  577  		ret = -ENOENT;
14405c9eb792d93 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-04-28  578  		goto out;
0bf8b142ee73268 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  579  	}
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  580  
f2a58a19ec564be arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  581  	md.priv = of->kn->priv;
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  582  
344e656b7d90e2c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  583  	r = mpam_resctrl_get_resource(md.u.rid);
594105ff55056b6 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  584  
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  585  	/* show monitor data */
594105ff55056b6 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  586  	d = mpam_find_domain(r, md.u.domid, NULL);
14405c9eb792d93 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-04-28  587  	if (IS_ERR_OR_NULL(d)) {
594105ff55056b6 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  588  		pr_warn("Could't find domain id %d\n", md.u.domid);
14405c9eb792d93 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-04-28  589  		ret = -ENOENT;
14405c9eb792d93 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-04-28  590  		goto out;
594105ff55056b6 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  591  	}
594105ff55056b6 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  592  
d157854c756daf4 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  593  	usage = resctrl_dom_mon_data(r, d, md.priv);
d157854c756daf4 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  594  
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  595  	/*
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  596  	 * if this rdtgroup is ctrlmon group, also collect it's
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  597  	 * mon groups' monitor data.
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  598  	 */
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  599  	if (rdtgrp->type == RDTCTRL_GROUP) {
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  600  		struct list_head *head;
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  601  		struct rdtgroup *entry;
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  602  		hw_closid_t hw_closid;
0f728d63ce7a19f arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  603  		hw_monid_t hw_monid;
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  604  		enum resctrl_conf_type type = CDP_CODE;
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  605  
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  606  		resctrl_cdp_map(clos, rdtgrp->closid.reqpartid,
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  607  			CDP_CODE, hw_closid);
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  608  		/* CDP_CODE share the same closid with CDP_BOTH */
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  609  		if (md.u.partid != hw_closid_val(hw_closid))
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  610  			type = CDP_DATA;
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  611  
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  612  		head = &rdtgrp->mon.crdtgrp_list;
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  613  		list_for_each_entry(entry, head, mon.crdtgrp_list) {
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  614  			resctrl_cdp_map(clos, entry->closid.reqpartid,
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  615  				type, hw_closid);
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  616  			md.u.partid = hw_closid_val(hw_closid);
75008419705983d arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  617  
75008419705983d arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  618  			ret = mpam_rmid_to_partid_pmg(entry->mon.rmid,
75008419705983d arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  619  				NULL, &pmg);
75008419705983d arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  620  			if (ret)
75008419705983d arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  621  				return ret;
75008419705983d arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  622  
75008419705983d arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  623  			md.u.pmg = pmg;
0f728d63ce7a19f arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  624  			resctrl_cdp_map(mon, get_rmid_mon(entry->mon.rmid,
0f728d63ce7a19f arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  625  				r->rid), type, hw_monid);
0f728d63ce7a19f arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  626  			md.u.mon = hw_monid_val(hw_monid);
0f728d63ce7a19f arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  627  
d157854c756daf4 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  628  			usage += resctrl_dom_mon_data(r, d, md.priv);
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  629  		}
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  630  	}
934c2350979693c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo 2021-02-24  631  
594105ff55056b6 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  632  	seq_printf(m, "%llu\n", usage);
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  633  
14405c9eb792d93 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-04-28  634  out:
0f4c524c39b330a arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  635  	put_resource_name(resname);
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  636  	resctrl_group_kn_unlock(of->kn);
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  637  	return ret;
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  638  }
b4617397605d3b8 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi   2019-01-29  639  

:::::: The code at line 560 was first introduced by commit
:::::: b4617397605d3b8842d9e39bb8921223eccc2f92 arm64/mpam: support mondata fields

:::::: TO: Xie XiuQi <xiexiuqi@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
