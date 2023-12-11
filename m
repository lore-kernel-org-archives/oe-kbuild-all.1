Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485182030A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 07:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3NKJRUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702279686; x=1733815686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rETILmxyRgZeGp8f1LB72/vyCNAfO/TxpdE4p/Nf/Xc=;
  b=e3NKJRUY+8P30XHC2gIbIjUUB+zffniiGrUH7DdgdF+FRdld/S4IPoAP
   Oi0XG7zCsokqjQDThhlXG7V4t1tjCtgPbrkynsZEIopdR7QFBE/PydRyI
   qY00BB0Bu1IcDVsP9vBS0XXJqbZzjjVP7Ya0aS/78XBEhHvbhmeiDpAjQ
   x+sfnWc9Vez4wKyigjMvn1fBRAs8oA4HFubVDISBX0soSoMm/FeLUvjYz
   nhpGILgZySdmDUfH+QJtxceKo7IYmGcEtYGw36FYQEXTCiIKAZx7mUjgq
   2F0NvpbIJf1LiBKR4ZZwEm/w9c5Q4FuAFtO7xjdIPO6XQ5EXdl6reOQKX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="425734099"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="425734099"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 23:28:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="863661164"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="863661164"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Dec 2023 23:28:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCahs-000Hlm-0b;
	Mon, 11 Dec 2023 07:28:00 +0000
Date: Mon, 11 Dec 2023 15:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 23/25] kernel/sched/debug.c:492:39:
 warning: format specifies type 'int' but the argument has type 'unsigned
 long'
Message-ID: <202312111506.z9V41oqr-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20231211 (https://download.01.org/0day-ci/archive/20231211/202312111506.z9V41oqr-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312111506.z9V41oqr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312111506.z9V41oqr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/debug.c:492:39: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                   snprintf(buf, sizeof(buf), "cpu%d", cpu);
                                                  ~~   ^~~
                                                  %lu
   1 warning generated.


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
