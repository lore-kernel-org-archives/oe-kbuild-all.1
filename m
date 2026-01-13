Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F082500947
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 03:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768274511; cv=none; b=PnpQ6laY6wzGxljW9ncw38nGvp+0ELrc+evIXW2rS92FssKol+a8dq2Nzv6BSZnQRMPY0H8nlIbNZ0BgrC5HEREamp9PWQYHL4bPevFoiK9UUYU7trA7PYJcWbLrFfhgTR1rdB2ZJBdjbtYSTMgzy0rwM+k7aFGB9qLfpqbFkmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768274511; c=relaxed/simple;
	bh=lla1gLSTlZyyFaFVq3hHP6MUNJav5xNwj9oJ4m0Stoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F/6yg1DeNl9TalanWaZrOSA80IBDYTncH09IwPLfVsCHT7iPfWlTisYdjYFPYvS4tw9mEfK7oUA4ScRJkSUD7mKH3geZRuImRIB7ejz1BBybNtL/IQF/W4sLMloTINc7LDLwAHreAMSQMulmub4DYilotcdNfRUjO/IiTEBdCLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBCqfSAk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBCqfSAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768274509; x=1799810509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lla1gLSTlZyyFaFVq3hHP6MUNJav5xNwj9oJ4m0Stoc=;
  b=IBCqfSAkP4k0031a0QubSB6m7sxxS5FlnfAZGlYQKrGcmr5rpVLGTCJ6
   fgGB5L0CS/L/gQuFNHjfp9Vifg9r5usR8TdOEj3LYY2vYkAewml0+l8qJ
   x65KYf50nRvdPe9OVxmSsLzNN8l2ezh7JrtIeZ7so+eog/JfeM2r5vtxK
   eVVkPXQ8bQqWE7HMtMMxGLyGv4m7cgeVeNIBwPMlVGfzbrjNYx3Z2Mmk/
   6Gi3eqc8hoQZpKpr+aZ2Full/8lRSRBksyTDaM4QYigF3sg27t6lkgo5R
   5JxAt7peC86igJThLsJCnoTrUpnAKqDWbOFDrWqEDh8+V/JxAhyWXqZRr
   A==;
X-CSE-ConnectionGUID: u+2r9j6oSvKscfrCzinn2w==
X-CSE-MsgGUID: 6DKphQwFSsqletQloOgEXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69467726"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69467726"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:21:49 -0800
X-CSE-ConnectionGUID: glbdwLK4RqSxqdNYlAm4Hg==
X-CSE-MsgGUID: c/nFDKWHTEe4I4I3x+iZnQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jan 2026 19:21:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfUyX-00000000E9h-3B8E;
	Tue, 13 Jan 2026 03:21:45 +0000
Date: Tue, 13 Jan 2026 11:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
Subject: [thomas-weissschuh:b4/at-vector-size-arch 2/24] ERROR:
 modpost: "__bswapsi2" [fs/ecryptfs/ecryptfs.ko] undefined!
Message-ID: <202601131142.f4Kyqt82-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/at-vector-size-arch
head:   48790f0896dc14ed71a371b1a81ecd5c32347185
commit: 7ad4197ef8bdb56c2e4b411acc9bb311e91f6350 [2/24] ARC: Always use SWAPE instructions and enable ARCH_USE_BUILTIN_BSWAP
config: arc-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131142.f4Kyqt82-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131142.f4Kyqt82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131142.f4Kyqt82-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__bswapsi2" [fs/ecryptfs/ecryptfs.ko] undefined!
>> ERROR: modpost: "__bswapdi2" [fs/ecryptfs/ecryptfs.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [security/keys/trusted-keys/trusted.ko] undefined!
>> ERROR: modpost: "__bswapdi2" [crypto/wp512.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/pinctrl/pinctrl-single.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/video/backlight/qcom-wled.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbfillrect.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbcopyarea.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbimgblt.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/sysfillrect.ko] undefined!
WARNING: modpost: suppressed 92 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
