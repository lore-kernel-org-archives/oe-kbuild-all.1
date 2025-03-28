Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8479F22094
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 02:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743127441; cv=none; b=sjOqfB6thijxBBGBEWaak+pq6XfFKaE3W+XrcaL2WRedkog+VmscsKw1qYrtU8R8FoTir7jhKQTM2F9Ztxy53S7UYnARFuvl/QKYX2cCJF4hD+Y++dKJSwoOAQ6x2CBywpCLuBWnET7cj/1NFI+fYQ87OFtmpmnd8V8bNrSHe6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743127441; c=relaxed/simple;
	bh=lKBftAVfGV04q2FEpkDuf2JoCorSdT2fcvOywSduL3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LD1IXSM2Hm5hZMkMf7Om+LTDLNF6k3esxpcf36f7iaUHpGp965TOtTzvcrCnXHmDjAnzZK3qVfxU74L8sxW13GPAoPCJu5ssGMdEqyDoFbl7KilWGVXvohlmlLCtW1fIf/E2bAeJCmfBNBU/xWeWI1FrJJdoMDnFYa/IWVcMs2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfZQVJBa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfZQVJBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743127440; x=1774663440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lKBftAVfGV04q2FEpkDuf2JoCorSdT2fcvOywSduL3c=;
  b=NfZQVJBa5PLxspn6AhHY4Z0va/6g4IOy/7hfO9z3XvcM9A1gQLuNcISI
   l4aszNu2v4F17/8NlGyV0tQ0jTG5yRBuzrGwHFvzpyq+jGhWq9eHljkf9
   tTdH1Brzjdi0QxUZEvd08v00xdCMEvDbrrma4H1x9Uc5ROLQFJX9OnJCa
   /eTTX+g8UsIO4W+IC9prIxy1+JXGDy30v9ILnO+ePb4aro/c9MvTfulgs
   iVFmCJVNvRL1S6MKMjLLJV6hcfE8AIOFTnzD/xTBs3Pg6+Sz55kb6t5d/
   YdKNvTo6VSwS+plxszu58oMS8/EuHbwbD0OtAlPlRf431197DAjkEswQP
   A==;
X-CSE-ConnectionGUID: kCC3UYPaSbeZneCciwvOBQ==
X-CSE-MsgGUID: 4bRE6oIlRaOA/SEHIi2TmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="54684994"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="54684994"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 19:03:59 -0700
X-CSE-ConnectionGUID: sHZGfosMQG6pdxnhg21uSg==
X-CSE-MsgGUID: 9a3MvxApRSmUxZE7MSWu7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="130521451"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Mar 2025 19:03:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txz4P-00074v-3D;
	Fri, 28 Mar 2025 02:03:43 +0000
Date: Fri, 28 Mar 2025 10:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1525/1525] drivers/char/svm.c:353:35:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202503280904.ByoMg5CF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3f8283040b83a49bdad8dc3dd4ccd3f50910af28
commit: b8c0480a3eba11ee6616019a3aaa75ee38f06f02 [1525/1525] svm: serach dts to init children device
config: arm64-randconfig-r112-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280904.ByoMg5CF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250328/202503280904.ByoMg5CF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280904.ByoMg5CF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/svm.c:353:35: sparse: sparse: Using plain integer as NULL pointer

