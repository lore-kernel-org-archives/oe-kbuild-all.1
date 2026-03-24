Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254343890EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 02:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321072; cv=none; b=jeRA3Jd78FZWV72ldF7lOxrfgWj1RoNNd9EtYWfUBrllVD38fG28Jh2q35Ckra1OgST5bjBVD3SeF2p1G8+3lPTZbc4yWDbJYElPNDsFGK4rAZWrLTWsekS+iac1LpwStsTkfIphiQuUmiUMixtPF42/bb6FXypKlMQm5KK9jW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321072; c=relaxed/simple;
	bh=jSEuPaPU6cuJVO69gnusknFC6mzYSI6jefKVTrUk1Z8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=epJGx7ZqvsKtPb5nKu7i0npuic68pIIbqAYf1kXhdACDeigFollkx37bSeWjZCQUE0rE90D7l6UidogtDvkCvsxtbrm2s+OektR2XuZGyHGsmkFCPs8TmD2uguvSiQ951CngZ+mL/GvgodQxQPLoVS2PeucRbRTMGOk1NQOzI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fx80beVC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fx80beVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774321071; x=1805857071;
  h=date:from:to:cc:subject:message-id;
  bh=jSEuPaPU6cuJVO69gnusknFC6mzYSI6jefKVTrUk1Z8=;
  b=Fx80beVC7Desqe5bIRYAU/2uzLueODF3ltM9kb9asUbhvR3o5pl7RCB3
   2MjdI0LvFtTWA6MDnm3oXWGZjamfuCVXrdpRIxNsuBf0F2U0U0akG3lk1
   b6jQcp6Fp1SkxsR63KM9LCkqG5I33eyy0GtSp9OebyJdAxykS7WTLDyES
   SigL6zKWSJpivpcEigB1vH4w0fa4y307t39bq4gDRYOOB8+Nl/8MonHGi
   9pyPnBE9Q208v3QztmNN1ge/d8C5j8NJCMw0bANydagzeKfarftQA5JaT
   +aPW2sI+x9LFjEwmZmH1CxHSyeeXedWn5ZC7VLP3A+d2i40GonDOTsDja
   g==;
X-CSE-ConnectionGUID: oBBc6/F/SJO4fOyGY8s0/Q==
X-CSE-MsgGUID: G/OABmFXTpC0jwtyhSxGmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86024699"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86024699"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 19:57:47 -0700
X-CSE-ConnectionGUID: PVsbQ+/oRAyE4zFXBUD0Zw==
X-CSE-MsgGUID: /Kjs5ydNRo2wHJU+pEbyhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219340738"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2026 19:57:46 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4rxf-000000003hP-3T2k;
	Tue, 24 Mar 2026 02:57:43 +0000
Date: Tue, 24 Mar 2026 10:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>
Subject: drivers/gpu/drm/gma500/opregion.c:324:20: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202603241049.fAX6rSes-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: d70da12453ac3797e0c54884305ccc894e8c817b hardening: Enable i386 FORTIFY_SOURCE on Clang 16+
date:   1 year ago
config: i386-randconfig-062-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241049.fAX6rSes-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241049.fAX6rSes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241049.fAX6rSes-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/gma500/opregion.c:294:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got struct opregion_header *header @@
   drivers/gpu/drm/gma500/opregion.c:294:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/gma500/opregion.c:294:25: sparse:     got struct opregion_header *header
>> drivers/gpu/drm/gma500/opregion.c:324:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *const p @@     got void [noderef] __iomem *[assigned] base @@
   drivers/gpu/drm/gma500/opregion.c:324:20: sparse:     expected void const *const p
   drivers/gpu/drm/gma500/opregion.c:324:20: sparse:     got void [noderef] __iomem *[assigned] base
   drivers/gpu/drm/gma500/opregion.c:330:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct opregion_header *header @@     got void [noderef] __iomem *[assigned] base @@
   drivers/gpu/drm/gma500/opregion.c:330:26: sparse:     expected struct opregion_header *header
   drivers/gpu/drm/gma500/opregion.c:330:26: sparse:     got void [noderef] __iomem *[assigned] base
   drivers/gpu/drm/gma500/opregion.c:331:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *vbt @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/gma500/opregion.c:331:23: sparse:     expected void *vbt
   drivers/gpu/drm/gma500/opregion.c:331:23: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/gma500/opregion.c:338:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct opregion_acpi *acpi @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/gma500/opregion.c:338:32: sparse:     expected struct opregion_acpi *acpi
   drivers/gpu/drm/gma500/opregion.c:338:32: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/gma500/opregion.c:343:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct opregion_asle *asle @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/gma500/opregion.c:343:32: sparse:     expected struct opregion_asle *asle
   drivers/gpu/drm/gma500/opregion.c:343:32: sparse:     got void [noderef] __iomem *

