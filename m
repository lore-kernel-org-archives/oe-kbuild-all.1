Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F013E9F8A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042274; cv=none; b=dyx4dYAiQhM0mx0Hubgeanmn5O+kNZLkYWsDWcVwn6rmNgtIAdsQiSxFIijLgV5u3m1IoDC4a5ORiWPFyswDj3Igeowl+aDRHtW0g3dLQ2qYHXBzloh/6qffx7h1YLF8yn4CANqjI/kQ/BJlpYMCEXG1oF9zFgqno/GvDwoIDbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042274; c=relaxed/simple;
	bh=1+azvENUDfflrcRq5dZB6draXr5OcwG0HhebdFEYKOE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sPI9IrCNqVPPYHtTnf7p5xrA96bZEGehL0njVU8dvudo1Gc1FZjt3mp1TheBHTWncH+BKcVgARXI4RT2uhRQSl/CG87OGax+lpd8jNu5tH7HaqsEVTCqWMc32FiTCUYW3VtqUTuOGPslWwUabaDPnoP+3PVFUiM2tyM98tJpbto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TONQy2qu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TONQy2qu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772042269; x=1803578269;
  h=date:from:to:cc:subject:message-id;
  bh=1+azvENUDfflrcRq5dZB6draXr5OcwG0HhebdFEYKOE=;
  b=TONQy2quQzUc+jaDfUzAduosHASFieUDckZ57vUs510PRs3MC4PzxqEp
   52vUwka6u5Rl8Z9xew0R2dZLrUhogquNRQjq1c2ql3JQEyCD24UhmeDOY
   D4CERvVy32kkUnDP7wm6502GSeBNDOEPYzBnfnCCuVnFMcxLcqXEllNOH
   seH5Qf1sV2ps6dwzRlyMd7i76Syxvzink+XKhnjmaISkdTDGljeSfxvfJ
   XlMfrdHcS1BhmMlFV/ExlMNbNCusju4gjVOD/6P8XuBma9OEGDLFRyHW7
   LJkL+TdUj+jMEUbOClKXdDqPDvA4yLAGNqw3V4WmrsBIXUbd/tbLLXMjM
   w==;
X-CSE-ConnectionGUID: 8pNlflhJRIWhUCRFAHXuKg==
X-CSE-MsgGUID: n8macRHjR4uvquEbkxZOGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="75696427"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="75696427"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 09:57:47 -0800
X-CSE-ConnectionGUID: Qnw+wajzRIeq6lSB7yEfMw==
X-CSE-MsgGUID: 5mO0+AHtTVamPzW3+EawCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="216451450"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Feb 2026 09:57:45 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvJ8p-000000006u5-0TVQ;
	Wed, 25 Feb 2026 17:57:43 +0000
Date: Thu, 26 Feb 2026 01:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>
Subject: [jolsa-perf:bpf/tracing_multi_5 1/23]
 .github/scripts/download-gh-release.sh: warning: ignored by one of the
 .gitignore files
Message-ID: <202602260136.eolFSLoE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   2e9ff5967a4f3cb4d96c1fd04944036d9961099d
commit: 7c886b86f351fa4ed85b556725475f6e25e3b1d8 [1/23] adding ci files
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260226/202602260136.eolFSLoE-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260136.eolFSLoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260136.eolFSLoE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
   .github/scripts/compare-veristat-results.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/download-gh-release.sh: warning: ignored by one of the .gitignore files
>> .github/scripts/install-github-cli.sh: warning: ignored by one of the .gitignore files
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
   .github/workflows/veristat-cilium.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-kernel.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-meta.yml: warning: ignored by one of the .gitignore files
   .github/workflows/veristat-scx.yml: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   ci/diffs/.keep: warning: ignored by one of the .gitignore files
>> ci/diffs/20260223-s390-bpf-Do-not-increment-tailcall-count-when-prog-i.patch: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
