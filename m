Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B90C14D2B2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 12:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725797354; cv=none; b=W5dpJZC3d+pNaiEUwU3fuw3Z31ZIVNAjyUW7MGHdSYP5n9ITUSOffddwIulOvJ0fhPlT0xNy/gKvPN0RIfDK6vajaolwlNgUgh0a5tYofbGYmz3qvUYIFm3D3ua94i/WOnrjrMiehMsoRfYnksVRDcesKU4z+edy8ipbXT6T6fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725797354; c=relaxed/simple;
	bh=7aTt9deB0bUQjGqPFdnilBucNJk3412JATnOJJ0rKCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RrcJGaD1m+mgxuqls1qnxuB2yT/AuYR+4jxPPKMnszFskF1PE/AZ/CqEkBN++stn8QxFX91V5Hyaht2S0B2pFlq2cQ/ccOMtOhTRCPrTYNqIW+W9/Siqm93KJPEnBaybix4S3XUxwfhbiguMZZGKjteLBskxnjBA2XHFWppBhq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACK8BkQ6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACK8BkQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725797351; x=1757333351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7aTt9deB0bUQjGqPFdnilBucNJk3412JATnOJJ0rKCo=;
  b=ACK8BkQ6rhHtIVaiDWDp0WIpbUMgc0KGjzoa3uIIf4wkQ9cQVA+w/+dd
   LmzywWRe6u4F2RmmLQplFJsRTnAkctUk2lU2Vy0sRMWl0pmAZADYt76GR
   XxbvQFOu3Qk22g1ruxbRE5VFdtcnJaP+F0WtjfSM5QTquTIYZ+HFx4Ve5
   V67F7WtOYyOlRIgjoK1QHp/VfNzKLR9f3JKodKa86NfHmN9zdYa0nGanM
   akjrjNCRoNg6JypnKRlJQh8VVOdnKLSWPoaldxZ8Ytc5f333+rdmA6fLA
   ksadujT0Op6JS8I6SjV0jdnOToyc4nprrCZl/mND3xUOoqQvWgAR6KXL0
   g==;
X-CSE-ConnectionGUID: IkUsfgftSiu5z6y18n2yZg==
X-CSE-MsgGUID: 9FAfMpmwS9uv8nKVNSq7PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="27419417"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="27419417"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 05:09:10 -0700
X-CSE-ConnectionGUID: O449ENtnT0OGSvyVHZkglg==
X-CSE-MsgGUID: W0fnMHhwSFuOgCkA1SpxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="89671565"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2024 05:09:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snGj5-000DVH-21;
	Sun, 08 Sep 2024 12:09:07 +0000
Date: Sun, 8 Sep 2024 20:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: io_uring/eventfd.c:80:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 81.
Message-ID: <202409082039.hnsaIJ3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d1f2d51b711a3b7f1ae1b46701c769c1d580fa7f
commit: 200f3abd14db55f9aadcb74f4e7a678f1c469ba1 io_uring/eventfd: move eventfd handling to separate file
date:   3 months ago
config: hexagon-randconfig-r054-20240908 (https://download.01.org/0day-ci/archive/20240908/202409082039.hnsaIJ3X-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409082039.hnsaIJ3X-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/eventfd.c:80:5-24: WARNING: atomic_dec_and_test variation before object free at line 81.
   io_uring/eventfd.c:154:6-25: WARNING: atomic_dec_and_test variation before object free at line 155.

vim +80 io_uring/eventfd.c

    43	
    44	void io_eventfd_signal(struct io_ring_ctx *ctx)
    45	{
    46		struct io_ev_fd *ev_fd = NULL;
    47	
    48		if (READ_ONCE(ctx->rings->cq_flags) & IORING_CQ_EVENTFD_DISABLED)
    49			return;
    50	
    51		guard(rcu)();
    52	
    53		/*
    54		 * rcu_dereference ctx->io_ev_fd once and use it for both for checking
    55		 * and eventfd_signal
    56		 */
    57		ev_fd = rcu_dereference(ctx->io_ev_fd);
    58	
    59		/*
    60		 * Check again if ev_fd exists incase an io_eventfd_unregister call
    61		 * completed between the NULL check of ctx->io_ev_fd at the start of
    62		 * the function and rcu_read_lock.
    63		 */
    64		if (unlikely(!ev_fd))
    65			return;
    66		if (!atomic_inc_not_zero(&ev_fd->refs))
    67			return;
    68		if (ev_fd->eventfd_async && !io_wq_current_is_worker())
    69			goto out;
    70	
    71		if (likely(eventfd_signal_allowed())) {
    72			eventfd_signal_mask(ev_fd->cq_ev_fd, EPOLL_URING_WAKE);
    73		} else {
    74			if (!atomic_fetch_or(BIT(IO_EVENTFD_OP_SIGNAL_BIT), &ev_fd->ops)) {
    75				call_rcu_hurry(&ev_fd->rcu, io_eventfd_do_signal);
    76				return;
    77			}
    78		}
    79	out:
  > 80		if (atomic_dec_and_test(&ev_fd->refs))
  > 81			call_rcu(&ev_fd->rcu, io_eventfd_free);
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
