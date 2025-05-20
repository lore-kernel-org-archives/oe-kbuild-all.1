Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6799122B5A6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747746244; cv=none; b=NNjR3ox6G1MfckQElqPexWAG7on7y7hQb9JUBgcTzXFQorIonWe5ncJblbF2jBBTXWKZ4kDUH/tLYLFBCeqdPJSPy1r5v2LhsXqAqEhpC/so04+TgA7dHlp2vce5ydFd00BLDnmz3ExDzIOqRiV2DWyv6jsxpHUfhUtgzwguXLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747746244; c=relaxed/simple;
	bh=18OJVgMUDK/ds2/DMIG13wZ8+gLaInIFCpD6SbaidbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gsChp1XVsuy1FHewazKOlN6GbCcLnMZDSk/9jLtA4uDZvyAjwOJuO8hSlh0Lb5QG5TzJapxyXoY//Ck9sFkLzic8+KeMhX+fpidl8kzS1R86av4ziHO3QBuImvKge+1mA0+qaEKl1CDdcllyHabyqfRSJV8e6tzEVenXWjRcryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvhHhfqK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvhHhfqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747746242; x=1779282242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=18OJVgMUDK/ds2/DMIG13wZ8+gLaInIFCpD6SbaidbI=;
  b=BvhHhfqKdP/5FWiMPLDPj6pEYvRWEC8LWW3YAvyVzbj/MKGZjLx95nAE
   L8Sm9buL0PB2oL3208tpRizVqkVnQAdjT0TvGTABeG6kYopSaEg7wqhEJ
   rsXK/fxUrkr1GwsMyD0URNVG+q8nCwRO7jV9UxXTp8S9V/GGyoUytnkaP
   +ocM2GnHsacKUQcWFhb9zXFqUTpUeW9RGACl7K+AGTaCPqz8C9/UBeiIz
   XrpqEwfQHLyKctCrEMLGP7aynntHhCJcfJCmZVEbFE+/c/TdoX8W6bhZm
   GwpJmtikzeMpQ96ipcq1eFSKH2beqOKelokreHbs1dRE/QIGNqvntu2f0
   A==;
X-CSE-ConnectionGUID: y9ALZxxjRkCSJ2pN32M7OA==
X-CSE-MsgGUID: T1tf9EJHRn6EksimL2QXkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48932701"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48932701"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 06:03:38 -0700
X-CSE-ConnectionGUID: dnLmUXyURBGqSvye+GCn/Q==
X-CSE-MsgGUID: gdsK8cwNTYqR92fjcuXcnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140607892"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 May 2025 06:03:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHMd4-000Mb6-2U;
	Tue, 20 May 2025 13:03:34 +0000
Date: Tue, 20 May 2025 21:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] drivers/base/cpu.c:209:16:
 warning: stack frame size (2328) exceeds limit (2048) in 'show_cpus_attr'
