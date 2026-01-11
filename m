Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC72122301
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768155296; cv=none; b=Un8gXLXfWKs0eBDyYc51uNT2XeoYGGO1Fk2j+KENqcUnuhBKlrHiOAvjjosv9YggySFjPvAvBH437zl+Qn52ccSVmPAExijvrON3YVKznGUGM8/WvRGOpmcXoAbj+foOLhmoIpUymmKizANQz5AlgTivuJjITVC+qZoL5TYlexM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768155296; c=relaxed/simple;
	bh=roqgV7Qy+VeXsXv6yHTBTls5Nw+dcGcXFmke+1GwoWI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fp8k0EWkRGuPwLJwIPPe1lTDN+9EpUHd5kJkhegcotjoeuso6vNNy0LoIvDk4xHQMQcUZtB6Gl/KvSir7ynQyR9ZZIHe2p2Csd2OkIvavXDCpHDIhd4Wqq8EZdKDKWZY19+DwjNAb8lvcbtMqC98+UuKsxvcAgFe8cIP02OBFXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbMsh4XQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbMsh4XQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768155294; x=1799691294;
  h=date:from:to:cc:subject:message-id;
  bh=roqgV7Qy+VeXsXv6yHTBTls5Nw+dcGcXFmke+1GwoWI=;
  b=dbMsh4XQJ7Sv9/yw55tgd9k5A1GRBS1Lv+qgZx4qSlUPAUNQwJGwlqtt
   p2csKBZoatBimu3GWLdMu2viu2qriSnF8npCRPgOeDbbs2eX5zxbPPNbb
   EfVUExkUIUqb9sFIfvvKV/I1hsln8ZzOIPbMJRM/i839thbOYw4wYYbn0
   B4vZZvbf7afFbEN8whuhTWKVR1aym7ADe+wuqpT4nTeqapwE4xjfEV3/5
   I+73HWMr6W8ttX2qvDu+Kst9XHTDpU0e7xp1KbNTvn8teMUtR972ihy3E
   zTzTVd5jRNdZqgy4mHJkItGfv0NMsK8BD/mg/p7amnnzNhORtgyzmikIX
   w==;
X-CSE-ConnectionGUID: Unp9eD+VQ5afqCEtaMPTDA==
X-CSE-MsgGUID: moC7DjalSV6VB4wXzc+l/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69374639"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69374639"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 10:14:53 -0800
X-CSE-ConnectionGUID: QYD7v0HfTV+GOkOVesXx5Q==
X-CSE-MsgGUID: rcQNIfj2TTuq0azRmSE3+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208967370"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jan 2026 10:14:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vezxh-00000000Cbc-0rkz;
	Sun, 11 Jan 2026 18:14:49 +0000
Date: Mon, 12 Jan 2026 02:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [linux-next:master 1628/5095]
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314 encode_config() warn: if();
Message-ID: <202601120253.FKudUXx4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: 4cffecaf127ae10ada4da0636f87e0170e347402 [1628/5095] drm/xe/pf: Prepare for new threshold KLVs
config: alpha-randconfig-r072-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120253.FKudUXx4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120253.FKudUXx4-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314 encode_config() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314 encode_config() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314 encode_config() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314 encode_config() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314 encode_config() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:314 encode_config() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568 pf_restore_vf_config_klv() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568 pf_restore_vf_config_klv() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568 pf_restore_vf_config_klv() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568 pf_restore_vf_config_klv() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568 pf_restore_vf_config_klv() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:2568 pf_restore_vf_config_klv() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:310 pf_add_config_attrs() warn: if();

vim +314 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c

a1498ab229ca16 Michal Wajdeczko 2024-08-30  313  
a1498ab229ca16 Michal Wajdeczko 2024-08-30 @314  	MAKE_XE_GUC_KLV_THRESHOLDS_SET(encode_threshold_config);
a1498ab229ca16 Michal Wajdeczko 2024-08-30  315  #undef encode_threshold_config
a1498ab229ca16 Michal Wajdeczko 2024-08-30  316  
ac6598aed1b36d Michal Wajdeczko 2024-04-15  317  	return n;
ac6598aed1b36d Michal Wajdeczko 2024-04-15  318  }
ac6598aed1b36d Michal Wajdeczko 2024-04-15  319  

:::::: The code at line 314 was first introduced by commit
:::::: a1498ab229ca16dfc35331dfb309f8e28b84bb5d drm/xe/pf: Add thresholds to the VF KLV config

:::::: TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
:::::: CC: Michal Wajdeczko <michal.wajdeczko@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
