Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C1E3ACF17
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781602570; cv=none; b=A/uugqc7taNLggJ2dktGDEXqQ1uFUB8rhwEM/kSVo8aKHTJwiyk0l8vCIsxCln8XRwm3i9bqUd3sDSavZ/BX6BKKiOrZBe6Qv0Uv+0UK+ShACho4K1j6jmjRQZM7GXBGMC/2msG2MdxCO7Mg/H2IJjBVP04XHWVDzuiClqX+u24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781602570; c=relaxed/simple;
	bh=RQw8+haF3YGhQ11oesYPaatwfeZ9287NS14XPXmFYN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9Bj9J0XStJNzkEc8lpIkBEDJzN2nJp0rGJKXZYiP+S82StrFFI9SAvYaJTq589aIZLISaQkT5wq/JAZGLIBRkjUws5+9+FEyi1HC+/cRmnUG9Twl+Tl+ekQvxSISTH0PqbGs1GQmF/hy5xVFu4YoWBJVwjNy+zQYdhdQLqtXyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n66qAPZs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n66qAPZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781602569; x=1813138569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RQw8+haF3YGhQ11oesYPaatwfeZ9287NS14XPXmFYN8=;
  b=n66qAPZsNgIydz32BQdk1lo6al2SMkxJ7i3RKAo5UZcRoAgqvMQA/kLE
   7872VSdhtPaPPcDa8rTmjmra1ZSwZRaMyxm17TJZSbX3CkahIy71leeP0
   icc+bnv43DWR5L0bBAtebvZ6kXtQP6XHc7ChvKPJcVU7YATjJGvQNkhn2
   dzRXMAszs2tBNCY4GWYcHGAHVeuQQJudUMmj6X0uX5EC7PfSg/PJIAQAT
   Qz3QjA+7E2M/1sMI+b88qClAcwv5ZN71pz84qd2Rj7BlYj9dFRzrtd69k
   i0S1ghF4EnCyNeErK3sqhDRiafw04D0//Esrf0tVKAxs1Z+prp8qMAWIC
   w==;
X-CSE-ConnectionGUID: V+31yQDBS2yk8V4MFSz0Jw==
X-CSE-MsgGUID: NI8UTxJFSt6PQXY31zcJCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69907562"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="69907562"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 02:36:08 -0700
X-CSE-ConnectionGUID: ZKpk0ntNQqqKLA+78diyQw==
X-CSE-MsgGUID: QG1s9KTjT3yZofSS+lLeoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="244836128"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jun 2026 02:36:06 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZQDE-00000000Syc-1I6s;
	Tue, 16 Jun 2026 09:36:04 +0000
Date: Tue, 16 Jun 2026 17:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] misc: lan966x_pci: depopulate children on populate
 failure
Message-ID: <202606161724.uAEP4nTA-lkp@intel.com>
References: <20260616004304.95117-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616004304.95117-1-pengpeng@iscas.ac.cn>

