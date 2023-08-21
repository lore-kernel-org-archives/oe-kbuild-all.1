Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A92B748E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 23:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692662267; x=1724198267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=miJYjTcDS8uso5txzt8O/L9e7pqjIJ+AaTKkOmze+3w=;
  b=TkbFCdteVXozzIucvBb0kGAMkrP/MFOYtCBNRC6NbJRb965XFAxxRdnk
   uvDo+nJ1hhRlP12Rv6yny8zwqMvUpZeJ6cQpgaGn8f53f6WQkFHCNgHGK
   WT7BNBy2mE6XFwULzBUGVB4/IuBIqg3W11m1lLxqZwlwpSayDtD7OxCP7
   AVlozArZrlLETY5V3GMtOapE2QKgoOawxAjc6HxTX/fnccyq51NIzdbCY
   eWi8zYIkj2aprl/+zMd4HDAb3lcC8RnHmsKO/1nrqEJAIKqHcP5iZEVEH
   DpnN1zV1MFgtW5Yj/1ZQnY4PBSdJH7Ebn9Pw49H9Rbs8YqLYPHsFwisgr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437653922"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="437653922"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 16:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806092431"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="806092431"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2023 16:57:45 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYEmD-00015C-1y;
	Mon, 21 Aug 2023 23:57:42 +0000
Date: Tue, 22 Aug 2023 07:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.4.y 21/975]
 drivers/scsi/sd_zbc.c:340: warning: Function parameter or member 'buf' not
 described in 'sd_zbc_check_zones'
