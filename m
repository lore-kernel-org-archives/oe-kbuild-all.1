Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827BE342526
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 21:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780351026; cv=none; b=MYg+OZDGGzyMOZdSceQnGvubXVZLxgZ4KHwHFcD9c8pa4iaCn2LXNxfUZimpdXvKMo97GV0C1Oidpg1A916F4M7KzlHr75SpEMNasMgBvwl9pClzuoI3xtU5jnPMHQloFH1mgWx9wcKFOkyd1NiqV7seTOdee3ASQ4Zyu0lQZ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780351026; c=relaxed/simple;
	bh=RbwKijCyG6jtZlW4fTUFONHnCcP+OzMu4XUXBe3/Ue4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iTHEO79yBAQrLPymP3mu6z20KQnsERR3gMe+8OM3LiF0z1BxCNY97AhxiGvbzFMduhGP3WD7cJjGLImbJr/giyEVV3DEsCT2Rg/vPuChq6t30ieNRPdE4w2h11J9VoXDdD59dkkmTfrT9WUtZorxCYSeqeI+zpnxFGMi87bdqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ocg/eNTi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ocg/eNTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780351025; x=1811887025;
  h=date:from:to:cc:subject:message-id;
  bh=RbwKijCyG6jtZlW4fTUFONHnCcP+OzMu4XUXBe3/Ue4=;
  b=Ocg/eNTi09FJvdV9KdfsqrqN6IAj8tLEnlDqS3DNuxNp17AHDmRpqCSc
   dPS857abnOBS/YF3HWwJz3kR+tsdi6Zmzq/SDpGfSPkQKF2uSSEtxRifp
   ITVdhL3iRAUd6PdPlQpgb/lXTzTw/tlx2k/db65OIjydeI9fw5BpCywd/
   UjKEPg9cv8Vv/SKBzukUWco6o++I8vgLf2l2L+WXNYJxfYwgyT7Ox2wUC
   ug/a3EU/q7fo9IWZG6d+gKhh8TDlwOXNmhRae4zPGwmfHVP4kqOqfJTZ9
   89XdX0pMnljeZuOkf37Ii+PE1g9/pW34MpQAUmdTK8P1poVAA8e6SSbf8
   g==;
X-CSE-ConnectionGUID: 1uWzhU9MSW6GiVVazAiI6w==
X-CSE-MsgGUID: 2LOTDo3MRUie6M+bv+969Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80850210"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="80850210"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 14:57:05 -0700
X-CSE-ConnectionGUID: exK3y20BSauPFDsv0ASxXQ==
X-CSE-MsgGUID: Lg4OGhHcR+WOiPsQmuf1Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="267575582"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jun 2026 14:57:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUAd2-00000000B7W-1iQu;
	Mon, 01 Jun 2026 21:57:00 +0000
Date: Tue, 02 Jun 2026 05:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4036/9870] Warning: lib/rhashtable.c:1030
 function parameter 'key' not described in '__rhashtable_init'
Message-ID: <202606020558.MTZqSPtu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 060d4e94b8d400b62453890821bd7feecd4cde2c [4036/9870] rhashtable: give each instance its own lockdep class
config: m68k-randconfig-r062-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020558.MTZqSPtu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020558.MTZqSPtu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020558.MTZqSPtu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/rhashtable.c:1030 function parameter 'key' not described in '__rhashtable_init'
   Warning: lib/rhashtable.c:1030 expecting prototype for rhashtable_init(). Prototype was for __rhashtable_init() instead
>> Warning: lib/rhashtable.c:1104 function parameter 'key' not described in '__rhltable_init'
>> Warning: lib/rhashtable.c:1104 expecting prototype for rhltable_init(). Prototype was for __rhltable_init() instead

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
