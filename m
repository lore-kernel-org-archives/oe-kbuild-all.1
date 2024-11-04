Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A931EAD8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730705577; cv=none; b=ev3XcAJt9o3K8ZS6biZWqx7JlBu0pYcsT5dHDRK4drF2LwsLK61qAMUMCJ1EACVu+OUM0Wq6nERrDAbDav/DrrlgWwdu7mdgnuixSWj2DZtZdnNGRXlPeaDITl+5WPAQR4PghO+YAc64wg2f19UGjwiJ+0ba6zGiaeg1BsjTvgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730705577; c=relaxed/simple;
	bh=dkEH8l54zk66jaMfX5u9O/Wi6t6jSOicf1p6tKjHOHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMdC7V6a3Q0qM1bUc4kYtsdvh2j8cu8IruuJCnYkLJfpk0/ASgPZqVekQlWeA4EGIE/tGIARFoylDLCg2E5IjpnIFks1UdNfitXexxYLyLtse5g3DH1BOszqGX2DlpbXuFNeJPltDR9rOqraED202SmVz0drb7xpUE1cB+Th4/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEXF8jfx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEXF8jfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730705575; x=1762241575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dkEH8l54zk66jaMfX5u9O/Wi6t6jSOicf1p6tKjHOHk=;
  b=FEXF8jfxOTQE/Ot9PAG0t71WkBgZ0jK8dFDJ3iRb0a/Muobm5+TyYy0b
   UvBTwN45f5dE7Z+qleSVrnfD3rFz6UFB7lndGnW9Wev2OKLl/sopEb43F
   l88g3y0+DHSp3LNUUnXdI+5XrjmU5KW9F81jfeRfqE0fFUP3Svgz4Nh9I
   LsWjY1GCC0tchb6Pby9BQPnzHFBlk+1D2AwHpPndEOglemCbYIUjQ1oBt
   HJuwzycnH9Ut9TyFs1uI0E4M3FwS3HTzvLNhkOMBKZHlpKyyb6EjAUnjr
   q3ya64EQN6GYcRJlpQVnI6C4ee+H75Fm8lAfdubg9+i+uq9THxpP9xBLp
   g==;
X-CSE-ConnectionGUID: Mh3Of5XbTaSHv2A+isDUfQ==
X-CSE-MsgGUID: yWSQpom3RFuChbR/iUimsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="40970645"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="40970645"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 23:32:55 -0800
X-CSE-ConnectionGUID: 9T4308wbR0GS8QTGeIXdJA==
X-CSE-MsgGUID: cq6j3j8hRGeiHrE9gMoGBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83245794"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Nov 2024 23:32:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7rZy-000kbX-2Z;
	Mon, 04 Nov 2024 07:32:50 +0000
Date: Mon, 4 Nov 2024 15:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 arch/arm64/kernel/mpam/mpam_ctrlmon.c:300: warning: Function parameter or
 member 's' not described in 'show_doms'
Message-ID: <202411041549.sgcRhuo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d9cf86e2fe8e5c014fd3e46c31f3415549ab813f
commit: 7243df9bf3ab4130b2c8f5dfa9a620afc964cc72 [1231/1231] arm64/mpam: resctrl: Write and read schemata by schema_list
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241104/202411041549.sgcRhuo9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041549.sgcRhuo9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041549.sgcRhuo9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/mpam/mpam_ctrlmon.c:300: warning: Function parameter or member 's' not described in 'show_doms'
>> arch/arm64/kernel/mpam/mpam_ctrlmon.c:300: warning: Function parameter or member 'r' not described in 'show_doms'
>> arch/arm64/kernel/mpam/mpam_ctrlmon.c:300: warning: Function parameter or member 'schema_name' not described in 'show_doms'
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:300: warning: Function parameter or member 'partid' not described in 'show_doms'


vim +300 arch/arm64/kernel/mpam/mpam_ctrlmon.c

1abcabe9dab59ec arch/arm64/kernel/mpam_ctrlmon.c      Yang Yingliang 2019-01-30  287  
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  288  /**
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  289   * MPAM resources such as L2 may have too many domains for arm64,
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  290   * at this time we should rearrange this display for brevity and
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  291   * harmonious interaction.
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  292   *
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  293   * Before rearrangement: L2:0=ff;1=ff;2=fc;3=ff;4=f;....;255=ff
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  294   * After rearrangement:  L2:S;2=fc;S;4=f;S
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  295   * Those continuous fully sharable domains will be combined into
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  296   * a single "S" simply.
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  297   */
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  298  static void show_doms(struct seq_file *s, struct resctrl_resource *r,
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  299  		char *schema_name, int partid)
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29 @300  {
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  301  	struct raw_resctrl_resource *rr = r->res;
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  302  	struct rdt_domain *dom;
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  303  	bool sep = false;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  304  	bool rg = false;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  305  	bool prev_auto_fill = false;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  306  	u32 reg_val;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  307  
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  308  	if (r->dom_num > RESCTRL_SHOW_DOM_MAX_NUM)
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  309  		rg = true;
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  310  
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  311  	seq_printf(s, "%*s:", max_name_width, schema_name);
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  312  	list_for_each_entry(dom, &r->domains, list) {
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  313  		reg_val = rr->msr_read(dom, partid);
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  314  
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  315  		if (rg && reg_val == r->default_ctrl &&
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  316  				prev_auto_fill == true)
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  317  			continue;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  318  
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  319  		if (sep)
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  320  			seq_puts(s, ";");
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  321  		if (rg && reg_val == r->default_ctrl) {
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  322  			prev_auto_fill = true;
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  323  			seq_puts(s, "S");
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  324  		} else {
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  325  			seq_printf(s, rr->format_str, dom->id,
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  326  				max_data_width, reg_val);
7243df9bf3ab413 arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  327  		}
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  328  		sep = true;
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  329  	}
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  330  	seq_puts(s, "\n");
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  331  }
be2167d2a188dc2 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  332  

:::::: The code at line 300 was first introduced by commit
:::::: be2167d2a188dc20648fa10c2c5ccd56ba579533 arm64/mpam: support resctrl_group_schemata_show

:::::: TO: Xie XiuQi <xiexiuqi@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
