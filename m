Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F6420A5D6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606830; cv=none; b=UldBKQCpRZ2UAjk8DrE6XYCEgVy8lbP+jDVM2Bj1Hw7safzzRDNVoFEirYyot9+ORpBSrteXIs/b384Dlb53TANAz56DIyk90xTJTJS6Hqz8E5MD37OMY7FfoKEBmdAWYyXky0/e0WJx20GFQxN/ufODKlfkhCUuTBLBYWZbw8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606830; c=relaxed/simple;
	bh=HUHf9kF5Oj8RI4edyKeMKH0qDMP5n0mZmHUEUK6h6BE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hRj/WDJhHShYM0AUUkA/PkzYf24bX0rgnHHt/RlTv2wZHhxl+2QOqA7XHf6vT3Zx+zJdv5QtZICJhB4CxUcddcy4sEy+plsHL6kD2IPcD3BRWr4OYwlyhDJSNVFgfuXpxiXCx4vQu56LJ9y7hq+cNDyOyWzEzRlTJJjDpyfgowU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTnYaRFg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTnYaRFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738606828; x=1770142828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HUHf9kF5Oj8RI4edyKeMKH0qDMP5n0mZmHUEUK6h6BE=;
  b=iTnYaRFgkZlg7+Y6aRJqLYVNkkPSJfyGhEaaBpd5u9AfAPkSTOaZuHX/
   6eXw/m6DiN4Fkocn0gpmCt1/OzJBZzO4Z+23ncis6ktAf8XGxhnLN3G/n
   8OtgSJglcNZxEhtvWw2KzqU3Lcn7ZsoNW1S3WMuuY5DlqJSOhVA24qoVP
   lEyAhoucZyx0D8DCQRqD2XXZ6xharA9nIQuryYoUVFl3LbO+a7RamtPPl
   XR5GCff6T6Z90Tu1l4tbnrO/x9zWg/JSXa+zqwJsLbyhT84VudBT2i1PR
   iK6+svv3Vf/TD8wb6C7aiuw3fnJb4K4WRS4QmWWqAeHn2aoLWHFomHCNl
   Q==;
X-CSE-ConnectionGUID: IwKfoHkIRW+uHk0SZGkY9Q==
X-CSE-MsgGUID: Fn6ZSg1zSjyVZR93+1Z4/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38991564"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="38991564"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 10:20:06 -0800
X-CSE-ConnectionGUID: 5SCA0O7AT4WlZxWV8N9yug==
X-CSE-MsgGUID: XcDH+q1/QiSf9t9C6cSxjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115517046"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2025 10:20:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf13B-000rKR-2A;
	Mon, 03 Feb 2025 18:20:01 +0000
Date: Tue, 4 Feb 2025 02:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 62/62]
 drivers/remoteproc/mediatek_apusys/mtk_apu_config.c:127:28: warning: cast
 from pointer to integer of different size
Message-ID: <202502040215.c0JcqJsp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1ac2c128a1d9a649ff94dc1ee22320aa6db6b1f6
commit: a467ce941a3031778c92225e24267a4ad48e74d9 [62/62] FIXUP: CHROMIUM: remoteproc: mediatek: Add APU config and timesync
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250204/202502040215.c0JcqJsp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040215.c0JcqJsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040215.c0JcqJsp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/mediatek_apusys/mtk_apu_config.c: In function 'mtk_apu_config_setup':
>> drivers/remoteproc/mediatek_apusys/mtk_apu_config.c:127:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     127 |         mdla_rv_mem->buf = (uint64_t)mdla_buf;
         |                            ^


