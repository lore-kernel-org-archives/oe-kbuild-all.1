Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528862010E1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740315221; cv=none; b=UgIzpWU9hQ1+sGYNQylOqu4cioYSQKe7jIq4I8UUNf8dSglJEKxQHtiduA2gD8k3xi37PlM55bYt0cPIJ0fd8d4zUoRIGXmKQcO3akbEwaA8cpXhpGuD16ojC2mevjWLmkzmYJ6wzXyqKc+oEMb28Sh3nNUPoC+LE/FNXtmWMPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740315221; c=relaxed/simple;
	bh=J4oPjScBRL+g0VbD2qFWaMpfSN42oqehgcyWZTr/l1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qraBDBXDliYtXJ/zsX9RV/y0FdCRgVK7Xho7SLVoq1NlZAzMZwPZBN3mQbqqaqqyaJOMrekIS5kL6g5/pK5VBNcEuM1CouMZPPS0Jl3LFrtOOXG0bxtA2qTGlw/kGLm9xAVlmsawKKEzGlQs8PSOo/6iMMZphTk0E4xnbHlxovE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJM5jiMl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJM5jiMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740315219; x=1771851219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J4oPjScBRL+g0VbD2qFWaMpfSN42oqehgcyWZTr/l1k=;
  b=SJM5jiMlMuEqnNr57pA5Sbug1fEDXxlMaXxNE5gr2FlCkYDWE312JvHp
   FjfCfgr9YJEOcaY9UxEq7T0OeKFO20vvY972S/jw45qO+aePK5cRbbZD9
   FlxctZ+rKTUi2YEp3i/QDxFCqKvq1car3R9rci2+Zm4h9LL9vAaEZTady
   cMLEBGrgs2iWSGDLOxyAQqDNfSqm7lLcJAPvptMWKv1hdC/uf0g+3QgCz
   i9kohp8N1SjTg7qLC+dEnQthizPjU8/CQMBp4QfJR7mU7oGKBVhm/c5kW
   Ik7PDhm5CrUgimc0lc7Tn75AqF0kIk0qUJarL0wMSH2CtOk8jhK7aSARf
   Q==;
X-CSE-ConnectionGUID: ikNXhaFpRnyZKxfQvSmmOw==
X-CSE-MsgGUID: rqb17c+1QQW6Om9GYtCrZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="44860682"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="44860682"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 04:53:38 -0800
X-CSE-ConnectionGUID: wi4WSVJRR56Vg1DBf02SQg==
X-CSE-MsgGUID: HDtbTljgTNS/o/F+lEcdKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116006717"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Feb 2025 04:53:36 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmBUE-0007KZ-0j;
	Sun, 23 Feb 2025 12:53:34 +0000
Date: Sun, 23 Feb 2025 20:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 9/9]
 drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:140:22: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202502232055.Ewpyn7Ph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen-Yu,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   be485e577c3a0ec3fd52f17d7b423cadc8fc63e4
