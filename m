Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A912319F413
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 19:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727120685; cv=none; b=dH2rVPhfBQFndRBpG8+uPRTT0HporrG8FfJGm6A7GSZiXLWJTpgJjlKRarMCJzxBaKMm3yHDkwyZZgeapPVCPd6jytjiz6QY1nHUqQMgUkYaHBLYo4qRNFipugS2iD6HiqoYrmEnS+bFLdK72Mpk2MBSoVv4Zboj6oaGYKRcjqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727120685; c=relaxed/simple;
	bh=1V6OJTRIXNbOMnCGytnbxGLUNUlyEpyBM6Jc1TExU5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GfiEgUmpytTOWJgni4kzsUr8ZuFT0E/ZAgEsh1BJ7XeRVIS+olgs2RI4/9mdgxWE9fWhqsudNb60BCv7tIAxNhRrcO2x/qpr7388LMS/D6/2YnuMDhhuKyfx9M29oyW2poV4/8dFPTxK0MPyCui5CPtAEIIVi/nuEYFFcUKM+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBiUThqQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBiUThqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727120683; x=1758656683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1V6OJTRIXNbOMnCGytnbxGLUNUlyEpyBM6Jc1TExU5E=;
  b=BBiUThqQ63uudlkLut3MCVI/ixI04aYplvDLDQwhRVuotMjOSsnycxLy
   6IEyGpvOmO+3qNf7FdcJI6bG4bw9adumW+GK1wJuAJ/6qUQ4Ou25Tph33
   PjhKQpY4NLJ75FNd+mtjyuaDw6+cKDpBkFeiz+tguF7llBWpJmjdGmU8f
   gNNGk11DO3XqvQDKPFmTtpyw6zMSMXZ5tjg17wmJ1ds9Hp41qCosxETbt
   RKC4ZPhju6dY5ZVp/FUh6163r/aYbwsvUJmdEOF6CI+IBLOyoNQC/ykKb
   lHzX1RCXK76q+/M6qGkPQkbE8rqmzLJotJg02BXNtIt1rZnzKHg/wezEm
   Q==;
X-CSE-ConnectionGUID: Vb5yGsMCTPqIiDHvOr4O9A==
X-CSE-MsgGUID: H/yOk+2DQEOazFNNOodszw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25602851"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="25602851"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 12:44:43 -0700
X-CSE-ConnectionGUID: bpwLY43ZT56/G0WrP8R6NQ==
X-CSE-MsgGUID: J9GDZtr9QcG6o8FjP5JDuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="75553710"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Sep 2024 12:44:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssozA-000HYK-09;
	Mon, 23 Sep 2024 19:44:40 +0000
Date: Tue, 24 Sep 2024 03:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-sync-msg_ring 3/3] io_uring/msg_ring.c:341:6:
 warning: variable 'flags' set but not used
Message-ID: <202409240311.P420PnfP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-sync-msg_ring
head:   be1d83503917b3c0c0014fad0b8e7e3a9df83311
commit: be1d83503917b3c0c0014fad0b8e7e3a9df83311 [3/3] io_uring/msg_ring: add support for sending a sync message
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240924/202409240311.P420PnfP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240311.P420PnfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240311.P420PnfP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/msg_ring.c:341:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
     341 |         u32 flags = 0;
         |             ^
   1 warning generated.


vim +/flags +341 io_uring/msg_ring.c

   335	
   336	int io_uring_sync_msg_ring(struct io_uring_sqe *sqe)
   337	{
   338		struct io_msg io_msg = { };
   339		struct io_ring_ctx *ctx;
   340		struct file *file;
 > 341		u32 flags = 0;
   342		int ret;
   343	
   344		ret =__io_msg_ring_prep(&io_msg, sqe);
   345		if (unlikely(ret))
   346			return ret;
   347	
   348		if (io_msg.cmd != IORING_MSG_DATA)
   349			return -EINVAL;
   350	
   351		file = fget(sqe->fd);
   352		if (!file)
   353			return -EBADF;
   354	
   355		ret = -EBADFD;
   356		if (!io_is_uring_fops(file))
   357			goto err;
   358		ctx = file->private_data;
   359	
   360		if (io_msg.flags & IORING_MSG_RING_FLAGS_PASS)
   361			flags = io_msg.cqe_flags;
   362	
   363		ret = __io_msg_ring_data(ctx, &io_msg, 0);
   364	err:
   365		fput(file);
   366		return ret;
   367	}
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
