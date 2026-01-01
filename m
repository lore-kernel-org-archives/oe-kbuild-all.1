Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325EA1F91D6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767271923; cv=none; b=o8rueghzo02KGsALQ6dIRZtsHRRmz+udeStXvN6i3Es1NxRye8ME9irlSIePPpwDSYPsyDdSP4iXPVyr7oJqTR/AdDSaQwVrfV1IMEIh/NMqAnxGM7zJoAHfi4J49Ld31ZO4NEOoi1fXU5UjXbQbpmLNOsmBkCmrDsN5//CqmiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767271923; c=relaxed/simple;
	bh=4WYmBcaHkTGqu7zC8Tghp6WxbACuxnJSsdP+2FpqXsY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jgnx2Fq1wrz4Ha7uPCm0v6VGicDnXLnquqSVGdoQC0NxYe77wt13zmnTBUGBOsOtGumGxfWXp69nOzjVME0Y3bASvOW9pX2ywneKXgh9Kx0dOBu6xvhiV/kE1sSJOSFpYYsX05LnercYwTXcRbfyH3UwT2ef0RVlBUa7ElCV7gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZJasZ46; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZJasZ46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767271922; x=1798807922;
  h=date:from:to:cc:subject:message-id;
  bh=4WYmBcaHkTGqu7zC8Tghp6WxbACuxnJSsdP+2FpqXsY=;
  b=QZJasZ46Fpl9cQ8QyuKViyzU3Z9gqSPSEG9FoPpZSjJs+EKBs077W/xL
   DGs6d+kPesKBZoZPQOs/nG1HzbBDhD8z3qW3o73w+qEhmX3b0Y7/bzz7T
   fi0xQgGgxK4cTYQZWFpWVdZtMHrtpq+E7NaJWMGfzSjQwNTW4KnQAlrfc
   McxT8RCfY2SLsNeNI6WFoYV4qG1RU4yfbeuxUmLVH0F74dUeDpZVzIkKB
   uYMvWOB+W//RwTm+NxIktaw/aePe27ZRVHGzEEr7VdSthm1E4HyZVKWOF
   D1inkRL35obeS6RIRwvgbCVcMujVpyZH9ygCQ+v0MBneMOwuT7ajQITCb
   Q==;
X-CSE-ConnectionGUID: 0eGTzuf1TOqCo1rtHfWUOw==
X-CSE-MsgGUID: mupKW6M7QyeZfzLvoaF/Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="86224973"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="86224973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 04:52:01 -0800
X-CSE-ConnectionGUID: U2yIThOHQ46GAOQH5io0oQ==
X-CSE-MsgGUID: 0C7Zi8ltSoivNvKoEFeY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="202577245"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jan 2026 04:51:59 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbI9l-000000000Hp-0fdD;
	Thu, 01 Jan 2026 12:51:57 +0000
Date: Thu, 01 Jan 2026 13:51:52 +0100
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation
 R_X86_64_32S against `.rodata.str1.8' can not be used when making a PIE
 object; recompile with -fPIE
Message-ID: <202601011320.wfOmjyKl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   f348d9af26d490c6f504ccaa7b342803ca1eaa0d
commit: a121b4a72e405d1096049f81933531c59256cbe6 [18/19] x86/kernel: Switch to PIE linking for the x86_64 KASLR kernel
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260101/202601011320.wfOmjyKl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011320.wfOmjyKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011320.wfOmjyKl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: vmlinux.o: relocation R_X86_64_32S against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIE
   ld: failed to set dynamic section sizes: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
