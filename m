Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5531C6B3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 12:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLvugiO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701435567; x=1732971567;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5Kqdmd55kIhS9SwDbQZlx9iiKpwsGiJGuBjRxOl5VQM=;
  b=MLvugiO+38Nu7oLJPWHawdprH5JDs5/VxGJiO6pcEObiNu7J/TEVYfua
   +HPWoTSb2cTPjgXaF+IyWFdOWlNdSuNLqjn8ui+6EjsjEUWdNxDkdilx+
   NVX0+2Y76bZtXnefe4qO1GFr5E+mBR5ztGtJYm4VE1397a1WJpL0jhXIV
   N7pp9n7R2JNnq/aM7ZaJSdDqXhN9x53PwqaZsskWMtCGgJ/b3/lNDl/jw
   MoQJUsc9jRMeg3nKXOWPgXBR8L7S3JjsWazAH9YeOwzVV4hu/S1xh1FX0
   ZpAbnOPc7rPXz+BgfTsUciajBLIZnUTG8QLW93PgHyG/o/i4YJgfYbmnB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393229478"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="393229478"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 04:59:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="893212259"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="893212259"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 01 Dec 2023 04:59:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9373-0003hQ-2D;
	Fri, 01 Dec 2023 12:59:21 +0000
Date: Fri, 1 Dec 2023 20:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>
Subject: drivers/pci/pci.h:343:17: sparse: sparse: cast from restricted
 pci_channel_state_t
Message-ID: <202312012039.pWgQURKD-lkp@intel.com>
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
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: c82458101d5490230d735caecce14c9c27b1010c PCI/PM: Mark devices disconnected if upstream PCIe link is down on resume
date:   9 weeks ago
config: loongarch-randconfig-r034-20230511 (https://download.01.org/0day-ci/archive/20231201/202312012039.pWgQURKD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312012039.pWgQURKD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312012039.pWgQURKD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/pci-driver.c:522:42: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci-driver.c:522:61: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci-driver.c:757:28: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/pci/pci-driver.c:757:46: sparse: sparse: restricted pci_power_t degrades to integer
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
