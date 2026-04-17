Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B63358BB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408378; cv=none; b=RJ0mF96M4V5VjD74h+wygJ8IAG0YrBvcsnQexDSigNHgTAQICiW3e9to4AJPMkk/6eZ/4f4loEMUgt8bUpRAq5t7yrYDjqTYkxOIKHUwz0w+/a+h4wP7GF20Chrizf+9XNa3DEr72lKjFMUOGnehlXCEMp/qX9UxGrkQiaU9EOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408378; c=relaxed/simple;
	bh=F06T24IUR87tEN1xKzsemPGfFRq3E13bQ8sFkC/DviI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p45cfp4RFPh/ZQ+J6lYsjSPI3Yqbg5MvDdr34Zhu9TuRbKyw7gVLk5fo2XZ4MUeP4zkUiit/6+gFES09osCgEVDNdCLfiDUs2ECCotZBlVqNhPKkxsA4dM5HkkWFAW/CHgbBj/GwN5zU+UHQRR6W0n9Bhf0WABMaH/VRoaJEOdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lGkkDx6W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lGkkDx6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776408376; x=1807944376;
  h=date:from:to:cc:subject:message-id;
  bh=F06T24IUR87tEN1xKzsemPGfFRq3E13bQ8sFkC/DviI=;
  b=lGkkDx6W5jmrXqJKb6Imz572DxveIoDSpyg5u2933jAR9Gl/nYBgRTuR
   1KYrjBn/5V5joXcuV7VO8kuv0twhK/QkMlJ6wtvZoVwjJl3l0fjbPRB+V
   zckoq6Y1n+szgxfhCOeoFQ5pi7oP5d56/FJzt1RamogIe8LOy6qgmulnF
   jgAIuBvRK8Pr0djJxImlqw1IuQSmbWVXJi5O0oS+Y6jHht0/8oBmEihjj
   xJevl6OEOUZUJuHNShb9Kk9PzsnnAE/T4ZuKOQcBXAwEwo66lynheWAB4
   0LjHb+70PR3vOL3uJLAkI6GnKFu4IwV8xcJz4uEEMIHernr13JHOgnK8y
   A==;
X-CSE-ConnectionGUID: bdtPVzeASAOBCrv69a3FIQ==
X-CSE-MsgGUID: ABpfVIkCSjiM4iM2rjA6fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81291359"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="81291359"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 23:46:16 -0700
X-CSE-ConnectionGUID: s3osdZfzQHOkuFJFj7ByUQ==
X-CSE-MsgGUID: m8JnnXNtTVaS6qQOMBVQIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="254431374"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2026 23:46:14 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDcxv-0000000003N-3kGo;
	Fri, 17 Apr 2026 06:46:11 +0000
Date: Fri, 17 Apr 2026 14:45:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 drivers/iommu/amd/init.o: warning: objtool: iommu_pc_get_set_reg+0x11a:
 unknown CFA base reg -1
Message-ID: <202604171447.BHE74EOK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   27ab235e014269ff44817beda997780356467583
commit: f87819dc9429948d44f41406899fcfd598d8e50f [3/3] ANDROID: x86/paravirt: Add pv_mmio_ops
config: x86_64-randconfig-161-20260417 (https://download.01.org/0day-ci/archive/20260417/202604171447.BHE74EOK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9007-gcf3ea02b
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604171447.BHE74EOK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604171447.BHE74EOK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/amd/init.o: warning: objtool: iommu_pc_get_set_reg+0x201: stack state mismatch: cfa1=4+56 cfa2=-1+0
>> drivers/iommu/amd/init.o: warning: objtool: iommu_pc_get_set_reg+0x11a: unknown CFA base reg -1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
