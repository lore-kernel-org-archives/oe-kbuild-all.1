Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F0817921D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 19:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925399; cv=none; b=RGDnxK0maNPAYDFzfbc2Q8d0bzyWxwjd8ULI/49GMyTW5CxRGRP6JGw9srE3X7zzb1eHc1YfCce3fryZkJ5ABy4v3ckYHTUjnkRjxOwpHCGxvZfBWcnxMAQ+JjEOW3+gLe6lRhO72oYslE4C7yIU7n+eR7Hjub1mlokWnEyqT6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925399; c=relaxed/simple;
	bh=I+lxJy+RWd0E5JxTlmDR1U4m9bwoDYhIpkbDlgcDQj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tssDJHyCGnktvceb6fimSCj7zPLUJS6ihMCn31x7Lr0NblsESZHs4vC86s6X1XJJi06Wq1ooOnyxwQRfDrU/d03VZNc7yYYn2WslYY+DLAeSFEUC1G91JbbIYfBRhcSvD+tb4RlQ7+/pjuQt22EwJjYYmXLdTL23MJX4rtB2U48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5sWSXvy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5sWSXvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716925397; x=1748461397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+lxJy+RWd0E5JxTlmDR1U4m9bwoDYhIpkbDlgcDQj4=;
  b=L5sWSXvynh9+mPS773cMFpIwIyzpzHjDemLpMKM5hL7nrpvi8JXWNhdF
   Z1f8/yu15WYOQWK5ZmLOgNFf9T3go8yYHsxpIFQutJLWzyC8/BhtLnf3S
   PJiqguTXnO4+rE7BovXCE9231CBmN/zXujURProlpu5jWIW0WXqIr+myd
   8D9Ed7dna0MScg35oGSWNLDogTzxpPgrUMCZqUyWfSoZHFIhRsJ8Dl+jG
   d5MCrypEbFLbbjefZsuG2JYL7zfK+Rjc9DoRVe3jcdr91G92slh358ev/
   PJTiScYkgTsZ7MH2QjxLssaAuShFV68dEpfnYXhfIxgydz8t8nd2N7F1K
   w==;
X-CSE-ConnectionGUID: kqvfVMMYQk21Mv6TngD3nQ==
X-CSE-MsgGUID: 0yz2D4INTiOpXMJ1mHMHtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13520528"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="13520528"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 12:43:17 -0700
X-CSE-ConnectionGUID: /TRSn7eyQ7qFlNDttbAWPQ==
X-CSE-MsgGUID: H2X6usdDSNWtHzYDC+jI+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="66035669"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 May 2024 12:43:16 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC2j3-000Cgl-0s;
	Tue, 28 May 2024 19:43:13 +0000
Date: Wed, 29 May 2024 03:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:scsi-ulp-limits 9/12] drivers/scsi/sd.c:3241: warning:
 Function parameter or struct member 'lim' not described in
 'sd_read_block_limits'
Message-ID: <202405290344.GvhJrxTV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git scsi-ulp-limits
head:   85f94a3d757915e58f3a8e330e479037177fdc04
commit: 305e4c4e9709d6b67b144d7c3515f4aeb2fa6c6e [9/12] sd: convert to the atomic queue limits API
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240529/202405290344.GvhJrxTV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290344.GvhJrxTV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290344.GvhJrxTV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/sd.c:3241: warning: Function parameter or struct member 'lim' not described in 'sd_read_block_limits'
>> drivers/scsi/sd.c:3299: warning: Function parameter or struct member 'lim' not described in 'sd_read_block_characteristics'


vim +3241 drivers/scsi/sd.c

