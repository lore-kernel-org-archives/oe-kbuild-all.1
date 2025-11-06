Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BC43101C8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 11:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429406; cv=none; b=OFqqsCYtIm1R9UfEfqBlFua/HmV/Re4/wvy+/OIRK6m+Yr9A18Sgt6TJU93FgnOMNZnX+Lst+mOsV/1dSArD4Lw73tyFJg/ZE5R2kamBqfLUqA89WTuDqyXYh7ma6dWoBCdEKwEaBQQnXVm7/iQDSCs3HwcBG9dOL+zmWCYQcFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429406; c=relaxed/simple;
	bh=ZSiG0he2ZrMGnL856JfhFscvJ7wpyVTN41yR836CxFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GKKSJ3oAoU+EJRDBhgneySJiRkM03vaiBuI64fNzVCF5WZbc3ugd75PYraYNlC5XVgx+XXkBZERGt3at03r+rbXPe8/TNPcWdEGR/LwSrywd5INIKLQUNbI5cohlC8+t8blX3L2iQPwPd6MOh4/Ir0pxfGvAF13d85YiiuhfL0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LP7MtQMd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LP7MtQMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762429404; x=1793965404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZSiG0he2ZrMGnL856JfhFscvJ7wpyVTN41yR836CxFE=;
  b=LP7MtQMd/OnEfSCC6blqv2iitBb6YpyG0t0BsqBurAgnR7mo8b2q5WgV
   CwFN6zeNk1/+tkFgH3TybXKrxl8/fip9NAcYNx3/Q8f/b/vf/JrZWDOaA
   0rQ05KYB8kVACIyK0dkI35DSfRCESfwVzXqXNOBtg8ZTHVWG9qKXGtzUF
   VPZrDgplodo5gCgHuwKmZevkAy66FRXPWOK3OU0yNGnWFRk4aj1uOFWnB
   c52Prb3yGUx2H7ETqUG1O+/w+aGtIqZrEQY9hdayMX07a+ZKYTzPizjx+
   bXPH1IIkVTbN3yAAlDzKHgM1uftRUA1oIYEYSyvNHBMKBfz4JDr1P0W2b
   g==;
X-CSE-ConnectionGUID: CPbf0l1IQAaulmR28ybHZw==
X-CSE-MsgGUID: gFBbw7PsQ9eu3WF4r8pIyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64477349"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="64477349"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:43:23 -0800
X-CSE-ConnectionGUID: XZ0QQY8hQ+uSCrd4fRDrOw==
X-CSE-MsgGUID: g8qgbV2bSlaq8RKg4T9www==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="192906195"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2025 03:43:22 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGyOe-000Ts4-06;
	Thu, 06 Nov 2025 11:43:20 +0000
