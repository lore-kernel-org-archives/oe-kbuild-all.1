Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2682C336EC6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011081; cv=none; b=Zv6oTV5g/YwsFpJNfAtXBEmq2XyW5fu6agl10QA7t9qPg/v2PlnRAxhAH74neZTMj3ZokmHzgok91m956lPG2EIAhiR3ln+aKJte4rIL/DlaC/g09Tf0K4Z4PbPZ4Byray1VPB1i2ETTNI+rUZWGFxkx8/zbQDKooouDfMVqUUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011081; c=relaxed/simple;
	bh=6Jxddz0G37rzmuRXFEGg303De0KFrstxurP4R2xbH70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jjwC2duaRBQxcwfUaPqpMYxCu8GxgRZV8hp8wqH+6zj+pRU/5wdA96S1MR6Nzh5g7mRvgmFw7+A19zZRcWUBs0ZRdElAuXrWI7/iCSB5SxtLB17m/s9QkpIdN0e1YXOCGr6qJCLlbz6yyJJtEFpOBihl3+TTqwy12YDBS7hel4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UlTLCw3Y; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UlTLCw3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775011064; x=1806547064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Jxddz0G37rzmuRXFEGg303De0KFrstxurP4R2xbH70=;
  b=UlTLCw3YoDGoLyhDNG7MTSvMbt+EREEDCHJP97Omphy7iM8Zu93TT+ir
   Da6n8y25SVq/6F7T2bZuVREF3WcEbL7irY3s9epC5iMohsiLE5dtnbUex
   z9tw96jyhjTcBdnZBWoSxA32WX+g9KZ7SV8gZXXlM+eNGMt62pqroisCv
   HeJtNo/kAR3fSFYxM6fIS2Scot0iq1UdONE5LlRG8B3Gi//MjUT1IRARm
   RnwDxT24oS2kr9GjP0TO5ii2aw3UKXm7P1E5TUXSjKEfjGiStWTOYT8KM
   3msO/CtSIZP/eJYOHwQv5QQUDKI4TF4D5pUz57bpA4R6/zmqwusADzknH
   w==;
X-CSE-ConnectionGUID: +Wm3hm+0R0eLVyIEoZlNPw==
X-CSE-MsgGUID: yGCyA6W0TnOrYXghZAXxog==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76100443"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76100443"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 19:37:29 -0700
X-CSE-ConnectionGUID: mKheN/q9Q56KsTmu5RWi4g==
X-CSE-MsgGUID: nzrHpQ5VQfun/IZUx6pZMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="223658796"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 19:37:27 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7lSP-000000004eS-0Kyf;
	Wed, 01 Apr 2026 02:37:25 +0000
Date: Wed, 01 Apr 2026 10:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Piotr =?utf-8?Q?Pi=C3=B3rkowski"?= <piotr.piorkowski@intel.com>
Subject: [linux-next:master 204/10705] arc-linux-ld:
 drivers/gpu/drm/xe/xe_sriov_pf.c:25:undefined reference to
 `xe_configfs_admin_only_pf'
Message-ID: <202604011004.jBimdwrx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   36ece9697e89016181e5ae87510e40fb31d86f2b
commit: 34ef561a0d497dd86dd4f511a86c7481ddf29aeb [204/10705] drm/xe/configfs: Add sriov.admin_only_pf attribute
config: arc-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260401/202604011004.jBimdwrx-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011004.jBimdwrx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011004.jBimdwrx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x8): undefined reference to `xe_configfs_init'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0xc): undefined reference to `xe_configfs_exit'
   arc-linux-ld: drivers/gpu/drm/xe/xe_guc.o: in function `xe_guc_init_post_hwconfig':
   xe_guc.c:(.text+0x13ea): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: xe_guc.c:(.text+0x13ea): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.o: in function `xe_hw_engines_init_early':
   drivers/gpu/drm/xe/xe_hw_engine.c:845:(.text+0x9de): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_hw_engine.c:845:(.text+0x9de): undefined reference to `xe_configfs_get_engines_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_post_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1143:(.text+0x5d2): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1143:(.text+0x5d2): undefined reference to `xe_configfs_get_ctx_restore_post_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `setup_configfs_mid_ctx_restore_bb':
   drivers/gpu/drm/xe/xe_lrc.c:1172:(.text+0x7a2): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:1172:(.text+0x7a2): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.o: in function `xe_lrc_init':
   drivers/gpu/drm/xe/xe_lrc.c:92:(.text+0x2348): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_lrc.c:92:(.text+0x2348): undefined reference to `xe_configfs_get_ctx_restore_mid_bb'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_info_init':
   drivers/gpu/drm/xe/xe_pci.c:771:(.text+0x48c): undefined reference to `xe_configfs_primary_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:771:(.text+0x48c): undefined reference to `xe_configfs_primary_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:802:(.text+0x542): undefined reference to `xe_configfs_media_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:802:(.text+0x542): undefined reference to `xe_configfs_media_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.o: in function `xe_pci_probe':
   drivers/gpu/drm/xe/xe_pci.c:985:(.text+0x6b0): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:985:(.text+0x6b0): undefined reference to `xe_configfs_check_device'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:702:(.text+0x8d0): undefined reference to `xe_configfs_primary_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_pci.c:702:(.text+0x8d0): undefined reference to `xe_configfs_primary_gt_allowed'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_debugfs_register':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2f6): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x2f6): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.o: in function `xe_psmi_init':
   drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x368): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_psmi.c:36:(.text+0x368): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o: in function `xe_rtp_match_psmi_enabled':
   drivers/gpu/drm/xe/xe_rtp.c:371:(.text+0x6ca): undefined reference to `xe_configfs_get_psmi_enabled'
   arc-linux-ld: drivers/gpu/drm/xe/xe_rtp.o:drivers/gpu/drm/xe/xe_rtp.c:371: more undefined references to `xe_configfs_get_psmi_enabled' follow
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
   drivers/gpu/drm/xe/xe_survivability_mode.c:380:(.text+0x220): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.c:380:(.text+0x220): undefined reference to `xe_configfs_get_survivability_mode'
   arc-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.o: in function `xe_sriov_pf_readiness':
   drivers/gpu/drm/xe/xe_sriov_pf.c:30:(.text+0x218): undefined reference to `xe_configfs_get_max_vfs'
   arc-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.c:30:(.text+0x218): undefined reference to `xe_configfs_get_max_vfs'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.c:25:(.text+0x282): undefined reference to `xe_configfs_admin_only_pf'
>> arc-linux-ld: drivers/gpu/drm/xe/xe_sriov_pf.c:25:(.text+0x282): undefined reference to `xe_configfs_admin_only_pf'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
