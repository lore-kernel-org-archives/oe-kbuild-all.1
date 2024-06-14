Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A5E1836E9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 08:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718353618; cv=none; b=VOPBfx9tkJTL9HuLBhIIQ5Lw5DdgUni2WvPuWKQcXSAZeoKihSQvcy5jKZNl5hS2JkGa0ggdecDwLEE+tH+q/vLjj1mDrsI6Zlobx3FDqWhJWPf9X0LjVyM/vJ4OuRQ7uACWSKl1140VqDuhBqkh9EMJKyeoq4NEy6Ro0P14X4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718353618; c=relaxed/simple;
	bh=m0dEE3wY6+f7iEmNdznOFkubpzT2eL3djhw25hwNo+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ll1UAEdG+A+3c/4yStZi+kI/tU0O98Czcl+bHcJlhvlXrRfL6K/dI0N3rM19WZf0jNqtwOnW+GOdQrBfdCQaFeFwAILTbBl2sS3sFkf4Deypx8XF2r4oMks8NQYcjPtPRCmsXH1WCfy1jG7NY+2R+mfRpBVxfkLdn3ktCJ+/4Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiwpXZBG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiwpXZBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718353615; x=1749889615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m0dEE3wY6+f7iEmNdznOFkubpzT2eL3djhw25hwNo+0=;
  b=LiwpXZBGQe+Wj7e78tPFnoyaGbvUMCj/nxGsYEK6L9lB2zduakfdtOCn
   qlQuM6/i+spiLUvW8e88ft0m3gIULtiXu4WjfMENYeaRnwvJd2J3emuVB
   04ZUnQ395kEDUy5oR+rx0Npsj9vfpuHXvhO5eZDD7ogZM+IG2+twM8fmF
   7hqDjydGP/mSbO0deZ6uRPaNsLnbTaCzoLV5g8T+qrbW2cwgjGFuCnBaN
   6OwVioc0Zelq709S3exvd5YabLzTYvRveHdgN+1Aq/RIFTYo9dLpJJokb
   UzDYfkIgP6OCbzy57jj7hOekbBFYn2UgMisL62/SK1qU+fvyUI4s69hIn
   g==;
X-CSE-ConnectionGUID: 7lS+TliMRgS+YpKSkvsB4w==
X-CSE-MsgGUID: zQe3QIphR5WsUjN9a3BKPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15363842"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15363842"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 01:26:47 -0700
X-CSE-ConnectionGUID: 9NBB4xkPSwqpcaOGe0fKQw==
X-CSE-MsgGUID: BMSOSc/mTm2fd5b03rxaHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="71204708"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2024 01:26:46 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI2Gh-00011Y-1w;
	Fri, 14 Jun 2024 08:26:43 +0000
Date: Fri, 14 Jun 2024 16:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 12/12] block: move integrity information into queue_limits
Message-ID: <202406141610.lfc2j4LN-lkp@intel.com>
References: <20240613084839.1044015-13-hch@lst.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613084839.1044015-13-hch@lst.de>

