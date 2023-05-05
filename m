Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2115A185F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 09:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683279020; x=1714815020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Cl0yEfjkK52z7EkNhTcvV1z0hstKHZBF9Dm/eL5Wv4=;
  b=RkxGy86VqqbvHTKxfu+hxJZX524WniVv1UsIROOqO13hFgxogIIsInxZ
   YJ/pGJ/CM1Y5I0guyuLVqFn7hTjPZX4zrid61sNbrk6zps7ikvfIiuKma
   gYySf8z26qszGtFmxzJdAxwFlmQP7bspTTcVwqnxRYE1nw8Z0xU/Vra8O
   maDMDNZ90UOh+qYap//tCzW3IpwQ1zhGR+JDucYjMnz9eGaVQb4Nb8869
   4xJr1SSTXTgt+GUCO/BPMc+ZaLeGur04PG6YZuOyXuOtDS+DtR5+ldE4n
   x3Ux5i//eTGoNYdHJNvi34vGSyW3/G+9bLy/zU2cVYaYOKmh0y3V/W4Co
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="349207873"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="349207873"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 02:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="1027389870"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="1027389870"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 May 2023 02:30:10 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1purlS-0000Sn-0r;
	Fri, 05 May 2023 09:30:10 +0000
Date: Fri, 5 May 2023 17:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_3 41/91]
 drivers/platform/x86/socwatch/sw_pci.c:64:6: warning: no previous prototype
 for 'sw_print_pci_devices_i'
Message-ID: <202305051717.PAddtXaL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Faycal,

FYI, the error/warning still remains.

tree:   https://github.com/mchinth/linux socwatch_linux_6_3
head:   db51827dc3d8fd27fd6312b14811fa2e0c4abe87
commit: cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19 [41/91] SEP/SOCWATCH Update SoCWatch driver after rebasing to linux v5.7
config: i386-buildonly-randconfig-r006-20230501 (https://download.01.org/0day-ci/archive/20230505/202305051717.PAddtXaL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/mchinth/linux/commit/cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth socwatch_linux_6_3
        git checkout cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051717.PAddtXaL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/socwatch/sw_pci.c:64:6: warning: no previous prototype for 'sw_print_pci_devices_i' [-Wmissing-prototypes]
      64 | void sw_print_pci_devices_i(void) {
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/sw_print_pci_devices_i +64 drivers/platform/x86/socwatch/sw_pci.c

    63	
  > 64	void sw_print_pci_devices_i(void) {
    65		int i = 0;
    66	
    67		for(i = 0; i < s_pci_dev_list.num_entries; ++i) {
    68			pw_pr_debug("bus: %x, dev: %x, func: %x, vendor: %x, device: %x, class: %x, header: %x\n",
    69					s_pci_dev_list.info[i].bus, s_pci_dev_list.info[i].device, s_pci_dev_list.info[i].function,
    70					s_pci_dev_list.info[i].vendorID, s_pci_dev_list.info[i].deviceID, s_pci_dev_list.info[i].classID,
    71					s_pci_dev_list.info[i].headerType);
    72		}
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
