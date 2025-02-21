Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ECE2AE69
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 02:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740104498; cv=none; b=oXF3pLljB7ob15hMoj5AA4+zjU23od8JQZKf+yu6Xz/3V1gf6UcTqmJrqo+ONfCNxbrehbTxKZD68PSoCW81RyRGpwp6/cUAyiSV4F9gtKHW/WkifrJAinORC9Jrx6XNIfktWNwMGczASqMAV5NggOszTbVQ+sJorW+Ej2/pxK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740104498; c=relaxed/simple;
	bh=lg0dc2vpCIGn82za5P8cgyW+HBIr75CwwUXhKTKwG8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uO689QUtkP3au2znCuxIFDltodJgxOsEEr6sstlnN1zpNZsvyFcexA6KD8iMUrpICSX0CBPvxczQIkpV7s9IWI0gESMLQr93ndtA8dQbKGd4VTmo4Wr2YfdK9CT8aJLUz35zvyVAmhWUGPtFY7eWzZnH4V8YwjhxHmoJk9enoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnW3Sn2g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnW3Sn2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740104496; x=1771640496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lg0dc2vpCIGn82za5P8cgyW+HBIr75CwwUXhKTKwG8E=;
  b=VnW3Sn2gupNof+hEOgPnM6CiFZmWPlP003kOJ4GNq9wjS0/FTX7ch2oi
   cCHraCgm8MfAmDRXRtTV72ZLmchyXvW4ycDs2P0wO3lsCFFVKCMNnKBcP
   cuQnpwU+bDDHw0Q++mbOFGOnvzuyXWS0QQTXtZYai79HDSju3/dRHrk98
   JNuG81I7NNdmjLqBUDxZoGVH3/YK0wNwHPOEtqAvPOIhN1+O0QFvq+LSh
   E2BUiKdsE6E1mu86+ZbfvNnrLM1raXdkQzVzMgxeV8F6ra9Z0nUVSyCYr
   tbfMtTPBi+wASFH6xLFgppoLGuJAzletVCgIVc/GUdNM7XmyZMb7kdZOh
   g==;
X-CSE-ConnectionGUID: 5s+InmDqQci0+uwXVKKQYQ==
X-CSE-MsgGUID: orREKNKcRdWHUXSB5MQMqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41035321"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="41035321"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 18:21:36 -0800
X-CSE-ConnectionGUID: DF6LwSjCRY6DSd33IuinMA==
X-CSE-MsgGUID: talWfQo5QPSiY/EeBs8/Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="115882754"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 20 Feb 2025 18:21:35 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlIfU-00050h-0A;
	Fri, 21 Feb 2025 02:21:32 +0000
Date: Fri, 21 Feb 2025 10:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 111/111] fs/bcachefs/super-io.c:369:13:
 warning: variable 'block_size' set but not used
Message-ID: <202502211014.bXvmOB0M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   77308424ba26e1b41a7db5d4eae121841a707c05
commit: 77308424ba26e1b41a7db5d4eae121841a707c05 [111/111] bcachefs: bs > ps support
config: i386-buildonly-randconfig-002-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211014.bXvmOB0M-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211014.bXvmOB0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211014.bXvmOB0M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/super-io.c: In function 'bch2_sb_validate':
>> fs/bcachefs/super-io.c:369:13: warning: variable 'block_size' set but not used [-Wunused-but-set-variable]
     369 |         u16 block_size;
         |             ^~~~~~~~~~


vim +/block_size +369 fs/bcachefs/super-io.c

