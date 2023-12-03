Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B584DEA8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+3kJi2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585170; x=1733121170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JIjw8FW0Cvne8wwDp4pHQm7ue9DIwM89QlVaOK5lDo=;
  b=T+3kJi2liR15tYFZaObJXJqwDsR7RYL3CqCk0MDGc8byuCQPvMnDjbcl
   E89/qw5wWZHkJHKKV82OeG7NqaCjveIHILY4rl7N84jtVkEkbkx0CGGn9
   7u2b60L0NDNGpuhI6Tg+WwDqCs4rnvYmcfHlRNXWNVXXokzDYesRe0zeX
   T3VNi6EG7aCKzLRPwAfR9BSOfZV3u5HrdLJwfjMmZoN+c3aQ9c1x4NuTp
   ksVpBBVHCY3LzWFW01sj74JkUkV7JmEhIEXoIBnLqg0mnYAgG6Oa3STuA
   DneXnJGPFMkm/JD8RJeWhi/5QNApsF5sRc8jIXIneDeDJ7bWnamx5oXvF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6906502"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6906502"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770191152"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770191152"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006LA-0d;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jkosina@suse.cz>
Subject: drivers/hid/intel-ish-hid/ipc/ipc.c:685:13: sparse: sparse: invalid
 assignment: |=
Message-ID: <202312031125.9fIHZZo5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b8af6552cb7c9bf1194e871f8d733a19b113230
commit: ae02e5d40d5f829c589412c6253f925e35cf7a22 HID: intel-ish-hid: ipc layer
date:   7 years ago
config: x86_64-randconfig-123-20231101 (https://download.01.org/0day-ci/archive/20231203/202312031125.9fIHZZo5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231203/202312031125.9fIHZZo5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312031125.9fIHZZo5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/intel-ish-hid/ipc/ipc.c:685:13: sparse: sparse: invalid assignment: |=
>> drivers/hid/intel-ish-hid/ipc/ipc.c:685:13: sparse:    left side has type unsigned short
>> drivers/hid/intel-ish-hid/ipc/ipc.c:685:13: sparse:    right side has type restricted pci_power_t
   drivers/hid/intel-ish-hid/ipc/ipc.c:691:13: sparse: sparse: invalid assignment: |=
   drivers/hid/intel-ish-hid/ipc/ipc.c:691:13: sparse:    left side has type unsigned short
   drivers/hid/intel-ish-hid/ipc/ipc.c:691:13: sparse:    right side has type restricted pci_power_t
   In file included from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from drivers/hid/intel-ish-hid/ishtp/bus.h:18,
                    from drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h:21,
                    from drivers/hid/intel-ish-hid/ishtp/client.h:20,
                    from drivers/hid/intel-ish-hid/ipc/ipc.c:20:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:517:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     517 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15,
                    from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from drivers/hid/intel-ish-hid/ishtp/bus.h:18,
                    from drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h:21,
                    from drivers/hid/intel-ish-hid/ishtp/client.h:20,
                    from drivers/hid/intel-ish-hid/ipc/ipc.c:20:
   include/linux/kernfs.h:440:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     440 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~

vim +685 drivers/hid/intel-ish-hid/ipc/ipc.c

   640	
   641	/**
   642	 * _ish_hw_reset() - HW reset
   643	 * @dev: ishtp device pointer
   644	 *
   645	 * Reset ISH HW to recover if any error
   646	 *
   647	 * Return: 0 for success else error fault code
   648	 */
   649	static int _ish_hw_reset(struct ishtp_device *dev)
   650	{
   651		struct pci_dev *pdev = dev->pdev;
   652		int	rv;
   653		unsigned int	dma_delay;
   654		uint16_t csr;
   655	
   656		if (!pdev)
   657			return	-ENODEV;
   658	
   659		rv = pci_reset_function(pdev);
   660		if (!rv)
   661			dev->dev_state = ISHTP_DEV_RESETTING;
   662	
   663		if (!pdev->pm_cap) {
   664			dev_err(&pdev->dev, "Can't reset - no PM caps\n");
   665			return	-EINVAL;
   666		}
   667	
   668		/* Now trigger reset to FW */
   669		ish_reg_write(dev, IPC_REG_ISH_RMP2, 0);
   670	
   671		for (dma_delay = 0; dma_delay < MAX_DMA_DELAY &&
   672			_ish_read_fw_sts_reg(dev) & (IPC_ISH_IN_DMA);
   673			dma_delay += 5)
   674			mdelay(5);
   675	
   676		if (dma_delay >= MAX_DMA_DELAY) {
   677			dev_err(&pdev->dev,
   678				"Can't reset - stuck with DMA in-progress\n");
   679			return	-EBUSY;
   680		}
   681	
   682		pci_read_config_word(pdev, pdev->pm_cap + PCI_PM_CTRL, &csr);
   683	
   684		csr &= ~PCI_PM_CTRL_STATE_MASK;
 > 685		csr |= PCI_D3hot;
   686		pci_write_config_word(pdev, pdev->pm_cap + PCI_PM_CTRL, csr);
   687	
   688		mdelay(pdev->d3_delay);
   689	
   690		csr &= ~PCI_PM_CTRL_STATE_MASK;
   691		csr |= PCI_D0;
   692		pci_write_config_word(pdev, pdev->pm_cap + PCI_PM_CTRL, csr);
   693	
   694		ish_reg_write(dev, IPC_REG_ISH_RMP2, IPC_RMP2_DMA_ENABLED);
   695	
   696		/*
   697		 * Send 0 IPC message so that ISH FW wakes up if it was already
   698		 * asleep
   699		 */
   700		ish_reg_write(dev, IPC_REG_HOST2ISH_DRBL, IPC_DRBL_BUSY_BIT);
   701	
   702		/* Flush writes to doorbell and REMAP2 */
   703		ish_reg_read(dev, IPC_REG_ISH_HOST_FWSTS);
   704	
   705		return	0;
   706	}
   707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
