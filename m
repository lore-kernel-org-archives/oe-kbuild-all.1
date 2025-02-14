Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C818B460
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 19:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739559664; cv=none; b=t+VYn47ypWVwsUfRw0s8qHcFMFay9DUMd5alsFUYkJMtesWOjMpOUI738sMJHoh3KSGb8LQcEJ/pv+PJk5tz+VlSxEtTruxQQIVI55U1JIqbWVPgJHB1dxOkYI1rGj5jdoeq9uEzbdFjvItLcpD+EnMtFZ1JAx46Tvam5bg/H5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739559664; c=relaxed/simple;
	bh=cU0MHEay6KFR5Od42iLKz/HpHXvk8D5jwygZObjEaoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpESMlJtJMzFA+DzXgjeV2ccFbhVrQqa2N1mWFrZ6PafYUQai2is9Nr4BhU8OaKrhVSQbJ0a1z8HXIX5RAoVaqCzHfrM6dZgdTrhWQtDQ+rdaRUIhjk5c184DSTsAeYxYE5i7ME5Ed9TrZkTvRQWi09MWog7lsUanVSkHjlOLIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYprq4ig; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYprq4ig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739559662; x=1771095662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cU0MHEay6KFR5Od42iLKz/HpHXvk8D5jwygZObjEaoM=;
  b=RYprq4igbzhGbE/fhtNOAHsmwVELZdaFjF/1vg6XUsifzColNX3QaDKy
   Hsm1T+cvrJEEDQGz3J6eLOx0o8sXQCt4HPEwPfggoxTSRVEOlbAWSZ4mR
   z+1pnOg2T9F84vm0yMx3p+TTJiin5GP9GAfD59D2WucGDUdzriP7xiNEB
   xHGBMo4dFzN3xImxmfAFlSxI1FfMMiPiVpY8Kf/KkraIv4zf8O58YyEVE
   re23cr9bFlRJ6WAHUX0S01ltau+U/JDzGubX4HuOwTbpFsklSNGnc24b1
   dT7RpFL0SrJmy+kNpHRxDUu3Rgsgf8hf4CjpWVdjBij+uPOUKp/JJJ8PR
   w==;
X-CSE-ConnectionGUID: 7EJngmAaSSGv9OEBxhTOuQ==
X-CSE-MsgGUID: Hbgx49FhTAWSF6Fo7wpfHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="43155830"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="43155830"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 11:01:02 -0800
X-CSE-ConnectionGUID: reRBTS5VRMKY2aqdDDoBTg==
X-CSE-MsgGUID: NU3KRZSVRoK5hJYwUFy+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118158872"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Feb 2025 11:01:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj0vq-001A3s-1L;
	Fri, 14 Feb 2025 19:00:58 +0000
