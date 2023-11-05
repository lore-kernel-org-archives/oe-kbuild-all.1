Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA118489
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kx8MXM0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699172621; x=1730708621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fYX9k8RdI8NdsMG5qVT0ioFwZw7eWLFc78heJiQIfwc=;
  b=kx8MXM0MyOfcLFuMDEKM4uFF31v3gcxcI3fbyQbKbT85kUJLZiojzYsS
   y4JU03gWclDkYKIj6dYyuc7Q62PaadDXPCoMk+OqQwiV08dictqixwPRJ
   /jiaL3fF9bpf+F8rE0zEA2bkHVVTybut0/DUYGs2mShl7+biU1cDwdo50
   QOFOc5Y4O0L1NAv3mWwo4hufZwxxxjNZnJhYz6nknZxMssZTF5ukwO3oT
   1VZBtGRAZm3/DjO1+IBa/7Q8SzKMGrb+iwl/Nbj5yqa5NH6utZkaMw4P3
   SqOcJbxi6Hv6EwKWAB4m6EcouIXXxG5fg5iaFORi1yTkbW2j3KbPCUQ5R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="10669201"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="10669201"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 01:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="791183392"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="791183392"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Nov 2023 01:23:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzYPv-0005C0-1u;
	Sun, 05 Nov 2023 08:23:35 +0000
Date: Sun, 5 Nov 2023 16:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: arch/x86/kernel/callthunks.c:332:35: warning: '%lu' directive
 writing between 1 and 10 bytes into a region of size 7
Message-ID: <202311051618.RFyLD3DD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea6bf908d730b01bd264a8821159db9463c111c
commit: f5c1bb2afe93396d41c5cbdcb909b08a75b8dde4 x86/calldepth: Add ret/call counting for debug
date:   1 year, 1 month ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231105/202311051618.RFyLD3DD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051618.RFyLD3DD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051618.RFyLD3DD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/callthunks.c: In function 'callthunks_debugfs_init':
>> arch/x86/kernel/callthunks.c:332:35: warning: '%lu' directive writing between 1 and 10 bytes into a region of size 7 [-Wformat-overflow=]
     332 |                 sprintf(name, "cpu%lu", cpu);
         |                                   ^~~
   arch/x86/kernel/callthunks.c:332:31: note: directive argument in the range [0, 4294967294]
     332 |                 sprintf(name, "cpu%lu", cpu);
         |                               ^~~~~~~~
   arch/x86/kernel/callthunks.c:332:17: note: 'sprintf' output between 5 and 14 bytes into a destination of size 10
     332 |                 sprintf(name, "cpu%lu", cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +332 arch/x86/kernel/callthunks.c

   321	
   322	static int __init callthunks_debugfs_init(void)
   323	{
   324		struct dentry *dir;
   325		unsigned long cpu;
   326	
   327		dir = debugfs_create_dir("callthunks", NULL);
   328		for_each_possible_cpu(cpu) {
   329			void *arg = (void *)cpu;
   330			char name [10];
   331	
 > 332			sprintf(name, "cpu%lu", cpu);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
