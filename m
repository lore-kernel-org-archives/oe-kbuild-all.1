Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634FA33A037
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766150488; cv=none; b=CWwvkB/4Xcq1OnYpOEMo9jFnSYjvpUNfFFcNP2TsAt5Mdc7FemmqpEBOogXSAKCGf75DJau80zXMTO13mwURyGaQfimisezrrScSuKN1uSCX35FClD13jogkgLTGby7mr7lWqwWu8kLrZjOgTt1v3OnJcQzu/5KeDSA2l7z3JNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766150488; c=relaxed/simple;
	bh=cMLayl0CNugrpNvhwp9/DSMel/lAFeLVEXpmBnbJ9rk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KyGSrgYw58NB6AwtgDN522lHVoVLBV8FbNf9gCgZK7Xe6y9ecS2jG2/yptwJkMA8WYzmOcqr7xGjKQxUHjpkrhyc/6MEkNsl3Tg0ETiSCtLyNuVA4ZAiOhjuRxkeMuUL8klY6mQyz6E0aWDXDo5UfCaxH3bVGv5TFHKUuHysZ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qgtw+bQc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qgtw+bQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766150488; x=1797686488;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cMLayl0CNugrpNvhwp9/DSMel/lAFeLVEXpmBnbJ9rk=;
  b=Qgtw+bQcaLpboKMs38Y7hXyhLIlPQSFK0bTdCGhdNie5mgcAqAz770AU
   FgrjIEKG2rP1uzLd2AH9v75233RRLWrXqw4RufiguqUy9vK+dj8REbuAH
   uyNAsqJHccHved8UXTeUG5/c224Ato89p5C8BpJtZC5wVlnXMkAsKZ4KR
   9FlMPnhvixKz96Vx07s/FM6x+zExcoO4R36EKiU9X25KMx6IgbfuWSzQU
   9M54wVgFmYb0ejPm3QKBtaKtuJnBqu3Jhf8DRhON5rFX0DQ0y+i+KYf9y
   gI+m8CKgeuQqPUtDuYxnu0NCQxbJPKXBf+77ov+lmEPQgjoH/r0b75tD7
   Q==;
X-CSE-ConnectionGUID: O8SeU/bhQJypeBFYJjC1Lw==
X-CSE-MsgGUID: LBbWCWWQRiGfv0FjDGUWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68263634"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="68263634"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 05:21:27 -0800
X-CSE-ConnectionGUID: AleSKtmtSgqF+GnBg/QwPw==
X-CSE-MsgGUID: UkS28KmLRuCYUEiGa4nOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="236284595"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Dec 2025 05:21:26 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWaQ7-000000003a6-2CqV;
	Fri, 19 Dec 2025 13:21:23 +0000
Date: Fri, 19 Dec 2025 21:20:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: xe_pci.c:undefined reference to `xe_configfs_check_device'
Message-ID: <202512192237.8icOR4eh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 13dda74a164b570d93d412e812dc80549506410f drm/xe/configfs: Dump custom settings when binding
date:   4 months ago
config: powerpc64-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251219/202512192237.8icOR4eh-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512192237.8icOR4eh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512192237.8icOR4eh-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `xe_configfs_clear_survivability_mode'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0xf6c): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   xe_hw_engine.c:(.text+0xebc): undefined reference to `xe_configfs_get_engines_allowed'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
>> xe_pci.c:(.text+0x1224): undefined reference to `xe_configfs_check_device'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   xe_psmi.c:(.text+0x53c): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   xe_psmi.c:(.text+0x5f8): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   xe_rtp.c:(.text+0xba0): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
   xe_survivability_mode.c:(.text+0x260): undefined reference to `xe_configfs_clear_survivability_mode'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x2cc): undefined reference to `xe_configfs_get_survivability_mode'
   powerpc64-linux-ld: xe_survivability_mode.c:(.text+0x304): undefined reference to `xe_configfs_clear_survivability_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
