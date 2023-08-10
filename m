Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCFE20FB3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 20:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691700564; x=1723236564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zBGdrSoc1Md8X+T+5xoQwI0nAh56JKG7n1vsPX1sRSs=;
  b=n7zNzTAzXiqcNsKISttBHhJ3Xy0Aw9cMhk2iu1lAkS5BnCRdoBPU0oi0
   JAT19n0qWrxRsZxHAS0mnyGskqq19lTdrZfsiqE1AdwCcWxs1v73QtdVZ
   G3J+QahufTjlnC6Lo+M1JhJzb0Uu+XAwju8DpuAr2iB/rv8lgPZRVkj9O
   BO9Mn1i3W0PRSAFbkhlqx9I8Ig3pCaUcrnbWlfIskWtObCTicspKI8KrI
   uV/ijWLLm34GiAJyk06sK1Ukfu6elORPz+jtyToPfRkuUQWLY2NX+M3ot
   Kb++qVdKEChKMi+IG6PzDsETPl9r5ZcBWQedGz5f1vH/giddzsf4U3JOA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361657519"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="361657519"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 13:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="732422552"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="732422552"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Aug 2023 13:49:19 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUCas-0007FF-2w;
	Thu, 10 Aug 2023 20:49:18 +0000
Date: Fri, 11 Aug 2023 04:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Weinberger <richard@nod.at>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 7034/9999] arch/um/drivers/virt-pci.c:644:9:
 error: implicit declaration of function 'virtio_reset_device'; did you mean
 'virtio_break_device'?
Message-ID: <202308110449.qW2xJlCq-lkp@intel.com>
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
head:   c275eaaaa34260e6c907bc5e7ee07c096bc45064
commit: a27e95a6ff3fd633422ca44c6d571ef84392f5b8 [7034/9999] um: virt-pci: properly remove PCI device from bus
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230811/202308110449.qW2xJlCq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110449.qW2xJlCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110449.qW2xJlCq-lkp@intel.com/

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
