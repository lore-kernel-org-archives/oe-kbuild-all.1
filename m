Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CC637DEAE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205842; cv=none; b=VKlwaiT9psu7ZWt9Tz54UZCOd03zem+lz4rt0Qt2ytfD9rw2DVp5X13WtjssmooN2eemmB3WGL560iCCVKp8WlFglankLT7G0Kl8Xn0BNkgzQMyvT5bY6nVnTOQhb8a1gSYT2FCFIw0W8oEpKfDSdm2NjVNCstrgeURff6T49Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205842; c=relaxed/simple;
	bh=dXguO2Rcnqq4PK7mKFclkkKJvhnEDc6fc6mwvFBy+gA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BiDhWYyre4/w0XPfCRo3GlJCWwrkheF4qW90hPEiHfs+SWWgpXcR5jHCy5IcOK3Uwu1qx4m3lrjOFcDoowvpr938bQVQWRWAMK+Vev6LDNNQpK8z0sRyCELWZPu1U45+BN4D1yAMAkU/+wZ+14QZWsj9yJhT6JaogT0+QBEuQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTR5Jgag; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTR5Jgag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205840; x=1806741840;
  h=date:from:to:cc:subject:message-id;
  bh=dXguO2Rcnqq4PK7mKFclkkKJvhnEDc6fc6mwvFBy+gA=;
  b=eTR5Jgagc2PQJS3W9a4woJvZPSJkKQ3VQm/p3ynrtLw2E4q1OSLEGrAx
   d8irGx3K/+ND5tmRbqbTioyyQM5Q/cApu4LW94UZPhNTPKoYq6O9BFQDz
   W+3m0fVc4QZO/iAVvGsDQ1PJmA5MBON9V1w+13hG1xsg1wLY5r51EcNZ1
   e0fnj0WF2+4c7b8wxNkzxHs73kV46Djmm5vqrdzy5eR0esKNRrvU/bFog
   4SWq1OEbm+O5Um5LDAKCQpT9icTpZJLXLqigNpyVd0OyAYItGA7mDxUQB
   pLb/bFpz1C7yekBsApxIKEBOIar8+k1MxY4wuyJwI0D2B5gzom6UAN7NS
   w==;
X-CSE-ConnectionGUID: JIXh6gDrR8yvozmxDBg6ZQ==
X-CSE-MsgGUID: ArliSdu7Sb6AIouZfFcqHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852230"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852230"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:43:59 -0700
X-CSE-ConnectionGUID: xIm+VAosSQWcsy4YLA+vFQ==
X-CSE-MsgGUID: oF0yeb9nRhCdhJPq4t1uKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943418"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:43:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a8B-0000000014L-38hd;
	Fri, 03 Apr 2026 08:43:55 +0000
Date: Fri, 03 Apr 2026 16:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 kernel/gki_module.c:31:6: warning: no previous prototype for function
 'gki_is_module_unprotected_symbol'
Message-ID: <202604030458.aCSKHQ1c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   3345d7186397130229186427c1c89125d9687c46
commit: e7451150cb701de01d6b836c496e1bd012d885cd [1/1] ANDROID: GKI: Add module load time symbol protection
config: arm-randconfig-001-20260403 (https://download.01.org/0day-ci/archive/20260403/202604030458.aCSKHQ1c-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e3cbd9984a78422c3799629eb6b5f7f7818c1a11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030458.aCSKHQ1c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030458.aCSKHQ1c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:31:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^
   kernel/gki_module.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +/gki_is_module_unprotected_symbol +31 kernel/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
