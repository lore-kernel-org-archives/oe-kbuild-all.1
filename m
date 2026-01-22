Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D94B2E0407
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079640; cv=none; b=djOdJlEjCNNhfYs/pEdRh7h0ldfmiaiTa5MsOsNczml9KnOkut1wmPBe85L6YvlkMOmO0OOpUgYm/nKwdbS81WJs/gBvtZggauWrzjtuBohHm3u8L1+9CzuwS41LIHaDTcFu1YfBT3F0M8B+cxY+xUGFKW2YFeFOfVWJZ2J/cqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079640; c=relaxed/simple;
	bh=414em0JwX8mnxT6thkz4YucztIoBgef8eaAQJlCszlE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P3PFCeg8XJ+HOHc2+Eaca27xrmWb4jkrM4qqS9HVYW7vM5FrrvZa5ofc2zyM0t7x+vWe0G54hhxJLyH+B+zvz1dl207gWVntBuUcjFGt90bRXcBWXLeDo6+cHhE25uwOcmhCljhVKNyxIg/IO3DZvujXTjwr0Fxuk0JQYGz/ex4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nruGw1sG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nruGw1sG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769079638; x=1800615638;
  h=date:from:to:cc:subject:message-id;
  bh=414em0JwX8mnxT6thkz4YucztIoBgef8eaAQJlCszlE=;
  b=nruGw1sGipO9SWHdubzVnJ4m1TYhmRXIHoXh3xfRlbXLtD02TIiHW6wp
   yGYs9MqJX964hGUh1qT9r4hF7DMOsL3DT9D5gPDwgdJR66aBajY+GIgKo
   t6V+Fm9xDA6yT8CNWMzrB9oqN9vmZaWTipVMwJRd8AjJu1wy0e8vkjTLS
   M4vvl2LC+MbiArG+HDKvXqnfozWcbHmhKNx5mrCb8TWlIRWqn8VYZoY7i
   znK32CXg4V0Aec+3jaj67z3MwHT5cSVH7G+NgSpy4Kj0wCutSzU+mXdpj
   zqv+BJjgr2j70hkZwsSLP9MDEB/Xa8YmwmWW0rV2KiAQw1uDzB7+Z4Evm
   w==;
X-CSE-ConnectionGUID: e0GVuIXySdWGcA8feznGMQ==
X-CSE-MsgGUID: sHcMfrC1RtCkyxQlcnWPzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87734260"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="87734260"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 03:00:37 -0800
X-CSE-ConnectionGUID: 1KnDKlccQzuBjyj0PhtYag==
X-CSE-MsgGUID: 1hiMTBsxQiG+nr8aEyVOVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="211150202"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2026 03:00:35 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1visQS-000000000UT-2Gnl;
	Thu, 22 Jan 2026 11:00:32 +0000
Date: Thu, 22 Jan 2026 12:00:08 +0100
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 279/310] memory-failure.c:275:49: warning:
 format specifies type 'unsigned long' but the argument has type '__fsword_t'
 (aka 'int')
Message-ID: <202601221142.mDWA1ucw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   dc4fe40a11269aead253fa0beb098b00417b8694
commit: ce9b369feafe8c65aa134b0c8791bf7f19e463e2 [279/310] selftests/mm: add memory failure clean pagecache test
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260122/202601221142.mDWA1ucw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221142.mDWA1ucw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221142.mDWA1ucw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> memory-failure.c:275:49: warning: format specifies type 'unsigned long' but the argument has type '__fsword_t' (aka 'int') [-Wformat]
     275 |                 SKIP(return, "unsupported filesystem :%lx\n", fs_type);
         |                                                       ~~~     ^~~~~~~
         |                                                       %x
   ./../kselftest_harness.h:132:47: note: expanded from macro 'SKIP'
     132 |                  sizeof(_metadata->results->reason), fmt, ##__VA_ARGS__); \
         |                                                      ~~~    ^~~~~~~~~~~
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
