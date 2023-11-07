Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C0E1D53E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpfiKYmy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699390649; x=1730926649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JAMQPvX5io5oJOVwb0xlwoalGVppo1qOIWZSoKgVJpc=;
  b=IpfiKYmyaWEqCa/Efz48v3GZtgxvnseszR54cEe5pD8RDwZW/Rev1e97
   /A3a2t+k8fhBARb5eYjm6Id0LFcwc4vgqW48jkTvgjQkyo75PRd8afucl
   6+exMFaICDev8B7KWzevH6neD/sjJTGDWJA71TEV5XizIrQXSjVjCj1rJ
   ROjuLrN+ADzNFRWItp99d466ncQFzuQbMURfN/HT6Mpa/rlYvxR/6fAk5
   LkZ4bBENUUdowYQjkPpSN3mu0KA+td0cc/ltBDWCNYPwrqwhVGsPPryqV
   SMcpu4XnybSgWhCIUM0q1UWDJAIWUAfQ/p7wm4uXtHJBwsfNHdmtyFZPg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="389432098"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="389432098"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 12:57:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="4131783"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Nov 2023 12:57:27 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0T8X-0007O0-0k;
	Tue, 07 Nov 2023 20:57:25 +0000
Date: Wed, 8 Nov 2023 04:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: drivers/pci/hotplug/../pci.h:325:17: sparse: sparse: cast from
 restricted pci_channel_state_t
Message-ID: <202311080353.HZynWnCm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: 74ff8864cc842be994853095dba6db48e716400a PCI: hotplug: Allow marking devices as disconnected during bind/unbind
date:   9 months ago
config: s390-randconfig-r121-20231106 (https://download.01.org/0day-ci/archive/20231108/202311080353.HZynWnCm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080353.HZynWnCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311080353.HZynWnCm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