commit: 2a31ba9e7f3281af99478bf373f1f9a063e81d81 [9/9] FIXUP: CHROMIUM: soc: mediatek: apu: Add mt8196 apu power driver
config: arm64-randconfig-r112-20250223 (https://download.01.org/0day-ci/archive/20250223/202502232055.Ewpyn7Ph-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250223/202502232055.Ewpyn7Ph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502232055.Ewpyn7Ph-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:140:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:140:22: sparse:     expected void *
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:140:22: sparse:     got void [noderef] __iomem *
>> drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:170:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *[assigned] resv_ce_va @@
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:170:25: sparse:     expected void volatile [noderef] __iomem *
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:170:25: sparse:     got void *[assigned] resv_ce_va
>> drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:209:27: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *[addressable] resv_mem_va @@
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:209:27: sparse:     expected void [noderef] __iomem *addr
   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:209:27: sparse:     got void *[addressable] resv_mem_va

vim +140 drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c

ae0429c5708a06 Karl Li 2024-09-27  111  
ae0429c5708a06 Karl Li 2024-09-27  112  
ae0429c5708a06 Karl Li 2024-09-27  113  static int get_reserved_mem(struct device *dev, void **resv_mem_va)
ae0429c5708a06 Karl Li 2024-09-27  114  {
ae0429c5708a06 Karl Li 2024-09-27  115  	struct device_node *data_np;
ae0429c5708a06 Karl Li 2024-09-27  116  	struct resource r;
ae0429c5708a06 Karl Li 2024-09-27  117  	int ret;
ae0429c5708a06 Karl Li 2024-09-27  118  
ae0429c5708a06 Karl Li 2024-09-27  119  	/*
ae0429c5708a06 Karl Li 2024-09-27  120  	 * To enable the MTK APU power feature, we need to load the binary of the
ae0429c5708a06 Karl Li 2024-09-27  121  	 * Command Engine (CE) into the reserved memory, which is shared with the
ae0429c5708a06 Karl Li 2024-09-27  122  	 * MTK APU remote processor (remoteproc) to store the APU image.
ae0429c5708a06 Karl Li 2024-09-27  123  	 * Therefore, we need to parse the phandle and obtain the virtual address
ae0429c5708a06 Karl Li 2024-09-27  124  	 * of that reserved memory.
ae0429c5708a06 Karl Li 2024-09-27  125  	 */
ae0429c5708a06 Karl Li 2024-09-27  126  	data_np = of_parse_phandle(dev->of_node, "memory-region", 0);
ae0429c5708a06 Karl Li 2024-09-27  127  	if (!data_np) {
ae0429c5708a06 Karl Li 2024-09-27  128  		dev_err(dev, "No reserved memory region found.\n");
ae0429c5708a06 Karl Li 2024-09-27  129  		return -EINVAL;
ae0429c5708a06 Karl Li 2024-09-27  130  	}
ae0429c5708a06 Karl Li 2024-09-27  131  
ae0429c5708a06 Karl Li 2024-09-27  132  	ret = of_address_to_resource(data_np, 0, &r);
ae0429c5708a06 Karl Li 2024-09-27  133  	if (ret) {
ae0429c5708a06 Karl Li 2024-09-27  134  		dev_err(dev, "failed to parse reserved memory: %d\n", ret);
ae0429c5708a06 Karl Li 2024-09-27  135  		of_node_put(data_np);
ae0429c5708a06 Karl Li 2024-09-27  136  		return ret;
ae0429c5708a06 Karl Li 2024-09-27  137  	}
ae0429c5708a06 Karl Li 2024-09-27  138  	of_node_put(data_np);
ae0429c5708a06 Karl Li 2024-09-27  139  
ae0429c5708a06 Karl Li 2024-09-27 @140  	*resv_mem_va = devm_ioremap_wc(dev, r.start, resource_size(&r));
ae0429c5708a06 Karl Li 2024-09-27  141  
ae0429c5708a06 Karl Li 2024-09-27  142  	return 0;
ae0429c5708a06 Karl Li 2024-09-27  143  }
ae0429c5708a06 Karl Li 2024-09-27  144  
ae0429c5708a06 Karl Li 2024-09-27  145  static int load_ce_bin(struct device *dev, const struct firmware *fw, void *resv_mem_va)
ae0429c5708a06 Karl Li 2024-09-27  146  {
ae0429c5708a06 Karl Li 2024-09-27  147  	struct apusys_secure_info_t *sec_info_ptr = NULL;
ae0429c5708a06 Karl Li 2024-09-27  148  	const struct ptimg_hdr_t *hdr;
ae0429c5708a06 Karl Li 2024-09-27  149  	const struct ptimg_hdr_t *hdr_end;
ae0429c5708a06 Karl Li 2024-09-27  150  	const void *img;
ae0429c5708a06 Karl Li 2024-09-27  151  	void *resv_ce_va;
ae0429c5708a06 Karl Li 2024-09-27  152  
ae0429c5708a06 Karl Li 2024-09-27  153  	hdr = (const struct ptimg_hdr_t *)(fw->data + 0x200);
ae0429c5708a06 Karl Li 2024-09-27  154  	dev_dbg(dev, "%s: hdr->magic is 0x%x\n", __func__, hdr->magic);
ae0429c5708a06 Karl Li 2024-09-27  155  
ae0429c5708a06 Karl Li 2024-09-27  156  	sec_info_ptr = resv_mem_va + 0x100000;
ae0429c5708a06 Karl Li 2024-09-27  157  	sec_info_ptr->ce_bin_ofs = 0x100000 + roundup(sizeof(*sec_info_ptr), 16);
ae0429c5708a06 Karl Li 2024-09-27  158  	resv_ce_va = resv_mem_va + sec_info_ptr->ce_bin_ofs;
ae0429c5708a06 Karl Li 2024-09-27  159  
ae0429c5708a06 Karl Li 2024-09-27  160  	hdr_end = (const struct ptimg_hdr_t *)(fw->data + fw->size);
ae0429c5708a06 Karl Li 2024-09-27  161  	while (hdr < hdr_end && hdr->magic == PT_MAGIC) {
ae0429c5708a06 Karl Li 2024-09-27  162  		img = ((const void *) hdr) + hdr->hdr_size;
ae0429c5708a06 Karl Li 2024-09-27  163  		dev_dbg(dev, "Rhdr->hdr_size= 0x%x\n", hdr->hdr_size);
ae0429c5708a06 Karl Li 2024-09-27  164  		dev_dbg(dev, "img address is %p\n", img);
ae0429c5708a06 Karl Li 2024-09-27  165  
ae0429c5708a06 Karl Li 2024-09-27  166  		switch (hdr->id) {
ae0429c5708a06 Karl Li 2024-09-27  167  		case PT_ID_CE_BIN:
ae0429c5708a06 Karl Li 2024-09-27  168  			dev_dbg(dev, "PT_ID_CE_BIN\n");
ae0429c5708a06 Karl Li 2024-09-27  169  			sec_info_ptr->ce_bin_sz = hdr->hdr_size + hdr->img_size;
ae0429c5708a06 Karl Li 2024-09-27 @170  			memcpy_toio(resv_ce_va, img, sec_info_ptr->ce_bin_sz);
ae0429c5708a06 Karl Li 2024-09-27  171  			dev_dbg(dev, "ce_bin_sz = 0x%x\n", sec_info_ptr->ce_bin_sz);
ae0429c5708a06 Karl Li 2024-09-27  172  			return 0;
ae0429c5708a06 Karl Li 2024-09-27  173  		default:
ae0429c5708a06 Karl Li 2024-09-27  174  			break;
ae0429c5708a06 Karl Li 2024-09-27  175  		}
ae0429c5708a06 Karl Li 2024-09-27  176  
ae0429c5708a06 Karl Li 2024-09-27  177  		img += roundup(hdr->img_size, hdr->align);
ae0429c5708a06 Karl Li 2024-09-27  178  		hdr = (const struct ptimg_hdr_t *)img;
ae0429c5708a06 Karl Li 2024-09-27  179  	}
ae0429c5708a06 Karl Li 2024-09-27  180  
ae0429c5708a06 Karl Li 2024-09-27  181  	return -EINVAL;
ae0429c5708a06 Karl Li 2024-09-27  182  }
ae0429c5708a06 Karl Li 2024-09-27  183  
ae0429c5708a06 Karl Li 2024-09-27  184  static int setup_ce_bin(struct device *dev, const char *fw_path)
ae0429c5708a06 Karl Li 2024-09-27  185  {
ae0429c5708a06 Karl Li 2024-09-27  186  	const struct firmware *fw;
ae0429c5708a06 Karl Li 2024-09-27  187  	int ret;
ae0429c5708a06 Karl Li 2024-09-27  188  	void *resv_mem_va;
ae0429c5708a06 Karl Li 2024-09-27  189  
ae0429c5708a06 Karl Li 2024-09-27  190  	ret = request_firmware(&fw, fw_path, dev);
ae0429c5708a06 Karl Li 2024-09-27  191  	if (ret < 0) {
ae0429c5708a06 Karl Li 2024-09-27  192  		dev_err(dev, "failed to load firmware '%s': %d\n", fw_path, ret);
ae0429c5708a06 Karl Li 2024-09-27  193  		return ret;
ae0429c5708a06 Karl Li 2024-09-27  194  	}
ae0429c5708a06 Karl Li 2024-09-27  195  
ae0429c5708a06 Karl Li 2024-09-27  196  	ret = get_reserved_mem(dev, &resv_mem_va);
ae0429c5708a06 Karl Li 2024-09-27  197  	if (ret)
ae0429c5708a06 Karl Li 2024-09-27  198  		goto out_release_fw;
ae0429c5708a06 Karl Li 2024-09-27  199  
ae0429c5708a06 Karl Li 2024-09-27  200  	ret = load_ce_bin(dev, fw, resv_mem_va);
ae0429c5708a06 Karl Li 2024-09-27  201  	if (ret)
ae0429c5708a06 Karl Li 2024-09-27  202  		goto out_unmap_mem;
ae0429c5708a06 Karl Li 2024-09-27  203  
ae0429c5708a06 Karl Li 2024-09-27  204  	ret = apusys_pwr_smc_call(dev, MTK_APUSYS_KERNEL_OP_APUSYS_SETUP_CE_BIN, 0);
ae0429c5708a06 Karl Li 2024-09-27  205  	if (ret)
ae0429c5708a06 Karl Li 2024-09-27  206  		dev_err(dev, "%s: load ce bin failed, ret = %d\n", __func__, ret);
ae0429c5708a06 Karl Li 2024-09-27  207  
ae0429c5708a06 Karl Li 2024-09-27  208  out_unmap_mem:
ae0429c5708a06 Karl Li 2024-09-27 @209  	devm_iounmap(dev, resv_mem_va);
ae0429c5708a06 Karl Li 2024-09-27  210  
ae0429c5708a06 Karl Li 2024-09-27  211  out_release_fw:
ae0429c5708a06 Karl Li 2024-09-27  212  	release_firmware(fw);
ae0429c5708a06 Karl Li 2024-09-27  213  
ae0429c5708a06 Karl Li 2024-09-27  214  	return ret;
ae0429c5708a06 Karl Li 2024-09-27  215  }
ae0429c5708a06 Karl Li 2024-09-27  216  

:::::: The code at line 140 was first introduced by commit
:::::: ae0429c5708a06415ad0022fc8a148202780b402 CHROMIUM: soc: mediatek: apu: Add mt8196 apu power driver

:::::: TO: Karl Li <karl.li@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
