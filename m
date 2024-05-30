Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B19E18398D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059559; cv=none; b=VC6C07yusYhK51ZtsPVKBz5GG5JX0RqVxe31Uo6sF8M1l6cSksrztEAvjTp0jBXgqKduXXGIlIRpdQi8cXKL55scHz5SxUHW4+0/g0DTY9zMi36iOtHhe8jvWqbbqfKubY1LTM4Ilf2dlyPqtcMoABKi9zea7EJ7hjhMC+rMVHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059559; c=relaxed/simple;
	bh=7erkCVuFmRPNhc2qmyC6rDS4204oLjDjOJVwHrs41Hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZdiEDGRy7FhiT/rAKeIBi+s4FTivqCyeVHkxdngMRtLADLTN6ksE6dUyf+6gItMXO1TjkPsHS+fIDMGSdLIeADPGCAXLyLQG4Awl8KH+wOoO1d+OZC4P7wNRzokm8yxGiTKvEg/gUfqGSE9G6NnzeYA6+OyRyets4kGcw9su5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhaFARnI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhaFARnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717059557; x=1748595557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7erkCVuFmRPNhc2qmyC6rDS4204oLjDjOJVwHrs41Hc=;
  b=OhaFARnIE+ZB/cj9EtIEY+ARzhY5OaiZf2vHvgO+Tw5b5QtuLJbmFqex
   u78ustjTJu2jF7y94on6gNq6u7Ugy+NDR1CSwjG0foiNuufC4zXHZ1pKW
   w1J8zIIq4rDh8ecO5/xcdQeSaxYgSUeNLPfiAXPqSsTCVqldraoBBEq8u
   nlqZsRW1VyEByoAVZHF6W5XmyQVUC5ayTYozlKkxXJ1zfVWIwfo01oqWq
   5Bg9+IZ3NDMBvdcQ4HPfaG7ukftG6AHlSPA1wPEBABFlAhdJxxrI/SOjw
   2IYmFXMix1cvZAakK3l4SuPuirO60uRW+dNWJqMxM68Xc3LXfqbov91qo
   A==;
X-CSE-ConnectionGUID: WNETN1i4SYK9fNX6XgJ7Kg==
X-CSE-MsgGUID: e8pnc/M9RmOZpiLM7m0Mag==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24134313"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24134313"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 01:59:17 -0700
X-CSE-ConnectionGUID: ZJvcr5FRQlqrZhVw3PU7Kw==
X-CSE-MsgGUID: bFtEh0kmSoqVMhelQcrAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40621900"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2024 01:59:16 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCbZr-000F2j-0l;
	Thu, 30 May 2024 08:57:37 +0000
Date: Thu, 30 May 2024 16:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:scsi-ulp-limits 10/13] drivers/scsi/sd.c:3689:9: error:
 too many arguments to function 'sd_set_flush_flag'
Message-ID: <202405301629.T1wsZryk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git scsi-ulp-limits
head:   beb731a409c206c822327f03aa100a81fad9dc2a
commit: 6fbf4b9bfce23260dcdf0a44f9de066ec3794ff2 [10/13] sd: convert to the atomic queue limits API
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240530/202405301629.T1wsZryk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301629.T1wsZryk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301629.T1wsZryk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/sd.c: In function 'sd_revalidate_disk':
>> drivers/scsi/sd.c:3689:9: error: too many arguments to function 'sd_set_flush_flag'
    3689 |         sd_set_flush_flag(sdkp, &lim);
         |         ^~~~~~~~~~~~~~~~~
   drivers/scsi/sd.c:123:13: note: declared here
     123 | static void sd_set_flush_flag(struct scsi_disk *sdkp)
         |             ^~~~~~~~~~~~~~~~~


