Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C23F4C33C4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 21:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889587; cv=none; b=CFSh+Zl/SRT+M+9psm7pAFw5yBK/8Z/K6f598pAjcu2PNySIEumxl04TugwDnCIRO7GWXT4TrX1pH4gI6/eu2rnt7BW7xD5D8mqYv35IWnSUUm5sGkDgZ/cVHEA5jzqiShBQ2hzn3l76eTR3BD3Xo1uSOd1r6AZJw7T3ntWEwBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889587; c=relaxed/simple;
	bh=CuHqzwIM7LB5pVTeZEEs+BM8WKLUa3jOHJt6TnpI9FU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Paz60TfMJyy8IXuveOl4omBM0UG+Acv92co4yVPiDVlRKkSa9ruViom07sPOQm4gOfUHSNhu/f8jZirokoZygks7uPZQVORNcKrR0KI2WHCLf0vlD/X/xhdt0B0u806mhUNZx/RD5oCDaTLs5FW5ylsJWLFkbdR9KROvl3yyvvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsGLcIID; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsGLcIID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790889585; x=1822425585;
  h=date:from:to:cc:subject:message-id;
  bh=CuHqzwIM7LB5pVTeZEEs+BM8WKLUa3jOHJt6TnpI9FU=;
  b=AsGLcIID6nLDEzkg4YyMeBLIkMhQKwLpek42wphAVUa0P83itKt11Tzi
   VuowlkdQS6uCSr4E2c8Y/S0gbNK4acb0kr8HLa8NjlTlHBLzAyXX+Gjn7
   3hOh7SQx1aADd+4kw3NDIoDI4Eyt4kPmE1G5jzHz3q9m4VcXJn17xNtNV
   tn8yB2zQiKBlndQXXwFi+D4YqCsfnGB5yxWlhJ0yz0nclS223BxL6d4z7
   KfUFqJ6LGpEmzcflHP8PgYRPBfn/RbVz813maj/thbr+2HcXryhvFk5gM
   MHy9sp0Uu25Pp2BJpxPA1eOYVtiInmSDnvbE5YzN2lFfuYI++VAHmdDN4
   g==;
X-CSE-ConnectionGUID: aoLutLyLQVyXU4wy9wyULw==
X-CSE-MsgGUID: xaamkP1ES7CKe1t6RHcSkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94373355"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="94373355"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 14:19:42 -0700
X-CSE-ConnectionGUID: VbfUw0NUTy27dwTHkCzb4g==
X-CSE-MsgGUID: sH/5PrwpSuuz4WPv7J3/Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="276197165"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2026 14:19:39 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCOBl-00000000SNv-263E;
	Thu, 01 Oct 2026 21:19:37 +0000
Date: Fri, 02 Oct 2026 05:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jann Horn <jannh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/urgent 1/1] undefined reference to
 `futex_mm_init'
Message-ID: <202610020501.bKHR1IPb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/urgent
head:   fcbe4307bda074abc8132bfe746eeb0e502d74ab
commit: fcbe4307bda074abc8132bfe746eeb0e502d74ab [1/1] futex: Fix mm reuse handling for FUT_OFF_MMSHARED
config: parisc-randconfig-1000-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020501.bKHR1IPb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020501.bKHR1IPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020501.bKHR1IPb-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/fork.o: in function `mm_init.isra.0':
>> (.text+0x2964): undefined reference to `futex_mm_init'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
