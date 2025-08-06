Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376B11C3027
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754473353; cv=none; b=nwemk7hioxrdup6awnuLf0th1Fu8W9+eliJpkUZVAUPpdgVfap9Yjzz1OJWTzL1q7bt6t9W+quFeruPdDdAHf44bTz/OSbrk7zrpacSoU6qCZPx0xmScJDWLhaGjHoKrbnjHOzgrtQT2otWgChfB8M6PrrbSLlJn8SXBRVMF14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754473353; c=relaxed/simple;
	bh=AtegJG+3Hfd1SyhBNv+Fj8HoJReIszbMm6h3pREM41A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oLQX6IxTwHkFU5TStqqPPfbS8trP5CkNIb2NdsDR8TjDHkSoNX+Tk86oruck+JifOeynoSPbhQb/c2AxrquYktAlVYzaOyaYiAakEHcQBtVwsEMNpVMqaQgopB83tYv+EhG/NGDU0/bTKNHsQUifjtCgnItzMrl9UB51kQ3uDlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAkzGPrg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAkzGPrg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754473352; x=1786009352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AtegJG+3Hfd1SyhBNv+Fj8HoJReIszbMm6h3pREM41A=;
  b=cAkzGPrgueBAWvNvaZcGDcv/2o9Ke2HXA0IYd9yggqHlmc4QHZYkO9vT
   abgfzPfFQ/DWawWeGHqmgiQ8dnCb3AR4/x2hFIsZcha7qVRU32nhDuHD1
   Sj+J7E+U5A7Dz0W4BCJKddwouBQCX/SPWusV6iiFfILb6eg7rLktiph+w
   NHKZWdNZJwbIt1u+UlrRYmfIvCmjza1nfQFGjaxSkoXGTUF+rMt264zGd
   20m2i/XdTwSVxisBWbey5zi8VhzckaUMMVrieIL9uEgjxqYUVB7UT35m9
   jJRuyCOhwmjbuO6NNDUbV+b7WjA/pHmKkPXaplXVbbbheM/EI6f+wynpt
   w==;
X-CSE-ConnectionGUID: gJJsotxVSRSLqfa1zZTzkw==
X-CSE-MsgGUID: NGrIdMhrSVqPxwg5Pxfigw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67862308"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="67862308"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 02:42:31 -0700
X-CSE-ConnectionGUID: orP0FCUUS8CDdAlCw2J6BA==
X-CSE-MsgGUID: BXhA6KGcQMK6uG9QY0puAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="170003343"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2025 02:42:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujaem-0001U8-0G;
	Wed, 06 Aug 2025 09:42:11 +0000
Date: Wed, 6 Aug 2025 17:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] fs/binfmt_elf.c:2143:13: error:
 no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202508061723.svf4ZxWb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   886d2f37b79982531259490548bc83b9216ca685
commit: 58e2fa4ec4b1e15b7c7510bc98befafa31c03f70 [0/1] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: x86_64-buildonly-randconfig-006-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061723.svf4ZxWb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061723.svf4ZxWb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061723.svf4ZxWb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/binfmt_elf.c:2143:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2143 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   1 error generated.


vim +2143 fs/binfmt_elf.c

  2140	
  2141	static int __init init_elf_binfmt(void)
  2142	{
> 2143		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2144		register_binfmt(&elf_format);
  2145		return 0;
  2146	}
  2147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
