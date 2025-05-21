Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB2520E711
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 04:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747802901; cv=none; b=HvPvLk18JiJQjBA5fBZxpvG/xZCGxSRdoknjM8vKZ8uC9bKVBJJMszu/mdQeME7XoBChU7xQhgdYZEH1jMiqglDi9muPjv23LLYqRuAg19eglXU51saGb6WM0uiVRuUGZ1/iRaEKy9DLQ9YY8hdZ99d+RhCN532GbHZtykbpWWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747802901; c=relaxed/simple;
	bh=Wdbwljnq+hwAFlj7xsMIY+rzYvm4f5h+HZeF3VJzMoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rlr5FpcNl1au0mQpAbIWVkb97d1fyjsZCGuGZ4lqRjferdNXCyHhwaRefPeLAMwmkme2DZY3kqxsaI+QTzBOoKzsvU0/sDFwYVDlJUiEZ+IO1rdxyk2s7YI+yij/dzxCnBxuwqQBlx9JwJzzkWiYzSNwhAfjMGMBRHZC1trCbm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3Vbmrb0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3Vbmrb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747802900; x=1779338900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wdbwljnq+hwAFlj7xsMIY+rzYvm4f5h+HZeF3VJzMoo=;
  b=e3Vbmrb0I5TiraoNXUCyhYwXMnIxG9xnKQ5e3iprbxr6D4RO0Pv598Rn
   c1o0rKYXkErePMGDoG8anKuRP6uoVPraZN5AG/jUWLJYUQbuB1J4lomXv
   wa6XVXklnbuuCDZCHPfqFkQePacZ/LKmn8N2KKM/jBs0PNITAYrPFfwEw
   tUkNdlw+i6GweAQA3mdi6LFvalZ1uI4fN5sYY7Tq6nOih+4MtMEBO25hM
   wFPvu2DA61FvqV6Kf8sTboOFuCe/0vQVa6wQLIYCazBB5iQv6kfKHfC3j
   N8V6G3hgcQDEb1MCY7kLCa7TqmYDOJ4+bENQfVt8jjtk+R2TO5AOwb6NI
   w==;
X-CSE-ConnectionGUID: BFvk3TbYTw2ZrIu+cwM8+A==
X-CSE-MsgGUID: 8qWn1aMtSHmD4rrGcsLPwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49022984"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49022984"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 21:48:17 -0700
X-CSE-ConnectionGUID: 8A+jro2KRAaEJdhwwmStvw==
X-CSE-MsgGUID: TvpNNGHOT6CSjL2QChKhkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144639211"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2025 21:48:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHbNF-000Ns8-0e;
	Wed, 21 May 2025 04:48:13 +0000
Date: Wed, 21 May 2025 12:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 35/35]
 arch/x86/kernel/cpu/resctrl/rdtgroup.c:48:6: warning: no previous prototype
 for 'resctrl_arch_mon_event_config_read'
Message-ID: <202505211225.TYY4Hqkl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   c30fc59e8f3a43d47f689edb48164b67c6704b07
commit: 55f5270f74d9982d3f09854345877f1db4dda01f [35/35] x86/resctrl: Remove MSR reading of event configuration value
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250521/202505211225.TYY4Hqkl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211225.TYY4Hqkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211225.TYY4Hqkl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:48:6: warning: no previous prototype for 'resctrl_arch_mon_event_config_read' [-Wmissing-prototypes]
      48 | void resctrl_arch_mon_event_config_read(void *info)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:65:6: warning: no previous prototype for 'resctrl_arch_mon_event_config_write' [-Wmissing-prototypes]
      65 | void resctrl_arch_mon_event_config_write(void *info)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/resctrl_arch_mon_event_config_read +48 arch/x86/kernel/cpu/resctrl/rdtgroup.c

565d540ab0161e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2019-03-20  47  
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22 @48  void resctrl_arch_mon_event_config_read(void *info)
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  49  {
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  50  	struct resctrl_mon_config_info *mon_info = info;
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  51  	unsigned int index;
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  52  	u64 msrval;
ac3f4c7f40e60a arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-02-13  53  
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  54  	index = mon_event_config_index_get(mon_info->evtid);
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  55  	if (index == INVALID_CONFIG_INDEX) {
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  56  		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  57  		return;
3ced7bf9de896f arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-02-13  58  	}
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  59  	rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  60  
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  61  	/* Report only the valid event configuration bits */
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  62  	mon_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  63  }
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  64  
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22 @65  void resctrl_arch_mon_event_config_write(void *info)
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  66  {
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  67  	struct resctrl_mon_config_info *mon_info = info;
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  68  	unsigned int index;
ac3f4c7f40e60a arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-02-13  69  
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  70  	index = mon_event_config_index_get(mon_info->evtid);
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  71  	if (index == INVALID_CONFIG_INDEX) {
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  72  		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  73  		mon_info->err = -EINVAL;
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  74  		return;
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  75  	}
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  76  	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  77  
b8939a341b6f68 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  78  	mon_info->err = 0;
0b9aa6562650f4 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Reinette Chatre 2018-06-22  79  }
0b9aa6562650f4 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Reinette Chatre 2018-06-22  80  

:::::: The code at line 48 was first introduced by commit
:::::: b8939a341b6f68f80e299396f889c15e757da605 x86/resctrl: Move the resctrl filesystem code to /fs/resctrl

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Qinyun Tan <qinyuntan@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
