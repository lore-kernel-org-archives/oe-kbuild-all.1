Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FC41A0BE0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Jul 2025 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752419395; cv=none; b=jVa8W5RuFCtEv9qpEcTgBxZP4qzqRK9K62lMshfxYxSp97jng2j+bsHB6QHpUNZbpWwpDzBHfttqEEHNL8wjiJ0vuEwM4M1D1PRFMqcO92L/2TVhQHP69bElBY0ROody2se/wpA/uGT2fMNGNfmsSvmRE7Yi97hEwJ6EUGBSyXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752419395; c=relaxed/simple;
	bh=Oa09N/ry1ckVzryPS9QG24FnqPDUOkjoRVFV1Bb36q8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lLd0Ti/sQABfGCRBuKT3Snmj3vEtkxF6AJaEhSapnU58gu5ma+zlpqY3dZDHbL6iMeyagMz0GGLNsZGmE+sBxsDulzGP3dSV6iouFmqnVmq9H1USAC4GI1nv95yegl5IT4U2YTEH+PPK9mT8nPjttNvM+l5IawQnYs0SAZbqOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caMFE8II; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caMFE8II"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752419393; x=1783955393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oa09N/ry1ckVzryPS9QG24FnqPDUOkjoRVFV1Bb36q8=;
  b=caMFE8IIeObu4PmxhExTO1vKzWhjgCQkRxrFWS0BkfHG6wBe0MFbF5RI
   peNAl5LNTiXyaq2Wx9y/xj/J5kO/c+6LKQ6b7hIAvCLx4SJEsiEUun7Ek
   iwpnrCFmuLYQ2aW+LzlD+ar1rOUz5ivaudu0GEXM1hJBI8a8tZlWX4Pql
   +vNRXNpUKF96OA/8necPLbVi4/fA3Z97gdHX2OUDhgBFYrR8y8APqVL9m
   zL+S94gszB/ZYNaBG/kU3CBxfvO00i6VZ3gtE22sAMBVK/Mn22c6W3JB2
   P9CzP61qKe3oED3E9QocETfIErK6Um5Bry1HTEtIYi4BBIDQC4yo/+SUF
   w==;
X-CSE-ConnectionGUID: pJD8mr3KSVuGpgeS1M5jsA==
X-CSE-MsgGUID: 6YZITwmiTYCTO8+pp8Zwfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66076548"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="66076548"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 08:09:52 -0700
X-CSE-ConnectionGUID: 4GUmbU0RQeSe6vG/XnEQ4A==
X-CSE-MsgGUID: V/Bgl4DnSeWGcsIK8JvnGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="157234395"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jul 2025 08:09:51 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uayKq-00088V-1C;
	Sun, 13 Jul 2025 15:09:48 +0000
