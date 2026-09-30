Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88033F7AA8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 22:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806067; cv=none; b=OQcY0loP+nDMDi9VroNdmvO3MbTZ2p+MdCMjePGegzsqlPPxmF8T1lJOsNx2H9ylcltGJgbfUmeATWXZf7BaHyk4XmIY6Rrld7FquwiERrpUgvYEFKrUXV/qmk+o66hOg3Ak/HSYqRnPFALzUrVrxJpbvBzaj+eugM0LBEa/dZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806067; c=relaxed/simple;
	bh=F5RaEM3/mtlUzKjHy1tUKQRgnl2pgITC2NV45hGLs9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KGzgxFxtkKT5idSe+Z+tpXmw1mtFzCpvffpmpyULQLKrfZhneWzOdPjt8alsBHhlZrO9fWxCbuq4gLlESqeqECWqOKg0y1r96TNQKxzsC4snS5xPigFMuq67dUqYq3lJ4tdwAy+Eyxp1ZpWVQbBwYm0qGia0+CibhnaiGQaVhsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8YYlM1x; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8YYlM1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790806065; x=1822342065;
  h=date:from:to:cc:subject:message-id;
  bh=F5RaEM3/mtlUzKjHy1tUKQRgnl2pgITC2NV45hGLs9E=;
  b=d8YYlM1xL3W2YKISZwEjfyeUht7J/HyJqYQj4FC4vWTqzROqPaEBXMjP
   czAGpn6agVevQvHKIaE16eZBln310fXmvXOVms15LsHAyEb4kPr4ujuqg
   cIGmKpgvpwpa3XSo/pBkrzETCoQqFXD1VRwUeH60FTnSffb/G4SJdh3md
   zzSaSVX4+EYjiOVbAASpx95l9hoZOnXjB2ZWM5BEmDtK8AZEBE2mf6nnY
   AbJ6DuyJ3HX+neoP4orm8RKTQqkPJ1EEuId6YiurQoCRfzjh8m1xT+fsf
   +CNd+Vs0QrV4+pDg1iGT0jCP9juk0JhiHSaKifmMilrTtCKDK1mvVkBsw
   Q==;
X-CSE-ConnectionGUID: OMmxncHbTQytZulgTn/Ziw==
X-CSE-MsgGUID: qQ8RVZxNSnSYwzLSeAyQtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="95364980"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="95364980"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 15:07:43 -0700
X-CSE-ConnectionGUID: 14Wcg8jORb+j2972FaGWyA==
X-CSE-MsgGUID: MAHfca4rT/aroXVBNzJBVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="272261048"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Sep 2026 15:07:41 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC2Sh-0000000023Q-2yen;
	Wed, 30 Sep 2026 22:07:39 +0000
Date: Thu, 01 Oct 2026 00:07:10 +0200
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10241/12559]
 drivers/gpu/drm/verisilicon/vs_bridge.c:306:7: warning: assignment to 'struct
 drm_bridge *' from 'int' makes pointer from integer without a cast
Message-ID: <202609302316.aEF8QlMC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Luca,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
commit: aa8a8c7e4641ebcef02dd6fa387ca334857367f4 [10241/12559] drm/bridge: panel: move all code to drm_panel.c
config: xtensa-randconfig-r2307-20260930 (https://download.01.org/0day-ci/archive/20260930/202609302316.aEF8QlMC-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302316.aEF8QlMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609302316.aEF8QlMC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/verisilicon/vs_bridge.c: In function 'vs_bridge_init':
   drivers/gpu/drm/verisilicon/vs_bridge.c:306:9: error: implicit declaration of function 'devm_drm_of_get_bridge'; did you mean 'devm_drm_put_bridge'? [-Werror=implicit-function-declaration]
     next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
            ^~~~~~~~~~~~~~~~~~~~~~
            devm_drm_put_bridge
>> drivers/gpu/drm/verisilicon/vs_bridge.c:306:7: warning: assignment to 'struct drm_bridge *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
          ^
   cc1: some warnings being treated as errors


vim +306 drivers/gpu/drm/verisilicon/vs_bridge.c

dbf21777caa8b8 Icenowy Zheng 2026-01-29  288  
dbf21777caa8b8 Icenowy Zheng 2026-01-29  289  struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
dbf21777caa8b8 Icenowy Zheng 2026-01-29  290  				 struct vs_crtc *crtc)
dbf21777caa8b8 Icenowy Zheng 2026-01-29  291  {
dbf21777caa8b8 Icenowy Zheng 2026-01-29  292  	unsigned int output = crtc->id;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  293  	struct vs_bridge *bridge;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  294  	struct drm_bridge *next;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  295  	enum vs_bridge_output_interface intf;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  296  	const struct drm_bridge_funcs *bridge_funcs;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  297  	int ret, enctype;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  298  
dbf21777caa8b8 Icenowy Zheng 2026-01-29  299  	intf = vs_bridge_detect_output_interface(drm_dev->dev->of_node,
dbf21777caa8b8 Icenowy Zheng 2026-01-29  300  						 output);
dbf21777caa8b8 Icenowy Zheng 2026-01-29  301  	if (intf == -ENODEV) {
dbf21777caa8b8 Icenowy Zheng 2026-01-29  302  		drm_dbg(drm_dev, "Skipping output %u\n", output);
dbf21777caa8b8 Icenowy Zheng 2026-01-29  303  		return NULL;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  304  	}
dbf21777caa8b8 Icenowy Zheng 2026-01-29  305  
dbf21777caa8b8 Icenowy Zheng 2026-01-29 @306  	next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,

:::::: The code at line 306 was first introduced by commit
:::::: dbf21777caa8b8c88c12f7f036b01208fec0d55a drm: verisilicon: add a driver for Verisilicon display controllers

:::::: TO: Icenowy Zheng <uwu@icenowy.me>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
