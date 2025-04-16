Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17636238D21
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806356; cv=none; b=LksHlt9cVRchHfkinsKFa4U4L+jPDY0VZG9dJgpY/MXGmwRCM/e4KSS9ryN4+AMSYQ76MD/N/9uQfe2B8vBGbbgYlBEMW68HKznvu6fkM7FdUablskneENxfNRQ9EPUD0FNdOhZprcYedIsRoOwHfsIDOy6tnnmlOKhc/cLNgNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806356; c=relaxed/simple;
	bh=wPadVYlk5Nce7fzAJ2daUVe8yt+djHEwYVADpF0RTuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWTQrNFIkqlr7ue22tfvsvJw6H9e6Cnof0XpAAT9LgY6puohJSTRtO1d/tlLG8tuMvGHaS//1DFtGmBIJ2qno7SOlUWpC4gk08vq9MZBjm6BeQs3GbN/Yeef+6HmJsaJ2Efbxo1C5zyVYykLWBioVczWy7dsvOA+UJkIrQuM0wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BErOxQCp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BErOxQCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744806354; x=1776342354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wPadVYlk5Nce7fzAJ2daUVe8yt+djHEwYVADpF0RTuY=;
  b=BErOxQCpLw7nvHi6c/mt3inG9V+ZAOm8aYSB4BJSo08gjoQ6l1zLy2nq
   35VhHT3xFDO0/qyJ06UgneyQxKbPLxRsG4+c6gd8qoSDQQ5LrF3UCj0s1
   vXzwZM/9th3+MsLiaONmY9eQVLMCe/XnNkaEeVSVKwCS6tYo6kXDpdWcQ
   T+iWEdIrJdQzmF1os4pDYsvxWmRArsRz4XhBbaJ08ouIpYZ4x+wLT9YPV
   s0xRsL2jecUYofZgm72f3okL3Lcdb1V6huo6tFDK2J1rL7AHSCysicLLN
   BuUBenmZHugB3CglMODx6K0XzcfnFa9bj1+7pC0ZFPysidxIIU/26LUJA
   w==;
X-CSE-ConnectionGUID: dPt6gpgaQuG6aAJyzsC6mw==
X-CSE-MsgGUID: YQdW0L/6RbS8NkI6t4hf3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63889448"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="63889448"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 05:25:52 -0700
X-CSE-ConnectionGUID: /Pisc0oaTm6utzW4mXfObw==
X-CSE-MsgGUID: cjqdfAznTv+SCw5hLrqvZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130768908"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2025 05:25:52 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u51pt-000JgV-1z;
	Wed, 16 Apr 2025 12:25:49 +0000
Date: Wed, 16 Apr 2025 20:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1582/1582] fs/gfs2/rgrp.o: warning:
 objtool: __rs_deltree()+0x188: unreachable instruction
Message-ID: <202504162035.XTrGjsOi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d47443532b562cff105f8cfbc32343f83a2ecd01
commit: 27f3c5bc01e9836a87061de4ea01fa3754a40274 [1582/1582] gfs2: Fix marking bitmaps non-full
config: x86_64-buildonly-randconfig-005-20250415 (https://download.01.org/0day-ci/archive/20250416/202504162035.XTrGjsOi-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504162035.XTrGjsOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504162035.XTrGjsOi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/gfs2/rgrp.c:1288:25: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
    1288 |         int demote_requested = test_bit(GLF_DEMOTE, &gh->gh_gl->gl_flags) |
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                                           ||
    1289 |                 test_bit(GLF_PENDING_DEMOTE, &gh->gh_gl->gl_flags);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/bitops.h:342:2: note: expanded from macro 'test_bit'
     342 |         (__builtin_constant_p((nr))             \
         |         ^
   fs/gfs2/rgrp.c:1288:25: note: cast one or both operands to int to silence this warning
   arch/x86/include/asm/bitops.h:342:2: note: expanded from macro 'test_bit'
     342 |         (__builtin_constant_p((nr))             \
         |         ^
   1 warning generated.
   fs/gfs2/rgrp.c:1517: warning: Function parameter or member 'rs' not described in 'rgd_free'
   fs/gfs2/rgrp.c:1992: warning: Function parameter or member 'rgd' not described in 'fast_to_acquire'
>> fs/gfs2/rgrp.o: warning: objtool: __rs_deltree()+0x188: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
