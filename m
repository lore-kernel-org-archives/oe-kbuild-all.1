Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41C824B238
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736595646; cv=none; b=S878prtWaVFhCV/mEOpXNoxYRjVZJlirMsq1I6mLGXEj7nCjPA+0/RfhfMebPsL7h6t6Mgl/2rlNl1aIjKW+s6gZKQC9dVqw+62j2TuKBifoDCVAAA7jgH6acDobjciP7lRxt6icUeLwH97ZPJ5OYOLCsixpDdCow9pIOtebU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736595646; c=relaxed/simple;
	bh=JJTzkRHZFZ8Cqm6ULR4pFC4Txy10qU8D8Sfd2CQpO/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rrqQ2ApuPK7aicN8Kz5Qm85s0YVC3oGc85gfZ2c4nEclde+UIJqHxYeSRaFcms5om1qnNucRpeVKUF42jV3VpApp2fj/i3FwUtUMrZNB/Xpck5f8+ZgsiVsdNTzksPlEDum2YbPTeyHmvDqonQUlqS57GKan3hDefqejBGc7AxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJC2pzuk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJC2pzuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736595644; x=1768131644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JJTzkRHZFZ8Cqm6ULR4pFC4Txy10qU8D8Sfd2CQpO/I=;
  b=JJC2pzuke0C5eB8X94OzJxI3dFzUHWR91yUyLPnJ37l7BaSiD38/MHSs
   LYhdkKXsKgqk+6QJd9nw4gABz3LYY0AOrOYjNuO629e+dlCndZ8QlMC2e
   SgNFQsVPVFW6GVwE0ol0R0DUgclO6gD2UWij2bRrAt5RGJi+6hXy4ogXC
   wUaOrorxwSFMk9z99Xyrtn1HFK0nfdf8S821GXwuHLj2jryyjV+G9RmEj
   JoGfQWSQ2N2Kz+jwxDj6Jt/MlSpLRTymXuOiEeSYNLMHPswSS6DARLb1z
   PiRdtM9Z0BJAVhkHD16OGEbLmy2ox61ye3tszZYyN81F3Id/4j6blazwe
   g==;
X-CSE-ConnectionGUID: +o3aGlatRO2wjPUVCI3L7g==
X-CSE-MsgGUID: pmeJCGmaQBiFg0se5Fm2iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="48254744"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="48254744"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 03:40:44 -0800
X-CSE-ConnectionGUID: YInsoy9xRfybAULQcmlFTg==
X-CSE-MsgGUID: B/gepQwZT0azMyDeGzr4wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="134806634"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2025 03:40:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWZr6-000Kap-0n;
	Sat, 11 Jan 2025 11:40:40 +0000
Date: Sat, 11 Jan 2025 19:40:26 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 10/10]
 arch/x86/kernel/cpu/umwait.c:36:9: error: implicit declaration of function
 'wrmsr'; did you mean 'wrmsrl'?
Message-ID: <202501111939.6tCOSu8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   9707e868fba6a5cad792a4f4deb3a8db7e194e5c
commit: 9707e868fba6a5cad792a4f4deb3a8db7e194e5c [10/10] x86/msr: Remove MSR write APIs that take MSR value in two u32 arguments
config: x86_64-buildonly-randconfig-003-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111939.6tCOSu8z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111939.6tCOSu8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111939.6tCOSu8z-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/umwait.c: In function 'umwait_update_control_msr':
>> arch/x86/kernel/cpu/umwait.c:36:9: error: implicit declaration of function 'wrmsr'; did you mean 'wrmsrl'? [-Werror=implicit-function-declaration]
      36 |         wrmsr(MSR_IA32_UMWAIT_CONTROL, READ_ONCE(umwait_control_cached), 0);
         |         ^~~~~
         |         wrmsrl
   cc1: some warnings being treated as errors


vim +36 arch/x86/kernel/cpu/umwait.c

ff4b353f2ef9dc Fenghua Yu 2019-06-19  32  
ff4b353f2ef9dc Fenghua Yu 2019-06-19  33  static void umwait_update_control_msr(void * unused)
ff4b353f2ef9dc Fenghua Yu 2019-06-19  34  {
ff4b353f2ef9dc Fenghua Yu 2019-06-19  35  	lockdep_assert_irqs_disabled();
ff4b353f2ef9dc Fenghua Yu 2019-06-19 @36  	wrmsr(MSR_IA32_UMWAIT_CONTROL, READ_ONCE(umwait_control_cached), 0);
ff4b353f2ef9dc Fenghua Yu 2019-06-19  37  }
ff4b353f2ef9dc Fenghua Yu 2019-06-19  38  

:::::: The code at line 36 was first introduced by commit
:::::: ff4b353f2ef9dc8e396d7cb9572801e34a8c7374 x86/umwait: Add sysfs interface to control umwait C0.2 state

:::::: TO: Fenghua Yu <fenghua.yu@intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
