Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C59183CD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735033925; cv=none; b=T6HY3tmajl3KJASiFAvSEfa6u+EjsRVD94Sy5KVaJdhbVTigBLeSft/A50lhbTWO4pSO9aSByGbJSckDGoquYFIBdHToEgeNjreZdHQ2bIsOOmFW6/Cmx6Mt4VKNT0pqshlldJ4DZ4p1GbHbNJ5xCYI0SCiYKbnuGBoIZW4u52o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735033925; c=relaxed/simple;
	bh=LkAHvLWSorDmHzZmdSfUQFsv/K7nOc6sVpnL8t3SZP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZ5AkdArfVwzvHIkCE6S3x8HuFszriHjQJkRiAmgIAixb8uXY7DQj6Ro09pL/jtMg01qoYSvBpBid6Ng9l2m3fSSsqXG9OHAAZmus3Kn6B2ciAmZROmYeHGrbWDuvEhDElo3eZFdL4t9B4G5csbw3G35Tbh0yq5q8ej0yN4aNds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+oUIH8F; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+oUIH8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735033923; x=1766569923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LkAHvLWSorDmHzZmdSfUQFsv/K7nOc6sVpnL8t3SZP8=;
  b=R+oUIH8F2zSqimkDj9aSQEltxGJ2q8Umswa7C6oFo/Aemyi8n9t3oA/Y
   Edx6YCIDyT/Q/BMm3mFPeFNr4j5u1gT+uPNbPJZwLZgTfRltBVKqdX3Bm
   svkR1LqXcg8FkVKx7te7OOtLjvGUwKvv/LEJ6BHWQddYLr5DF9lYeSFKs
   3Bs9BcNh0XpEIvPmvKR00fHjSzbLaTvQcyfbZZDUKugog58OUN8RgsBUC
   z3C/C7pzXhP0LgBm4BJbe07YeYTUa4u083U0U3ZhYuqvGLLLigYj+OqBQ
   3ia/4tpmVrSQP7g/HgQRUT2lz2cIAPSDruwH3zlwxuhGluiUjzw7K9Tl6
   Q==;
X-CSE-ConnectionGUID: 3rK0gmr8R7ObtH1EBl85BA==
X-CSE-MsgGUID: SODCVoipRfSyIgpF6Z3d0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="39281595"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="39281595"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 01:52:02 -0800
X-CSE-ConnectionGUID: 899QbtZuTxWG5DuBmoRnVw==
X-CSE-MsgGUID: jXz3/P0vTaSLN9QNnfE92g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130421047"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Dec 2024 01:52:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ1a2-00010Z-2x;
	Tue, 24 Dec 2024 09:51:58 +0000
Date: Tue, 24 Dec 2024 17:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2]
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:118:21: sparse: sparse: dubious: x
 & !y
Message-ID: <202412241714.1BlqBH7Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   57fdd37edf0708de00366c56c656447dadff9c7a
commit: 9baa083941fff504fa58dd7425088cba034697ba [2/2] UPSTREAM: drm/mediatek: gamma: Add support for 12-bit LUT
config: arm-randconfig-r133-20241224 (https://download.01.org/0day-ci/archive/20241224/202412241714.1BlqBH7Q-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce: (https://download.01.org/0day-ci/archive/20241224/202412241714.1BlqBH7Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412241714.1BlqBH7Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:118:21: sparse: sparse: dubious: x & !y
   drivers/gpu/drm/mediatek/mtk_disp_gamma.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:248:46: sparse: sparse: self-comparison always evaluates to false

vim +118 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

    83	
    84	/*
    85	 * SoCs supporting 12-bits LUTs are using a new register layout that does
    86	 * always support (by HW) both 12-bits and 10-bits LUT but, on those, we
    87	 * ignore the support for 10-bits in this driver and always use 12-bits.
    88	 *
    89	 * Summarizing:
    90	 * - SoC HW support 9/10-bits LUT only
    91	 *   - Old register layout
    92	 *     - 10-bits LUT supported
    93	 *     - 9-bits LUT not supported
    94	 * - SoC HW support both 10/12bits LUT
    95	 *   - New register layout
    96	 *     - 12-bits LUT supported
    97	 *     - 10-its LUT not supported
    98	 */
    99	void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
   100	{
   101		struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
   102		void __iomem *lut0_base = gamma->regs + DISP_GAMMA_LUT;
   103		void __iomem *lut1_base = gamma->regs + DISP_GAMMA_LUT1;
   104		u32 cfg_val, data_mode, lbank_val, word[2];
   105		u8 lut_bits = gamma->data->lut_bits;
   106		int cur_bank, num_lut_banks;
   107		struct drm_color_lut *lut;
   108		unsigned int i;
   109	
   110		/* If there's no gamma lut there's nothing to do here. */
   111		if (!state->gamma_lut)
   112			return;
   113	
   114		num_lut_banks = gamma->data->lut_size / gamma->data->lut_bank_size;
   115		lut = (struct drm_color_lut *)state->gamma_lut->data;
   116	
   117		/* Switch to 12 bits data mode if supported */
 > 118		data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(lut_bits == 12));
   119	
   120		for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
   121	
   122			/* Switch gamma bank and set data mode before writing LUT */
   123			if (num_lut_banks > 1) {
   124				lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
   125				lbank_val |= data_mode;
   126				writel(lbank_val, gamma->regs + DISP_GAMMA_BANK);
   127			}
   128	
   129			for (i = 0; i < gamma->data->lut_bank_size; i++) {
   130				int n = cur_bank * gamma->data->lut_bank_size + i;
   131				struct drm_color_lut diff, hwlut;
   132	
   133				hwlut.red = drm_color_lut_extract(lut[n].red, lut_bits);
   134				hwlut.green = drm_color_lut_extract(lut[n].green, lut_bits);
   135				hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
   136	
   137				if (!gamma->data->lut_diff || (i % 2 == 0)) {
   138					if (lut_bits == 12) {
   139						word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, hwlut.red);
   140						word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, hwlut.green);
   141						word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, hwlut.blue);
   142					} else {
   143						word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
   144						word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
   145						word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
   146					}
   147				} else {
   148					diff.red = lut[n].red - lut[n - 1].red;
   149					diff.red = drm_color_lut_extract(diff.red, lut_bits);
   150	
   151					diff.green = lut[n].green - lut[n - 1].green;
   152					diff.green = drm_color_lut_extract(diff.green, lut_bits);
   153	
   154					diff.blue = lut[n].blue - lut[n - 1].blue;
   155					diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
   156	
   157					if (lut_bits == 12) {
   158						word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, diff.red);
   159						word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, diff.green);
   160						word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, diff.blue);
   161					} else {
   162						word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
   163						word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
   164						word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
   165					}
   166				}
   167				writel(word[0], lut0_base + i * 4);
   168				if (lut_bits == 12)
   169					writel(word[1], lut1_base + i * 4);
   170			}
   171		}
   172	
   173		cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
   174	
   175		/* Enable the gamma table */
   176		cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
   177	
   178		cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
