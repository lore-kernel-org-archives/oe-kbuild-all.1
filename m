Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162B38DE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 17:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727199098; cv=none; b=BSmLkAWcom+hjviVFOihB5IVVB/Njy7MwZM6xdYyahPi9QXdLHTBLcd8bJXB/GjQUw36JSw/mFPqPpJXNPwp9AK73fRYNtIvRyr0sIhf3WHY0Ngzr1auza3tFD4wcVTHXs89ibM5BvG9T/4RQ6KH16WNh2KJCGOrZOHJje4KpuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727199098; c=relaxed/simple;
	bh=ykCL6qFmHbpaMIpBpoaLnAahBfITbukQ8FKmhEsyZq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gD6Tr1mtc0Yhd9PEahkjJG6jmIzCRayrcxMJJHtsU6YBfMeM2bbOgspQLCu1L2z/9VFAO7YKgRzLeuoCP9gOk1cKwVNhKhSqGW4OWH8UQhrUGMPnLtC4MJPl1L2z2tV1Q7l5RZUmibh8SPdOtiHh/VaZI7d2M7fvuJLbIaIxVQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/IL0JJ/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/IL0JJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727199096; x=1758735096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ykCL6qFmHbpaMIpBpoaLnAahBfITbukQ8FKmhEsyZq4=;
  b=m/IL0JJ/zOxucxtD7eLqeErpcrudaP1PEIiKhUQwD8MAo8hC/Ydcvn2i
   IgYZkc3fkfg9GIWT7goChCRSLXf000oUSKv0cu8tM3r2+KuArsBY1s+Si
   RqlSOHLTK9pkwhhzU1VOtazhyc1hTMGgll6BkOSgIrUi8BHIQe08w3Vg7
   ntJ4iMx06ArlsmNw1D4078rKkz8aa9dcFC3Yps0hiM8tgLG7um68w0Xm0
   ZuBV96fLOrOsMAy48fMoO6t/nl9psZzZ2uTQ/RElMdLP+EpjiKWSPZ5Uf
   q3XodSR65EtizsHhAgD5pnsK3dbZlwf63YE06vYao8VuAO5LVG9SOf5B2
   g==;
X-CSE-ConnectionGUID: GB/s+p4XS8ufP3uR+E0PRg==
X-CSE-MsgGUID: niTE+/k4SOaFYzBLoSe3XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30100574"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="30100574"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 10:31:35 -0700
X-CSE-ConnectionGUID: PiEnqg6KQVCTX6zJGXGzBg==
X-CSE-MsgGUID: smE7VfL3Seus2UUQCWZUPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="94820084"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Sep 2024 10:31:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st9Np-000Ie3-2H;
	Tue, 24 Sep 2024 17:31:29 +0000
Date: Wed, 25 Sep 2024 01:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1740/2441]
 drivers/base/platform-msi.c:443: warning: Function parameter or member
 'domain' not described in 'device_msi_free_irqs'
Message-ID: <202409250156.mkgsEOi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: e1e1af9d0928fcd0c3748fc9886348e332958f50 [1740/2441] platform-msi: Add device MSI infrastructure
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240925/202409250156.mkgsEOi2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250156.mkgsEOi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250156.mkgsEOi2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/platform-msi.c:332: warning: Function parameter or member 'is_tree' not described in '__platform_msi_create_device_domain'
   drivers/base/platform-msi.c:400: warning: Function parameter or member 'nr_irqs' not described in 'platform_msi_domain_alloc'
   drivers/base/platform-msi.c:400: warning: Excess function parameter 'nvec' description in 'platform_msi_domain_alloc'
>> drivers/base/platform-msi.c:443: warning: Function parameter or member 'domain' not described in 'device_msi_free_irqs'
>> drivers/base/platform-msi.c:457: warning: Function parameter or member 'domain' not described in 'device_msi_alloc_irqs'
>> drivers/base/platform-msi.c:495: warning: Function parameter or member 'fn' not described in 'device_msi_create_irq_domain'
>> drivers/base/platform-msi.c:495: warning: Excess function parameter 'fwnode' description in 'device_msi_create_irq_domain'