Hi Christoph,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10-rc3]
[cannot apply to axboe-block/for-next device-mapper-dm/for-next mkp-scsi/for-next song-md/md-next next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/md-raid0-don-t-free-conf-on-raid0_run-failure/20240613-190028
base:   linus/master
patch link:    https://lore.kernel.org/r/20240613084839.1044015-13-hch%40lst.de
patch subject: [PATCH 12/12] block: move integrity information into queue_limits
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240614/202406141610.lfc2j4LN-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141610.lfc2j4LN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141610.lfc2j4LN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/sd.c: In function 'sd_revalidate_disk':
>> drivers/scsi/sd.c:3658:45: error: 'lim' undeclared (first use in this function)
    3658 |                 sd_config_protection(sdkp, &lim);
         |                                             ^~~
   drivers/scsi/sd.c:3658:45: note: each undeclared identifier is reported only once for each function it appears in


vim +/lim +3658 drivers/scsi/sd.c

  3585	
  3586	/**
  3587	 *	sd_revalidate_disk - called the first time a new disk is seen,
  3588	 *	performs disk spin up, read_capacity, etc.
  3589	 *	@disk: struct gendisk we care about
  3590	 **/
  3591	static int sd_revalidate_disk(struct gendisk *disk)
  3592	{
  3593		struct scsi_disk *sdkp = scsi_disk(disk);
  3594		struct scsi_device *sdp = sdkp->device;
  3595		struct request_queue *q = sdkp->disk->queue;
  3596		sector_t old_capacity = sdkp->capacity;
  3597		unsigned char *buffer;
  3598		unsigned int dev_max, rw_max;
  3599	
  3600		SCSI_LOG_HLQUEUE(3, sd_printk(KERN_INFO, sdkp,
  3601					      "sd_revalidate_disk\n"));
  3602	
  3603		/*
  3604		 * If the device is offline, don't try and read capacity or any
  3605		 * of the other niceties.
  3606		 */
  3607		if (!scsi_device_online(sdp))
  3608			goto out;
  3609	
  3610		buffer = kmalloc(SD_BUF_SIZE, GFP_KERNEL);
  3611		if (!buffer) {
  3612			sd_printk(KERN_WARNING, sdkp, "sd_revalidate_disk: Memory "
  3613				  "allocation failure.\n");
  3614			goto out;
  3615		}
  3616	
  3617		sd_spinup_disk(sdkp);
  3618	
  3619		/*
  3620		 * Without media there is no reason to ask; moreover, some devices
  3621		 * react badly if we do.
  3622		 */
  3623		if (sdkp->media_present) {
  3624			sd_read_capacity(sdkp, buffer);
  3625			/*
  3626			 * Some USB/UAS devices return generic values for mode pages
  3627			 * until the media has been accessed. Trigger a READ operation
  3628			 * to force the device to populate mode pages.
  3629			 */
  3630			if (sdp->read_before_ms)
  3631				sd_read_block_zero(sdkp);
  3632			/*
  3633			 * set the default to rotational.  All non-rotational devices
  3634			 * support the block characteristics VPD page, which will
  3635			 * cause this to be updated correctly and any device which
  3636			 * doesn't support it should be treated as rotational.
  3637			 */
  3638			blk_queue_flag_clear(QUEUE_FLAG_NONROT, q);
  3639			blk_queue_flag_set(QUEUE_FLAG_ADD_RANDOM, q);
  3640	
  3641			if (scsi_device_supports_vpd(sdp)) {
  3642				sd_read_block_provisioning(sdkp);
  3643				sd_read_block_limits(sdkp);
  3644				sd_read_block_limits_ext(sdkp);
  3645				sd_read_block_characteristics(sdkp);
  3646				sd_zbc_read_zones(sdkp, buffer);
  3647				sd_read_cpr(sdkp);
  3648			}
  3649	
  3650			sd_print_capacity(sdkp, old_capacity);
  3651	
  3652			sd_read_write_protect_flag(sdkp, buffer);
  3653			sd_read_cache_type(sdkp, buffer);
  3654			sd_read_io_hints(sdkp, buffer);
  3655			sd_read_app_tag_own(sdkp, buffer);
  3656			sd_read_write_same(sdkp, buffer);
  3657			sd_read_security(sdkp, buffer);
> 3658			sd_config_protection(sdkp, &lim);
  3659		}
  3660	
  3661		/*
  3662		 * We now have all cache related info, determine how we deal
  3663		 * with flush requests.
  3664		 */
  3665		sd_set_flush_flag(sdkp);
  3666	
  3667		/* Initial block count limit based on CDB TRANSFER LENGTH field size. */
  3668		dev_max = sdp->use_16_for_rw ? SD_MAX_XFER_BLOCKS : SD_DEF_XFER_BLOCKS;
  3669	
  3670		/* Some devices report a maximum block count for READ/WRITE requests. */
  3671		dev_max = min_not_zero(dev_max, sdkp->max_xfer_blocks);
  3672		q->limits.max_dev_sectors = logical_to_sectors(sdp, dev_max);
  3673	
  3674		if (sd_validate_min_xfer_size(sdkp))
  3675			blk_queue_io_min(sdkp->disk->queue,
  3676					 logical_to_bytes(sdp, sdkp->min_xfer_blocks));
  3677		else
  3678			blk_queue_io_min(sdkp->disk->queue, 0);
  3679	
  3680		if (sd_validate_opt_xfer_size(sdkp, dev_max)) {
  3681			q->limits.io_opt = logical_to_bytes(sdp, sdkp->opt_xfer_blocks);
  3682			rw_max = logical_to_sectors(sdp, sdkp->opt_xfer_blocks);
  3683		} else {
  3684			q->limits.io_opt = 0;
  3685			rw_max = min_not_zero(logical_to_sectors(sdp, dev_max),
  3686					      (sector_t)BLK_DEF_MAX_SECTORS_CAP);
  3687		}
  3688	
  3689		/*
  3690		 * Limit default to SCSI host optimal sector limit if set. There may be
  3691		 * an impact on performance for when the size of a request exceeds this
  3692		 * host limit.
  3693		 */
  3694		rw_max = min_not_zero(rw_max, sdp->host->opt_sectors);
  3695	
  3696		/* Do not exceed controller limit */
  3697		rw_max = min(rw_max, queue_max_hw_sectors(q));
  3698	
  3699		/*
  3700		 * Only update max_sectors if previously unset or if the current value
  3701		 * exceeds the capabilities of the hardware.
  3702		 */
  3703		if (sdkp->first_scan ||
  3704		    q->limits.max_sectors > q->limits.max_dev_sectors ||
  3705		    q->limits.max_sectors > q->limits.max_hw_sectors) {
  3706			q->limits.max_sectors = rw_max;
  3707			q->limits.max_user_sectors = rw_max;
  3708		}
  3709	
  3710		sdkp->first_scan = 0;
  3711	
  3712		set_capacity_and_notify(disk, logical_to_sectors(sdp, sdkp->capacity));
  3713		sd_config_write_same(sdkp);
  3714		kfree(buffer);
  3715	
  3716		/*
  3717		 * For a zoned drive, revalidating the zones can be done only once
  3718		 * the gendisk capacity is set. So if this fails, set back the gendisk
  3719		 * capacity to 0.
  3720		 */
  3721		if (sd_zbc_revalidate_zones(sdkp))
  3722			set_capacity_and_notify(disk, 0);
  3723	
  3724	 out:
  3725		return 0;
  3726	}
  3727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
