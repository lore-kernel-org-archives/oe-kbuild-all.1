Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0086440A938
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343952; cv=none; b=BXIIjb9PhjXAYroLmNT3pKNg+yQ8UC6fDeOqbqIU1sDOKmxzMSyJfsfHHzVY0ksPxdY1yiGXX6CJ1COGFBFK9ZWji+Cwm3WXFUXMDJ0/2sr5q/dLVgaaPyP7rYswjUCD6vfU9lrDowPk+nPdfC6Zzug/9mPNpTztMaSSg/pHCcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343952; c=relaxed/simple;
	bh=5br0P6LN6WY7H1me8+S2CC+NL0rWKdsdxjpvVbb367k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QIaauiFubXfvExuRhaScbW4iZFQWdCLuPupcpikdsu47UlPPUVoiAvC/gVF+GV8kK5uvwd1Bha1jFdtET6DyUZEJQ4dBFKJB+ssRZ6p9jDZROfCl4XSqT0l5xOWW0mRHtM/dwlPOyDDlkNNThIDlmkqEa+OtLpQfS3ISgE/gfoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUXwHZWz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUXwHZWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783343950; x=1814879950;
  h=date:from:to:cc:subject:message-id;
  bh=5br0P6LN6WY7H1me8+S2CC+NL0rWKdsdxjpvVbb367k=;
  b=WUXwHZWzU9uYhkrZVoYXDr++3IENk1V6VhrrE3u4ZufmwRHeQxuJtG2A
   kg4PTGC5J7tv1J0x78yjWMaCXGXjizH9/1fZxanHDpo03pTxX9h3oTyrT
   jVEMeRbg50JAAc8PISXcLZGnXJNfSCxjdVUtdY8qF8F6CNW+TTl5oFgnl
   CJ/tzSjmEd51gGSK03QP30f3iJk+6rR9GZsvAO3NEtsMYRaljrg8xpwuK
   7HtNB+/WLWIQyq420nr9YedLkaMWII6ZT3B6sbVoww4Aqr5Me5w79RCj7
   iOvdbV2mDz+6+IYeJRQhB122BJk+KMQE6qjcdv/vL6DpeKe4PFl5OOeDY
   w==;
X-CSE-ConnectionGUID: lF9UAMCfTn6SB3BscJsWwg==
X-CSE-MsgGUID: IgtgXz2wTCubUQZZoIjjTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="101522021"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="101522021"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 06:19:09 -0700
X-CSE-ConnectionGUID: 9y+EjRD2TCC9iNOx4lkMgw==
X-CSE-MsgGUID: UJKvpgoQRnWjkw+gXTo+Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="251964074"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Jul 2026 06:19:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgjDx-00000000ENr-19og;
	Mon, 06 Jul 2026 13:19:03 +0000
Date: Mon, 06 Jul 2026 21:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_upst 27/54] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/qemu.dtb', needed by
 'arch/hexagon/boot/dts/qemu.dtb.S'.
Message-ID: <202607062142.Ecx8vqIY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_upst
head:   5e4bb1f393648d68ee1bcf780f3380dd8369e397
commit: 27e178c4dde2c2c32733818fbed3d1df5a00664b [27/54] hexagon: add minimal QEMU platform support
config: hexagon-randconfig-r122-20260706 (https://download.01.org/0day-ci/archive/20260706/202607062142.Ecx8vqIY-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607062142.Ecx8vqIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607062142.Ecx8vqIY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/qemu.dtb', needed by 'arch/hexagon/boot/dts/qemu.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
