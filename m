Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE673378D68
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994931; cv=none; b=J9RD2A5ICzpZnlWSpbL7odjuhfJQ2j7yWMCB3BY1FZBbFoPiJ+ZRVkvdKpBxrywx8xnFvLsI4KDRvPLMGy+1wnyCc+2HgQShWmRmQbP6Oytq+jG13TFEnTFXB2Eichguv81f58bGu8Sn4xMPLoHFn96AyQYsZnKUt7j5HMXkcIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994931; c=relaxed/simple;
	bh=h2m9N31RX6s4PtfeYQEvL/kFItxZ/zga9O1kqB1TNgU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n/2PwbmbtjIVkypcGh2TqPYt4D0hr1RDosY+fudpTMxwRw2eoIPuCJAMOXXqxGNIf38wPbZSGk2jJxesc516lZ3sEbid/Psst7s7S0WBQPRBEPMtEjByizP7205+MENihGTdfwd+VxcydHU3IXai86hih6dxwpkmjjf1itlZRD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rf1MMXLO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rf1MMXLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774994930; x=1806530930;
  h=date:from:to:cc:subject:message-id;
  bh=h2m9N31RX6s4PtfeYQEvL/kFItxZ/zga9O1kqB1TNgU=;
  b=Rf1MMXLOiO/SYheomKlHc1dBscr1nYPNDg3FzXmDcVU98xe0wqJBPvxl
   LmjBrj7UvI1ZcaUcSu7toJtqMtZSql/psOHs2iIhz20gk/vuPsEv/yKcq
   KQjz2SK0kbK1YrZ3iP8kQDgoKcKUmGhxdJMG8k+92YKLHSNOx48Nn8yX3
   +BxrlexUCJjp6AO33XWui+KgQlVG65ebcKjSsLIlV3R/CTejEeENA8heo
   Ye7KkSYgcG/vkxlLARRCqP7OsBJFFLJLp1OPGzovaHD/T7vXtwIlvS7Eh
   4o1b/TzV2ZnkeBwWH2dT+uaC5IYg44P65A+HBTKMPsXP6y8mY+zb+3F+4
   Q==;
X-CSE-ConnectionGUID: 6LR6WWrrQeCn64cz7XomBQ==
X-CSE-MsgGUID: LwgLwLoWTyatAF3Ts8GXZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93417532"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="93417532"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 15:08:49 -0700
X-CSE-ConnectionGUID: Ru82i2fnSaOrThY8gRNcxg==
X-CSE-MsgGUID: F27qSt7STDuncMnGNuO0OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="222095552"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Mar 2026 15:08:47 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7hGP-000000004LF-0xgr;
	Tue, 31 Mar 2026 22:08:45 +0000
Date: Wed, 01 Apr 2026 06:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: Rafal Ostrowski <rafal.ostrowski@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [agd5f:drm-next 41/71] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:71 expecting
 prototype for dc_assert_fp_enabled(). Prototype was for dc_is_fp_enabled()
 instead
Message-ID: <202604010622.OsEmKOCa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   8b3e8fa6d7bdab292447a43f70532db437d5d4f5
commit: 3539437f354bd24c98928a80d4db3a23fa2a7b19 [41/71] drm/amd/display: Move FPU Guards From DML To DC - Part 1
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260401/202604010622.OsEmKOCa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010622.OsEmKOCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010622.OsEmKOCa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:71 expecting prototype for dc_assert_fp_enabled(). Prototype was for dc_is_fp_enabled() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
