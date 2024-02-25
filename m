Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA3218EA2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 20:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708891215; cv=none; b=DDoL8bs7rxV3QKMEy3mMub7wuT4luJLRRzd/24SpJMvhO97EkgIQ8ghDljXcvqAJZJLqT/WNDdAZhMTZN5Bc9zkoEMxwW0BCnrnFIDIZBm5DgCMyrurJbCcUNlA9p/TiSgHK4P2ThjuXHKyOK/kejBKHGvHtPSV/qlsGmA5KJMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708891215; c=relaxed/simple;
	bh=agnxck/hJprAWeCplemgcLq/LnSn+eF/626rlMt8ThM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Syc1bxUC+3gGYHsWGarHcnMfDUjFx1EjaMpXh2uKUdYWWkKsZ0lkuVU1Ylt5+/sesXFYJ/sd5I3GmLbcO0njdu+1Y9szEGyN4+liFnHxyJqajgSwSFynwk3AJ7y4iodRXsg3LjuTLFzH7Xv2+tntB66u+XIe1FyzIflMqZxZiZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMq1qlN3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMq1qlN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708891213; x=1740427213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agnxck/hJprAWeCplemgcLq/LnSn+eF/626rlMt8ThM=;
  b=nMq1qlN3zQilxOL3xWxnzgl7v83yPT/+6aBgH1pryOdO4j8ohIMlgcKb
   pinalGpDIbTHNjNKj5zOQJV2Y3jfW88RXupoVtuyMaszBjBZUEDcd6VoL
   pkCIJTw2wEVKWtLtZ1vpCX7ths+U5UeU94+Nwf7bLsii4+Sj9395uEbxU
   sqpenpMtcQsgcbUbwqI5HsSLKQlGTkLyW/e24bgYSG7UbhhOaATqbD0dA
   C5VZ3Iy8OzACU1rIoJNMha+9KX912MQqeFlImUXG/0GMhr/eYBpLyGZLG
   /5UZvJbta4jseJz7i7iTp4muP6GbB+FKFr7iwkWRXwFC1QPx2ztk7Hvw5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="25639169"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="25639169"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 12:00:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="29631215"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Feb 2024 12:00:10 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reKfP-0009lU-2V;
	Sun, 25 Feb 2024 20:00:07 +0000
Date: Mon, 26 Feb 2024 03:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:drbd-blk-limits 2/16] block/blk-settings.c:910: warning:
 Function parameter or struct member 'pfx' not described in
 'queue_limits_stack_bdev'
Message-ID: <202402260333.svHvl4OJ-lkp@intel.com>
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
commit: 7f26721db65aea89f1f7766c8ff82131e5a6ee71 [2/16] block: add a queue_limits_stack_bdev helper
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240226/202402260333.svHvl4OJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402260333.svHvl4OJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402260333.svHvl4OJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/blk-settings.c:281: warning: expecting prototype for queue_limits_commit_set(). Prototype was for queue_limits_set() instead
>> block/blk-settings.c:910: warning: Function parameter or struct member 'pfx' not described in 'queue_limits_stack_bdev'


vim +910 block/blk-settings.c

   893	
   894	/**
   895	 * queue_limits_stack_bdev - adjust queue_limits for stacked devices
   896	 * @t:	the stacking driver limits (top device)
   897	 * @bdev:  the underlying block device (bottom)
   898	 * @offset:  offset to beginning of data within component device
   899	 *
   900	 * Description:
   901	 *    This function is used by stacking drivers like MD and DM to ensure
   902	 *    that all component devices have compatible block sizes and
   903	 *    alignments.  The stacking driver must provide a queue_limits
   904	 *    struct (top) and then iteratively call the stacking function for
   905	 *    all component (bottom) devices.  The stacking function will
   906	 *    attempt to combine the values and ensure proper alignment.
   907	 */
   908	void queue_limits_stack_bdev(struct queue_limits *t, struct block_device *bdev,
   909			sector_t offset, const char *pfx)
 > 910	{
   911		if (blk_stack_limits(t, &bdev_get_queue(bdev)->limits,
   912				get_start_sect(bdev) + offset))
   913			pr_notice("%s: Warning: Device %pg is misaligned\n",
   914				pfx, bdev);
   915	}
   916	EXPORT_SYMBOL_GPL(queue_limits_stack_bdev);
   917	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
