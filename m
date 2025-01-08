Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A6E2D613
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 00:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736296737; cv=none; b=n0NAa3ZG5gMZz67ApDNBBPcWamLEUaN0E75a7NrFbsf9l5pAgWSn2hUQFXcCxx3xZADucWe4I2KjjABkYk8N/8IzSF+xbd4ZGDWp+/RKeH0Y0dJAHZAIz28pORcg1aZ1ymzPegrdiUfRgDnsz5/TLi8B4UkTDK6k2tUg4/Opeqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736296737; c=relaxed/simple;
	bh=ebNMG+FzXFlbLpB1dlk7TVWTnf7plOA5faXkF1VtJ8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HcNAjWlfceNmKIEforWav0qhZXUOULYI0b15g6llDMhhMxmWrktQ2XT4sPXUdVAUwMweF6B7MsEFf0sRCkbDKSmurz8QIKIyTge6nTydeJhCIIOIC0t/cmIkOJTHC1iW8eBHSZtjsOullmnyLrbe12YRECXyCbzFsrg+27HZBVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gt4Eumgr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gt4Eumgr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736296736; x=1767832736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ebNMG+FzXFlbLpB1dlk7TVWTnf7plOA5faXkF1VtJ8Q=;
  b=gt4EumgrV2feLhfjLDe8/ei4LDB+V/RBRaWoWALzZf9hgtLiKF85AHsx
   lslU5gx63RkE5I7y7ty2e7wLUov+x7t92POZRCVEIGuvm9wuKnO03U1hR
   1TpYiQxzd10zoWZ0TrW8qurqqwYNp4++sCdVmdormfGvGPXXmFxe+FFFU
   KeL7RKSM0ROEvEHPEPWJPEEnu7CTtLJJpBrvNReHPAiCnao9elxxe4AOu
   Sd/SB2P0Kv8veivWg3w99D8iBWMPi+uzExfsqg7lyHwTlpO3pfzKODoOY
   r03UJpPEy3IWZmG78n9vhqhJ6t81DXUPwm2VNbCh+YYTTYIPz5I0G5WRb
   g==;
X-CSE-ConnectionGUID: EqKOrcSyRz+KCkCb9Q5pGw==
X-CSE-MsgGUID: GiE4u+BmS4OPqEJ0rgqjUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47861783"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47861783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 16:38:55 -0800
X-CSE-ConnectionGUID: GFUDKDmnTAWcFh4dNcoRIQ==
X-CSE-MsgGUID: ojC7+pXgSuiHf7bcTGyvLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="102743973"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jan 2025 16:38:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVK60-000FPO-01;
	Wed, 08 Jan 2025 00:38:52 +0000
Date: Wed, 8 Jan 2025 08:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 13/20] warning: unused import: `ops::Deref`
Message-ID: <202501080852.8XDgWKod-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   497d0dab0af034c34b987f1b37db1df4c45a1b7e
commit: d2cdc1205b86fd317f42c25356969461f8e8a98e [13/20] rust: Extend OPP bindings with CPU frequency table
config: arm64-randconfig-001-20250107 (https://download.01.org/0day-ci/archive/20250108/202501080852.8XDgWKod-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080852.8XDgWKod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080852.8XDgWKod-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `ops::Deref`
   --> rust/kernel/opp.rs:22:33
   |
   22 | use core::{marker::PhantomData, ops::Deref, ptr};
   |                                 ^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
