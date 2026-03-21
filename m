Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0109840DFAC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 02:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774060495; cv=none; b=PXifZ3SIV8vlwyInrixaLx6RO2n4pcRIGIliXOWuat8RkADmbhpG9Z/KZRNqcL88d0A9w7djqDMaC4G664kgibQF53O6YFbAqs9VVJgtovx8J3enFuKad8IHtz4tVhes0NQPu3ajia19LFysGtt5UNFtVwBPz9j9bnF1badbx1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774060495; c=relaxed/simple;
	bh=4rlyY9C75uqg5g8E+Fn/nIluEnDFY20ZEhVpzZ5dGkU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AUZjyLdAFK9Xnuervqs+r6HxFQqUIPseVnUAKo8934NDJriJvC0hbN9wzDLNuFkaK5/Itp/Mpaf83e/SauQxgUCWFF4ubHg4gwWCfcjlYlYd10NZz8d0UVubEdSk4gx0fhTkJo0gBiL37KEX+pDcf1xB3FX+30XjzXWGmX3l4Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2bC9ZI8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2bC9ZI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774060494; x=1805596494;
  h=date:from:to:cc:subject:message-id;
  bh=4rlyY9C75uqg5g8E+Fn/nIluEnDFY20ZEhVpzZ5dGkU=;
  b=F2bC9ZI8VqJV5TTftWvtUO2OqQ045alWZliRGBDurCPur0YmwkCgR9xP
   FOz8wjpvg3YRz37eRlp6Y0+OBhVokdy819F7wI3sbDeNw00G4YelF0rzF
   B7Mf8KVVOx3/XkkKUaqJ2rotIF2JaOlD8ScQXWfYQo1OCIlLRSpfDDQxK
   CLwmvWhkIB7s5W2pmFtgoNZZAQBZlqn5NGX5NlhMcQaRUlApcU99t5luo
   w47lPydFdmZcXv8p+pM/9m7B6ol0q+RUn29DEQYQdfuk2w8YWElPnRrpM
   mLIo6qG/F7U3V4fB+Rrp8Wn+w9BTSH4O6q9u7H9+lCSMHmikBLf26kxkZ
   g==;
X-CSE-ConnectionGUID: Ah1qkz11Q8eAphDeG2dBwg==
X-CSE-MsgGUID: o43XiSPNTYCc03f155XdWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="77756172"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="77756172"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 19:34:53 -0700
X-CSE-ConnectionGUID: ukhpyTZ8QASrpd1utdKURQ==
X-CSE-MsgGUID: iLITr6QOTIGxJyW3x3uj+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="223499154"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 20 Mar 2026 19:34:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3mAr-000000005NF-1d3n;
	Sat, 21 Mar 2026 02:34:49 +0000
Date: Sat, 21 Mar 2026 03:34:21 +0100
From: kernel test robot <lkp@intel.com>
To: Chris Down <chris@chrisdown.name>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [akpm-mm:mm-unstable 433/449] vm_util.c:133:14: error: too
 many arguments to function 'pagemap_scan_supported'
Message-ID: <202603210319.P5MPyTEf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   28edd9c5a25ceb76c2d4e55bc5c37acd7eb0fc92
commit: 6fa1bf6b010deb50b35d2b2a7c97e7e229f2747e [433/449] selftests/mm: add UFFDIO_MOVE huge zeropage PMD regression test
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260321/202603210319.P5MPyTEf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210319.P5MPyTEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210319.P5MPyTEf-lkp@intel.com/

Note: the akpm-mm/mm-unstable HEAD 28edd9c5a25ceb76c2d4e55bc5c37acd7eb0fc92 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   vm_util.c: In function 'pagemap_is_huge_zero':
>> vm_util.c:133:14: error: too many arguments to function 'pagemap_scan_supported'
     133 |         if (!pagemap_scan_supported(fd, start))
         |              ^~~~~~~~~~~~~~~~~~~~~~
   vm_util.c:70:13: note: declared here
      70 | static bool pagemap_scan_supported(int fd)
         |             ^~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
