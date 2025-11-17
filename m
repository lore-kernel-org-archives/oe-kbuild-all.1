Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72C133F8DF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 20:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763411063; cv=none; b=o51uFOYwUdUeOxQpVxl1myfcAR53vYBBkQ8397wic/1JIdpwRhAq9XDfG8u11FKiETsttEuLYt44J2O9+l6fcLc+rCwNoA2MSZ0ZFxBZGFQLV40wvplk3uD53sFFJw7lk/I9cVsLbz4N0Gf5zWkQw8Tcpe4PocL2Penwnv5RjcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763411063; c=relaxed/simple;
	bh=FSdiBL32n+PqkuBEIRBYinSRRODZcfzThZ9CP466Ivo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOfj3lCEtBN6kwc7WYHQD2H3NonsBb8+szT63AToSiscLtI5VkUxkE2qmzvUKhAqKY8gLScRgtgbm+e01HuHVM2DvkOqtdCEiBDKBONvCK66kOiNf1dTdczY1V6vbsmKXpfliWdK1fRaXXhnf8KZ1Bed8uu+5HC76UAgTcXggks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJPEXeq0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJPEXeq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763411049; x=1794947049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FSdiBL32n+PqkuBEIRBYinSRRODZcfzThZ9CP466Ivo=;
  b=hJPEXeq0hyBu5/wOmsDnbzFvC5VeZcLIvET5cV/8HJ8Q96haRArSIhvw
   15369K/HWy5rlMEfk7+giE1NAinqq+0oiNDkDq45sKAuZ79s3nwBH9quP
   Hf20kp77rx+aiRzgd0DKULq4OQL0n/EtPuPwkwmE6enCogzGFyq52v4Fz
   xZutQ72R8js08tI5qDFVRXVjP8c1r5YZrRxy9JukYNAlCQ3F3X7dNUYmT
   v9Jotu9qvj4tFku4tk9AmQ5xB+fI2podPVXEomVOYwXuPpCuxdxwTiMlD
   U0pmLzVvv1xiYDTMz6+ndPcAaneR24qlMq1byWlTJEQpz/dSubIIm4GkB
   w==;
X-CSE-ConnectionGUID: b+RlTF73QFO+rJvchB8jOw==
X-CSE-MsgGUID: g9oXi5PZToaChREL93iRUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76775664"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="76775664"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 12:23:48 -0800
X-CSE-ConnectionGUID: in54vJtNSCOVGQhpDq297g==
X-CSE-MsgGUID: S0J/vXy2SzKyJ5J9/cpdaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="195479491"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2025 12:23:47 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL5lI-00011v-1y;
	Mon, 17 Nov 2025 20:23:44 +0000
Date: Tue, 18 Nov 2025 04:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3214/3214]
 drivers/crypto/ccp/hygon/ccp-mdev.c:895:17: error: no member named
 'numa_node' in 'struct device'
