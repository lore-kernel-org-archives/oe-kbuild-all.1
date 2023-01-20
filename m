Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF4CBD1B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 04:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674188982; x=1705724982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUVIUXkUr5Qxni+j9WRFZ5W4vd0epV9viFZpouHaGII=;
  b=HMzj1qqsQjaeFrm0NCYSHtHPkzrAAUXcoZVQ6cgvhg+8GdCXLFy2tBHr
   +ZbDS5Rq1MTBO2A9Pny7bOKPl1PxQxwuDL3P4dZP+JTWMtyRKwEZ+2mvR
   JpZxAFTvOBj98hkZwcX5avosrGCavpOm3iHcvYCauSIwDtcPWtrQNPLYJ
   2jI5eTXnzBtVSv6t+EMS8gVQf1hVgyMh1Z4ueFbuU0329UOWktNWsI3Hm
   /X1CR1c1yDzNn/XGEX9WGf7ULSBPL3g57osU+oGlXJMq8BSNmzZDIBvlm
   CpXuDwqsSLrAHgrvq4c31+rn0XArygaVr03lLNLBmuQ+yGqMlWlUeI01j
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="411733082"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="411733082"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 20:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690916951"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="690916951"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 20:29:40 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIj23-0002BP-19;
	Fri, 20 Jan 2023 04:29:39 +0000
Date: Fri, 20 Jan 2023 12:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: [madvenka786:orc_v3 20/21] kernel/trace/ftrace.c:2766:13: error:
 redefinition of 'ftrace_instruction_pointer_set'
Message-ID: <202301201219.oeLICxlV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/madvenka786/linux orc_v3
head:   a0c212ed0823caa5a7ec431d3a5ec07b46964384
commit: 1fabd84ba1fcc2dffd5d1c9cdb4844f780947738 [20/21] arm64: Miscellaneous changes required for enabling livepatch
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230120/202301201219.oeLICxlV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/madvenka786/linux/commit/1fabd84ba1fcc2dffd5d1c9cdb4844f780947738
        git remote add madvenka786 https://github.com/madvenka786/linux
        git fetch --no-tags madvenka786 orc_v3
        git checkout 1fabd84ba1fcc2dffd5d1c9cdb4844f780947738
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/trace/ftrace.c:299:5: warning: no previous prototype for '__register_ftrace_function' [-Wmissing-prototypes]
     299 | int __register_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:342:5: warning: no previous prototype for '__unregister_ftrace_function' [-Wmissing-prototypes]
     342 | int __unregister_ftrace_function(struct ftrace_ops *ops)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/ftrace.c:2766:13: error: redefinition of 'ftrace_instruction_pointer_set'
    2766 | void __weak ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ftrace.h:23,
                    from kernel/trace/ftrace.c:29:
   arch/powerpc/include/asm/ftrace.h:40:29: note: previous definition of 'ftrace_instruction_pointer_set' with type 'void(struct ftrace_regs *, long unsigned int)'
      40 | static __always_inline void ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/ftrace.c:4004:15: warning: no previous prototype for 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
    4004 | char * __weak arch_ftrace_match_adjust(char *str, const char *search)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/ftrace_instruction_pointer_set +2766 kernel/trace/ftrace.c

  2765	
> 2766	void __weak ftrace_instruction_pointer_set(struct ftrace_regs *fregs,
  2767						   unsigned long pc)
  2768	{
  2769	}
  2770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
