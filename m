Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C418D36E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 05:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674278636; x=1705814636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fM52lmAWMMUnfA/8TqKEDRXPTOlBoP4rcrB6m04cJ0M=;
  b=n0yjSFP+B3wt+/uPAKTs+mx2JiMjRE27Uw548Ydnr7olFE1zcvV85H+2
   FVQhExWeny+UDE5OMNOmabbvuylNKmRpK6kXxihOGMTHUXpuLzWrLaNWs
   FWjBsyOJkxJ+CE7V7rUhvI9YOX4wkSg/yyQQhckOkye3blxM8h+OyR+hE
   iwgziu+9/lu3tGSlPf1tUYr2rJnuYnnYcYOlwz8dJzr64rV/TtlXnbzvw
   A3zKxCNvcImycRIzoVCIRCtMGQRrINkehcLyCzJy33rJEzV+nDI7o4ZGX
   8pM8pstjA31Qo8DF7jHstdsWPR1N/CWEA9glOhEYXXza51RBuZUTT233D
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="327031920"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="327031920"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 21:23:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989628890"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="989628890"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 21:23:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ6M6-0003YU-0X;
	Sat, 21 Jan 2023 05:23:54 +0000
Date: Sat, 21 Jan 2023 13:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/cpufeature/cleanup 10/11]
 arch/arm64/kernel/cpufeature.c:2095:17: error: 'compat_elf_hwcap2'
 undeclared; did you mean 'cpu_get_elf_hwcap2'?
Message-ID: <202301211356.TRDk1vLG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/cpufeature/cleanup
head:   117df322bc7f62b2bb5aba573375899b339cf183
commit: 7d26a2c7f8d9bf2af20bcaccc0c9853c935881f3 [10/11] arm64: use cpus_have_cap() for ARM64_WORKAROUND_1742098
config: arm64-buildonly-randconfig-r001-20230119 (https://download.01.org/0day-ci/archive/20230121/202301211356.TRDk1vLG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=7d26a2c7f8d9bf2af20bcaccc0c9853c935881f3
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/cpufeature/cleanup
        git checkout 7d26a2c7f8d9bf2af20bcaccc0c9853c935881f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/ mm//

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arm64/kernel/cpufeature.c: In function 'elf_hwcap_fixup':
>> arch/arm64/kernel/cpufeature.c:2095:17: error: 'compat_elf_hwcap2' undeclared (first use in this function); did you mean 'cpu_get_elf_hwcap2'?
    2095 |                 compat_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
         |                 ^~~~~~~~~~~~~~~~~
         |                 cpu_get_elf_hwcap2
   arch/arm64/kernel/cpufeature.c:2095:17: note: each undeclared identifier is reported only once for each function it appears in


vim +2095 arch/arm64/kernel/cpufeature.c

34bfeea4a9e9cd Catalin Marinas 2020-05-04  2091  
44b3834b2eed59 James Morse     2022-07-14  2092  static void elf_hwcap_fixup(void)
44b3834b2eed59 James Morse     2022-07-14  2093  {
7d26a2c7f8d9bf Mark Rutland    2023-01-20  2094  	if (cpus_have_cap(ARM64_WORKAROUND_1742098))
44b3834b2eed59 James Morse     2022-07-14 @2095  		compat_elf_hwcap2 &= ~COMPAT_HWCAP2_AES;
44b3834b2eed59 James Morse     2022-07-14  2096  }
44b3834b2eed59 James Morse     2022-07-14  2097  

:::::: The code at line 2095 was first introduced by commit
:::::: 44b3834b2eed595af07021b1c64e6f9bc396398b arm64: errata: Remove AES hwcap for COMPAT tasks

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
