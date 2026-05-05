Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C237348C3F4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998553; cv=none; b=s5BVp0wUO+55JVg01hRcLVXydBgW2yyMLLo914Isg1UyHOaGhJE+SijMG06t6Co+hFi55O1I2ha+23NTou0acx12WAzH/Ajn4AxeXmez5uNqMmHcnbhz+zL7gdFT8+9P+CKbXMLZnxNJQxBeWYLhYVnoncWXmoorLRlg/i8749U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998553; c=relaxed/simple;
	bh=NVnbyFs3CnUyMuTQ8Vecoxy29evpMxQk6NGsB3yP2gY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G2bpTZLDdTGMzFN2FoUoADZUq4dFgKoqROeL4lDvAuwIGyEpxEmCMxR+vM0vz0pceOFGclAcrqmp2ft/VPWQr1MxyaPrEPJHEKL5bnb/QYUF8BXaSC2FD9kNPioa0Tx7nlaIrQ4uW8Y3DS/Gna6TJEFerTd5gwkYWg3ydKs4BS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJXyYFZA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJXyYFZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777998552; x=1809534552;
  h=date:from:to:cc:subject:message-id;
  bh=NVnbyFs3CnUyMuTQ8Vecoxy29evpMxQk6NGsB3yP2gY=;
  b=iJXyYFZAuWrfM/uCQyX7Rc0uR8BDZ2guX95up3PImVLCvSJIOWbOpxqJ
   x0H2rLPmjL75WIY1l0LzZCTc2WtrZL9Bnd1TAMxw+GNB1YkpU8FXE8NlF
   RZQWd8esoLUcJOu8Gmes+u705q3f+rwacyqodNPgXSLnfqK/ATrX3BD0d
   9UPepXwoi3HMucdQ2gwenqqrY5c8ETuWFRgOpacoU+s3us6SDf/Nd2Gv9
   d4UVU2Hg3yGbSdhNWKDGKmGGcZmAcLoaF+DHZk52fHmxyCW6RoLLiTUm6
   bQp7ubhRJDq+uEq/fRdCdiFiI1IADoWZDdxaT1VdswElSFNJU7qcsjlt1
   w==;
X-CSE-ConnectionGUID: G7JglnRxSDyGSi2D6P9Sfw==
X-CSE-MsgGUID: XUHU9bHNTRq+gLbTRN5l4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="81437142"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="81437142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 09:29:08 -0700
X-CSE-ConnectionGUID: 3eMQNQgfS/WtXrIVeoRh6Q==
X-CSE-MsgGUID: dL8YhVHDSz6bLSJAO2D8RQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2026 09:29:07 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKIdt-000000000Hh-0UVD;
	Tue, 05 May 2026 16:29:05 +0000
Date: Wed, 06 May 2026 00:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 0/1]
 include/linux/blkdev.h:1699:24: error: field 'req_list' has incomplete type
Message-ID: <202605060021.ly4IuNta-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   b05074e46084d318919a38ca8753717a88f33277
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [0/1] UPSTREAM: block: add a rq_list type
config: i386-buildonly-randconfig-001-20260505 (https://download.01.org/0day-ci/archive/20260506/202605060021.ly4IuNta-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060021.ly4IuNta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060021.ly4IuNta-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io_uring_types.h:4,
                    from io_uring/io_uring.h:9,
                    from io_uring/splice.c:14:
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
