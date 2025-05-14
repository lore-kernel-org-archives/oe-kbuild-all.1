Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09281922FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 14:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234544; cv=none; b=DgOgHNHx0dLNBY/j6XJ7dQRjfe0SkMP2NWwBV9WxeEOF2uRQvdeGoEo+TjaCH9m4V1xDaNSm8W2kSJsemwHPaaVFi61aC4k1epcAC2FRiLojdmybXc/73Kmg5uxc8bRHHsRZ1wl15rhnuRjR7rltt9VdxcDVTwGeIdo5mn1a2jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234544; c=relaxed/simple;
	bh=rXg/YdDyq1jh2SsWLQzI8FKFiEz5G57YumUzkZTleh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XbMj0qWYAdr9caCr/Oc2ECClE/Y784EhJgtUgRRGoQNdd82WZmd5PflVqom2p96/H+SAucrlwb2niDiiFT4fkkq2LpZD5Og87TNGpaVmi+WwCcgSbag2dXUS//UyKoOtIf5cEVZoPO8Wv1x3rpbmmnX13zKwYa7+wTCRIKD2eLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsm1Dtg8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsm1Dtg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747234542; x=1778770542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rXg/YdDyq1jh2SsWLQzI8FKFiEz5G57YumUzkZTleh8=;
  b=dsm1Dtg8a+mbUIo6tNv6y9jW3pwCQjWvbKRJ1yGtu0hFku4gPvM5GFDJ
   zVvUdeRCiotUKYM9+L0Jt0JAqBVcH6l6d/W5QWtTAkuOz6ItyRzofyeLd
   bkVZrKrvqusTDD6mOw9aJ8M27Qzhsl2N4NuIBpIkFYa9S5WapiemJHBdz
   5wtm0jZfJGzRtVRHHs+WAXRiKZ3z2/ZU/iKxuynFtphjOZtqRSg7+0Hjj
   RCJlGgwUu7CEmVOP67i5UB8aquybtfhezl/95jNkgK6UUhI1IAipLUplj
   +Bx3ZwjR2h1jd3vywytBon/hV4eyDOk2sE3t9s8bcAOMlXk7cD/c/hfYf
   w==;
X-CSE-ConnectionGUID: W9XWbRaNT+6Q5+GQ8OaBrw==
X-CSE-MsgGUID: wvktIkglSjuGkE4+7UV5uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49277308"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49277308"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 07:55:38 -0700
X-CSE-ConnectionGUID: mP3Fa8t9Q+qn/kCSPwODbw==
X-CSE-MsgGUID: LJp/LPI9TMqL/79R4JQFMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="143260544"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 May 2025 07:55:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFDWA-000HFD-33;
	Wed, 14 May 2025 14:55:34 +0000
Date: Wed, 14 May 2025 22:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1]
 drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:10: warning:
 return makes pointer from integer without a cast
Message-ID: <202505142248.P7AatbAG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   aba25e4ac40a20c6843e2b3128c2e8acfa43e99d
commit: a8fc6bda929968899263afa92764a6838a7e6286 [1/1] CHROMIUM: remoteproc: mediatek: Add APU config and timesync
config: arm-randconfig-r133-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142248.P7AatbAG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250514/202505142248.P7AatbAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142248.P7AatbAG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c: In function 'get_mbox_regmap':
>> drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
      return dev_err_probe(dev, -EPROBE_DEFER,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             "failed to add device link between power and mailbox\n");
             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MTK_SCP
   Depends on [n]: REMOTEPROC [=n] && (ARCH_MEDIATEK [=n] || COMPILE_TEST [=y])
   Selected by [y]:
   - MTK_APUSYS_SUPPORT [=y] && (ARCH_MEDIATEK [=n] || COMPILE_TEST [=y]) && (ARM [=y] || ARM64)

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:37: sparse: sparse: incorrect type in return expression (different base types) @@     expected struct regmap * @@     got int @@
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:37: sparse:     expected struct regmap *
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:37: sparse:     got int
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:140:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:140:22: sparse:     expected void *
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:140:22: sparse:     got void [noderef] __iomem *
>> drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:170:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *to @@     got void *[assigned] resv_ce_va @@
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:170:25: sparse:     expected void volatile [noderef] __iomem *to
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:170:25: sparse:     got void *[assigned] resv_ce_va
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:209:27: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[addressable] resv_mem_va @@
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:209:27: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:209:27: sparse:     got void *[addressable] resv_mem_va

vim +77 drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c

