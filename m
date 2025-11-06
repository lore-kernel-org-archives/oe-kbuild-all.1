Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC86218845
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762421948; cv=none; b=Z2u+1sGXl0J5MGj4syyYd7r0vykBhHC6WZEObWxrKMrVBhxe5uLYy/Z9FRdHjj3iflex89G2UUvcuqmps2Ttr+i/vDl2VPghG6P2e/bnhAQ7+rAtl2sOLKDov8ygpqv/qlNm+3FblgItmV9UUFd1GLgyV85JianhKDBUTRj8PDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762421948; c=relaxed/simple;
	bh=g5vZmkrvgxSqOo15D1uVn0KcnoBNdMGgB3rLW33L9JI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WHtpSVsLSNTYK9MQ2f/dhFDWo+uKhNRPjVxTiF0WFQMcLPm6YBRjV0PKxGJjKlPLN38Ec2T+COq6qkBFtDgMZ2ksycUAg9CjHY8vZO2L/AD1J9rHAMY2+DikP9VSljYsT16e1sjHp0No5FFdwoihb2A5PU7EEV4nugOMUFgvavY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbVNlbhN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbVNlbhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762421947; x=1793957947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g5vZmkrvgxSqOo15D1uVn0KcnoBNdMGgB3rLW33L9JI=;
  b=kbVNlbhNLBcUf1njAltqylWSmhvpoC1b2TTi8MrXzHcxSviH7Cgp+O3K
   o0jb+sYVRmdw/MQf4OtWtNvkRiKVuGtN1NDwd5B6IMEXN5KhtKhkOAubN
   hDsFD0zIp5UDqM4oHMQiwJAnlGlxh/y9W+AfI9mXe6SDoNR3Q08DmU/lX
   +Lvp+lSxW4Ne4x7RxXFPnG8GYdbo/XSrg2qtRB8UWv/xW1yyF/R5bOAHW
   7Nk2rbS47E7g9Pv0VVq2cGGIs8xe63eFIwN5YaCDIZaBosqSgb6Yu2H45
   D0P2H0juqr1XqWJEvhn5lppBkTVco8jjevHjS3CpXU4kFvvzC8YpEDI+z
   A==;
X-CSE-ConnectionGUID: PQwwC0aTQ2GYQ6NXAe84Fg==
X-CSE-MsgGUID: Vbh+bsiCSQGf9djnsOupzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63759016"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="63759016"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 01:39:06 -0800
X-CSE-ConnectionGUID: /iuCGmf1RV2rC8IEIrCIKQ==
X-CSE-MsgGUID: HsYW6GpKSRmy32r+a2iBWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187873145"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Nov 2025 01:39:05 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGwSM-000TjK-2i;
	Thu, 06 Nov 2025 09:39:02 +0000
Date: Thu, 6 Nov 2025 17:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6722/6818] Warning:
 drivers/gpu/drm/xe/xe_pm.c:131 expecting prototype for
 xe_pm_might_block_on_suspend(). Prototype was for xe_pm_block_on_suspend()
 instead
Message-ID: <202511061736.CiuroL7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
commit: c6db94fd0d2023b5a2fd774864c4039352805ce5 [6722/6818] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
config: parisc-randconfig-002-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061736.CiuroL7H-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061736.CiuroL7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061736.CiuroL7H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/xe/xe_pm.c:131 expecting prototype for xe_pm_might_block_on_suspend(). Prototype was for xe_pm_block_on_suspend() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
