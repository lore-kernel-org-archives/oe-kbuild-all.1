Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5E61EDA32
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 00:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783125220; cv=none; b=Fur4th+JtM/xp/Q3PXylWdBatpNipM5nrbvjPuHAc9ywgvs1fF3GnnFCQOWtm1+yVyipSc9LJJTuYDYcNhrbbM60E2ftYjEVuPokZZIRviij1cpoy7VC2vkiw9WWHD7IJ8uy5SLZHEWCKv1RZEOfzoDx+LB1GGLLR4817lUUeFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783125220; c=relaxed/simple;
	bh=vf2gx2/TufRwhtUin6IirIqcZ5zHFGjACauVunq1s3Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qPYwP0Tf0RV6kUYniEFxFVaTJGV1DuyvwPsMdyYLjmQPYFsIz6G/MPMNRYGRltfzmOog9h7pS4iQfnrMm507bjREklL8tyXDfLaCvBd7/Lg1aj9awo0t6k9PMP51tsq+iUptpMis4UhfjROizOqUcRV9VrFItxkYYSo4usNEUOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djDfHp9x; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djDfHp9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783125218; x=1814661218;
  h=date:from:to:cc:subject:message-id;
  bh=vf2gx2/TufRwhtUin6IirIqcZ5zHFGjACauVunq1s3Q=;
  b=djDfHp9x13Fm/PC4zFzpc2ryGBydiDX9Mob5Q2BAqmsDLLN8enwTZKr8
   HyjhpBMc2RwfZoX/hIc92f+8uE64PbNrMy8njqCMdSIRDyrRDmHc+ttE2
   WPD9v48fyqTBMXxH4mBjD4rh2XPaFxGA/eGIw82yb9zlOvC6lIJOmK2rN
   GMaTW3HTY+j0uoBSJwX+RpZQ9+T2M1HG+oIq2VAfdUVf2Hf22j7XoL9ec
   JZfdCXYKk6neHcBnoVcgY8XqZADHk17lHIPyh+xKZKAsXzzj++y0voPN1
   GW2MGLeKFL+NpQ1zrwRyQCYBHmzWw6NCvf+qGxOKsgiJIffi5l9jJFXTa
   Q==;
X-CSE-ConnectionGUID: ULn5uFjsQkSLoGqdvbCVmQ==
X-CSE-MsgGUID: esauu9ffTju4CUQv0/vuTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="82851758"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="82851758"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 17:33:35 -0700
X-CSE-ConnectionGUID: iH4+mIB0SBiq+XMITRRDqw==
X-CSE-MsgGUID: rpRZ+xihR0yLFltZ2StuvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253352058"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Jul 2026 17:33:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfoK3-00000000CjN-2f1w;
	Sat, 04 Jul 2026 00:33:31 +0000
Date: Sat, 04 Jul 2026 08:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 20/64] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/msm8998.dtb', needed by
 'arch/hexagon/boot/dts/msm8998.dtb.S'.
Message-ID: <202607040831.qkUwJIKT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   463bb2780d08d02a0be5218fc8ea4ac77f91cb0b
commit: 1451f0a2c6b7fc1a3fcdf5a218bec7dca0f8f44a [20/64] hexagon: update build system and Kconfig
config: hexagon-randconfig-r063-20260704 (https://download.01.org/0day-ci/archive/20260704/202607040831.qkUwJIKT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607040831.qkUwJIKT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607040831.qkUwJIKT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/msm8998.dtb', needed by 'arch/hexagon/boot/dts/msm8998.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
