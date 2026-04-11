Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CE530BB8C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 22:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775946268; cv=none; b=YJtwdd6CsirJZL1da6ZQGhRRutCPjnkDYvjz0MYn5R7K+E5kykz06hs2swNEUBLHkWAh3/iLI9UWu7NR+kQ1AHfcwyGNsDuVKp32EuZCF76RNRiK4p95os12r1w2DLx2cfmv8U7YTBlpYPJMyMsxcliIC2EirMzcjHUbXkvaC5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775946268; c=relaxed/simple;
	bh=PJeJbeIlM+U+J4VdHIO0HVggcYD5iZf5J5b/kttrZQU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nGmGDnAcV4DzJg13a6N1DZ1KHF3MXLPyxrucLZCKNOI0oGVmGdOgdhlnzxLs4a1YaJcc3kGIZt/MavF0UtPdJU/f95Hr1TegBD9/F2O7kOJJp27tHCTv4dC7fQI8t8aJ71beOjCJkvCDHyyxKj18anwTFJeu0uT2UPh3heAPbO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihVOvbCQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihVOvbCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775946266; x=1807482266;
  h=date:from:to:cc:subject:message-id;
  bh=PJeJbeIlM+U+J4VdHIO0HVggcYD5iZf5J5b/kttrZQU=;
  b=ihVOvbCQO+V3uRoL8VCtVYI2tMl1cha7zm1ZpwOHySsLpf1TbBcxjRyu
   wMZ/KuqJEVzeEryxz+Smrgg7TGZFZab7NOqTF4MA/ia70iXreZ7y26mcC
   WnGoi1EGtkDKLVXLr7Bh17HyYZerj+V93qaHa5lr6Kna7LbdtNrcNWsW1
   NT4xkvwpoWn3HUbV+3z2/iC8lfIq+r5iVhiQySMx7lGXNgg1+agIUrtDI
   wFyeDuCaT/hFk5SQi8tjTR3BH0W0SEGxTrrbb9XdlFS0D5e3rFhTOnsc/
   Wfnkto3LLjD+A6mIjbLABBwZU8NWORBtFlDzvBxrzQ+hGj8ufMBFlA7N0
   A==;
X-CSE-ConnectionGUID: amh7THXnROaQNbLwDxQWbA==
X-CSE-MsgGUID: xHDahdISQUSXhYkMz0KMhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76947670"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="76947670"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 15:24:25 -0700
X-CSE-ConnectionGUID: x9e4lhZATPejVxrHjRuPmw==
X-CSE-MsgGUID: fx5QkRf0SPqipkXi3hk0+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="229681566"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2026 15:24:23 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBgkX-00000000B9Z-1LHZ;
	Sat, 11 Apr 2026 22:24:21 +0000
Date: Sun, 12 Apr 2026 00:24:15 +0200
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [bvanassche:thread-safety 95/95] htmldocs:
 Documentation/mm/highmem:211: ./include/linux/highmem.h:222: WARNING: Error
 in declarator or parameters
Message-ID: <202604120025.jtlnpWff-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   834588da5a3bc2696586cdc98024dcebec97aeed
commit: 834588da5a3bc2696586cdc98024dcebec97aeed [95/95] treewide: Build fixes
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260412/202604120025.jtlnpWff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604120025.jtlnpWff-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
   WARNING: ./include/linux/highmem.h:235 function parameter '__maybe_unused' not described in 'clear_user_pages'
   WARNING: ./include/linux/highmem.h:235 function parameter '__maybe_unused' not described in 'clear_user_pages'
>> Documentation/mm/highmem:211: ./include/linux/highmem.h:222: WARNING: Error in declarator or parameters
   Invalid C declaration: Expecting "," or ")" in parameters, got "_". [error at 55]
   void clear_user_pages (void *addr, unsigned long vaddr __maybe_unused, struct page *page, unsigned int npages)
   -------------------------------------------------------^
   Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
