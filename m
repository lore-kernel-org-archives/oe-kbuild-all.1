Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E873ED105
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 20:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272173; cv=none; b=DWw3nKtPbO8O997Wu0VjqtZDBOTFlYc9GDCvQIyM+KwdY6T+MAeaFSTyBECwW/KLm82amWdCSZJw6P3QxB6FCN6M3YUSx6a8dsfarmQVly3aCSjJ5ijjWt0Snyadv3DVKHOwctcBz5d/muyfv4e9TMjt2RaT/HZuBAQ0PGx/sa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272173; c=relaxed/simple;
	bh=fA7vQm6B1AYrVI7yVksPNi2Qtt7yKHGFWrDT9ponXB4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KfGsj9NkHnMSyYpWiQOjbAIHBGmpnj2+3jvc3dMdADTOLFG7vbcPFTaTvQm0WNOsF4Pa2nG5HblBQq09wkPilkcMdqCrq4R6b7c3E3dd9sBYXHkZlNpOIfEXwt/KZlGrI+QC0EzKAZ89ALs5Z9sl6TsCwSmjxhHj6MVNg92Ymr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByRLfMII; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByRLfMII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778272172; x=1809808172;
  h=date:from:to:cc:subject:message-id;
  bh=fA7vQm6B1AYrVI7yVksPNi2Qtt7yKHGFWrDT9ponXB4=;
  b=ByRLfMIIAH9ub5zwHY7QxZP0HNOGv2WF8E6VSh+xMOQyYr0Epoog39Uk
   HQ8RQSBveyCCNsF3rM3Ubi4f6NQRfyTeTfPdJDAyJQ7hr34+OsGiZTQIs
   AnlrfN2NW/BjTGU89NkJSrQnBQzXUoNPKid+z7Gz1XksiRCVlVTiLyYhx
   JTJXVRMlpZTXBWOpJK0DuW++h5FOMjZFwtFpB4D5mRHmKlMyW0kUptI3I
   jj8YnGyZYBCvC/B6DNI7j0ex+f/dnBktg19lQIz0S6aQ6Geta7XItEMlr
   3Q+zd6pf6+a8gkKB4wAUeLs/HBx43K9lVZZPS2BhqO/0yLFw6whywmGUU
   Q==;
X-CSE-ConnectionGUID: NA1b9x37SMOIgpVxA11R8A==
X-CSE-MsgGUID: Odr/FKo4S+uUH5aEQ0LS3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90631870"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="90631870"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 13:29:30 -0700
X-CSE-ConnectionGUID: Q0sdk30dSzeZb0DBNjFoKQ==
X-CSE-MsgGUID: 60WDX487QWOQdkDObt/sQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="236799800"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2026 13:29:27 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLRp6-000000000Pz-3pkJ;
	Fri, 08 May 2026 20:29:24 +0000
Date: Sat, 09 May 2026 04:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [linux-next:master 3460/4176] se_ctrl.c:undefined reference
 to `mbox_request_channel_byname'
Message-ID: <202605090449.Iz3ZmNRQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 338529a73c2bf2c277013b745cfe6f19b84b70af [3460/4176] firmware: imx: add driver for NXP EdgeLock Enclave
config: um-randconfig-r051-20260508 (https://download.01.org/0day-ci/archive/20260509/202605090449.Iz3ZmNRQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090449.Iz3ZmNRQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090449.Iz3ZmNRQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: drivers/firmware/imx/se_ctrl.o: in function `se_if_request_channel':
>> se_ctrl.c:(.text+0x3d8): undefined reference to `mbox_request_channel_byname'
>> /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: se_ctrl.c:(.text+0x444): undefined reference to `mbox_free_channel'
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: drivers/firmware/imx/se_ctrl.o: in function `if_mbox_free_channel':
>> se_ctrl.c:(.text+0x681): undefined reference to `mbox_free_channel'
   /usr/lib/gcc/i686-linux-gnu/14/../../../../i686-linux-gnu/bin/ld: drivers/firmware/imx/ele_common.o: in function `ele_msg_send':
>> ele_common.c:(.text+0x12b): undefined reference to `mbox_send_message'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