vim +/sd_set_flush_flag +3689 drivers/scsi/sd.c

  3605	
  3606	/**
  3607	 *	sd_revalidate_disk - called the first time a new disk is seen,
  3608	 *	performs disk spin up, read_capacity, etc.
  3609	 *	@disk: struct gendisk we care about
  3610	 **/
  3611	static int sd_revalidate_disk(struct gendisk *disk)
  3612	{
  3613		struct scsi_disk *sdkp = scsi_disk(disk);
  3614		struct scsi_device *sdp = sdkp->device;
  3615		struct request_queue *q = sdkp->disk->queue;
  3616		sector_t old_capacity = sdkp->capacity;
  3617		struct queue_limits lim;
  3618		unsigned char *buffer;
  3619		unsigned int dev_max;
  3620		int err;
  3621	
  3622		SCSI_LOG_HLQUEUE(3, sd_printk(KERN_INFO, sdkp,
  3623					      "sd_revalidate_disk\n"));
  3624	
  3625		/*
  3626		 * If the device is offline, don't try and read capacity or any
  3627		 * of the other niceties.
  3628		 */
  3629		if (!scsi_device_online(sdp))
  3630			goto out;
  3631	
  3632		buffer = kmalloc(SD_BUF_SIZE, GFP_KERNEL);
  3633		if (!buffer) {
  3634			sd_printk(KERN_WARNING, sdkp, "sd_revalidate_disk: Memory "
  3635				  "allocation failure.\n");
  3636			goto out;
  3637		}
  3638	
  3639		sd_spinup_disk(sdkp);
  3640	
  3641		lim = queue_limits_start_update(sdkp->disk->queue);
  3642	
  3643		/*
  3644		 * Without media there is no reason to ask; moreover, some devices
  3645		 * react badly if we do.
  3646		 */
  3647		if (sdkp->media_present) {
  3648			sd_read_capacity(sdkp, &lim, buffer);
  3649			/*
  3650			 * Some USB/UAS devices return generic values for mode pages
  3651			 * until the media has been accessed. Trigger a READ operation
  3652			 * to force the device to populate mode pages.
  3653			 */
  3654			if (sdp->read_before_ms)
  3655				sd_read_block_zero(sdkp);
  3656			/*
  3657			 * set the default to rotational.  All non-rotational devices
  3658			 * support the block characteristics VPD page, which will
  3659			 * cause this to be updated correctly and any device which
  3660			 * doesn't support it should be treated as rotational.
  3661			 */
  3662			blk_queue_flag_clear(QUEUE_FLAG_NONROT, q);
  3663			blk_queue_flag_set(QUEUE_FLAG_ADD_RANDOM, q);
  3664	
  3665			if (scsi_device_supports_vpd(sdp)) {
  3666				sd_read_block_provisioning(sdkp);
  3667				sd_read_block_limits(sdkp, &lim);
  3668				sd_read_block_limits_ext(sdkp);
  3669				sd_read_block_characteristics(sdkp, &lim);
  3670				sd_zbc_read_zones(sdkp, &lim, buffer);
  3671				sd_read_cpr(sdkp);
  3672			}
  3673	
  3674			sd_print_capacity(sdkp, old_capacity);
  3675	
  3676			sd_read_write_protect_flag(sdkp, buffer);
  3677			sd_read_cache_type(sdkp, buffer);
  3678			sd_read_io_hints(sdkp, buffer);
  3679			sd_read_app_tag_own(sdkp, buffer);
  3680			sd_read_write_same(sdkp, buffer);
  3681			sd_read_security(sdkp, buffer);
  3682			sd_config_protection(sdkp);
  3683		}
  3684	
  3685		/*
  3686		 * We now have all cache related info, determine how we deal
  3687		 * with flush requests.
  3688		 */
> 3689		sd_set_flush_flag(sdkp, &lim);
  3690	
  3691		/* Initial block count limit based on CDB TRANSFER LENGTH field size. */
  3692		dev_max = sdp->use_16_for_rw ? SD_MAX_XFER_BLOCKS : SD_DEF_XFER_BLOCKS;
  3693	
  3694		/* Some devices report a maximum block count for READ/WRITE requests. */
  3695		dev_max = min_not_zero(dev_max, sdkp->max_xfer_blocks);
  3696		lim.max_dev_sectors = logical_to_sectors(sdp, dev_max);
  3697	
  3698		if (sd_validate_min_xfer_size(sdkp))
  3699			lim.io_min = logical_to_bytes(sdp, sdkp->min_xfer_blocks);
  3700		else
  3701			lim.io_min = 0;
  3702	
  3703		/*
  3704		 * Limit default to SCSI host optimal sector limit if set. There may be
  3705		 * an impact on performance for when the size of a request exceeds this
  3706		 * host limit.
  3707		 */
  3708		lim.io_opt = sdp->host->opt_sectors << SECTOR_SHIFT;
  3709		if (sd_validate_opt_xfer_size(sdkp, dev_max)) {
  3710			lim.io_opt = min_not_zero(lim.io_opt,
  3711					logical_to_bytes(sdp, sdkp->opt_xfer_blocks));
  3712		}
  3713	
  3714		sdkp->first_scan = 0;
  3715	
  3716		set_capacity_and_notify(disk, logical_to_sectors(sdp, sdkp->capacity));
  3717		sd_config_write_same(sdkp, &lim);
  3718		kfree(buffer);
  3719	
  3720		blk_mq_freeze_queue(sdkp->disk->queue);
  3721		err = queue_limits_commit_update(sdkp->disk->queue, &lim);
  3722		blk_mq_unfreeze_queue(sdkp->disk->queue);
  3723		if (err)
  3724			return err;
  3725	
  3726		/*
  3727		 * For a zoned drive, revalidating the zones can be done only once
  3728		 * the gendisk capacity is set. So if this fails, set back the gendisk
  3729		 * capacity to 0.
  3730		 */
  3731		if (sd_zbc_revalidate_zones(sdkp))
  3732			set_capacity_and_notify(disk, 0);
  3733	
  3734	 out:
  3735		return 0;
  3736	}
  3737	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
