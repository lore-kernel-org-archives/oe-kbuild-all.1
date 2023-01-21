Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DEF2561
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 13:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674308785; x=1705844785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/o5/2YYxzYxq4x+yrFTrVMkovxlPB9/IhzQz0Lo6jYU=;
  b=fZG3CB1UxxhwbonRG4w2hl6OeNaePoLvAq99SyJoKY5W0AqLveW5jIX6
   9eIccQ3DcyB/5KMjwpguDjQOgMb69QaSK3MgfyQ2hjJWWVb+3OqqbObxS
   gTBGP42HGbGKR2O5TKifCL774B72o/SEiy6OaxhGHXgT35Z/B+6XyztIx
   j6sZ3cDHw4613OKLQbdyuc+wBuI4qf2Qtghu/pSqKN+QdB3qvr8B/g0nE
   S7Y8Tg0fbvJzyb/fducbnGWsskFxMYM98btNWEuQL2ETLEEvVpKhwk1Ct
   V3+sUZX8Z6SYnDvpaQTcapeZz0cZipJ5fKrle/VB3Z1uFyP6wKPBDohMJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="325824859"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="325824859"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 05:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="729438618"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="729438618"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jan 2023 05:46:24 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJECN-00047q-0l;
	Sat, 21 Jan 2023 13:46:23 +0000
Date: Sat, 21 Jan 2023 21:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:pciehp_deadlock_v2 2/2]
 drivers/pci/hotplug/pciehp_core.c:167:32: error: implicit declaration of
 function 'ctrl_dev'; did you mean 'ctrl_dbg'?
Message-ID: <202301212153.vqUAPzOc-lkp@intel.com>
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
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230121/202301212153.vqUAPzOc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/l1k/linux/commit/f333e7ec9e2c377c76238169a1d437e929937223
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k pciehp_deadlock_v2
        git checkout f333e7ec9e2c377c76238169a1d437e929937223
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pci/hotplug/pciehp_core.c: In function 'pciehp_check_presence':
>> drivers/pci/hotplug/pciehp_core.c:167:32: error: implicit declaration of function 'ctrl_dev'; did you mean 'ctrl_dbg'? [-Werror=implicit-function-declaration]
     167 |         struct pci_dev *pdev = ctrl_dev(ctrl);
         |                                ^~~~~~~~
         |                                ctrl_dbg
   drivers/pci/hotplug/pciehp_core.c:167:32: warning: initialization of 'struct pci_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +167 drivers/pci/hotplug/pciehp_core.c

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
