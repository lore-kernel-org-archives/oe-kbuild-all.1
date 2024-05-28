Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C152E646
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 18:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716922138; cv=none; b=XrzfCpkVFEDQciifXAOBaqCgQt47NouTSG0LboSXpB0Wa7VSnjIJaUApzm82nD134ig+Aj/kbDWYr3eL8P9Tf9EWN8/MF/nSPmwSjyGkuUktwoTlda3sW1Wb2keF5V7e9+eDejNLnr8lGw+e7bYz3h0j7Y68OAITCm5G+US5FX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716922138; c=relaxed/simple;
	bh=QKA17a8vx/wZQk9MYsCgMxGJMu+FfOwgJRhpBNDRwJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gr3ePlsQ2VU1Kw4bfabTiU8hVtKF60BBLiUdYrIwiSir5+tFisLw9uNPgN7vnnK5yhF/Lc9SsBA+7K8Rn8YlTYMfsQ/Ko448cCdVZ0ncqta4nHiFJMz8yerXLZTfVBNq9rCJ2ehb5TtTxQPBPnfqTDAmMmT5ApeMDRs62ZOM77A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aauiGsQA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aauiGsQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716922137; x=1748458137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QKA17a8vx/wZQk9MYsCgMxGJMu+FfOwgJRhpBNDRwJg=;
  b=aauiGsQAOF+ui9hn+jeeKgFb0gtrbqjdm+qdy1f61PY5Pw+pu8T+mzut
   gmUmdLw8rrz1L0UNVu6c5b4qorXEzc1lkCVRKr2UPNrMMAh9kD4lh7UGR
   UWPvv70lA5MuiHfDRr5QDVtbOpHFKWk6FAePb5AQoZiiq19ba+pq/hW1h
   3SsASosKI5RBaM2ymAotCedcfwjN5Q4uqqtQmtXmZS0UkkS+JYS82YQdG
   zexxM30N8phM6CtEZTBqrGfCmX2Uc0AEALLwqsb0G/3oqYyzW84KeQIkS
   Amuk3xDKu3OpCUO3j37vuo87z1nS428OI3sM2mdQilSuQiV9Y3186hyhQ
   w==;
X-CSE-ConnectionGUID: ukGvaFilSEuc2v7+A73qmA==
X-CSE-MsgGUID: rXI81Zs6TYaU49P7FMjFJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13238090"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="13238090"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 11:48:57 -0700
X-CSE-ConnectionGUID: 9tGUyXMNQLertOOCZnfPMg==
X-CSE-MsgGUID: twEpaq0AQsqq0JGBqu4KYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="35083313"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 May 2024 11:48:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC1sS-000CdL-0p;
	Tue, 28 May 2024 18:48:52 +0000
Date: Wed, 29 May 2024 02:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:scsi-ulp-limits 9/12] drivers/scsi/sd.c:3672:34: error:
 too many arguments to function call, expected 2, have 3
Message-ID: <202405290222.elu7yZMW-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240529/202405290222.elu7yZMW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290222.elu7yZMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290222.elu7yZMW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/sd.c:3672:34: error: too many arguments to function call, expected 2, have 3
                           sd_zbc_read_zones(sdkp, &lim, buffer);
                           ~~~~~~~~~~~~~~~~~             ^~~~~~
   drivers/scsi/sd.h:254:19: note: 'sd_zbc_read_zones' declared here
   static inline int sd_zbc_read_zones(struct scsi_disk *sdkp, u8 buf[SD_BUF_SIZE])
                     ^
   1 error generated.


