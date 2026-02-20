Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D041A0BF1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 05:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771565164; cv=none; b=sYnEquUPead8dror808Ejum7ikROnkSaRxZNfY3KHaTyabXVVu1LVNweg32L2nj6T2dVfVUvNsJAnq/Y6YkdJ4DNl3OAZ8l+V/FNxdqCbA5PgDPEsDuRSEIywNBANnxVuZOtDNO2CRMosaMTzwQtTmbQ5IV5zPXwwBZGjMbnCPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771565164; c=relaxed/simple;
	bh=T01zWNFDmF4HGB4PdA1IUnxO/JJOQ6ORRze2wRREy84=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AWclh6V3QtjfAlllJU2W2zItthAqn2kjjiTgwCW58bmBlloFC+JM1E75cS002iOTaS84ze/kUrdjPu3msW/Ryc0rI3pRy9iaFZNm9GR3Kzczth5oAqeel9mNthYJiFERt/wkWYEahPIC60idjU9q9PkWYmmO4Pa60Te+TVJ1TU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLyue2uy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLyue2uy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771565163; x=1803101163;
  h=date:from:to:cc:subject:message-id;
  bh=T01zWNFDmF4HGB4PdA1IUnxO/JJOQ6ORRze2wRREy84=;
  b=ZLyue2uyrTDXEHTBPPLyIgkJS0WxN0AlDPFx8kDlJerhi5C9glPLAVG1
   XW0O3nQ8b//8WcueMaKpMH5w196W6aj4jhnXKRkGjzzxkfX8OlGECsb26
   hQKquOvlBO2m0QzuLYkXwCoQbPa6eCpqg68y6S9OG+T1Pg49vrM3/IAw1
   BK2OkNtTy0LMPQls9qQfLxHeZ5iOD6HfUjxlNOO84i1XFgq3YFaU+XcXW
   ybEPmxCVJ3tyAcsd29bMCCTlgrtsXWKVJ3r8Xty721/TRwhqrt9liNQoL
   09qQuI12E8TcjV7aKO5u5pntCMTkpi2TUpFlwoSbA13nGBeXohSNqKcUE
   Q==;
X-CSE-ConnectionGUID: Aj3Q4yi7RgCZVzvHzLij9Q==
X-CSE-MsgGUID: 92/K8LBJR+is7gmLlbM52Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60234074"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="60234074"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 21:26:02 -0800
X-CSE-ConnectionGUID: rs6Ap4mIR6OsGc1h2zTHiw==
X-CSE-MsgGUID: C44Wkih/Rzi/KJOhh3t0VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="218897900"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 Feb 2026 21:26:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtJ1a-000000013qO-2Pe1;
	Fri, 20 Feb 2026 05:25:58 +0000
Date: Fri, 20 Feb 2026 13:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 40/42] sh4-linux-ld:
 kernel/power/poweroff.o:(.bss+0x0): multiple definition of
 `____cacheline_aligned'; arch/sh/kernel/reboot.o:(.bss+0x4): first defined
 here
Message-ID: <202602201353.CbB3AT12-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   999dcca32838c24ad84b897eff67f18554b21aa2
commit: 24ea46a484fdd8d6ac6a90cfb927c1fa3d07d312 [40/42] hrtimer: Use linked timerqueue
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260220/202602201353.CbB3AT12-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602201353.CbB3AT12-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602201353.CbB3AT12-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sh4-linux-ld: kernel/power/poweroff.o:(.bss+0x0): multiple definition of `____cacheline_aligned'; arch/sh/kernel/reboot.o:(.bss+0x4): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