b5e9a80a77e31f Karl Li 2024-09-27   53  
b5e9a80a77e31f Karl Li 2024-09-27   54  static struct regmap *get_mbox_regmap(struct device *dev)
b5e9a80a77e31f Karl Li 2024-09-27   55  {
b5e9a80a77e31f Karl Li 2024-09-27   56  	struct device_node *mbox_node;
b5e9a80a77e31f Karl Li 2024-09-27   57  	struct platform_device *mbox_pdev;
b5e9a80a77e31f Karl Li 2024-09-27   58  	struct regmap *regmap = NULL;
b5e9a80a77e31f Karl Li 2024-09-27   59  	struct device_link *link;
b5e9a80a77e31f Karl Li 2024-09-27   60  
b5e9a80a77e31f Karl Li 2024-09-27   61  	mbox_node = of_parse_phandle(dev->of_node, "mediatek,mbox-spare-reg", 0);
b5e9a80a77e31f Karl Li 2024-09-27   62  	if (!mbox_node)
b5e9a80a77e31f Karl Li 2024-09-27   63  		return ERR_PTR(-ENODEV);
b5e9a80a77e31f Karl Li 2024-09-27   64  
b5e9a80a77e31f Karl Li 2024-09-27   65  	mbox_pdev = of_find_device_by_node(mbox_node);
b5e9a80a77e31f Karl Li 2024-09-27   66  	if (!mbox_pdev) {
b5e9a80a77e31f Karl Li 2024-09-27   67  		regmap = ERR_PTR(-EPROBE_DEFER);
b5e9a80a77e31f Karl Li 2024-09-27   68  		goto out_put_node;
b5e9a80a77e31f Karl Li 2024-09-27   69  	}
b5e9a80a77e31f Karl Li 2024-09-27   70  
b5e9a80a77e31f Karl Li 2024-09-27   71  	regmap = dev_get_regmap(&mbox_pdev->dev, NULL);
b5e9a80a77e31f Karl Li 2024-09-27   72  	if (!regmap)
b5e9a80a77e31f Karl Li 2024-09-27   73  		regmap = ERR_PTR(-EINVAL);
b5e9a80a77e31f Karl Li 2024-09-27   74  
b5e9a80a77e31f Karl Li 2024-09-27   75  	link = device_link_add(dev, &mbox_pdev->dev, DL_FLAG_PM_RUNTIME);
b5e9a80a77e31f Karl Li 2024-09-27   76  	if (!link)
b5e9a80a77e31f Karl Li 2024-09-27  @77  		return dev_err_probe(dev, -EPROBE_DEFER,
b5e9a80a77e31f Karl Li 2024-09-27   78  				     "failed to add device link between power and mailbox\n");
b5e9a80a77e31f Karl Li 2024-09-27   79  
b5e9a80a77e31f Karl Li 2024-09-27   80  	platform_device_put(mbox_pdev);
b5e9a80a77e31f Karl Li 2024-09-27   81  
b5e9a80a77e31f Karl Li 2024-09-27   82  out_put_node:
b5e9a80a77e31f Karl Li 2024-09-27   83  	of_node_put(mbox_node);
b5e9a80a77e31f Karl Li 2024-09-27   84  	return regmap;
b5e9a80a77e31f Karl Li 2024-09-27   85  }
b5e9a80a77e31f Karl Li 2024-09-27   86  
b5e9a80a77e31f Karl Li 2024-09-27   87  static int init_reg_base(struct platform_device *pdev, struct mtk_apu_power *apupw)
b5e9a80a77e31f Karl Li 2024-09-27   88  {
b5e9a80a77e31f Karl Li 2024-09-27   89  	for (unsigned int idx = 0; idx < ARRAY_SIZE(reg_name); idx++) {
b5e9a80a77e31f Karl Li 2024-09-27   90  		apupw->regs[idx] = devm_platform_ioremap_resource_byname(pdev, reg_name[idx]);
b5e9a80a77e31f Karl Li 2024-09-27   91  		if (IS_ERR(apupw->regs[idx]))
b5e9a80a77e31f Karl Li 2024-09-27   92  			return dev_err_probe(&pdev->dev, PTR_ERR(apupw->regs[idx]),
b5e9a80a77e31f Karl Li 2024-09-27   93  					     "%s remap base fail\n", reg_name[idx]);
b5e9a80a77e31f Karl Li 2024-09-27   94  	}
b5e9a80a77e31f Karl Li 2024-09-27   95  
b5e9a80a77e31f Karl Li 2024-09-27   96  	return 0;
b5e9a80a77e31f Karl Li 2024-09-27   97  }
b5e9a80a77e31f Karl Li 2024-09-27   98  
b5e9a80a77e31f Karl Li 2024-09-27   99  static uint32_t apusys_pwr_smc_call(struct device *dev, uint32_t smc_id, uint32_t a2)
b5e9a80a77e31f Karl Li 2024-09-27  100  {
b5e9a80a77e31f Karl Li 2024-09-27  101  	struct arm_smccc_res res;
b5e9a80a77e31f Karl Li 2024-09-27  102  
b5e9a80a77e31f Karl Li 2024-09-27  103  	dev_dbg(dev, "%s: smc call %d\n", __func__, smc_id);
b5e9a80a77e31f Karl Li 2024-09-27  104  
b5e9a80a77e31f Karl Li 2024-09-27  105  	arm_smccc_smc(MTK_SIP_APUSYS_CONTROL, smc_id, a2, 0, 0, 0, 0, 0, &res);
b5e9a80a77e31f Karl Li 2024-09-27  106  	if (((long) res.a0) < 0)
b5e9a80a77e31f Karl Li 2024-09-27  107  		dev_err(dev, "%s: smc call %d return error(%lu)\n", __func__, smc_id, res.a0);
b5e9a80a77e31f Karl Li 2024-09-27  108  
b5e9a80a77e31f Karl Li 2024-09-27  109  	return res.a0;
b5e9a80a77e31f Karl Li 2024-09-27  110  }
b5e9a80a77e31f Karl Li 2024-09-27  111  
b5e9a80a77e31f Karl Li 2024-09-27  112  
b5e9a80a77e31f Karl Li 2024-09-27  113  static int get_reserved_mem(struct device *dev, void **resv_mem_va)
b5e9a80a77e31f Karl Li 2024-09-27  114  {
b5e9a80a77e31f Karl Li 2024-09-27  115  	struct device_node *data_np;
b5e9a80a77e31f Karl Li 2024-09-27  116  	struct resource r;
b5e9a80a77e31f Karl Li 2024-09-27  117  	int ret;
b5e9a80a77e31f Karl Li 2024-09-27  118  
b5e9a80a77e31f Karl Li 2024-09-27  119  	/*
b5e9a80a77e31f Karl Li 2024-09-27  120  	 * To enable the MTK APU power feature, we need to load the binary of the
b5e9a80a77e31f Karl Li 2024-09-27  121  	 * Command Engine (CE) into the reserved memory, which is shared with the
b5e9a80a77e31f Karl Li 2024-09-27  122  	 * MTK APU remote processor (remoteproc) to store the APU image.
b5e9a80a77e31f Karl Li 2024-09-27  123  	 * Therefore, we need to parse the phandle and obtain the virtual address
b5e9a80a77e31f Karl Li 2024-09-27  124  	 * of that reserved memory.
b5e9a80a77e31f Karl Li 2024-09-27  125  	 */
b5e9a80a77e31f Karl Li 2024-09-27  126  	data_np = of_parse_phandle(dev->of_node, "memory-region", 0);
b5e9a80a77e31f Karl Li 2024-09-27  127  	if (!data_np) {
b5e9a80a77e31f Karl Li 2024-09-27  128  		dev_err(dev, "No reserved memory region found.\n");
b5e9a80a77e31f Karl Li 2024-09-27  129  		return -EINVAL;
b5e9a80a77e31f Karl Li 2024-09-27  130  	}
b5e9a80a77e31f Karl Li 2024-09-27  131  
b5e9a80a77e31f Karl Li 2024-09-27  132  	ret = of_address_to_resource(data_np, 0, &r);
b5e9a80a77e31f Karl Li 2024-09-27  133  	if (ret) {
b5e9a80a77e31f Karl Li 2024-09-27  134  		dev_err(dev, "failed to parse reserved memory: %d\n", ret);
b5e9a80a77e31f Karl Li 2024-09-27  135  		of_node_put(data_np);
b5e9a80a77e31f Karl Li 2024-09-27  136  		return ret;
b5e9a80a77e31f Karl Li 2024-09-27  137  	}
b5e9a80a77e31f Karl Li 2024-09-27  138  	of_node_put(data_np);
b5e9a80a77e31f Karl Li 2024-09-27  139  
b5e9a80a77e31f Karl Li 2024-09-27  140  	*resv_mem_va = devm_ioremap_wc(dev, r.start, resource_size(&r));
b5e9a80a77e31f Karl Li 2024-09-27  141  
b5e9a80a77e31f Karl Li 2024-09-27  142  	return 0;
b5e9a80a77e31f Karl Li 2024-09-27  143  }
b5e9a80a77e31f Karl Li 2024-09-27  144  
b5e9a80a77e31f Karl Li 2024-09-27  145  static int load_ce_bin(struct device *dev, const struct firmware *fw, void *resv_mem_va)
b5e9a80a77e31f Karl Li 2024-09-27  146  {
b5e9a80a77e31f Karl Li 2024-09-27  147  	struct apusys_secure_info_t *sec_info_ptr = NULL;
b5e9a80a77e31f Karl Li 2024-09-27  148  	const struct ptimg_hdr_t *hdr;
b5e9a80a77e31f Karl Li 2024-09-27  149  	const struct ptimg_hdr_t *hdr_end;
b5e9a80a77e31f Karl Li 2024-09-27  150  	const void *img;
b5e9a80a77e31f Karl Li 2024-09-27  151  	void *resv_ce_va;
b5e9a80a77e31f Karl Li 2024-09-27  152  
b5e9a80a77e31f Karl Li 2024-09-27  153  	hdr = (const struct ptimg_hdr_t *)(fw->data + 0x200);
b5e9a80a77e31f Karl Li 2024-09-27  154  	dev_dbg(dev, "%s: hdr->magic is 0x%x\n", __func__, hdr->magic);
b5e9a80a77e31f Karl Li 2024-09-27  155  
b5e9a80a77e31f Karl Li 2024-09-27  156  	sec_info_ptr = resv_mem_va + 0x100000;
b5e9a80a77e31f Karl Li 2024-09-27  157  	sec_info_ptr->ce_bin_ofs = 0x100000 + roundup(sizeof(*sec_info_ptr), 16);
b5e9a80a77e31f Karl Li 2024-09-27  158  	resv_ce_va = resv_mem_va + sec_info_ptr->ce_bin_ofs;
b5e9a80a77e31f Karl Li 2024-09-27  159  
b5e9a80a77e31f Karl Li 2024-09-27  160  	hdr_end = (const struct ptimg_hdr_t *)(fw->data + fw->size);
b5e9a80a77e31f Karl Li 2024-09-27  161  	while (hdr < hdr_end && hdr->magic == PT_MAGIC) {
b5e9a80a77e31f Karl Li 2024-09-27  162  		img = ((const void *) hdr) + hdr->hdr_size;
b5e9a80a77e31f Karl Li 2024-09-27  163  		dev_dbg(dev, "Rhdr->hdr_size= 0x%x\n", hdr->hdr_size);
b5e9a80a77e31f Karl Li 2024-09-27  164  		dev_dbg(dev, "img address is %p\n", img);
b5e9a80a77e31f Karl Li 2024-09-27  165  
b5e9a80a77e31f Karl Li 2024-09-27  166  		switch (hdr->id) {
b5e9a80a77e31f Karl Li 2024-09-27  167  		case PT_ID_CE_BIN:
b5e9a80a77e31f Karl Li 2024-09-27  168  			dev_dbg(dev, "PT_ID_CE_BIN\n");
b5e9a80a77e31f Karl Li 2024-09-27  169  			sec_info_ptr->ce_bin_sz = hdr->hdr_size + hdr->img_size;
b5e9a80a77e31f Karl Li 2024-09-27 @170  			memcpy_toio(resv_ce_va, img, sec_info_ptr->ce_bin_sz);
b5e9a80a77e31f Karl Li 2024-09-27  171  			dev_dbg(dev, "ce_bin_sz = 0x%x\n", sec_info_ptr->ce_bin_sz);
b5e9a80a77e31f Karl Li 2024-09-27  172  			return 0;
b5e9a80a77e31f Karl Li 2024-09-27  173  		default:
b5e9a80a77e31f Karl Li 2024-09-27  174  			break;
b5e9a80a77e31f Karl Li 2024-09-27  175  		}
b5e9a80a77e31f Karl Li 2024-09-27  176  
b5e9a80a77e31f Karl Li 2024-09-27  177  		img += roundup(hdr->img_size, hdr->align);
b5e9a80a77e31f Karl Li 2024-09-27  178  		hdr = (const struct ptimg_hdr_t *)img;
b5e9a80a77e31f Karl Li 2024-09-27  179  	}
b5e9a80a77e31f Karl Li 2024-09-27  180  
b5e9a80a77e31f Karl Li 2024-09-27  181  	return -EINVAL;
b5e9a80a77e31f Karl Li 2024-09-27  182  }
b5e9a80a77e31f Karl Li 2024-09-27  183  

:::::: The code at line 77 was first introduced by commit
:::::: b5e9a80a77e31f854ee4584ff3e7290800042a88 CHROMIUM: soc: mediatek: apu: Add mt8196 apu power driver

:::::: TO: Karl Li <karl.li@mediatek.corp-partner.google.com>
:::::: CC: Hubert Mazur <hmazur@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
