Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EAB23B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678444455; x=1709980455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yS85dX8sia/HUYnAT8ib+i8un3EjlTIgYy2jj6I6+lo=;
  b=naGpKhsQvdAAS31V6/PMcwxi64py6ZSECb90jRhR7owAdbVsSlfZzwWt
   tFhqbiDCykL3LFAwdNSRjOYh4ieOpA9RFhf6oJoO9k0canEdIqG0s1tOB
   laO29dGySm1ZgJjybii2J760akOEgMkntXL4lbxrIqUbrUIXZ+bdz2KaU
   tgPC63EozV8Oz8NHQB1PUatdsqYIPxHA5RZccPsI2s2Bw+lzEsic2LvTi
   qmsq8l/crEVA6Q89LEnS4kKG3Dc7ASl5MF+3/fhmAQDP+36m2QQkgIzs/
   1OQphx9ch5/oJoc9OajyIVW9XfbqfZtmm5oJQLd2tETxUlUkcwR6A6Wto
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="339064330"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="339064330"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 02:34:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746662369"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="746662369"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Mar 2023 02:34:14 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paa4j-0003lb-2M;
	Fri, 10 Mar 2023 10:34:13 +0000
Date: Fri, 10 Mar 2023 18:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_3 41/89]
 drivers/platform/x86/socwatch/sw_pci.c:64:6: warning: no previous prototype
 for 'sw_print_pci_devices_i'
Message-ID: <202303101821.VbNphQl8-lkp@intel.com>
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
head:   2bbe949bea3cbc139c5dd26decd5023b84779d86
commit: cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19 [41/89] SEP/SOCWATCH Update SoCWatch driver after rebasing to linux v5.7
config: x86_64-randconfig-a004 (https://download.01.org/0day-ci/archive/20230310/202303101821.VbNphQl8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/mchinth/linux/commit/cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth socwatch_linux_6_3
        git checkout cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101821.VbNphQl8-lkp@intel.com/

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
