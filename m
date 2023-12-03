Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB61FA0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etsp7rGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585175; x=1733121175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FP6Hmp20MLji0zPxH522/4vPbS35Bc3va1axl1ZS4Xo=;
  b=etsp7rGEj6bwVXMVvkZWAMT+Q8fIfaDdOU/2I60R+9lm5eJY+X/en60Z
   y82lnTiimU067Ad3eleGJtfzZzjVxhhOqsheM8+rfgDXqfzdp7zHzTj+K
   fwdDM+GVTFKl/1pUlylhY7oWmBCZskLABm7iTBpAvttz6d7bCEZusJGKo
   WMBkYBY8QWdgwxXv+f+40dejv5mSMp/ZzA2bWUifAmpU5uWOPRTxTSJV+
   WP9OoInmmo2qyTQYxzOwKU6xcb4bJrlEx7lGbaw8k4RNzanGBNeGoQB7F
   ZKb8AmC5Vcp09NxbPWle6RD0WKolm/lTjDta6f5xt+lYn4YJIiBaXKM/O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180411"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180411"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081648"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081648"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006Lo-2E;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: drivers/pci/hotplug/../pci.h:325:17: sparse: sparse: cast from
 restricted pci_channel_state_t
Message-ID: <202312030751.RxiMfTfm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 74ff8864cc842be994853095dba6db48e716400a PCI: hotplug: Allow marking devices as disconnected during bind/unbind
date:   10 months ago
config: s390-randconfig-r121-20231106 (https://download.01.org/0day-ci/archive/20231203/202312030751.RxiMfTfm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030751.RxiMfTfm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312030751.RxiMfTfm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/hotplug/pciehp_pci.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison always evaluates to false
   drivers/pci/hotplug/pciehp_pci.c: note: in included file:
>> drivers/pci/hotplug/../pci.h:325:17: sparse: sparse: cast from restricted pci_channel_state_t
>> drivers/pci/hotplug/../pci.h:325:17: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/hotplug/../pci.h:328:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/hotplug/../pci.h:328:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/hotplug/../pci.h:328:23: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/hotplug/../pci.h:332:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/hotplug/../pci.h:332:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/hotplug/../pci.h:332:23: sparse: sparse: cast to restricted pci_channel_state_t

vim +325 drivers/pci/hotplug/../pci.h

   306	
   307	/**
   308	 * pci_dev_set_io_state - Set the new error state if possible.
   309	 *
   310	 * @dev: PCI device to set new error_state
   311	 * @new: the state we want dev to be in
   312	 *
   313	 * If the device is experiencing perm_failure, it has to remain in that state.
   314	 * Any other transition is allowed.
   315	 *
   316	 * Returns true if state has been changed to the requested state.
   317	 */
   318	static inline bool pci_dev_set_io_state(struct pci_dev *dev,
   319						pci_channel_state_t new)
   320	{
   321		pci_channel_state_t old;
   322	
   323		switch (new) {
   324		case pci_channel_io_perm_failure:
 > 325			xchg(&dev->error_state, pci_channel_io_perm_failure);
   326			return true;
   327		case pci_channel_io_frozen:
   328			old = cmpxchg(&dev->error_state, pci_channel_io_normal,
   329				      pci_channel_io_frozen);
   330			return old != pci_channel_io_perm_failure;
   331		case pci_channel_io_normal:
   332			old = cmpxchg(&dev->error_state, pci_channel_io_frozen,
   333				      pci_channel_io_normal);
   334			return old != pci_channel_io_perm_failure;
   335		default:
   336			return false;
   337		}
   338	}
   339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
