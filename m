Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE79123EAAD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 09:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761470569; cv=none; b=FSCe/UG3GkevcMvj7NPaoeUsaXpoAan2UZbkOBhZhYv8ImRBFTk5rpWnC761MO6IsJJcZe34mSC5KBSy3pYgZFn6HeISuEyyfDRrY/wckuIXJol21x4gh4y1N1wPsCRDwAnCA0GuPLpKjIf4Tg/a7Plj550pppAvkTfEInh+i4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761470569; c=relaxed/simple;
	bh=7v2rdeKgBHkh/oNGXHTfbeU4ZrmtL1orx4KLVu60ibg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E9PhLXUqQEdiTEa6i5rpFLu74AJHRoBA1Fnrmjxpbwo7ZD6swYf3oK+fHLID1S6c2EKRy0i8hGVsAATjQcz0fSySD+gbXMozFZf0bucYX5sOsyavx/mU+9fRXXoHPZmDG4ZPi4AHB/NajFh3fmeqX52mwOiQQ5IcoQo1hl2Gc/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFuZFy8Q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFuZFy8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761470568; x=1793006568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7v2rdeKgBHkh/oNGXHTfbeU4ZrmtL1orx4KLVu60ibg=;
  b=MFuZFy8QEuF4azVWCEXhkNoofk3lMUbkPGXkC/6f14rDamOHQfRY/ol5
   I0mIQR3g39tGi4q5uTKufxnIeqKpuciztIvWwN1IPhUNh0gZFYC15KzeV
   F1LJKOxuexwOU2h3urddHPQzk+pkaNd43jDeb9T0xHNMLhT5GPWFbo2uS
   mT6hFJTCymcrMkHwx5sCAMZs2dOZvs1lOekCErPSq3reQ221sGP7qOH+u
   JBF1FyBGKy3P7S7xqCxN7M/2NdQbO3VylvGoO/nuM0XMZsFk04hla1ZdI
   1sfcimLztYIErw4/QSX0AH9Qx1oIB+KJQzWMiyfW120WGFMqCJSoJikJ/
   A==;
X-CSE-ConnectionGUID: eNn2ZgBrRzKYGiQlcnOaTw==
X-CSE-MsgGUID: 9ah08wLhTMiAdiMm6MkofA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51155999"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="51155999"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 02:22:46 -0700
X-CSE-ConnectionGUID: nVsXNU2HT8+EQfRX9P8Isw==
X-CSE-MsgGUID: dFu8zrxqRM6H9wl2RxCWow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="184013582"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Oct 2025 02:22:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCwxW-000G1L-1G;
	Sun, 26 Oct 2025 09:22:42 +0000
Date: Sun, 26 Oct 2025 17:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [tglx-devel:rseq/slice 41/75]
 arch/arm64/kernel/entry-common.c:103:9: error: implicit declaration of
 function 'exit_to_user_mode_prepare'; did you mean
 'arch_exit_to_user_mode_prepare'?
Message-ID: <202510261742.djCKBOEg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   44778ec169878406f8c7822820c9dce29df889ba
commit: 3eb85fe2798ad0f79547b94137bbeba7e2de0980 [41/75] entry: Split up exit_to_user_mode_prepare()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251026/202510261742.djCKBOEg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261742.djCKBOEg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261742.djCKBOEg-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/entry-common.c: In function 'arm64_exit_to_user_mode':
>> arch/arm64/kernel/entry-common.c:103:9: error: implicit declaration of function 'exit_to_user_mode_prepare'; did you mean 'arch_exit_to_user_mode_prepare'? [-Wimplicit-function-declaration]
     103 |         exit_to_user_mode_prepare(regs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         arch_exit_to_user_mode_prepare


vim +103 arch/arm64/kernel/entry-common.c

bc29b71f53b13c Mark Rutland 2021-08-02   93  
bc29b71f53b13c Mark Rutland 2021-08-02   94  /*
bc29b71f53b13c Mark Rutland 2021-08-02   95   * Handle IRQ/context state management when exiting to user mode.
bc29b71f53b13c Mark Rutland 2021-08-02   96   * After this function returns it is not safe to call regular kernel code,
59598b42eb52c7 Mukesh Ojha  2022-10-29   97   * instrumentable code, or any code which may trigger an exception.
bc29b71f53b13c Mark Rutland 2021-08-02   98   */
997d79eb938e98 Mark Rutland 2024-02-06   99  
b3cf07851b6c4a Jinjie Ruan  2025-08-15  100  static __always_inline void arm64_exit_to_user_mode(struct pt_regs *regs)
4d1c2ee2709fd6 Mark Rutland 2021-08-02  101  {
97d935faacde47 Mark Rutland 2024-02-06  102  	local_irq_disable();
ab1e29acdb33c9 Eric Chan    2023-05-31 @103  	exit_to_user_mode_prepare(regs);
b3cf07851b6c4a Jinjie Ruan  2025-08-15  104  	local_daif_mask();
e130338eed5de0 Mark Rutland 2021-08-02  105  	mte_check_tfsr_exit();
b3cf07851b6c4a Jinjie Ruan  2025-08-15  106  	exit_to_user_mode();
e130338eed5de0 Mark Rutland 2021-08-02  107  }
e130338eed5de0 Mark Rutland 2021-08-02  108  

:::::: The code at line 103 was first introduced by commit
:::::: ab1e29acdb33c971e1af8ed8ec427bd1deff5f32 arm64: lockdep: enable checks for held locks when returning to userspace

:::::: TO: Eric Chan <ericchancf@google.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
