Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED931A841F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 22:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742596218; cv=none; b=SiGZg+AEQJX3Iq7YzBHb9pRQMR/CkYio8EUKqBzsOPnhpctAoLj477+tHECR5vxrYrPFxuVuY+EmVEDAaBBiirizHa9bHWoVJvmq5TUjhmK6I98jDcB6ltCBN0q3T72x8+JYjXnNA85uZPwlC9yECxRzycRUg1EmT+ymwQDnd6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742596218; c=relaxed/simple;
	bh=lZr87N48coA6/icVF2rk4kKeRZ0BA7rOoCMcSiycrOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QTCsOUu99CtwLlap9Z3EI+odpUSxyFJ8RDbHu5Bc/fgXUY/2yaxRi+UcihxrTRiPDpakxQ+OD0N6J7nsxTGeDJOWAnnIIG9CwT/tmQPCrXMH1fzB8AZKMFSvglM5bjyVRqIkKNOKjPfheXYIpiOj5N/ffmSk7O8FNwBDwds+TOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNdzg1vF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNdzg1vF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742596217; x=1774132217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZr87N48coA6/icVF2rk4kKeRZ0BA7rOoCMcSiycrOs=;
  b=lNdzg1vFfeIkq8RymkntZxuTkjKDwmhB2Ai8UUPHkLX4PqgCAWQ4eDEN
   JRaJ0jT/VjDdDRysdEa2Hqo8anCgkGXusXT+eGGEhgFulFaCb80C/ATpi
   8tBzSljYveYnd+r41OE0FdTwXELuUlJnft+BpWS+/Jsyu+wKt4YV7wVbR
   tj1yxqFsad1WwNnGItqECUoUyvjQQhj7tvXs9OQo8vEXh8bZQOdyL1lsA
   9YtIMlT5BFAr+7HChYicHp9Ai7Wfy7Kyk2cPya4fVG4eeL6vh1k+9vOLP
   d2w4TtjKDDhEQwFuRBH4ycMdAjEq+TY2AVGxPP56GgS6sc6QBIPHDOVFr
   g==;
X-CSE-ConnectionGUID: nx1ETIreQGOw+g/vIZrUNw==
X-CSE-MsgGUID: UTwRxVJqRWGLfO6VhIwTtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="66337686"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="66337686"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 15:30:16 -0700
X-CSE-ConnectionGUID: tBavJOKWRRSKi4rJl+TTNQ==
X-CSE-MsgGUID: 2RFCFsvISl23H3AOAyax0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="123227882"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2025 15:30:16 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvksW-0001k1-2m;
	Fri, 21 Mar 2025 22:30:12 +0000
Date: Sat, 22 Mar 2025 06:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-exit-cancel.2 7/7] io_uring/refs.h:56:26:
 warning: overflow in conversion from 'long long unsigned int' to 'long int'
 changes value from '9223372036854775808' to '0'
Message-ID: <202503220605.4IjGXw3X-lkp@intel.com>
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
config: sh-randconfig-001-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220605.4IjGXw3X-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220605.4IjGXw3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220605.4IjGXw3X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.h:16,
                    from io_uring/splice.c:14:
   io_uring/refs.h: In function 'io_ring_ref_kill':
>> io_uring/refs.h:56:26: warning: overflow in conversion from 'long long unsigned int' to 'long int' changes value from '9223372036854775808' to '0' [-Woverflow]
      56 | #define IO_RING_REF_DEAD (1ULL << 63)
         |                          ^~~~~~~~~~~~
   io_uring/refs.h:80:18: note: in expansion of macro 'IO_RING_REF_DEAD'
      80 |  atomic_long_xor(IO_RING_REF_DEAD, &ctx->refs);
         |                  ^~~~~~~~~~~~~~~~


vim +56 io_uring/refs.h

    55	
  > 56	#define IO_RING_REF_DEAD	(1ULL << 63)
    57	#define IO_RING_REF_MASK	(~IO_RING_REF_DEAD)
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