vim +353 drivers/char/svm.c

   221	
   222	static int svm_init_core(struct svm_device *sdev)
   223	{
   224		int err = 0;
   225		struct device *dev = sdev->dev;
   226		struct acpi_device *adev = ACPI_COMPANION(sdev->dev);
   227		struct acpi_device *cdev = NULL;
   228		int id = 0;
   229	
   230		down_write(&svm_sem);
   231		if (!svm_bus_type.iommu_ops) {
   232			err = bus_register(&svm_bus_type);
   233			if (err) {
   234				up_write(&svm_sem);
   235				dev_err(dev, "failed to register svm_bus_type\n");
   236				return err;
   237			}
   238	
   239			err = bus_set_iommu(&svm_bus_type, dev->bus->iommu_ops);
   240			if (err) {
   241				up_write(&svm_sem);
   242				dev_err(dev, "failed to set iommu for svm_bus_type\n");
   243				goto err_unregister_bus;
   244			}
   245		} else if (svm_bus_type.iommu_ops != dev->bus->iommu_ops) {
   246			err = -EBUSY;
   247			up_write(&svm_sem);
   248			dev_err(dev, "iommu_ops configured, but changed!\n");
   249			goto err_unregister_bus;
   250		}
   251		up_write(&svm_sem);
   252	
   253		list_for_each_entry(cdev, &adev->children, node) {
   254			err = svm_acpi_add_core(sdev, cdev, id++);
   255			if (err)
   256				device_for_each_child(dev, NULL, svm_remove_core);
   257		}
   258	
   259		return err;
   260	
   261	err_unregister_bus:
   262		bus_unregister(&svm_bus_type);
   263	
   264		return err;
   265	}
   266	#else
   267	static int svm_of_add_core(struct svm_device *sdev, struct device_node *np)
   268	{
   269		int err;
   270		struct resource res;
   271		struct core_device *cdev = NULL;
   272		char *name = NULL;
   273	
   274		name = devm_kasprintf(sdev->dev, GFP_KERNEL, "svm%llu_%s",
   275				sdev->id, np->name);
   276		if (name == NULL)
   277			return -ENOMEM;
   278	
   279		cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
   280		if (cdev == NULL)
   281			return -ENOMEM;
   282	
   283		cdev->dev.of_node = np;
   284		cdev->dev.parent = sdev->dev;
   285		cdev->dev.bus = &svm_bus_type;
   286		cdev->dev.release = cdev_device_release;
   287		cdev->smmu_bypass = of_property_read_bool(np, "hisi,smmu_bypass");
   288		dev_set_name(&cdev->dev, "%s", name);
   289	
   290		err = device_register(&cdev->dev);
   291		if (err) {
   292			dev_info(&cdev->dev, "core_device register failed\n");
   293			put_device(&cdev->dev);
   294			kfree(cdev);
   295			return err;
   296		}
   297	
   298		err = of_dma_configure(&cdev->dev, np, true);
   299		if (err) {
   300			dev_dbg(&cdev->dev, "of_dma_configure failed\n");
   301			goto err_unregister_dev;
   302		}
   303	
   304		err = of_address_to_resource(np, 0, &res);
   305		if (err) {
   306			dev_info(&cdev->dev, "no reg, FW should install the sid\n");
   307		} else {
   308			/* If the reg specified, install sid for the core */
   309			void __iomem *core_base = NULL;
   310			int sid = cdev->dev.iommu_fwspec->ids[0];
   311	
   312			core_base = ioremap(res.start, resource_size(&res));
   313			if (core_base == NULL) {
   314				err = -ENOMEM;
   315				dev_err(&cdev->dev, "ioremap failed\n");
   316				goto err_unregister_dev;
   317			}
   318	
   319			writel_relaxed(sid, core_base + CORE_SID);
   320			iounmap(core_base);
   321		}
   322	
   323		/* If core device is smmu bypass, request direct map. */
   324		if (cdev->smmu_bypass) {
   325			err = iommu_request_dm_for_dev(&cdev->dev);
   326			if (err)
   327				goto err_unregister_dev;
   328	
   329			return 0;
   330		}
   331	
   332		cdev->group = iommu_group_get(&cdev->dev);
   333		if (IS_ERR_OR_NULL(cdev->group)) {
   334			err = -ENXIO;
   335			dev_err(&cdev->dev, "smmu is not right configured\n");
   336			goto err_unregister_dev;
   337		}
   338	
   339		cdev->domain = iommu_domain_alloc(sdev->dev->bus);
   340		if (cdev->domain == NULL) {
   341			err = -ENOMEM;
   342			dev_info(&cdev->dev, "failed to alloc domain\n");
   343			goto err_unregister_dev;
   344		}
   345	
   346		err = iommu_attach_group(cdev->domain, cdev->group);
   347		if (err) {
   348			dev_err(&cdev->dev, "failed group to domain\n");
   349			goto err_free_domain;
   350		}
   351	
   352		err = iommu_sva_device_init(&cdev->dev, IOMMU_SVA_FEAT_IOPF,
 > 353				UINT_MAX, 0);
   354		if (err) {
   355			dev_err(&cdev->dev, "failed to init sva device\n");
   356			goto err_detach_group;
   357		}
   358	
   359		return 0;
   360	
   361	err_detach_group:
   362		iommu_detach_group(cdev->domain, cdev->group);
   363	err_free_domain:
   364		iommu_domain_free(cdev->domain);
   365	err_unregister_dev:
   366		device_unregister(&cdev->dev);
   367	
   368		return err;
   369	}
   370	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
