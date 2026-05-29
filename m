Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527443BC668
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 09:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047009; cv=none; b=gKtmVhPkPKZ+Nw+vWAXUteXttBZ5SFfozzNRY4IjsvtkxTTv6Bsh0seEIxpZAh2HcQSGRQnN2rly6TCDXpkl7UTwyMFg/KMLOpvkp5IlygyUhPTV6cewyHPfIUkubM09ZhpGQwtoqxdFtw6gWPDRX73Ry3OftZSmHwgQfJF2APM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047009; c=relaxed/simple;
	bh=uuFrHPzP2V89vnSelMASMPnH7HUUKSq3610H72VD5U4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W7EQpoN9NwKJsJFc+rOGllNnAmkd9KrLGBcp9mfXlhIN7B7OaUh6HscI+IQ2lLQO+G35S+3aMmF/X2jLXC0e+I8ZPuh88wNQxu+OY8GrPF6rrXTXuztsyrcZPPPTO1QtHnjQOykF0k3mykdg/NZy5ir/biGSkKlYSsXH2aNyg2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eu16OLUc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eu16OLUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780047007; x=1811583007;
  h=date:from:to:cc:subject:message-id;
  bh=uuFrHPzP2V89vnSelMASMPnH7HUUKSq3610H72VD5U4=;
  b=eu16OLUclS5Pk2iLDYZHH0BU0Xds5puXs6lggY0/9OEjfDRSvLSpQtGO
   ziKF90vDt1KqDt0VTjNr7lfRdXVL08oXjorC6I24frNoLqd0bplMSBbbL
   COpf3CkH+Jlf4uZZgzDVFJf6StjhBIgl8gx8grXZmh4YUG9RQIiQS8jw5
   t2qMM7k9BN9iHuNoVl8SojHkjHvKpzKGABoLUUxZpX41X1L2RFUcG+con
   uuP1+36UnOs2pSMc+sc/jeUe8rUVN5/s/q7Zg7mJf/urlctt4tVqpS53A
   xRjHoWvvBQJP/2lnnqaQ1NihR7zbUKWnW4df7RmJ9aPyAQt74pBbd8QdO
   w==;
X-CSE-ConnectionGUID: lcX9wj5jSFqsR7dG03puzg==
X-CSE-MsgGUID: 8U9TvLUxQqefr64LbWN9rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="81080733"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="81080733"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 02:30:04 -0700
X-CSE-ConnectionGUID: ciGQDT2NQXuZZNmDM0ZJ1Q==
X-CSE-MsgGUID: JACCJCqCTsiMdOTZIPwdyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="240252010"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2026 02:30:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wStXU-0000000073K-04zv;
	Fri, 29 May 2026 09:30:00 +0000
Date: Fri, 29 May 2026 17:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-poll-gate 7/7] io_uring/net.c:807:22:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202605291740.yMPkjHVj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-poll-gate
head:   4942cfc0b61b662aa2d89efbfccec8119f6201b4
commit: 4942cfc0b61b662aa2d89efbfccec8119f6201b4 [7/7] io_uring/net: wire IORING_RECV_POLL_BPF to recv operations
config: um-randconfig-r134-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291740.yMPkjHVj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291740.yMPkjHVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291740.yMPkjHVj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/net.c:807:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/net.c:807:22: sparse:    int ( [noderef] __rcu * )( ... )
   io_uring/net.c:807:22: sparse:    int ( * )( ... )

vim +807 io_uring/net.c

   786	
   787	#define RECVMSG_FLAGS (IORING_RECVSEND_POLL_FIRST | IORING_RECV_MULTISHOT | \
   788				IORING_RECVSEND_BUNDLE | IORING_RECV_POLL_BPF)
   789	
   790	int io_recvmsg_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
   791	{
   792		struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
   793	
   794		sr->done_io = 0;
   795	
   796		if (unlikely(sqe->addr2))
   797			return -EINVAL;
   798	
   799		sr->umsg = u64_to_user_ptr(READ_ONCE(sqe->addr));
   800		sr->len = READ_ONCE(sqe->len);
   801		if (unlikely(sr->len < 0))
   802			return -EINVAL;
   803		sr->flags = READ_ONCE(sqe->ioprio);
   804		if (sr->flags & ~RECVMSG_FLAGS)
   805			return -EINVAL;
   806		if (sr->flags & IORING_RECV_POLL_BPF) {
 > 807			if (!rcu_access_pointer(req->ctx->poll_gate))
   808				return -EINVAL;
   809			req->flags |= REQ_F_POLL_BPF;
   810			req->poll_bpf_val = 0;
   811		}
   812		sr->msg_flags = READ_ONCE(sqe->msg_flags);
   813		if (sr->msg_flags & MSG_DONTWAIT)
   814			req->flags |= REQ_F_NOWAIT;
   815		if (sr->msg_flags & MSG_ERRQUEUE)
   816			req->flags |= REQ_F_CLEAR_POLLIN;
   817		if (req->flags & REQ_F_BUFFER_SELECT)
   818			sr->buf_group = req->buf_index;
   819		sr->mshot_total_len = sr->mshot_len = 0;
   820		if (sr->flags & IORING_RECV_MULTISHOT) {
   821			if (!(req->flags & REQ_F_BUFFER_SELECT))
   822				return -EINVAL;
   823			if (sr->msg_flags & MSG_WAITALL)
   824				return -EINVAL;
   825			if (req->opcode == IORING_OP_RECV) {
   826				sr->mshot_len = sr->len;
   827				sr->mshot_total_len = READ_ONCE(sqe->optlen);
   828				if (sr->mshot_total_len)
   829					sr->flags |= IORING_RECV_MSHOT_LIM;
   830			} else if (sqe->optlen) {
   831				return -EINVAL;
   832			}
   833			req->flags |= REQ_F_APOLL_MULTISHOT;
   834		} else if (sqe->optlen) {
   835			return -EINVAL;
   836		}
   837	
   838		if (sr->flags & IORING_RECVSEND_BUNDLE) {
   839			if (req->opcode == IORING_OP_RECVMSG)
   840				return -EINVAL;
   841		}
   842	
   843		if (io_is_compat(req->ctx))
   844			sr->msg_flags |= MSG_CMSG_COMPAT;
   845	
   846		sr->nr_multishot_loops = 0;
   847		return io_recvmsg_prep_setup(req);
   848	}
   849	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