937772c4e3a6c55 Christoph Hellwig  2024-05-21  3234  
d11b6916961d6ec Martin K. Petersen 2009-05-23  3235  /**
d11b6916961d6ec Martin K. Petersen 2009-05-23  3236   * sd_read_block_limits - Query disk device for preferred I/O sizes.
7529fbb0080d67b Damien Le Moal     2017-04-24  3237   * @sdkp: disk to query
d11b6916961d6ec Martin K. Petersen 2009-05-23  3238   */
305e4c4e9709d6b Christoph Hellwig  2024-05-28  3239  static void sd_read_block_limits(struct scsi_disk *sdkp,
305e4c4e9709d6b Christoph Hellwig  2024-05-28  3240  		struct queue_limits *lim)
d11b6916961d6ec Martin K. Petersen 2009-05-23 @3241  {
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3242  	struct scsi_vpd *vpd;
d11b6916961d6ec Martin K. Petersen 2009-05-23  3243  
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3244  	rcu_read_lock();
d11b6916961d6ec Martin K. Petersen 2009-05-23  3245  
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3246  	vpd = rcu_dereference(sdkp->device->vpd_pgb0);
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3247  	if (!vpd || vpd->len < 16)
e3deec090558d5c James Bottomley    2009-11-03  3248  		goto out;
ca369d51b3e1649 Martin K. Petersen 2015-11-13  3249  
631669a256f96c7 Martin K. Petersen 2022-03-02  3250  	sdkp->min_xfer_blocks = get_unaligned_be16(&vpd->data[6]);
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3251  	sdkp->max_xfer_blocks = get_unaligned_be32(&vpd->data[8]);
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3252  	sdkp->opt_xfer_blocks = get_unaligned_be32(&vpd->data[12]);
d11b6916961d6ec Martin K. Petersen 2009-05-23  3253  
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3254  	if (vpd->len >= 64) {
c98a0eb0e90d1ca Martin K. Petersen 2011-03-08  3255  		unsigned int lba_count, desc_count;
e339c1a7c09ef73 Martin K. Petersen 2009-11-26  3256  
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3257  		sdkp->max_ws_blocks = (u32)get_unaligned_be64(&vpd->data[36]);
e339c1a7c09ef73 Martin K. Petersen 2009-11-26  3258  
c98a0eb0e90d1ca Martin K. Petersen 2011-03-08  3259  		if (!sdkp->lbpme)
045d3fe766b0192 Martin K. Petersen 2010-09-10  3260  			goto out;
045d3fe766b0192 Martin K. Petersen 2010-09-10  3261  
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3262  		lba_count = get_unaligned_be32(&vpd->data[20]);
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3263  		desc_count = get_unaligned_be32(&vpd->data[24]);
045d3fe766b0192 Martin K. Petersen 2010-09-10  3264  
c98a0eb0e90d1ca Martin K. Petersen 2011-03-08  3265  		if (lba_count && desc_count)
c98a0eb0e90d1ca Martin K. Petersen 2011-03-08  3266  			sdkp->max_unmap_blocks = lba_count;
e339c1a7c09ef73 Martin K. Petersen 2009-11-26  3267  
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3268  		sdkp->unmap_granularity = get_unaligned_be32(&vpd->data[28]);
e339c1a7c09ef73 Martin K. Petersen 2009-11-26  3269  
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3270  		if (vpd->data[32] & 0x80)
c98a0eb0e90d1ca Martin K. Petersen 2011-03-08  3271  			sdkp->unmap_alignment =
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3272  				get_unaligned_be32(&vpd->data[32]) & ~(1 << 31);
c98a0eb0e90d1ca Martin K. Petersen 2011-03-08  3273  
305e4c4e9709d6b Christoph Hellwig  2024-05-28  3274  		sd_config_discard(sdkp, lim, sd_discard_mode(sdkp));
e339c1a7c09ef73 Martin K. Petersen 2009-11-26  3275  	}
e339c1a7c09ef73 Martin K. Petersen 2009-11-26  3276  
e3deec090558d5c James Bottomley    2009-11-03  3277   out:
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3278  	rcu_read_unlock();
d11b6916961d6ec Martin K. Petersen 2009-05-23  3279  }
d11b6916961d6ec Martin K. Petersen 2009-05-23  3280  
96b171d6dba6a66 Bart Van Assche    2024-01-30  3281  /* Parse the Block Limits Extension VPD page (0xb7) */
96b171d6dba6a66 Bart Van Assche    2024-01-30  3282  static void sd_read_block_limits_ext(struct scsi_disk *sdkp)
96b171d6dba6a66 Bart Van Assche    2024-01-30  3283  {
96b171d6dba6a66 Bart Van Assche    2024-01-30  3284  	struct scsi_vpd *vpd;
96b171d6dba6a66 Bart Van Assche    2024-01-30  3285  
96b171d6dba6a66 Bart Van Assche    2024-01-30  3286  	rcu_read_lock();
96b171d6dba6a66 Bart Van Assche    2024-01-30  3287  	vpd = rcu_dereference(sdkp->device->vpd_pgb7);
96b171d6dba6a66 Bart Van Assche    2024-01-30  3288  	if (vpd && vpd->len >= 2)
96b171d6dba6a66 Bart Van Assche    2024-01-30  3289  		sdkp->rscs = vpd->data[5] & 1;
96b171d6dba6a66 Bart Van Assche    2024-01-30  3290  	rcu_read_unlock();
96b171d6dba6a66 Bart Van Assche    2024-01-30  3291  }
96b171d6dba6a66 Bart Van Assche    2024-01-30  3292  
3821d768912a47d Martin K. Petersen 2009-05-23  3293  /**
3821d768912a47d Martin K. Petersen 2009-05-23  3294   * sd_read_block_characteristics - Query block dev. characteristics
7529fbb0080d67b Damien Le Moal     2017-04-24  3295   * @sdkp: disk to query
3821d768912a47d Martin K. Petersen 2009-05-23  3296   */
305e4c4e9709d6b Christoph Hellwig  2024-05-28  3297  static void sd_read_block_characteristics(struct scsi_disk *sdkp,
305e4c4e9709d6b Christoph Hellwig  2024-05-28  3298  		struct queue_limits *lim)
3821d768912a47d Martin K. Petersen 2009-05-23 @3299  {
89d9475610771b5 Hannes Reinecke    2016-10-18  3300  	struct request_queue *q = sdkp->disk->queue;
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3301  	struct scsi_vpd *vpd;
3821d768912a47d Martin K. Petersen 2009-05-23  3302  	u16 rot;
3821d768912a47d Martin K. Petersen 2009-05-23  3303  
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3304  	rcu_read_lock();
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3305  	vpd = rcu_dereference(sdkp->device->vpd_pgb1);
3821d768912a47d Martin K. Petersen 2009-05-23  3306  
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3307  	if (!vpd || vpd->len < 8) {
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3308  		rcu_read_unlock();
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3309  	        return;
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3310  	}
3821d768912a47d Martin K. Petersen 2009-05-23  3311  
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3312  	rot = get_unaligned_be16(&vpd->data[4]);
7437bb73f087e5f Christoph Hellwig  2023-12-17  3313  	sdkp->zoned = (vpd->data[8] >> 4) & 3;
7fb019c46eeea4e Martin K. Petersen 2022-03-02  3314  	rcu_read_unlock();
3821d768912a47d Martin K. Petersen 2009-05-23  3315  
b277da0a8a59430 Mike Snitzer       2014-10-04  3316  	if (rot == 1) {
8b904b5b6b58b9a Bart Van Assche    2018-03-07  3317  		blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
8b904b5b6b58b9a Bart Van Assche    2018-03-07  3318  		blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, q);
b277da0a8a59430 Mike Snitzer       2014-10-04  3319  	}
3821d768912a47d Martin K. Petersen 2009-05-23  3320  
d73e93b4dfab10c Christoph Hellwig  2023-12-17  3321  

:::::: The code at line 3241 was first introduced by commit
:::::: d11b6916961d6ec7d7215332cbbe9feec086721d sd: Block limits VPD support

:::::: TO: Martin K. Petersen <martin.petersen@oracle.com>
:::::: CC: James Bottomley <James.Bottomley@HansenPartnership.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
