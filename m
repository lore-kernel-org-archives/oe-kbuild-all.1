Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE3311958
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 14:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247231; cv=none; b=TFhAZEPKchcy7nO+b74siRpt2/9OtVSx+tDPQl8CWtG0E05vrtxCqaLr+A9367QyHZorqkYzTe9RA5JQhfwcGoJVMSGRiGah/NPX2DCZO/KwayHeKH8YIQcaEMrPlKILlbmLfTny2LAkI8fgzJexrGBWyUiUGA5RILqICCmuJFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247231; c=relaxed/simple;
	bh=6mK5SkBWXYIBbxx0oqnM/n5dsYiyxtUrCfM/P133yxg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MyOLIjlqF6sIZRjYa+uKPvPGPVCX5KcQz39uTyfeUb6Ci5ANY0OT3mWWS7DEUWlZU3MVhGq/+5teG+S2AuYB+d7voLGKRlwRESELe+T+IeMepU4TH56M3CSFry36XGEH17/QxOaf4cxa0qqZ8RIL1t8RbA3vePIkoHfxVM1Q2lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVmUQcrP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVmUQcrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785247230; x=1816783230;
  h=date:from:to:cc:subject:message-id;
  bh=6mK5SkBWXYIBbxx0oqnM/n5dsYiyxtUrCfM/P133yxg=;
  b=QVmUQcrP2U/FlNiQ/XLCCIfyVHnWT9Zlb7nnUqAp+haanuBM854NlCOJ
   wbcXGqIEZ6TR+VBOj05bfQSiyApVsDDC6OfJHVDhe9IWdkxuN40xOOuAm
   bq6JiMgXXgB6JJ4rgvITqq8vnQMx+9ArT/nLccQsaw1okXY8FgMHWjCNQ
   tFJ18jFMIV7rIIa478H4xhLPYg8PqBVCBRrib8bujRgz3fNollRdeN9id
   rUXuaKcSMlDlwFNgkLh5c9DqKNf5Qa8/PP7cyt9Pj2bA0TjuqyyXC+9qV
   8q3QZjV/5Zy/zgq0ycBJGXOYnfir7V7cIGE7/Xh74V8JS+vrewtqDrbt1
   Q==;
X-CSE-ConnectionGUID: kI5cSAK9TU2l6uPxmgN2zQ==
X-CSE-MsgGUID: ZN9U4LLQQTqwUP8G9aMhow==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97344800"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="97344800"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:00:29 -0700
X-CSE-ConnectionGUID: LxUD4J/YSaWHRFEbp5PxWQ==
X-CSE-MsgGUID: PRELwxK0SiWQsOO7jUx52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="283047845"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 28 Jul 2026 07:00:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woiM5-00000000ePn-0JjB;
	Tue, 28 Jul 2026 14:00:25 +0000
Date: Tue, 28 Jul 2026 22:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v5 6/9] block/ioctl.c:958:15: error:
 implicit declaration of function 'blk_uring_cmd_alloc_iobuf'; did you mean
 'blkdev_cmd_alloc_iobuf'?
Message-ID: <202607282158.kSJTNTZa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5
head:   de80bacbf04a137715357b6a2948d9f29a18d990
commit: 37ff77d98dbfae93b246dadfe1d25b768b9e8798 [6/9] block: add a uring command for pool-backed fixed buffers
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260728/202607282158.kSJTNTZa-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607282158.kSJTNTZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607282158.kSJTNTZa-lkp@intel.com/

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
