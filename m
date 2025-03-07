Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777A4A21
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 00:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741308041; cv=none; b=MadD+pWwSZV9UR+3bGkIa1gweueuabgLas0sBgfiWiXscgVtXFcQKX/TLag5XifO9RUSy1vofscuSvvVkVf0wQNSInaxcUaW7OOMzgNEbYG+7ojq4P7hVEAMwooBP0Q7tIDoT6xiQUpbls+zTOF9oCAZEhOsaZY5Hr6RtAXZiD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741308041; c=relaxed/simple;
	bh=NfgxRj1Cbo6JDk2f6F9mSiQjy9GXBlDrwjtoogeT0PM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8TiKGsateC9CDhOEvmtOQowOKppWaPNtaeQjSulFck0S6LnLwQ1qgBqbu3SU7uUtOsSqTGWzjJ54uZJkZvhZkiV7rCSTHqvlJlK6nGey0BQI4xx0DhtzGdkRCBmJ3X8gmofU1r0dkV1NULABkXsXzKlnx3PBfYalovLsVhVs/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdJt3o5H; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdJt3o5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741308038; x=1772844038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NfgxRj1Cbo6JDk2f6F9mSiQjy9GXBlDrwjtoogeT0PM=;
  b=BdJt3o5H9zXdp5iaPfJt5M94o7XcmU4EOPRPrqP+7C1OsyWJ2zaXq9l3
   UdZUOFgsxxyLYRFuUyT1qk/Rpfz2AIaE/Wx4LCc+TiBPrgxIBqA81ICzP
   I0Ki8nH3hUm2kysURxE+I0rdR35yEcOSAUmfGoh8YRa8yKpumqPeuK9v7
   aKY/dn3oaZlYVEcUsllQcHdl263Wz0l/rbxAxlAHwO2XiNxFMlbrMzjhy
   tkP3UL8zlZhSEzb3AguEe7kTboll9LyQpCRkzRTFWH6U7WRwDP7zTbtTp
   Ud95VfGWjcdTHIdOoPAg0f1ZrqGn2z5Q4Qf6UZjc3ZDk7VPP6UDKjwos2
   A==;
X-CSE-ConnectionGUID: h1a01BTMSZiK6XEihtWVtQ==
X-CSE-MsgGUID: d4MnA0B9Rai2INXUJq8Vyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67723156"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="67723156"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 16:40:37 -0800
X-CSE-ConnectionGUID: /G1pqedyS0WxxvnfRzZx5Q==
X-CSE-MsgGUID: DGnACjyzTE65TEElAj7qmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="124206975"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2025 16:40:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqLlR-000Nox-2j;
	Fri, 07 Mar 2025 00:40:33 +0000
Date: Fri, 7 Mar 2025 08:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 8/21]
 drivers/virtio/virtio_msg_ffa.c:505:12: error: 'struct device' has no member
 named 'dma_ops'
