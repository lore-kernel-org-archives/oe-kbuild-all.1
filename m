Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F30315BF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwkgQx1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585109; x=1733121109;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W4tIP09mPlWOArsHCXMP1hV5cz4sLQya8ACuH/hjgtk=;
  b=LwkgQx1AWM2BT/fcp00LvufG3mmfhpqScP7Pp/zpPNKZuZ3zJfdZzg1x
   1iVLcqRRxCpWKevtNbhnB+nCUcbvU0SBmYrqTraxrirEtcoAJRRXW0sWa
   OBZY8WGDOuqSZlRoTPd2tzVJixY0TRbbwtKYkRFVuAnsr2A/RvTxb9rBr
   FeGJHn2SoWdihGKvkM94/cE/jh+mU9D1P4ET6YDVnAc1n/PaY+xo0Q1O3
   QUMNs7VvSR0R1RyZOfjxzq1F/TlHzK0AwqT59NDXgjmtGpi2Rq9Pk/5Em
   UJE0jsLRi851UtMWnFbD4bn+5vfqp6wUw9pVMuggdR2yEurCVb3jLC3Vn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180355"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180355"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="943556076"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="943556076"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Dec 2023 22:31:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g10-0006KH-2S;
	Sun, 03 Dec 2023 06:31:42 +0000
Date: Sun, 3 Dec 2023 14:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>
Subject: drivers/pci/pci.h:343:17: sparse: sparse: cast from restricted
 pci_channel_state_t
Message-ID: <202312022235.tbbtU1lj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: c82458101d5490230d735caecce14c9c27b1010c PCI/PM: Mark devices disconnected if upstream PCIe link is down on resume
date:   9 weeks ago
config: sparc64-randconfig-r036-20230708 (https://download.01.org/0day-ci/archive/20231202/202312022235.tbbtU1lj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312022235.tbbtU1lj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312022235.tbbtU1lj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/pci-driver.c:522:42: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci-driver.c:522:61: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci-driver.c:757:28: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci-driver.c:757:46: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci-driver.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   drivers/pci/pci-driver.c: note: in included file:
>> drivers/pci/pci.h:343:17: sparse: sparse: cast from restricted pci_channel_state_t
>> drivers/pci/pci.h:343:17: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/pci.h:346:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pci.h:346:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pci.h:346:23: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/pci.h:350:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pci.h:350:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pci.h:350:23: sparse: sparse: cast to restricted pci_channel_state_t

vim +343 drivers/pci/pci.h

ac04840350e2c2 Lukas Wunner         2023-03-11  324  
a6bd101b8f84f9 Keith Busch          2018-09-20  325  /**
a6bd101b8f84f9 Keith Busch          2018-09-20  326   * pci_dev_set_io_state - Set the new error state if possible.
a6bd101b8f84f9 Keith Busch          2018-09-20  327   *
347269c113f10f Krzysztof Wilczyński 2021-07-03  328   * @dev: PCI device to set new error_state
347269c113f10f Krzysztof Wilczyński 2021-07-03  329   * @new: the state we want dev to be in
a6bd101b8f84f9 Keith Busch          2018-09-20  330   *
74ff8864cc842b Lukas Wunner         2023-01-20  331   * If the device is experiencing perm_failure, it has to remain in that state.
74ff8864cc842b Lukas Wunner         2023-01-20  332   * Any other transition is allowed.
a6bd101b8f84f9 Keith Busch          2018-09-20  333   *
a6bd101b8f84f9 Keith Busch          2018-09-20  334   * Returns true if state has been changed to the requested state.
a6bd101b8f84f9 Keith Busch          2018-09-20  335   */
a6bd101b8f84f9 Keith Busch          2018-09-20  336  static inline bool pci_dev_set_io_state(struct pci_dev *dev,
a6bd101b8f84f9 Keith Busch          2018-09-20  337  					pci_channel_state_t new)
a6bd101b8f84f9 Keith Busch          2018-09-20  338  {
74ff8864cc842b Lukas Wunner         2023-01-20  339  	pci_channel_state_t old;
a6bd101b8f84f9 Keith Busch          2018-09-20  340  
a6bd101b8f84f9 Keith Busch          2018-09-20  341  	switch (new) {
a6bd101b8f84f9 Keith Busch          2018-09-20  342  	case pci_channel_io_perm_failure:
74ff8864cc842b Lukas Wunner         2023-01-20 @343  		xchg(&dev->error_state, pci_channel_io_perm_failure);
74ff8864cc842b Lukas Wunner         2023-01-20  344  		return true;
a6bd101b8f84f9 Keith Busch          2018-09-20  345  	case pci_channel_io_frozen:
74ff8864cc842b Lukas Wunner         2023-01-20  346  		old = cmpxchg(&dev->error_state, pci_channel_io_normal,
74ff8864cc842b Lukas Wunner         2023-01-20  347  			      pci_channel_io_frozen);
74ff8864cc842b Lukas Wunner         2023-01-20  348  		return old != pci_channel_io_perm_failure;
a6bd101b8f84f9 Keith Busch          2018-09-20  349  	case pci_channel_io_normal:
74ff8864cc842b Lukas Wunner         2023-01-20  350  		old = cmpxchg(&dev->error_state, pci_channel_io_frozen,
74ff8864cc842b Lukas Wunner         2023-01-20  351  			      pci_channel_io_normal);
74ff8864cc842b Lukas Wunner         2023-01-20  352  		return old != pci_channel_io_perm_failure;
74ff8864cc842b Lukas Wunner         2023-01-20  353  	default:
74ff8864cc842b Lukas Wunner         2023-01-20  354  		return false;
a6bd101b8f84f9 Keith Busch          2018-09-20  355  	}
a6bd101b8f84f9 Keith Busch          2018-09-20  356  }
89ee9f7680031d Keith Busch          2017-03-29  357  

:::::: The code at line 343 was first introduced by commit
:::::: 74ff8864cc842be994853095dba6db48e716400a PCI: hotplug: Allow marking devices as disconnected during bind/unbind

:::::: TO: Lukas Wunner <lukas@wunner.de>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
