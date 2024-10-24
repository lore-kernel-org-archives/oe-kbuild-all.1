Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340331E3768
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 13:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776359; cv=none; b=GcBCdThSpyTkma00znqzjxuLFbeO/thUcktfKhfF2zmQ0BwxmpCI1MiTykgBQMn98AJQ7yZ+DQj20E7NzlkvKOEiJb4TZU+k5F0RiDJ1uSip3oqjWSRvcFq89uKsfjg2O1mP90vkdj2lYkNimqcgbw9kq59fehKLu2furRKloco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776359; c=relaxed/simple;
	bh=V7P2QpGPEywPxYxsCsDLXAYiCPWj0KCMg+8JvKaGN5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LsVIDhE8mnHLH2zRS55OfE525brOFad9W4UJO7V1ZfDNBHZhGW7brFGeCyaGH2m0R693ExPVauEgZrifK+1aj9IBhR0mVgOT3IWeKIhyuByoRtrsQN/32QzgWEzMkXFwKPqQGIEr8GIrH0+og90LOnm8S9jGXp75mpeN8QoFdq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnLohmop; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnLohmop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729776357; x=1761312357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V7P2QpGPEywPxYxsCsDLXAYiCPWj0KCMg+8JvKaGN5w=;
  b=jnLohmop42I6sebDNYZ4bkNx3jMO0eKi1k+fKhoyiBxzAVNlnT76Lotq
   i7UP7wpbRHZs2sJSc0YIKWAB/GJx3J9JTlIAc473LcyIKyZPf3A1dPV0V
   s3aH5XvF6R1xHBsmPE+/6LSUzMYYKLcWhTxJnd0zorcNM9fiERHJLZgU5
   bMqqW9OYTW7w545eMVR3d+iP3mfcObKB9ASi4UPpX/0GRXKm9AMJ7TPKM
   TAFL8w9mVoiEs7enzPrWhSLipwdwT/Mi/WV51Kxez9YBpr9bjYPeLmQBn
   jali8CLWGiEGsqAxLShvV7XuDXFmXc5upfkAjevM9rAFLHBHV/I2id7WC
   g==;
X-CSE-ConnectionGUID: XHE4R2wAQReQt58x0KJCLw==
X-CSE-MsgGUID: /bTascZCSaWMFyQouUuQSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29507851"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="29507851"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 06:25:57 -0700
X-CSE-ConnectionGUID: al92OGiNR4ysc8cBcR1zIg==
X-CSE-MsgGUID: rHFx0h1OSM+sNmctjQFI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85376136"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Oct 2024 06:25:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3xqb-000WTA-0A;
	Thu, 24 Oct 2024 13:25:53 +0000
Date: Thu, 24 Oct 2024 21:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [linux-next:master 125/6766]
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:79
 devm_imx_drm_legacy_bridge() warn: inconsistent indenting
Message-ID: <202410242113.f0qup4no-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
commit: 4c3d525f65733e760f3700c0f3c83e8e46d2dcd8 [125/6766] drm/imx: ldb: switch to imx_legacy_bridge / drm_bridge_connector
config: nios2-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242113.f0qup4no-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242113.f0qup4no-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:79 devm_imx_drm_legacy_bridge() warn: inconsistent indenting

vim +79 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c

cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  53  
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  54  struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  55  					      struct device_node *np,
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  56  					      int type)
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  57  {
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  58  	struct imx_legacy_bridge *imx_bridge;
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  59  	int ret;
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  60  
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  61  	imx_bridge = devm_kzalloc(dev, sizeof(*imx_bridge), GFP_KERNEL);
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  62  	if (!imx_bridge)
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  63  		return ERR_PTR(-ENOMEM);
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  64  
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  65  	ret = of_get_drm_display_mode(np,
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  66  				      &imx_bridge->mode,
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  67  				      &imx_bridge->bus_flags,
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  68  				      OF_USE_NATIVE_MODE);
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  69  	if (ret)
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  70  		return ERR_PTR(ret);
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  71  
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  72  	imx_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  73  
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  74  	imx_bridge->base.funcs = &imx_legacy_bridge_funcs;
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  75  	imx_bridge->base.of_node = np;
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  76  	imx_bridge->base.ops = DRM_BRIDGE_OP_MODES;
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  77  	imx_bridge->base.type = type;
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  78  
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02 @79         ret = devm_drm_bridge_add(dev, &imx_bridge->base);
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  80         if (ret)
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  81                 return ERR_PTR(ret);
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  82  
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  83  	return &imx_bridge->base;
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  84  }
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  85  EXPORT_SYMBOL_GPL(devm_imx_drm_legacy_bridge);
cc3e8a216d6b81 Dmitry Baryshkov 2024-06-02  86  

:::::: The code at line 79 was first introduced by commit
:::::: cc3e8a216d6b817c509e1e1a3700055d178e04f8 drm/imx: add internal bridge handling display-timings DT node

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
