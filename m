Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C16849C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 00:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766103579; cv=none; b=f0fj4LHoDhQmuOD7PQnava+6/5QMIs01FxyYRCgRk82sqRK/7Pq+bizog3ryLDSi96Ab3XGI9Pp0A7uMOxEKGW4ofgTdtzmfti0FOkwmCmC+UIaOwJdIWG76i8LJ9wv1eMAIvKpPqRVBuAxmF+cmiCFzAVTB5qIK6KQwGj9mDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766103579; c=relaxed/simple;
	bh=plHSMre1F44PWAOzdkgRda41yImP8ir6ZcOH3phDob4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DU3HkPnl+RIeDIG/FHeFVFFI6+ST7iYGjZJEiv7vhej8BiCILZbKwp3FRlCUFFtZHqtMc7laR9F7JOmu5f2Wykig1w88xQxTLxptlK/PhA8XikbY7bRGPP/XgKorvHSe8kHlg9UTDeaFdFlaEfqm1SMEA6Vr0+8F9M8UkEH96W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+fupnWg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+fupnWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766103578; x=1797639578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=plHSMre1F44PWAOzdkgRda41yImP8ir6ZcOH3phDob4=;
  b=c+fupnWg+eYKKuJh+s1gz5uWLvIoRPU3v7y5z62AwYsTByM7qH9EjXCK
   +HksrMezFopWtpXb3alM0zUXYaMQwu8CgZRFbGCADUCELOcnXyrd1ED0K
   XxK/FQeq3WqDlaTVy2OeXSLheRiL96HfTzRfM1stfFtbM2kpZ+E7zdlG3
   0cQZu+VxIxhEoBLt7uTLsfGPzybDr1jhHoge62ejaFe8G+f/YNU2tK7NA
   Llc5StNS0Ct17Ejp4y1uo9rk80P7JrWqMWgmLhj3eJUaKGN65MiksBzQQ
   ee0SzT90yOvPdakzmHMPHSbfpTWPo1ZAW26/7FIvxntQXBF+bDv/JlqeY
   Q==;
X-CSE-ConnectionGUID: JjP0OQHNT1ytTHnLo/S4RQ==
X-CSE-MsgGUID: G84u2UKxR1alVs0wW9LZXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93541467"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="93541467"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 16:19:37 -0800
X-CSE-ConnectionGUID: lifiEpBNR+W7Ks12A6mBAQ==
X-CSE-MsgGUID: vhkefhpBQBugX1sPBoK30A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2025 16:19:36 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWODW-000000002nf-1Wfx;
	Fri, 19 Dec 2025 00:19:34 +0000
Date: Fri, 19 Dec 2025 08:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: powerpc64-linux-ld: xe_pci.c:undefined reference to
 `xe_configfs_media_gt_allowed'
Message-ID: <202512190827.IeXYj4qg-lkp@intel.com>
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
commit: 7abd69278bb53ab6b43f9650daba550cc7624858 drm/xe/configfs: Add attribute to disable GT types
date:   9 weeks ago
config: powerpc64-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251219/202512190827.IeXYj4qg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190827.IeXYj4qg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `xe_configfs_get_survivability_mode'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0x2f08): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   xe_hw_engine.c:(.text+0xed4): undefined reference to `xe_configfs_get_engines_allowed'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   xe_lrc.c:(.text+0xb28): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   xe_lrc.c:(.text+0xbb8): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   xe_lrc.c:(.text+0x3300): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   xe_pci.c:(.text+0x12ac): undefined reference to `xe_configfs_primary_gt_allowed'
>> powerpc64-linux-ld: xe_pci.c:(.text+0x1388): undefined reference to `xe_configfs_media_gt_allowed'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   xe_pci.c:(.text+0x1724): undefined reference to `xe_configfs_check_device'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   xe_psmi.c:(.text+0x508): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   xe_psmi.c:(.text+0x5c4): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   xe_rtp.c:(.text+0xb34): undefined reference to `xe_configfs_get_psmi_enabled'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   xe_survivability_mode.c:(.text+0x434): undefined reference to `xe_configfs_get_survivability_mode'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
   xe_sriov_pf.c:(.text+0x2a0): undefined reference to `xe_configfs_get_max_vfs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