Message-ID: <202511180451.SpjYxpJv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   17cadcdf512f891675c3c9df62bcf05511293ae9
commit: 592817a30ddc0ef43c7f5b5fe906ae37cf3bea3b [3214/3214] crypto: ccp: add ccp-mdev functionality to the ccp module.
config: x86_64-buildonly-randconfig-005-20251118 (https://download.01.org/0day-ci/archive/20251118/202511180451.SpjYxpJv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180451.SpjYxpJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180451.SpjYxpJv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/ccp-mdev.c:895:17: error: no member named 'numa_node' in 'struct device'
     895 |                 if (pdev->dev.numa_node >= 0)
         |                     ~~~~~~~~~ ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:896:31: error: no member named 'numa_node' in 'struct device'
     896 |                         addr.numa_node = pdev->dev.numa_node;
         |                                          ~~~~~~~~~ ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:1144:15: warning: no previous prototype for function 'ccp_pin_memory' [-Wmissing-prototypes]
    1144 | struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
         |               ^
   drivers/crypto/ccp/hygon/ccp-mdev.c:1144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1144 | struct page **ccp_pin_memory(struct ccp_private *private, unsigned long uaddr,
         | ^
         | static 
   drivers/crypto/ccp/hygon/ccp-mdev.c:1542:54: error: no member named 'numa_node' in 'struct device'
    1542 |         numa_node = ccp_mdev_data.iommu[page_idx].pdev->dev.numa_node;
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   1 warning and 3 errors generated.


vim +895 drivers/crypto/ccp/hygon/ccp-mdev.c

   720	
   721	static long ccp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
   722	{
   723		struct mdev_state *mdev_state = file->private_data;
   724		unsigned long minsz;
   725		int ret = 0;
   726	
   727		switch (cmd) {
   728		case VFIO_DEVICE_GET_INFO:
   729		{
   730			struct vfio_device_info info;
   731	
   732			minsz = offsetofend(struct vfio_device_info, num_irqs);
   733	
   734			if (copy_from_user(&info, (void __user *)arg, minsz))
   735				return -EFAULT;
   736	
   737			if (info.argsz < minsz)
   738				return -EINVAL;
   739	
   740			ret = ccp_get_device_info(mdev_state, &info);
   741			if (ret)
   742				return ret;
   743	
   744			memcpy(&mdev_state->dev_info, &info, sizeof(info));
   745	
   746			if (copy_to_user((void __user *)arg, &info, minsz))
   747				return -EFAULT;
   748	
   749			return 0;
   750		}
   751		case VFIO_DEVICE_GET_REGION_INFO:
   752		{
   753			struct vfio_region_info info;
   754			u16 cap_type_id = 0;
   755			void *cap_type = NULL;
   756	
   757			minsz = offsetofend(struct vfio_region_info, offset);
   758	
   759			if (copy_from_user(&info, (void __user *)arg, minsz))
   760				return -EFAULT;
   761	
   762			if (info.argsz < minsz)
   763				return -EINVAL;
   764	
   765			ret = ccp_get_region_info(mdev_state, &info, &cap_type_id,
   766						   &cap_type);
   767			if (ret)
   768				return ret;
   769	
   770			if (copy_to_user((void __user *)arg, &info, minsz))
   771				return -EFAULT;
   772	
   773			return 0;
   774		}
   775		case VFIO_DEVICE_GET_IRQ_INFO:
   776		{
   777			struct vfio_irq_info info;
   778	
   779			minsz = offsetofend(struct vfio_irq_info, count);
   780	
   781			if (copy_from_user(&info, (void __user *)arg, minsz))
   782				return -EFAULT;
   783	
   784			if ((info.argsz < minsz) ||
   785			    (info.index >= mdev_state->dev_info.num_irqs))
   786				return -EINVAL;
   787	
   788			ret = ccp_get_irq_info(mdev_state, &info);
   789			if (ret)
   790				return ret;
   791	
   792			if (copy_to_user((void __user *)arg, &info, minsz))
   793				return -EFAULT;
   794	
   795			return 0;
   796		}
   797		case VFIO_DEVICE_SET_IRQS:
   798		{
   799			struct vfio_irq_set hdr;
   800			u8 *data = NULL;
   801			size_t data_size = 0;
   802	
   803			minsz = offsetofend(struct vfio_irq_set, count);
   804	
   805			if (copy_from_user(&hdr, (void __user *)arg, minsz))
   806				return -EFAULT;
   807	
   808			ret = ccp_set_irqs_validate_and_prepare(&hdr, mdev_state->dev_info.num_irqs,
   809					mdev_state->dev_info.num_irqs, &data_size);
   810			if (ret)
   811				return ret;
   812	
   813			if (data_size) {
   814				data = memdup_user((void __user *)(arg + minsz), data_size);
   815				if (IS_ERR(data))
   816					return PTR_ERR(data);
   817			}
   818	
   819			mutex_lock(&mdev_state->ops_lock);
   820			ret = ccp_set_irq_efds(mdev_state, &hdr, data);
   821			mutex_unlock(&mdev_state->ops_lock);
   822			kfree(data);
   823	
   824			return ret;
   825		}
   826		case VFIO_DEVICE_CCP_SET_MODE:
   827		{
   828			struct hygon_ccp_dev_wrapper *ccp_wrapper = mdev_state->iommu->wrapper;
   829			unsigned long flags;
   830	
   831			if (!write_trylock_irqsave(&ccp_wrapper->q_lock, flags))
   832				return -EAGAIN;
   833	
   834			if (ccp_wrapper->used_mode == arg) {
   835				write_unlock_irqrestore(&ccp_wrapper->q_lock, flags);
   836				return 0;
   837			}
   838	
   839			switch (arg) {
   840			case _KERNEL_SPACE_USED:
   841				ccp_wrapper->used_mode = _KERNEL_SPACE_USED;
   842				ccp_dev_iommu_detach_device(ccp_wrapper->pdev);
   843				ccp_dev_queue_switch(ccp_wrapper->cdev);
   844				ccp_add_device(ccp_wrapper->cdev);
   845				break;
   846			case _USER_SPACE_USED:
   847				if (ccp_wrapper->del_flag == 0) {
   848					ccp_del_device(ccp_wrapper->cdev);
   849					ccp_wrapper->del_flag = 1;
   850				}
   851				if (ccp_dev_kernel_mode_used_state(ccp_wrapper->cdev)) {
   852					ret = -EAGAIN;
   853					break;
   854				}
   855				if (ccp_dev_iommu_attach_device(ccp_wrapper->pdev)) {
   856					ccp_add_device(ccp_wrapper->cdev);
   857					ccp_wrapper->del_flag = 0;
   858					ret = -EINVAL;
   859				} else {
   860					ccp_wrapper->used_mode = _USER_SPACE_USED;
   861					ccp_ectx_list_init(ccp_wrapper);
   862					ccp_dev_usermode_userid_clear(mdev_state->iommu->id);
   863				}
   864				break;
   865			default:
   866				pr_err("arg = %lu, invalid.\n", arg);
   867				ret = -EINVAL;
   868				break;
   869			}
   870	
   871			write_unlock_irqrestore(&ccp_wrapper->q_lock, flags);
   872			return ret;
   873		}
   874		case VFIO_DEVICE_CCP_GET_MODE:
   875		{
   876			struct hygon_ccp_dev_wrapper *ccp_wrapper = mdev_state->iommu->wrapper;
   877	
   878			if (put_user(ccp_wrapper->used_mode, (int __user *)arg))
   879				return -EFAULT;
   880	
   881			return 0;
   882		}
   883		case VFIO_DEVICE_GET_PCI_ADDR:
   884		{
   885			struct pci_dev *pdev = mdev_state->iommu->pdev;
   886			struct mccp_pci_addr addr;
   887	
   888			if (copy_from_user(&addr, (void __user *)arg, sizeof(addr)))
   889				return -EFAULT;
   890	
   891			addr.domain = pci_domain_nr(pdev->bus);
   892			addr.bus = pdev->bus->number;
   893			addr.devid = PCI_SLOT(pdev->devfn);
   894			addr.function = PCI_FUNC(pdev->devfn);
 > 895			if (pdev->dev.numa_node >= 0)
   896				addr.numa_node = pdev->dev.numa_node;
   897			else
   898				addr.numa_node = 0;
   899	
   900			if (copy_to_user((void __user *)arg, &addr, sizeof(addr)))
   901				return -EFAULT;
   902	
   903			return 0;
   904		}
   905		case VFIO_DEVICE_GET_PCI_ID:
   906		{
   907			struct pci_dev *pdev = mdev_state->iommu->pdev;
   908			struct mccp_pci_id pid;
   909	
   910			if (copy_from_user(&pid, (void __user *)arg, sizeof(pid)))
   911				return -EFAULT;
   912	
   913			pid.class = pdev->class;
   914			pid.vendor = pdev->vendor;
   915			pid.device = pdev->device;
   916			pid.subsystem_vendor = pdev->subsystem_vendor;
   917			pid.subsystem_device = pdev->subsystem_device;
   918	
   919			if (copy_to_user((void __user *)arg, &pid, sizeof(pid)))
   920				return -EFAULT;
   921	
   922			return 0;
   923		}
   924		case VFIO_DEVICE_RESET:
   925			return ccp_reset(mdev_state);
   926		}
   927		return -ENOTTY;
   928	}
   929	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
