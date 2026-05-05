Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD0D3E6DCA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967988; cv=none; b=qHcTR2tIHg3kQSli1KLI+6UQbK4MUjUddH5G6T8IpJtL2ddDvALPyyULsFTtGJe1Taf57tk+LJGF8dFbHTVNETDBQ3zYT7VGC2kDTrQSGTZ69b6s7XK6PLviPWs4n9Dtw8YYEBVvXqTlujikN9uQdj6x5HI5E+5P9HMZPCTpwKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967988; c=relaxed/simple;
	bh=CTdNd2FhaY075Bo4YPjrgmY5ZJ70r2QtD/XpRC16VQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ebPuuGcrpTwq96X1Se/H4XMcvhwznNCpb66rVgufqF3xNlsV+9yVBfCkB9FNG0GxUkDIhKmOZsPSU6rz2/ACj1Nqhft/LdYSmJ2DsvS6soMCZS5feWliyEY6rbdhXvB+ekgS/rH4/zkLIEuOYPVQ5My5d+3m3hbZ1fd0nRq0Ktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=My9L2x0r; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="My9L2x0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777967986; x=1809503986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTdNd2FhaY075Bo4YPjrgmY5ZJ70r2QtD/XpRC16VQ0=;
  b=My9L2x0r8E43AP9HmkB9rgxtW3MmVqQqW8vyWp6BUtfH5yUVMjWpv+Uf
   ydblZ445AcQnlZ5Oe4sI5OF8fcaKdBnKDhWpSYFqzp03zEPh9ud1/kkMb
   sFg+Gc8RFCjO4eHTvUVhrx4JERLeiPSA24bXF+zl6vT/9EjnjnoMKstCC
   NO42PCGHjJ1pI0izfTimpkH4xaNUuzlr/Olt3e54rrz7HfJkUuLEAoGJu
   KFpJlWH2RvbtnyAdtune2gpgreD7F3iPEzUZpSmZmE7afCUKDWl9mSSgb
   +c8fa7GH3MFdKquitCIiUXwqRC6PYE6lh5DuZ1pH+bJRQQYIwPPlaOLFz
   w==;
X-CSE-ConnectionGUID: fNNfnyQmQ0mdIyLfjhFsyA==
X-CSE-MsgGUID: t9k0MADPTVWgsrN0RkMQnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89422330"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="89422330"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 00:59:46 -0700
X-CSE-ConnectionGUID: eruBPd63QuexS8pnwQIe8g==
X-CSE-MsgGUID: 3rsXawshSPOQtAx3hJdZ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="232607403"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 May 2026 00:59:44 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKAgw-000000004Mz-0K94;
	Tue, 05 May 2026 07:59:42 +0000
Date: Tue, 05 May 2026 15:59:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Piotr =?utf-8?Q?Pi=C3=B3rkowski"?= <piotr.piorkowski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 =?utf-8?Q?"Micha=C5=82?= Winiarski" <michal.winiarski@intel.com>
Subject: [drm-xe:drm-xe-next-fixes 6/11] xe_pci.c:undefined reference
 to `xe_configfs_media_gt_allowed'
Message-ID: <202605051504.ZG82381m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next-fixes
head:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
commit: 5e905ec67214444362b81345ef8fde63e58425b6 [6/11] drm/xe/vf: Avoid reading media version when media GT is disabled
config: arm64-randconfig-r071-20260425 (https://download.01.org/0day-ci/archive/20260505/202605051504.ZG82381m-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051504.ZG82381m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051504.ZG82381m-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `guc_init_params_post_hwconfig':
   xe_guc.c:(.text+0x2584): undefined reference to `xe_configfs_get_psmi_enabled'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `check_sw_disable':
   xe_hw_engine.c:(.text+0x650): undefined reference to `xe_configfs_get_engines_allowed'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   xe_lrc.c:(.text+0x2d4): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   xe_lrc.c:(.text+0x4d4): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   xe_lrc.c:(.text+0x3ddc): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x10): undefined reference to `xe_configfs_init'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x18): undefined reference to `xe_configfs_exit'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init_early':
   xe_pci.c:(.text+0x3dc): undefined reference to `xe_configfs_primary_gt_allowed'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `read_gmdid':
>> xe_pci.c:(.text+0x924): undefined reference to `xe_configfs_media_gt_allowed'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   xe_pci.c:(.text+0xeb8): undefined reference to `xe_configfs_primary_gt_allowed'
   aarch64-linux-ld: xe_pci.c:(.text+0xf80): undefined reference to `xe_configfs_media_gt_allowed'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   xe_pci.c:(.text+0x1178): undefined reference to `xe_configfs_check_device'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   xe_psmi.c:(.text+0x628): undefined reference to `xe_configfs_get_psmi_enabled'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   xe_psmi.c:(.text+0x6e8): undefined reference to `xe_configfs_get_psmi_enabled'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   xe_rtp.c:(.text+0xd20): undefined reference to `xe_configfs_get_psmi_enabled'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x4cc): undefined reference to `xe_configfs_get_survivability_mode'
   aarch64-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
   xe_sriov_pf.c:(.text+0x240): undefined reference to `xe_configfs_get_max_vfs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
