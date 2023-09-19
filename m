Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8330FA9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 02:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695091829; x=1726627829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FOyp09Kz6OIBRH6epajRXu8iHxBy6I/xJNbxt9bGTOA=;
  b=PSZwnl7Ci/O+I3QsaIAi2VwU3ANS8nc6suaB4UlYPDEjKlXUKnTFpcEG
   OdBbBzMPTGAudXgVEcyWbc65HzrUX0JsmID/fOWnvpwQvEzj0gA6dB1S+
   LA8JQa2p5w7PAI8Qm1fkKbH4/Y5xWZN7Fp9fnlSo4O1fFul+mKMyx3N3B
   qCms/4B05xNsg7MSaiZpR+ZB6517KKr/fxbr9r3ytEWF+WxvwuJ5AN9a7
   JkGiZrrh2lVLMIZRaVJ0P3OBKddQKPIs2bcal/y4pZLv74jsRRAbSY5hr
   r7nGwJIMOulEgSv3xmqdxG064eU+YNER7qyvBLq2wlxmqWZMvJDNIJWcd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364886148"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="364886148"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 19:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919698991"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; 
   d="scan'208";a="919698991"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Sep 2023 19:50:26 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiQoi-0006o1-2N;
	Tue, 19 Sep 2023 02:50:24 +0000
Date: Tue, 19 Sep 2023 10:49:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 78/92] arch/x86/kernel/cpu/debugfs.c:55:
 undefined reference to `domain_names'
Message-ID: <202309191034.gu80bSvK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   91418b13c03f8f6c26f4bfca7a82d9b94c4dccde
commit: 55da763e661747c0ff50586275d11ef4f78db8cd [78/92] x86/topology: Add a mechanism to track topology via APIC IDs
config: i386-randconfig-003-20230919 (https://download.01.org/0day-ci/archive/20230919/202309191034.gu80bSvK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309191034.gu80bSvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309191034.gu80bSvK-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/debugfs.o: in function `dom_debug_show':
>> arch/x86/kernel/cpu/debugfs.c:55: undefined reference to `domain_names'


vim +55 arch/x86/kernel/cpu/debugfs.c

01e49914de3ba6 Thomas Gleixner 2023-08-14  48  
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  49  static int dom_debug_show(struct seq_file *m, void *p)
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  50  {
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  51  	unsigned int dom, nthreads = 1;
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  52  
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  53  	for (dom = 0; dom < TOPO_ROOT_DOMAIN; dom++) {
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  54  		nthreads *= x86_topo_system.dom_size[dom];
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14 @55  		seq_printf(m, "domain: %-10s shift: %u dom_size: %5u max_threads: %5u\n",
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  56  			   domain_names[dom], x86_topo_system.dom_shifts[dom],
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  57  			   x86_topo_system.dom_size[dom], nthreads);
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  58  	}
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  59  	return 0;
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  60  }
5ddd0ec6fca9f6 Thomas Gleixner 2023-08-14  61  

:::::: The code at line 55 was first introduced by commit
:::::: 5ddd0ec6fca9f660b47c33ca3e40d254226bffe5 x86/cpu: Provide cpu_init/parse_topology()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
