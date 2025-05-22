Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED604539A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747928282; cv=none; b=BJXYHv4QFe0wKgZVRuNn3Hz14UQsgpPutvlRgqC5gWo4Mbni4MKdgRApnQfwJ/wLoa4RCK7ONQxNxG7RwPIoMK4+BDDh62l9JV0DCo///4lHYDi188rxnqDEOa2iXXh2kFSL+UfGFGy0F9O0SLYqpKH1YsweClcW9x+tIg811Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747928282; c=relaxed/simple;
	bh=SDSRwyTDgxFxxR1ANTcwNHAX+Ft0N92x8bHGzqMVeus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxyqJVIO9gvAenDO2d9HN88FjLGaCw6XDgV0UHbkKNveEUpen/LFwRVcIh8jbMxmREUT9r48qrj9vym1hLXRtXJhS5PufX2+RvToogbZ9r8N6ExQMTj5dzrmW2IV9uRuCUTDRO4upxTjORCLsz5Npd72sdVeGBQUZNv9M4LY4L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mykib5bI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mykib5bI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747928281; x=1779464281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SDSRwyTDgxFxxR1ANTcwNHAX+Ft0N92x8bHGzqMVeus=;
  b=Mykib5bIHrdwFVq4rYbVXzYu1tYGDIKt5ppw1qbBtrtAf4NIYMwsi84W
   eESYU9jtgYit0ryUaYyhoVeOQtUC7+281akTLE+um4e6FTKtxJRga+xWS
   2RuJUOUiQUnUnd5q/QSNH2Ei1RxfIyGqZLhaziQ7cWFtNL1f1jl+vsGf3
   unBPmOybWO/lIrVgQjmpVVoMOw3fEaCnAn/6omWwX5Oh8YcS5PiOJTmcP
   6qMTFJBvJQ2WZbGSG2tVmVDBm0zhKaxjRabP0GM5ezKmJULbovh80FXRa
   fT2t9Cu0Ef7F38KOq7XlqZSyoZJfV7G1fvHJ2OESlz2ysYIx06+xMplfu
   w==;
X-CSE-ConnectionGUID: iBbAqxoSQuqgHUZzApdauA==
X-CSE-MsgGUID: HEuVcTbGSsa+SbI3SlVq0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75359787"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="75359787"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 08:38:00 -0700
X-CSE-ConnectionGUID: FoJN1tZcTRGhfu3+5V8GRg==
X-CSE-MsgGUID: ++vEi8Y2SkC8Hq5qau6NAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145894495"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 May 2025 08:37:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI7zZ-000PT2-0S;
	Thu, 22 May 2025 15:37:57 +0000
Date: Thu, 22 May 2025 23:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kbusch:block-copy-offload 4/5] block/blk-lib.c:455: warning:
 Function parameter or struct member 'bdev' not described in
 'blkdev_copy_range'
Message-ID: <202505222326.5Eu1umrB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git block-copy-offload
head:   800a843f4b4f96a8b43f11bcbdc33e87f2aaf2a9
commit: b5f27a70bab7512e98aff887cf9ef6830c052e3c [4/5] block: add support for vectored copies
config: arc-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505222326.5Eu1umrB-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505222326.5Eu1umrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505222326.5Eu1umrB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-lib.c:455: warning: Function parameter or struct member 'bdev' not described in 'blkdev_copy_range'
   block/blk-lib.c:477: warning: Function parameter or struct member 'bdev' not described in 'blkdev_copy'


vim +455 block/blk-lib.c

   445	
   446	/**
   447	 * blkdev_copy_range - copy range of sectors to a destination
   448	 * @dst_sector:	start sector of the destination to copy to
   449	 * @bv:		vector of source sectors
   450	 * @nr_vecs:	number of source sector vectors
   451	 * @gfp:	allocation flags to use
   452	 */
   453	int blkdev_copy_range(struct block_device *bdev, sector_t dst_sector,
   454			struct bio_vec *bv, int nr_vecs, gfp_t gfp)
 > 455	{
   456		int ret, i;
   457	
   458		if (bdev_copy_sectors(bdev))
   459			return blkdev_copy_offload(bdev, dst_sector, bv, nr_vecs, gfp);
   460	
   461		for (i = 0, ret = 0; i < nr_vecs && !ret; i++)
   462			ret = __blkdev_copy(bdev, dst_sector, bv[i].bv_sector,
   463					bv[i].bv_sectors, gfp);
   464		return ret;
   465	}
   466	EXPORT_SYMBOL_GPL(blkdev_copy_range);
   467	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
