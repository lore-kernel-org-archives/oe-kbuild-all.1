Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F531B26D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y004YcJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698091274; x=1729627274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dSKCX08C6dEbSFIkTST2VvV1M1WH6Me2RZReZfVJpY8=;
  b=Y004YcJauw2LLgBchMyA9FGKR+sKreQWZ/37yji1fHJ3SH2vKElHnq2M
   CFALBQ554zlQlU5aFBkcWnQMW8tr4fqIyB71HJvfODiQiCuyA9FMR+b7w
   9iCIaG78RO53TII5TDqRwNKHwH+XpsqF6uRvn/lznTjZEh/rEpFwARMMt
   5N7M8SOSH7Xf6rDWGyZkWTHqzTNJojjdosD3hZqCmp3BJCDBDle8pgacS
   4IlXOrv1DuBLFmHjKTMouKjA1Q1RlQPkhT8zfkNwSsEp4eTeqJ15fuS86
   SrquhMN7he4MSXXYHqFmH30fTqitKlCqj+qXV9bg2reFnRVJZcGK4ETPr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385814143"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="385814143"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1089603461"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1089603461"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2023 13:01:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv16p-0007DT-26;
	Mon, 23 Oct 2023 20:01:07 +0000
Date: Tue, 24 Oct 2023 04:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/lpa2-stage1 32/61] checkpatch: WARNING: Missing a
 blank line after declarations
Message-ID: <202310240354.BYeBMpCh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/lpa2-stage1
head:   aa77c7fe48f8b863ab1c30daf17ed8893850c7eb
commit: c479eff86e7f728d88d42afa852ed6b72fe6d62b [32/61] arm64: mm: Make kaslr_requires_kpti() a static inline
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240354.BYeBMpCh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240354.BYeBMpCh-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#52: FILE: arch/arm64/include/asm/mmu.h:92:
+		u64 mmfr2 = read_sysreg_s(SYS_ID_AA64MMFR2_EL1);
+		if (cpuid_feature_extract_unsigned_field(mmfr2,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
