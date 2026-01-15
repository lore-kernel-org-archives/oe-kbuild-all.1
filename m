Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526531391
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 09:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468679; cv=none; b=NaxD4f2amioCy6w6e/0SJuyo2FGOdoBo6yene76hsKOsT2jixS5jIofUIivOKIpvsmPtN/PRHig2E6Af38d+VALF+MMy+2b7nsc8xM6v/Zanm57uW1QacYvOKJ9RurIhP2j77cU+ncATx5pDRwLzB4kouHX89a7CxQojybcFd/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468679; c=relaxed/simple;
	bh=2OsHYa+pmnKcYMw0RYRSbMd6ZKzqLkV9R8b9T3bnfXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b8qgc8v/XWA8i0Sw97JCenTvheCHEAUyZvQx9KMNmr3D2tmA4GGm+mnwvX8D8B3zUjfWinxq77x/4OgQAq/vU/SiIPHoH60nX4M5VoCTZeUeNfc5jnqgm4yRBg9P6iErrFtjo646uCVe/JGPQvXTMhnRrJdaWt1ULE0bWtqcMfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3+NI4Gj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3+NI4Gj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768468677; x=1800004677;
  h=date:from:to:cc:subject:message-id;
  bh=2OsHYa+pmnKcYMw0RYRSbMd6ZKzqLkV9R8b9T3bnfXM=;
  b=D3+NI4GjoKrC89Im+fc0rMz9MtqnnZmdoH7cWbA9g+mRbk2SnpHpwWWF
   x9eHwT861N3YLEDwVjj21GBYs4YdDwyKaxJ2UU1MkFuRecLb0wyeyZ859
   5cvV281xlQu4s6p4UJ5dqRBm6t3lDB7hhNMGNxpOvMwfWe9T4Mu4d0x15
   fo3TXu+UouXsQjn/VlRqgXRYJ4ONFgdgCFYLzbJ0kMCL/iPFKEMFopGJS
   jRTCS/c02/B4znsFRUeCGlxP25t+0f7nvPNDquu6MZ9WKIjvVixSEYwK6
   co/JVLBkrbve0dAbONEvega9aIguyrXfJKoPLtdhzd5LAfqmmiv6Fu5aj
   g==;
X-CSE-ConnectionGUID: 80wA++UCSui6VBsriEMPow==
X-CSE-MsgGUID: ow2SNXraTg+IUtt9fzTJkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69829595"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69829595"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 01:17:57 -0800
X-CSE-ConnectionGUID: MyVakSkDS32zouHkYWibuA==
X-CSE-MsgGUID: 4enIZDjYSC2VF8CHXE5LNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="242457604"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2026 01:17:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgJUH-00000000Hn6-0z3U;
	Thu, 15 Jan 2026 09:17:53 +0000
Date: Thu, 15 Jan 2026 17:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-restrictions 15/16] csky-linux-ld:
 io_uring.c:undefined reference to `__io_uring_run_bpf_filters'
Message-ID: <202601151751.WyW3MjO0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions
head:   29ac83fe2b009e9bc007cc44ea21832a904be4fe
commit: 575dae8c0edf27527c2e86d4fce468106bf2c3f9 [15/16] io_uring: add support for BPF filtering for opcode restrictions
config: csky-allnoconfig (https://download.01.org/0day-ci/archive/20260115/202601151751.WyW3MjO0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151751.WyW3MjO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151751.WyW3MjO0-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: io_uring/io_uring.o: in function `io_init_req':
   io_uring.c:(.text+0x46a): undefined reference to `__io_uring_run_bpf_filters'
>> csky-linux-ld: io_uring.c:(.text+0x5a0): undefined reference to `__io_uring_run_bpf_filters'
   csky-linux-ld: io_uring/register.o: in function `io_free_restrictions':
   register.c:(.text+0x8): undefined reference to `io_uring_put_bpf_filters'
>> csky-linux-ld: register.c:(.text+0x18): undefined reference to `io_uring_put_bpf_filters'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
