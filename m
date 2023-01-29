Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E55EBD10
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 03:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674963729; x=1706499729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=51UMb4STrJBd+wwQmjWVGayyLrb7KEGEBaokKY3JK4A=;
  b=LNXoVBnl2x4y2XWRVt/sDWh6hUCsH55gtc6RaiBAOSCAfUmT0KAWLFiA
   fKC+i9URvn6ei+uogQYPDfGX1nDnh2/NEoWd4k+GiLmzI5MicczFrYuMi
   U65oV17ft6lVbCsLCcptC39oO4Mbyo3khi+gj1YQaVfpkdTFx77bNKEsi
   nOMDnn4koB8xV+13AfrDvqtkjtx8DZ1awjLQAzjRbHtPIbsxPXxzwyrsp
   53cjy6u59wechvPdR0kXCvCOtVFFVBIgK+Vbc60Xn1gmkZbtDHDfCQcgo
   4lSfHi88VaIdYoXrpht+98eWHTMs+n4teFhG7fwhcGZ0s+TKu9U6PZ877
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="307702100"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="307702100"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 19:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992491631"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="992491631"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2023 19:42:07 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLyZy-0001P8-1t;
	Sun, 29 Jan 2023 03:42:06 +0000
Date: Sun, 29 Jan 2023 11:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Masahisa Kojima <masahisa.kojima@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] tee: Add op-tee helper functions for variable
 access
Message-ID: <202301291136.9ddQFcPV-lkp@intel.com>
References: <20230126132120.1661-3-masahisa.kojima@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126132120.1661-3-masahisa.kojima@linaro.org>

Hi Masahisa,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on efi/next]
[also build test ERROR on next-20230127]
[cannot apply to linus/master v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahisa-Kojima/efi-expose-efivar-generic-ops-register-function/20230128-170022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20230126132120.1661-3-masahisa.kojima%40linaro.org
patch subject: [RFC PATCH 2/2] tee: Add op-tee helper functions for variable access
config: powerpc-randconfig-c042-20230129 (https://download.01.org/0day-ci/archive/20230129/202301291136.9ddQFcPV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2ff56d7a5b6fa1214c4ef504b921b52d387e0e3b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Masahisa-Kojima/efi-expose-efivar-generic-ops-register-function/20230128-170022
        git checkout 2ff56d7a5b6fa1214c4ef504b921b52d387e0e3b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/tee/tee_core.o: in function `tee_register_efivar_ops':
   tee_core.c:(.text+0x22c0): undefined reference to `efivar_supports_writes'
>> powerpc-linux-ld: tee_core.c:(.text+0x22e4): undefined reference to `efivars_generic_ops_unregister'
>> powerpc-linux-ld: tee_core.c:(.text+0x2304): undefined reference to `efivars_register'
   powerpc-linux-ld: drivers/tee/tee_core.o: in function `tee_unregister_efivar_ops':
   tee_core.c:(.text+0x2328): undefined reference to `efivars_unregister'
>> powerpc-linux-ld: tee_core.c:(.text+0x2338): undefined reference to `efivars_generic_ops_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