vim +3672 drivers/scsi/sd.c

  3607	
  3608	/**
  3609	 *	sd_revalidate_disk - called the first time a new disk is seen,
  3610	 *	performs disk spin up, read_capacity, etc.
  3611	 *	@disk: struct gendisk we care about
  3612	 **/
  3613	static int sd_revalidate_disk(struct gendisk *disk)
  3614	{
  3615		struct scsi_disk *sdkp = scsi_disk(disk);
  3616		struct scsi_device *sdp = sdkp->device;
  3617		struct request_queue *q = sdkp->disk->queue;
  3618		sector_t old_capacity = sdkp->capacity;
  3619		struct queue_limits lim;
  3620		unsigned char *buffer;
  3621		unsigned int dev_max;
  3622		int err;
  3623	
  3624		SCSI_LOG_HLQUEUE(3, sd_printk(KERN_INFO, sdkp,
  3625					      "sd_revalidate_disk\n"));
  3626	
  3627		/*
  3628		 * If the device is offline, don't try and read capacity or any
  3629		 * of the other niceties.
  3630		 */
  3631		if (!scsi_device_online(sdp))
  3632			goto out;
  3633	
  3634		buffer = kmalloc(SD_BUF_SIZE, GFP_KERNEL);
  3635		if (!buffer) {
  3636			sd_printk(KERN_WARNING, sdkp, "sd_revalidate_disk: Memory "
  3637				  "allocation failure.\n");
  3638			goto out;
  3639		}
  3640	
  3641		sd_spinup_disk(sdkp);
  3642	
  3643		lim = queue_limits_start_update(sdkp->disk->queue);
  3644	
  3645		/*
  3646		 * Without media there is no reason to ask; moreover, some devices
  3647		 * react badly if we do.
  3648		 */
  3649		if (sdkp->media_present) {
  3650			sd_read_capacity(sdkp, &lim, buffer);
  3651			/*
  3652			 * Some USB/UAS devices return generic values for mode pages
  3653			 * until the media has been accessed. Trigger a READ operation
  3654			 * to force the device to populate mode pages.
  3655			 */
  3656			if (sdp->read_before_ms)
  3657				sd_read_block_zero(sdkp);
  3658			/*
  3659			 * set the default to rotational.  All non-rotational devices
  3660			 * support the block characteristics VPD page, which will
  3661			 * cause this to be updated correctly and any device which
  3662			 * doesn't support it should be treated as rotational.
  3663			 */
  3664			blk_queue_flag_clear(QUEUE_FLAG_NONROT, q);
  3665			blk_queue_flag_set(QUEUE_FLAG_ADD_RANDOM, q);
  3666	
  3667			if (scsi_device_supports_vpd(sdp)) {
  3668				sd_read_block_provisioning(sdkp);
  3669				sd_read_block_limits(sdkp, &lim);
  3670				sd_read_block_limits_ext(sdkp);
  3671				sd_read_block_characteristics(sdkp, &lim);
> 3672				sd_zbc_read_zones(sdkp, &lim, buffer);
  3673				sd_read_cpr(sdkp);
  3674			}
  3675	
  3676			sd_print_capacity(sdkp, old_capacity);
  3677	
  3678			sd_read_write_protect_flag(sdkp, buffer);
  3679			sd_read_cache_type(sdkp, buffer);
  3680			sd_read_io_hints(sdkp, buffer);
  3681			sd_read_app_tag_own(sdkp, buffer);
  3682			sd_read_write_same(sdkp, buffer);
  3683			sd_read_security(sdkp, buffer);
  3684			sd_config_protection(sdkp);
  3685		}
  3686	
  3687		/*
  3688		 * We now have all cache related info, determine how we deal
  3689		 * with flush requests.
  3690		 */
  3691		sd_set_flush_flag(sdkp);
  3692	
  3693		/* Initial block count limit based on CDB TRANSFER LENGTH field size. */
  3694		dev_max = sdp->use_16_for_rw ? SD_MAX_XFER_BLOCKS : SD_DEF_XFER_BLOCKS;
  3695	
  3696		/* Some devices report a maximum block count for READ/WRITE requests. */
  3697		dev_max = min_not_zero(dev_max, sdkp->max_xfer_blocks);
  3698		q->limits.max_dev_sectors = logical_to_sectors(sdp, dev_max);
  3699	
  3700		if (sd_validate_min_xfer_size(sdkp))
  3701			lim.io_min = logical_to_bytes(sdp, sdkp->min_xfer_blocks);
  3702		else
  3703			lim.io_min = 0;
  3704	
  3705		/*
  3706		 * Limit default to SCSI host optimal sector limit if set. There may be
  3707		 * an impact on performance for when the size of a request exceeds this
  3708		 * host limit.
  3709		 */
  3710		lim.io_opt = sdp->host->opt_sectors << SECTOR_SHIFT;
  3711		if (sd_validate_opt_xfer_size(sdkp, dev_max)) {
  3712			lim.io_opt = min_not_zero(lim.io_opt,
  3713					logical_to_bytes(sdp, sdkp->opt_xfer_blocks));
  3714		}
  3715	
  3716		sdkp->first_scan = 0;
  3717	
  3718		set_capacity_and_notify(disk, logical_to_sectors(sdp, sdkp->capacity));
  3719		sd_config_write_same(sdkp, &lim);
  3720		kfree(buffer);
  3721	
  3722		blk_mq_freeze_queue(sdkp->disk->queue);
  3723		err = queue_limits_commit_update(sdkp->disk->queue, &lim);
  3724		blk_mq_unfreeze_queue(sdkp->disk->queue);
  3725		if (err)
  3726			return err;
  3727	
  3728		/*
  3729		 * For a zoned drive, revalidating the zones can be done only once
  3730		 * the gendisk capacity is set. So if this fails, set back the gendisk
  3731		 * capacity to 0.
  3732		 */
  3733		if (sd_zbc_revalidate_zones(sdkp))
  3734			set_capacity_and_notify(disk, 0);
  3735	
  3736	 out:
  3737		return 0;
  3738	}
  3739	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
