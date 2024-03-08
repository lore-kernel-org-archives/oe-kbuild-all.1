Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DB22134A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 03:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709868456; cv=none; b=cr+Zan4hfXAjzEdfhLxVWfRSyv+86XTbYG7BI29E9h8o75/RfYFaV2TD6QFMrNxGyVBMV+l5cAVfWSqIMg+QSVxG4NaK0Bsq2xaD34m47RJzc7ALScTEZJoXxxEgY7Bux9OihUMH+xjNZ5QwafyiUsyw9TiiJoyRLeMibNKo2sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709868456; c=relaxed/simple;
	bh=XNo17/7xl7pWP7cl++BpqWen7MS8z3iF73hQ5VdiC8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PN+FyW7HLYYoW8EW5vI/GrqSmVu8e565QQvYK3JL9kcCfg54G2BAIXR3FzVb3TMlFp04a69nLOAzreMxl4KSpMy8fwT74aX2er+8kHYuneMJUML6eqVOEY7ueKg7EpzGkpH2GdjImV/lcEiEF/VcqtLZ6b5B0ZpCuaujESsJpkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1W+ldJT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1W+ldJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709868455; x=1741404455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNo17/7xl7pWP7cl++BpqWen7MS8z3iF73hQ5VdiC8M=;
  b=C1W+ldJTiM4Eexc5kNFqgf4hSUX3PwF2u4omxFCrMonM4AVMXUm1uh6Q
   yUO9EbSoV7gV5h7zqc8v57C6Bw32F6IBZ1HaJwgf2eENy95yz4Kkegsof
   GLsMzgYjWPFGhA5EvpyGmJ309JZQdm9V7zDoPJp0cdtShXPQLqvQrt6vf
   TfBgiCdaOsP8ZY2YLJYCHvPur6AJ8KmPsKM2UOA+m7RXA+W4W216tvGlM
   5P5HhdpCUYYSPG4C/TO0lAPFCnmIXBH/Znebzv3TaW20OtJEJ2aoIesaj
   nyEIf+CVBFqL1+Y+a4oUQinnpndEOYF7fzejVHDLTJRD/mqMFETkoz7SV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22029860"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="22029860"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 19:27:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="10217156"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2024 19:27:33 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riQtO-0005yZ-1U;
	Fri, 08 Mar 2024 03:27:30 +0000
Date: Fri, 8 Mar 2024 11:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [jmondi:pispbe/media-staging/be-upstream 34/143]
 drivers/irqchip/irq-bcm2712-mip.c:229:61: error: passing argument 3 of
 'of_property_read_u64' from incompatible pointer type
Message-ID: <202403081135.4OIptNbl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   b7b928a1ff80dc548d6f5c1b8c00b2082212e38e
commit: 5ef18864a22fc20b62a8c3ad4940cecf6335360f [34/143] irqchip: irq-bcm2712-mip: Support for 2712's MIP
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403081135.4OIptNbl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403081135.4OIptNbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403081135.4OIptNbl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-bcm2712-mip.c: In function 'mip_of_msi_init':
>> drivers/irqchip/irq-bcm2712-mip.c:229:61: error: passing argument 3 of 'of_property_read_u64' from incompatible pointer type [-Werror=incompatible-pointer-types]
     229 |         if (of_property_read_u64(node, "brcm,msi-pci-addr", &priv->msg_addr)) {
         |                                                             ^~~~~~~~~~~~~~~
         |                                                             |
         |                                                             phys_addr_t * {aka unsigned int *}
   In file included from drivers/irqchip/irq-bcm2712-mip.c:8:
   include/linux/of.h:332:60: note: expected 'u64 *' {aka 'long long unsigned int *'} but argument is of type 'phys_addr_t *' {aka 'unsigned int *'}
     332 |                                 const char *propname, u64 *out_value);
         |                                                       ~~~~~^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_property_read_u64 +229 drivers/irqchip/irq-bcm2712-mip.c

   193	
   194	static int __init mip_of_msi_init(struct device_node *node,
   195					  struct device_node *parent)
   196	{
   197		struct mip_priv *priv;
   198		struct resource res;
   199		int ret;
   200	
   201		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
   202		if (!priv)
   203			return -ENOMEM;
   204	
   205		spin_lock_init(&priv->msi_map_lock);
   206		spin_lock_init(&priv->hw_lock);
   207	
   208		ret = of_address_to_resource(node, 0, &res);
   209		if (ret) {
   210			pr_err("Failed to allocate resource\n");
   211			goto err_priv;
   212		}
   213	
   214		if (of_property_read_u32(node, "brcm,msi-base-spi", &priv->msi_base)) {
   215			pr_err("Unable to parse MSI base\n");
   216			ret = -EINVAL;
   217			goto err_priv;
   218		}
   219	
   220		if (of_property_read_u32(node, "brcm,msi-num-spis", &priv->num_msis)) {
   221			pr_err("Unable to parse MSI numbers\n");
   222			ret = -EINVAL;
   223			goto err_priv;
   224		}
   225	
   226		if (of_property_read_u32(node, "brcm,msi-offset", &priv->msi_offset))
   227			priv->msi_offset = 0;
   228	
 > 229		if (of_property_read_u64(node, "brcm,msi-pci-addr", &priv->msg_addr)) {
   230			pr_err("Unable to parse MSI address\n");
   231			ret = -EINVAL;
   232			goto err_priv;
   233		}
   234	
   235		priv->base = ioremap(res.start, resource_size(&res));
   236		if (!priv->base) {
   237			pr_err("Failed to ioremap regs\n");
   238			ret = -ENOMEM;
   239			goto err_priv;
   240		}
   241	
   242		priv->msi_map = kcalloc(BITS_TO_LONGS(priv->num_msis),
   243					sizeof(*priv->msi_map),
   244					GFP_KERNEL);
   245		if (!priv->msi_map) {
   246			ret = -ENOMEM;
   247			goto err_base;
   248		}
   249	
   250		pr_debug("Registering %d msixs, starting at %d\n",
   251			 priv->num_msis, priv->msi_base);
   252	
   253		/*
   254		 * Begin with all MSI-Xs masked in for the host, masked out for the
   255		 * VPU, and edge-triggered.
   256		 */
   257		writel(0, priv->base + MIP_INT_MASKL_HOST);
   258		writel(0, priv->base + MIP_INT_MASKH_HOST);
   259		writel(~0, priv->base + MIP_INT_MASKL_VPU);
   260		writel(~0, priv->base + MIP_INT_MASKH_VPU);
   261		writel(~0, priv->base + MIP_INT_CFGL_HOST);
   262		writel(~0, priv->base + MIP_INT_CFGH_HOST);
   263	
   264		ret = mip_init_domains(priv, node);
   265		if (ret) {
   266			pr_err("Failed to allocate msi_map\n");
   267			goto err_map;
   268		}
   269	
   270		return 0;
   271	
   272	err_map:
   273		kfree(priv->msi_map);
   274	
   275	err_base:
   276		iounmap(priv->base);
   277	
   278	err_priv:
   279		kfree(priv);
   280	
   281		pr_err("%s: failed - err %d\n", __func__, ret);
   282	
   283		return ret;
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
