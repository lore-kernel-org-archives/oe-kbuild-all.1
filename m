Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8BD21639A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 17:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688734; cv=none; b=uYVIrMcJQGwTHHLsCpGwVsF1f/ArZ8uQgcasG2gwlUuldyLODS5tpabsrWFqvkWugAUfDpkFILQxqrfjXwfoFKC9cGNAAIfnrgG42rPOW0Q8uGB2dWlRBghRV+LAqv3+RNsq6N/M3cklIW1hqLnIq1fQsgCCgyStp3JV0GE3ZAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688734; c=relaxed/simple;
	bh=/Fc9eA5mij8IgT0JV1Bv48FxglEx9wGM1RwEKM4+8TM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=blygKZgWiH+Dedo1jE6fvPTAgoCFO/nw2BsH3Ar1qlo2EScMT+0BNKksrV16aldLmxOR3Tl8pvtVcp9XmCoiYvoxOhJHq2uGpCds8yZwbFVPcQKEOnXpeG8H4CXv4Ia63Bn83wfUHzmoGxg52qmxD//bMZEhFXJJggVava7B5uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfNJ2TZE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfNJ2TZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738688732; x=1770224732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Fc9eA5mij8IgT0JV1Bv48FxglEx9wGM1RwEKM4+8TM=;
  b=QfNJ2TZEdxK0HDyp9037CbBVyuKAxemH4fe4Ej7gahct6LILWb6HxiZ0
   07fiVRqq2H5vFmlZQoo8csdCxDCofJNtqvQYC+6bxFMJmA+exeIMrruxP
   g33a9bW6VHM5qld/6GknGZEanQrHvF3l74FFINJERTtyid3BFwo0fkPCU
   OftCkLTBo9/tU6LiwMzwxqsAu8bUy97r9MY80Cu/qbCQVZ5D8/0g7yWqk
   Awo7+lc3s74peFCZdsCMyj4UEXNBndpMwSlrwvD1VwWe4Zj24PCd3QCco
   qzFM/2q+WMlfx241XC8hXCqs3ADTsexd88rUOjMRkDY6IWvHhCDW3Mt3/
   w==;
X-CSE-ConnectionGUID: AKoUOQFCQRa6ZxLKL2xwyA==
X-CSE-MsgGUID: ywJEEyriTOePG6Vv1s9fxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64579469"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="64579469"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:05:31 -0800
X-CSE-ConnectionGUID: w4E/NqUzTQu+1PZRVtYKBQ==
X-CSE-MsgGUID: LHvgBwYoT7ufurTquZ8Iuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="141517344"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 09:05:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfMMZ-000skH-0p;
	Tue, 04 Feb 2025 17:05:27 +0000
Date: Wed, 5 Feb 2025 01:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [peterz-queue:sched/urgent 2/2] Makefile:47: *** Cannot find a
 vmlinux for VMLINUX_BTF at any of "  ../../../../vmlinux
 /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
Message-ID: <202502050102.7iexi7XO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/urgent
head:   efd5bd3144b76ff6eab5443d16df9797d9d7f4cd
commit: efd5bd3144b76ff6eab5443d16df9797d9d7f4cd [2/2] sched: Don't define sched_clock_irqtime as static key
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050102.7iexi7XO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050102.7iexi7XO-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: *** No targets specified and no makefile found.  Stop.
   make[1]: *** [../lib.mk:222: tools/testing/selftests/pidfd/pidfd_fdinfo_test] Error 1
   make[1]: *** [../lib.mk:221: tools/testing/selftests/pidfd/pidfd_setns_test] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** [../lib.mk:222: tools/testing/selftests/pid_namespace/pid_max] Error 1
   make[1]: Target 'all' not remade because of errors.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
>> Makefile:47: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.


vim +47 Makefile

3812b8c5c5d5272 Masahiro Yamada 2019-02-22  46  
3812b8c5c5d5272 Masahiro Yamada 2019-02-22 @47  # Do not use make's built-in rules and variables
3812b8c5c5d5272 Masahiro Yamada 2019-02-22  48  # (this increases performance and avoids hard-to-debug behaviour)
3812b8c5c5d5272 Masahiro Yamada 2019-02-22  49  MAKEFLAGS += -rR
3812b8c5c5d5272 Masahiro Yamada 2019-02-22  50  

:::::: The code at line 47 was first introduced by commit
:::::: 3812b8c5c5d527239ac015f1f2c7654da7fcfbba kbuild: make -r/-R effective in top Makefile for old Make versions

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Masahiro Yamada <yamada.masahiro@socionext.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
