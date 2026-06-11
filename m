Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF693C199B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182238; cv=none; b=Mgr17Nyefbpjb984MJcYz+kXpiDRTkXvtu1RMbqoEvioFG1PImzDAYNF1v7MI6awy4qmEv+5uUKY7CkulOdW7ODqPSojtU/2EqoxBKJ4dU/n2TpZMSbjnvebJZaRXEluZpwNjhuDNEip1BFMCXbGSNLJJi5EhS4MYh7Fvn2O7U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182238; c=relaxed/simple;
	bh=WpEGuY0shZYzWEMZLXtnSDTjHUDkp3TtsLFppLjply4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SY6dzCPhj+gGy4IQcEteezDKHjMQP3gz79I36gW2YLl+wOxCXFeigKZt2GXjrqcp/XzQcHLZ/oKUc/Ps+yTqCnS6Qxh0n3GhcwiMC2y5lsHzyumi4JqFMguNb9B+i524+MMM6uel0Ogsjp8h3f/LVQwPj+aWcHYetZgaF7vx2z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rf9eSnwj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rf9eSnwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781182237; x=1812718237;
  h=date:from:to:cc:subject:message-id;
  bh=WpEGuY0shZYzWEMZLXtnSDTjHUDkp3TtsLFppLjply4=;
  b=Rf9eSnwjAjLq/APdJsSUKnlTr4VDiG7kIcgEQw+UtjPrTrgQ9o7djEUD
   8ph+hVU4Z+TxmsD8Dhbh0OA+wmA05gvya4WjnnRMNhd5mthQkxcE+M1Dy
   1EsKsWFa6iIZ2JUS94bEv3JDJyCeM/7FXZN/cJTNsBMJ3gOsxSVYoE3bT
   kGUOnsqjJHk/GdolnbEL+kFvSqhY6lZXZ+A450Fw3gPt82kY+FzmUEz0s
   kgVGDfCQiDN28jAqKbpPpldde1ZlsriTIc1gNmqqkl2uIuTGtAxPc+Wfc
   nDNmHR9Vy4k4XWas73OH4Do1Izac7zZfYOMkSujNtpS3YzTD3IYt4ftnB
   Q==;
X-CSE-ConnectionGUID: cXgw8ykfQSmNnmMbMHNx6g==
X-CSE-MsgGUID: Ocu6RxqXQUu4vgAuBofNNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93100276"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="93100276"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:50:37 -0700
X-CSE-ConnectionGUID: 93Axtjk+TaC+MPlD8M1qbg==
X-CSE-MsgGUID: CEUc4BqDSz6MSpNyydA9jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="242324238"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2026 05:50:35 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXerg-00000000N0M-3EqU;
	Thu, 11 Jun 2026 12:50:32 +0000
Date: Thu, 11 Jun 2026 20:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 9/9] riscv64-linux-ld:
 timekeeping.c:undefined reference to `ntp_get_time_state'
Message-ID: <202606112045.vR20QX4L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   92bc9027a194c5044f82cf2b02f1312b650f8373
commit: 92bc9027a194c5044f82cf2b02f1312b650f8373 [9/9] kernel/time: Add /dev/vmclock_host miscdev
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260611/202606112045.vR20QX4L-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112045.vR20QX4L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112045.vR20QX4L-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/time/timekeeping.o: in function `getboottime64':
   timekeeping.c:(.text+0x628): undefined reference to `ntp_get_status'
>> riscv64-linux-ld: timekeeping.c:(.text+0x634): undefined reference to `ntp_get_time_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