a02a0121b3de81 Kent Overstreet 2023-06-28  362  
a5c3e265d3b61a Kent Overstreet 2024-05-08  363  static int bch2_sb_validate(struct bch_sb_handle *disk_sb,
a5c3e265d3b61a Kent Overstreet 2024-05-08  364  			    enum bch_validate_flags flags, struct printbuf *out)
a02a0121b3de81 Kent Overstreet 2023-06-28  365  {
a02a0121b3de81 Kent Overstreet 2023-06-28  366  	struct bch_sb *sb = disk_sb->sb;
9af26120f06e03 Hunter Shaffer  2023-09-25  367  	struct bch_sb_field_members_v1 *mi;
a02a0121b3de81 Kent Overstreet 2023-06-28  368  	enum bch_opt_id opt_id;
a02a0121b3de81 Kent Overstreet 2023-06-28 @369  	u16 block_size;
a02a0121b3de81 Kent Overstreet 2023-06-28  370  	int ret;
a02a0121b3de81 Kent Overstreet 2023-06-28  371  
a02a0121b3de81 Kent Overstreet 2023-06-28  372  	ret = bch2_sb_compatible(sb, out);
a02a0121b3de81 Kent Overstreet 2023-06-28  373  	if (ret)
a02a0121b3de81 Kent Overstreet 2023-06-28  374  		return ret;
a02a0121b3de81 Kent Overstreet 2023-06-28  375  
c258f28ebab6be Kent Overstreet 2018-11-12  376  	if (sb->features[1] ||
efe68e1d65c008 Kent Overstreet 2022-01-03  377  	    (le64_to_cpu(sb->features[0]) & (~0ULL << BCH_FEATURE_NR))) {
401ec4db630802 Kent Overstreet 2023-02-03  378  		prt_printf(out, "Filesystem has incompatible features");
78c0b75c34209c Kent Overstreet 2022-11-19  379  		return -BCH_ERR_invalid_sb_features;
efe68e1d65c008 Kent Overstreet 2022-01-03  380  	}
c258f28ebab6be Kent Overstreet 2018-11-12  381  
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  382  	if (BCH_VERSION_MAJOR(le16_to_cpu(sb->version)) > BCH_VERSION_MAJOR(bcachefs_metadata_version_current) ||
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  383  	    BCH_SB_VERSION_INCOMPAT(sb) > bcachefs_metadata_version_current) {
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  384  		prt_printf(out, "Filesystem has incompatible version");
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  385  		return -BCH_ERR_invalid_sb_features;
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  386  	}
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  387  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  388  	block_size = le16_to_cpu(sb->block_size);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  389  
efe68e1d65c008 Kent Overstreet 2022-01-03  390  	if (bch2_is_zero(sb->user_uuid.b, sizeof(sb->user_uuid))) {
401ec4db630802 Kent Overstreet 2023-02-03  391  		prt_printf(out, "Bad user UUID (got zeroes)");
78c0b75c34209c Kent Overstreet 2022-11-19  392  		return -BCH_ERR_invalid_sb_uuid;
efe68e1d65c008 Kent Overstreet 2022-01-03  393  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  394  
efe68e1d65c008 Kent Overstreet 2022-01-03  395  	if (bch2_is_zero(sb->uuid.b, sizeof(sb->uuid))) {
6bf3766b5211dd Colin Ian King  2023-09-12  396  		prt_printf(out, "Bad internal UUID (got zeroes)");
78c0b75c34209c Kent Overstreet 2022-11-19  397  		return -BCH_ERR_invalid_sb_uuid;
efe68e1d65c008 Kent Overstreet 2022-01-03  398  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  399  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  400  	if (!sb->nr_devices ||
efe68e1d65c008 Kent Overstreet 2022-01-03  401  	    sb->nr_devices > BCH_SB_MEMBERS_MAX) {
401ec4db630802 Kent Overstreet 2023-02-03  402  		prt_printf(out, "Bad number of member devices %u (max %u)",
efe68e1d65c008 Kent Overstreet 2022-01-03  403  		       sb->nr_devices, BCH_SB_MEMBERS_MAX);
78c0b75c34209c Kent Overstreet 2022-11-19  404  		return -BCH_ERR_invalid_sb_too_many_members;
efe68e1d65c008 Kent Overstreet 2022-01-03  405  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  406  
efe68e1d65c008 Kent Overstreet 2022-01-03  407  	if (sb->dev_idx >= sb->nr_devices) {
401ec4db630802 Kent Overstreet 2023-02-03  408  		prt_printf(out, "Bad dev_idx (got %u, nr_devices %u)",
efe68e1d65c008 Kent Overstreet 2022-01-03  409  		       sb->dev_idx, sb->nr_devices);
78c0b75c34209c Kent Overstreet 2022-11-19  410  		return -BCH_ERR_invalid_sb_dev_idx;
efe68e1d65c008 Kent Overstreet 2022-01-03  411  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  412  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  413  	if (!sb->time_precision ||
efe68e1d65c008 Kent Overstreet 2022-01-03  414  	    le32_to_cpu(sb->time_precision) > NSEC_PER_SEC) {
401ec4db630802 Kent Overstreet 2023-02-03  415  		prt_printf(out, "Invalid time precision: %u (min 1, max %lu)",
efe68e1d65c008 Kent Overstreet 2022-01-03  416  		       le32_to_cpu(sb->time_precision), NSEC_PER_SEC);
78c0b75c34209c Kent Overstreet 2022-11-19  417  		return -BCH_ERR_invalid_sb_time_precision;
efe68e1d65c008 Kent Overstreet 2022-01-03  418  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  419  
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  420  	/* old versions didn't know to downgrade this field */
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  421  	if (BCH_SB_VERSION_INCOMPAT_ALLOWED(sb) > le16_to_cpu(sb->version))
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  422  		SET_BCH_SB_VERSION_INCOMPAT_ALLOWED(sb, le16_to_cpu(sb->version));
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  423  
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  424  	if (BCH_SB_VERSION_INCOMPAT(sb) > BCH_SB_VERSION_INCOMPAT_ALLOWED(sb)) {
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  425  		prt_printf(out, "Invalid version_incompat ");
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  426  		bch2_version_to_text(out, BCH_SB_VERSION_INCOMPAT(sb));
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  427  		prt_str(out, " > incompat_allowed ");
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  428  		bch2_version_to_text(out, BCH_SB_VERSION_INCOMPAT_ALLOWED(sb));
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  429  		if (flags & BCH_VALIDATE_write)
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  430  			return -BCH_ERR_invalid_sb_version;
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  431  		else
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  432  			SET_BCH_SB_VERSION_INCOMPAT_ALLOWED(sb, BCH_SB_VERSION_INCOMPAT(sb));
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  433  	}
a36d8f0e0e3d42 Kent Overstreet 2024-11-11  434  
a5c3e265d3b61a Kent Overstreet 2024-05-08  435  	if (!flags) {
b8559f1a212a70 Kent Overstreet 2022-03-21  436  		/*
b8559f1a212a70 Kent Overstreet 2022-03-21  437  		 * Been seeing a bug where these are getting inexplicably
a02a0121b3de81 Kent Overstreet 2023-06-28  438  		 * zeroed, so we're now validating them, but we have to be
b8559f1a212a70 Kent Overstreet 2022-03-21  439  		 * careful not to preven people's filesystems from mounting:
b8559f1a212a70 Kent Overstreet 2022-03-21  440  		 */
b8559f1a212a70 Kent Overstreet 2022-03-21  441  		if (!BCH_SB_JOURNAL_FLUSH_DELAY(sb))
b8559f1a212a70 Kent Overstreet 2022-03-21  442  			SET_BCH_SB_JOURNAL_FLUSH_DELAY(sb, 1000);
b8559f1a212a70 Kent Overstreet 2022-03-21  443  		if (!BCH_SB_JOURNAL_RECLAIM_DELAY(sb))
b8559f1a212a70 Kent Overstreet 2022-03-21  444  			SET_BCH_SB_JOURNAL_RECLAIM_DELAY(sb, 1000);
813e0cecd1473d Kent Overstreet 2023-07-15  445  
813e0cecd1473d Kent Overstreet 2023-07-15  446  		if (!BCH_SB_VERSION_UPGRADE_COMPLETE(sb))
813e0cecd1473d Kent Overstreet 2023-07-15  447  			SET_BCH_SB_VERSION_UPGRADE_COMPLETE(sb, le16_to_cpu(sb->version));
cecf72798b25fc Kent Overstreet 2024-08-07  448  
cecf72798b25fc Kent Overstreet 2024-08-07  449  		if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_disk_accounting_v2 &&
cecf72798b25fc Kent Overstreet 2024-08-07  450  		    !BCH_SB_ALLOCATOR_STUCK_TIMEOUT(sb))
cecf72798b25fc Kent Overstreet 2024-08-07  451  			SET_BCH_SB_ALLOCATOR_STUCK_TIMEOUT(sb, 30);
c7652f253a6d59 Kent Overstreet 2024-07-31  452  
c7652f253a6d59 Kent Overstreet 2024-07-31  453  		if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_disk_accounting_v2)
c7652f253a6d59 Kent Overstreet 2024-07-31  454  			SET_BCH_SB_PROMOTE_WHOLE_EXTENTS(sb, true);
b8559f1a212a70 Kent Overstreet 2022-03-21  455  	}
b8559f1a212a70 Kent Overstreet 2022-03-21  456  

:::::: The code at line 369 was first introduced by commit
:::::: a02a0121b3de81f985d6c751f1557c7aea832b9a bcachefs: bch2_version_compatible()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