vim +324 drivers/gpu/drm/gma500/opregion.c

d839ede47a56ff5 Alan Cox           2012-05-03  275  
d839ede47a56ff5 Alan Cox           2012-05-03  276  void psb_intel_opregion_fini(struct drm_device *dev)
d839ede47a56ff5 Alan Cox           2012-05-03  277  {
f71635e893c3832 Thomas Zimmermann  2021-09-20  278  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
d839ede47a56ff5 Alan Cox           2012-05-03  279  	struct psb_intel_opregion *opregion = &dev_priv->opregion;
d839ede47a56ff5 Alan Cox           2012-05-03  280  
d839ede47a56ff5 Alan Cox           2012-05-03  281  	if (!opregion->header)
d839ede47a56ff5 Alan Cox           2012-05-03  282  		return;
d839ede47a56ff5 Alan Cox           2012-05-03  283  
d839ede47a56ff5 Alan Cox           2012-05-03  284  	if (opregion->acpi) {
d839ede47a56ff5 Alan Cox           2012-05-03  285  		opregion->acpi->drdy = 0;
d839ede47a56ff5 Alan Cox           2012-05-03  286  
d839ede47a56ff5 Alan Cox           2012-05-03  287  		system_opregion = NULL;
d839ede47a56ff5 Alan Cox           2012-05-03  288  		unregister_acpi_notifier(&psb_intel_opregion_notifier);
d839ede47a56ff5 Alan Cox           2012-05-03  289  	}
d839ede47a56ff5 Alan Cox           2012-05-03  290  
778e26dee5e6b3b Patrik Jakobsson   2014-03-11  291  	cancel_work_sync(&opregion->asle_work);
778e26dee5e6b3b Patrik Jakobsson   2014-03-11  292  
d839ede47a56ff5 Alan Cox           2012-05-03  293  	/* just clear all opregion memory pointers now */
d839ede47a56ff5 Alan Cox           2012-05-03 @294  	iounmap(opregion->header);
d839ede47a56ff5 Alan Cox           2012-05-03  295  	opregion->header = NULL;
d839ede47a56ff5 Alan Cox           2012-05-03  296  	opregion->acpi = NULL;
d839ede47a56ff5 Alan Cox           2012-05-03  297  	opregion->swsci = NULL;
d839ede47a56ff5 Alan Cox           2012-05-03  298  	opregion->asle = NULL;
d839ede47a56ff5 Alan Cox           2012-05-03  299  	opregion->vbt = NULL;
d839ede47a56ff5 Alan Cox           2012-05-03  300  }
d839ede47a56ff5 Alan Cox           2012-05-03  301  
d839ede47a56ff5 Alan Cox           2012-05-03  302  int psb_intel_opregion_setup(struct drm_device *dev)
d839ede47a56ff5 Alan Cox           2012-05-03  303  {
f71635e893c3832 Thomas Zimmermann  2021-09-20  304  	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
a2c68495b579862 Thomas Zimmermann  2020-12-01  305  	struct pci_dev *pdev = to_pci_dev(dev->dev);
d839ede47a56ff5 Alan Cox           2012-05-03  306  	struct psb_intel_opregion *opregion = &dev_priv->opregion;
d839ede47a56ff5 Alan Cox           2012-05-03  307  	u32 opregion_phy, mboxes;
d64363c7557959c Kirill A. Shutemov 2012-05-03  308  	void __iomem *base;
d839ede47a56ff5 Alan Cox           2012-05-03  309  	int err = 0;
d839ede47a56ff5 Alan Cox           2012-05-03  310  
a2c68495b579862 Thomas Zimmermann  2020-12-01  311  	pci_read_config_dword(pdev, PCI_ASLS, &opregion_phy);
d839ede47a56ff5 Alan Cox           2012-05-03  312  	if (opregion_phy == 0) {
d839ede47a56ff5 Alan Cox           2012-05-03  313  		DRM_DEBUG_DRIVER("ACPI Opregion not supported\n");
d839ede47a56ff5 Alan Cox           2012-05-03  314  		return -ENOTSUPP;
d839ede47a56ff5 Alan Cox           2012-05-03  315  	}
778e26dee5e6b3b Patrik Jakobsson   2014-03-11  316  
778e26dee5e6b3b Patrik Jakobsson   2014-03-11  317  	INIT_WORK(&opregion->asle_work, psb_intel_opregion_asle_work);
778e26dee5e6b3b Patrik Jakobsson   2014-03-11  318  
d839ede47a56ff5 Alan Cox           2012-05-03  319  	DRM_DEBUG("OpRegion detected at 0x%8x\n", opregion_phy);
d839ede47a56ff5 Alan Cox           2012-05-03  320  	base = acpi_os_ioremap(opregion_phy, 8*1024);
d839ede47a56ff5 Alan Cox           2012-05-03  321  	if (!base)
d839ede47a56ff5 Alan Cox           2012-05-03  322  		return -ENOMEM;
d839ede47a56ff5 Alan Cox           2012-05-03  323  
d839ede47a56ff5 Alan Cox           2012-05-03 @324  	if (memcmp(base, OPREGION_SIGNATURE, 16)) {
d839ede47a56ff5 Alan Cox           2012-05-03  325  		DRM_DEBUG_DRIVER("opregion signature mismatch\n");
d839ede47a56ff5 Alan Cox           2012-05-03  326  		err = -EINVAL;
d839ede47a56ff5 Alan Cox           2012-05-03  327  		goto err_out;
d839ede47a56ff5 Alan Cox           2012-05-03  328  	}
d839ede47a56ff5 Alan Cox           2012-05-03  329  
d839ede47a56ff5 Alan Cox           2012-05-03  330  	opregion->header = base;
d839ede47a56ff5 Alan Cox           2012-05-03  331  	opregion->vbt = base + OPREGION_VBT_OFFSET;
d839ede47a56ff5 Alan Cox           2012-05-03  332  
d839ede47a56ff5 Alan Cox           2012-05-03  333  	opregion->lid_state = base + ACPI_CLID;
d839ede47a56ff5 Alan Cox           2012-05-03  334  
d839ede47a56ff5 Alan Cox           2012-05-03  335  	mboxes = opregion->header->mboxes;
d839ede47a56ff5 Alan Cox           2012-05-03  336  	if (mboxes & MBOX_ACPI) {
d839ede47a56ff5 Alan Cox           2012-05-03  337  		DRM_DEBUG_DRIVER("Public ACPI methods supported\n");
d839ede47a56ff5 Alan Cox           2012-05-03  338  		opregion->acpi = base + OPREGION_ACPI_OFFSET;
d839ede47a56ff5 Alan Cox           2012-05-03  339  	}
d839ede47a56ff5 Alan Cox           2012-05-03  340  
d839ede47a56ff5 Alan Cox           2012-05-03  341  	if (mboxes & MBOX_ASLE) {
d839ede47a56ff5 Alan Cox           2012-05-03  342  		DRM_DEBUG_DRIVER("ASLE supported\n");
d839ede47a56ff5 Alan Cox           2012-05-03  343  		opregion->asle = base + OPREGION_ASLE_OFFSET;
d839ede47a56ff5 Alan Cox           2012-05-03  344  	}
d839ede47a56ff5 Alan Cox           2012-05-03  345  
d839ede47a56ff5 Alan Cox           2012-05-03  346  	return 0;
d839ede47a56ff5 Alan Cox           2012-05-03  347  
d839ede47a56ff5 Alan Cox           2012-05-03  348  err_out:
d839ede47a56ff5 Alan Cox           2012-05-03  349  	iounmap(base);
d839ede47a56ff5 Alan Cox           2012-05-03  350  	return err;
d839ede47a56ff5 Alan Cox           2012-05-03  351  }
d839ede47a56ff5 Alan Cox           2012-05-03  352  

:::::: The code at line 324 was first introduced by commit
:::::: d839ede47a56ff5f316c88391818488f8e5913af gma500: opregion and ACPI

:::::: TO: Alan Cox <alan@linux.intel.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
