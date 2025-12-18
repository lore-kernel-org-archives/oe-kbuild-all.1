Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD0B2D7DF5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090075; cv=none; b=cuiv3bX4E1l9n/0C1NPkDlDvqlzKFAsStXkH/sqlgDPF2V/jcOBgWJ8Ei33vIXrr76/JQjKHvCJH4fKev7Jzr7QDuoZPNV9gPZ9ocjl9erf/vdf2ZOOMYufdJWcgsVjc/SGXZRqYQTjqWNaej0PkC0jxaMHNYuddvUT7UoyfcVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090075; c=relaxed/simple;
	bh=BbWioqLTUGAFEM/k0nNrJ1pac+zrBgUPRLPDp/JM2WI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VltF8XMiVBV3gR9Zv3OxeZRrvNeHrowsFhZ5tZ0X7Ofxsy7bf7Jzlga8eSrUYBa6bfuO4YxM5yPdzBF6mCS79cEuV2l4qRAG6/qobab8FIqDN2QqdbLQLLFnjvVGXh9pBOfyhvU/8kP11fsNweeG0Bn6HmXtH4lpfmkMEqESRD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igQtXs6U; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igQtXs6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766090074; x=1797626074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BbWioqLTUGAFEM/k0nNrJ1pac+zrBgUPRLPDp/JM2WI=;
  b=igQtXs6U59cFDR074BkRuw44j4xRy+gXDYZ3yv80R4NuxCUJQ0U9HkRg
   w0W4YCtcHDDXJZZdbIs/4WOxoKq7ujCw5N9nQvb8udiMN5joUo7a1Akg8
   uCluPXKRwiTX0uyHCTuKmqq/0zmaZCxYIPoC5wO4+pyuOC08E/f4ylYPm
   bAjoK7pqVECRhlIepp7+gnLUpXFR+7khVb0VQMkewrk6trT6XWTiToddL
   XZXoajwWdSZBeyQaiJlOBls7IRVfpU/vZDqK5rL9VOVkNc5qBGom8TE8n
   l+Y9klScsvJ7ip3wRc6PgoXkgbLqOUznM1e0jonQmAwCFyqk4K3CF74GD
   g==;
X-CSE-ConnectionGUID: oPKXGmGBQZSiPz+ZiRmRcw==
X-CSE-MsgGUID: m5/bcjIVQKKMx7asGVq1Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78768808"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78768808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 12:34:30 -0800
X-CSE-ConnectionGUID: 3YP7HAqXSLeV+m0DqK3UjQ==
X-CSE-MsgGUID: qVF04tmSQvifZwYbu3RQfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203085490"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2025 12:34:29 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWKhe-000000002cl-39QB;
	Thu, 18 Dec 2025 20:34:26 +0000
Date: Fri, 19 Dec 2025 04:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: xe_sriov_pf.c:undefined reference to `xe_configfs_get_max_vfs'
Message-ID: <202512190407.CcUFXX2F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: c09a9933af08cdcb295ccc65a6d9862bf8474706 drm/xe/pf: Add max_vfs configfs attribute to control PF mode
date:   2 months ago
config: powerpc64-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190407.CcUFXX2F-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190407.CcUFXX2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `xe_configfs_get_max_vfs'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0x2f08): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   xe_hw_engine.c:(.text+0xedc): undefined reference to `xe_configfs_get_engines_allowed'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   xe_lrc.c:(.text+0xb30): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   xe_lrc.c:(.text+0xbc0): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   xe_lrc.c:(.text+0x32fc): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   xe_pci.c:(.text+0x1514): undefined reference to `xe_configfs_check_device'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   xe_psmi.c:(.text+0x508): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   xe_psmi.c:(.text+0x5c4): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   xe_rtp.c:(.text+0xba0): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x434): undefined reference to `xe_configfs_get_survivability_mode'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
>> xe_sriov_pf.c:(.text+0x2a0): undefined reference to `xe_configfs_get_max_vfs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
