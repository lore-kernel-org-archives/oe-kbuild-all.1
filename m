Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385201FA5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680967503; x=1712503503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=di7Ds/VR6M8pH9m2c+PMCl3GLjlLGEaWbNcwA8dycJU=;
  b=lrnc9YmowKcVrvhmXxABZl7zD1Djfq07vL8qQkmZeHMsvdH9PKOYUbZ0
   tmAULBKgzfnVsd+J+0Pk07qc2fZk0AZ0NtOnpsqKUACQcinGSApKfH1S8
   UR5r9OovC4IvCn/wUrq4D76E67D9K9cGsD5akEnOSuPd2+ZGRPNew671F
   4ITPTbS3M//ZgCztGcmbqAsWUp6PYp8CJATw2gZEGjZeoO7FoF9q2Rhpe
   3FwWtAHOzecNVXphP7+0+vqKfYFmUpjHxtyuGd27KklLr1QQhZ4mQTc1x
   lKjUi8S/AFQhbk18bSgOVOytEAHlMeKfMv6ZurYpygRfJJx+LL1u82jqW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="322780707"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="322780707"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 08:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="681297497"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="681297497"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Apr 2023 08:24:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plAR1-000Tqn-0d;
	Sat, 08 Apr 2023 15:24:59 +0000
Date: Sat, 8 Apr 2023 23:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] powerpc/fsl_uli1575: Misc cleanup
Message-ID: <202304082352.xhNWS4WV-lkp@intel.com>
References: <20230408132151.8902-2-pali@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408132151.8902-2-pali@kernel.org>

Hi Pali,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pali-Roh-r/powerpc-fsl_uli1575-Misc-cleanup/20230408-212610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230408132151.8902-2-pali%40kernel.org
patch subject: [PATCH 1/8] powerpc/fsl_uli1575: Misc cleanup
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230408/202304082352.xhNWS4WV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4d3f86e2ae53d180d2cbbe556355ff5b03d4251b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pali-Roh-r/powerpc-fsl_uli1575-Misc-cleanup/20230408-212610
        git checkout 4d3f86e2ae53d180d2cbbe556355ff5b03d4251b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304082352.xhNWS4WV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/sys_ppc32.c:56:
   arch/powerpc/include/asm/ppc-pci.h:71:45: error: 'struct pci_controller' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      71 | static inline int uli_exclude_device(struct pci_controller *hose, u_char bus, u_char devfn) { return PCIBIOS_SUCCESSFUL; }
         |                                             ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/ppc-pci.h: In function 'uli_exclude_device':
>> arch/powerpc/include/asm/ppc-pci.h:71:102: error: 'PCIBIOS_SUCCESSFUL' undeclared (first use in this function)
      71 | static inline int uli_exclude_device(struct pci_controller *hose, u_char bus, u_char devfn) { return PCIBIOS_SUCCESSFUL; }
         |                                                                                                      ^~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/ppc-pci.h:71:102: note: each undeclared identifier is reported only once for each function it appears in
   cc1: all warnings being treated as errors


vim +/PCIBIOS_SUCCESSFUL +71 arch/powerpc/include/asm/ppc-pci.h

    69	
    70	#if !defined(CONFIG_PCI) || !defined(CONFIG_FSL_ULI1575)
  > 71	static inline int uli_exclude_device(struct pci_controller *hose, u_char bus, u_char devfn) { return PCIBIOS_SUCCESSFUL; }
    72	#endif /* !defined(CONFIG_PCI) || !defined(CONFIG_FSL_ULI1575) */
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
