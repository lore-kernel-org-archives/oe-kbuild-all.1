Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F4F1863E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 05:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738561058; cv=none; b=baMSjQ6iVg2kVTRUduUelySYBX0+DXDCxoJfy+eLQ+YryNUPSAPTL0Ihozr1YHFOCTSYwamSXWqq0mqD8CNlK/VSGH8Kg8Ny8qXfyicFbexXe9rWegzweUe6uxP5rMXMFs9/laDOa/FF9fzaVbUGj5yMoJYlSgYpMi3Aw6ofc+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738561058; c=relaxed/simple;
	bh=Ce975bCt1Kg9VBVHoeY8S7z5xozu6G6mWvaPnGn60w8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aAMGpa4u4AYT4lCyPqguNNcawcGRGvXcY2RCavWAP6WxGopjVLABeAo7DALM15u1jFgAhkRDrvLfelNW/yoQku/E/KLs0by770mNEuss1OhVu34V1bjqR7Gz2B+HIM4AQMfQ6sG4JPPdVw2emhtk+0Aqpv25H+JQ6O7ZlkVsScA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMGjnOiw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMGjnOiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738561055; x=1770097055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ce975bCt1Kg9VBVHoeY8S7z5xozu6G6mWvaPnGn60w8=;
  b=lMGjnOiwPfUxH/Q3qdwq45COQ/NXjx48jXbdutbbgfgmNM1pruOkEOpp
   JAxWRQlzc5Mfnu0J2CycmfiRbva6wNAGKNYdCFtGZumFQnpA4Tk/zcUb/
   c0YuTH/0rED913XSrz3UNmtVj7Y9t2JKuhW9Xh7Xm/tInK4/xgcRmZnEQ
   ffbrKqYfGqr/YCEKxDNlloNPbsDQSZ5lB9gFreTyovr3xcC3G/fjk+NQK
   9NHDbXDFquc7rNhBMSnvsXjbMhg87dguR/ddyiaKrnCBsjWlHlun3EfAu
   0NmiG/MLzYD9s13NBJ/cHqUCawbahhy6ZfT3bDBTtcN/brgLue1VIFJzk
   w==;
X-CSE-ConnectionGUID: 7x2ff9wqT+qv6rxN/QlVeg==
X-CSE-MsgGUID: 0/YRghqaTIi7nGhfCZYdAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39198698"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39198698"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 21:37:34 -0800
X-CSE-ConnectionGUID: YUTwJbN1TAakt2YDZmxvBw==
X-CSE-MsgGUID: t0W+AqzcS/qYoOrz5o9RcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110022302"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Feb 2025 21:37:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tep9G-000qVp-1u;
	Mon, 03 Feb 2025 05:37:30 +0000
Date: Mon, 3 Feb 2025 13:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:io_uring-epoll-wait 7/19] io_uring/io_uring.c:1738:13:
 sparse: sparse: incorrect type in argument 2 (different base types)
Message-ID: <202502031320.DZlRA8I8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-epoll-wait
head:   dff827d5593e33dfd47726bd236282dd8e4fff9a
commit: 8724e0be28a42db3938e7d1c42bbac51864feb7e [7/19] io_uring: cache io_kiocb->flags in variable
config: csky-randconfig-r113-20250203 (https://download.01.org/0day-ci/archive/20250203/202502031320.DZlRA8I8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250203/202502031320.DZlRA8I8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031320.DZlRA8I8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
   include/linux/io_uring_types.h:191:37: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:1723:25: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.c:1738:13: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int req_flags @@     got restricted io_req_flags_t const [usertype] req_flags @@
   io_uring/io_uring.c:1738:13: sparse:     expected unsigned int req_flags
   io_uring/io_uring.c:1738:13: sparse:     got restricted io_req_flags_t const [usertype] req_flags
   io_uring/io_uring.c:1810:31: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int req_flags @@     got restricted io_req_flags_t const [usertype] req_flags @@
   io_uring/io_uring.c:1810:31: sparse:     expected unsigned int req_flags
   io_uring/io_uring.c:1810:31: sparse:     got restricted io_req_flags_t const [usertype] req_flags
   io_uring/io_uring.c:1818:34: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int req_flags @@     got restricted io_req_flags_t const [usertype] req_flags @@
   io_uring/io_uring.c:1818:34: sparse:     expected unsigned int req_flags
   io_uring/io_uring.c:1818:34: sparse:     got restricted io_req_flags_t const [usertype] req_flags
   io_uring/io_uring.c:609:36: sparse: sparse: context imbalance in 'io_req_post_cqe' - unexpected unlock
   io_uring/io_uring.c:611:17: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block
   io_uring/io_uring.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:175:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:175:41: sparse:     expected struct cred const *old
   include/linux/cred.h:175:41: sparse:     got struct cred const [noderef] __rcu *cred
   include/linux/cred.h:183:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *override_cred @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:183:51: sparse:     expected struct cred const *override_cred
   include/linux/cred.h:183:51: sparse:     got struct cred const [noderef] __rcu *cred
   io_uring/io_uring.c:468:34: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int req_flags @@     got restricted io_req_flags_t [usertype] flags @@
   io_uring/io_uring.c:468:34: sparse:     expected unsigned int req_flags
   io_uring/io_uring.c:468:34: sparse:     got restricted io_req_flags_t [usertype] flags
   io_uring/io_uring.c:462:13: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/io_uring.c:462:13: sparse: sparse: restricted io_req_flags_t degrades to integer

vim +1738 io_uring/io_uring.c

  1730	
  1731	static int io_issue_sqe(struct io_kiocb *req, unsigned int issue_flags)
  1732	{
  1733		const io_req_flags_t req_flags = req->flags;
  1734		const struct io_issue_def *def = &io_issue_defs[req->opcode];
  1735		const struct cred *creds = NULL;
  1736		int ret;
  1737	
> 1738		if (unlikely(!io_assign_file(req, req_flags, def, issue_flags)))
  1739			return -EBADF;
  1740	
  1741		if (unlikely((req_flags & REQ_F_CREDS) && req->creds != current_cred()))
  1742			creds = override_creds(req->creds);
  1743	
  1744		if (!def->audit_skip)
  1745			audit_uring_entry(req->opcode);
  1746	
  1747		ret = def->issue(req, issue_flags);
  1748	
  1749		if (!def->audit_skip)
  1750			audit_uring_exit(!ret, ret);
  1751	
  1752		if (creds)
  1753			revert_creds(creds);
  1754	
  1755		if (ret == IOU_OK) {
  1756			if (issue_flags & IO_URING_F_COMPLETE_DEFER)
  1757				io_req_complete_defer(req);
  1758			else
  1759				io_req_complete_post(req, issue_flags);
  1760	
  1761			return 0;
  1762		}
  1763	
  1764		if (ret == IOU_ISSUE_SKIP_COMPLETE) {
  1765			ret = 0;
  1766			io_arm_ltimeout(req);
  1767	
  1768			/* If the op doesn't have a file, we're not polling for it */
  1769			if ((req->ctx->flags & IORING_SETUP_IOPOLL) && def->iopoll_queue)
  1770				io_iopoll_req_issued(req, issue_flags);
  1771		}
  1772		return ret;
  1773	}
  1774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
