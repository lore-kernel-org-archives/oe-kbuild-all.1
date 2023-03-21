Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A50C952
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679410074; x=1710946074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2LxUkndbd+++KlEe/z8fO+5TIJBkiMs/fFKTZyucq4M=;
  b=X8vkQNxSR85f74Iyxk3oolgljRkKxUed0WZOLaXN8jqsCoDzLHpa7sYh
   bmnYFEtMweBR12P+PgiqGubs2oczUbBShfKoYLEeFxr/xxNQARWzrZtss
   uid2As0VBJ5BmlJR7NfKdu38uT4ZShoM7NydINxK51w7AX/TyST4nVudl
   hU5xBiTFRfCq7G2K0H2NJrIky6R0ANVZ3B+gcuGMZTjawMssrLv6iBJQn
   XuF87Qy7FdlqtCO/1Je7c9OdeRTwo1iYW5KwwvSV1okXH9BRHxTlMBrMQ
   ZQZt9tmw1JdZuKE+3nVtySBRaP71XmP0ISOxoRGAHa94/0AATjigp7Z8P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="338996068"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="338996068"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 07:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="1010965357"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="1010965357"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Mar 2023 07:47:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pedGw-000C1k-07;
	Tue, 21 Mar 2023 14:47:34 +0000
Date: Tue, 21 Mar 2023 22:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/platform/x86/socwatch/sw_pci.c:64:6: warning: no previous
 prototype for 'sw_print_pci_devices_i'
Message-ID: <202303212258.x5jLLTvu-lkp@intel.com>
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

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_10
head:   c55df4a2b60fc7c6c4d00fd9f9fb447087833513
commit: cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19 SEP/SOCWATCH Update SoCWatch driver after rebasing to linux v5.7
date:   2 years, 6 months ago
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230321/202303212258.x5jLLTvu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/mchinth/linux/commit/cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_10
        git checkout cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303212258.x5jLLTvu-lkp@intel.com/

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
