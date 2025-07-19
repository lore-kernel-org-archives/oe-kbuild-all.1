Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6A1D515
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 04:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752897692; cv=none; b=MesdFzEhdyyUJPimz5EZ4td4B5KsxsRegnhYBz9SgG4/EATpUEPXKPp/xqh8B/x6crksIhcM3AcQ9BzIeKf2+7NswSAeIGVPD8ZCubfzvhsbAZ7ERGc48v89re3tb4+3QCJhX3ReC7PnBAzkGh+fnd7VdiE2DlfOvg69Mcg6QBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752897692; c=relaxed/simple;
	bh=N3RMiJV605oG38JSmV8wGrBUGo3AS+DlQ4wL7vfNLUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfdeJoQCTWRHRXnNsU7tQUdCebUfujT9Zu/h1F/6/ay6efBTe4q7GKluYYeR9QRoGo6mCVednpHZ1eapSmRdUUm/rwT6Ts0Cx85VUf/XgWIbDQETNHvZSt42uLnrCBDox+4+ZBB/xqpPTQfpzfsZ7lb7RdY/t6CPh9gm04cuVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EM+3zz1h; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EM+3zz1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752897690; x=1784433690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N3RMiJV605oG38JSmV8wGrBUGo3AS+DlQ4wL7vfNLUI=;
  b=EM+3zz1hR8dEeP/KXxDBupq0sMIn0nnwTqauDBmUb2/b3m2VoICXpInB
   cIBDxBmneziG1M/M9f4K3CxkIms9EBP1TfbNV/Akvd+uq/LBjrD8IyexB
   ozx8R0qfLuXR3uEFxQ2THl93hC9V50TOLWP50yLXZpLek6gjxLEffvniG
   sH+45ixSvOotsg5wWvnOam0Dv75FXBwEmTEdFlF467OkZzHw1Sg/BmZOv
   3rhJ8+hxsWPsQ2N3M74oE8R5tgByqvI/+yhypBnlS1XaCrz5eeSpI+35n
   U1aXg1A01B3pqEbohX9o4512hXg4GVly+3ckZh+PUiWpc9hQaicgL8RZb
   A==;
X-CSE-ConnectionGUID: KdaBWgxySUKRGhyg/n4GAw==
X-CSE-MsgGUID: ft9SD/91SpKas5YnPOeJkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54296149"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="54296149"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 21:01:29 -0700
X-CSE-ConnectionGUID: 3IMm1fyQQzmlXBvEjFXUow==
X-CSE-MsgGUID: UgFcJH2QSO+URTZHMGTYsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="162415594"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2025 21:01:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucylK-000FEZ-21;
	Sat, 19 Jul 2025 04:01:26 +0000
Date: Sat, 19 Jul 2025 12:00:38 +0800
From: kernel test robot <lkp@intel.com>
To: XingxingQiao <mnlife@126.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] rt_ipc: a new IPC mechanism called rt_ipc (real-time IPC)
Message-ID: <202507191133.7TvtRVM5-lkp@intel.com>
References: <20250718060634.469032-1-mnlife@126.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718060634.469032-1-mnlife@126.com>

Hi XingxingQiao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/sched/core linus/master v6.16-rc6]
[cannot apply to sysctl/sysctl-next next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/XingxingQiao/rt_ipc-a-new-IPC-mechanism-called-rt_ipc-real-time-IPC/20250718-140945
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250718060634.469032-1-mnlife%40126.com
patch subject: [RFC] rt_ipc: a new IPC mechanism called rt_ipc (real-time IPC)
config: x86_64-buildonly-randconfig-004-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191133.7TvtRVM5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191133.7TvtRVM5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191133.7TvtRVM5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/entry/syscall_64.o: in function `x64_sys_call':
>> syscall_64.c:(.text+0x17): undefined reference to `__x64_sys_rt_ipc_return'
>> ld: syscall_64.c:(.text+0x1c): undefined reference to `__x64_sys_rt_ipc_invoke'
>> ld: syscall_64.c:(.text+0x21): undefined reference to `__x64_sys_rt_ipc_register'
   ld: arch/x86/entry/syscall_64.o: in function `x32_sys_call':
   syscall_64.c:(.text+0x80b): undefined reference to `__x64_sys_rt_ipc_return'
   ld: syscall_64.c:(.text+0x810): undefined reference to `__x64_sys_rt_ipc_invoke'
   ld: syscall_64.c:(.text+0x815): undefined reference to `__x64_sys_rt_ipc_register'
>> ld: arch/x86/entry/syscall_64.o:(.rodata+0x2e80): undefined reference to `__x64_sys_rt_ipc_register'
>> ld: arch/x86/entry/syscall_64.o:(.rodata+0x2e88): undefined reference to `__x64_sys_rt_ipc_invoke'
>> ld: arch/x86/entry/syscall_64.o:(.rodata+0x2e90): undefined reference to `__x64_sys_rt_ipc_return'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
