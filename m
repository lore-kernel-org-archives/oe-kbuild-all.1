Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6957882D98
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 03:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731469217; cv=none; b=eb1ato6PAjQRby2gxDuPVS/P/5H+gZhOu6RuEoLIXfX23rBZjc8Os0ETc5kRK1lhdIzzooctEtvRKbDAj/nbVnIxP0ta+7W5KN0oFBhaHWIlUfvCAXQfddBeJXbn29ZH10RuZVMEcOtFvJNDNYOabi9NiyKug/BaXNAD1OlsACk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731469217; c=relaxed/simple;
	bh=D7V9gF5Lga9ELDlrnbuv96Bq1VbNSZUbIgtD+5/MQy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SNzvRLrUw2cJstadHqcxkRRMM98OHS/B96g4zxsMBw7WCauGKCu9tLVOmGpPioVdyR9FNGlpNF4XUXfnIO7qW2yfnDtv3XQp2udbwdLhHEGOaUf9S5S98CEnn4eHyWtgdVANZPrNcgw7PawG2gL2DOAc58QTVlb6TUz7rFS8K8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1bVQpUz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1bVQpUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731469216; x=1763005216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7V9gF5Lga9ELDlrnbuv96Bq1VbNSZUbIgtD+5/MQy0=;
  b=f1bVQpUzG9rCNCo4L72f8aM+izdC3i7xoHTq836svcQMu6M7Aejz3CaA
   0xF2uXGJT+LiKsSEGQr/ujE+t2gNZPXDdf9lJ4L33Ofk3VqUp7usg9MFI
   7RrBPFDcdFe859DXOq2flJnlKBLi40dC90Pqjh8XU/Rwbl9dyzUkOMxS8
   YHiJ5I0bbkwaFOYAdH1EbAoG7ZQA6KaXfqX0jbtIJh6FlArDp6z3GT0VK
   aj0B+vUUYMjbDjgVLnEe0JoISAkb2kdX/7EAm6woNFbQyvPZ8MmiWUeH5
   8HJQM9Bc7GTMVJvve7FOEN9qmkuPSbYBHKuZm8mYu9Y0D4OtXIPsTywoP
   Q==;
X-CSE-ConnectionGUID: mIsO391CTseWQmn1GKyiNQ==
X-CSE-MsgGUID: JrhgO+KxSt26svsv1LB5fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42459156"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42459156"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 19:40:15 -0800
X-CSE-ConnectionGUID: iZF+I2/SRLmZcMqgbvbaKQ==
X-CSE-MsgGUID: IncL898KRWWj64QEGnQ2lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="88125387"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2024 19:40:13 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB4El-000022-2b;
	Wed, 13 Nov 2024 03:40:11 +0000
Date: Wed, 13 Nov 2024 11:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg 9/11] drivers/virtio/virtio_msg_ffa.c:275:15:
 error: no member named 'dma_ops' in 'struct device'
Message-ID: <202411131101.ikvhzAnR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg
head:   35f2209e839886e0462f56dbce8ca7b55d45ee79
commit: a13985c7651d364cf90f1869cff2ad678352d933 [9/11] virtio: msg: Add DMA OPs support
config: arm64-randconfig-r073-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131101.ikvhzAnR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131101.ikvhzAnR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131101.ikvhzAnR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_msg_ffa.c:20:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio_msg_ffa.c:275:15: error: no member named 'dma_ops' in 'struct device'
     275 |         ffa_dev->dev.dma_ops = &virtio_msg_dma_ops;
         |         ~~~~~~~~~~~~ ^
   4 warnings and 1 error generated.


vim +275 drivers/virtio/virtio_msg_ffa.c

   252	
   253	static int virtio_msg_ffa_probe(struct ffa_device *ffa_dev)
   254	{
   255		struct virtio_msg_ffa_device *vmfdev;
   256		struct device *dev = &ffa_dev->dev;
   257		struct virtio_msg_device *vmdev;
   258		u64 features, count;
   259		int ret, i;
   260	
   261		vmfdev = devm_kzalloc(dev, sizeof(*vmfdev), GFP_KERNEL);
   262		if (!vmfdev)
   263			return -ENOMEM;
   264	
   265		ffa_dev->ops->msg_ops->mode_32bit_set(ffa_dev);
   266	
   267		ida_init(&vmfdev->area_id_map);
   268	
   269		vmfdev->ffa_dev = ffa_dev;
   270		INIT_LIST_HEAD(&vmfdev->area_list);
   271		mutex_init(&vmfdev->lock);
   272	
   273		/* Set DMA OPs for the channel bus device */
   274	#if defined(CONFIG_VIRTIO_MSG_DMA_OPS)
 > 275		ffa_dev->dev.dma_ops = &virtio_msg_dma_ops;
   276	#endif
   277	
   278		ret = vmsg_ffa_bus_activate(vmfdev, &features, &count);
   279		if (ret)
   280			goto ida_free;
   281	
   282		/* We only support direct messages for now */
   283		if (!(features & VIRTIO_MSG_FFA_FEATURE_DIRECT_MSG_SUPP)) {
   284			ret = -ENODEV;
   285			goto out;
   286		}
   287	
   288		/* FIXME: Don't support indirect messages for now */
   289		features &= ~VIRTIO_MSG_FFA_FEATURE_INDIRECT_MSG_SUPP;
   290	
   291		if (!count) {
   292			ret = -ENODEV;
   293			goto out;
   294		}
   295	
   296		ret = vmsg_ffa_bus_configure(vmfdev, features);
   297		if (ret)
   298			goto out;
   299	
   300		vmfdev->vmdevs = devm_kcalloc(dev, count, sizeof(*vmfdev->vmdevs), GFP_KERNEL);
   301		if (!vmfdev->vmdevs) {
   302			ret = -ENOMEM;
   303			goto out;
   304		}
   305	
   306		for (i = 0; i < count; i++) {
   307			vmdev = &vmfdev->vmdevs[i];
   308			vmdev->dev_id = i;
   309			vmdev->ops = &vmf_ops;
   310			vmdev->vdev.dev.parent = &ffa_dev->dev;
   311			vmdev->priv = vmfdev;
   312	
   313			/*
   314			 * Register all virtio devices, they will fetch their ids and
   315			 * register the right device type.
   316			 */
   317			ret = virtio_msg_register(vmdev);
   318			if (ret)
   319				pr_err("Failed to register virtio msg device with id: %d\n", i);
   320		}
   321	
   322		ffa_dev_set_drvdata(ffa_dev, vmfdev);
   323		return 0;
   324	
   325	out:
   326		vmsg_ffa_bus_deactivate(vmfdev);
   327	ida_free:
   328		ida_destroy(&vmfdev->area_id_map);
   329		return ret;
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
