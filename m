Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2A5FDDC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721601; cv=none; b=m0I2B33RUmVtUWTcaDbaZkOm+T9XxexQe/9A6s0gnbMJnBsj18SeEjI5gDT9owQ9bPEa4Vt5PmJRrnvI5QRsF+ZvbZ19b1RJjosuYt9OZktKx58U+psnCY+Y/ArIfoUBwSBT2Q1llxVqOAeMYStwCPV/jtzCk71yQoeEZ6RufOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721601; c=relaxed/simple;
	bh=nn3mGQMyBFEA5/ZzyO2gt4fxv34ajLwB5hBoP5CG4IU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C069t6RoSWv/ULWzdyopeYvQksfCsA7zLpil9vhZ2hH9Yy1OrRnm5yU3JJ9bm7aW7I+GFQkWRmMSASMYAq6zSsZG8nyMiDexpTzTkXEY0sh9+d9wDXJ8GFuKK7fld/Mo0OXbjFIzHjjokI5u7S7wtjMg2oTODZlkFNEgNuRlvZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5SB1ytJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5SB1ytJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709721599; x=1741257599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nn3mGQMyBFEA5/ZzyO2gt4fxv34ajLwB5hBoP5CG4IU=;
  b=n5SB1ytJBamYpqtr4H/cQCub85NuZOGurrNl/oUpNckpffSkObMxHcUw
   tx8B2tKdoaHeF/wS5sXNT9ewahWoPjEY8mxmM99iPmgJapmIR7IisGmkw
   F4q1pbvLJvbMHPSu/rNnol8AvZkeUXtuYYZojQhdfnFo/ebB7zDLaaLPj
   NPSw5lFhHn7BCAYtrhx5c+tXd8WoAcbzkgjLNAhfx48XfSoZzKxiz5K4l
   ZQkZP6HJMTBoDSBIR/NEUoWxsoj/c6OU28onmJHCmrMwrkskaYAmt4jWl
   eWWsYn7AlimY4W3ksFfVH7zLpzPeaMPWaRPNRaktkllG4b7vEnLu3VAi+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4189780"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4189780"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 02:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="14373522"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2024 02:39:20 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhog9-000493-0g;
	Wed, 06 Mar 2024 10:39:17 +0000
Date: Wed, 6 Mar 2024 18:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tycho:bpf_task_get_cgroup_id 1779/1781]
 .github/scripts/tests/test_veristat_compare.py: warning: ignored by one of
 the .gitignore files
Message-ID: <202403061822.18sTy8UR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tycho/linux.git bpf_task_get_cgroup_id
head:   7c92234950fd064f85d8fd02d81caa32574a0e0b
commit: 05e0e9a47b4884544a173945509ef287ecf2298a [1779/1781] adding ci files
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240306/202403061822.18sTy8UR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061822.18sTy8UR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061822.18sTy8UR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
   .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
   .github/scripts/get-commit-metadata.sh: warning: ignored by one of the .gitignore files
   .github/scripts/matrix.py: warning: ignored by one of the .gitignore files
   .github/scripts/prepare-incremental-builds.sh: warning: ignored by one of the .gitignore files
   .github/scripts/tar-artifact.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/tests/test_veristat_compare.py: warning: ignored by one of the .gitignore files
>> .github/scripts/veristat_compare.py: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-veristat.yml: warning: ignored by one of the .gitignore files
   .github/workflows/lint.yml: warning: ignored by one of the .gitignore files
   .github/workflows/test.yml: warning: ignored by one of the .gitignore files
   ci/diffs/.keep: warning: ignored by one of the .gitignore files
   ci/diffs/0001-Revert-bpf-Avoid-unnecessary-audit-log-for-CPU-secur.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-bpf-Fix-a-few-selftest-failures-due-to-llvm18-change.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-bpf-Fix-a-verifier-bug-due-to-incorrect-branch-offse.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-net-bpf-Use-sockopt_lock_sock-in-ip_sock_set_tos.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-Fix-pyperf180-compilation-failure-with.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-disable-detection-of-llvm-when-buildin.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-work-around-latest-Clang-smartness.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-xskxceiver-ksft_print_msg-fix-format-t.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-tools-resolve_btfids-fix-cross-compilation-to-non-host-endianness.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-tracing-kprobes-Fix-symbol-counting-logic-by-looking.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0002-tools-resolve_btfids-fix-cross-compilation-to-non-host-endianness.patch: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
