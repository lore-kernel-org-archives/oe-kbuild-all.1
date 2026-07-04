Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8D31D757
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 07:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150636; cv=none; b=hhPIkKr+3kiI+iex7OSrLzoFNdtJQ97/zvc+uk/Ztc0tUVp2Ll/4nGAgQ+gPLULNHaBs0brgSltc8snbxQtnNeaR9rZjl8ZlikwdCYSdT2fFaPcz2N2Z0tkdk7HP/rT+Gl1GY8UPMsgCL5Xp5xCR4c2mZQAeLcgRG7e8zOqLU9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150636; c=relaxed/simple;
	bh=HiasSeVHoAfTm3NdRMEU6hdccl32+lJLHLaA3+eH4tY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GLXG2KyIyjjJ9cANqHdT+TLQoFGbhVQNUXp/4rUlTzLTv5eDlhnGljYK/M8e8unfRJRe1oI9U/evMMwYR816o4KiBfW46aFINfKYdxyPR/InNeUHibbgCN6KREKW9xEOGarZv83KQp1N54ukrezLexVPnwN3LUVm2l3vaRu6ZS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+APuJIG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+APuJIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783150628; x=1814686628;
  h=date:from:to:cc:subject:message-id;
  bh=HiasSeVHoAfTm3NdRMEU6hdccl32+lJLHLaA3+eH4tY=;
  b=k+APuJIGZ2WlMVdEmhjeLGonRi3/B+z8GysfuMFaIdAUBeuVx5APs96K
   yMpG3piIdCnrBPBc+y/+XRQhQo5mVWGUd4SentUXN0VsI+2NsU5YcQKgc
   5mNgl20PEufbA2zv1aBbmXDs1hASk4YKNxxn7US/GXPXt+VQCS/i1wFLS
   sq0wfbSYr9pnBCUu6YDPFWmpx0R3wIElXyjzTvh3yMe4y9JwOIRXuqjJ3
   nZdqasWgrTC2U5nKD2vO730NSnrd+0okG+PcvsUy5zrgKF2IKA68uTCHD
   hmx/I5+c9HuzcgTfPISz6x1XZ7CN+kBrqQ+/qYhL2RNDg3Ym75nmRJED6
   g==;
X-CSE-ConnectionGUID: 0fKmN+zQTw+cQcpex0XRDQ==
X-CSE-MsgGUID: yZOB1tYqRyK8OQVybNRZFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94233081"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="94233081"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 00:37:02 -0700
X-CSE-ConnectionGUID: SyMJqaitQ/Kq0osn9hrTag==
X-CSE-MsgGUID: RiJ3z+5qS/i6iQzqJWtbow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="283346193"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Jul 2026 00:37:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfuvp-00000000Cuz-22fn;
	Sat, 04 Jul 2026 07:36:57 +0000
Date: Sat, 04 Jul 2026 15:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Subject: ERROR: modpost: "sysfb_primary_display"
 [drivers/video/fbdev/core/fb.ko] undefined!
Message-ID: <202607041524.s5d65uAl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
commit: c5a8f13f1e476c90f4bc184a58751d3e7ff88f2b efi: Support EDID information
date:   7 months ago
config: loongarch-randconfig-r062-20260703 (https://download.01.org/0day-ci/archive/20260704/202607041524.s5d65uAl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041524.s5d65uAl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c5a8f13f1e47 ("efi: Support EDID information")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041524.s5d65uAl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "sysfb_primary_display" [drivers/video/fbdev/core/fb.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
