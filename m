Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D324B4D8CF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 02:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728788376; cv=none; b=nbOEmVoKQbZ5MHRycMt2aCysR/FA4yjJ4EIfCB9m5L3wOFqiEQkSL625thCPERaSP2133R2ZyAmRadgw5QSnkJbWeWIucrQMqEFLW9E/UD0yNU3vJ3NqunLOP2pzJUG8oQ/ikoIhY15runhvUTLK0i8wu1SN0/mYIugGA2K9OH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728788376; c=relaxed/simple;
	bh=+0QVnmhswolWcOsFIGh3TMz7OYZx8qiJweY+tqkeUG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8J7C1kSzka2RAOvPfb911Qx6/zby40Heq/W0Y2xh//aFVyfHzeDwt2Q6Yq9knXZTgkkq70L42ZFDnOZ5GpnRyvlsM0dP1bPdRE9EiUDhpgTZLa5VzR+Qcx/k4eMD9m1LzBZrxvDHjz3j2GoiyGU9LlJ1yFcYISuHjhVx18v8vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpuW7U9h; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpuW7U9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728788374; x=1760324374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+0QVnmhswolWcOsFIGh3TMz7OYZx8qiJweY+tqkeUG0=;
  b=JpuW7U9hjbBU0pYwXB0rx5Yuh/obevqDmiA9DUSrd3RPLj7UZgUwPjmQ
   4UbTclX65x4h1b2KrChqO76HANNYuuv6kMw+jvSoEY2Jj/1pz6weJib2P
   X86zP7BiasREutF/ifa/BEiRXnnS9TET4motQf0Vp3MgpkfnZyI98F+ZG
   BkWeWU/M4gBmtp/B1/SgDuoOQ4Lk9afaEjrJb0qSon9o/gY4+PN0v02GQ
   g/cP0zoMNlzLZWCQy3ReQT617CZN+9VTQ1EvmAQGpK3HI3rpqOJApb3Wv
   QCNtJmznwbZd7LVNJEeDYGIALaAzKh3xL/CZzXaSoKGpBliWVlm6Mx5Jw
   Q==;
X-CSE-ConnectionGUID: rwFM79w8Q+S370nE8Bd7ig==
X-CSE-MsgGUID: R/Aptyg2SnC2VJUhb70gCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28285994"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28285994"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 19:59:34 -0700
X-CSE-ConnectionGUID: vI3gpDjLSOaqcgJRl85WyQ==
X-CSE-MsgGUID: 5cF+El5CR6u/A5UDnigAcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77175200"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2024 19:59:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szopO-000E1D-05;
	Sun, 13 Oct 2024 02:59:30 +0000
Date: Sun, 13 Oct 2024 10:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_session_24 37/63]
 .github/actions/veristat_baseline_compare/action.yml: warning: ignored by
 one of the .gitignore files
Message-ID: <202410131000.nESzo6bD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_session_24
head:   dd7329015b4ba19e87403dfbe182346c318414e5
commit: 455c0170b333fcd6826dcc0dfd4dacc047c55faa [37/63] adding ci files
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241013/202410131000.nESzo6bD-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131000.nESzo6bD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131000.nESzo6bD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
>> .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/matrix.py: warning: ignored by one of the .gitignore files
>> .github/scripts/tar-artifact.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/tests/test_veristat_compare.py: warning: ignored by one of the .gitignore files
>> .github/scripts/veristat_compare.py: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-veristat.yml: warning: ignored by one of the .gitignore files
   .github/workflows/lint.yml: warning: ignored by one of the .gitignore files
   .github/workflows/test.yml: warning: ignored by one of the .gitignore files
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
>> ci/diffs/0001-selftests-bpf-xskxceiver-ksft_print_msg-fix-format-t.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-tools-resolve_btfids-fix-cross-compilation-to-non-host-endianness.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-tracing-kprobes-Fix-symbol-counting-logic-by-looking.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0002-tools-resolve_btfids-fix-cross-compilation-to-non-host-endianness.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0199-iov_iter-fix-advancing-slot-in-iter_folioq_get_pages.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0299-selftests-bpf-Fix-uprobe-consumer-test.patch: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
