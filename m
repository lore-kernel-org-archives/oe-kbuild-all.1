Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B561364059
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778223857; cv=none; b=NrsWsN79rwKf5idNSqnfW+K4uY/rjLRr6FhKRAvdiUFpae/r44l1phe8DSRMxK2Eh0Lmc84Z3CWBN33wuerxsqXUsEk9ctSLy6NST5BVvBFMf1CM5WperDWEctoYp6i1Rdt3t8uidxyjXnkx12ayZD1TUpDLo4jVCmvu0o/ZxRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778223857; c=relaxed/simple;
	bh=RkgaVeEKUt0Z3/tNnQf+7cNbovyyOjdUwLDWKy6V2Fs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G68oANt6lSNpR53kXIyr8+rx7RyRRyMTA556xviUGO75fAUIG7va7OUijZs6rlS2O9Wk+12H6ua9GCgR5RsY4s0a6OhPNIzGXedB3znH5ReKrVYSftLE0aeoOGON1B1aW1CVg1oMG8ahYxFSNOj5SgwH6RFHNmTP7qI7qBXAYW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhtdPGlT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhtdPGlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778223854; x=1809759854;
  h=date:from:to:cc:subject:message-id;
  bh=RkgaVeEKUt0Z3/tNnQf+7cNbovyyOjdUwLDWKy6V2Fs=;
  b=FhtdPGlT1T8rwbWcA8pkgSljecj5L2yYyFA649CZNCuiKdwTYDwg6Idh
   YBlov5xdUYAgFmezv9jeze6svMVI8noU3Ye2vKGkV1j/DFEfJPG07xbF/
   xDqDqYSmMafBGehrQjtnHumDMGUYcVztEozoLAI55eyHXh222S371rptx
   quS/w5UXULfGnFgSnQUtdMHx6eMyp7QTBywXBJ3fqNWXaF9j8mzsHYBTE
   4YLGidO2Jd4fwxcN20r7Fm5ET4j59AfjOvIpqjGgKob3w6zibp14Ijaus
   91kTmn07ayrAjOYBtvRXqsXn/a98nZDBQkgV/yypt2eCCKrG4oy0Cw8u7
   g==;
X-CSE-ConnectionGUID: 4h3HClmqSmOJCVJ3zfJQcw==
X-CSE-MsgGUID: BISfj0AGQ0es+dxzRRYDyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79124812"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79124812"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 00:04:13 -0700
X-CSE-ConnectionGUID: dc8DsmHKQhe/oOOVnYB25A==
X-CSE-MsgGUID: XEytIivOT2azkNiHFZotZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="233641072"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2026 00:04:12 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLFFp-000000000ov-1wxF;
	Fri, 08 May 2026 07:04:09 +0000
Date: Fri, 08 May 2026 15:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-io-slots 7/13] csky-linux-ld:
 slot.c:undefined reference to `bio_uninit'
Message-ID: <202605081458.by29CD81-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-io-slots
head:   8cda41fe2d37340341d2ae4bf15368f88b4bd5a2
commit: 61d56c943173f9e6820ff6162d25e8fce26059dc [7/13] io_uring: add IORING_OP_SLOT_RW and wire up slot completion
config: csky-randconfig-002-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081458.by29CD81-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081458.by29CD81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081458.by29CD81-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: io_uring/slot.o: in function `io_slot_submit':
   slot.c:(.text+0x1a0): undefined reference to `submit_bio_noacct_fast'
   csky-linux-ld: io_uring/slot.o: in function `io_free_io_slots':
   slot.c:(.text+0x248): undefined reference to `bio_uninit'
   csky-linux-ld: io_uring/slot.o: in function `io_slot_rw_prep':
   slot.c:(.text+0x320): undefined reference to `submit_bio_noacct_fast'
>> csky-linux-ld: slot.c:(.text+0x330): undefined reference to `bio_uninit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
