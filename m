Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33DB1E4AB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753694563; cv=none; b=fgvZ3TuBTguZh9GiKr/i0lVksrfMgLMfd1Evw+onKx7BX/qvtv6uZc8+OudUOYUk+HHktaZT7LUPejKs4imI5ZFiT1HCxq8v9TQT0hUIilHYuSka2JuASt5L+DV17hSrrefuj+GpYPnjj+rCPNk0/J44H99ZDRg5lt0fkIJxFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753694563; c=relaxed/simple;
	bh=WZM6+RBD2b87Dy+QU8htsNZ1rl+XwDUcI7ye1xqOgR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=du8o0Q+5LGEfoiFqrsDxHXXZ4NtXsgaydJwkhHI+xErrCk8JYu0Yp/PxxZ5FlapfZnbVjLLu45/YuqKmWPMwgUCUq2kpepIsKrzITEOLV3gyoHUCEwP/j91ZgVunS/NmG5k3z1YdA5hOK6aGQRx3EV8jcQxlWGPznEd6hrfog3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJWjSzrM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJWjSzrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753694562; x=1785230562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WZM6+RBD2b87Dy+QU8htsNZ1rl+XwDUcI7ye1xqOgR4=;
  b=CJWjSzrME82ftVYhE03edvrPS6QljLyrYOsTmKKN/twKrcCXgMMisPpY
   etiE893xcJYcikF6QQsrzJyIDWpKti5MwbmfiWOV1Pff0bs1TtM3S52u7
   T5MV3Vi5tWN0ZpG8iKUvkv+RslXSoPlK0d56ovL56eHLNz8wrFlcr6N0a
   ez7selJwG+NJgHzfjxlEXOkxBemLxqDTWPevm2CIEmUnjwPtAuK/CiKKd
   kk5emFxiSwrXg8FPdIyxra3pc83XCitv4faUEDp+TpkT2+mPTLaT3f/cz
   E1L1mPg/e7dN1in4/gv99tRh+/t6vw0d5LDaS40nkH6zaJlTmTg6bVJF3
   g==;
X-CSE-ConnectionGUID: hURdmKKXTf26fSr53+SUMA==
X-CSE-MsgGUID: +PA48SDzSWqz9YsIRm1LMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="73520600"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="73520600"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 02:22:41 -0700
X-CSE-ConnectionGUID: hGxvWgS6QsS0pEayIfFsMQ==
X-CSE-MsgGUID: nw/YZLSfQFqxEtxCjwBZOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="193334186"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2025 02:22:40 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugK45-0000Lj-1j;
	Mon, 28 Jul 2025 09:22:37 +0000
Date: Mon, 28 Jul 2025 17:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 12467/12680] arch/arm/mach-pxa/am200epd.c:39:10:
 fatal error: video/metronomefb.h: No such file or directory
Message-ID: <202507281743.5xObRBMA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b90c3b6d76ea512dc3dac8fb30215e175b0019a
commit: bcaba0cd4fac7e5772c8525dbf8f650045bb9f47 [12467/12680] fbdev: remove metronomefb
config: arm-am200epdkit_defconfig (https://download.01.org/0day-ci/archive/20250728/202507281743.5xObRBMA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507281743.5xObRBMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507281743.5xObRBMA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-pxa/am200epd.c:39:10: fatal error: video/metronomefb.h: No such file or directory
      39 | #include <video/metronomefb.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +39 arch/arm/mach-pxa/am200epd.c

854feaede51c155 Jaya Kumar 2008-11-29  38  
922613436ae562a Jaya Kumar 2008-08-17 @39  #include <video/metronomefb.h>
922613436ae562a Jaya Kumar 2008-08-17  40  

:::::: The code at line 39 was first introduced by commit
:::::: 922613436ae562a2903698f3a6e16998382a549d [ARM] 5200/1: am200epd: use fb notifiers and gpio api

:::::: TO: Jaya Kumar <jayakumar.lkml@gmail.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