Hi Pengpeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v7.1 next-20260615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/misc-lan966x_pci-depopulate-children-on-populate-failure/20260616-091550
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260616004304.95117-1-pengpeng%40iscas.ac.cn
patch subject: [PATCH] misc: lan966x_pci: depopulate children on populate failure
config: loongarch-randconfig-001-20260616 (https://download.01.org/0day-ci/archive/20260616/202606161724.uAEP4nTA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161724.uAEP4nTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161724.uAEP4nTA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/lan966x_pci.c: In function 'lan966x_pci_probe':
>> drivers/misc/lan966x_pci.c:187:1: warning: label 'err_unload_overlay' defined but not used [-Wunused-label]
     187 | err_unload_overlay:
         | ^~~~~~~~~~~~~~~~~~


vim +/err_unload_overlay +187 drivers/misc/lan966x_pci.c

185686beb464996 Herve Codina 2024-10-14  138  
185686beb464996 Herve Codina 2024-10-14  139  static int lan966x_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
185686beb464996 Herve Codina 2024-10-14  140  {
185686beb464996 Herve Codina 2024-10-14  141  	struct device *dev = &pdev->dev;
185686beb464996 Herve Codina 2024-10-14  142  	struct lan966x_pci *data;
185686beb464996 Herve Codina 2024-10-14  143  	int ret;
185686beb464996 Herve Codina 2024-10-14  144  
185686beb464996 Herve Codina 2024-10-14  145  	/*
185686beb464996 Herve Codina 2024-10-14  146  	 * On ACPI system, fwnode can point to the ACPI node.
185686beb464996 Herve Codina 2024-10-14  147  	 * This driver needs an of_node to be used as the device-tree overlay
185686beb464996 Herve Codina 2024-10-14  148  	 * target. This of_node should be set by the PCI core if it succeeds in
185686beb464996 Herve Codina 2024-10-14  149  	 * creating it (CONFIG_PCI_DYNAMIC_OF_NODES feature).
185686beb464996 Herve Codina 2024-10-14  150  	 * Check here for the validity of this of_node.
185686beb464996 Herve Codina 2024-10-14  151  	 */
185686beb464996 Herve Codina 2024-10-14  152  	if (!dev_of_node(dev))
185686beb464996 Herve Codina 2024-10-14  153  		return dev_err_probe(dev, -EINVAL, "Missing of_node for device\n");
185686beb464996 Herve Codina 2024-10-14  154  
185686beb464996 Herve Codina 2024-10-14  155  	/* Need to be done before devm_pci_dev_create_intr_ctrl.
185686beb464996 Herve Codina 2024-10-14  156  	 * It allocates an IRQ and so pdev->irq is updated.
185686beb464996 Herve Codina 2024-10-14  157  	 */
185686beb464996 Herve Codina 2024-10-14  158  	ret = pcim_enable_device(pdev);
185686beb464996 Herve Codina 2024-10-14  159  	if (ret)
185686beb464996 Herve Codina 2024-10-14  160  		return ret;
185686beb464996 Herve Codina 2024-10-14  161  
185686beb464996 Herve Codina 2024-10-14  162  	ret = devm_pci_dev_create_intr_ctrl(pdev);
185686beb464996 Herve Codina 2024-10-14  163  	if (ret)
185686beb464996 Herve Codina 2024-10-14  164  		return ret;
185686beb464996 Herve Codina 2024-10-14  165  
185686beb464996 Herve Codina 2024-10-14  166  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
185686beb464996 Herve Codina 2024-10-14  167  	if (!data)
185686beb464996 Herve Codina 2024-10-14  168  		return -ENOMEM;
185686beb464996 Herve Codina 2024-10-14  169  
185686beb464996 Herve Codina 2024-10-14  170  	pci_set_drvdata(pdev, data);
185686beb464996 Herve Codina 2024-10-14  171  	data->dev = dev;
185686beb464996 Herve Codina 2024-10-14  172  
185686beb464996 Herve Codina 2024-10-14  173  	ret = lan966x_pci_load_overlay(data);
185686beb464996 Herve Codina 2024-10-14  174  	if (ret)
185686beb464996 Herve Codina 2024-10-14  175  		return ret;
185686beb464996 Herve Codina 2024-10-14  176  
185686beb464996 Herve Codina 2024-10-14  177  	pci_set_master(pdev);
185686beb464996 Herve Codina 2024-10-14  178  
185686beb464996 Herve Codina 2024-10-14  179  	ret = of_platform_default_populate(dev_of_node(dev), NULL, dev);
185686beb464996 Herve Codina 2024-10-14  180  	if (ret)
6b5a5043c64e00b Pengpeng Hou 2026-06-16  181  		goto err_depopulate;
185686beb464996 Herve Codina 2024-10-14  182  
185686beb464996 Herve Codina 2024-10-14  183  	return 0;
185686beb464996 Herve Codina 2024-10-14  184  
6b5a5043c64e00b Pengpeng Hou 2026-06-16  185  err_depopulate:
6b5a5043c64e00b Pengpeng Hou 2026-06-16  186  	of_platform_depopulate(dev);
185686beb464996 Herve Codina 2024-10-14 @187  err_unload_overlay:
185686beb464996 Herve Codina 2024-10-14  188  	lan966x_pci_unload_overlay(data);
185686beb464996 Herve Codina 2024-10-14  189  	return ret;
185686beb464996 Herve Codina 2024-10-14  190  }
185686beb464996 Herve Codina 2024-10-14  191  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
