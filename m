Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C689460
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 13:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679406398; x=1710942398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRzOTTgDB1QlCb4Huq6NiG4tlCodPb6oKmLe4LWHLBs=;
  b=ZRDteTWI8KFPCEqQYGxr8qu0TBwI5omEhI5dsUTcz71SVNvRKWvp9RGW
   wSyhJdozssGXvDvrt+NycnBB0v3jjbvZPYNTbV+LmHTJu0kM2HbQNO97s
   DDbBUQjg4+rH3GyQJ7dq/ZWQOwLFFiQjL+S1Dhij3SoZ32Mua01ME3Ok4
   3ugOaI/5rq+AC9RuLzY/RDLapbPmBSR9mAGUS2jyW4VAaYedwACTctaMc
   gdYDGxG3/P9LvCP4NqILAbIuLAI87Eu03J3F8lR+NZ3VX+Yx8kcJ76e7g
   bBvpPr553UBrD3MMfDus8XNOfQel07NdXVxj/KRD+Ae7lexW+Kt+FuviR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="336446615"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="336446615"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 06:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="683880910"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="683880910"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Mar 2023 06:46:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pecJp-000Bx6-0f;
	Tue, 21 Mar 2023 13:46:29 +0000
Date: Tue, 21 Mar 2023 21:45:54 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Weinberger <richard@nod.at>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 9755/9999] arch/um/drivers/virt-pci.c:644:9:
 error: implicit declaration of function 'virtio_reset_device'; did you mean
 'virtio_break_device'?
Message-ID: <202303212122.Ul6ebort-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   8020ae3c051d1c9ec7b7a872e226f9720547649b
commit: a27e95a6ff3fd633422ca44c6d571ef84392f5b8 [9755/9999] um: virt-pci: properly remove PCI device from bus
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230321/202303212122.Ul6ebort-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303212122.Ul6ebort-lkp@intel.com/

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
