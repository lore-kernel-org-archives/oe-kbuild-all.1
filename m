Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BFF6FCB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 20:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680120014; x=1711656014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xViGJEXOggI28UtOjDUO83slNrCbtPF5mLpvoYdBWeI=;
  b=Hb7MNi7zTtWvRR1y1cCCPDOBfgMLZUi+FmqEDtAKqSHsnDwOtnrPNVpn
   JMoE9dShLPxrn2S1iPwK8/BwKAPXMAfCxsF3Juw4C8+As/UW4iIrYTLL7
   bfM/mD+AZ5KbrmwUqTMnd4tl8YKq+ABYn5lvZOtb6WiW/wYURdOgveX0x
   5evk6t61Vm2+DwD3fFiDZoQlG8cb2dBuv4WNHWSq3VW7inqQG/u+MssAO
   bJAfQ5KB3yanwuijfofhFc2ErwFa9Mh8B6KzP2zbgQyAzaIa6gsteE/6E
   P3iBaW4lwPHL76SW2ZUeyjdjTNT1BDYc6fre6yTV10FPzhdCdRwYUBWcH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="403627026"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="403627026"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 13:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="717018640"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="717018640"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2023 13:00:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phbxq-000JuC-2q;
	Wed, 29 Mar 2023 20:00:10 +0000
Date: Thu, 30 Mar 2023 03:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/platform/x86/socwatch/sw_pci.c:64:6: sparse: sparse: symbol
 'sw_print_pci_devices_i' was not declared. Should it be static?
Message-ID: <202303300334.bCqOhoRr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_10
head:   c55df4a2b60fc7c6c4d00fd9f9fb447087833513
commit: cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19 SEP/SOCWATCH Update SoCWatch driver after rebasing to linux v5.7
date:   2 years, 6 months ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230330/202303300334.bCqOhoRr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/mchinth/linux/commit/cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_10
        git checkout cd0ae8e45c3cc66d1cfb9bfc5046d6a1e9b04d19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socperf/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300334.bCqOhoRr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/socwatch/sw_pci.c:64:6: sparse: sparse: symbol 'sw_print_pci_devices_i' was not declared. Should it be static?
--
>> drivers/platform/x86/socwatch/sw_pmt.c:232:8: sparse: sparse: symbol 's_endpoint_index' was not declared. Should it be static?

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
