Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5086D3A6EE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 22:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773787974; cv=none; b=RgmrITmAMBQOdEJPY/gxipOBKmKpt0DWkW/3evu9cg2MMN8OwHwPrm6S30Z8SoY65nURD3EQdtite+0il44QiMVfK77E077kPyM/TYNIfTiUIfjhGNw8xMTgH2vmt26VPjlfoP79TrSzL/nzUp+XCBIO+FS+dI96gpk4QEQ0HgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773787974; c=relaxed/simple;
	bh=IQGbZhbfH+wLjgEzlzjYuS/Kx/msqsd1e8OyRSEfqnk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LRZWYFt0rEf65+pYo99tvBkFPaUsU0/6rGkJdCW7z0aD0pRxv7/0N2gi2lKfTGeS9XkFKoYO9c+3ZG1mfCOlxE0P0IfTUAnEn7oWCcoeCu4MVkolpCyYHfyb2K3mZ5uM9R13GU6AoJAEL9YpUioOlCDBgpAeRHgHMWBHOxhEhGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOafmcVA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOafmcVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773787973; x=1805323973;
  h=date:from:to:cc:subject:message-id;
  bh=IQGbZhbfH+wLjgEzlzjYuS/Kx/msqsd1e8OyRSEfqnk=;
  b=AOafmcVAxz7VFvk1Plmi3MShJviaG7ePRE20YHAoLfKVwIzjsHTFcxv3
   xc/3jD1X6d5MsegxpQ4U/ffshsud3yHd1TQ/W8cJJ0/Ys5OzlwPk89s1D
   xTmMMkfKgxHstx5TOLLhXoV/HJHk+qOFhpXSTQSc/AozYXcpH2NiLMPx6
   r6m25Cg9nUutLBACZhgJPw0brpMqVEL77pik5RHpRwta6g50VebY29nZ/
   smq/sToYMfBM/+Ra6jcTZl+Bvzr+KPpU4RSfz65BJ4rMoubP8+KKY1aQi
   xzw8ZznHkSzt0866hveoLHhW+/CVdALezEPLm7oIr0DAao32AYTlALe4q
   A==;
X-CSE-ConnectionGUID: 5yOVjW1VSSq6PnLZ0g4qcQ==
X-CSE-MsgGUID: 6cOvfU5dTlmiKFuBZAcVwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92218328"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92218328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:52:53 -0700
X-CSE-ConnectionGUID: PD6CYHRETJCkc3tV2+8RqQ==
X-CSE-MsgGUID: ElOTl/8uT36bWo0kP2l/KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="227093505"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2026 15:52:51 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2dHM-0000000028h-2Zm5;
	Tue, 17 Mar 2026 22:52:48 +0000
Date: Wed, 18 Mar 2026 06:52:05 +0800
From: kernel test robot <lkp@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [linuxppc:next-test 12/13] error[E0658]: inline assembly is
 not stable yet on this architecture
Message-ID: <202603180631.GYjY89hw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux next-test
head:   217e0d3cb6437f802ac73e6a614d7a2525f61e36
commit: b964fb2e44b9b4078a822cb63ec6427ddac5f8ac [12/13] rust: Add PowerPC support
config: powerpc-randconfig-r071-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180631.GYjY89hw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180631.GYjY89hw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180631.GYjY89hw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[3]: *** [rust/Makefile:644: rust/helpers/helpers.o] Error 1
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
>> error[E0658]: inline assembly is not stable yet on this architecture
   --> rust/kernel/sync/barrier.rs:19:14
   |
   19 |     unsafe { core::arch::asm!("") };
   |              ^^^^^^^^^^^^^^^^^^^^
   |
   = note: see issue #93335 <https://github.com/rust-lang/rust/issues/93335> for more information
   = help: add `#![feature(asm_experimental_arch)]` to the crate attributes to enable
   = note: this compiler was built on 2025-06-23; consider upgrading it if it is out of date

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
