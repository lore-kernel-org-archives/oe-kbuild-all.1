Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44D31750
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 19:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HS84pdhX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701718942; x=1733254942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jr6ZC4QTHiMBOoU079Jyk/SGSEVXDbkp/sLimQ9ENpE=;
  b=HS84pdhXNoymYFlLt8HiXJtJXuf4gWodfRSONBaZ2lQtq3B65Lh07ZdY
   N6ZQOt20pS+fCEguWG+O1O55/Jvpu5JSkgke3oatmWA2TzAUFDVoxA3gz
   mI2rKrLlJhdyhyR0Ps5Yai7JqNQTkC0Naa9tJ+rSNv2aBvpPNCaCdaYL3
   l+HY72CUA72hpdJMfet8Q7d057xebNvQ33uULWu0eDMNzFjD7GzJGyfCC
   dK38+dkNszJO16Agf+95BDFFj+q5AQcaFV0juHswB9ZVG93mLnI6vRcNb
   dgxVZPIRkyH+Er95NvNBkwIIzzTtqyE1ypUUBHHM0Lgtkz8O7L81C4Zsk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="855513"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="855513"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 11:41:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861493062"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="861493062"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 11:41:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAEou-00081v-05;
	Mon, 04 Dec 2023 19:41:34 +0000
Date: Tue, 5 Dec 2023 03:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: io_uring/poll.c:819:40: sparse: sparse: incorrect type in argument 2
 (different base types)
Message-ID: <202312050238.labqn1bV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 063a007996bf725ba4c7d8741701670be9858300 io_uring: change arm poll return values
date:   1 year, 4 months ago
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20231205/202312050238.labqn1bV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312050238.labqn1bV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312050238.labqn1bV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/poll.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/poll.c:222:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t @@
   io_uring/poll.c:222:38: sparse:     expected signed int [usertype] res
   io_uring/poll.c:222:38: sparse:     got restricted __poll_t
   io_uring/poll.c:233:56: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:232:66: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:232:66: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:232:66: sparse:     got unsigned int
   io_uring/poll.c:232:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned short @@
   io_uring/poll.c:232:52: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:232:52: sparse:     got unsigned short
   io_uring/poll.c:236:46: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:236:46: sparse:     expected signed int [usertype] res
   io_uring/poll.c:236:46: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:264:63: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:264:57: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:264:57: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:264:57: sparse:     got unsigned int
   io_uring/poll.c:372:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:372:40: sparse:     expected int mask
   io_uring/poll.c:372:40: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:491:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:491:40: sparse:     expected int mask
   io_uring/poll.c:491:40: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:543:45: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:543:43: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned int @@
   io_uring/poll.c:543:43: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:543:43: sparse:     got unsigned int
   io_uring/poll.c:588:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:588:38: sparse:     expected int mask
   io_uring/poll.c:588:38: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:588:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int events @@     got restricted __poll_t [usertype] events @@
   io_uring/poll.c:588:55: sparse:     expected int events
   io_uring/poll.c:588:55: sparse:     got restricted __poll_t [usertype] events
   io_uring/poll.c:745:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:745:24: sparse:    left side has type unsigned int
   io_uring/poll.c:745:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:747:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:747:24: sparse:    left side has type unsigned int
   io_uring/poll.c:747:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:749:55: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:748:29: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:748:38: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int @@
   io_uring/poll.c:748:38: sparse:     expected restricted __poll_t
   io_uring/poll.c:748:38: sparse:     got unsigned int
>> io_uring/poll.c:819:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [addressable] [assigned] [usertype] result_mask @@
   io_uring/poll.c:819:40: sparse:     expected signed int [usertype] res
   io_uring/poll.c:819:40: sparse:     got restricted __poll_t [addressable] [assigned] [usertype] result_mask
   io_uring/poll.c:873:38: sparse: sparse: invalid assignment: &=
   io_uring/poll.c:873:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:873:38: sparse:    right side has type int
   io_uring/poll.c:874:52: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:874:38: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:874:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:874:38: sparse:    right side has type unsigned int
   io_uring/poll.c:632:24: sparse: sparse: context imbalance in 'io_poll_find' - wrong count at exit
   io_uring/poll.c:661:24: sparse: sparse: context imbalance in 'io_poll_file_find' - wrong count at exit
   io_uring/poll.c:716:28: sparse: sparse: context imbalance in '__io_poll_cancel' - unexpected unlock
   io_uring/poll.c:843:28: sparse: sparse: context imbalance in 'io_poll_remove' - unexpected unlock

vim +819 io_uring/poll.c

   798	
   799	int io_poll_add(struct io_kiocb *req, unsigned int issue_flags)
   800	{
   801		struct io_poll *poll = io_kiocb_to_cmd(req);
   802		struct io_poll_table ipt;
   803		int ret;
   804	
   805		ipt.pt._qproc = io_poll_queue_proc;
   806	
   807		/*
   808		 * If sqpoll or single issuer, there is no contention for ->uring_lock
   809		 * and we'll end up holding it in tw handlers anyway.
   810		 */
   811		if (!(issue_flags & IO_URING_F_UNLOCKED) &&
   812		    (req->ctx->flags & (IORING_SETUP_SQPOLL | IORING_SETUP_SINGLE_ISSUER)))
   813			req->flags |= REQ_F_HASH_LOCKED;
   814		else
   815			req->flags &= ~REQ_F_HASH_LOCKED;
   816	
   817		ret = __io_arm_poll_handler(req, poll, &ipt, poll->events);
   818		if (ret) {
 > 819			io_req_set_res(req, ipt.result_mask, 0);
   820			return IOU_OK;
   821		}
   822		if (ipt.error) {
   823			req_set_fail(req);
   824			return ipt.error;
   825		}
   826	
   827		return IOU_ISSUE_SKIP_COMPLETE;
   828	}
   829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
