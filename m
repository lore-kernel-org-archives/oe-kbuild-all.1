Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F85EEBB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802229; cv=none; b=qrAMHcYcX/TuM+g1mo7bu0Tt5FiH8XNITdsiaEKkf1xRCjMJ/Jx2bML+/XCOBUcPLYBn8ZQojihqyxxVan1+j0QrOxs8ZD+Klq2jwcKXZnYsy7qK1CsowYeVJbEFSNu9iirsZUDhRZu4HJXdNIj1x+6oue8Oaw7aYDDukXMhGpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802229; c=relaxed/simple;
	bh=8GUDCgWLMwMVP5NUEIn1oD8dYKpXL9TeVN6dXGu3pyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jIgwX8R7G7+ULn2AVMYs7+zPY/kELR0hCco1gnmT3gF0a6XOp/o+7jm6pejMyjzbJqpj7xpRXXdj+qrCcgT9PLeoFJEyx82Kx8dPcwkFmkubi7tMmOvnAnlQBBLFwClINLN2sJKVEwILBON9dFw8SM67Ce9cIQaFrmS21N0GEwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHjmoQD7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHjmoQD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739802227; x=1771338227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8GUDCgWLMwMVP5NUEIn1oD8dYKpXL9TeVN6dXGu3pyw=;
  b=nHjmoQD7Kbyr91d9egs/Cd7M0O6G0rFOw+wuCPG1vboSg+854VArwIne
   gmBTbkO1thLRTm0kQfn3OnjAzjFMpQ3XwIDYQ4j7R9yQ57gEXEBRH5SRq
   w4TCZR0ayUeHYPU9GpqIRWKl8v/+4Q1OFG0jITDndf9iCY1xumPerqF38
   Pv1RtGCTMN/U+q35rOs7R2+T3yepbVJ3RryxRt0knnZLbbBEca3UjfGwD
   ZPjuDTEFZEbBDXrk1UEmvPhqBMD0OBuG5lw77qUqosfb0o+eKrUUo4uqg
   Lvt1b6YEwsatkBHx6aaxDTffu7ZCPRhI6BT46vZnzzHsYJh5scNlR1THh
   g==;
X-CSE-ConnectionGUID: QO55l1GOSve2cnw0xrc2Rg==
X-CSE-MsgGUID: mkO7VfrhSOu1XWPW1/L7Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40609779"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="40609779"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 06:23:47 -0800
X-CSE-ConnectionGUID: DAz1gu0DQgyofEL5Nz7r0Q==
X-CSE-MsgGUID: nUMCVhjuSki2Ik0TcwVt0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119347195"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Feb 2025 06:23:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk22B-001DDb-2C;
	Mon, 17 Feb 2025 14:23:43 +0000
Date: Mon, 17 Feb 2025 22:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:res-lock-base 18/26]
 include/asm-generic/rqspinlock.h:33:12: error: conflicting types for
 'resilient_tas_spin_lock'
Message-ID: <202502172242.0aQfPntZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux res-lock-base
head:   f998e0817b8a89691123f4a4a6e1277c22523695
commit: 2a7700316f24b476a25243d28d4e19c517814836 [18/26] rqspinlock: Add entry to Makefile, MAINTAINERS
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250217/202502172242.0aQfPntZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502172242.0aQfPntZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502172242.0aQfPntZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/locking/rqspinlock.c:28:
   In file included from arch/x86/include/asm/rqspinlock.h:27:
>> include/asm-generic/rqspinlock.h:33:12: error: conflicting types for 'resilient_tas_spin_lock'
      33 | extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
         |            ^
   arch/x86/include/asm/rqspinlock.h:17:12: note: previous declaration is here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |            ^
>> kernel/locking/rqspinlock.c:293:16: error: conflicting types for 'resilient_tas_spin_lock'
     293 | int __lockfunc resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout)
         |                ^
   arch/x86/include/asm/rqspinlock.h:17:12: note: previous declaration is here
      17 | extern int resilient_tas_spin_lock(struct qspinlock *lock, u64 timeout);
         |            ^
   2 errors generated.


vim +/resilient_tas_spin_lock +33 include/asm-generic/rqspinlock.h

b162e534420623 Kumar Kartikeya Dwivedi 2024-08-27  32  
5effdf8488423d Kumar Kartikeya Dwivedi 2025-02-04 @33  extern int resilient_tas_spin_lock(rqspinlock_t *lock, u64 timeout);
5effdf8488423d Kumar Kartikeya Dwivedi 2025-02-04  34  #ifdef CONFIG_QUEUED_SPINLOCKS
d6a1899b88a315 Kumar Kartikeya Dwivedi 2024-11-18  35  extern int resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val, u64 timeout);
5effdf8488423d Kumar Kartikeya Dwivedi 2025-02-04  36  #endif
d6a1899b88a315 Kumar Kartikeya Dwivedi 2024-11-18  37  

:::::: The code at line 33 was first introduced by commit
:::::: 5effdf8488423d8a573cffea2958bb0ba3e177d0 rqspinlock: Add a test-and-set fallback

:::::: TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>
:::::: CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
