Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF532EDD7D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 20:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272172; cv=none; b=MGpX0fTO2mPQSYuD50v/DSgsrZfFcT5AEXPtvhM4kbzQ22FFaxQ2hVO1jZ+MDNAZhsG1ipZHGlJMLKhqoBpSAgY14ZSvQ3UH7WA8WxORLJYtQi2LDX2T9kQDwr12NT2LLbVCZDjam9Y0tCVBQvX6ziXBXj2gGhSaSoP1WgjGVSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272172; c=relaxed/simple;
	bh=hJDZ9VU7zZW3ClDIqJVJg20PL/lrc8SseovSZDfIeeI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QgNHDqFhIBxw2ebj7/Nx2tBivCBpqzQswG9zyKiQAQ507jNihUzfd/eD+2HKZ0h2sBonFilR2TW+mBPXDjdrcjr23Coegw4hljAzhP68nz+rO1hBc3XiIiz2GAUUKyfTycQOi3nb98NbrXyEcRHVORoJceR12Ib+XIbzU+5nX8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2LXrupn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2LXrupn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778272171; x=1809808171;
  h=date:from:to:cc:subject:message-id;
  bh=hJDZ9VU7zZW3ClDIqJVJg20PL/lrc8SseovSZDfIeeI=;
  b=W2LXrupnfmo+K2NOFGv+ri9JFeoqHOYJMQYruGJnKnGREPNqpXJIe79m
   tgRmhi+JVZU+9Uf7UEsPFK93C8AtxTrtDz67cq6O8PUQTmj/2DcDV41/q
   NIcMxloqFRrkLAOXO4aPF+ypAah9TggO9PN9Mz+NN8LFe2e+JHZDpL6ho
   5V+kTvuMXs0xThNMjdmbgr4P07aZdlJlsU1KsTOD/i9y4S+TolHljEx18
   NBBj7bqv+OyvdORFfNIzfgC81cPqJk9d+uImCryuRhH6n/B8Vqvh6xN2A
   6+ZYXuOaPeFWQs8W6xaHAjJPhAh8AUiL6M+XUbDbDDm9RO2Go2+8mJx/v
   w==;
X-CSE-ConnectionGUID: Uu/XvFmvR7mwWHzJlf4p9w==
X-CSE-MsgGUID: imft3cfnSXC7PrWrKKVXig==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90631866"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="90631866"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 13:29:30 -0700
X-CSE-ConnectionGUID: IJ8io+hjTWi+hWLW4byS3A==
X-CSE-MsgGUID: epw6m0CiTFOHAXbBHIBLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="236799798"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2026 13:29:27 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLRp6-000000000Px-3kQs;
	Fri, 08 May 2026 20:29:24 +0000
Date: Sat, 09 May 2026 04:28:57 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [frank-li:imx/firmware-ele 5/5]
 drivers/firmware/imx/se_ctrl.c:476:2-7: WARNING: invalid free of devm_
 allocated data
Message-ID: <202605090441.GzJS1R6y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/firmware-ele
head:   63536a73a3bbf69d097e45c4f3d419ee32533f20
commit: 63536a73a3bbf69d097e45c4f3d419ee32533f20 [5/5] firmware: drivers: imx: adds miscdev
config: arm-randconfig-r054-20260509 (https://download.01.org/0day-ci/archive/20260509/202605090441.GzJS1R6y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090441.GzJS1R6y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/se_ctrl.c:476:2-7: WARNING: invalid free of devm_ allocated data
   drivers/firmware/imx/se_ctrl.c:487:2-7: WARNING: invalid free of devm_ allocated data
--
>> drivers/firmware/imx/se_ctrl.c:491:16-23: ERROR: reference preceded by free on line 487

vim +476 drivers/firmware/imx/se_ctrl.c

   460	
   461	static int init_device_context(struct se_if_priv *priv, int ch_id,
   462				       struct se_if_device_ctx **new_dev_ctx)
   463	{
   464		struct se_if_device_ctx *dev_ctx;
   465		int ret = 0;
   466	
   467		dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
   468	
   469		if (!dev_ctx)
   470			return -ENOMEM;
   471	
   472		dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
   473					     get_se_if_name(priv->if_defs->se_if_type),
   474					     ch_id);
   475		if (!dev_ctx->devname) {
 > 476			kfree(dev_ctx);
   477			return -ENOMEM;
   478		}
   479	
   480		mutex_init(&dev_ctx->fops_lock);
   481		dev_ctx->priv = priv;
   482		*new_dev_ctx = dev_ctx;
   483	
   484		ret = init_se_shared_mem(dev_ctx);
   485		if (ret < 0) {
   486			kfree(dev_ctx->devname);
 > 487			kfree(dev_ctx);
   488			*new_dev_ctx = NULL;
   489		}
   490	
 > 491		list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
   492		priv->active_devctx_count++;
   493	
   494		return ret;
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
