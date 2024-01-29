Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1936F52F91
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706523321; cv=none; b=uX6PLP3dMnCWlbswOV40aRJFNtORzMHXPIyPCCWYuAcSjhe9XBlgt4zeVJZCUBzah6kjn3hNCeFD91q1pG1UYpUxc/UJizPx20IQ1UEWwmk4sYX7dWjyx21iOOzl8jBPAJNRUQsJGiiHrIarus5Ov4ZPbQUwYgG7CxCXk6BWS7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706523321; c=relaxed/simple;
	bh=uSOOfEGamrGbQoQDwpQdO7OY6A4M3+mQD2NpDW4uQ54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dbq+DW52CLbbDV7GDs+oj65Wv5cNJOfs04xjdA85yYoQklvT/cpSaHBDLVMZO/ii/tDG4w/8/90jSvyIVpHCcQOmLcRJ8bd0mG6Q9MRPCGSiJwDHyT1WKudPxiCGN0jpeh72mC41EAR3TBBkUBW1NzUJpG3mQOcOLZ1kwuTzP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVWkgpkk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVWkgpkk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706523318; x=1738059318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uSOOfEGamrGbQoQDwpQdO7OY6A4M3+mQD2NpDW4uQ54=;
  b=DVWkgpkkiyY8MB7tbZSPG8kGvkf4LRQ8ZyujV5sdM9vZHc/jchvz5br1
   Dr2UEIzPAIqjZY95MzMRCrMjBawdHBV4YVZI+DTIXnRiLwAhct/ZgcfEE
   yVLE1IgffTnYUnYr1Kf0Y6/HPd8B1962wiU9Ernkz01/9PZxKLVy76vyw
   drC2K7m1ObcDuXDnOFm2VtnbWXbZOtCaA5/zElHN24yE/LWtr9431vxGV
   hBSEaXQ8PN969fDKHp0ZH6aTR8rq6dubgGuZu8d1iKqlmAu54PTtE7d0M
   DK0J+1InSSh/tdsrLr4gbJMe2AX6X+9e1ICK9ZzDedMy0CG0aixhZBEHd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2773502"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2773502"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 02:15:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3321863"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jan 2024 02:15:16 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUOfZ-0004Ds-2o;
	Mon, 29 Jan 2024 10:15:13 +0000
Date: Mon, 29 Jan 2024 18:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:for-6.9/io_uring 7/8] io_uring/net.c:657:33: error: too
 many arguments to function 'io_poll_multishot_retry'
Message-ID: <202401291832.vYCWSykL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.9/io_uring
head:   57c7dda62e7e44cc6e3d89488dcaf9a0f491339c
commit: bc525bf2233d3f5c1f6845686a318d5d4086b229 [7/8] io_uring/net: use io_poll_multishot_retry() to avoid extra receive
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240129/202401291832.vYCWSykL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291832.vYCWSykL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291832.vYCWSykL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from io_uring/net.c:2:
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/io_uring_types.h:538:35: note: in expansion of macro 'BIT'
     538 |         REQ_F_CAN_POLL          = BIT(REQ_F_CAN_POLL_BIT),
         |                                   ^~~
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   include/linux/io_uring_types.h:540:35: note: in expansion of macro 'BIT'
     540 |         REQ_F_CANCEL_SEQ        = BIT(REQ_F_CANCEL_SEQ_BIT),
         |                                   ^~~
   io_uring/net.c: In function 'io_recv_finish':
>> io_uring/net.c:657:33: error: too many arguments to function 'io_poll_multishot_retry'
     657 |                                 io_poll_multishot_retry(req, issue_flags);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from io_uring/net.c:19:
   io_uring/poll.h:31:20: note: declared here
      31 | static inline void io_poll_multishot_retry(struct io_kiocb *req)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/io_poll_multishot_retry +657 io_uring/net.c

   626	
   627	/*
   628	 * Finishes io_recv and io_recvmsg.
   629	 *
   630	 * Returns true if it is actually finished, or false if it should run
   631	 * again (for multishot).
   632	 */
   633	static inline bool io_recv_finish(struct io_kiocb *req, int *ret,
   634					  struct msghdr *msg, bool mshot_finished,
   635					  unsigned issue_flags)
   636	{
   637		unsigned int cflags;
   638	
   639		cflags = io_put_kbuf(req, issue_flags);
   640		if (msg->msg_inq && msg->msg_inq != -1)
   641			cflags |= IORING_CQE_F_SOCK_NONEMPTY;
   642	
   643		if (!(req->flags & REQ_F_APOLL_MULTISHOT)) {
   644			io_req_set_res(req, *ret, cflags);
   645			*ret = IOU_OK;
   646			return true;
   647		}
   648	
   649		if (!mshot_finished) {
   650			if (io_fill_cqe_req_aux(req, issue_flags & IO_URING_F_COMPLETE_DEFER,
   651						*ret, cflags | IORING_CQE_F_MORE)) {
   652				io_recv_prep_retry(req);
   653				/* Known not-empty, loop again */
   654				if (cflags & IORING_CQE_F_SOCK_NONEMPTY)
   655					return false;
   656				if (issue_flags & IO_URING_F_MULTISHOT) {
 > 657					io_poll_multishot_retry(req, issue_flags);
   658					*ret = IOU_ISSUE_SKIP_COMPLETE;
   659				} else {
   660					*ret = -EAGAIN;
   661				}
   662				return true;
   663			}
   664			/* Otherwise stop multishot but use the current result. */
   665		}
   666	
   667		io_req_set_res(req, *ret, cflags);
   668	
   669		if (issue_flags & IO_URING_F_MULTISHOT)
   670			*ret = IOU_STOP_MULTISHOT;
   671		else
   672			*ret = IOU_OK;
   673		return true;
   674	}
   675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
