Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8662A8D7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 19:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709236197; cv=none; b=M7UyG9FrTMZRWK+cxdz4GShSyLYaTHoIh9JtdBhiZwkIkaCg1ia/Pi6Wy18cIwF5naMm3MwDKxWX/NnnMxUq3ki5a/833ejTngewHIvvvQFj+c3Zw/xh81W6tCpW7KOb67n4gEMDYuhHp74XvI+fgzf5lMlJs3rT1K4rjnxEf/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709236197; c=relaxed/simple;
	bh=NCbrSq2ojZvv5G2PLAEpZSbplqaZERL91V/utEpDX4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MeH4htmp+22WJjokFX1kXe609Tv6xyNU9BjxrImyiQzx7Z2Qzeyxp9NtsICnP9pEMJ0BjBNuela6AseelwL836SpTleQfJjEpj9bYM8maxR8d3wSdgaL0JUQwIp4Ur3rDCcXbW5UWXnB7tuhXDQAeJzpc7nK849Pa+aa9vXXwwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekI8VMMU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekI8VMMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709236194; x=1740772194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NCbrSq2ojZvv5G2PLAEpZSbplqaZERL91V/utEpDX4I=;
  b=ekI8VMMU8k+yCa34/7lagqIFdm3LJsvhlV/bzoyjQE563bK01iBIUYd9
   Ntk6MjsPVCQCjwsAZz7pUQPHbob0b8TMqO9N0F3tNHXt3Cp0OqIOQxmsi
   9XZgMT8DD7YMDU1rHh2HPNCvD5rA4qiZOqWqukfC0yg6JbpI9GFHDVoxz
   IQ6omOtbYCSbCLKVoKXxZxdEW+Bp7PzW5ehc9fJ1Czs2Jdz9GWoaMPuE4
   raPmgAKdLjj9q7RtvGFe/N8pCFhThbkgVQeTTOLRIyoq5tmRoJNAmUgGo
   qxWg5LwsuPbMStuqvFKt2C+PEvdV4n78TC2BVT25UHUUim+59vor8cjoh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3855337"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3855337"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 11:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7885234"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Feb 2024 11:49:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfmPe-000DFX-2K;
	Thu, 29 Feb 2024 19:49:50 +0000
Date: Fri, 1 Mar 2024 03:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/core 6/6] arch/x86/kernel/process.c:751:13: warning:
 'x86_idle_set' defined but not used
Message-ID: <202403010307.BeOnzgLI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/core
head:   e72cfdcfc0ed8bd149ad2c16891b9998c25f47a0
commit: e72cfdcfc0ed8bd149ad2c16891b9998c25f47a0 [6/6] x86/idle: Select idle routine only once
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240301/202403010307.BeOnzgLI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010307.BeOnzgLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010307.BeOnzgLI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/process.c:751:13: warning: 'x86_idle_set' defined but not used [-Wunused-function]
     751 | static bool x86_idle_set(void)
         |             ^~~~~~~~~~~~


vim +/x86_idle_set +751 arch/x86/kernel/process.c

aaa3896b969bdf Peter Zijlstra  2023-01-12  750  
aaa3896b969bdf Peter Zijlstra  2023-01-12 @751  static bool x86_idle_set(void)
aaa3896b969bdf Peter Zijlstra  2023-01-12  752  {
aaa3896b969bdf Peter Zijlstra  2023-01-12  753  	return !!static_call_query(x86_idle);
aaa3896b969bdf Peter Zijlstra  2023-01-12  754  }
00dba564652288 Thomas Gleixner 2008-06-09  755  

:::::: The code at line 751 was first introduced by commit
:::::: aaa3896b969bdf946e0fd6aa6199da17b5da8d5c x86/idle: Replace 'x86_idle' function pointer with a static_call

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
