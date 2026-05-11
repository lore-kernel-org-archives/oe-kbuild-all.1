Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12F040DFDC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 17:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520166; cv=none; b=efMCK9vJiJxyD6pghIfC40nP1UsAkNxoe37ec00RznPd8e0HY5J4NLdmu7Z+fDBBrhwLSIREA3dFjR/fvD09TBM52Sv4rBxYoJdnWkrNZ17qMCkKgfx03Q0LxOm5koB5k4LGZDE8KXKnCUq9ydq0f7I0XekLNLmCNefH6s8a4vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520166; c=relaxed/simple;
	bh=1rqmGazsOvok2YE1NjmWh3DX2pc3hUri+VcLO5GN0Qo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t2D6e2Rn3Lvi36vjzAccIX234PHdRuOOvU2x/9iF0pr8sPvOa0IWR+nLB8lnodCJrK55KjCWRq2OUbss1598+eB0YPkzC8aLjzK+CzIKh218GJ0R2+zJYKfmcOdXnY8vaWhCa5SkRuXvxSBrl6fDE7yNoPhoQa8uxujw+jplgpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELKFYaDu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELKFYaDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778520165; x=1810056165;
  h=date:from:to:cc:subject:message-id;
  bh=1rqmGazsOvok2YE1NjmWh3DX2pc3hUri+VcLO5GN0Qo=;
  b=ELKFYaDunZDruhQKts3rbXSHc/ONIdM7pyf7kae8zBw/Z+58lEU+EwaH
   f8gROdkix8KicMzPVX/Rg+iPIVCf2P+8XPrLGmkS/7EwD3t4rKInTbXPM
   CHmd4hBTbAtHVOFcqjbKr1kebsabRcod++8HrW1iLOy1oVdVxHJFhhTjv
   gtd1rS3Uo8NdNEELwSslXn9e1sbIUtx4ikSFxDsmIWAZ/yJ5ZGSydinSS
   HL+C+PuFMZgWF5GyHY7NZfN3dGpK+EA55qlHT5BlsIKLSTxBH3HwWGn2B
   xi65Dl3xUL9nwDnaKvvLrJDi0OWXxDloGyInzTZreng5jQ8wopv+bgK+t
   Q==;
X-CSE-ConnectionGUID: Txql9dPwRpeK64MHudoAlg==
X-CSE-MsgGUID: 12WLPuJHRvCcXqJbBZbFaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="66945686"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="66945686"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:22:44 -0700
X-CSE-ConnectionGUID: Fn1kQa5QRkqznn2WMLR6Fw==
X-CSE-MsgGUID: knvOtH2DQtGphIqzcTB1PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="236533860"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 May 2026 10:22:43 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMUL2-000000000wH-3NqF;
	Mon, 11 May 2026 17:22:40 +0000
Date: Tue, 12 May 2026 01:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:swap_activate 10/12] ERROR: modpost:
 "swap_activate_fs_ops" [fs/smb/client/cifs.ko] undefined!
Message-ID: <202605120107.HlkPWXyw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git swap_activate
head:   60f90e5dd34dee9854f698e50e111a7a953a3516
commit: 37507cc93caac14b685e9944e290cd58d09b4637 [10/12] swap: add a swap_activate_fs_ops helper
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20260512/202605120107.HlkPWXyw-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120107.HlkPWXyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120107.HlkPWXyw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "swap_activate_fs_ops" [fs/smb/client/cifs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
