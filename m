Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB7E207E1C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 10:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739355041; cv=none; b=KvoTxa2O9b1HJekVrAz4W21XDEp8cQTNoAKBKkPyJ3R42kfDJCJnDO9U67mowgupzO5ux58pJS2xp0efya5DT3Dpcx0BiVZ3O0eEq+OGk9fLCZ3NTuPbp1kl9ZlU/zdA91uUNlmxXth5dS1KysnPm3iXDMC6urPvXdtJOP9YWwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739355041; c=relaxed/simple;
	bh=PufX2DaTeqc2bQA+3KwRZC22PAjkxfw/N5c0SuL/MX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ARpL+lSoes0esikvreife94CKRnrO1hdNk+PrP/OlfgOkuFuqX5Mby035RL1XkCr7aTdvnWojE4H1wo54KXr1t1b5Q9T1yQhU1bt0oo3P218MftBfsPa3cimMHnOqKrydrcZYshyHjJd2TmAwLYVzJOSqFTbtB57ojhIvgDHyMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xs/2zDV/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xs/2zDV/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739355039; x=1770891039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PufX2DaTeqc2bQA+3KwRZC22PAjkxfw/N5c0SuL/MX4=;
  b=Xs/2zDV/0qxR7U9g5KKM4f5yGbwIhjrmRGThsvn3zNl9sMHppZQqql0M
   Aos8I2wnoJcjVqrZobZwR7yUMw7Lig7nyb0+KOpz2ppfpyBi2pfAKEQ9P
   OMWHYITMwA4OGtBoqDhb+3t/YCoFd7stRoMvRUChtitVjZR7O/udHcWtA
   jFpPtOqRAyPC25OjkFW7M+odXEomW75fIzEEaFxp8Q6YnHwp4Afx9fzbi
   XhoR7JzPadlJ88nfWb2Jbr+uno1TuzhqgUobSZL5fl1dUnaavT8CboJvk
   OsIMsVr7iMBQbQJxE/3uFw/jz3HwECNHakJg3U4vZpS7GfRhGVjhOR9Ea
   Q==;
X-CSE-ConnectionGUID: 9ubjdQJCQGiYSMkRJx+UJw==
X-CSE-MsgGUID: Ik6Q0ltqS3yf3wypA+Za9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43659228"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="43659228"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 02:10:37 -0800
X-CSE-ConnectionGUID: C4dBJpvmR9uA0ckY8sp7EA==
X-CSE-MsgGUID: bd98DxAKTiu+i/EofujwFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="113437206"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Feb 2025 02:10:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti9hS-0015Td-15;
	Wed, 12 Feb 2025 10:10:34 +0000
Date: Wed, 12 Feb 2025 18:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1] kernel/futex/core.o: warning:
 objtool: futex_wait()+0x2e2: unreachable instruction
Message-ID: <202502121730.vDp38U6C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   37e047edf17927e9af7749ee5babff25a01b16bc
commit: 4750cac4df681ae7bcfa294312f340238b3eadab [0/1] futex: Move to kernel/futex/
config: x86_64-buildonly-randconfig-004-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121730.vDp38U6C-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121730.vDp38U6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121730.vDp38U6C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/core.o: warning: objtool: futex_wait()+0x2e2: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
