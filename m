Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFFD128395
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 04:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779165597; cv=none; b=P/fxErp+n1UVQ2Nt2iA5C5T0ctd/2/sYZGiCEXX87BbSt9d60wmBM3GFcXPAA1gPGrWM+OboN68JOVmmtOl59ZeHfDFdOA0qMcouf3PJuXc1Wjcrh1q9PW4TwT4jl3dDBXZB6uB76Y69NJGkcdgkfl3ds9PtoUbR031DL9pqmw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779165597; c=relaxed/simple;
	bh=h2zdP4rYCzy67TeHFgIryqTeD4peHS7Jp/U+TDACbEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hPnHOoYsfohefbc+Dy2exb7m80fS06ubMkOaEP7V7OhMl4szHVdxgWT3ZXscQ3VyaOxkqv8Re0ShSuhhk4ZzkF0SlD1sKu4zOcJLefVJqzF2C+yJNlniDj8pdqJ/5a/O8qI9KF686D2eHcNoLT2p++/7DWv/ZGCXBPHjqL+fjYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjvO2Fkb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjvO2Fkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779165596; x=1810701596;
  h=date:from:to:cc:subject:message-id;
  bh=h2zdP4rYCzy67TeHFgIryqTeD4peHS7Jp/U+TDACbEU=;
  b=CjvO2FkbaL/V92/TMEC//NfA60apVYIkzY7Xcq2/KJw07QBv+DBnatnq
   NbBA2Kaz/1rePI7nqNF6Oki5Eeb32kC4x2BsTLk31Gp+yuDHubqcySfg8
   ibeAyagyZLHWPCiB5eZAoAUrQcq/0pjZTPrHxalqWHyP1F0x85ObMC3rb
   fRSPRTK1+O2wVNwtl6oQG1dXiEUIMhrrxNh08cAUUUeGwnApthX017aAj
   a4LG/GyBcJ1voytxwPOZq5gXurwMC4kd5RBo/TUcI/dIWdkXpwOC4f7O0
   lzsbWARt+L2gGla1Ry0HYWzxnnbpRGFHQ+6QF4Ip+nLfMVlnUn2qbd0f0
   w==;
X-CSE-ConnectionGUID: yU/8M7sYQGSG22D5i5GYsg==
X-CSE-MsgGUID: oKD09HXFTpeYd73dZ4j5+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83648452"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83648452"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 21:39:55 -0700
X-CSE-ConnectionGUID: 5XgQ6F0PRmSuo84SogGoag==
X-CSE-MsgGUID: Xt6duxqcTCmnsY1+yIEyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235195808"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 21:39:54 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPCFD-000000000Sn-1tBX;
	Tue, 19 May 2026 04:39:51 +0000
Date: Tue, 19 May 2026 12:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Marshall <hubcap@omnibond.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/orangefs/inode.o: error: objtool:
 orangefs_readahead+0x21c: can't find jump dest instruction at
 .text.orangefs_readahead+0x2dc
Message-ID: <202605191252.LGmijl2x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4d3a2a466b8d68d852a1f3bbf11204b718428dc4
commit: 415e507cdefc510c01de8ab6644163327ee9a5d0 orangefs_readahead: don't overflow the bufmap slot.
date:   6 weeks ago
config: powerpc-randconfig-r072-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191252.LGmijl2x-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191252.LGmijl2x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 415e507cdefc ("orangefs_readahead: don't overflow the bufmap slot.")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191252.LGmijl2x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/orangefs/inode.o: error: objtool: orangefs_readahead+0x21c: can't find jump dest instruction at .text.orangefs_readahead+0x2dc

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
