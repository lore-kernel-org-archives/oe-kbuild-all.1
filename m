Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F0334251B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809518; cv=none; b=k/5WPpC1AdDTCobVBe6Z3nItzSG5wBMHcnn2xBWXobTAxODRxnSb4C39l8s6pDYPcSl8FUgmiFsCaG0ehlvzev8nZnI8srkNfQFVCysXPeeN1JeXr8jfJwAjHvECM8J4ZlVzpyfLvLS0NSFzBGvsV+jIF6bUR14QJsfO2NkTgQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809518; c=relaxed/simple;
	bh=UYi8UFg8RLugetyUTiAOPCczLcuH76UjThNoY+0oZls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sXEE5d1XAJ+mUQVo3Ns/YVG4yhXUtFQCT0lThNhxDb8v5Xxf3+eGxFdWq1Mi/Deln6oKKiJz7GDtOOY3ulg1+yTj0BLYR4+B8k0epwWwgAzNBfo3cdVU7MND2Vb+2BkSZPNIPyByIcOWZXzy5NKOc5O96hvfs6gFtyJrNt8uZrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5h1IhLW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5h1IhLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782809516; x=1814345516;
  h=date:from:to:cc:subject:message-id;
  bh=UYi8UFg8RLugetyUTiAOPCczLcuH76UjThNoY+0oZls=;
  b=k5h1IhLWsBWnVo0X1tuo6QBGKL34RdAcaapOOZYLpBXFEkONGh3d6Hnr
   TvBAe5nFEt+V5DuxlRu4eplkNBa1GVEa41f4GGQKxZHMLqQ7zcwyzo/oz
   sFecAhf5iT6GdT+bmpE0v4mRlZrbVGLfE94kARdFtPLHXAWBV29uZ6ZdC
   q5TyDFFxb/+N+/KRDUBZSDp4p6qEDwsITXOhwOlgYvy9MCWsEhl2MMRg6
   5KwP8qUX6KjkuukhZbuan1H2rsguzvZsOWrlRCBa4hrsKq0lj/kjNyBK3
   OwvOXksPeNrLsyVMnHAKo/cBZ5u5n6q9b5zHCiOmCzEm2lZXq6j/LDRUX
   Q==;
X-CSE-ConnectionGUID: G8I379ThSfSymHCEXRSNUA==
X-CSE-MsgGUID: gd87F9SkRSGKC+JST/NreA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83543793"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83543793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 01:51:56 -0700
X-CSE-ConnectionGUID: GOeb2m29QZaVK2BnMV536A==
X-CSE-MsgGUID: nBBGOXp9SfmPfAPNVzl1tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="255800702"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Jun 2026 01:51:53 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weUC6-000000008AP-3V1k;
	Tue, 30 Jun 2026 08:51:50 +0000
Date: Tue, 30 Jun 2026 16:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: drivers/gpu/drm/verisilicon/vs_bridge.c:325:9-16: WARNING:
 ERR_CAST can be used with bridge
Message-ID: <202606301646.QdPI1IbT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: dbf21777caa8b8c88c12f7f036b01208fec0d55a drm: verisilicon: add a driver for Verisilicon display controllers
date:   5 months ago
config: parisc-randconfig-r063-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301646.QdPI1IbT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301646.QdPI1IbT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/verisilicon/vs_bridge.c:325:9-16: WARNING: ERR_CAST can be used with bridge

vim +325 drivers/gpu/drm/verisilicon/vs_bridge.c

   288	
   289	struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
   290					 struct vs_crtc *crtc)
   291	{
   292		unsigned int output = crtc->id;
   293		struct vs_bridge *bridge;
   294		struct drm_bridge *next;
   295		enum vs_bridge_output_interface intf;
   296		const struct drm_bridge_funcs *bridge_funcs;
   297		int ret, enctype;
   298	
   299		intf = vs_bridge_detect_output_interface(drm_dev->dev->of_node,
   300							 output);
   301		if (intf == -ENODEV) {
   302			drm_dbg(drm_dev, "Skipping output %u\n", output);
   303			return NULL;
   304		}
   305	
   306		next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
   307					      output, intf);
   308		if (IS_ERR(next)) {
   309			ret = PTR_ERR(next);
   310			if (ret != -EPROBE_DEFER)
   311				drm_err(drm_dev,
   312					"Cannot get downstream bridge of output %u\n",
   313					output);
   314			return ERR_PTR(ret);
   315		}
   316	
   317		if (intf == VSDC_OUTPUT_INTERFACE_DPI)
   318			bridge_funcs = &vs_dpi_bridge_funcs;
   319		else
   320			bridge_funcs = &vs_dp_bridge_funcs;
   321	
   322		bridge = devm_drm_bridge_alloc(drm_dev->dev, struct vs_bridge, base,
   323					       bridge_funcs);
   324		if (IS_ERR(bridge))
 > 325			return ERR_PTR(PTR_ERR(bridge));

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
