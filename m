Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5244C9E01
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 22:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327110; cv=none; b=SFpyF2wSlo85DGcF2fnyIhXMticuyKTsAE/hTbD6PsCKOAK7oVZsaoYhBqvKrfnyAdMR5o0SIjN5R4OW90JNc+oLwG/qbf+k0tovpaLnhi40hW92DiwPZdF/S1mtWCTm+fXDVDtEJcL1NU7xU/YkiC7bpvM7K40WNZx19PtEqDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327110; c=relaxed/simple;
	bh=0rbOuxDtw7yxt/TLdUw9iiFvnywT8G5VjYK79LbG1wM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ndj1zbywcuemQGAs+s24KkZyXgaRVlM2PzAa4S1ZbT9ya9jQMv/zcLNbdeBoesAISmb9EwptClzBO7s6OSRl4hZrZHEWI6mhjOFM4J9ALCC9YS9EhdqaLcguWJzQBftcvfkVIrkMYwiHzP/V9zP5IAx47l8sV6TpJ4E7O4aDrHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNDBsZlU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNDBsZlU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791327109; x=1822863109;
  h=date:from:to:cc:subject:message-id;
  bh=0rbOuxDtw7yxt/TLdUw9iiFvnywT8G5VjYK79LbG1wM=;
  b=XNDBsZlUxrqEerDhyIllT6B/mUS0kNZU3wM0PdjIBc7ZAv+Yx673qRr5
   nSJHi3Pwr0HYGPbC0IIfLJXZh7/HNuJoFS2KKtWEYKXkIf6y1yVUwFsIa
   3x/JEzZ/E/ZnH5jEcd11pyr0r1DBHgXJRzHdT74ac0k2OYzUzsW9rCYZj
   5eWbsnZOIdCgSSp6mEl9S/SBxrt5DAI7uzAQEShVtrXonBD1jhrR4jHHc
   6H0vy4ZyorHw6f7ydUKxp0MbYufq+JG4cj2dbmcsR0/MD+ZSpQvhv2L4Z
   FnygIa9ZAf6ZdLkPssxCgL39QtdS7ZtB7dYs17kHGspNMViUTjV0GsXyd
   Q==;
X-CSE-ConnectionGUID: yBQey+KmTHOtdK350x2YXw==
X-CSE-MsgGUID: gLzDMm1OQzqVg2OXrUZfwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="81487"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="81487"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 15:51:47 -0700
X-CSE-ConnectionGUID: l1pJU4vbRouxX4NLyRAOZA==
X-CSE-MsgGUID: cQrr8tIcQXWdAmnAzausSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276818405"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Oct 2026 15:51:46 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEE0e-000000001zD-09eG;
	Tue, 06 Oct 2026 22:51:44 +0000
Date: Wed, 07 Oct 2026 00:51:08 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 15/15]
 net/wireless/wext-proc.c:122:36: warning: 'wireless_seq_ops' defined but not
 used
Message-ID: <202610070013.n2gVftny-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   51015f38e9dca4ae0e4cdfd507558f2b438dd124
commit: dd99bb34c52de463398910adc71917769dde6f54 [15/15] Revert "ANDROID: suppress GKI configs for 32-bit builds"
config: arm-randconfig-r2309-20261006 (https://download.01.org/0day-ci/archive/20261007/202610070013.n2gVftny-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070013.n2gVftny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070013.n2gVftny-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/wireless/wext-proc.c:122:36: warning: 'wireless_seq_ops' defined but not used [-Wunused-const-variable=]
     122 | static const struct seq_operations wireless_seq_ops = {
         |                                    ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/wireless_seq_ops +122 net/wireless/wext-proc.c

3d23e349d807177 Johannes Berg 2009-09-29  121  
3d23e349d807177 Johannes Berg 2009-09-29 @122  static const struct seq_operations wireless_seq_ops = {
3d23e349d807177 Johannes Berg 2009-09-29  123  	.start = wireless_dev_seq_start,
3d23e349d807177 Johannes Berg 2009-09-29  124  	.next  = wireless_dev_seq_next,
3d23e349d807177 Johannes Berg 2009-09-29  125  	.stop  = wireless_dev_seq_stop,
3d23e349d807177 Johannes Berg 2009-09-29  126  	.show  = wireless_dev_seq_show,
3d23e349d807177 Johannes Berg 2009-09-29  127  };
3d23e349d807177 Johannes Berg 2009-09-29  128  

:::::: The code at line 122 was first introduced by commit
:::::: 3d23e349d807177eaf519d444677cee86b1a04cf wext: refactor

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
