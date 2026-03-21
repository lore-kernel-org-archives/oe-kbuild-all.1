Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F7075809
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 04:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774068548; cv=none; b=YS1+Id1CqrSgPGriG8FCPRO7t+PFQAW4OLDyuXGjkYjVDNU+mRNHLq6wXnf5E1K+tbAdzOBWVTZAQxVFa9rF7I/z1CgHy3KxzHRgE1PCMp1xrtud3xKtYGaClyGH9Lw9yFbrmhweuXBXtGZFBfkkNszkA/ogUHU0/Wa9A02VC4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774068548; c=relaxed/simple;
	bh=YpsLFUQdnRxAKWUHhi2dFhscdeXowHwGUXVwOe2VciY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l6yrjAY0N6alHel4Um6sgRyyO4RlnjuH+b/NnA6VYG/acnQnSdc9pK+6jqL0RpMDqFPFH0rr2zsjx6QmLERubrIQ5cWsTPIe01L7rDI9LY8V8HCRf8gxinvGnjgkr/EPjKAoO29+nnjbmalCpZaIssKt4/ibE1+sBl0+cylpjiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZl/iId9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZl/iId9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774068546; x=1805604546;
  h=date:from:to:cc:subject:message-id;
  bh=YpsLFUQdnRxAKWUHhi2dFhscdeXowHwGUXVwOe2VciY=;
  b=QZl/iId9BLLltHZaL3+3+44wj+fwn2qpjQagQkK8hwGBBgBPJEAPqx4a
   jrYJukJLKd2w8ztxhPCZTOGtLCVGRY6qO9j5BnvNbBYvjj8OGFBtH5yEe
   0gwX/+9rNENR0Y+rxDpkXDj/kxf9G6OzZYI4LjQANmcrVc9Yy9JPlfUH9
   2tQ8VsSRznbJA1roUk5fQ9PP8R/nonPURyahH1us0PWSyIoS+rpYJgrjW
   nuSfv6enKFMwwSb5H0iJTUa+dKI1+G4NKXfpyHTiD6QlO+pffZaztNErM
   ynNsC2m5Z6aNyrdEHD3yveupNwxoypUffaiEggZycovQao1jCzx1hXoVM
   g==;
X-CSE-ConnectionGUID: byJmaei5QWuVOD+I2D8R5w==
X-CSE-MsgGUID: V05N18y3S8+R55SMsv3H+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86518215"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="86518215"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 21:49:05 -0700
X-CSE-ConnectionGUID: TSdFnOx6QSm8OZXZ42VZdg==
X-CSE-MsgGUID: LI7KgFEwReqfDpiqvii4fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="223528275"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 Mar 2026 21:49:03 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3oGG-000000000JN-33mL;
	Sat, 21 Mar 2026 04:48:43 +0000
Date: Sat, 21 Mar 2026 12:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Nicolas Pitre <npitre@baylibre.com>
Subject: div64.c:(.text.mul_u64_add_u64_div_u64+0x40): undefined
 reference to `__multi3'
Message-ID: <202603211216.YTKRdi1b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42bddab0563fe67882b2722620a66dd98c8dbf33
commit: 6480241f31f543333ed0c7a209962412461f6e41 lib: add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
date:   4 months ago
config: mips-randconfig-r122-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211216.YTKRdi1b-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211216.YTKRdi1b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211216.YTKRdi1b-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64-linux-ld: lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
>> div64.c:(.text.mul_u64_add_u64_div_u64+0x40): undefined reference to `__multi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
