Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0A65234
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Mar 2025 06:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741586610; cv=none; b=UlGXbngCQXBgEeJ1UjLCTbVc91cMgDf0KKA0MYfnqrRprxhzFKkgnu/vdb2BmY/vrISRNyw1s4HrFtd1EupzFEx6r7w5nUbL0YnbA95vKua7oCBKGZ9ge+VDGGpQPGMdDeSY/QkgLGTMVCOJevl7XljCqq66+HuuD3w/tgDmIJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741586610; c=relaxed/simple;
	bh=2FSQwYVsUtX4qUcMMY8H7CMh43QONOiFaveiDkB/2ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eD1XK8k5BdRnT3YvCsEZYynJ1c7cKa9t3WG7Du9WA8Vxv080aPQ5D5TxxN4eFy61X1iKbdPgVA03oq+nT/ZpjmkmgDeT+r7JW8LEP1dr/RonDlID7SuO6Tho/NYRU4/bHEeCMXI2SYIB3TNlqut6m/JjZhzPr/0b8IVwyExmuKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYSM5FDk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYSM5FDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741586608; x=1773122608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2FSQwYVsUtX4qUcMMY8H7CMh43QONOiFaveiDkB/2ZY=;
  b=cYSM5FDkBfX13kOL4Ivaa8pOvmHJvUFEKOWCRYa8Hmb7sOi9EHNBcRhd
   Hs0jdiXFUNOQedXFup/UMwyBPGH3VRu6dShQ7lGVldBqlSeAmJTkUqN6A
   zQBr3G0n1fPJtRWryJ6LKFU/4z3ZJOqlkLx86Ai/vCEnfReD+t5vdVOvK
   raeJIhSP7tahZCym7ZWPUdVPOhJ54WO7sY6e0aGqLRUF6r0VGV49zRcgl
   3Yo8uhuADuyD/6InZ2U+pTIP6YKaR2iEx2Py4ll59pnn+XalGzwSglLbz
   xSAO4rX8jYNXDIIllsEeSXJV1Oid/114Vac+je+enSGV3Y6ReA6Y5Bexb
   A==;
X-CSE-ConnectionGUID: e8BO89MMRzm3ZXQqlw9ZmA==
X-CSE-MsgGUID: NV526DVqRNajJDGczVwXQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46213279"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="46213279"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 23:03:28 -0700
X-CSE-ConnectionGUID: k1C1sJnETUO4HFm9kZ2NYQ==
X-CSE-MsgGUID: muU2G7/nRU6zk2JTHpYS4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="157092599"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Mar 2025 23:02:43 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trWDo-0003rI-15;
	Mon, 10 Mar 2025 06:02:40 +0000
Date: Mon, 10 Mar 2025 14:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_ci 661/723]
 .github/actions/veristat_baseline_compare/action.yml: warning: ignored by
 one of the .gitignore files
Message-ID: <202503101346.P1SvWcIf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_ci
head:   f5d39e8042785cd4a94a1a844a47fa8eea8a4278
commit: 88feb0d09b8ff9d0756a0b2a92f30c6f4a8cf64d [661/723] adding ci files
config: arc-randconfig-001-20250310 (https://download.01.org/0day-ci/archive/20250310/202503101346.P1SvWcIf-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503101346.P1SvWcIf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503101346.P1SvWcIf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
>> .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/download-gcc-bpf.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/matrix.py: warning: ignored by one of the .gitignore files
>> .github/scripts/tests/test_veristat_compare.py: warning: ignored by one of the .gitignore files
>> .github/scripts/tmpfsify-workspace.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/veristat_compare.py: warning: ignored by one of the .gitignore files
   .github/workflows/gcc-bpf.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/lint.yml: warning: ignored by one of the .gitignore files
   .github/workflows/test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-kernel.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-meta.yml: warning: ignored by one of the .gitignore files
>> ci/diffs/.keep: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-Revert-bpf-Avoid-unnecessary-audit-log-for-CPU-secur.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-arch-Kconfig-Move-SPECULATION_MITIGATIONS-to-arch-Kc.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-bpf-Fix-a-few-selftest-failures-due-to-llvm18-change.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-bpf-Fix-a-verifier-bug-due-to-incorrect-branch-offse.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-bpf-next-selftests-bpf-Fix-a-btf_dump-selftest-failure.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-net-bpf-Use-sockopt_lock_sock-in-ip_sock_set_tos.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Filter-out-_GNU_SOURCE-when-compiling-.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Fix-bpf_cookie-and-find_vma-in-nested-.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Fix-pyperf180-compilation-failure-with.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-disable-detection-of-llvm-when-buildin.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-fix-inet_csk_accept-prototype-in-test_.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-work-around-latest-Clang-smartness.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-xskxceiver-ksft_print_msg-fix-format-t.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-tools-resolve_btfids-fix-cross-compilation-to-non-host-endianness.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-tracing-kprobes-Fix-symbol-counting-logic-by-looking.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0002-tools-resolve_btfids-fix-cross-compilation-to-non-host-endianness.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0199-iov_iter-fix-advancing-slot-in-iter_folioq_get_pages.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0299-selftests-bpf-Fix-uprobe-consumer-test.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0399-selftests-sched_ext-fix-build-after-renames-in-sched.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0499-samples-bpf-fix-samples-compilation.patch: warning: ignored by one of the .gitignore files
   ci/diffs/2000-s390-fgraph-Fix-to-remove-ftrace_test_recursion_tryl.patch: warning: ignored by one of the .gitignore files
   ci/diffs/2001-s390-tracing-Define-ftrace_get_symaddr-for-s390.patch: warning: ignored by one of the .gitignore files
   ci/diffs/2001-selftests-bpf-add-fno-strict-aliasing-to-BPF_CFLAGS.patch: warning: ignored by one of the .gitignore files
   ci/diffs/2002-selftests-bpf-add-std-gnu11-to-BPF_CFLAGS-and-CFLAGS.patch: warning: ignored by one of the .gitignore files
   ci/diffs/8888-netfs-Fix-setting-NETFS_RREQ_ALL_QUEUED-to-be-after-.patch: warning: ignored by one of the .gitignore files
   ci/diffs/9998-sched_ext-Fix-invalid-irq-restore-in-scx_ops_bypass.patch: warning: ignored by one of the .gitignore files
   ci/diffs/9999-scx-Fix-maximal-BPF-selftest-prog.patch: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
