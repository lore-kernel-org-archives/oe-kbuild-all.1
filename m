Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800202D8398
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787838; cv=none; b=fRmoYt/vQzhoXfvzIcxhDJ9bao+TwDlghR+K8xY1EshGqhyAyoaP3Q7iX1W3WSPW3v+kDfyeXzqON+6esaerA2U8u2A1R79COdA6gwJUrbkOya+oko33AWRb/1zF4/i71E13UNtYWT3KcaDqExqS+V65FD9Hv10Q+1YkES2w5C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787838; c=relaxed/simple;
	bh=fzuQbYcT3kDY3wepx8xLRD1f+QWMCyb0eSAQJy88wWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CsEsR9CDt1HwUsZM9pJ0x4U3B8NRRVP9tjafIPNRQiWsjF/GF2HgUYFlBuOshEJG2k7jSjpoL28ALLhXPFhtmX4jUZx1qrA/jkyoshMXxvScbjGX4Fh2SSOX0O2gF+YekMoCiZQUDyuiZdU6vaGDGvMm3J4ADO/s+lHeDYw7Ehs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7ZW5Dl/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7ZW5Dl/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755787836; x=1787323836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fzuQbYcT3kDY3wepx8xLRD1f+QWMCyb0eSAQJy88wWk=;
  b=K7ZW5Dl/SIOP6u1DNforg+dmQgGLcGNjZVBcG+6LTCRk86o6CfKDWS/M
   72ItNvOWbDKaMjSC/IUYBhxUyPsO9rxBgd2+RBZoFa9p+ibC+n2aFtMBN
   qHFOJlipAHRx5AvIpz4J9T4KKlOSKH6nqcrSpa+5FcGIaE7nWSR0Dx2gL
   B6FrHR21RrBavPqYya/TGFNR61Vi8rPrRaWLDKY+XcZubRLSDXXaxwFk+
   XuRtLp4HXQJcgBIlga+0PcXsgJft7dux5sd24UWNNADaCvNkx97rNpuQf
   HIBbHWNjIhq4fDIJeuFtfW/jl7cHnK1fWr/L/d5DKX1vVxmEdfFaQQ7kP
   A==;
X-CSE-ConnectionGUID: JVOHXAKcRyek5uagmQlPJQ==
X-CSE-MsgGUID: GXeRUX3VTLyRw5EdjOwp8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58147595"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58147595"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 07:50:33 -0700
X-CSE-ConnectionGUID: 1i6iSZ6mRa2UnGW+uP9SaA==
X-CSE-MsgGUID: 2pfpk/IoRtqYFiMHQH83bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="173769084"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Aug 2025 07:50:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up6cE-000KO2-1B;
	Thu, 21 Aug 2025 14:50:10 +0000
Date: Thu, 21 Aug 2025 22:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.18/io_uring 16/16]
 include/linux/io_uring/cmd.h:123:1: error: expected identifier or '(' before
 '{' token
Message-ID: <202508212218.pOwu5QFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.18/io_uring
head:   55dc643dd2ad15e755a706980692a374de1bb7a8
commit: 55dc643dd2ad15e755a706980692a374de1bb7a8 [16/16] io_uring: uring_cmd: add multishot support
config: i386-buildonly-randconfig-001-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212218.pOwu5QFJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212218.pOwu5QFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212218.pOwu5QFJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from block/fops.c:20:
>> include/linux/io_uring/cmd.h:123:1: error: expected identifier or '(' before '{' token
     123 | {
         | ^
>> include/linux/io_uring/cmd.h:121:1: warning: 'io_uring_cmd_buffer_select' declared 'static' but never defined [-Wunused-function]
     121 | io_uring_cmd_buffer_select(struct io_uring_cmd *ioucmd, unsigned buf_group,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +123 include/linux/io_uring/cmd.h

    72	
    73	/*
    74	 * Select a buffer from the provided buffer group for multishot uring_cmd.
    75	 * Returns the selected buffer address and size.
    76	 */
    77	struct io_br_sel io_uring_cmd_buffer_select(struct io_uring_cmd *ioucmd,
    78						    unsigned buf_group, size_t *len,
    79						    unsigned int issue_flags);
    80	
    81	/*
    82	 * Complete a multishot uring_cmd event. This will post a CQE to the completion
    83	 * queue and update the provided buffer.
    84	 */
    85	bool io_uring_mshot_cmd_post_cqe(struct io_uring_cmd *ioucmd,
    86					 struct io_br_sel *sel, unsigned int issue_flags);
    87	
    88	#else
    89	static inline int
    90	io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
    91				  struct iov_iter *iter, struct io_uring_cmd *ioucmd,
    92				  unsigned int issue_flags)
    93	{
    94		return -EOPNOTSUPP;
    95	}
    96	static inline int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
    97							const struct iovec __user *uvec,
    98							size_t uvec_segs,
    99							int ddir, struct iov_iter *iter,
   100							unsigned issue_flags)
   101	{
   102		return -EOPNOTSUPP;
   103	}
   104	static inline void io_uring_cmd_done(struct io_uring_cmd *cmd, ssize_t ret,
   105			u64 ret2, unsigned issue_flags)
   106	{
   107	}
   108	static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
   109				    void (*task_work_cb)(struct io_uring_cmd *, unsigned),
   110				    unsigned flags)
   111	{
   112	}
   113	static inline void io_uring_cmd_mark_cancelable(struct io_uring_cmd *cmd,
   114			unsigned int issue_flags)
   115	{
   116	}
   117	static inline void io_uring_cmd_issue_blocking(struct io_uring_cmd *ioucmd)
   118	{
   119	}
   120	static inline struct io_br_sel
 > 121	io_uring_cmd_buffer_select(struct io_uring_cmd *ioucmd, unsigned buf_group,
   122				   size_t *len, unsigned int issue_flags);
 > 123	{
   124		return (struct io_br_sel) { .val = -EOPNOTSUPP };
   125	}
   126	static inline bool io_uring_mshot_cmd_post_cqe(struct io_uring_cmd *ioucmd,
   127					ssize_t ret, unsigned int issue_flags)
   128	{
   129		return true;
   130	}
   131	#endif
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
