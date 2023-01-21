Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E827229AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674310646; x=1705846646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rfRwb8TirkhCeUy1MUIshhn3HNhxO8Pph8tjZCbkJJs=;
  b=B4hZxEkWNsBc5nkSWKYKCbEEZ3CpsnbZOotD2grH6LhVU2ZjbqYlxes6
   zu3L43iP0BDAMDhqTrl6jJ6f7vuQ7c2pTUmb3l1c7VoCRui9Z/uPhkyiu
   1yOIAzfe4PwSJVmj24tcDeaBM7D8eJRxIb5Epe2IVi1AYp99EzoaYDjrw
   VJhH/BnGxjEJ0jeZNmGlQ0DgnIMvQiog7QE3dS3apdZe8wr6tjG3lc0j5
   xTcMDBHs55cMznJZuU5zIhLFO47a0MGt4ETwbYB6EwOoA5e4frE4DmXUe
   3qse/pM/U3YmQT9MsZS6/fU+8+G3423kxnesJ27TMarh8GWhNSukbd+eE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324474564"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="324474564"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 06:17:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="803400758"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="803400758"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2023 06:17:25 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJEgO-00049e-28;
	Sat, 21 Jan 2023 14:17:24 +0000
Date: Sat, 21 Jan 2023 22:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:pciehp_deadlock_v2 2/2]
 drivers/pci/hotplug/pciehp_core.c:167:25: error: implicit declaration of
 function 'ctrl_dev' is invalid in C99
Message-ID: <202301212218.OHaTQvVP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux pciehp_deadlock_v2
head:   f333e7ec9e2c377c76238169a1d437e929937223
commit: f333e7ec9e2c377c76238169a1d437e929937223 [2/2] PCI: pciehp: Fix AB-BA deadlock between reset_lock and device_lock
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230121/202301212218.OHaTQvVP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/f333e7ec9e2c377c76238169a1d437e929937223
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k pciehp_deadlock_v2
        git checkout f333e7ec9e2c377c76238169a1d437e929937223
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pci/hotplug/pciehp_core.c:167:25: error: implicit declaration of function 'ctrl_dev' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           struct pci_dev *pdev = ctrl_dev(ctrl);
                                  ^
   drivers/pci/hotplug/pciehp_core.c:167:18: warning: incompatible integer to pointer conversion initializing 'struct pci_dev *' with an expression of type 'int' [-Wint-conversion]
           struct pci_dev *pdev = ctrl_dev(ctrl);
                           ^      ~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/ctrl_dev +167 drivers/pci/hotplug/pciehp_core.c

   153	
   154	/**
   155	 * pciehp_check_presence() - synthesize event if presence has changed
   156	 * @ctrl: controller to check
   157	 *
   158	 * On probe and resume, an explicit presence check is necessary to bring up an
   159	 * occupied slot or bring down an unoccupied slot.  This can't be triggered by
   160	 * events in the Slot Status register, they may be stale and are therefore
   161	 * cleared.  Secondly, sending an interrupt for "events that occur while
   162	 * interrupt generation is disabled [when] interrupt generation is subsequently
   163	 * enabled" is optional per PCIe r4.0, sec 6.7.3.4.
   164	 */
   165	static void pciehp_check_presence(struct controller *ctrl)
   166	{
 > 167		struct pci_dev *pdev = ctrl_dev(ctrl);
   168		int occupied;
   169	
   170		down_read(&pdev->reset_lock);
   171		mutex_lock(&ctrl->state_lock);
   172	
   173		occupied = pciehp_card_present_or_link_active(ctrl);
   174		if ((occupied > 0 && (ctrl->state == OFF_STATE ||
   175				  ctrl->state == BLINKINGON_STATE)) ||
   176		    (!occupied && (ctrl->state == ON_STATE ||
   177				   ctrl->state == BLINKINGOFF_STATE)))
   178			pciehp_request(ctrl, PCI_EXP_SLTSTA_PDC);
   179	
   180		mutex_unlock(&ctrl->state_lock);
   181		up_read(&pdev->reset_lock);
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
