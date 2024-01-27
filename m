Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257452377A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 23:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706399650; cv=none; b=HNko9iL/ANkGHSttsYG06OaWbqHyo8SJ/d3zdYDfgrS6dv3ngxMKPH4oTvPy84CVgSrrT3THIbdKeACBF0oQrAm6BhpWiK1FP16zEggkLI+JtrfR9rK5ixy1/nxsqDPA6jfsxxY6C4kwHVM02UZiMCSpomUgOYv+Ud+b6s/vod0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706399650; c=relaxed/simple;
	bh=D39XV835MnTbpUfj1RyrtgYecTJvk07KAH8rcxpAcKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CvkKR5KihDj2y/mv2780koX4cx7ADwUusX21QAvA7ncLGUjW2vAQ4BCwnRBIqem9V5iwWFrJkXjIiPdboRE+Wdw1ZOkUs9VV8tlGL/63Wsm7vpJXToNioxRVKIMbsoio/AR0h9uIPeWGlRiT0CgmEMmjS1o8ouRTzvXtPOJ7Wj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aloXO5JJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aloXO5JJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706399648; x=1737935648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D39XV835MnTbpUfj1RyrtgYecTJvk07KAH8rcxpAcKI=;
  b=aloXO5JJFtypz3QXV/pfLXBVmbeSDTjKS5fjZa5KwsrSRWqdHuHElr+y
   pwRV/2Rl/PjC79qtAy0S+9Fp2QKn7E0NoLaVDipyAJ0BTfw6UHsY3h80V
   d1OOHDDefysBv7E6AoX4WIWIyuMIak7KdZA5pTX5Bm+HqCd6FyZLmRH0e
   jnlX4uOBTEXinH9M6+rxKan8htrIs4WoeY5eoy4EUK0AuteHAvaAC7j2H
   jB6aqInGeroSk8DAPKoMNO3obV517C2X7QpDPjR6PopaycPLuT0/KOLfG
   CtjNE4EexahRfS3eflzt/XDEG+rwXOHZKNFss9lrcV8uM7QFN0xaVLcIt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="1657619"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="1657619"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 15:54:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21716724"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2024 15:54:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTsUu-0002sI-0q;
	Sat, 27 Jan 2024 23:54:04 +0000
Date: Sun, 28 Jan 2024 07:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 1570/1892] make[4]: *** No rule to make target
 'kernel/elfcorehdr.o', needed by 'kernel/built-in.a'.
Message-ID: <202401280724.R6lQ6tyY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
commit: 1777bfb42f560d0f1d4f8c31ba86423ac4166f43 [1570/1892] crash: remove dependency of FA_DUMP on CRASH_DUMP
config: i386-buildonly-randconfig-004-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280724.R6lQ6tyY-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280724.R6lQ6tyY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280724.R6lQ6tyY-lkp@intel.com/

Note: the linux-next/master HEAD 01af33cc9894b4489fb68fa35c40e9fe85df63dc builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'kernel/elfcorehdr.o', needed by 'kernel/built-in.a'.
   make[4]: Target 'kernel/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
