Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3784019993C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 02:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727492041; cv=none; b=GtWz1HhAHCbQ39EBhdqnU+h2i6FFDiKRi4or4tQc3gQlKFYvM0YbgR+GfOsMvQs0cqduQDHf6D3TV8VNNM7vKHLicUVv6lTI7jdFf3Y1WaxPwED9n/eUqwbESOIqDNTFFP6yB+2XoQd7UvfkPYW7MHT6/EsU2gSDUiYPFe4bU+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727492041; c=relaxed/simple;
	bh=9MBP7wINHL2yMP3upwaDoDiX6q78Ef9Q5fPtayVcark=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rg3FuOWd7gXeiAgN4U3zlUr7uE5mxktIuBfOj3Puk73JoVeH1EbG7ViKCKzbDrFr6zfbf/ceJw83bfSaIHjd586pzkkRYH2qcYb6PGM7nuY4GQESvhew01EnURkKtJ2TIVWFLNuoqvgjJnGnrWaIt+AEkLJKUPryrlTerAIMKlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNR/bgyH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNR/bgyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727492040; x=1759028040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MBP7wINHL2yMP3upwaDoDiX6q78Ef9Q5fPtayVcark=;
  b=hNR/bgyHwNtl5+2VhnkvQ0wyz7nu+n2KoTkjymiO28I93LXjsSmgGevy
   wdiRz3B0tKqG6tiLQbtx47oTdVvZ5kLvbmQQloasnPk1c5BKimoiskXcX
   b+QE1MmzPPzYUYZ9nhG4FB3M59UnkktGPHLUej3UcwPOqUgN2ZCkNvDvt
   15jOXzZHmA9TS9KL8yyEzOGPhk3bFJ2hGetQsiFthRpHs8z2u0nI/FsJD
   EtI0JgVfxLO1GCuZmUcfQot0eIFCt9kQq59Kcf6azB8mq3yRwLoS3wr0s
   /pLsr1JaLsP0qAuiYg3rm0sgU5skdgSxX/gA8HtzoDFjgGibeqqzN4ICq
   w==;
X-CSE-ConnectionGUID: YzCDAdv2Ste6gNh8l+ey0w==
X-CSE-MsgGUID: jJ5PLptGSeClhmPnnOj6EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26779793"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26779793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 19:53:59 -0700
X-CSE-ConnectionGUID: NC3Key59QJGLJQ9mV3FeAg==
X-CSE-MsgGUID: 8eq4cKGuQEuD8khdsqjbuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="73513457"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2024 19:53:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suNal-000MrV-0i;
	Sat, 28 Sep 2024 02:53:55 +0000
Date: Sat, 28 Sep 2024 10:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14416/30000]
 drivers/gpu/drm/loongson/lsdc_output.c:379:63: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202409281002.dDRqb1Lc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 80764bc784413eb604c7d472db55b1ca72d4bbc5 [14416/30000] drm/loongson: add kernel modesetting driver support for ls7a1000/ls7a2000
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240928/202409281002.dDRqb1Lc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240928/202409281002.dDRqb1Lc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281002.dDRqb1Lc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_output.c:379:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *reg_base @@     got void [noderef] __iomem *reg_base @@
   drivers/gpu/drm/loongson/lsdc_output.c:379:63: sparse:     expected void *reg_base
   drivers/gpu/drm/loongson/lsdc_output.c:379:63: sparse:     got void [noderef] __iomem *reg_base

vim +379 drivers/gpu/drm/loongson/lsdc_output.c

   338	
   339	/* No DT support, provide a minimal support */
   340	int lsdc_create_output(struct lsdc_device *ldev,
   341			       unsigned int index,
   342			       unsigned int num_crtc)
   343	{
   344		const struct lsdc_chip_desc * const descp = ldev->desc;
   345		struct lsdc_display_pipe * const dispipe = &ldev->dispipe[index];
   346		struct drm_device *ddev = ldev->ddev;
   347		int encoder_type = DRM_MODE_ENCODER_DPI;
   348		int connector_type = DRM_MODE_CONNECTOR_DPI;
   349		struct lsdc_output *output;
   350		struct drm_encoder *encoder;
   351		struct drm_connector *connector;
   352		int ret;
   353	
   354		output = devm_kzalloc(ddev->dev, sizeof(*output), GFP_KERNEL);
   355		if (!output)
   356			return -ENOMEM;
   357	
   358		encoder = &output->encoder;
   359	
   360		if (descp->chip == LSDC_CHIP_7A2000) {
   361			encoder_type = DRM_MODE_ENCODER_TMDS;
   362			connector_type = DRM_MODE_CONNECTOR_HDMIA;
   363		}
   364	
   365		ret = drm_encoder_init(ddev, encoder, &lsdc_encoder_funcs,
   366				       encoder_type, "encoder-%u", index);
   367	
   368		if (ret) {
   369			drm_err(ddev, "Failed to init encoder: %d\n", ret);
   370			return ret;
   371		}
   372	
   373		if (descp->chip == LSDC_CHIP_7A2000)
   374			drm_encoder_helper_add(encoder, &ls7a2000_hdmi_encoder_helper_funcs);
   375	
   376		encoder->possible_crtcs = BIT(index);
   377	
   378		if (descp->has_builtin_i2c) {
 > 379			output->li2c = lsdc_create_i2c_chan(ddev, ldev->reg_base, index);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
