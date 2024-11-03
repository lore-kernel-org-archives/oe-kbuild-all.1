Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123AC2FB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 02:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730600970; cv=none; b=F6wedcrOgaewTU/n/9Mkp3EiIubg6mYtV6wv06F66ROqfHP/pS44XMParIvOuFCNRFqPWpjWTNZ1WG/OEjfWUKLsQY+fH7dHIql0YU/IOVUsd/r3/fUHMNxaVbqXX/y9OkNuK7XVw/Eq3ZrsUzBhQfwZgioR4thiz9IqVKjmPKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730600970; c=relaxed/simple;
	bh=QMXPC2eOpo3Jv7nP4XuBYYCJtlZoAUC5+94ovKASJd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yg4t9bbVSKrpF6sA5HD1POTb7kuolWPgBsloDYOk1Jdi5kH62MP8bdNVhejhMjbpPdpuASXh6u0fTeDzdUGTzMJcP8NFQgC+/rgXcKGXo7sYtR9NJ60Sg7u0edDUaEBmLqWySDlnuIWBnWZ3jrneWwZQ4TaW+BpVpeVZLnbIad8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlbqElXC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlbqElXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730600968; x=1762136968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QMXPC2eOpo3Jv7nP4XuBYYCJtlZoAUC5+94ovKASJd8=;
  b=LlbqElXCyUKM/BqqCBW5eV8RquyRkMmMf21ReS/kw5ofxLAAjqYS6h7U
   VkadaHFFsm8apptgpO/Iax+CRQEFd4ZYLgnLjbrS6lX0zryAtq9+nd3TT
   6UeNFqW3MfmzzJIktyQ4wszAUiqjNLbR85cpKJpWPSiLxWPGjWGkjuVqs
   frgfMsMfIp/n39yDhqmx39z2inzfla8r9WxrcnTJlIP/a6NuEQ39KpI3f
   f/f7+0BVTuBjw2y1HdS4ZFOpEcWDn/M0/+Hsy6h1Oaf0eOoKs2n9VnDFb
   Trt7RZfBBsYWTmG3MpVqaF0yZUyV6lv3P1CmSl3QvUzwG7KozKYV67bHh
   Q==;
X-CSE-ConnectionGUID: 2BQOad+KTK+btpEsPfVvug==
X-CSE-MsgGUID: mtnuaBmtQCKKqOP1NWVgMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34022902"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34022902"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 19:29:19 -0700
X-CSE-ConnectionGUID: nMUKZCVjS3GFsCcJ08ZDmw==
X-CSE-MsgGUID: b7kcamMTQcyoM2T5Unji2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="83427755"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Nov 2024 19:29:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7QMU-000jbD-0C;
	Sun, 03 Nov 2024 02:29:06 +0000
Date: Sun, 3 Nov 2024 10:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhao <yuzhao@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	James Houghton <jthoughton@google.com>
Subject: [linux-next:pending-fixes 280/352] vmscan.c:undefined reference to
 `pmdp_test_and_clear_young'
Message-ID: <202411031054.wWqBGnZ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   78b16920c1e27980e74f1c84c5e51859ccf6561c
commit: 086e9b056ff6b9311822fa8eaa009d153bddc2e2 [280/352] mm: multi-gen LRU: use {ptep,pmdp}_clear_young_notify()
config: i386-buildonly-randconfig-006-20241103 (https://download.01.org/0day-ci/archive/20241103/202411031054.wWqBGnZ4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031054.wWqBGnZ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031054.wWqBGnZ4-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/vmscan.o: in function `walk_pmd_range_locked.constprop.0.isra.0':
>> vmscan.c:(.text+0x1919): undefined reference to `pmdp_test_and_clear_young'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
