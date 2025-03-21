Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A219231C8D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 21:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742593721; cv=none; b=Au072pngjUAwE/9Wo6yl0yGZMqYNLmG/wX+MnNRk8xhzg1hGYDgFAro8A99FvcNDOR41xn5iyqvKwGX2wQPUZTdAwarHmSBanM430uSiHuxYU6GOFA7YV7lp1ddZP73YqPqdwSFGpuIL6Q3KEjNCmfRUFYNNtVp5EmwrhC0By1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742593721; c=relaxed/simple;
	bh=8JZXHmdFpr4fhI/w1/j5IMPRmYAto8wSPNDwdxNMhXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pchCBpFa+T45q/D2GLpSTpFz65OY7qPRWUe3/6JlR1FxdzRPXp0kA5b/C8Fl4U3tatSqoA1AG2bX1iUJtqF/orj9Xis9kDisBl4PnDBF8h3nQFFilClYtNs5/Epz1ESS+CgYmfoxrxQuzxnePtGzDLrh/0xiDM2J6CYmNnI/gCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUw9C9tL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUw9C9tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742593720; x=1774129720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JZXHmdFpr4fhI/w1/j5IMPRmYAto8wSPNDwdxNMhXs=;
  b=ZUw9C9tLA04UT4K5coUF8L6Yly/q96PpKyYWmfPamFX/QAWmHYWNOXvj
   vReMrveNe/o+43oUnEWNyAZVXQZPS58/XOKePD7ANPhEwe5TQ/XKymUXn
   1hrkeA+iHti+UFYLVY/W/mlGXj1a4Z3dnA0DupOBZufWUf1FSAVF/B1sB
   nhbHeSqxwZ0veW3+xtJF6A9pA+hgWtZw7Fg05AkbBOgSTdvRjs0+ASaLV
   DdqV4f4SbLEvrC1LRGyUKHy9zXeL74TM0CHVyAFu+clwOnnKHv4PO+u8V
   ItCOEZfa6rpkZZMhSowrt13sPkeOo2WvQQ0sxKF80XbsIW2X4d2WF3Zau
   w==;
X-CSE-ConnectionGUID: oKySdqi6QXOdHwOQ+Ua2KQ==
X-CSE-MsgGUID: Xun9/ZUXTmmaFdSAH8EA8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54866588"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="54866588"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 14:48:40 -0700
X-CSE-ConnectionGUID: U0NUIN3jQtyqt2wixkZt0Q==
X-CSE-MsgGUID: YendmbbcS++uV3WCHHwQ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="123480762"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2025 14:48:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvkEG-0001i3-1X;
	Fri, 21 Mar 2025 21:48:36 +0000
Date: Sat, 22 Mar 2025 05:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-exit-cancel.2 7/7] io_uring/refs.h:56:26:
 warning: overflow in implicit constant conversion
Message-ID: <202503220536.Ea2B1cxY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-exit-cancel.2
head:   a1a70bee1b2c37bb587ad61d479cab938c861a75
commit: 153b8b496f7892d39c356d0f94f4ffaa7159e9f8 [7/7] io_uring: switch away from percpu refcounts
config: arm-randconfig-001-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220536.Ea2B1cxY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220536.Ea2B1cxY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220536.Ea2B1cxY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.h:16:0,
                    from io_uring/net.c:13:
   io_uring/refs.h: In function 'io_ring_ref_kill':
>> io_uring/refs.h:56:26: warning: overflow in implicit constant conversion [-Woverflow]
    #define IO_RING_REF_DEAD (1ULL << 63)
                             ^
   io_uring/refs.h:80:18: note: in expansion of macro 'IO_RING_REF_DEAD'
     atomic_long_xor(IO_RING_REF_DEAD, &ctx->refs);
                     ^~~~~~~~~~~~~~~~


vim +56 io_uring/refs.h

    55	
  > 56	#define IO_RING_REF_DEAD	(1ULL << 63)
    57	#define IO_RING_REF_MASK	(~IO_RING_REF_DEAD)
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
