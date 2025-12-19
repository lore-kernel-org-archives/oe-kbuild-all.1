Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D9723A9B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 19:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766172016; cv=none; b=tp55HUXD5gMHj9VEkdAcEmeAdojO0ZJPfkYnDqyIBdBX+6BCTlzvU6jRnpu/szvck51OmmXhThSxYgEHaW8iT9Gh0/74GbgverDUAA/PNfrwlbfOzP0mcCWqc5VGfKLnF8jLYw6jIDf7/whrGWhcKRTdoPjO3VzM9DPH39wXHHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766172016; c=relaxed/simple;
	bh=DAB+jI6GkFBe2+Cz8fiBDI6+Uw0zRpizp31yo7gevTY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2UFyCYPeFkRwSFjX0uEOKtecBr1+12uud2N8GmXha8E5e14nMtWS8F85mQhqme/v1lTU9QUrwECz47XyYaet1eL81r0M9VoXyFyEjxLlA2hiQduYFLGrDHcZHKOG/uQnBNvbxINQ2VFTPlgIYZGEps3z6V93wPN+Ohh1IOg5W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GROADzSK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GROADzSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766172015; x=1797708015;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DAB+jI6GkFBe2+Cz8fiBDI6+Uw0zRpizp31yo7gevTY=;
  b=GROADzSKBFl6cLNMU97trK6f3OpsPxz0AkbGSusHTqEkekcajiCMCYEt
   nbuDbtdqwBhHRTExHA8cWqdDW+wUdfI22FgISfgSxN04CUxCyxxC9nO4J
   TK5ePleSJ3swr8GJbPIMLy8cUSDM623VUJCIe1zdrp8sM52ahNTeZax81
   TaP8AfW2/YbnIiMyE8nQ5xoTBQSSWcMjCUwrN5NcoBNYp63dhA2VNH3cD
   NQGu0DDXlf2Ies+vkD8PdCvHzYlU8OlgKpxAOshT9jwJvMakVtFC0aJtP
   2/U1ORpLpAbUMz7Qhg7zC5agAvFFMOWV2w9yxy2zLROqMfa7L3YARy2vA
   g==;
X-CSE-ConnectionGUID: g2IQMTiSSJqQBmuDsZ2GPw==
X-CSE-MsgGUID: /2GeoK6uQQumu3Z/LtB1Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78772852"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="78772852"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 11:20:13 -0800
X-CSE-ConnectionGUID: cTB1rFO0SpGrI3nr0k+pxw==
X-CSE-MsgGUID: B9KPaMyCTdWPot4HAQyQ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="198190853"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Dec 2025 11:20:11 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWg1J-000000003vb-1sq0;
	Fri, 19 Dec 2025 19:20:09 +0000
Date: Sat, 20 Dec 2025 03:19:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: xe_lrc.c:undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
Message-ID: <202512200417.9sjIogXt-lkp@intel.com>
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
commit: 7a4756b2fd0431f109b07b904a7442f00838abf9 drm/xe/lrc: Allow to add user commands mid context switch
date:   3 months ago
config: powerpc64-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251220/202512200417.9sjIogXt-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512200417.9sjIogXt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512200417.9sjIogXt-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `xe_configfs_check_device'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0x2f30): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   xe_hw_engine.c:(.text+0xedc): undefined reference to `xe_configfs_get_engines_allowed'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   xe_lrc.c:(.text+0xb30): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
>> xe_lrc.c:(.text+0xbc0): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   xe_lrc.c:(.text+0x32f4): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   xe_pci.c:(.text+0x1514): undefined reference to `xe_configfs_check_device'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   xe_psmi.c:(.text+0x510): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   xe_psmi.c:(.text+0x5cc): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   xe_rtp.c:(.text+0xba0): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x434): undefined reference to `xe_configfs_get_survivability_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
