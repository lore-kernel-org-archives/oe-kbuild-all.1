Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DAC2DC77B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 03:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983254; cv=none; b=izCqVFzfoWnCJgQ0zqAYhkS7fs8vuAVmMJcUbIzJSXD0/TzWGmfzP0piKun9TldP1KuOQb4LFN08aj4y448aTwwqfy7ISR1pQj6qNSrkuhpYngQHcbyQG7IGHKGZJkiujJRTzeOfjHM5PZ0dj+Mjnp60B76PjCgJzVxIiV14Coo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983254; c=relaxed/simple;
	bh=ahPLIYEHUIQgogVgQJzQ53A6Cfji+iOOe80AvCQLoGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ntfIZyLebeM3o8cxsUHh6ldLJR9wVakL7vHw3aA7qgjES1Ms92v6K+lbtV5T4ll2YNw/1I1Otf45omITXOlIUyIdM15T3l49PaSxFh6R7azSCIJv+4J3GAzflKAXYW4l+ZSNv1Ec+ldDkmOG+BqXw0L9WTZF/+ImmjKTvKT6dDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ik+JI3zV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ik+JI3zV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745983253; x=1777519253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahPLIYEHUIQgogVgQJzQ53A6Cfji+iOOe80AvCQLoGc=;
  b=Ik+JI3zVRKdo1injspwND42+rhS24fs7qNpYDIXpdK5DRRGYDDxFvuMv
   8UPZepQ4UsXXLZ68nFGQEjjZE5sGrrlXxNxiZeFWop9Ff/DwJYAWPyppJ
   YkubmWTmz40eaMcr+6zOwbk1ii3n4iAqHyYwmGsKsYooVioqBoX94gQBg
   bhyHB62XzopDBpD/RL2TcvVRTdgLFUNH23T7LsiFyl0redw/2Jyi0Ci/2
   dzgRk1TFKt/DtUVk8J4Igh8/ICFXG/Rxjs0yYCBVCZNHcpuDyenYzjhsa
   3XDVQBH09DkUtISOST/hKEWLgq6TIhZUEu11ob+BoSpSWv9sM7XWOZ0Za
   g==;
X-CSE-ConnectionGUID: d0/SJ2BZT3eqqWAQxheBnQ==
X-CSE-MsgGUID: ABFJUeW6TemNx2KwXptsHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58263089"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="58263089"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 20:20:52 -0700
X-CSE-ConnectionGUID: 8dtEZmTkRnau9x44VDQa7w==
X-CSE-MsgGUID: YqHHbZOITLmvRAEZjXfviQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133941320"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2025 20:20:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9y08-00038D-1d;
	Wed, 30 Apr 2025 03:20:48 +0000
Date: Wed, 30 Apr 2025 11:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-handle 5/5] /usr/bin/ld:
 io_uring/openclose.c:568: undefined reference to `may_decode_fh'
Message-ID: <202504301152.cksCdVGz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-handle
head:   545e6e52fadd5e04524e00f23b59635496318716
commit: 545e6e52fadd5e04524e00f23b59635496318716 [5/5] io_uring: add support for IORING_OP_OPEN_BY_HANDLE
config: um-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301152.cksCdVGz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301152.cksCdVGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301152.cksCdVGz-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: io_uring/openclose.o: in function `__io_open_by_handle':
   io_uring/openclose.c:509: undefined reference to `do_handle_to_path'
   /usr/bin/ld: io_uring/openclose.o: in function `io_open_by_handle':
   io_uring/openclose.c:560: undefined reference to `get_path_from_fd'
>> /usr/bin/ld: io_uring/openclose.c:568: undefined reference to `may_decode_fh'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
