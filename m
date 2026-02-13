Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153261B85F8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 15:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994957; cv=none; b=cDubg2cbQjzzOHJVtTFWdgbMA7m06RRHHQKb0hRQmaK07daRhbqXkHmo5/vyipKsVm9EKUdFOpB7vJEbhpMMIieQpG1oPKc/oKz/fNtBL0O54s+w4BEmXQ1h9n7xiP1eDRTi12HKXlsZ0qzxwlvh+VqsoVMsoybX3rOZAWx3Uq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994957; c=relaxed/simple;
	bh=K0dD/bFQ/Jx52UPbN+7BpT5GdbCAYMfx6DRZs6uiqyA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EOGTpSgb2DrM1cwlh0e0AJuw/CdkSEkQvUmmuLiq9EyVi1MvFoCRkByxeuCozIHWZXzlQ1Yu8OO0FCP9xnklFA28bBXjKyf2tZzpJ0SYzhJAXWCik2TBVWMPKyZGnxVroAB0/yzX22ekXWtXDEmiOJOt1bYj9ZSsME/MwH+Q0EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0NjALpY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0NjALpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770994956; x=1802530956;
  h=date:from:to:cc:subject:message-id;
  bh=K0dD/bFQ/Jx52UPbN+7BpT5GdbCAYMfx6DRZs6uiqyA=;
  b=e0NjALpYrlAUADMK07Pen4+ETAlvw3yNUTfF23S437iuvSJ+xZ/ay5M9
   LzS6bb9SI5zIChjhY6ARI+p2YWttHVVr4+sLPxEPrra3WlUhkzjWtLbie
   PzGsZzFLyEhjhHOhaSgrOtDCTlovPbZmKcjp9urw5VrVyneeq+LOhudFE
   0PDyBgCh6vHbkOJOADHPrVohBXsxV+E4+fZyFxpdtdD2dqMKSw+nOe+vw
   4LthsveW6XZEwA6cBXlPwx8DJ4Xl55gWHIIgFQ3qCaWoAnDBeH2gIq0VI
   Bpg05Yi5paP0i+cVyo28li2xiH8FdnSaCd4Kd5dlafSv8fLSTah38OmoS
   Q==;
X-CSE-ConnectionGUID: EfdfaLDJSPebZvYAR06iYg==
X-CSE-MsgGUID: dv42fDsDQBCue0L8wyJTug==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76024507"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="76024507"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 07:02:35 -0800
X-CSE-ConnectionGUID: Kw/d1UHiSCag7wbW/JLK/w==
X-CSE-MsgGUID: 1QjHryVZR+eo5A1KgVjsig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="217476946"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Feb 2026 07:02:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqugh-00000000vae-26xT;
	Fri, 13 Feb 2026 15:02:31 +0000
Date: Fri, 13 Feb 2026 23:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 2/17] ci/diffs/.keep:
 warning: ignored by one of the .gitignore files
Message-ID: <202602132255.FniDlktI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   3bb11e809e06ec473ee881de417d36f0d164f3fe
commit: 254af9f91cb38b13b6cf71769ea5d413af48a9ef [2/17] adding ci files
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602132255.FniDlktI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602132255.FniDlktI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602132255.FniDlktI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
   .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
   .github/scripts/download-gcc-bpf.sh: warning: ignored by one of the .gitignore files
   .github/scripts/matrix.py: warning: ignored by one of the .gitignore files
   .github/scripts/tests/test_veristat_compare.py: warning: ignored by one of the .gitignore files
   .github/scripts/tmpfsify-workspace.sh: warning: ignored by one of the .gitignore files
   .github/scripts/veristat_compare.py: warning: ignored by one of the .gitignore files
   .github/workflows/ai-code-review.yml: warning: ignored by one of the .gitignore files
   .github/workflows/gcc-bpf.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-build.yml: warning: ignored by one of the .gitignore files
   .github/workflows/kernel-test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/lint.yml: warning: ignored by one of the .gitignore files
   .github/workflows/test.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-kernel.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-meta.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-scx.yml: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> ci/diffs/.keep: warning: ignored by one of the .gitignore files
>> ci/diffs/0001-selftests-bpf-work-around-latest-Clang-smartness.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20251014-selftests-arg_parsing-Ensure-data-is-flushed-to-.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20251014-selftests-bpf-make-arg_parsing.c-more-robust-to-.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20260127-Fix-static-build-of-bpftool.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20260202-selftests-sched_ext-Fix-init_enable_count-flakiness.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/202602021-sched-mmcid-Prevent-live-lock-on-task-to-CPU-mo.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/202602022-sched-mmcid-Protect-transition-on-weakly-ordere.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/202602023-sched-mmcid-Drop-per-CPU-CID-immediately-when-s.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/202602024-sched-mmcid-Optimize-transitional-CIDs-when-sch.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20260210-selftests-bpf-Rename-do_filp_open-to-do_file_open.patch: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