Date: Sat, 15 Feb 2025 03:00:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3436/4011] drivers/gpio/gpiolib.c:4859:61:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202502150214.5Pptr2Jt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ae0fa3bf0b44c8611d114a9f69985bf451010c3
commit: e47a75fb5b139233bdbb889995edda4dffc3f0f7 [3436/4011] gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set
config: m68k-randconfig-r133-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150214.5Pptr2Jt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250215/202502150214.5Pptr2Jt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150214.5Pptr2Jt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpiolib.c:4859:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct gpio_chip *gc @@     got struct gpio_chip [noderef] __rcu *chip @@
   drivers/gpio/gpiolib.c:4859:61: sparse:     expected struct gpio_chip *gc
   drivers/gpio/gpiolib.c:4859:61: sparse:     got struct gpio_chip [noderef] __rcu *chip
   drivers/gpio/gpiolib.c:4861:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct gpio_chip *gc @@     got struct gpio_chip [noderef] __rcu *chip @@
   drivers/gpio/gpiolib.c:4861:62: sparse:     expected struct gpio_chip *gc
   drivers/gpio/gpiolib.c:4861:62: sparse:     got struct gpio_chip [noderef] __rcu *chip
   drivers/gpio/gpiolib.c:353:5: sparse: sparse: context imbalance in 'gpiod_get_direction' - different lock contexts for basic block
   drivers/gpio/gpiolib.c: note: in included file (through include/linux/resource_ext.h, include/linux/acpi.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/gpio/gpiolib.c:459:25: sparse: sparse: context imbalance in 'gpio_name_to_desc' - wrong count at exit
   drivers/gpio/gpiolib.c:858:9: sparse: sparse: context imbalance in 'gpiochip_setup_devs' - wrong count at exit
   drivers/gpio/gpiolib.c:1218:20: sparse: sparse: context imbalance in 'gpio_device_find' - wrong count at exit
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/gpio/gpiolib.c:2309:12: sparse: sparse: context imbalance in 'gpiod_request_commit' - wrong count at exit
   drivers/gpio/gpiolib.c:2410:9: sparse: sparse: context imbalance in 'gpiod_free_commit' - wrong count at exit
   drivers/gpio/gpiolib.c:2457:6: sparse: sparse: context imbalance in 'gpiochip_dup_line_label' - different lock contexts for basic block
   drivers/gpio/gpiolib.c:2561:5: sparse: sparse: context imbalance in 'gpio_do_set_config' - wrong count at exit
   drivers/gpio/gpiolib.c:2702:5: sparse: sparse: context imbalance in 'gpiod_direction_input_nonotify' - wrong count at exit
   drivers/gpio/gpiolib.c:2749:12: sparse: sparse: context imbalance in 'gpiod_direction_output_raw_commit' - wrong count at exit
   drivers/gpio/gpiolib.c:2919:5: sparse: sparse: context imbalance in 'gpiod_enable_hw_timestamp_ns' - different lock contexts for basic block
   drivers/gpio/gpiolib.c:2952:5: sparse: sparse: context imbalance in 'gpiod_disable_hw_timestamp_ns' - different lock contexts for basic block
   drivers/gpio/gpiolib.c:3108:12: sparse: sparse: context imbalance in 'gpiod_get_raw_value_commit' - wrong count at exit
   drivers/gpio/gpiolib.c:3151:13: sparse: sparse: context imbalance in 'gpio_device_chip_cmp' - wrong count at exit
   drivers/gpio/gpiolib.c:3158:5: sparse: sparse: context imbalance in 'gpiod_get_array_value_complex' - wrong count at exit
   drivers/gpio/gpiolib.c:3393:13: sparse: sparse: context imbalance in 'gpio_set_open_drain_value_commit' - wrong count at exit
   drivers/gpio/gpiolib.c:3420:13: sparse: sparse: context imbalance in 'gpio_set_open_source_value_commit' - wrong count at exit
   drivers/gpio/gpiolib.c:3442:13: sparse: sparse: context imbalance in 'gpiod_set_raw_value_commit' - wrong count at exit
   drivers/gpio/gpiolib.c:3478:5: sparse: sparse: context imbalance in 'gpiod_set_array_value_complex' - wrong count at exit
   drivers/gpio/gpiolib.c:3757:5: sparse: sparse: context imbalance in 'gpiod_to_irq' - different lock contexts for basic block
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/gpio/gpiolib.c:4703:5: sparse: sparse: context imbalance in 'gpiod_hog' - wrong count at exit
   drivers/gpio/gpiolib.c:5017:9: sparse: sparse: context imbalance in 'gpiolib_dbg_show' - different lock contexts for basic block
   drivers/gpio/gpiolib.c:5044:13: sparse: sparse: context imbalance in 'gpiolib_seq_start' - wrong count at exit
   drivers/gpio/gpiolib.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:357:9: sparse: sparse: context imbalance in 'gpiolib_seq_stop' - unexpected unlock
   drivers/gpio/gpiolib.c:5089:12: sparse: sparse: context imbalance in 'gpiolib_seq_show' - wrong count at exit

vim +4859 drivers/gpio/gpiolib.c

  4749	
  4750	/**
  4751	 * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
  4752	 * @dev:	GPIO consumer, can be NULL for system-global GPIOs
  4753	 * @con_id:	function within the GPIO consumer
  4754	 * @flags:	optional GPIO initialization flags
  4755	 *
  4756	 * This function acquires all the GPIOs defined under a given function.
  4757	 *
  4758	 * Returns:
  4759	 * The GPIO descriptors corresponding to the function @con_id of device
  4760	 * dev, -ENOENT if no GPIO has been assigned to the requested function,
  4761	 * or another IS_ERR() code if an error occurred while trying to acquire
  4762	 * the GPIOs.
  4763	 */
  4764	struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
  4765							const char *con_id,
  4766							enum gpiod_flags flags)
  4767	{
  4768		struct gpio_desc *desc;
  4769		struct gpio_descs *descs;
  4770		struct gpio_device *gdev;
  4771		struct gpio_array *array_info = NULL;
  4772		int count, bitmap_size;
  4773		size_t descs_size;
  4774	
  4775		count = gpiod_count(dev, con_id);
  4776		if (count < 0)
  4777			return ERR_PTR(count);
  4778	
  4779		descs_size = struct_size(descs, desc, count);
  4780		descs = kzalloc(descs_size, GFP_KERNEL);
  4781		if (!descs)
  4782			return ERR_PTR(-ENOMEM);
  4783	
  4784		for (descs->ndescs = 0; descs->ndescs < count; descs->ndescs++) {
  4785			desc = gpiod_get_index(dev, con_id, descs->ndescs, flags);
  4786			if (IS_ERR(desc)) {
  4787				gpiod_put_array(descs);
  4788				return ERR_CAST(desc);
  4789			}
  4790	
  4791			descs->desc[descs->ndescs] = desc;
  4792	
  4793			gdev = gpiod_to_gpio_device(desc);
  4794			/*
  4795			 * If pin hardware number of array member 0 is also 0, select
  4796			 * its chip as a candidate for fast bitmap processing path.
  4797			 */
  4798			if (descs->ndescs == 0 && gpio_chip_hwgpio(desc) == 0) {
  4799				struct gpio_descs *array;
  4800	
  4801				bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
  4802							    gdev->ngpio : count);
  4803	
  4804				array = krealloc(descs, descs_size +
  4805						 struct_size(array_info, invert_mask, 3 * bitmap_size),
  4806						 GFP_KERNEL | __GFP_ZERO);
  4807				if (!array) {
  4808					gpiod_put_array(descs);
  4809					return ERR_PTR(-ENOMEM);
  4810				}
  4811	
  4812				descs = array;
  4813	
  4814				array_info = (void *)descs + descs_size;
  4815				array_info->get_mask = array_info->invert_mask +
  4816							  bitmap_size;
  4817				array_info->set_mask = array_info->get_mask +
  4818							  bitmap_size;
  4819	
  4820				array_info->desc = descs->desc;
  4821				array_info->size = count;
  4822				array_info->gdev = gdev;
  4823				bitmap_set(array_info->get_mask, descs->ndescs,
  4824					   count - descs->ndescs);
  4825				bitmap_set(array_info->set_mask, descs->ndescs,
  4826					   count - descs->ndescs);
  4827				descs->info = array_info;
  4828			}
  4829	
  4830			/* If there is no cache for fast bitmap processing path, continue */
  4831			if (!array_info)
  4832				continue;
  4833	
  4834			/* Unmark array members which don't belong to the 'fast' chip */
  4835			if (array_info->gdev != gdev) {
  4836				__clear_bit(descs->ndescs, array_info->get_mask);
  4837				__clear_bit(descs->ndescs, array_info->set_mask);
  4838			}
  4839			/*
  4840			 * Detect array members which belong to the 'fast' chip
  4841			 * but their pins are not in hardware order.
  4842			 */
  4843			else if (gpio_chip_hwgpio(desc) != descs->ndescs) {
  4844				/*
  4845				 * Don't use fast path if all array members processed so
  4846				 * far belong to the same chip as this one but its pin
  4847				 * hardware number is different from its array index.
  4848				 */
  4849				if (bitmap_full(array_info->get_mask, descs->ndescs)) {
  4850					array_info = NULL;
  4851				} else {
  4852					__clear_bit(descs->ndescs,
  4853						    array_info->get_mask);
  4854					__clear_bit(descs->ndescs,
  4855						    array_info->set_mask);
  4856				}
  4857			} else {
  4858				/* Exclude open drain or open source from fast output */
> 4859				if (gpiochip_line_is_open_drain(gdev->chip,
  4860								descs->ndescs) ||
  4861				    gpiochip_line_is_open_source(gdev->chip,
  4862								 descs->ndescs))
  4863					__clear_bit(descs->ndescs,
  4864						    array_info->set_mask);
  4865				/* Identify 'fast' pins which require invertion */
  4866				if (gpiod_is_active_low(desc))
  4867					__set_bit(descs->ndescs,
  4868						  array_info->invert_mask);
  4869			}
  4870		}
  4871		if (array_info)
  4872			dev_dbg(dev,
  4873				"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
  4874				array_info->gdev->label, array_info->size,
  4875				*array_info->get_mask, *array_info->set_mask,
  4876				*array_info->invert_mask);
  4877		return descs;
  4878	}
  4879	EXPORT_SYMBOL_GPL(gpiod_get_array);
  4880	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
