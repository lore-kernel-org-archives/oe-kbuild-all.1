Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F63E34E75C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 23:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781220005; cv=none; b=QmTguXpcdlDbUNn5Xh0aU7trvXfzQDQNWW3yPdU5qRbIsiBWkptVrNo1bLjG5TyucA3KPOoS5p/8FbxbmQ8riskqRSIlFH8rlPQ27JKJGAoFvNrtz7YDcu6ETHqpbyVcs0g4OJnx+78sNgwAvFw/BdAMFf2srFjDBDHL1GL7ApM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781220005; c=relaxed/simple;
	bh=kyNiozz2skWP2KQBgDj9lD6k2/OYL/uoQ/exk6nwRe8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tIOSm1fR3X+OglANHxPrqIXoQgi/L2o35QH6qhc2S6pJriaU6y/aKmIdmslhVSc+Jzsyk9NYMTvXwTUUn5bGQAFMkhOlQ/dt+q+PvwjYD1e27i9xPg4PSvLLmYG5gzeBolldDY4Ov0dIf/xVod5vDwN2OwC29MXXi9/Ut02ZLtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOXCPt0U; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOXCPt0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781220003; x=1812756003;
  h=date:from:to:cc:subject:message-id;
  bh=kyNiozz2skWP2KQBgDj9lD6k2/OYL/uoQ/exk6nwRe8=;
  b=DOXCPt0UoMC9jx29DuuxyRqIkjtCrglv/oyaH/rGxZrrGgzAWzp7Zulf
   VjPtu/8sg9+qcjlNhHunH0wdW8r9CDP/kDNbEFrXC3ewSzDILvJ1vrCwm
   maRw3r8p4I2vJMYmqEqlOAwST96IeasW4PtgmzzyQEOsL51OF4SaLxwQy
   exQ/jFiJwjDcvzGSKI1yff893fYpfv8LkG/ZyZs/GLE06dlmdfWaqGfme
   f+Kca8RQq2YWxzghOMwZc9FgY9JCd8zDU5UNmDBN3aS0OoIjxiIZV7VHx
   UwORnIaJYswtj6xQFGYC4brW0lYCWj6KUho6Koo30gdtu5U+a60bVbE8U
   A==;
X-CSE-ConnectionGUID: sQzRUTg1T4eviepXh8Bkag==
X-CSE-MsgGUID: FUisVKTUSpG0f0Ciz5l4Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82091846"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82091846"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 16:20:01 -0700
X-CSE-ConnectionGUID: tCXddRugTXekW7WtUtUE6A==
X-CSE-MsgGUID: Ony4CYz4Tiih1mGz0bhgWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250919993"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 16:20:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXogn-00000000O0F-0XSD;
	Thu, 11 Jun 2026 23:19:57 +0000
Date: Fri, 12 Jun 2026 07:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 38/38]
 include/linux/blkdev.h:1699:24: error: field 'req_list' has incomplete type
Message-ID: <202606120735.PHcFccnr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17584f778119ed93d9ae85feb43561e05f5254b0
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [38/38] UPSTREAM: block: add a rq_list type
config: x86_64-buildonly-randconfig-006-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120735.PHcFccnr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120735.PHcFccnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120735.PHcFccnr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io_uring_types.h:4,
                    from include/linux/io_uring/cmd.h:6,
                    from io_uring/io_uring.c:70:
>> include/linux/blkdev.h:1699:24: error: field 'req_list' has incomplete type
    1699 |         struct rq_list req_list;
         |                        ^~~~~~~~
--
   In file included from include/linux/blk-mq.h:5,
                    from io_uring/rw.c:6:
>> include/linux/blkdev.h:1699:24: error: field 'req_list' has incomplete type
    1699 |         struct rq_list req_list;
         |                        ^~~~~~~~
   include/linux/blk-mq.h: In function 'rq_list_empty':
>> include/linux/blk-mq.h:239:18: error: invalid use of undefined type 'const struct rq_list'
     239 |         return rl->head == NULL;
         |                  ^~
   include/linux/blk-mq.h: In function 'rq_list_init':
>> include/linux/blk-mq.h:244:11: error: invalid use of undefined type 'struct rq_list'
     244 |         rl->head = NULL;
         |           ^~
   include/linux/blk-mq.h:245:11: error: invalid use of undefined type 'struct rq_list'
     245 |         rl->tail = NULL;
         |           ^~
   include/linux/blk-mq.h: In function 'rq_list_add_tail':
   include/linux/blk-mq.h:251:15: error: invalid use of undefined type 'struct rq_list'
     251 |         if (rl->tail)
         |               ^~
   include/linux/blk-mq.h:252:19: error: invalid use of undefined type 'struct rq_list'
     252 |                 rl->tail->rq_next = rq;
         |                   ^~
   include/linux/blk-mq.h:254:19: error: invalid use of undefined type 'struct rq_list'
     254 |                 rl->head = rq;
         |                   ^~
   include/linux/blk-mq.h:255:11: error: invalid use of undefined type 'struct rq_list'
     255 |         rl->tail = rq;
         |           ^~
   include/linux/blk-mq.h: In function 'rq_list_add_head':
   include/linux/blk-mq.h:260:25: error: invalid use of undefined type 'struct rq_list'
     260 |         rq->rq_next = rl->head;
         |                         ^~
   include/linux/blk-mq.h:261:11: error: invalid use of undefined type 'struct rq_list'
     261 |         rl->head = rq;
         |           ^~
   include/linux/blk-mq.h:262:16: error: invalid use of undefined type 'struct rq_list'
     262 |         if (!rl->tail)
         |                ^~
   include/linux/blk-mq.h:263:19: error: invalid use of undefined type 'struct rq_list'
     263 |                 rl->tail = rq;
         |                   ^~
   include/linux/blk-mq.h: In function 'rq_list_pop':
   include/linux/blk-mq.h:268:32: error: invalid use of undefined type 'struct rq_list'
     268 |         struct request *rq = rl->head;
         |                                ^~
   include/linux/blk-mq.h:271:19: error: invalid use of undefined type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;
         |                   ^~
   include/linux/blk-mq.h:271:30: error: invalid use of undefined type 'struct rq_list'
     271 |                 rl->head = rl->head->rq_next;
         |                              ^~
   include/linux/blk-mq.h:272:24: error: invalid use of undefined type 'struct rq_list'
     272 |                 if (!rl->head)
         |                        ^~
   include/linux/blk-mq.h:273:27: error: invalid use of undefined type 'struct rq_list'
     273 |                         rl->tail = NULL;
         |                           ^~
   include/linux/blk-mq.h: In function 'rq_list_peek':
   include/linux/blk-mq.h:282:18: error: invalid use of undefined type 'struct rq_list'
     282 |         return rl->head;
         |                  ^~
--
   In file included from fs/orangefs/inode.c:13:
>> include/linux/blkdev.h:1699:24: error: field 'req_list' has incomplete type
    1699 |         struct rq_list req_list;
         |                        ^~~~~~~~
   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/inode.c:15:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map' defined but not used [-Wunused-const-variable=]
      86 | static const int num_kmod_keyword_mask_map = (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/req_list +1699 include/linux/blkdev.h

  1697	
  1698	struct io_comp_batch {
> 1699		struct rq_list req_list;
  1700		bool need_ts;
  1701		void (*complete)(struct io_comp_batch *);
  1702	};
  1703	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
