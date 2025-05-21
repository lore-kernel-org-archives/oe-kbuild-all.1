Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642501C860B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 04:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747802902; cv=none; b=bssbtxiibp5A5B3XfjR+P4xv1GTEfk8EhyBjCBR4ixnMNseprWpO7fg0XbDZUKDsnu5qCcBbjataCHa2etAk68NlM11RemQUpjDUu/ficxoBRs+1OPRM/b9NGy4c22D42aO0TJVm1xS0b4uQ+b/omA9QhNPt799FG06PjDCfqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747802902; c=relaxed/simple;
	bh=RmtsQkTrnNZ0z3O1XmUC+iGKRgqEwrJXbou5UUT/WAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0/pdr71om9re+92NQ/sLclXf/fawWFQFYJ0lihZkHk1i9zw9nixA7UllHmfTBtw1BPUTNuFwzEyZ3lawT42vEbNkMV3Vd3SaKj/Q+mUM22eT+/xQYNQZpqahrq/mxJs6/9gnYicC8IPQNw+3OT0tAjSqVTq6c4iA2YO4dp4H3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnVIZfFC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnVIZfFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747802901; x=1779338901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RmtsQkTrnNZ0z3O1XmUC+iGKRgqEwrJXbou5UUT/WAE=;
  b=SnVIZfFCEuOs7DqGzKTbY9C+F3jkdQDw+FurZc3Os4vt8EtRfsZT5pGv
   e0oYZRvY9fBrA8Lbf9XX4eyMqP6SE8+K++8A7VrUjl3JWZrnTCLTffZ7Q
   XKgsWQ+j7d1UjQUIs/25ozRhsIz6bY15Aeh//S/34Cr8rvpleldu7m6hd
   sChiOM1RYRKKfmsb8fEsUuK4HWnl1ZK7NfOhjzgBcWQzNsh/K/sPAVn2h
   XQpRJ67a+W1JifLiFy9LRdCCAqMbQMxngQZ5erQBTukg4E/xjPK+x8ejs
   qxOgksmAw8UX0vNgL0wITYlvA+6mq05Hfm3/x8QQ5Ir2rzboMpeksu5SI
   g==;
X-CSE-ConnectionGUID: emIxAnAPTYqK4Yb9bdYbTQ==
X-CSE-MsgGUID: Vfog5piPQj+R8ozB8BH1cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49022985"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49022985"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 21:48:17 -0700
X-CSE-ConnectionGUID: 9Hs3+xD7QxGG1NKk180bIw==
X-CSE-MsgGUID: sR9XSFb0S3a8UuAnsSYINA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144639210"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2025 21:48:16 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHbNF-000Ns5-0a;
	Wed, 21 May 2025 04:48:13 +0000
Date: Wed, 21 May 2025 12:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 35/35]
 arch/x86/kernel/cpu/resctrl/rdtgroup.c:48:6: warning: no previous prototype
 for function 'resctrl_arch_mon_event_config_read'
Message-ID: <202505211225.MrV0Ixsp-lkp@intel.com>
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
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250521/202505211225.MrV0Ixsp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211225.MrV0Ixsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211225.MrV0Ixsp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:48:6: warning: no previous prototype for function 'resctrl_arch_mon_event_config_read' [-Wmissing-prototypes]
      48 | void resctrl_arch_mon_event_config_read(void *info)
         |      ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:48:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      48 | void resctrl_arch_mon_event_config_read(void *info)
         | ^
         | static 
>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:65:6: warning: no previous prototype for function 'resctrl_arch_mon_event_config_write' [-Wmissing-prototypes]
      65 | void resctrl_arch_mon_event_config_write(void *info)
         |      ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      65 | void resctrl_arch_mon_event_config_write(void *info)
         | ^
         | static 
   2 warnings generated.


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
