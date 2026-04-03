Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DB9350A0F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775241162; cv=none; b=H2w0l38m0Sg6IQv9d9KASaKD7SsgkREeEe2zZL6EuIJ99IxNNvXa9m50mI6x7SUSIgR1/gAGdjOMVisYBIfNVlFcMUi92LAJ6LAn+1dormjH7/ohX2bwy2+fjNsg+vAcBcInIk2XyFtkxcDeskFKVK2lNs9JfC/OrhCtnHGpXzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775241162; c=relaxed/simple;
	bh=qvNhtPNu9u5F+7XczqPkIHT4Z55sDqmIBy+BNXFpd9g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YlVnp4NAfv5LdALI6VPbKOZpCU3busAnxKN9cRLKRQEFqNGZrTxM5JTlXSjQiinOAaJyPKp41mR33c/tJxPWTCTPdF9MImn41NLx0n/gELuY3AYR23mWPoauXrI29rnG1uF2510KhQ7FkmcTDLDgDdlCYvYX9EoqRx45XIvyV3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMYrULnk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMYrULnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775241161; x=1806777161;
  h=date:from:to:cc:subject:message-id;
  bh=qvNhtPNu9u5F+7XczqPkIHT4Z55sDqmIBy+BNXFpd9g=;
  b=iMYrULnka9BJwOBMkm4FphacIomY+VhnwG+Sc2YkQ/SqCiml01AZo7Sh
   hNQZ+rv/81e2ZXR0CEwsjGfKOYaHUYLKwUhbgirNdgaNlLBz4TFSd/JTG
   U1HcfyAvRkTC/7Dh0Bby8iUd2Wv5zoPsm0VPfMQ/nLlelykRXad1cJNGS
   73X77shdI9Go2QzWo4spPWahY7retqq4vB8nm29K//xSn+jKLZX7xJOcr
   L0pnuFNY+hDn/vlRv4RZsEQodUTdJms1fX1VKbmkPsEp4zvHZhU7pl4TY
   IhG4vyK1AVMNKhGUMrg0D2kt/cvU20d6eXKt6n0a7jO2rNQ/geZG6h917
   A==;
X-CSE-ConnectionGUID: Zx7vmSPVTLSjghIG4aKY+A==
X-CSE-MsgGUID: 3DIWRpxlSAGWOhSk2P5LoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76370443"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="76370443"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 11:32:40 -0700
X-CSE-ConnectionGUID: XPc/TNlLQr+zhRBxi2AL/g==
X-CSE-MsgGUID: DhxAvzkVQLi3HUNyphL1sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="232250978"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 03 Apr 2026 11:32:39 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8jJs-000000009MH-2sNE;
	Fri, 03 Apr 2026 18:32:36 +0000
Date: Fri, 03 Apr 2026 20:32:23 +0200
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/base/firmware_loader/sysfs_upload.c:323:34: error:
 'module' undeclared
Message-ID: <202604032040.oOSP453w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/firmware_loader-Stop-pinning-modules-on-registration/20260403-143216
head:   9b07805c9d3f6515aec772a189030855e0e03fcb
commit: 9b07805c9d3f6515aec772a189030855e0e03fcb treewide: firmware_loader: Drop the unused @module argument
date:   12 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260403/202604032040.oOSP453w-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604032040.oOSP453w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604032040.oOSP453w-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/firmware_loader/sysfs_upload.c: In function 'fw_upload_start':
   drivers/base/firmware_loader/sysfs_upload.c:229:24: warning: unused variable 'fw_dev' [-Wunused-variable]
     229 |         struct device *fw_dev = &fw_sysfs->dev;
         |                        ^~~~~~
   drivers/base/firmware_loader/sysfs_upload.c: In function 'firmware_upload_register':
>> drivers/base/firmware_loader/sysfs_upload.c:323:34: error: 'module' undeclared (first use in this function)
     323 |         fw_upload_priv->module = module;
         |                                  ^~~~~~
   drivers/base/firmware_loader/sysfs_upload.c:323:34: note: each undeclared identifier is reported only once for each function it appears in


vim +/module +323 drivers/base/firmware_loader/sysfs_upload.c

