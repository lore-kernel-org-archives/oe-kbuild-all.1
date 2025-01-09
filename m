Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8530204F78
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457323; cv=none; b=KvspB3lwbmG7s66L7bXhdWxxqiaZDwYQvTCy6FR1I9zSZjPmj2YHBNJ6I178H0dm0Qv9KDT2RpMGlFdbpIdGtTKl6y1i4yvkwYZ5hvxq3xoVSULr56glodufE7wg/EauScli9pghlzIZyU0XdhtKNkxhoUSINR9DbZbYFEqMKOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457323; c=relaxed/simple;
	bh=8spVM04AooIUFEdM/p+j1TViSDTsgDyaGlxHMq+EoJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MfnQuMvDqRGhIRy/Ugvhi11Q8Ny997b7X4DrFknIfCVa934YpAsIvxUkTnJattituotaE5VtgZcT6K0EvwnIz0lFWm1QvUxa6RxeCbeiyjxTs4i2/fTrdk8iLNKWVc03qvQrEO1MPp72D9nvGZcwfyrLUlMCY10eS/NlyoKWWZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTxgUqmX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTxgUqmX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736457322; x=1767993322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8spVM04AooIUFEdM/p+j1TViSDTsgDyaGlxHMq+EoJM=;
  b=OTxgUqmXpfJDcZsEan7DkMSKGBCuWH7qaprhjnJ2o1xIGBS9Wz/5lq8Z
   dJtoGRdi3hm8T87ebQ4sUa5B/GPTyAqor0fZsSnxH1LQI8cTC9vD4sWh0
   WIaQmTVFNzOoh+0swTyXYeUxkj9V31wf3e96IMLeru5oLnyHNiQStbnA2
   gAQ0T0u7NoHZpnJvvHi5RnsrvKdhqxzchOb7lyK/oiOc798xWocMB3FiD
   umYjDaW3PND5Iry7szdvXo+A/tAoMdtcRR4QB4lDjQrD/K8roYTKJOxd/
   KapHT1boH9RO+dfjjx4Ug+8LUtAO3M9gT543mgqRZK8IQXBJOZncTBO0K
   Q==;
X-CSE-ConnectionGUID: nJBgW2wpRSe1/z0hswBy7Q==
X-CSE-MsgGUID: 4ZSk5gk2RvqRGKEFqY+GEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36969240"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36969240"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 13:15:21 -0800
X-CSE-ConnectionGUID: jgEEZNlJTHm0lxKnHle01A==
X-CSE-MsgGUID: JcR+RBuSSHSM6mfrsq9vwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="108523555"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jan 2025 13:15:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVzs6-000I9H-0B;
	Thu, 09 Jan 2025 21:15:18 +0000
Date: Fri, 10 Jan 2025 05:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: warning: no previous
 prototype for 'pl011_hyp_init'
Message-ID: <202501100553.BWlFvve6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   7dd21286233d5aac07a78f6f63b16a7b4b090ba4
commit: 1a8bda12e0e953d8b55f264a3ca0e33a508965ab [1/1] ANDROID: drivers: misc: Add an example pl011 driver for pKVM
config: arm64-randconfig-004-20250110 (https://download.01.org/0day-ci/archive/20250110/202501100553.BWlFvve6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100553.BWlFvve6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100553.BWlFvve6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c:38:5: warning: no previous prototype for 'pl011_hyp_init' [-Wmissing-prototypes]
      38 | int pl011_hyp_init(const struct pkvm_module_ops *ops)
         |     ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +/pl011_hyp_init +38 drivers/tty/serial/pkvm-pl011/hyp/pl011-hyp.c

    37	
  > 38	int pl011_hyp_init(const struct pkvm_module_ops *ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