Message-ID: <202308220713.8uUL4BOS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.4.y
head:   493f9241a6b8df703431ca8204a1dba1ccc05256
commit: 71cf2b3aead826ff651329231b40e21ecd3017bd [21/975] block: Enhance blk_revalidate_disk_zones()
config: i386-buildonly-randconfig-002-20230822 (https://download.01.org/0day-ci/archive/20230822/202308220713.8uUL4BOS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220713.8uUL4BOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220713.8uUL4BOS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/sd_zbc.c:340: warning: Function parameter or member 'buf' not described in 'sd_zbc_check_zones'
   drivers/scsi/sd_zbc.c:340: warning: Function parameter or member 'zblocks' not described in 'sd_zbc_check_zones'


vim +340 drivers/scsi/sd_zbc.c

89d9475610771b Hannes Reinecke 2016-10-18  324  
e98f42bcad202a Damien Le Moal  2017-10-11  325  /**
d2e428e49eec9b Damien Le Moal  2018-10-12  326   * sd_zbc_check_zones - Check the device capacity and zone sizes
e98f42bcad202a Damien Le Moal  2017-10-11  327   * @sdkp: Target disk
e98f42bcad202a Damien Le Moal  2017-10-11  328   *
d2e428e49eec9b Damien Le Moal  2018-10-12  329   * Check that the device capacity as reported by READ CAPACITY matches the
d2e428e49eec9b Damien Le Moal  2018-10-12  330   * max_lba value (plus one)of the report zones command reply. Also check that
d2e428e49eec9b Damien Le Moal  2018-10-12  331   * all zones of the device have an equal size, only allowing the last zone of
d2e428e49eec9b Damien Le Moal  2018-10-12  332   * the disk to have a smaller size (runt zone). The zone size must also be a
d2e428e49eec9b Damien Le Moal  2018-10-12  333   * power of two.
ccce20fc7968d5 Bart Van Assche 2018-04-16  334   *
f13cff6c25bd89 Damien Le Moal  2018-07-03  335   * Returns the zone size in number of blocks upon success or an error code
f13cff6c25bd89 Damien Le Moal  2018-07-03  336   * upon failure.
e98f42bcad202a Damien Le Moal  2017-10-11  337   */
71cf2b3aead826 Damien Le Moal  2019-11-11  338  static int sd_zbc_check_zones(struct scsi_disk *sdkp, unsigned char *buf,
71cf2b3aead826 Damien Le Moal  2019-11-11  339  			      u32 *zblocks)
89d9475610771b Hannes Reinecke 2016-10-18 @340  {
71cf2b3aead826 Damien Le Moal  2019-11-11  341  	size_t buflen;
4b433924b2755a Damien Le Moal  2018-03-02  342  	u64 zone_blocks = 0;
71cf2b3aead826 Damien Le Moal  2019-11-11  343  	sector_t max_lba;
89d9475610771b Hannes Reinecke 2016-10-18  344  	unsigned char *rec;
5f832a395859de Damien Le Moal  2018-10-12  345  	int ret;
89d9475610771b Hannes Reinecke 2016-10-18  346  
71cf2b3aead826 Damien Le Moal  2019-11-11  347  	/* Do a report zone to get max_lba and the size of the first zone */
71cf2b3aead826 Damien Le Moal  2019-11-11  348  	ret = sd_zbc_do_report_zones(sdkp, buf, SD_BUF_SIZE, 0, false);
4b433924b2755a Damien Le Moal  2018-03-02  349  	if (ret)
71cf2b3aead826 Damien Le Moal  2019-11-11  350  		return ret;
89d9475610771b Hannes Reinecke 2016-10-18  351  
d2e428e49eec9b Damien Le Moal  2018-10-12  352  	if (sdkp->rc_basis == 0) {
d2e428e49eec9b Damien Le Moal  2018-10-12  353  		/* The max_lba field is the capacity of this device */
d2e428e49eec9b Damien Le Moal  2018-10-12  354  		max_lba = get_unaligned_be64(&buf[8]);
d2e428e49eec9b Damien Le Moal  2018-10-12  355  		if (sdkp->capacity != max_lba + 1) {
d2e428e49eec9b Damien Le Moal  2018-10-12  356  			if (sdkp->first_scan)
d2e428e49eec9b Damien Le Moal  2018-10-12  357  				sd_printk(KERN_WARNING, sdkp,
d2e428e49eec9b Damien Le Moal  2018-10-12  358  					"Changing capacity from %llu to max LBA+1 %llu\n",
d2e428e49eec9b Damien Le Moal  2018-10-12  359  					(unsigned long long)sdkp->capacity,
d2e428e49eec9b Damien Le Moal  2018-10-12  360  					(unsigned long long)max_lba + 1);
d2e428e49eec9b Damien Le Moal  2018-10-12  361  			sdkp->capacity = max_lba + 1;
d2e428e49eec9b Damien Le Moal  2018-10-12  362  		}
d2e428e49eec9b Damien Le Moal  2018-10-12  363  	}
d2e428e49eec9b Damien Le Moal  2018-10-12  364  
89d9475610771b Hannes Reinecke 2016-10-18  365  	/* Parse REPORT ZONES header */
71cf2b3aead826 Damien Le Moal  2019-11-11  366  	buflen = min_t(size_t, get_unaligned_be32(&buf[0]) + 64, SD_BUF_SIZE);
89d9475610771b Hannes Reinecke 2016-10-18  367  	rec = buf + 64;
71cf2b3aead826 Damien Le Moal  2019-11-11  368  	zone_blocks = get_unaligned_be64(&rec[8]);
71cf2b3aead826 Damien Le Moal  2019-11-11  369  	if (!zone_blocks || !is_power_of_2(zone_blocks)) {
89d9475610771b Hannes Reinecke 2016-10-18  370  		if (sdkp->first_scan)
89d9475610771b Hannes Reinecke 2016-10-18  371  			sd_printk(KERN_NOTICE, sdkp,
89d9475610771b Hannes Reinecke 2016-10-18  372  				  "Devices with non power of 2 zone "
89d9475610771b Hannes Reinecke 2016-10-18  373  				  "size are not supported\n");
71cf2b3aead826 Damien Le Moal  2019-11-11  374  		return -ENODEV;
71cf2b3aead826 Damien Le Moal  2019-11-11  375  	}
71cf2b3aead826 Damien Le Moal  2019-11-11  376  
71cf2b3aead826 Damien Le Moal  2019-11-11  377  	if (logical_to_sectors(sdkp->device, zone_blocks) > UINT_MAX) {
89d9475610771b Hannes Reinecke 2016-10-18  378  		if (sdkp->first_scan)
89d9475610771b Hannes Reinecke 2016-10-18  379  			sd_printk(KERN_NOTICE, sdkp,
89d9475610771b Hannes Reinecke 2016-10-18  380  				  "Zone size too large\n");
71cf2b3aead826 Damien Le Moal  2019-11-11  381  		return -EFBIG;
4b433924b2755a Damien Le Moal  2018-03-02  382  	}
89d9475610771b Hannes Reinecke 2016-10-18  383  
71cf2b3aead826 Damien Le Moal  2019-11-11  384  	*zblocks = zone_blocks;
4b433924b2755a Damien Le Moal  2018-03-02  385  
71cf2b3aead826 Damien Le Moal  2019-11-11  386  	return 0;
89d9475610771b Hannes Reinecke 2016-10-18  387  }
89d9475610771b Hannes Reinecke 2016-10-18  388  

:::::: The code at line 340 was first introduced by commit
:::::: 89d9475610771b5e5fe1879075f0fc9ba6e3755f sd: Implement support for ZBC devices

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