789bba82f63c3e Russ Weight    2022-08-30  274  
97730bbb242cde Russ Weight    2022-04-21  275  /**
97730bbb242cde Russ Weight    2022-04-21  276   * firmware_upload_register() - register for the firmware upload sysfs API
97730bbb242cde Russ Weight    2022-04-21  277   * @parent: parent device instantiating firmware upload
97730bbb242cde Russ Weight    2022-04-21  278   * @name: firmware name to be associated with this device
97730bbb242cde Russ Weight    2022-04-21  279   * @ops: pointer to structure of firmware upload ops
97730bbb242cde Russ Weight    2022-04-21  280   * @dd_handle: pointer to parent driver private data
97730bbb242cde Russ Weight    2022-04-21  281   *
97730bbb242cde Russ Weight    2022-04-21  282   *	@name must be unique among all users of firmware upload. The firmware
97730bbb242cde Russ Weight    2022-04-21  283   *	sysfs files for this device will be found at /sys/class/firmware/@name.
97730bbb242cde Russ Weight    2022-04-21  284   *
97730bbb242cde Russ Weight    2022-04-21  285   *	Return: struct fw_upload pointer or ERR_PTR()
97730bbb242cde Russ Weight    2022-04-21  286   *
97730bbb242cde Russ Weight    2022-04-21  287   **/
9b07805c9d3f65 Dan Williams   2026-03-31  288  struct fw_upload *firmware_upload_register(struct device *parent,
9b07805c9d3f65 Dan Williams   2026-03-31  289  					   const char *name,
9b07805c9d3f65 Dan Williams   2026-03-31  290  					   const struct fw_upload_ops *ops,
97730bbb242cde Russ Weight    2022-04-21  291  					   void *dd_handle)
97730bbb242cde Russ Weight    2022-04-21  292  {
97730bbb242cde Russ Weight    2022-04-21  293  	u32 opt_flags = FW_OPT_NOCACHE;
97730bbb242cde Russ Weight    2022-04-21  294  	struct fw_upload *fw_upload;
97730bbb242cde Russ Weight    2022-04-21  295  	struct fw_upload_priv *fw_upload_priv;
97730bbb242cde Russ Weight    2022-04-21  296  	struct fw_sysfs *fw_sysfs;
97730bbb242cde Russ Weight    2022-04-21  297  	struct fw_priv *fw_priv;
97730bbb242cde Russ Weight    2022-04-21  298  	struct device *fw_dev;
97730bbb242cde Russ Weight    2022-04-21  299  	int ret;
97730bbb242cde Russ Weight    2022-04-21  300  
97730bbb242cde Russ Weight    2022-04-21  301  	if (!name || name[0] == '\0')
97730bbb242cde Russ Weight    2022-04-21  302  		return ERR_PTR(-EINVAL);
97730bbb242cde Russ Weight    2022-04-21  303  
97730bbb242cde Russ Weight    2022-04-21  304  	if (!ops || !ops->cancel || !ops->prepare ||
97730bbb242cde Russ Weight    2022-04-21  305  	    !ops->write || !ops->poll_complete) {
97730bbb242cde Russ Weight    2022-04-21  306  		dev_err(parent, "Attempt to register without all required ops\n");
97730bbb242cde Russ Weight    2022-04-21  307  		return ERR_PTR(-EINVAL);
97730bbb242cde Russ Weight    2022-04-21  308  	}
97730bbb242cde Russ Weight    2022-04-21  309  
bf4afc53b77aea Linus Torvalds 2026-02-21  310  	fw_upload = kzalloc_obj(*fw_upload);
2d47c24353d3fb Dan Williams   2026-03-31  311  	if (!fw_upload)
2d47c24353d3fb Dan Williams   2026-03-31  312  		return ERR_PTR(-ENOMEM);
97730bbb242cde Russ Weight    2022-04-21  313  
bf4afc53b77aea Linus Torvalds 2026-02-21  314  	fw_upload_priv = kzalloc_obj(*fw_upload_priv);
97730bbb242cde Russ Weight    2022-04-21  315  	if (!fw_upload_priv) {
97730bbb242cde Russ Weight    2022-04-21  316  		ret = -ENOMEM;
97730bbb242cde Russ Weight    2022-04-21  317  		goto free_fw_upload;
97730bbb242cde Russ Weight    2022-04-21  318  	}
97730bbb242cde Russ Weight    2022-04-21  319  
97730bbb242cde Russ Weight    2022-04-21  320  	fw_upload_priv->fw_upload = fw_upload;
97730bbb242cde Russ Weight    2022-04-21  321  	fw_upload_priv->ops = ops;
97730bbb242cde Russ Weight    2022-04-21  322  	mutex_init(&fw_upload_priv->lock);
97730bbb242cde Russ Weight    2022-04-21 @323  	fw_upload_priv->module = module;
97730bbb242cde Russ Weight    2022-04-21  324  	fw_upload_priv->name = name;
97730bbb242cde Russ Weight    2022-04-21  325  	fw_upload_priv->err_code = 0;
97730bbb242cde Russ Weight    2022-04-21  326  	fw_upload_priv->progress = FW_UPLOAD_PROG_IDLE;
97730bbb242cde Russ Weight    2022-04-21  327  	INIT_WORK(&fw_upload_priv->work, fw_upload_main);
97730bbb242cde Russ Weight    2022-04-21  328  	fw_upload->dd_handle = dd_handle;
97730bbb242cde Russ Weight    2022-04-21  329  
97730bbb242cde Russ Weight    2022-04-21  330  	fw_sysfs = fw_create_instance(NULL, name, parent, opt_flags);
97730bbb242cde Russ Weight    2022-04-21  331  	if (IS_ERR(fw_sysfs)) {
97730bbb242cde Russ Weight    2022-04-21  332  		ret = PTR_ERR(fw_sysfs);
97730bbb242cde Russ Weight    2022-04-21  333  		goto free_fw_upload_priv;
97730bbb242cde Russ Weight    2022-04-21  334  	}
97730bbb242cde Russ Weight    2022-04-21  335  	fw_upload->priv = fw_sysfs;
97730bbb242cde Russ Weight    2022-04-21  336  	fw_sysfs->fw_upload_priv = fw_upload_priv;
97730bbb242cde Russ Weight    2022-04-21  337  	fw_dev = &fw_sysfs->dev;
97730bbb242cde Russ Weight    2022-04-21  338  
97730bbb242cde Russ Weight    2022-04-21  339  	ret = alloc_lookup_fw_priv(name, &fw_cache, &fw_priv,  NULL, 0, 0,
97730bbb242cde Russ Weight    2022-04-21  340  				   FW_OPT_NOCACHE);
97730bbb242cde Russ Weight    2022-04-21  341  	if (ret != 0) {
97730bbb242cde Russ Weight    2022-04-21  342  		if (ret > 0)
97730bbb242cde Russ Weight    2022-04-21  343  			ret = -EINVAL;
97730bbb242cde Russ Weight    2022-04-21  344  		goto free_fw_sysfs;
97730bbb242cde Russ Weight    2022-04-21  345  	}
97730bbb242cde Russ Weight    2022-04-21  346  	fw_priv->is_paged_buf = true;
97730bbb242cde Russ Weight    2022-04-21  347  	fw_sysfs->fw_priv = fw_priv;
97730bbb242cde Russ Weight    2022-04-21  348  
97730bbb242cde Russ Weight    2022-04-21  349  	ret = device_add(fw_dev);
97730bbb242cde Russ Weight    2022-04-21  350  	if (ret) {
97730bbb242cde Russ Weight    2022-04-21  351  		dev_err(fw_dev, "%s: device_register failed\n", __func__);
97730bbb242cde Russ Weight    2022-04-21  352  		put_device(fw_dev);
2d47c24353d3fb Dan Williams   2026-03-31  353  		return ERR_PTR(ret);
97730bbb242cde Russ Weight    2022-04-21  354  	}
97730bbb242cde Russ Weight    2022-04-21  355  
97730bbb242cde Russ Weight    2022-04-21  356  	return fw_upload;
97730bbb242cde Russ Weight    2022-04-21  357  
97730bbb242cde Russ Weight    2022-04-21  358  free_fw_sysfs:
97730bbb242cde Russ Weight    2022-04-21  359  	kfree(fw_sysfs);
97730bbb242cde Russ Weight    2022-04-21  360  
97730bbb242cde Russ Weight    2022-04-21  361  free_fw_upload_priv:
97730bbb242cde Russ Weight    2022-04-21  362  	kfree(fw_upload_priv);
97730bbb242cde Russ Weight    2022-04-21  363  
97730bbb242cde Russ Weight    2022-04-21  364  free_fw_upload:
97730bbb242cde Russ Weight    2022-04-21  365  	kfree(fw_upload);
97730bbb242cde Russ Weight    2022-04-21  366  
97730bbb242cde Russ Weight    2022-04-21  367  	return ERR_PTR(ret);
97730bbb242cde Russ Weight    2022-04-21  368  }
97730bbb242cde Russ Weight    2022-04-21  369  EXPORT_SYMBOL_GPL(firmware_upload_register);
97730bbb242cde Russ Weight    2022-04-21  370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
