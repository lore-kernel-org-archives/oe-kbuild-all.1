Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385115E97
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 15:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708876118; cv=none; b=bTK+na0lGNWpIS3xuCSD9Avrq3fwutDsKR1kHXOom7kUZQ3diyjfW9EcVojBsyFdSF2glNFAnb+eNX826ZziMNpZKVbTBs5U05ss0/KdjWneDPQAt44pSYgxtPQ1FKMzEKxUcMQOEwZdYcCv22F0HnWlbt39Yai+Jm0EsGkdtug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708876118; c=relaxed/simple;
	bh=expEmljRx6VO51aTPx8LFljUZggmEX0wzeNKNfO+jG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lKsf+gdcstz7GtDtTf3mMTpmFxf649BLhPaVUsyWZ8eDXs8CuCbEnVxLE7p7qdJ/eIyRkeSJmHYh6dQKwCnqzvXpcrxX+1hJTZlX2zLj2Wzkwvz4bXHLPTc2mVZMvE+GmnI5dKpzyeiutoI7Q1qiHs48cwAzqeW8OFbJ5ySIjm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jtt3hF/5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jtt3hF/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708876117; x=1740412117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=expEmljRx6VO51aTPx8LFljUZggmEX0wzeNKNfO+jG0=;
  b=Jtt3hF/5HXIsGUVFxld2rL1xCQl+n4NeAfd96aakfsgeH+ntfFfPFKqs
   Yo842m5HYgsPLWKGP+zgA5eG7dqLrWID0WSUgoU1hfSnRnt0ZY8+v9DLc
   /kEyOe5wSYIlwb3STkk8Y6+I6QmMYg5TMAgk1Sn/xPnyGMQfMjZHXhv6T
   zJQXgOlu8tQlCJWqLlCkkxWdOs6doIWeur0tCbovyRHZfNiHHkm5lcn89
   gcA+8MLnCb+8OCKnqnodVis3XPfcfDNwJcmEHfScgw7SVmN9B6xC/jG2w
   FpBWMHUQkl2qTbPcxYpb8bzASPHfMc+ABvRK8uPLNYAs20ulllLjald0l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3021565"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3021565"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 07:48:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="10986449"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2024 07:48:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reGjv-0009bg-1d;
	Sun, 25 Feb 2024 15:48:31 +0000
Date: Sun, 25 Feb 2024 23:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:drbd-blk-limits 1/16] block/blk-settings.c:281: warning:
 expecting prototype for queue_limits_commit_set(). Prototype was for
 queue_limits_set() instead
Message-ID: <202402252304.kpXtDQbu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git drbd-blk-limits
head:   952f67c787298e616a8aa5acc3f881d267e6c7b5
commit: 0e90f030254da17eda20740e375fcc5f21c89c3e [1/16] block: add a queue_limits_set helper
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240225/202402252304.kpXtDQbu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402252304.kpXtDQbu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402252304.kpXtDQbu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-settings.c:281: warning: expecting prototype for queue_limits_commit_set(). Prototype was for queue_limits_set() instead


vim +281 block/blk-settings.c

   268	
   269	/**
   270	 * queue_limits_commit_set - apply queue limits to queue
   271	 * @q:		queue to update
   272	 * @lim:	limits to apply
   273	 *
   274	 * Apply the limits in @lim that were freshly initialized to @q.
   275	 * To update existing limits use queue_limits_start_update() and
   276	 * queue_limits_commit_update() instead.
   277	 *
   278	 * Returns 0 if successful, else a negative error code.
   279	 */
   280	int queue_limits_set(struct request_queue *q, struct queue_limits *lim)
 > 281	{
   282		mutex_lock(&q->limits_lock);
   283		return queue_limits_commit_update(q, lim);
   284	}
   285	EXPORT_SYMBOL_GPL(queue_limits_set);
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
