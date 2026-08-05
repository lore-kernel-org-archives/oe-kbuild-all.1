Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB8F18E02A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 04:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785905429; cv=none; b=Itqg6+pasoNE8bOUbwJ44p8yV6cF2KtoAvfA0ukGvl6/somTPRoJ5MLWOPfIDTHd+VaP37htpd2O0hyG+35Js0uM98rjyuJ+jP+MnViGGHMQeDuThDqBhveSV58hXOKZydq7ZFacUd1bdNpRwJ8YXEM/tnjrHobhiFSmVLXx0RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785905429; c=relaxed/simple;
	bh=rZck9kmHVO71Pcb1J3vUlkWwWO94prW6x87K1ghjOI0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sqrBulCk3ZHualt1RID8w1ea+gkM2gQAOCsYlfDfUnkKRgx8DXCWdUvTpWCA9jrYLWtMhZhDhdDrdmmHSAsonIPu04ONTrkYhivOl7bCiZdcFwtj1I3n+eb60D+7LX7iF74O986SHYOyLB37dUxs/0aU3sZ0lKBQIRwl53s8RvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmuSjYU2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmuSjYU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785905427; x=1817441427;
  h=date:from:to:cc:subject:message-id;
  bh=rZck9kmHVO71Pcb1J3vUlkWwWO94prW6x87K1ghjOI0=;
  b=GmuSjYU287g9ac1p6eG1TMfgOpm0Jj8EvEGacyNXqyD9Rg19UlRxsKsk
   eh9OLMSSlHKYZYxJbaUT22LWUZZdBwiBXRay5KMTy3+wg6tYPOeHfsgjf
   xZThC8UY6/g4l2kIytqVprmQlkqCSjGYN0J/MJ4GAzqLg3KCeHqyQbyUm
   RhdjJ2RoqQeGiUw2ueDEPA4GYzhCPCJtQVIXaJZFbbhRzXHsyejDYhHtA
   +fgXnP7aqhoEq5IFfdEUOS5F4ia2f6yb5ikVUdmRJ2JHonE2oggPzeNAB
   /gH2ZC3FK2KpbaEZla/5Ma7/I0JnvmlRAe5O4DIxOC5BAJZv4mUo4O5Y4
   Q==;
X-CSE-ConnectionGUID: oRfjVnmBR1msP5TrhP7uDQ==
X-CSE-MsgGUID: O+zTwnbvRQ2gOA0wYUj6Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97834479"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="97834479"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 21:50:26 -0700
X-CSE-ConnectionGUID: CwddRUknTyGPdjYtAGEGRA==
X-CSE-MsgGUID: 3LHXAIIdSQKoPnCeQJOVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="261131456"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Aug 2026 21:50:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrTaA-00000000BYR-35Zk;
	Wed, 05 Aug 2026 04:50:22 +0000
Date: Wed, 05 Aug 2026 12:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 12660/12727] error: no rules expected
 `ARCH_WARN_ASM`
Message-ID: <202608051229.oIQwkwhL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f6da28aab51b16762ed82e8fdeaa5042da45b08
commit: f97dcaf7868dbda5ccff6db2e582b1632e823424 [12660/12727] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux
config: powerpc-randconfig-r062-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051229.oIQwkwhL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051229.oIQwkwhL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051229.oIQwkwhL-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
   clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
>> error: no rules expected `ARCH_WARN_ASM`
   --> rust/kernel/generated_arch_warn_asm.rs:1:28
   |
   1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
   |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
   |
   ::: rust/kernel/lib.rs:275:1
   |
   275 | macro_rules! concat_literals {
   | ---------------------------- when calling this macro
   |
   = note: while trying to match sequence start
--
>> error: no rules expected `ARCH_WARN_REACHABLE`
   --> rust/kernel/generated_arch_reachable_asm.rs:1:28
   |
   1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
   |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
   |
   ::: rust/kernel/lib.rs:275:1
   |
   275 | macro_rules! concat_literals {
   | ---------------------------- when calling this macro
   |
   = note: while trying to match sequence start

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
