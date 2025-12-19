Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8972D0C82
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766187686; cv=none; b=uhidjUWeVNEDe6H3VPLKNDM0UcEqGDnV5Pai3bsIG9mJIoysA6iiRTR1xmVQgXRm0F/i8Joei59qcR13BXz7lSy5FtM2+yzHECpFLaGLRDwZQM1Fu+nCVbF/8e2wjRGrAjxfpvbx3RRsn4Imb4/K3AREqQbvQOoEgSBKQD4L+i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766187686; c=relaxed/simple;
	bh=p3BACsqu533pqlqByNI08nMv9yxFfrTMZgNZENAjfd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IMf/8OpgGDeuULlV1Jy3kblvHzeYhnX9hBveGINM+r+MPHGRX4jmiDSv0zB4/PP1FH+/NE+xtukl6xG0EdhXitAZfTuFt5/4/qhaLP66bKHQXb7fG9X+AvT8as3Z06eAvdZ1eg45UtqgtymFYuSInRAJFrqcsYvA6juc+Uwuz2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWuxcA5f; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWuxcA5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766187684; x=1797723684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p3BACsqu533pqlqByNI08nMv9yxFfrTMZgNZENAjfd8=;
  b=aWuxcA5fOSXHbzt0zkwzX1bsP3TxSX0rNFATRaBi1My/OuvdzUIeMfCo
   0d35wcMDRkrlrBFyKt+sdMaCuIJ45I8xx1cDhbrqX0q1h9j2x3USkxKZn
   mPlDcto4HU9CCOWqgmo5nPb+dH6hrU6pUSrpn0ifE4sJwraTqKcuY5gUL
   S1LPXcGlhqTydZXEfpU4kSe4QcK/IjkLzJBoE7tKHCeGClfvoZtGEn3zX
   ZgP7WuiAjdo+kERbOdsrF6eXVzS+iLCi0wenBmk6Ks1igFrEx7Y594qnX
   FjftjcUZ7R6RpyOy/6qobilRl7+bswD5DIpvP1kbyPu6LNfav7AMCrH5P
   g==;
X-CSE-ConnectionGUID: dOSivSZcQCu006nKTpTjww==
X-CSE-MsgGUID: dDwYk9QITyCmDS2UZZvNcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68228614"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="68228614"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 15:41:23 -0800
X-CSE-ConnectionGUID: HK8Ckdy3Q2yUz2NQjN/Vkg==
X-CSE-MsgGUID: C54ZnmLNRneHmkhTOBFBMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198896702"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Dec 2025 15:41:23 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWk64-0000000047L-2kwz;
	Fri, 19 Dec 2025 23:41:20 +0000
Date: Sat, 20 Dec 2025 07:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] drivers/base/platform-msi.c:443:
 warning: Function parameter or member 'domain' not described in
 'device_msi_free_irqs'
Message-ID: <202512200732.hvq0N5rk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   a9d28381f95a89bdcdd37365e033274ba5247458
commit: 9f29d1d568ddebc210f69708d9db71d52241f4d6 [0/1] platform-msi: Add device MSI infrastructure
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251220/202512200732.hvq0N5rk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200732.hvq0N5rk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200732.hvq0N5rk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/platform-msi.c:332: warning: Function parameter or member 'is_tree' not described in '__platform_msi_create_device_domain'
>> drivers/base/platform-msi.c:443: warning: Function parameter or member 'domain' not described in 'device_msi_free_irqs'
>> drivers/base/platform-msi.c:457: warning: Function parameter or member 'domain' not described in 'device_msi_alloc_irqs'
>> drivers/base/platform-msi.c:495: warning: Function parameter or member 'fn' not described in 'device_msi_create_irq_domain'
>> drivers/base/platform-msi.c:495: warning: Excess function parameter 'fwnode' description in 'device_msi_create_irq_domain'


vim +443 drivers/base/platform-msi.c

   435	
   436	/**
   437	 * device_msi_free_irqs - Free MSI interrupts assigned to  a device
   438	 * @dev:	Pointer to the device
   439	 *
   440	 * Frees the interrupt and the MSI descriptors.
   441	 */
   442	static void device_msi_free_irqs(struct irq_domain *domain, struct device *dev)
 > 443	{
   444		__msi_domain_free_irqs(domain, dev);
   445		device_msi_free_msi_entries(dev);
   446	}
   447	
   448	/**
   449	 * device_msi_alloc_irqs - Allocate MSI interrupts for a device
   450	 * @dev:	Pointer to the device
   451	 * @nvec:	Number of vectors
   452	 *
   453	 * Allocates the required number of MSI descriptors and the corresponding
   454	 * interrupt descriptors.
   455	 */
   456	static int device_msi_alloc_irqs(struct irq_domain *domain, struct device *dev, int nvec)
 > 457	{
   458		int i, ret = -ENOMEM;
   459	
   460		for (i = 0; i < nvec; i++) {
   461			struct msi_desc *entry = alloc_msi_entry(dev, 1, NULL);
   462	
   463			if (!entry)
   464				goto fail;
   465			list_add_tail(&entry->list, dev_to_msi_list(dev));
   466		}
   467	
   468		ret = __msi_domain_alloc_irqs(domain, dev, nvec);
   469		if (!ret)
   470			return 0;
   471	fail:
   472		device_msi_free_msi_entries(dev);
   473		return ret;
   474	}
   475	
   476	static void device_msi_update_dom_ops(struct msi_domain_info *info)
   477	{
   478		if (!info->ops->domain_alloc_irqs)
   479			info->ops->domain_alloc_irqs = device_msi_alloc_irqs;
   480		if (!info->ops->domain_free_irqs)
   481			info->ops->domain_free_irqs = device_msi_free_irqs;
   482		if (!info->ops->msi_prepare)
   483			info->ops->msi_prepare = arch_msi_prepare;
   484	}
   485	
   486	/**
   487	 * device_msi_create_msi_irq_domain - Create an irq domain for devices
   488	 * @fwnode:	Firmware node of the interrupt controller
   489	 * @info:	MSI domain info to configure the new domain
   490	 * @parent:	Parent domain
   491	 */
   492	struct irq_domain *device_msi_create_irq_domain(struct fwnode_handle *fn,
   493							struct msi_domain_info *info,
   494							struct irq_domain *parent)
 > 495	{
   496		struct irq_domain *domain;
   497	
   498		if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
   499			platform_msi_update_chip_ops(info);
   500	
   501		if (info->flags & MSI_FLAG_USE_DEF_DOM_OPS)
   502			device_msi_update_dom_ops(info);
   503	
   504		msi_domain_set_default_info_flags(info);
   505	
   506		domain = msi_create_irq_domain(fn, info, parent);
   507		if (domain)
   508			irq_domain_update_bus_token(domain, DOMAIN_BUS_DEVICE_MSI);
   509		return domain;
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
