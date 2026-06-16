Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C220D3ADBAC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 23:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653615; cv=none; b=hgM42IH20vrpuElRWPE/9az3UbaHlNay75/j7u6+kp3enEgtdZmi8pco7I0MKPtsugaltAPYhsasr4Pp0oWknutKRApD2F1KOpBMK4RCKqCK38rqaFODoTih233Qcu2hH3oYQdP7bIt9rHOKk9nJHbG1eYRmH3dcyANYcnOZ25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653615; c=relaxed/simple;
	bh=kfgxLgnjavJ9Y/csTOqsu5NPyQxEGwUKkXaIeDMFD+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oxo6KnOrt+AiyqkiNm31dsRXiZZx/wG3YRY+L9l8aUf2M/L+yQILiCDBzCj0gCPL1ANjJrebRgTnN+JsICPZA3IrjFAB7ryF1ctYZvt51LyvPUIMzNa8J/KbvYhFOTILTyGYuwMjyophqlZTq4PWSmSpGY8h0m1Zb+uRgCTFtrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFBXK+gM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFBXK+gM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781653615; x=1813189615;
  h=date:from:to:cc:subject:message-id;
  bh=kfgxLgnjavJ9Y/csTOqsu5NPyQxEGwUKkXaIeDMFD+M=;
  b=iFBXK+gMKnRM3TS4dzIKjNZEs9sLWaAZI2oHPZNWCSpBCXhNRRd3sG9+
   r/GjcR+iJa/tNMqbj8AfGA7W92yfbVAjMJ0YVZctYuKz2AM9Fa6f7yphq
   SBel6pmtKMGHHwOmf/KjJBnf5K/CQat2j1lxYiWsewKaPSQc5jtOhsj85
   x1CbSf6BCDAhwUATujtvAgegNn6ppPuxkFPdPsxNqujrw5lVFAAktABp3
   ZTUNHbVvcl62P9XOgVffOrfjfBPRM3dyfxGJ7VtYQ4M6F+z5YSuETmjEl
   rV+4NSE+no9TSioPZTsPCbjd9dJ/bwquVrgpG/RDBrU0Hk8frdkbkLksx
   A==;
X-CSE-ConnectionGUID: 2ri/qa8sQOCnUv7pZWXPTQ==
X-CSE-MsgGUID: oDTtRH1RTIakZkitnPyxrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86354841"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="86354841"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:46:54 -0700
X-CSE-ConnectionGUID: 4VLI7g3RRKu9jFXmWDoSHw==
X-CSE-MsgGUID: ow+j3XjNQW+4hckHBC8LTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="245016712"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jun 2026 16:46:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZdUY-00000000TtG-1s7s;
	Tue, 16 Jun 2026 23:46:50 +0000
Date: Wed, 17 Jun 2026 07:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [linux-next:master 226/14321]
 drivers/gpu/drm/bridge/of-display-mode-bridge.c:54:25: sparse: sparse: symbol
 'of_display_mode_bridge_funcs' was not declared. Should it be static?
Message-ID: <202606170744.FUStcWaB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
commit: ba2db93cf3d569a4525a02cd0ed5ec5f979e3afd [226/14321] drm/bridge: Move legacy bridge driver out of imx directory for multi-platform use
config: sparc64-randconfig-r133-20260617 (https://download.01.org/0day-ci/archive/20260617/202606170744.FUStcWaB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606170744.FUStcWaB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606170744.FUStcWaB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/of-display-mode-bridge.c:54:25: sparse: sparse: symbol 'of_display_mode_bridge_funcs' was not declared. Should it be static?

vim +/of_display_mode_bridge_funcs +54 drivers/gpu/drm/bridge/of-display-mode-bridge.c

    53	
  > 54	struct drm_bridge_funcs of_display_mode_bridge_funcs = {
    55		.attach = of_display_mode_bridge_attach,
    56		.get_modes = of_display_mode_bridge_get_modes,
    57	};
    58	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
