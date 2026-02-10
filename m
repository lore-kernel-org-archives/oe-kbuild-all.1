Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B424A32
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714816; cv=none; b=YdqEx44OVBNEjC1/rk7xPT1yEMpk+MROFvkfkHRT5wl39dGJxgh30kbgvBxoB9ki4WmhFbNRmI9lU/kK7pqQyOHHa4aXASvA3/aEMqqdYRzYXMYohsiur6ddiUKBeDMdjnGvUiOzuoW0KneXAv33oVo53WNYAENRiptJgU0AuJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714816; c=relaxed/simple;
	bh=lELKvDzg8m8+myBtuutpQsNcvMqgXMDEzrsuOvO4oPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Im6e1tBGDXA75PJhlXJHcQJMEIQKX9D2CuuCGm3MgpmcKKnyNZXMpll44Fn3LPrYvL4wwVNls9c9ZZuF4QQ/JqCtqMYeP5gFT82ZXWv6foa9aKAcUMG3eSuYwMgPB+LpDRoQczS3hMnvULMkY4rnekQMKZnlWN/E+A8sB9j49fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiiToEFS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiiToEFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770714814; x=1802250814;
  h=date:from:to:cc:subject:message-id;
  bh=lELKvDzg8m8+myBtuutpQsNcvMqgXMDEzrsuOvO4oPk=;
  b=GiiToEFSv29sK0zsglUWr7CshnYibjgoMwNng8fGOLG4+CjmsnYs9upJ
   San90JyFsygqGEXp8zAiQcpFKJIcBhmThcMm8fFYQ4n79ICkpoas8PbOZ
   w90WYtzmgYKJAOv0IVvR+10geli8Vai7kd/eQ43jgVkTKWlV3sdlf3u55
   Gj84LPPPO+eSOm/nFN8q6sfiFvPzzqBHI/lRllP3yVXEwiO8VcZQixFJl
   RzwjOMHxFPSjgNT76YPfc0Jj4UjFqCxoL317Gvxv9nxIcWLCbF+zRQwl2
   1I38sjG1eCtEbMB448+zmxhJemrp7o2Bz6dkESAKwDjF6FPpToTvpN6gR
   A==;
X-CSE-ConnectionGUID: iPhf/dMbTliI9QO7uq657A==
X-CSE-MsgGUID: 3+W5ZAN9Rr270WMOBKX3gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82567792"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82567792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 01:13:34 -0800
X-CSE-ConnectionGUID: xzAhfX6MTfmd1CtYTEcN1Q==
X-CSE-MsgGUID: LzwVKiVqSYW38bT4agHPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216030004"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Feb 2026 01:13:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpjoI-00000000oqq-09Sb;
	Tue, 10 Feb 2026 09:13:30 +0000
Date: Tue, 10 Feb 2026 17:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ross Philipson <ross.philipson@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [ardb:x86-slaunch 32/41] include/linux/slaunch.h:12:10:
 fatal error: asm/txt.h: No such file or directory
Message-ID: <202602101711.XqylAqJn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   68d6a808368b02c2fdfa0ba1e4e59d6b97668c1a
commit: c6eaa811aa41c3de29b05dce1fadad2533e459f2 [32/41] kexec: Secure Launch kexec SEXIT support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260210/202602101711.XqylAqJn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101711.XqylAqJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101711.XqylAqJn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/kexec_core.c:44:
>> include/linux/slaunch.h:12:10: fatal error: asm/txt.h: No such file or directory
      12 | #include <asm/txt.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +12 include/linux/slaunch.h

1877aef65de484 Ross Philipson 2025-12-15  11  
1877aef65de484 Ross Philipson 2025-12-15 @12  #include <asm/txt.h>
1877aef65de484 Ross Philipson 2025-12-15  13  

:::::: The code at line 12 was first introduced by commit
:::::: 1877aef65de484a2f9f9e51efc35e661c16360f8 x86: Secure Launch main header file

:::::: TO: Ross Philipson <ross.philipson@oracle.com>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
