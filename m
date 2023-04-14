Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B057C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 05:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681450038; x=1712986038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jfi8niM3A2seSeB+1t+phNhF2j+W/B03BTrXTg9obHo=;
  b=FLkuFEK7opwtCr4RFdY3cJaIBcJp65Vbe+EqvXk/Kof9cMAf6XWMXaLc
   Gxviout3EkpMNkh+FGFKeAF1p58fOvi6BVOCb9vuUO7V2BKSWsndwtZZI
   X6JyAa1pYhfFrOKnSvmDepqMP1T4qyWOxcOlY49XI4rLmmUmIlbM87GZf
   cp3y6VLE+cH68SGy1VKCFt2H/zNJeCttBdSDG8rovXGOK7Tm/5cf/1AfP
   7pIgA73fdTkpqG4PJjf/LaLbmftRBTXcwP5grFOd1ZblBy//GxrnT0zbs
   vehs0dFLs2I4LBc4D7Zh4A1WJoUNi6h6SsPsSM0KZqY+nKD/VW0qtCkFg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="409585997"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="409585997"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 22:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="779055684"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="779055684"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Apr 2023 22:27:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnBxs-000ZGd-0T;
	Fri, 14 Apr 2023 05:27:16 +0000
Date: Fri, 14 Apr 2023 13:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:tmp-x86-pie 38/38] arch/x86/kernel/head64.c:598:13: error:
 conflicting types for 'startup_64_setup_env'; have 'void(void)'
Message-ID: <202304141354.ooowtC0H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git tmp-x86-pie
head:   783e21545a8277f8d308e7db80d1eb45e32289d0
commit: 783e21545a8277f8d308e7db80d1eb45e32289d0 [38/38] x86/head64: Replace pointer fixups with PIE codegen
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230414/202304141354.ooowtC0H-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=783e21545a8277f8d308e7db80d1eb45e32289d0
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb tmp-x86-pie
        git checkout 783e21545a8277f8d308e7db80d1eb45e32289d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141354.ooowtC0H-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/head64.c:598:13: error: conflicting types for 'startup_64_setup_env'; have 'void(void)'
     598 | void __init startup_64_setup_env(void)
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/head64.c:28:
   arch/x86/include/asm/setup.h:53:13: note: previous declaration of 'startup_64_setup_env' with type 'void(long unsigned int)'
      53 | extern void startup_64_setup_env(unsigned long physbase);
         |             ^~~~~~~~~~~~~~~~~~~~


vim +598 arch/x86/kernel/head64.c

   594	
   595	/*
   596	 * Setup boot CPU state needed before kernel switches to virtual addresses.
   597	 */
 > 598	void __init startup_64_setup_env(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
