Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698483CBE79
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785189371; cv=none; b=eFULGJo+yDitAtFCdyn/MOVsDdbysEbn4aal0+vFr4y3bM4S7VkcVp8TmfOuQStYvmLjdSRtgZqndDWgGitFVixuIpjt7wMUcdamhV7CfgdtWlJmrBmT2Oj9bgU3XgEi5p3NlhF1HJp3s/CyNRHR+Vv1AVviY9oPkTkvrlsI3RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785189371; c=relaxed/simple;
	bh=I1IsX5Z/8DGb2s9TMulPNWa7y/EPbL0JrZ+nqv5DCJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VbXeiFpEk3iGfe6LivuCBAdXFAOkAf1w9if4mw0CtA9kzpzU+qw9+gXBZXSw+lcgy9sZck4ZFEUsFnX0G3AUvK4xAaV1tdjGWCRFcqhjI27Tw8IP7UP52m80FYsVNIIjsYsqQv5ACKoxJHKRSPzCok6PyywGHg6ITtJDLZfLM/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+9OSjfO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+9OSjfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785189370; x=1816725370;
  h=date:from:to:cc:subject:message-id;
  bh=I1IsX5Z/8DGb2s9TMulPNWa7y/EPbL0JrZ+nqv5DCJ0=;
  b=Y+9OSjfOS19XEhLixq3UxFx6T8mMNm9pFQTmbVNyUU/ZoPt/mfk6FJkm
   LaJdhXU8Bamfdvm7BSPWBlRamONNKHhiGj87jNrDFYNzvw/aELtAS3+hR
   03kEoWgaNL4JW11tm++25Pv58vrYvusApO1Xa0N/nDJTUkjeDyQ0ROTVk
   xDrkbPxr4PJc1FEhlUHn4ua/xqm5bZjK0/P2kmWnAO3NxYtKkFCHnxSlm
   thTnhzRP0krpXgV22yN3kI1+/gtysh2M51JF92D8kZhVzrqZf/OVcJdMO
   ySoFmNw0lMnPneGf6y9jUlZ6zkMK8m9vfOQfOkekbIoM8kVFpVuJpF7L1
   w==;
X-CSE-ConnectionGUID: hxjKRgU6Qg680pfII+TRIQ==
X-CSE-MsgGUID: A48qpmivQZi4I9eWnoVWsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108561082"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="108561082"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 14:56:09 -0700
X-CSE-ConnectionGUID: R+owf6uKQMuhhRGQm5LFLA==
X-CSE-MsgGUID: T6NNC7nGSlqY7HEpGzB9eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="261507603"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jul 2026 14:56:07 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woTIr-000000001k6-2dZ3;
	Mon, 27 Jul 2026 21:56:05 +0000
Date: Mon, 27 Jul 2026 23:55:37 +0200
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v5 6/9] block/ioctl.c:958:15: error:
 implicit declaration of function 'blk_uring_cmd_alloc_iobuf'; did you mean
 'blkdev_cmd_alloc_iobuf'?
Message-ID: <202607272334.vhPH89bZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5
head:   de80bacbf04a137715357b6a2948d9f29a18d990
commit: 37ff77d98dbfae93b246dadfe1d25b768b9e8798 [6/9] block: add a uring command for pool-backed fixed buffers
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260727/202607272334.vhPH89bZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607272334.vhPH89bZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607272334.vhPH89bZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/ioctl.c: In function 'blkdev_cmd_alloc_iobuf':
>> block/ioctl.c:958:15: error: implicit declaration of function 'blk_uring_cmd_alloc_iobuf'; did you mean 'blkdev_cmd_alloc_iobuf'? [-Wimplicit-function-declaration]
     958 |         ret = blk_uring_cmd_alloc_iobuf(cmd, pool, buf_index, len, issue_flags);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
         |               blkdev_cmd_alloc_iobuf


vim +958 block/ioctl.c

   947	
   948	static int blkdev_cmd_alloc_iobuf(struct io_uring_cmd *cmd,
   949					  struct block_device *bdev, u64 buf_index,
   950					  u64 len, unsigned int issue_flags)
   951	{
   952		struct blk_iobuf_pool *pool;
   953		int ret;
   954	
   955		pool = blk_queue_get_iobuf_pool(bdev_get_queue(bdev));
   956		if (!pool)
   957			return -EOPNOTSUPP;
 > 958		ret = blk_uring_cmd_alloc_iobuf(cmd, pool, buf_index, len, issue_flags);
   959		blk_iobuf_pool_put(pool);
   960		return ret;
   961	}
   962	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
