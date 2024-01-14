Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F78386
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 08:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/3QrWXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705221241; x=1736757241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VPnTuETUtqu8AZuXrhcjra2KYjDkgzc+rPUZoBm2QnM=;
  b=M/3QrWXkxvzVWgHqsKWp7tg1MSmXA+d7llNDFyfcLM5iX6hMGnThZRhR
   r71FYSOR35O15VJ02AtghzPcjVRN/3uz47m2EOfcl+rz//JIW8QyVGaml
   GkrH8UG/Ot0CSsdJCQ0ZsGWnWzRqB3Cq8R8cbcoOYlnreCT2492zuOOPQ
   a1v2onDTyedg914whawmYNxjAF2O/BpTABhdwaYg7NMFJu0rePsWycs6w
   MpgNB2qrtzeqa251HmYIq/FwZ9RVusKA6lVDIi+ObylbKpCevORp96PZY
   8uWiDy4pIFsQy8C7JG31XcgBfowhIXJ9y4QSWLgmqARFOjRnTrcG/oB8s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="465822851"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="465822851"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 00:34:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="776442267"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="776442267"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Jan 2024 00:33:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOvwK-000BLI-2C;
	Sun, 14 Jan 2024 08:33:56 +0000
Date: Sun, 14 Jan 2024 16:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17888/21544]
 drivers/pci/pcie/aer.c:465:15: warning: array subscript 0 is outside array
 bounds of 'u32[0]' {aka 'unsigned int[]'}
Message-ID: <202401141658.ysygjWKD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1f0983450549eeea71fb9333517330947a779262
commit: 614ce6e98504ab9de79789890a0632c06b0052c1 [17888/21544] Intel:PCI/AER: Save AER Capability for suspend/resume
config: arm64-randconfig-001-20240112 (https://download.01.org/0day-ci/archive/20240114/202401141658.ysygjWKD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401141658.ysygjWKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141658.ysygjWKD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/pcie/aer.c: In function 'pci_save_aer_state':
>> drivers/pci/pcie/aer.c:465:15: warning: array subscript 0 is outside array bounds of 'u32[0]' {aka 'unsigned int[]'} [-Warray-bounds=]
     465 |         cap = &save_state->cap.data[0];
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/pcie/aer.c:19:
   include/linux/pci.h:273:25: note: while referencing 'data'
     273 |         u32             data[0];
         |                         ^~~~
   drivers/pci/pcie/aer.c:206: warning: Function parameter or member 'str' not described in 'pcie_ecrc_get_policy'
   drivers/pci/pcie/aer.c:1271: warning: Function parameter or member 'irq' not described in 'aer_isr'
   drivers/pci/pcie/aer.c:1271: warning: Function parameter or member 'context' not described in 'aer_isr'
   drivers/pci/pcie/aer.c:1271: warning: Excess function parameter 'work' description in 'aer_isr'


vim +465 drivers/pci/pcie/aer.c

   450	
   451	void pci_save_aer_state(struct pci_dev *dev)
   452	{
   453		struct pci_cap_saved_state *save_state;
   454		u32 *cap;
   455		int pos;
   456	
   457		pos = dev->aer_cap;
   458		if (!pos)
   459			return;
   460	
   461		save_state = pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ERR);
   462		if (!save_state)
   463			return;
   464	
 > 465		cap = &save_state->cap.data[0];
   466		pci_read_config_dword(dev, pos + PCI_ERR_UNCOR_MASK, cap++);
   467		pci_read_config_dword(dev, pos + PCI_ERR_UNCOR_SEVER, cap++);
   468		pci_read_config_dword(dev, pos + PCI_ERR_COR_MASK, cap++);
   469		pci_read_config_dword(dev, pos + PCI_ERR_CAP, cap++);
   470		if (pcie_cap_has_rtctl(dev))
   471			pci_read_config_dword(dev, pos + PCI_ERR_ROOT_COMMAND, cap++);
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
