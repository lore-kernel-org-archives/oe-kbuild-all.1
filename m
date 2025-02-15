Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034831DF964
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 18:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739643619; cv=none; b=US+W1/LM15Yb/oyykG9zp4pxqJnrkZtftEGoTP1yQOiP110gIJDGlnO7e1CNMWGOTV+LBH2vcFOVufifbD3vzjTHHAOrsOc88DhprXRqTwX9s9E7ODUygduLiYO+VrR6lvOETZIsPoI83ecITy0PGX9I/f7kg6HaO7WZEuGAfo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739643619; c=relaxed/simple;
	bh=NGAQjVKwIUolDBVvQ1Q0WosQo+TOFSEc/HVGE/4cFR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CnrQ/VMDJP3qkPQn9VbUNMHyOc+ktMz4vnZFtRB0DU6gSKm7bE55shjckTxr4zLObglC7HJIZbygMNOIv9dj0orv42kY2w1+KQ5xTGwI05SvNDfG0nb5yXnrN3YYavdbB5700TK3IWzlc9OYM1CCRKWzCMAx3cRkFyB1yW8j2UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0Y9vW3H; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0Y9vW3H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739643618; x=1771179618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGAQjVKwIUolDBVvQ1Q0WosQo+TOFSEc/HVGE/4cFR8=;
  b=B0Y9vW3H9/RMN8tiPP7Jp1z2ao863EmARM7gniqQlfVm587tA3sy32gh
   OxXUeVRa/LCQ0bRnlXY5sza7A3ORigg6fftq3nSX71R+aKw7k97AMtqn2
   9pUG5TqMogucStIUu0LXF3zuXUxTyN7E6dfbyHKV7/npJX+v5s5SDpEDk
   qIvHMjaBrOrAR8WWuuz1SWbduPtJPMzT78c98fXLzmkOAZwfS9Kw4eqYs
   3CuCKG/31bskxagOyXO3vKOacmUvFQ8wildXz4GFaFF/IvVEUn1XNKSqg
   tH4iFXV6fHz0feClk9FXtvxgaZX7mn0Shl9J9tg1aeCmPIKjxVXaMss7U
   g==;
X-CSE-ConnectionGUID: XFez/8g5RS6lhGOCJJD7UQ==
X-CSE-MsgGUID: Z5pzd1RRReGs8lW5U6xP2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="39557079"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="39557079"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 10:20:17 -0800
X-CSE-ConnectionGUID: IL4vNK2MTrC43J/i8gD4Lw==
X-CSE-MsgGUID: uEZJkgrXQWij3EW5x+IP9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144663099"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Feb 2025 10:20:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjMly-001B4b-1A;
	Sat, 15 Feb 2025 18:20:14 +0000
Date: Sun, 16 Feb 2025 02:19:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1422/1422]
 kernel/time/.tmp_posix-cpu-timers.o: warning: objtool:
 set_process_cpu_timer()+0x119: unreachable instruction
Message-ID: <202502160200.QYr3efrJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6a6cc2b6b95dc80ae01221670e21a8059229a023
commit: 36ff49c95a04513935898fdcd4bc37646b2dc459 [1422/1422] posix-cpu-timers: Sanitize bogus WARNONS
config: x86_64-buildonly-randconfig-001-20250210 (https://download.01.org/0day-ci/archive/20250216/202502160200.QYr3efrJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250216/202502160200.QYr3efrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502160200.QYr3efrJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/.tmp_posix-cpu-timers.o: warning: objtool: set_process_cpu_timer()+0x119: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
