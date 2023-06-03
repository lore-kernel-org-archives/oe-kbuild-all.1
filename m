Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A07290B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685810087; x=1717346087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k12aIu3uKRbZnkJ/GeJfeDWAxQllBd03Csy+UbTxaPE=;
  b=nLxrajSmxkt4SELYh9mEaEcUOlX+0dlGcpmLJWgtH69Y4ktlzhjjb8oV
   AztOIXfTfAfl6sKrBITY1NPDqBPvy68bBPsK1QsmWARmjo5K9YfaZ13JY
   +6lvebFM8vhnBuoL38Oqs2pMQFDgKMTDD1moUG52mkJXAKMd7j5e3iUOF
   y/owzEVKRsOnBK+ostDA5dScsQ6rt0/joi5nLoluopAcRbGY/cU0wDiTF
   9goIbEdKHbxIUnCM739CEUMIRtg/OeyOKitFwi5kaIrutaooiC1iLI5l1
   8vlDbE+S5wTvKwB2mNyNiLCTb72z+yiEeapsHSeKKoS0PojdYigwyVlWK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="358529988"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="358529988"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 09:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="658593182"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="658593182"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Jun 2023 09:34:42 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5UDB-0001nN-2m;
	Sat, 03 Jun 2023 16:34:41 +0000
Date: Sun, 4 Jun 2023 00:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Weinberger <richard@nod.at>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 8352/9999] arch/um/drivers/virt-pci.c:644:9:
 error: implicit declaration of function 'virtio_reset_device'; did you mean
 'virtio_break_device'?
Message-ID: <202306040005.j6CVOUhV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Benjamin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   0ab06468cbd149aac0d7f216ec00452ff8c74e0b
commit: a27e95a6ff3fd633422ca44c6d571ef84392f5b8 [8352/9999] um: virt-pci: properly remove PCI device from bus
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20230604/202306040005.j6CVOUhV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=a27e95a6ff3fd633422ca44c6d571ef84392f5b8
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout a27e95a6ff3fd633422ca44c6d571ef84392f5b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um olddefconfig
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306040005.j6CVOUhV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/um/drivers/virt-pci.c: In function 'um_pci_virtio_remove':
>> arch/um/drivers/virt-pci.c:644:9: error: implicit declaration of function 'virtio_reset_device'; did you mean 'virtio_break_device'? [-Werror=implicit-function-declaration]
     644 |         virtio_reset_device(vdev);
         |         ^~~~~~~~~~~~~~~~~~~
         |         virtio_break_device
   cc1: some warnings being treated as errors


vim +644 arch/um/drivers/virt-pci.c

   615	
   616	static void um_pci_virtio_remove(struct virtio_device *vdev)
   617	{
   618		struct um_pci_device *dev = vdev->priv;
   619		int i;
   620	
   621		device_set_wakeup_enable(&vdev->dev, false);
   622	
   623		mutex_lock(&um_pci_mtx);
   624		for (i = 0; i < MAX_DEVICES; i++) {
   625			if (um_pci_devices[i].dev != dev)
   626				continue;
   627	
   628			um_pci_devices[i].dev = NULL;
   629			irq_free_desc(dev->irq);
   630	
   631			break;
   632		}
   633		mutex_unlock(&um_pci_mtx);
   634	
   635		if (i < MAX_DEVICES) {
   636			struct pci_dev *pci_dev;
   637	
   638			pci_dev = pci_get_slot(bridge->bus, i);
   639			if (pci_dev)
   640				pci_stop_and_remove_bus_device_locked(pci_dev);
   641		}
   642	
   643		/* Stop all virtqueues */
 > 644		virtio_reset_device(vdev);
   645		dev->cmd_vq = NULL;
   646		dev->irq_vq = NULL;
   647		vdev->config->del_vqs(vdev);
   648	
   649		kfree(dev);
   650	}
   651	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
