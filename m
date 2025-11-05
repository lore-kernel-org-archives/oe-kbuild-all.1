Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF722BE630
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762350423; cv=none; b=TLL9y6+5gewGrjR/gkztVYM5+/bw+jEjL/gS1qowA+hGA1dDgqvQ7Ots8JhWwATk2s1Al9YVprQiVQFTfCMWR6XETCc9ao3qqSxlyE5k7wT9t8PERCEK7LswFi0Aaev2VySv1+yGQxXiV0EQIPgVxE05zWeeJ9A93Hn1l5gMxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762350423; c=relaxed/simple;
	bh=vLeAy5oxfO0rIY6khFl1hSvbFEWPiDvqmWAtxkh+Q2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=auEQfKmvi3ufFsEP8bVwBvFkYpQlWJbiCprqSnxuBWGJZ8GQTLlP+dHDlfTTqmRvI7eWygMbbjaRtdT/vX34ilOQMf5aOncwsKhVhPI/ZTLqYtp6bM5nN01cgEr/UZAOr/0KlAUTapTIybFX/eJTgF4RPjSe8ATXbo0Ox8aZdCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U00Fp5s8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U00Fp5s8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762350422; x=1793886422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLeAy5oxfO0rIY6khFl1hSvbFEWPiDvqmWAtxkh+Q2Y=;
  b=U00Fp5s85MxcQ3FYgfCvFpnpK3OCymV/vpRkjlpWa0s2eVR+L1NBhLaw
   gqvXrOeDhZq7UcmagZ0hSOsBdWTgbVdsdi/IvSC1nCIM6Xo2YrN6Jsu+G
   U0p8lSGyRn0BipgZ9jBQCG5ChKHp536OEF33JPe7Hkw+NJ7xAnBsNoCOx
   j99ykwWMPenJNROSWip5LrXXmHzCL286/UtVdtZlPuCbg8WUcJ1LdjCVm
   rgIW1buleWwb7PoDMgDKbvLnlOoqIjwINZ2nB/pDI0liAGdy5LNZK4ZvX
   mvMoalb9PAy3NlP1WYKdeH7WjrNKi9SiIMHlqJvk8i+g0jT1v9bsLgdFZ
   A==;
X-CSE-ConnectionGUID: ZBUo+hkwTHGnWoJurQe2jQ==
X-CSE-MsgGUID: jRzxg2ZJSWmf9lCTdonnWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63472033"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="63472033"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 05:47:01 -0800
X-CSE-ConnectionGUID: DIAev9ZrTnKRNbzz4YOvyw==
X-CSE-MsgGUID: ytxRmDxmS6OtAgtTRbv1eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187621833"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2025 05:47:00 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGdp8-000SdQ-2r;
	Wed, 05 Nov 2025 13:45:32 +0000
Date: Wed, 5 Nov 2025 21:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kernel Patches Daemon <kernel-patches-bot@fb.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:override_1 93/95]
 ci/diffs/20251014-selftests-arg_parsing-Ensure-data-is-flushed-to-.patch:
 warning: ignored by one of the .gitignore files
Message-ID: <202511052108.wf8p4WgB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git override_1
head:   6b8d52e68fa760c717bca4fc78061b6695d46dbe
commit: de0745f7cc98146c70a020bc3a1b73c7f3405282 [93/95] adding ci files
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20251105/202511052108.wf8p4WgB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052108.wf8p4WgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052108.wf8p4WgB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/actions/veristat_baseline_compare/action.yml: warning: ignored by one of the .gitignore files
   .github/scripts/collect-scx-bpf-progs.sh: warning: ignored by one of the .gitignore files
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
   ci/diffs/.keep: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-disable-detection-of-llvm-when-buildin.patch: warning: ignored by one of the .gitignore files
   ci/diffs/0001-selftests-bpf-work-around-latest-Clang-smartness.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20251014-selftests-arg_parsing-Ensure-data-is-flushed-to-.patch: warning: ignored by one of the .gitignore files
>> ci/diffs/20251014-selftests-bpf-make-arg_parsing.c-more-robust-to-.patch: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