Message-ID: <202505202010.5cbwb172-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   6bec8a39b9738b7a22c1f607634a05ba0986225a
commit: cd1308cd06a17efa58ea0136db5935ca1c8bcda5 [11/11] anolis: sysfs/cpu: Add online cpus support for bpf rich container
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250520/202505202010.5cbwb172-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505202010.5cbwb172-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505202010.5cbwb172-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/cpu.c:209:16: warning: stack frame size (2328) exceeds limit (2048) in 'show_cpus_attr' [-Wframe-larger-than]
     209 | static ssize_t show_cpus_attr(struct device *dev,
         |                ^
   1 warning generated.


vim +/show_cpus_attr +209 drivers/base/cpu.c

265d2e2e31c5f6 Andi Kleen  2010-01-05  208  
8a25a2fd126c62 Kay Sievers 2011-12-21 @209  static ssize_t show_cpus_attr(struct device *dev,
8a25a2fd126c62 Kay Sievers 2011-12-21  210  			      struct device_attribute *attr,
265d2e2e31c5f6 Andi Kleen  2010-01-05  211  			      char *buf)
9d1fe3236a1d64 Mike Travis 2008-04-08  212  {
265d2e2e31c5f6 Andi Kleen  2010-01-05  213  	struct cpu_attr *ca = container_of(attr, struct cpu_attr, attr);
8f51f2f82f2edb Xunlei Pang 2020-11-23  214  	struct cpumask cpuset_allowed;
e5b00b47d48f2f Xunlei Pang 2021-06-15  215  	struct task_struct __maybe_unused *scenario;
8f51f2f82f2edb Xunlei Pang 2020-11-23  216  	bool rich_container;
cd1308cd06a17e Yi Tao      2023-08-21  217  	struct bpf_rich_container_info info = {0};
8f51f2f82f2edb Xunlei Pang 2020-11-23  218  
8f51f2f82f2edb Xunlei Pang 2020-11-23  219  	rcu_read_lock();
8f51f2f82f2edb Xunlei Pang 2020-11-23  220  	rich_container = in_rich_container(current);
8f51f2f82f2edb Xunlei Pang 2020-11-23  221  	rcu_read_unlock();
8f51f2f82f2edb Xunlei Pang 2020-11-23  222  
e5b00b47d48f2f Xunlei Pang 2021-06-15  223  	if (rich_container && !strcmp(attr->attr.name, "online")) {
e5b00b47d48f2f Xunlei Pang 2021-06-15  224  #ifdef CONFIG_RICH_CONTAINER_CG_SWITCH
aa278c4ae55977 Xunlei Pang 2021-06-15  225  		rich_container_get_cpuset_cpus(&cpuset_allowed);
e5b00b47d48f2f Xunlei Pang 2021-06-15  226  #else
e5b00b47d48f2f Xunlei Pang 2021-06-15  227  		read_lock(&tasklist_lock);
e5b00b47d48f2f Xunlei Pang 2021-06-15  228  		scenario = rich_container_get_scenario();
e5b00b47d48f2f Xunlei Pang 2021-06-15  229  		get_task_struct(scenario);
e5b00b47d48f2f Xunlei Pang 2021-06-15  230  		read_unlock(&tasklist_lock);
e5b00b47d48f2f Xunlei Pang 2021-06-15  231  
e5b00b47d48f2f Xunlei Pang 2021-06-15  232  		rich_container_get_cpus(scenario, &cpuset_allowed);
e5b00b47d48f2f Xunlei Pang 2021-06-15  233  
e5b00b47d48f2f Xunlei Pang 2021-06-15  234  		put_task_struct(scenario);
e5b00b47d48f2f Xunlei Pang 2021-06-15  235  #endif
e5b00b47d48f2f Xunlei Pang 2021-06-15  236  	}
8f51f2f82f2edb Xunlei Pang 2020-11-23  237  	else
8f51f2f82f2edb Xunlei Pang 2020-11-23  238  		cpumask_copy(&cpuset_allowed, ca->map);
8f51f2f82f2edb Xunlei Pang 2020-11-23  239  	
cd1308cd06a17e Yi Tao      2023-08-21  240  	if (!BPF_CGROUP_RUN_PROG_RICH_CONTAINER_CPU(&info, 1))
cd1308cd06a17e Yi Tao      2023-08-21  241  		cpumask_copy(&cpuset_allowed, &info.cpus_mask);
cd1308cd06a17e Yi Tao      2023-08-21  242  
8f51f2f82f2edb Xunlei Pang 2020-11-23  243  	return cpumap_print_to_pagebuf(true, buf, &cpuset_allowed);
9d1fe3236a1d64 Mike Travis 2008-04-08  244  }
9d1fe3236a1d64 Mike Travis 2008-04-08  245  

:::::: The code at line 209 was first introduced by commit
:::::: 8a25a2fd126c621f44f3aeaef80d51f00fc11639 cpu: convert 'cpu' and 'machinecheck' sysdev_class to a regular subsystem

:::::: TO: Kay Sievers <kay.sievers@vrfy.org>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
