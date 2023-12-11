Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363FF15AD8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFvE9seB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702291443; x=1733827443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9MFq2ZMcszGu1o4i/kWhLH/IJnppYo+paohRecwsoY=;
  b=CFvE9seBBZsAAHmxqqsZbjnExW31lVqmty71y4NFg/xpO3Umt2m7Sc6E
   pOqgCdtLofdSW7W8e1k6bzLb61443MXuCLAShThmPcxAmroJSlC09N7Jv
   n06CUK2AiP1uvR2AERACCx3QJoak+M8QREwJKLIgqhBOfDpEl1XmXbxa9
   rRB3XeDbQR/exuO3p2fKTWMpber72+y9er/v37OgOcMy9F2A61kAWVmRh
   Z0lsmnWBBgXTrD7+uDaD9gd+bl4fF/7KsSUWjCjwsPRTxk/MFQyL/PYB0
   Da87Ti7JrTWvM7zTUindimLW5NEEsPEnJJ+khHJPos+2mKIW8CUgvOoGA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1697504"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1697504"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 02:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="749241184"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="749241184"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Dec 2023 02:44:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCdlW-000Hxu-2s;
	Mon, 11 Dec 2023 10:43:58 +0000
Date: Mon, 11 Dec 2023 18:43:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 23/25] kernel/sched/debug.c:492:49:
 warning: format '%d' expects argument of type 'int', but argument 4 has type
 'long unsigned int'
Message-ID: <202312111840.OW7rSMRN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   9d0509698cf63e7e91a24a29118040e287d6c0f2
commit: aa4395306ee1f677dfc46b5c08fab8c1414d5375 [23/25] BACKPORT: FROMGIT: sched/fair: Fair server interface
config: i386-randconfig-011-20231211 (https://download.01.org/0day-ci/archive/20231211/202312111840.OW7rSMRN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312111840.OW7rSMRN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312111840.OW7rSMRN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/debug.c: In function 'debugfs_fair_server_init':
>> kernel/sched/debug.c:492:49: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
     492 |                 snprintf(buf, sizeof(buf), "cpu%d", cpu);
         |                                                ~^   ~~~
         |                                                 |   |
         |                                                 int long unsigned int
         |                                                %ld


vim +492 kernel/sched/debug.c

   478	
   479	static void debugfs_fair_server_init(void)
   480	{
   481		struct dentry *d_fair;
   482		unsigned long cpu;
   483	
   484		d_fair = debugfs_create_dir("fair_server", debugfs_sched);
   485		if (!d_fair)
   486			return;
   487	
   488		for_each_possible_cpu(cpu) {
   489			struct dentry *d_cpu;
   490			char buf[32];
   491	
 > 492			snprintf(buf, sizeof(buf), "cpu%d", cpu);
   493			d_cpu = debugfs_create_dir(buf, d_fair);
   494	
   495			debugfs_create_file("runtime", 0644, d_cpu, (void *)cpu,
   496			    &fair_server_runtime_fops);
   497			debugfs_create_file("period", 0644, d_cpu, (void *)cpu,
   498			    &fair_server_period_fops);
   499			debugfs_create_file("defer", 0644, d_cpu, (void *)cpu,
   500			    &fair_server_defer_fops);
   501		}
   502	}
   503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
