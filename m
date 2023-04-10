Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB9B3C04
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681139012; x=1712675012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bx84xwzeFusvYJ1a9C79Da6nvwiu7xngWhwkpWBRr20=;
  b=f50LrIWJBvT/ivdOPF0h368cOWCqrq9ejd3rPHqrQWFEvjy3TnCaybYs
   dcbBy3wnXNAuUIfttPMnD2LbSX7WxTTt0ra6+ICEehLTYIFUBnT/m6I+f
   C7qiUZUzxbB53hH1TY46YNDvuCs2I1/3ZoXoeC2Dw0cjkXw8CbMfeUlJ3
   XGJ8fQfJ3FHyxNMTC6/JLfZvBy+TF/+LQNUUuF9FehG2D8crWD09RTJ4/
   vzR/PrLcXoM0qKNTtFvAGuKNyM/5vugrIBohh2BbcFurY9rMuABZQITi5
   32uunr521NT6suKzGix1EXMCfWQZ2SjXeb5Hmv/2OjCVDYNioj4VeT3+i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="429658149"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="429658149"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 08:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="799522951"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="799522951"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2023 08:03:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plt3H-000VR7-0P;
	Mon, 10 Apr 2023 15:03:27 +0000
Date: Mon, 10 Apr 2023 23:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Weinberger <richard@nod.at>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 9393/9999] arch/um/drivers/virt-pci.c:644:9:
 error: implicit declaration of function 'virtio_reset_device'; did you mean
 'virtio_break_device'?
Message-ID: <202304102242.uAOzWxHJ-lkp@intel.com>
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
head:   d86dfc4d95cd218246b10ca7adf22c8626547599
commit: a27e95a6ff3fd633422ca44c6d571ef84392f5b8 [9393/9999] um: virt-pci: properly remove PCI device from bus
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230410/202304102242.uAOzWxHJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
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
| Link: https://lore.kernel.org/oe-kbuild-all/202304102242.uAOzWxHJ-lkp@intel.com/

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
https://github.com/intel/lkp-tests
