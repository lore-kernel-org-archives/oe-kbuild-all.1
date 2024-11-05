Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609818132A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 07:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730791158; cv=none; b=IgQ+Ib9Kx/mMru2gWtpAHkHmKboZH+aCbD6HiHTuC4KVzr1vZa1bTNmGdnwqYsqn5nt3vNKp0eGNMK+IIW+eXC62j6otMBYMzcfVL3gORplWzqqYu+XwpbTZ+aKLRHXbqywIW0VOeYvkU33ga2H/ASjqU5t0vhljGiF3H35Y9EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730791158; c=relaxed/simple;
	bh=IcAUKIuqL9SSi3pJmXwduoSV4lFRD8TruqMQbg9OoXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oK+mEX5V3vnBtgJUFyQcU/eMnftiO3Bs7H1LgWJV85Rcenmq0m9nZZt0URwzyi7Qi8ndQuXH8qO5vBolA5yeYJU/XLm9cOn76P1bVff/IWy5ZOIh+QzJksnXNLxWiPLHkJUq2c29v4NVDnAUCoMSLyL1xCbdlMVC1kv5izyZKJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHl/3yyz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHl/3yyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730791155; x=1762327155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IcAUKIuqL9SSi3pJmXwduoSV4lFRD8TruqMQbg9OoXg=;
  b=cHl/3yyz5TdnzHySpL4b4/DDD/UZbfTDou3MFwK66v+lnB6wAgtVnoIK
   2sBsaK1IgHtHqYMOlK2oX7KvMufUXFgoKG2exEhv4LLQABzqzGjscgO8l
   r5MvlYDXlUvZECHgBb3dg1aQMLbUbnulegj6VUzOWHc2uT2OwbSfRMs7o
   nyWWpjkXjiBE6DfPdFo0vDrqsnRWZBS2wf5FplVJEUEFHmPESLV9Zqt8t
   w/hPfUO1+UMW4IGXxMQajZrUQZidM1WSolDAlQ7yuyZdKM+/MHAxObkFq
   KnUDxgA3dz7/W1oFIZtTfvy/q4bEvko7gZmUSdRMxfncsrYHHTjrktFEu
   Q==;
X-CSE-ConnectionGUID: 7/L4mR13T0CeHzLYM8zsqA==
X-CSE-MsgGUID: xRtpqJIXQYiTNAK0N8bgIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34209900"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34209900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 23:19:12 -0800
X-CSE-ConnectionGUID: JQsNQLtdRUyIAradtmgrAA==
X-CSE-MsgGUID: c/izSS4xT6WOUBxKIvYzZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83799406"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2024 23:19:11 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8DqG-000lkn-2E;
	Tue, 05 Nov 2024 07:19:08 +0000
Date: Tue, 5 Nov 2024 15:18:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 arch/arm64/kernel/mpam/mpam_ctrlmon.c:403: warning: Function parameter or
 member 'type' not described in 'show_doms'
Message-ID: <202411051527.GvGiUwZk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d426553bb97ebfcb4ea34e8fd63477a44316644
commit: 58e843d94efe3f7085dfaac06cb1d011ecb898b1 [1231/1231] arm64/mpam: resctrl: Support priority and hardlimit(Memory bandwidth) configuration
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241105/202411051527.GvGiUwZk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051527.GvGiUwZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051527.GvGiUwZk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/mpam/mpam_ctrlmon.c: In function 'add_schema':
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:53:37: warning: variable 'sc_hdl' set but not used [-Wunused-but-set-variable]
      53 |         struct resctrl_schema_ctrl *sc_hdl = NULL;
         |                                     ^~~~~~
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:52:37: warning: variable 'sc_pri' set but not used [-Wunused-but-set-variable]
      52 |         struct resctrl_schema_ctrl *sc_pri = NULL;
         |                                     ^~~~~~
   arch/arm64/kernel/mpam/mpam_ctrlmon.c: In function 'resctrl_mkdir_mondata_all_subdir':
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:676:54: warning: variable 'rr' set but not used [-Wunused-but-set-variable]
     676 |                         struct raw_resctrl_resource *rr;
         |                                                      ^~
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:403: warning: Function parameter or member 's' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:403: warning: Function parameter or member 'r' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:403: warning: Function parameter or member 'schema_name' not described in 'show_doms'
>> arch/arm64/kernel/mpam/mpam_ctrlmon.c:403: warning: Function parameter or member 'type' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:403: warning: Function parameter or member 'closid' not described in 'show_doms'


vim +403 arch/arm64/kernel/mpam/mpam_ctrlmon.c

1abcabe9dab59ec arch/arm64/kernel/mpam_ctrlmon.c      Yang Yingliang 2019-01-30  389  
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  390  /**
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  391   * MPAM resources such as L2 may have too many domains for arm64,
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  392   * at this time we should rearrange this display for brevity and
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  393   * harmonious interaction.
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  394   *
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  395   * Before rearrangement: L2:0=ff;1=ff;2=fc;3=ff;4=f;....;255=ff
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  396   * After rearrangement:  L2:S;2=fc;S;4=f;S
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  397   * Those continuous fully sharable domains will be combined into
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  398   * a single "S" simply.
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  399   */
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  400  static void show_doms(struct seq_file *s, struct resctrl_resource *r,
58e843d94efe3f7 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  401  		char *schema_name, enum resctrl_ctrl_type type,
58e843d94efe3f7 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  402  		struct sd_closid *closid)
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29 @403  {
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  404  	struct raw_resctrl_resource *rr = r->res;
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  405  	struct rdt_domain *dom;
857e8d34273e190 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  406  	struct msr_param para;
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  407  	bool sep = false;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  408  	bool rg = false;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  409  	bool prev_auto_fill = false;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  410  	u32 reg_val;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  411  
857e8d34273e190 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  412  	para.closid = closid;
58e843d94efe3f7 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  413  	para.type = type;
857e8d34273e190 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  414  
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  415  	if (r->dom_num > RESCTRL_SHOW_DOM_MAX_NUM)
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  416  		rg = true;
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  417  
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  418  	seq_printf(s, "%*s:", max_name_width, schema_name);
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  419  	list_for_each_entry(dom, &r->domains, list) {
857e8d34273e190 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  420  		reg_val = rr->msr_read(dom, &para);
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  421  
58e843d94efe3f7 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  422  		if (rg && reg_val == r->default_ctrl[SCHEMA_COMM] &&
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  423  				prev_auto_fill == true)
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  424  			continue;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  425  
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  426  		if (sep)
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  427  			seq_puts(s, ";");
58e843d94efe3f7 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  428  		if (rg && reg_val == r->default_ctrl[SCHEMA_COMM]) {
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  429  			prev_auto_fill = true;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  430  			seq_puts(s, "S");
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  431  		} else {
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  432  			seq_printf(s, rr->format_str, dom->id,
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  433  				max_data_width, reg_val);
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  434  		}
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  435  		sep = true;
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  436  	}
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  437  	seq_puts(s, "\n");
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  438  }
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  439  

:::::: The code at line 403 was first introduced by commit
:::::: be2167d2a188dc20648fa10c2c5ccd56ba579533 arm64/mpam: support resctrl_group_schemata_show

:::::: TO: Xie XiuQi <xiexiuqi@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