Date: Sun, 13 Jul 2025 23:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-send-full 2/3] io_uring/poll.c:689:19: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202507132300.puEbPOZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-send-full
head:   5c1822cfa37e51e1dbd8a1a72e5b7789051f12d7
commit: 70ba928ec6999b5d399068cf50a17afb698ed2b9 [2/3] io_uring/poll: flag request with REQ_F_POLL_ARMED if it went through poll
config: alpha-randconfig-r132-20250713 (https://download.01.org/0day-ci/archive/20250713/202507132300.puEbPOZM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250713/202507132300.puEbPOZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507132300.puEbPOZM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/poll.c:426:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:426:40: sparse:     expected int mask
   io_uring/poll.c:426:40: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:262:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t @@
   io_uring/poll.c:262:38: sparse:     expected signed int [usertype] res
   io_uring/poll.c:262:38: sparse:     got restricted __poll_t
   io_uring/poll.c:276:21: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:284:56: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:283:66: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:283:66: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:283:66: sparse:     got unsigned int
   io_uring/poll.c:283:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned short @@
   io_uring/poll.c:283:52: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:283:52: sparse:     got unsigned short
   io_uring/poll.c:286:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:286:51: sparse:     expected signed int [usertype] res
   io_uring/poll.c:286:51: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:287:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:287:53: sparse:     expected signed int [usertype] res
   io_uring/poll.c:287:53: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:337:71: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:337:65: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:337:65: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:337:65: sparse:     got unsigned int
   io_uring/poll.c:614:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:614:40: sparse:     expected int mask
   io_uring/poll.c:614:40: sparse:     got restricted __poll_t [assigned] [usertype] mask
>> io_uring/poll.c:689:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long old_flags @@     got restricted io_req_flags_t [usertype] flags @@
   io_uring/poll.c:689:19: sparse:     expected unsigned long old_flags
   io_uring/poll.c:689:19: sparse:     got restricted io_req_flags_t [usertype] flags
>> io_uring/poll.c:697:35: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/poll.c:701:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:701:38: sparse:     expected int mask
   io_uring/poll.c:701:38: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:701:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int events @@     got restricted __poll_t [usertype] events @@
   io_uring/poll.c:701:55: sparse:     expected int events
   io_uring/poll.c:701:55: sparse:     got restricted __poll_t [usertype] events
   io_uring/poll.c:708:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got int @@
   io_uring/poll.c:708:33: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:708:33: sparse:     got int
   io_uring/poll.c:846:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:846:24: sparse:    left side has type unsigned int
   io_uring/poll.c:846:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:848:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:848:24: sparse:    left side has type unsigned int
   io_uring/poll.c:848:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:850:55: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:849:29: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:849:38: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int @@
   io_uring/poll.c:849:38: sparse:     expected restricted __poll_t
   io_uring/poll.c:849:38: sparse:     got unsigned int
   io_uring/poll.c:910:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [addressable] [assigned] [usertype] result_mask @@
   io_uring/poll.c:910:40: sparse:     expected signed int [usertype] res
   io_uring/poll.c:910:40: sparse:     got restricted __poll_t [addressable] [assigned] [usertype] result_mask
   io_uring/poll.c:941:38: sparse: sparse: invalid assignment: &=
   io_uring/poll.c:941:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:941:38: sparse:    right side has type int
   io_uring/poll.c:942:52: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:942:38: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:942:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:942:38: sparse:    right side has type unsigned int

vim +689 io_uring/poll.c

   671	
   672	int io_arm_apoll(struct io_kiocb *req, unsigned issue_flags, __poll_t mask)
   673	{
   674		struct async_poll *apoll;
   675		struct io_poll_table ipt;
   676		unsigned long old_flags;
   677		int ret;
   678	
   679		mask |= EPOLLET;
   680		if (!io_file_can_poll(req))
   681			return IO_APOLL_ABORTED;
   682		if (!(req->flags & REQ_F_APOLL_MULTISHOT))
   683			mask |= EPOLLONESHOT;
   684	
   685		apoll = io_req_alloc_apoll(req, issue_flags);
   686		if (!apoll)
   687			return IO_APOLL_ABORTED;
   688		req->flags &= ~(REQ_F_SINGLE_POLL | REQ_F_DOUBLE_POLL);
 > 689		old_flags = req->flags;
   690		req->flags |= REQ_F_POLLED | REQ_F_POLL_ARMED;
   691		ipt.pt._qproc = io_async_queue_proc;
   692	
   693		io_kbuf_recycle(req, issue_flags);
   694	
   695		ret = __io_arm_poll_handler(req, &apoll->poll, &ipt, mask, issue_flags);
   696		if (ret) {
 > 697			if (!(old_flags & REQ_F_POLL_ARMED))
   698				req->flags &= ~REQ_F_POLL_ARMED;
   699			return ret > 0 ? IO_APOLL_READY : IO_APOLL_ABORTED;
   700		}
   701		trace_io_uring_poll_arm(req, mask, apoll->poll.events);
   702		return IO_APOLL_OK;
   703	}
   704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
