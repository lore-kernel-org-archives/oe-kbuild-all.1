Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B29922EF6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 20:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmRJPTa8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698091274; x=1729627274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gduM3Ob92KupxquW/G2JVgzaxgUCxOItb03tYZw5NHg=;
  b=ZmRJPTa8oKj8g9E7dllAa3oSvQzffAXLxFXy0MPkP8+F6BUgSusCS754
   MPzC6v0REK4C+vx9ZF7QKxWu3VMqnKfTH5JA0VMbFz+z/52eaznxpEbGf
   INYayR5uKfFHeMb6p93krrkSO6d/q5gOo408rwjphc9TRyod4bVazn6H7
   apShbc4cxFgoeuGUose00Bb6IJMB1Kbd0zDmxeEA8la3/WrL6gymPj2x+
   GKOsTEJ7cXJGoQ3BW7L0OzcU+/MWJIjF7LIdVNUmwXdjr/r9ZcIw76Bfb
   o/kz0cN5tuPKXKkBSF0Rr2wWwqyr+DtAwPsBsTr50ja/dO8DuwRH4ZI8F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385814132"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="385814132"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1089603451"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1089603451"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2023 13:01:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv16p-0007DR-1y;
	Mon, 23 Oct 2023 20:01:07 +0000
Date: Tue, 24 Oct 2023 04:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/lpa2-stage1 36/61] checkpatch: WARNING: please, no
 space before tabs
Message-ID: <202310240331.JPo9iNAQ-lkp@intel.com>
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
commit: 53983a55e5574ff8bb63a30da83457a90c5c63e7 [36/61] arm64: kernel: Create initial ID map from C code
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240331.JPo9iNAQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240331.JPo9iNAQ-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#95: FILE: arch/arm64/include/asm/kernel-pgtable.h:55:
+#define EARLY_PAGES(lvls, vstart, vend, add) (1 ^I/* PGDIR page */^I^I^I^I\$

WARNING:MINMAX: min() should probably be min_t(u64, _text, efdt)
#523: FILE: arch/arm64/kernel/pi/map_kernel.c:142:
+	map_range(&ptep, fdt, (u64)_text > fdt ? min((u64)_text, efdt) : efdt,
 		  fdt, PAGE_KERNEL, IDMAP_ROOT_LEVEL,
 		  (pte_t *)init_idmap_pg_dir, false, 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
