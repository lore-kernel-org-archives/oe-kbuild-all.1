Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FB38DF9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731142367; cv=none; b=NjvKq/LspUvMVQYVDLwkCR69rzWc6YmKRNWKHBMIlPYSSxWi1jbZ29DlB9MiKmove4C1Ss3JA2y5DTA0oAw+6Kv8Zpf4924Bv6jhvnZWLHCQgUeWBM89rB/8aKs1Ce4zwkUcvKM0QYpLFqAw6zx+W31zbron738bQsrxDWy/EJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731142367; c=relaxed/simple;
	bh=yDZV7PRZh4YSjZFgF/dnczxYkzbX4qfA5gpP7C6Yo6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lw1hjpr+SDitlI46jfeRaBdcebEA3o/XdQaFbQwf/40SSRIirJ4Qx9xvcQsGfUpKTU3dzxLOz19FSrix1fmlJElOO5M9QEQGK47Do4y50U2Td7Y7oqLVDrvDaDw9dBq1cJ2lvbamql+XI/GHtmJCdN+roQXkcLbkzlNKl8E6br4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/YN2aNM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/YN2aNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731142365; x=1762678365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yDZV7PRZh4YSjZFgF/dnczxYkzbX4qfA5gpP7C6Yo6c=;
  b=f/YN2aNMmYk3x6MesHKGSP3vXYZfCiXm952pkryhuT4wedX+xmVQIC3c
   JOS0Sm3y3lOemNa+h8mQ3hgB4nk1UR7jgc5YqZiz20dJex1asU1DscfPk
   2iq5FK4BnXz62Ga2RQejPYpJqx0dFw033SJ2HWky4Fjf5IsyGeZY6wlFQ
   v6Y9lO/TG5UXrgsqSD2GY4jpGlG/ZSPSIxO2zGHUiWY9a9nAS2aU+3hry
   zjtrMig9N3wPO+rnTk7g7zJanW2Iot8sSJTj+JRJ6rMTJ9EAycT2AdM2E
   JF2zZikIvNLwwUNrwic0oJRE0HDwB6sSqUR5Hb48+3RIxg4IH2VLH0HSE
   g==;
X-CSE-ConnectionGUID: 41it2KMTTjqBZfpnYsjE+A==
X-CSE-MsgGUID: ZGE4fHeHQUmyu8ycs93Zng==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="18646744"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="18646744"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 00:52:41 -0800
X-CSE-ConnectionGUID: Vp/uNa/JQLam8Q87/ZSX0w==
X-CSE-MsgGUID: r2wii2j3QHOp7xfoXOz+XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="109243722"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2024 00:52:40 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9hCv-000sEs-1m;
	Sat, 09 Nov 2024 08:52:37 +0000
Date: Sat, 9 Nov 2024 16:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: himanshu.madhani@oracle.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 7/8] scsi: Add multipath disk init code for sd driver
Message-ID: <202411091606.uMaHJONG-lkp@intel.com>
References: <20241109044529.992935-8-himanshu.madhani@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109044529.992935-8-himanshu.madhani@oracle.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 128faa1845a2d5b0178b986f3bd18fb38cc08cc2]