Message-ID: <202503070847.KkzbHdYJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   c730e1395f647d9d1fa33df71071563ab13c599d
commit: 3032fa7b7ae34a2856d6ce07f856de82242bb2b5 [8/21] virtio-msg: Add DMA OPs support
config: arm64-randconfig-r122-20250306 (https://download.01.org/0day-ci/archive/20250307/202503070847.KkzbHdYJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250307/202503070847.KkzbHdYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070847.KkzbHdYJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_msg_ffa.c: In function 'virtio_msg_ffa_probe':
>> drivers/virtio/virtio_msg_ffa.c:505:12: error: 'struct device' has no member named 'dma_ops'
     505 |         dev->dma_ops = &virtio_msg_ffa_dma_ops;
         |            ^~
--
   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from include/linux/dma-map-ops.h:9,
                    from drivers/virtio/virtio_msg_ffa_dma_ops.c:16:
   drivers/virtio/virtio_msg_ffa_dma_ops.c: In function 'virtio_msg_dma_ops_init':
>> drivers/virtio/virtio_msg_ffa_dma_ops.c:181:28: error: 'struct device' has no member named 'dma_ops'
     181 |         if (dev->dev.parent->dma_ops)
         |                            ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/virtio/virtio_msg_ffa_dma_ops.c:181:9: note: in expansion of macro 'if'
     181 |         if (dev->dev.parent->dma_ops)
         |         ^~
>> drivers/virtio/virtio_msg_ffa_dma_ops.c:181:28: error: 'struct device' has no member named 'dma_ops'
     181 |         if (dev->dev.parent->dma_ops)
         |                            ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/virtio/virtio_msg_ffa_dma_ops.c:181:9: note: in expansion of macro 'if'
     181 |         if (dev->dev.parent->dma_ops)
         |         ^~
>> drivers/virtio/virtio_msg_ffa_dma_ops.c:181:28: error: 'struct device' has no member named 'dma_ops'
     181 |         if (dev->dev.parent->dma_ops)
         |                            ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/virtio/virtio_msg_ffa_dma_ops.c:181:9: note: in expansion of macro 'if'
     181 |         if (dev->dev.parent->dma_ops)
         |         ^~


vim +505 drivers/virtio/virtio_msg_ffa.c

   472	
   473	static int virtio_msg_ffa_probe(struct ffa_device *ffa_dev)
   474	{
   475		struct virtio_msg_ffa_device *vmfdev;
   476		struct device *dev = &ffa_dev->dev;
   477		struct virtio_msg_device *vmdev;
   478		u64 features, count;
   479		int ret, i;
   480	
   481		vmfdev = devm_kzalloc(dev, sizeof(*vmfdev), GFP_KERNEL);
   482		if (!vmfdev)
   483			return -ENOMEM;
   484	
   485		ida_init(&vmfdev->area_id_map);
   486	
   487		vmfdev->indirect = false;
   488		vmfdev->ffa_dev = ffa_dev;
   489		ffa_dev_set_drvdata(ffa_dev, vmfdev);
   490		INIT_LIST_HEAD(&vmfdev->area_list);
   491		virtio_msg_async_init(&vmfdev->async);
   492		mutex_init(&vmfdev->lock);
   493	
   494		ret = dma_set_mask_and_coherent(&ffa_dev->dev, DMA_BIT_MASK(64));
   495		if (ret)
   496			ret = dma_set_mask_and_coherent(&ffa_dev->dev, DMA_BIT_MASK(32));
   497		if (ret)
   498			dev_warn(&ffa_dev->dev, "Failed to enable 64-bit or 32-bit DMA\n");
   499	
   500		/* Setup notifier for async (indirect) messages */
   501		vmsg_ffa_indirect_notify_setup(vmfdev);
   502	
   503		/* Set DMA OPs for the channel bus device */
   504	#ifdef CONFIG_VIRTIO_MSG_FFA_DMA_OPS
 > 505		dev->dma_ops = &virtio_msg_ffa_dma_ops;
   506	#endif
   507	
   508		ret = vmsg_ffa_bus_activate(vmfdev, &features, &count);
   509		if (ret)
   510			goto ida_free;
   511	
   512		if (!count) {
   513			ret = -ENODEV;
   514			goto deactivate;
   515		}
   516	
   517		/* Direct message must be supported if it already worked */
   518		if (!vmfdev->indirect && !(features & VIRTIO_MSG_FFA_FEATURE_DIRECT_MSG_SUPP)) {
   519			ret = -EINVAL;
   520			goto deactivate;
   521		}
   522	
   523		/* In-direct message must be supported if it already worked */
   524		if (vmfdev->indirect && !(features & VIRTIO_MSG_FFA_FEATURE_INDIRECT_MSG_SUPP)) {
   525			ret = -EINVAL;
   526			goto deactivate;
   527		}
   528	
   529		ret = vmsg_ffa_bus_configure(vmfdev, features);
   530		if (ret)
   531			goto deactivate;
   532	
   533		vmfdev->vmdevs = devm_kcalloc(dev, count, sizeof(*vmfdev->vmdevs), GFP_KERNEL);
   534		if (!vmfdev->vmdevs) {
   535			ret = -ENOMEM;
   536			goto deactivate;
   537		}
   538		vmfdev->vmdev_count = count;
   539	
   540		for (i = 0; i < count; i++) {
   541			vmdev = &vmfdev->vmdevs[i];
   542			vmdev->dev_id = i;
   543			vmdev->ops = &vmf_ops;
   544			vmdev->vdev.dev.parent = &ffa_dev->dev;
   545			vmdev->priv = vmfdev;
   546	
   547			/*
   548			 * Register all virtio devices, they will fetch their ids and
   549			 * register the right device type.
   550			 */
   551			ret = virtio_msg_register(vmdev);
   552			if (ret) {
   553				dev_err(&ffa_dev->dev, "Failed to register virtio msg device with id: %d\n", i);
   554				goto unregister;
   555			}
   556		}
   557	
   558		return 0;
   559	
   560	unregister:
   561		remove_vmdevs(vmfdev, i);
   562	deactivate:
   563		vmsg_ffa_bus_error(vmfdev);
   564		vmsg_ffa_bus_deactivate(vmfdev);
   565	ida_free:
   566		ida_destroy(&vmfdev->area_id_map);
   567		return ret;
   568	}
   569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