vim +443 drivers/base/platform-msi.c

   313	
   314	/**
   315	 * platform_msi_create_device_domain - Create a platform-msi domain
   316	 *
   317	 * @dev:		The device generating the MSIs
   318	 * @nvec:		The number of MSIs that need to be allocated
   319	 * @write_msi_msg:	Callback to write an interrupt message for @dev
   320	 * @ops:		The hierarchy domain operations to use
   321	 * @host_data:		Private data associated to this domain
   322	 *
   323	 * Returns an irqdomain for @nvec interrupts
   324	 */
   325	struct irq_domain *
   326	__platform_msi_create_device_domain(struct device *dev,
   327					    unsigned int nvec,
   328					    bool is_tree,
   329					    irq_write_msi_msg_t write_msi_msg,
   330					    const struct irq_domain_ops *ops,
   331					    void *host_data)
 > 332	{
   333		struct platform_msi_priv_data *data;
   334		struct irq_domain *domain;
   335		int err;
   336	
   337		data = platform_msi_alloc_priv_data(dev, nvec, write_msi_msg);
   338		if (IS_ERR(data))
   339			return NULL;
   340	
   341		data->host_data = host_data;
   342		domain = irq_domain_create_hierarchy(dev->msi_domain, 0,
   343						     is_tree ? 0 : nvec,
   344						     dev->fwnode, ops, data);
   345		if (!domain)
   346			goto free_priv;
   347	
   348		err = msi_domain_prepare_irqs(domain->parent, dev, nvec, &data->arg);
   349		if (err)
   350			goto free_domain;
   351	
   352		return domain;
   353	
   354	free_domain:
   355		irq_domain_remove(domain);
   356	free_priv:
   357		platform_msi_free_priv_data(data);
   358		return NULL;
   359	}
   360	
   361	/**
   362	 * platform_msi_domain_free - Free interrupts associated with a platform-msi
   363	 *                            domain
   364	 *
   365	 * @domain:	The platform-msi domain
   366	 * @virq:	The base irq from which to perform the free operation
   367	 * @nvec:	How many interrupts to free from @virq
   368	 */
   369	void platform_msi_domain_free(struct irq_domain *domain, unsigned int virq,
   370				      unsigned int nvec)
   371	{
   372		struct platform_msi_priv_data *data = domain->host_data;
   373		struct msi_desc *desc, *tmp;
   374		for_each_msi_entry_safe(desc, tmp, data->dev) {
   375			if (WARN_ON(!desc->irq || desc->nvec_used != 1))
   376				return;
   377			if (!(desc->irq >= virq && desc->irq < (virq + nvec)))
   378				continue;
   379	
   380			irq_domain_free_irqs_common(domain, desc->irq, 1);
   381			list_del(&desc->list);
   382			free_msi_entry(desc);
   383		}
   384	}
   385	
   386	/**
   387	 * platform_msi_domain_alloc - Allocate interrupts associated with
   388	 *			       a platform-msi domain
   389	 *
   390	 * @domain:	The platform-msi domain
   391	 * @virq:	The base irq from which to perform the allocate operation
   392	 * @nvec:	How many interrupts to free from @virq
   393	 *
   394	 * Return 0 on success, or an error code on failure. Must be called
   395	 * with irq_domain_mutex held (which can only be done as part of a
   396	 * top-level interrupt allocation).
   397	 */
   398	int platform_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
   399				      unsigned int nr_irqs)
   400	{
   401		struct platform_msi_priv_data *data = domain->host_data;
   402		int err;
   403	
   404		err = platform_msi_alloc_descs_with_irq(data->dev, virq, nr_irqs, data);
   405		if (err)
   406			return err;
   407	
   408		err = msi_domain_populate_irqs(domain->parent, data->dev,
   409					       virq, nr_irqs, &data->arg);
   410		if (err)
   411			platform_msi_domain_free(domain, virq, nr_irqs);
   412	
   413		return err;
   414	}
   415	
   416	#ifdef CONFIG_DEVICE_MSI
   417	/*
   418	 * Device specific MSI domain infrastructure for devices which have their
   419	 * own resource management and interrupt chip. These devices are not
   420	 * related to PCI and contrary to platform MSI they do not share a common
   421	 * resource and interrupt chip. They provide their own domain specific
   422	 * resource management and interrupt chip.
   423	 */
   424	
   425	static void device_msi_free_msi_entries(struct device *dev)
   426	{
   427		struct list_head *msi_list = dev_to_msi_list(dev);
   428		struct msi_desc *entry, *tmp;
   429	
   430		list_for_each_entry_safe(entry, tmp, msi_list, list) {
   431			list_del(&entry->list);
   432			free_msi_entry(entry);
   433		}
   434	}
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