url:    https://github.com/intel-lab-lkp/linux/commits/himanshu-madhani-oracle-com/scsi-Add-multipath-device-support/20241109-124908
base:   128faa1845a2d5b0178b986f3bd18fb38cc08cc2
patch link:    https://lore.kernel.org/r/20241109044529.992935-8-himanshu.madhani%40oracle.com
patch subject: [RFC v1 7/8] scsi: Add multipath disk init code for sd driver
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241109/202411091606.uMaHJONG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091606.uMaHJONG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091606.uMaHJONG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/sd.c: In function 'sd_revalidate_disk':
>> drivers/scsi/sd.c:3829:54: error: 'struct scsi_device' has no member named 'mpath_disk'
    3829 |                 struct queue_limits *mpath_lim = &sdp->mpath_disk->queue->limits;
         |                                                      ^~
   drivers/scsi/sd.c:3831:40: error: 'struct scsi_device' has no member named 'mpath_disk'
    3831 |                 blk_mq_freeze_queue(sdp->mpath_disk->queue);
         |                                        ^~
   drivers/scsi/sd.c:3832:52: error: 'struct scsi_device' has no member named 'mpath_disk'
    3832 |                 lim = queue_limits_start_update(sdp->mpath_disk->queue);
         |                                                    ^~
   drivers/scsi/sd.c:3837:50: error: 'struct scsi_device' has no member named 'mpath_disk'
    3837 |                 queue_limits_stack_bdev(&lim, sdp->mpath_disk->part0, 0,
         |                                                  ^~
   drivers/scsi/sd.c:3838:24: error: 'struct scsi_device' has no member named 'mpath_disk'
    3838 |                     sdp->mpath_disk->disk_name);
         |                        ^~
   drivers/scsi/sd.c:3840:20: error: 'struct scsi_device' has no member named 'mpath_disk'
    3840 |                 sdp->mpath_disk->flags |= GENHD_FL_HIDDEN;
         |                    ^~
   drivers/scsi/sd.c:3842:44: error: 'struct scsi_device' has no member named 'mpath_disk'
    3842 |                 set_capacity_and_notify(sdp->mpath_disk,
         |                                            ^~
   drivers/scsi/sd.c:3845:53: error: 'struct scsi_device' has no member named 'mpath_disk'
    3845 |                 err = queue_limits_commit_update(sdp->mpath_disk->queue, &lim);
         |                                                     ^~
   drivers/scsi/sd.c:3847:47: error: 'struct scsi_device' has no member named 'mpath_disk'
    3847 |                 scsi_mpath_revalidate_path(sdp->mpath_disk,
         |                                               ^~
   drivers/scsi/sd.c:3850:42: error: 'struct scsi_device' has no member named 'mpath_disk'
    3850 |                 blk_mq_unfreeze_queue(sdp->mpath_disk->queue);
         |                                          ^~
   drivers/scsi/sd.c: In function 'sd_probe':
>> drivers/scsi/sd.c:3980:43: error: 'struct scsi_device' has no member named 'is_shared'
    3980 |         if (scsi_mpath_enabled(sdp) && sdp->is_shared)
         |                                           ^~
   drivers/scsi/sd.c:4001:29: error: 'struct scsi_device' has no member named 'mpath_disk'
    4001 |                 snprintf(sdp->mpath_disk->disk_name, DISK_NAME_LEN, "mpath%dsd%d",
         |                             ^~
   drivers/scsi/sd.c:4066:20: error: 'struct scsi_device' has no member named 'mpath_disk'
    4066 |                 sdp->mpath_disk->major = sd_major((index & 0xf0) >> 4);
         |                    ^~
   drivers/scsi/sd.c:4067:20: error: 'struct scsi_device' has no member named 'mpath_disk'
    4067 |                 sdp->mpath_disk->first_minor = ((index & 0xf) << 4) | (index & 0xfff00);
         |                    ^~
   drivers/scsi/sd.c:4068:20: error: 'struct scsi_device' has no member named 'mpath_disk'
    4068 |                 sdp->mpath_disk->minors = SD_MINORS;
         |                    ^~
   In file included from include/linux/log2.h:12,
                    from include/asm-generic/getorder.h:8,
                    from arch/x86/include/asm/page.h:90,
                    from arch/x86/include/asm/processor.h:20,
                    from include/linux/sched.h:13,
                    from include/linux/mempool.h:8,
                    from include/linux/bio.h:8,
                    from include/linux/bio-integrity.h:5,
                    from drivers/scsi/sd.c:36:
>> drivers/scsi/sd.c:4072:31: error: 'SCSI_MPATH_DISK_LIVE' undeclared (first use in this function); did you mean 'SCSI_MPATH_INVALID'?
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:44:32: note: in definition of macro 'bitop'
      44 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   drivers/scsi/sd.c:4072:22: note: in expansion of macro 'test_bit'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                      ^~~~~~~~
   drivers/scsi/sd.c:4072:31: note: each undeclared identifier is reported only once for each function it appears in
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:44:32: note: in definition of macro 'bitop'
      44 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   drivers/scsi/sd.c:4072:22: note: in expansion of macro 'test_bit'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                      ^~~~~~~~
>> drivers/scsi/sd.c:4072:57: error: 'struct scsi_device' has no member named 'mpath_flags'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                                                         ^~
   include/linux/bitops.h:45:44: note: in definition of macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   drivers/scsi/sd.c:4072:22: note: in expansion of macro 'test_bit'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                      ^~~~~~~~
>> drivers/scsi/sd.c:4072:57: error: 'struct scsi_device' has no member named 'mpath_flags'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                                                         ^~
   include/linux/bitops.h:46:23: note: in definition of macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   drivers/scsi/sd.c:4072:22: note: in expansion of macro 'test_bit'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                      ^~~~~~~~
>> drivers/scsi/sd.c:4072:57: error: 'struct scsi_device' has no member named 'mpath_flags'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                                                         ^~
   include/linux/bitops.h:47:57: note: in definition of macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   drivers/scsi/sd.c:4072:22: note: in expansion of macro 'test_bit'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                      ^~~~~~~~
>> drivers/scsi/sd.c:4072:57: error: 'struct scsi_device' has no member named 'mpath_flags'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                                                         ^~
   include/linux/bitops.h:48:24: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   drivers/scsi/sd.c:4072:22: note: in expansion of macro 'test_bit'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                      ^~~~~~~~
>> drivers/scsi/sd.c:4072:57: error: 'struct scsi_device' has no member named 'mpath_flags'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                                                         ^~
   include/linux/bitops.h:48:39: note: in definition of macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
   drivers/scsi/sd.c:4072:22: note: in expansion of macro 'test_bit'
    4072 |                 if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
         |                      ^~~~~~~~
   drivers/scsi/sd.c:4074:61: error: 'struct scsi_device' has no member named 'mpath_flags'
    4074 |                         clear_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags);
         |                                                             ^~
   drivers/scsi/sd.c:4075:37: error: 'struct scsi_device' has no member named 'mpath_disk'
    4075 |                         put_disk(sdp->mpath_disk);
         |                                     ^~
   drivers/scsi/sd.c: In function 'sd_shutdown':
>> drivers/scsi/sd.c:4243:52: error: 'struct Scsi_Host' has no member named 'mpath_dev'
    4243 |                         synchronize_srcu(&sdp->host->mpath_dev->srcu);
         |                                                    ^~
   drivers/scsi/sd.c:4245:38: error: 'struct Scsi_Host' has no member named 'mpath_dev'
    4245 |                 mutex_lock(&sdp->host->mpath_dev->mpath_lock);
         |                                      ^~
>> drivers/scsi/sd.c:4247:42: error: 'struct Scsi_Host' has no member named 'mpath_sdev'
    4247 |                 if (list_empty(&sdp->host->mpath_sdev)) {
         |                                          ^~
>> drivers/scsi/sd.c:4248:43: error: 'struct scsi_device' has no member named 'mpath_entry'
    4248 |                         list_del_init(&sdp->mpath_entry);
         |                                           ^~
   drivers/scsi/sd.c:4251:40: error: 'struct Scsi_Host' has no member named 'mpath_dev'
    4251 |                 mutex_unlock(&sdp->host->mpath_dev->mpath_lock);
         |                                        ^~


vim +3829 drivers/scsi/sd.c

  3699	
  3700	/**
  3701	 *	sd_revalidate_disk - called the first time a new disk is seen,
  3702	 *	performs disk spin up, read_capacity, etc.
  3703	 *	@disk: struct gendisk we care about
  3704	 **/
  3705	static int sd_revalidate_disk(struct gendisk *disk)
  3706	{
  3707		struct scsi_disk *sdkp = scsi_disk(disk);
  3708		struct scsi_device *sdp = sdkp->device;
  3709		sector_t old_capacity = sdkp->capacity;
  3710		struct queue_limits lim;
  3711		unsigned char *buffer;
  3712		unsigned int dev_max;
  3713		int err;
  3714	
  3715		SCSI_LOG_HLQUEUE(3, sd_printk(KERN_INFO, sdkp,
  3716					      "sd_revalidate_disk\n"));
  3717	
  3718		/*
  3719		 * If the device is offline, don't try and read capacity or any
  3720		 * of the other niceties.
  3721		 */
  3722		if (!scsi_device_online(sdp))
  3723			goto out;
  3724	
  3725		buffer = kmalloc(SD_BUF_SIZE, GFP_KERNEL);
  3726		if (!buffer) {
  3727			sd_printk(KERN_WARNING, sdkp, "sd_revalidate_disk: Memory "
  3728				  "allocation failure.\n");
  3729			goto out;
  3730		}
  3731	
  3732		sd_spinup_disk(sdkp);
  3733	
  3734		lim = queue_limits_start_update(sdkp->disk->queue);
  3735	
  3736		/*
  3737		 * Without media there is no reason to ask; moreover, some devices
  3738		 * react badly if we do.
  3739		 */
  3740		if (sdkp->media_present) {
  3741			sd_read_capacity(sdkp, &lim, buffer);
  3742			/*
  3743			 * Some USB/UAS devices return generic values for mode pages
  3744			 * until the media has been accessed. Trigger a READ operation
  3745			 * to force the device to populate mode pages.
  3746			 */
  3747			if (sdp->read_before_ms)
  3748				sd_read_block_zero(sdkp);
  3749			/*
  3750			 * set the default to rotational.  All non-rotational devices
  3751			 * support the block characteristics VPD page, which will
  3752			 * cause this to be updated correctly and any device which
  3753			 * doesn't support it should be treated as rotational.
  3754			 */
  3755			lim.features |= (BLK_FEAT_ROTATIONAL | BLK_FEAT_ADD_RANDOM);
  3756	
  3757			if (scsi_device_supports_vpd(sdp)) {
  3758				sd_read_block_provisioning(sdkp);
  3759				sd_read_block_limits(sdkp, &lim);
  3760				sd_read_block_limits_ext(sdkp);
  3761				sd_read_block_characteristics(sdkp, &lim);
  3762				sd_zbc_read_zones(sdkp, &lim, buffer);
  3763			}
  3764	
  3765			sd_config_discard(sdkp, &lim, sd_discard_mode(sdkp));
  3766	
  3767			sd_print_capacity(sdkp, old_capacity);
  3768	
  3769			sd_read_write_protect_flag(sdkp, buffer);
  3770			sd_read_cache_type(sdkp, buffer);
  3771			sd_read_io_hints(sdkp, buffer);
  3772			sd_read_app_tag_own(sdkp, buffer);
  3773			sd_read_write_same(sdkp, buffer);
  3774			sd_read_security(sdkp, buffer);
  3775			sd_config_protection(sdkp, &lim);
  3776		}
  3777	
  3778		/*
  3779		 * We now have all cache related info, determine how we deal
  3780		 * with flush requests.
  3781		 */
  3782		sd_set_flush_flag(sdkp, &lim);
  3783	
  3784		/* Initial block count limit based on CDB TRANSFER LENGTH field size. */
  3785		dev_max = sdp->use_16_for_rw ? SD_MAX_XFER_BLOCKS : SD_DEF_XFER_BLOCKS;
  3786	
  3787		/* Some devices report a maximum block count for READ/WRITE requests. */
  3788		dev_max = min_not_zero(dev_max, sdkp->max_xfer_blocks);
  3789		lim.max_dev_sectors = logical_to_sectors(sdp, dev_max);
  3790	
  3791		if (sd_validate_min_xfer_size(sdkp))
  3792			lim.io_min = logical_to_bytes(sdp, sdkp->min_xfer_blocks);
  3793		else
  3794			lim.io_min = 0;
  3795	
  3796		/*
  3797		 * Limit default to SCSI host optimal sector limit if set. There may be
  3798		 * an impact on performance for when the size of a request exceeds this
  3799		 * host limit.
  3800		 */
  3801		lim.io_opt = sdp->host->opt_sectors << SECTOR_SHIFT;
  3802		if (sd_validate_opt_xfer_size(sdkp, dev_max)) {
  3803			lim.io_opt = min_not_zero(lim.io_opt,
  3804					logical_to_bytes(sdp, sdkp->opt_xfer_blocks));
  3805		}
  3806	
  3807		sdkp->first_scan = 0;
  3808	
  3809		set_capacity_and_notify(disk, logical_to_sectors(sdp, sdkp->capacity));
  3810		sd_config_write_same(sdkp, &lim);
  3811		kfree(buffer);
  3812	
  3813		blk_mq_freeze_queue(sdkp->disk->queue);
  3814		err = queue_limits_commit_update(sdkp->disk->queue, &lim);
  3815		blk_mq_unfreeze_queue(sdkp->disk->queue);
  3816		if (err)
  3817			return err;
  3818	
  3819		/*
  3820		 * Query concurrent positioning ranges after
  3821		 * queue_limits_commit_update() unlocked q->limits_lock to avoid
  3822		 * deadlock with q->sysfs_dir_lock and q->sysfs_lock.
  3823		 */
  3824		if (sdkp->media_present && scsi_device_supports_vpd(sdp))
  3825			sd_read_cpr(sdkp);
  3826	
  3827		/* for multipath device, Adjust queue limits for MPATH disk */
  3828		if (scsi_is_sdev_multipath(sdp)) {
> 3829			struct queue_limits *mpath_lim = &sdp->mpath_disk->queue->limits;
  3830	
  3831			blk_mq_freeze_queue(sdp->mpath_disk->queue);
  3832			lim = queue_limits_start_update(sdp->mpath_disk->queue);
  3833			lim.logical_block_size = mpath_lim->logical_block_size;
  3834			lim.physical_block_size = mpath_lim->physical_block_size;
  3835			lim.io_min = mpath_lim->io_min;
  3836			lim.io_opt = mpath_lim->io_opt;
  3837			queue_limits_stack_bdev(&lim, sdp->mpath_disk->part0, 0,
  3838			    sdp->mpath_disk->disk_name);
  3839	
  3840			sdp->mpath_disk->flags |= GENHD_FL_HIDDEN;
  3841	
  3842			set_capacity_and_notify(sdp->mpath_disk,
  3843			    logical_to_sectors(sdp, sdkp->capacity));
  3844	
  3845			err = queue_limits_commit_update(sdp->mpath_disk->queue, &lim);
  3846	
> 3847			scsi_mpath_revalidate_path(sdp->mpath_disk,
  3848			    logical_to_sectors(sdp, sdkp->capacity));
  3849	
  3850			blk_mq_unfreeze_queue(sdp->mpath_disk->queue);
  3851			if (err)
  3852				return err;
  3853		}
  3854		/*
  3855		 * For a zoned drive, revalidating the zones can be done only once
  3856		 * the gendisk capacity is set. So if this fails, set back the gendisk
  3857		 * capacity to 0.
  3858		 */
  3859		if (sd_zbc_revalidate_zones(sdkp))
  3860			set_capacity_and_notify(disk, 0);
  3861	
  3862	 out:
  3863		return 0;
  3864	}
  3865	
  3866	/**
  3867	 *	sd_unlock_native_capacity - unlock native capacity
  3868	 *	@disk: struct gendisk to set capacity for
  3869	 *
  3870	 *	Block layer calls this function if it detects that partitions
  3871	 *	on @disk reach beyond the end of the device.  If the SCSI host
  3872	 *	implements ->unlock_native_capacity() method, it's invoked to
  3873	 *	give it a chance to adjust the device capacity.
  3874	 *
  3875	 *	CONTEXT:
  3876	 *	Defined by block layer.  Might sleep.
  3877	 */
  3878	static void sd_unlock_native_capacity(struct gendisk *disk)
  3879	{
  3880		struct scsi_device *sdev = scsi_disk(disk)->device;
  3881	
  3882		if (sdev->host->hostt->unlock_native_capacity)
  3883			sdev->host->hostt->unlock_native_capacity(sdev);
  3884	}
  3885	
  3886	/**
  3887	 *	sd_format_disk_name - format disk name
  3888	 *	@prefix: name prefix - ie. "sd" for SCSI disks
  3889	 *	@index: index of the disk to format name for
  3890	 *	@buf: output buffer
  3891	 *	@buflen: length of the output buffer
  3892	 *
  3893	 *	SCSI disk names starts at sda.  The 26th device is sdz and the
  3894	 *	27th is sdaa.  The last one for two lettered suffix is sdzz
  3895	 *	which is followed by sdaaa.
  3896	 *
  3897	 *	This is basically 26 base counting with one extra 'nil' entry
  3898	 *	at the beginning from the second digit on and can be
  3899	 *	determined using similar method as 26 base conversion with the
  3900	 *	index shifted -1 after each digit is computed.
  3901	 *
  3902	 *	CONTEXT:
  3903	 *	Don't care.
  3904	 *
  3905	 *	RETURNS:
  3906	 *	0 on success, -errno on failure.
  3907	 */
  3908	static int sd_format_disk_name(char *prefix, int index, char *buf, int buflen)
  3909	{
  3910		const int base = 'z' - 'a' + 1;
  3911		char *begin = buf + strlen(prefix);
  3912		char *end = buf + buflen;
  3913		char *p;
  3914		int unit;
  3915	
  3916		p = end - 1;
  3917		*p = '\0';
  3918		unit = base;
  3919		do {
  3920			if (p == begin)
  3921				return -EINVAL;
  3922			*--p = 'a' + (index % unit);
  3923			index = (index / unit) - 1;
  3924		} while (index >= 0);
  3925	
  3926		memmove(begin, p, end - p);
  3927		memcpy(buf, prefix, strlen(prefix));
  3928	
  3929		return 0;
  3930	}
  3931	
  3932	/**
  3933	 *	sd_probe - called during driver initialization and whenever a
  3934	 *	new scsi device is attached to the system. It is called once
  3935	 *	for each scsi device (not just disks) present.
  3936	 *	@dev: pointer to device object
  3937	 *
  3938	 *	Returns 0 if successful (or not interested in this scsi device 
  3939	 *	(e.g. scanner)); 1 when there is an error.
  3940	 *
  3941	 *	Note: this function is invoked from the scsi mid-level.
  3942	 *	This function sets up the mapping between a given 
  3943	 *	<host,channel,id,lun> (found in sdp) and new device name 
  3944	 *	(e.g. /dev/sda). More precisely it is the block device major 
  3945	 *	and minor number that is chosen here.
  3946	 *
  3947	 *	Assume sd_probe is not re-entrant (for time being)
  3948	 *	Also think about sd_probe() and sd_remove() running coincidentally.
  3949	 **/
  3950	static int sd_probe(struct device *dev)
  3951	{
  3952		struct scsi_device *sdp = to_scsi_device(dev);
  3953		struct scsi_disk *sdkp;
  3954		struct gendisk *gd;
  3955		int index;
  3956		int error;
  3957	
  3958		scsi_autopm_get_device(sdp);
  3959		error = -ENODEV;
  3960		if (sdp->type != TYPE_DISK &&
  3961		    sdp->type != TYPE_ZBC &&
  3962		    sdp->type != TYPE_MOD &&
  3963		    sdp->type != TYPE_RBC)
  3964			goto out;
  3965	
  3966		if (!IS_ENABLED(CONFIG_BLK_DEV_ZONED) && sdp->type == TYPE_ZBC) {
  3967			sdev_printk(KERN_WARNING, sdp,
  3968				    "Unsupported ZBC host-managed device.\n");
  3969			goto out;
  3970		}
  3971	
  3972		SCSI_LOG_HLQUEUE(3, sdev_printk(KERN_INFO, sdp,
  3973						"sd_probe\n"));
  3974	
  3975		error = -ENOMEM;
  3976		sdkp = kzalloc(sizeof(*sdkp), GFP_KERNEL);
  3977		if (!sdkp)
  3978			goto out;
  3979	
> 3980		if (scsi_mpath_enabled(sdp) && sdp->is_shared)
  3981			scsi_mpath_alloc_disk(sdp);
  3982	
  3983		gd = blk_mq_alloc_disk_for_queue(sdp->request_queue,
  3984						 &sd_bio_compl_lkclass);
  3985		if (!gd)
  3986			goto out_free;
  3987	
  3988		index = ida_alloc(&sd_index_ida, GFP_KERNEL);
  3989		if (index < 0) {
  3990			sdev_printk(KERN_WARNING, sdp, "sd_probe: memory exhausted.\n");
  3991			goto out_put;
  3992		}
  3993	
  3994		error = sd_format_disk_name("sd", index, gd->disk_name, DISK_NAME_LEN);
  3995		if (error) {
  3996			sdev_printk(KERN_WARNING, sdp, "SCSI disk (sd) name length exceeded.\n");
  3997			goto out_free_index;
  3998		}
  3999	
  4000		if (scsi_is_sdev_multipath(sdp))
  4001			snprintf(sdp->mpath_disk->disk_name, DISK_NAME_LEN, "mpath%dsd%d",
  4002			    sdp->host->host_no, index);
  4003	
  4004		sdkp->device = sdp;
  4005		sdkp->disk = gd;
  4006		sdkp->index = index;
  4007		sdkp->max_retries = SD_MAX_RETRIES;
  4008		atomic_set(&sdkp->openers, 0);
  4009		atomic_set(&sdkp->device->ioerr_cnt, 0);
  4010	
  4011		if (!sdp->request_queue->rq_timeout) {
  4012			if (sdp->type != TYPE_MOD)
  4013				blk_queue_rq_timeout(sdp->request_queue, SD_TIMEOUT);
  4014			else
  4015				blk_queue_rq_timeout(sdp->request_queue,
  4016						     SD_MOD_TIMEOUT);
  4017		}
  4018	
  4019		device_initialize(&sdkp->disk_dev);
  4020		sdkp->disk_dev.parent = get_device(dev);
  4021		sdkp->disk_dev.class = &sd_disk_class;
  4022		dev_set_name(&sdkp->disk_dev, "%s", dev_name(dev));
  4023	
  4024		error = device_add(&sdkp->disk_dev);
  4025		if (error) {
  4026			put_device(&sdkp->disk_dev);
  4027			goto out;
  4028		}
  4029	
  4030		dev_set_drvdata(dev, sdkp);
  4031	
  4032		gd->major = sd_major((index & 0xf0) >> 4);
  4033		gd->first_minor = ((index & 0xf) << 4) | (index & 0xfff00);
  4034		gd->minors = SD_MINORS;
  4035	
  4036		gd->fops = &sd_fops;
  4037		gd->private_data = sdkp;
  4038	
  4039		/* defaults, until the device tells us otherwise */
  4040		sdp->sector_size = 512;
  4041		sdkp->capacity = 0;
  4042		sdkp->media_present = 1;
  4043		sdkp->write_prot = 0;
  4044		sdkp->cache_override = 0;
  4045		sdkp->WCE = 0;
  4046		sdkp->RCD = 0;
  4047		sdkp->ATO = 0;
  4048		sdkp->first_scan = 1;
  4049		sdkp->max_medium_access_timeouts = SD_MAX_MEDIUM_TIMEOUTS;
  4050	
  4051		sd_revalidate_disk(gd);
  4052	
  4053		if (sdp->removable) {
  4054			gd->flags |= GENHD_FL_REMOVABLE;
  4055			gd->events |= DISK_EVENT_MEDIA_CHANGE;
  4056			gd->event_flags = DISK_EVENT_FLAG_POLL | DISK_EVENT_FLAG_UEVENT;
  4057		}
  4058	
  4059		blk_pm_runtime_init(sdp->request_queue, dev);
  4060		if (sdp->rpm_autosuspend) {
  4061			pm_runtime_set_autosuspend_delay(dev,
  4062				sdp->host->rpm_autosuspend_delay);
  4063		}
  4064	
  4065		if (scsi_is_sdev_multipath(sdp)) {
  4066			sdp->mpath_disk->major = sd_major((index & 0xf0) >> 4);
  4067			sdp->mpath_disk->first_minor = ((index & 0xf) << 4) | (index & 0xfff00);
  4068			sdp->mpath_disk->minors = SD_MINORS;
  4069	
  4070			scsi_mpath_add_disk(sdp);
  4071	
  4072			if (!test_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags)) {
  4073				device_unregister(&sdkp->disk_dev);
  4074				clear_bit(SCSI_MPATH_DISK_LIVE, &sdp->mpath_flags);
  4075				put_disk(sdp->mpath_disk);
  4076				goto out;
  4077			}
  4078		}
  4079	
  4080		error = device_add_disk(dev, gd, NULL);
  4081		if (error) {
  4082			device_unregister(&sdkp->disk_dev);
  4083			put_disk(gd);
  4084			goto out;
  4085		}
  4086	
  4087		if (sdkp->security) {
  4088			sdkp->opal_dev = init_opal_dev(sdkp, &sd_sec_submit);
  4089			if (sdkp->opal_dev)
  4090				sd_printk(KERN_NOTICE, sdkp, "supports TCG Opal\n");
  4091		}
  4092	
  4093		sd_printk(KERN_NOTICE, sdkp, "Attached SCSI %sdisk\n",
  4094			  sdp->removable ? "removable " : "");
  4095		scsi_autopm_put_device(sdp);
  4096	
  4097		return 0;
  4098	
  4099	 out_free_index:
  4100		ida_free(&sd_index_ida, index);
  4101	 out_put:
  4102		put_disk(gd);
  4103	 out_free:
  4104		kfree(sdkp);
  4105	 out:
  4106		scsi_autopm_put_device(sdp);
  4107		return error;
  4108	}
  4109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
