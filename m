Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9454F233945
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779543921; cv=none; b=Gl6JLLWEt6EupF1nFOWRohdEIXfmexz3LgRilCoZp4L7ynzc5ew3gfzDbpweevlq3zU2oNGoRFmfvTy/vYdWj2fYveoorWbS0oy/MwBRPzzSldT6QiDE0+m2Klcc6b2G0BKD66FnxE3SZeHWbXndfR6XwEpV1xtTBsImXejOWsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779543921; c=relaxed/simple;
	bh=kVlEEKv803KrKlMPIrfAry5YD3NoeJjVvm09t62CxrI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gvqtliZEWW8DIPSOUaWh9ODGP2wCfrBOkWKOibSa/CrIL2vLgYXnMilShJYrH0znspuETVDwQMBV4z5rYziP/zFQCOzt81qBisR6RaHKko/E8V58qbUQN/EYaMYze6b2+8GwvQJZzyXJrLySrSylj7Ay5HCtYAaewakiJY+u+G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMjDgy9V; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMjDgy9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779543919; x=1811079919;
  h=date:from:to:cc:subject:message-id;
  bh=kVlEEKv803KrKlMPIrfAry5YD3NoeJjVvm09t62CxrI=;
  b=CMjDgy9VANTgrYZKNqjHOfJc6fZQV4oPjoMUCQ1BCYy4TeVujNYE7GcD
   7uXauEv+/3ItQVowcaBirLOJIohlleUwrDiPggP7HhOYxhZttvqqjUXAe
   QNpE/EypEqRN350RzaO24JE/uWBZ90wOWKkuGm1pbq06RMSSQSa/Pm7EO
   Go2Wj3i0/VN0fmRYJ5tWkAnBCevbR7VspA5RUao1rzAZ8lBytZu2eU0uS
   IwwtweVUlLbFdDHY1z40KWy7rXwwH79BMJxqGMq0v0o7BjpNO3L+Pyi4k
   esbU0c27ewOHzsSSHV5x31GFPMB+cZSdTKpy79+gGxQdO/9r0sAjTQ1/0
   g==;
X-CSE-ConnectionGUID: zCCDGZIQQvm+OUsLZNgaiA==
X-CSE-MsgGUID: A37XVRSpRJKdy8+xsh6T4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="79478497"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="79478497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 06:45:19 -0700
X-CSE-ConnectionGUID: W4Sb3RSFRXSdvadY6QA7+g==
X-CSE-MsgGUID: ZMgNTCHeQvWvQi0yQfS//A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="242972520"
Received: from lkp-server01.sh.intel.com (HELO cef7325a8999) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 May 2026 06:45:18 -0700
Received: from kbuild by cef7325a8999 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQmfD-0000000005V-3UGQ;
	Sat, 23 May 2026 13:45:15 +0000
Date: Sat, 23 May 2026 21:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:riscv-soc-for-next 6/6] drivers/clk/clk-k230.c:18:10:
 fatal error: dt-bindings/clock/canaan,k230-clk.h: No such file or directory
Message-ID: <202605232159.DW9pfFiP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git riscv-soc-for-next
head:   a30fd85e902a1b09518b44f77bb16a4396dd6c24
commit: a30fd85e902a1b09518b44f77bb16a4396dd6c24 [6/6] Merge branch 'canaan-clk' into riscv-soc-for-next
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260523/202605232159.DW9pfFiP-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605232159.DW9pfFiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605232159.DW9pfFiP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/clk-k230.c:18:10: fatal error: dt-bindings/clock/canaan,k230-clk.h: No such file or directory
      18 | #include <dt-bindings/clock/canaan,k230-clk.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +18 drivers/clk/clk-k230.c

a7b7c7c6c01679 Xukai Wang 2026-04-25  17  
a7b7c7c6c01679 Xukai Wang 2026-04-25 @18  #include <dt-bindings/clock/canaan,k230-clk.h>
a7b7c7c6c01679 Xukai Wang 2026-04-25  19  

:::::: The code at line 18 was first introduced by commit
:::::: a7b7c7c6c01679efef0fd2f2ca1c5114f303e4f5 clk: canaan: Add clock driver for Canaan K230

:::::: TO: Xukai Wang <kingxukai@zohomail.com>
:::::: CC: Conor Dooley <conor.dooley@microchip.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