Date: Thu, 6 Nov 2025 19:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:text-startup-3 1/1] s390-linux-ld: warning: orphan section
 `.text.__s390_indirect_jump_r4[__s390_indirect_jump_r4]' from `init/main.o'
 being placed in section `.text.__s390_indirect_jump_r4'
Message-ID: <202511061956.wPgDIpm8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git text-startup-3
head:   4cd994fa5f39884be972e9486dde1c193e96b3f2
commit: 4cd994fa5f39884be972e9486dde1c193e96b3f2 [1/1] todo
config: s390-randconfig-001-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061956.wPgDIpm8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061956.wPgDIpm8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061956.wPgDIpm8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r1[__s390_indirect_jump_r1]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r1'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r4[__s390_indirect_jump_r4]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r4'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r7[__s390_indirect_jump_r7]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r7'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r14[__s390_indirect_jump_r14]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r14'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r8[__s390_indirect_jump_r8]' from `init/initramfs.o' being placed in section `.text.__s390_indirect_jump_r8'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r9[__s390_indirect_jump_r9]' from `arch/s390/kernel/process.o' being placed in section `.text.__s390_indirect_jump_r9'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r10[__s390_indirect_jump_r10]' from `arch/s390/kernel/vtime.o' being placed in section `.text.__s390_indirect_jump_r10'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r5[__s390_indirect_jump_r5]' from `arch/s390/kernel/signal.o' being placed in section `.text.__s390_indirect_jump_r5'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r2[__s390_indirect_jump_r2]' from `arch/s390/kvm/kvm-s390.o' being placed in section `.text.__s390_indirect_jump_r2'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r6[__s390_indirect_jump_r6]' from `arch/s390/net/bpf_jit_comp.o' being placed in section `.text.__s390_indirect_jump_r6'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r13[__s390_indirect_jump_r13]' from `kernel/fork.o' being placed in section `.text.__s390_indirect_jump_r13'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r11[__s390_indirect_jump_r11]' from `kernel/sched/core.o' being placed in section `.text.__s390_indirect_jump_r11'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r3[__s390_indirect_jump_r3]' from `fs/nsfs.o' being placed in section `.text.__s390_indirect_jump_r3'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r1[__s390_indirect_jump_r1]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r1'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r4[__s390_indirect_jump_r4]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r4'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r7[__s390_indirect_jump_r7]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r7'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r14[__s390_indirect_jump_r14]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r14'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r8[__s390_indirect_jump_r8]' from `init/initramfs.o' being placed in section `.text.__s390_indirect_jump_r8'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r9[__s390_indirect_jump_r9]' from `arch/s390/kernel/process.o' being placed in section `.text.__s390_indirect_jump_r9'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r10[__s390_indirect_jump_r10]' from `arch/s390/kernel/vtime.o' being placed in section `.text.__s390_indirect_jump_r10'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r5[__s390_indirect_jump_r5]' from `arch/s390/kernel/signal.o' being placed in section `.text.__s390_indirect_jump_r5'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r2[__s390_indirect_jump_r2]' from `arch/s390/kvm/kvm-s390.o' being placed in section `.text.__s390_indirect_jump_r2'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r6[__s390_indirect_jump_r6]' from `arch/s390/net/bpf_jit_comp.o' being placed in section `.text.__s390_indirect_jump_r6'
>> s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r13[__s390_indirect_jump_r13]' from `kernel/fork.o' being placed in section `.text.__s390_indirect_jump_r13'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r11[__s390_indirect_jump_r11]' from `kernel/sched/core.o' being placed in section `.text.__s390_indirect_jump_r11'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r3[__s390_indirect_jump_r3]' from `fs/nsfs.o' being placed in section `.text.__s390_indirect_jump_r3'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r1[__s390_indirect_jump_r1]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r1'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r4[__s390_indirect_jump_r4]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r4'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r7[__s390_indirect_jump_r7]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r7'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r14[__s390_indirect_jump_r14]' from `init/main.o' being placed in section `.text.__s390_indirect_jump_r14'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r8[__s390_indirect_jump_r8]' from `init/initramfs.o' being placed in section `.text.__s390_indirect_jump_r8'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r9[__s390_indirect_jump_r9]' from `arch/s390/kernel/process.o' being placed in section `.text.__s390_indirect_jump_r9'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r10[__s390_indirect_jump_r10]' from `arch/s390/kernel/vtime.o' being placed in section `.text.__s390_indirect_jump_r10'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r5[__s390_indirect_jump_r5]' from `arch/s390/kernel/signal.o' being placed in section `.text.__s390_indirect_jump_r5'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r2[__s390_indirect_jump_r2]' from `arch/s390/kvm/kvm-s390.o' being placed in section `.text.__s390_indirect_jump_r2'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r6[__s390_indirect_jump_r6]' from `arch/s390/net/bpf_jit_comp.o' being placed in section `.text.__s390_indirect_jump_r6'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r13[__s390_indirect_jump_r13]' from `kernel/fork.o' being placed in section `.text.__s390_indirect_jump_r13'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r11[__s390_indirect_jump_r11]' from `kernel/sched/core.o' being placed in section `.text.__s390_indirect_jump_r11'
   s390-linux-ld: warning: orphan section `.text.__s390_indirect_jump_r3[__s390_indirect_jump_r3]' from `fs/nsfs.o' being placed in section `.text.__s390_indirect_jump_r3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
