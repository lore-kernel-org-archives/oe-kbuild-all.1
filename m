Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E695946A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676668356; x=1708204356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XEZENwyjKKXkABKnyQdmROUA57rikv6qI6msQ/c2sO0=;
  b=jQtdCTk6nGMjRLDiuo/A40yeN6po+9v7UOY8iMQmDYG2enaEg2g1OgEm
   UfPM18/pU3GlYs9xlcBR3vhAvI5vIOXeO41UOOLoPaOQQIrOGzll/UYE9
   S9wphWMx7UJyCycqokNNnEQEKg3OJG/4B1YqD03g85kQuVKSNF8grzeJ+
   y0BshX6oD+z03pRoG0Lm9l/JuIesc2RHtSVc13heMGln1j0NnCkJXnxov
   CoV4S+I0u37sy5cIcWF2wKQP0TxyPU2UTfQV0lPj4kJtT8X/EtAeOGNbD
   VENG3qExOWMU94jeD1mvqBl3f/g5QP6GuR+1FiWM61gXGCSc+zz9rGVeS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="311719398"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="311719398"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 13:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="739382936"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="739382936"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2023 13:12:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT81y-000BpF-0f;
	Fri, 17 Feb 2023 21:12:34 +0000
Date: Sat, 18 Feb 2023 05:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 8/8] hrtimer.c:undefined reference to
 `tick_nohz_switch_to_nohz'
Message-ID: <202302180527.LHDSXjYc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/dyn_hrtimer
head:   621948fff66f3ce64f723a81566228363a29e3b5
commit: 621948fff66f3ce64f723a81566228363a29e3b5 [8/8] hrtimer: Add a sysctl to lower resolution of timers
config: arc-randconfig-r034-20230217 (https://download.01.org/0day-ci/archive/20230218/202302180527.LHDSXjYc-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=621948fff66f3ce64f723a81566228363a29e3b5
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern timers/dyn_hrtimer
        git checkout 621948fff66f3ce64f723a81566228363a29e3b5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180527.LHDSXjYc-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-elf-ld: arc-elf-ld: DWARF error: could not find abbrev number 88
   kernel/time/hrtimer.o: in function `hrtimer_smp_call':
>> hrtimer.c:(.text+0x10d4): undefined reference to `tick_nohz_switch_to_nohz'
>> arc-elf-ld: hrtimer.c:(.text+0x10d4): undefined reference to `tick_nohz_switch_to_nohz'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
