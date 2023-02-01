Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA607F4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 04:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675226566; x=1706762566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2oEWnAwwxpq7dQghirPqwSh3faPV6xovScoexcznXo=;
  b=Bb9avbZyOWcPNVHsZqsA/GlDc5/C7N5ITbm7Dne8YeGFtnHEv/u+GhM4
   Pg8x6HzW7Xf2VEOcde6gxYqwgKgyJ7+pUctcOmtwyhnpGfFncsrWl3Gbh
   yvD9gdQl5ognnMBapy6+TAZR6HqR2iln6miEAEjtHAZG1HOJxVenGjyN7
   BpEyiJtO6bY1nD0fR/dRsgu3z30ZHshjL0+D2nrNDwuZKd3ueo8My3yf6
   QmW7AXsrFPNB84hU+E99vbjSlYuNaPO0wXsocyudghODMV0fvtWfpkmTo
   nWqXialJMoyQMssRZXS4lWOVE805deVP00yxvE5jaPAW+WtqqUrErVUVo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="329311619"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="329311619"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 20:42:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="733403231"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="733403231"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2023 20:42:44 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN4xI-00054x-0J;
	Wed, 01 Feb 2023 04:42:44 +0000
Date: Wed, 1 Feb 2023 12:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:arch-cpu-idle-dead-noreturn 1/1]
 arch/mips/kernel/process.c:46:1: warning: 'noreturn' function does return
Message-ID: <202302011250.EUGPx0c7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git arch-cpu-idle-dead-noreturn
head:   4705aa679062b6b63e36f46a6f02854a67bb586f
commit: 4705aa679062b6b63e36f46a6f02854a67bb586f [1/1] cpu: Make arch_cpu_idle_dead() __noreturn
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230201/202302011250.EUGPx0c7-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=4705aa679062b6b63e36f46a6f02854a67bb586f
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe arch-cpu-idle-dead-noreturn
        git checkout 4705aa679062b6b63e36f46a6f02854a67bb586f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/mips/kernel/process.c: In function 'arch_cpu_idle_dead':
>> arch/mips/kernel/process.c:46:1: warning: 'noreturn' function does return
      46 | }
         | ^


vim +/noreturn +46 arch/mips/kernel/process.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  41  
cdbedc61c8d012 Thomas Gleixner 2013-03-21  42  #ifdef CONFIG_HOTPLUG_CPU
cdbedc61c8d012 Thomas Gleixner 2013-03-21  43  void arch_cpu_idle_dead(void)
^1da177e4c3f41 Linus Torvalds  2005-04-16  44  {
cdbedc61c8d012 Thomas Gleixner 2013-03-21  45  	play_dead();
cdbedc61c8d012 Thomas Gleixner 2013-03-21 @46  }
cdbedc61c8d012 Thomas Gleixner 2013-03-21  47  #endif
1b2bc75c1bde65 Ralf Baechle    2009-06-23  48  

:::::: The code at line 46 was first introduced by commit
:::::: cdbedc61c8d0122ad682815936f0d11df1fe5f57 mips: Use generic idle loop

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
