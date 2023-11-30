Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946E852F85
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGOXyIjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701373238; x=1732909238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gQ2UE11wBd/LBU4Kdwpbb2ruH9FFZeD78KufthodecQ=;
  b=EGOXyIjZMAX/xJCDFaWe4x9dRNppKJelWaGEk0wq64MSFpnEad6wW1Ih
   rPj02rZXl0CG6Aof37RFmOoJE+30tM77c0KomXnKanPN7SowMc4HhRUd7
   Nd39Nf3xnhyvSZxOWxhLdgtvyPKw01OfWg9oEfaHy2ktJ9M3MQFjpTmGT
   cYYGoH5AfjA4aA9CrG4SaW0bCR5Qw/Pw7+xRUCDhBmS15DS3rTfrvXjSO
   TxPLWYG+RwjGwg7OkBX1nozp/e5XgOVhkmk06nl2XBhjIqVx0XH8LA7F9
   6zSBy9kljbPhaHJyUyLcibew3YutzVwJ2jjYpIxuQ+f3i0pbxZWO4f//t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="14932908"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="14932908"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 11:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="839910495"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="839910495"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2023 11:40:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8mtk-0002bk-2w;
	Thu, 30 Nov 2023 19:40:32 +0000
Date: Fri, 1 Dec 2023 03:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast from
 restricted pci_channel_state_t
Message-ID: <202312010320.jjetWPe9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 74ff8864cc842be994853095dba6db48e716400a PCI: hotplug: Allow marking devices as disconnected during bind/unbind
date:   10 months ago
config: alpha-randconfig-r034-20230903 (https://download.01.org/0day-ci/archive/20231201/202312010320.jjetWPe9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010320.jjetWPe9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312010320.jjetWPe9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/pcie/err.c: note: in included file:
>> drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast from restricted pci_channel_state_t
>> drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:328:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:328:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:328:23: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:332:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:332:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:332:23: sparse: sparse: cast to restricted pci_channel_state_t
>> drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast from restricted pci_channel_state_t
>> drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:328:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:328:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:328:23: sparse: sparse: cast to restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:332:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:332:23: sparse: sparse: cast from restricted pci_channel_state_t
   drivers/pci/pcie/../pci.h:332:23: sparse: sparse: cast to restricted pci_channel_state_t

vim +325 drivers/pci/pcie/../pci.h

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