vim +127 drivers/remoteproc/mediatek_apusys/mtk_apu_config.c

    44	
    45	int mtk_apu_config_setup(struct mtk_apu *apu)
    46	{
    47		struct device *dev = apu->dev;
    48		unsigned long flags;
    49		int ret;
    50		u64 timertick;
    51		struct mtk_apu_mdla_rv_mem *mdla_rv_mem;
    52		void *mdla_buf;
    53		dma_addr_t mdla_da;
    54	
    55		apu->conf_buf = dma_alloc_coherent(apu->dev, CONFIG_SIZE, &apu->conf_da, GFP_KERNEL);
    56	
    57		if (apu->conf_buf == NULL || apu->conf_da == 0) {
    58			dev_err(dev, "%s: dma_alloc_coherent fail\n", __func__);
    59			return -ENOMEM;
    60		}
    61	
    62		dev_dbg(dev, "%s: apu->conf_buf = %p, apu->conf_da = %pad\n", __func__,
    63			apu->conf_buf, &apu->conf_da);
    64	
    65		mtk_apu_config_user_ptr_init(apu);
    66	
    67		spin_lock_irqsave(&apu->reg_lock, flags);
    68		ret = regmap_field_write(apu->config_regmap_field, (u32)apu->conf_da);
    69		spin_unlock_irqrestore(&apu->reg_lock, flags);
    70	
    71		if (ret) {
    72			dev_err(dev, "Failed to set config address, ret = %d\n", ret);
    73			return ret;
    74		}
    75	
    76		spin_lock_irqsave(&apu->reg_lock, flags);
    77		apu->conf_buf->time_offset = sched_clock();
    78		timertick = arch_timer_read_counter();
    79		spin_unlock_irqrestore(&apu->reg_lock, flags);
    80	
    81		apu->conf_buf->time_diff = div_u64(timertick * 1000, 13) - apu->conf_buf->time_offset;
    82		apu->conf_buf->time_diff_cycle = timertick - div_u64(apu->conf_buf->time_offset * 13, 1000);
    83	
    84		ret = mtk_apu_ipi_config_init(apu);
    85		if (ret) {
    86			dev_err(dev, "apu ipi config init failed: %d\n", ret);
    87			goto free_apu_conf_buf;
    88		}
    89	
    90		if (apu->hw_logger_data != NULL) {
    91			dma_addr_t hw_log_buf_dma_addr;
    92			struct mtk_apu_logger_init_info *st_logger_init_info;
    93	
    94			hw_log_buf_dma_addr = mtk_apu_hw_logger_config_init(apu->hw_logger_data);
    95			st_logger_init_info = (struct mtk_apu_logger_init_info *)
    96				get_mtk_apu_config_user_ptr(apu->conf_buf, eLOGGER_INIT_INFO);
    97	
    98			if (hw_log_buf_dma_addr) {
    99				st_logger_init_info->iova = lower_32_bits(hw_log_buf_dma_addr);
   100				st_logger_init_info->iova_h = upper_32_bits(hw_log_buf_dma_addr);
   101				st_logger_init_info->lbc_sz = apu->hw_logger_data->hw_log_lbc_size;
   102				dev_dbg(dev, "set st_logger_init_info iova = 0x%x, iova_h = 0x%x, lbc_sz = 0x%x\n",
   103					st_logger_init_info->iova,
   104					st_logger_init_info->iova_h,
   105					st_logger_init_info->lbc_sz);
   106			} else {
   107				dev_err(dev, "hw_log_buf_dma_addr is NULL\n");
   108			}
   109		}
   110	
   111		ret = mvpu_config_init(apu);
   112		if (ret) {
   113			dev_info(apu->dev, "mvpu config init failed\n");
   114			goto free_apu_conf_buf;
   115		}
   116	
   117		mdla_rv_mem = (struct mtk_apu_mdla_rv_mem *)
   118			get_mtk_apu_config_user_ptr(apu->conf_buf, eMDLA_MEM_INFO);
   119	
   120		mdla_buf = dma_alloc_coherent(apu->dev, MDLA_RESERVE_MEM_SZ,
   121						      &mdla_da, GFP_KERNEL);
   122		if (mdla_buf == NULL || mdla_da == 0) {
   123			dev_err(dev, "%s() dma_alloc_coherent fail\n", __func__);
   124			return -ENOMEM;
   125		}
   126		mdla_rv_mem->size = MDLA_RESERVE_MEM_SZ;
 > 127		mdla_rv_mem->buf = (uint64_t)mdla_buf;
   128		mdla_rv_mem->da = mdla_da;
   129	
   130		return 0;
   131	
   132	free_apu_conf_buf:
   133		dma_free_coherent(apu->dev, CONFIG_SIZE, apu->conf_buf, apu->conf_da);
   134	
   135		return ret;
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
