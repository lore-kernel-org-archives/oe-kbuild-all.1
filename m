Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B554918
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748068591; cv=none; b=KUyYiGicuQKXGLnhHw34YsfLgxutReU9vu3g0KrGqhYsjFRxXp2ZsPSSr+GGxEBOXHPBn4RTORh1g00nJACZ9wA4YOF6l6SYI6KyiGtZeaqiOl8f653em7t0QBwryhS9+3rN/nwEWa4jUhtm0ptN++xr/SKzTAxpYExrAWv2UoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748068591; c=relaxed/simple;
	bh=+PNc4XCvkriNve6iQB4nSCbFWNZIr0gt9pFmG95Gau8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=djK1aFxJ20rtBJktSCZmkGdD3CL1HyPKq+knpz266gres45Mh4IZieAgQdSb9GbBbPGSaEY/p2zNq1jZSDvKG3/UH6VSXuzzjvhwMSyVsSGJYbYem4iA4hdFf2/S7goEOjBzbBLUdiI6OruzbRtVoX1FTZaWgr5G3egivNJOb2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFM/Ndau; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFM/Ndau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748068590; x=1779604590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+PNc4XCvkriNve6iQB4nSCbFWNZIr0gt9pFmG95Gau8=;
  b=UFM/Ndauwssv0av+3X9A7tEqA14da5Yel2fpOF6GwpamlSaFLlSmJfqK
   eFiUMSzUbObGKR/BDYy4uFbsBek6FLZiA0Aoj9m4j6Hghq55lv6UWPfOc
   olZc1iOn9XB7x59i2+voSegSjeHz6SNrt8hof/ag34xWurTSk197E+rRT
   a+LnOq/B54V6vmBU6xmSJ2xnaGjVlr/qpM23ympoTjc7W/5rlEZk3g674
   bc2TGREmafYiE50fuLlRaIPkDYLfjUTtkzM+X/ZzIpfHz51joHq9TP48C
   TjwyUHmOw0nlgFYxzWI6xYwJfQg34PmN388wvTA8XggqBnTFeXXtImZlE
   w==;
X-CSE-ConnectionGUID: YEoj4lLrT0WI8jqo8Ais5Q==
X-CSE-MsgGUID: Lu+IWn2hTuqWOcfs4jMWnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72646308"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="72646308"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 23:36:28 -0700
X-CSE-ConnectionGUID: NWDy8A+OSXa5VMFGsBkqPQ==
X-CSE-MsgGUID: 6Gk8wnOBT2yMIQlMp4EbQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="142404278"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 23:36:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIiUZ-000QzO-1S;
	Sat, 24 May 2025 06:36:23 +0000
Date: Sat, 24 May 2025 14:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>
Subject: [jlayton:uek-localio 2010/2262] make prepare: error: endless message
   GEN     Makefile   SYNC    include/config/auto.conf
Message-ID: <202505241419.HcYXC5Uh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 6b54a5f98028f22335751515ce25c05c82b21c54 [2010/2262] ctf: generate CTF information for the kernel
config: sh-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241419.HcYXC5Uh-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241419.HcYXC5Uh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241419.HcYXC5Uh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make prepare: error: endless message   GEN     Makefile   SYNC    include/config/auto.conf 
--
   make[4]: *** [scripts/kconfig/Makefile:85: syncconfig] Killed shuffle=2604481678
   make[3]: *** [Makefile:734: syncconfig] Error 2 shuffle=2604481678
   make[2]: *** [Makefile:835: include/config/auto.conf] Error 2 shuffle=2604481678
   make[2]: *** [include/config/auto.conf] Deleting file 'include/generated/rustc_cfg'
   make[2]: *** [include/config/auto.conf] Deleting file 'include/generated/autoconf.h'
   Makefile:778: Failed to remake makefile 'include/config/auto.conf'.
   Makefile:812: Failed to remake makefile 'include/config/auto.conf.cmd'.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=2604481678
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=2604481678
   make: Target 'prepare' not remade because of errors.
>> make prepare: error: endless message   GEN     Makefile   SYNC    include/config/auto.conf 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
