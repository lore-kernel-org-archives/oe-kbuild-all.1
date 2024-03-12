Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0CC847E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 01:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710207549; cv=none; b=JHX/PXK8bmujnno1mmXAVVNCeGcXPuz7MYHOwWAJPetJrv+dAhn3XGvihfWcOSC2qx/ZuH0cOw6gQ6J4PEis/yd4erCX2lmuPLxQqD7YCS+jg6WlerAe1MJq72s1w002+L7R4x8+3/SmSYFDV+zsqaes8282bdLutswoBOJf3cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710207549; c=relaxed/simple;
	bh=wvNv4ZUFguLSMVO40rq29WmE6gRaNzPDphZfN+nv5ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pL8C8Mb2rTfg9ksPOZitdivU3CVDM+FmwZgYU/MqyMVPa0NRRtk3NV1cnHPAsio50qyAdkEBkhLI3UQ/Y5jyuhkpZ5H/Tnx6vYA7FOVo3e+Ol9pHkAgFvp/317lpTLW1yXBlZIN5ZL0seexBZnW6HeUwItYTis8VesOtMeK2LwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3brRoGi; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3brRoGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710207548; x=1741743548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wvNv4ZUFguLSMVO40rq29WmE6gRaNzPDphZfN+nv5ds=;
  b=K3brRoGi4P+sppeqPV/FbSOLNH9jL100KYHlWIXIWVr3PvLZ0uzOl7Lo
   rCryn+ZVU3pUXKiultZSNxjiseNR1iRH1jr6vIPvXuik4YTE88occW3jO
   qncz8gaXTn6dyr7Kvp+3QyzkI9ARCHhu+eazr4DPnYTSNE/7q40LsZTTh
   RYpwXiI9L1SRW18GYhDJW3wOGG5xV2S6yX2ThiZfDaqyeGImNp9fsiXlT
   iEJqyP0+LMl/0mTpLtr7knEKtgFHRZwI/Do2WuBYXL/jskQj6wm81r4k/
   iWjG7u3BTjBBs4i9oH6U6+3NyOrwAkH1HvR8I4D/ZGe5Vm51ieY6WiGv1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5034219"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="5034219"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 18:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="11462953"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Mar 2024 18:39:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjr6d-0009ck-0W;
	Tue, 12 Mar 2024 01:39:03 +0000
Date: Tue, 12 Mar 2024 09:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 135/135] fs/bcachefs/super-io.c:708:21:
 sparse: sparse: incorrect type in argument 1 (different base types)
Message-ID: <202403120954.ky4kUKHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   feafe13a65c57864ffce12551ea68cbb3f3163aa
commit: 7bd0e804984724080ff48f57ffe909779897c63c [135/135] bcachefs: map_bit()
config: i386-randconfig-r121-20240311 (https://download.01.org/0day-ci/archive/20240312/202403120954.ky4kUKHj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120954.ky4kUKHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120954.ky4kUKHj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/super-io.c: note: in included file:
   fs/bcachefs/bcachefs.h:1021:9: sparse: sparse: array of flexible structures
   fs/bcachefs/super-io.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:832:52: sparse: sparse: array of flexible structures
   fs/bcachefs/super-io.c:490:19: sparse: sparse: cast to restricted __le32
   fs/bcachefs/super-io.c:489:19: sparse: sparse: cast to restricted __le64
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:708:21: sparse:     expected unsigned long long [usertype] n
   fs/bcachefs/super-io.c:708:21: sparse:     got restricted blk_mode_t [usertype]
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:708:21: sparse:     expected unsigned int [usertype] n
   fs/bcachefs/super-io.c:708:21: sparse:     got restricted blk_mode_t [usertype]
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: restricted blk_mode_t degrades to integer
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected long long @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:708:21: sparse:     expected long long
   fs/bcachefs/super-io.c:708:21: sparse:     got restricted blk_mode_t [usertype]
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: dubious: !x & y
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:708:21: sparse:     expected unsigned long long [usertype] n
   fs/bcachefs/super-io.c:708:21: sparse:     got restricted blk_mode_t [usertype]
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:708:21: sparse:     expected unsigned int [usertype] n
   fs/bcachefs/super-io.c:708:21: sparse:     got restricted blk_mode_t [usertype]
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: restricted blk_mode_t degrades to integer
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected long long @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:708:21: sparse:     expected long long
   fs/bcachefs/super-io.c:708:21: sparse:     got restricted blk_mode_t [usertype]
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: dubious: !x & y
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:708:21: sparse:     expected unsigned long long [usertype] n
   fs/bcachefs/super-io.c:708:21: sparse:     got restricted blk_mode_t [usertype]
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:708:21: sparse:     expected unsigned int [usertype] n
   fs/bcachefs/super-io.c:708:21: sparse:     got restricted blk_mode_t [usertype]
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: restricted blk_mode_t degrades to integer
>> fs/bcachefs/super-io.c:708:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected long long @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:708:21: sparse:     expected long long
   fs/bcachefs/super-io.c:708:21: sparse:     got restricted blk_mode_t [usertype]
>> fs/bcachefs/super-io.c:708:18: sparse: sparse: invalid assignment: |=
   fs/bcachefs/super-io.c:708:18: sparse:    left side has type restricted blk_mode_t
   fs/bcachefs/super-io.c:708:18: sparse:    right side has type int
   fs/bcachefs/super-io.c:709:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:709:21: sparse:     expected unsigned long long [usertype] n
   fs/bcachefs/super-io.c:709:21: sparse:     got restricted blk_mode_t [usertype]
   fs/bcachefs/super-io.c:709:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:709:21: sparse:     expected unsigned int [usertype] n
   fs/bcachefs/super-io.c:709:21: sparse:     got restricted blk_mode_t [usertype]
   fs/bcachefs/super-io.c:709:21: sparse: sparse: restricted blk_mode_t degrades to integer
   fs/bcachefs/super-io.c:709:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected long long @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:709:21: sparse:     expected long long
   fs/bcachefs/super-io.c:709:21: sparse:     got restricted blk_mode_t [usertype]
   fs/bcachefs/super-io.c:709:21: sparse: sparse: dubious: !x & y
   fs/bcachefs/super-io.c:709:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:709:21: sparse:     expected unsigned long long [usertype] n
   fs/bcachefs/super-io.c:709:21: sparse:     got restricted blk_mode_t [usertype]
   fs/bcachefs/super-io.c:709:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:709:21: sparse:     expected unsigned int [usertype] n
   fs/bcachefs/super-io.c:709:21: sparse:     got restricted blk_mode_t [usertype]
   fs/bcachefs/super-io.c:709:21: sparse: sparse: restricted blk_mode_t degrades to integer
   fs/bcachefs/super-io.c:709:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected long long @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:709:21: sparse:     expected long long
   fs/bcachefs/super-io.c:709:21: sparse:     got restricted blk_mode_t [usertype]
   fs/bcachefs/super-io.c:709:21: sparse: sparse: dubious: !x & y
   fs/bcachefs/super-io.c:709:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:709:21: sparse:     expected unsigned long long [usertype] n
   fs/bcachefs/super-io.c:709:21: sparse:     got restricted blk_mode_t [usertype]
   fs/bcachefs/super-io.c:709:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] n @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:709:21: sparse:     expected unsigned int [usertype] n
   fs/bcachefs/super-io.c:709:21: sparse:     got restricted blk_mode_t [usertype]
   fs/bcachefs/super-io.c:709:21: sparse: sparse: restricted blk_mode_t degrades to integer
   fs/bcachefs/super-io.c:709:21: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected long long @@     got restricted blk_mode_t [usertype] @@
   fs/bcachefs/super-io.c:709:21: sparse:     expected long long
   fs/bcachefs/super-io.c:709:21: sparse:     got restricted blk_mode_t [usertype]
   fs/bcachefs/super-io.c:709:18: sparse: sparse: invalid assignment: |=
   fs/bcachefs/super-io.c:709:18: sparse:    left side has type restricted blk_mode_t
   fs/bcachefs/super-io.c:709:18: sparse:    right side has type int
   fs/bcachefs/super-io.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +708 fs/bcachefs/super-io.c

   707	
 > 708		sb->mode |= map_bit(!opt_get(*opts, noexcl), 1, BLK_OPEN_EXCL);
   709		sb->mode |= map_bit(!opt_get(*opts, nochanges), 1, BLK_OPEN_WRITE);
   710	
   711		sb->bdev_handle = bdev_open_by_path(path, sb->mode, sb->holder, &bch2_sb_handle_bdev_ops);
   712		if (IS_ERR(sb->bdev_handle) &&
   713		    PTR_ERR(sb->bdev_handle) == -EACCES &&
   714		    opt_get(*opts, read_only)) {
   715			sb->mode &= ~BLK_OPEN_WRITE;
   716	
   717			sb->bdev_handle = bdev_open_by_path(path, sb->mode, sb->holder, &bch2_sb_handle_bdev_ops);
   718			if (!IS_ERR(sb->bdev_handle))
   719				opt_set(*opts, nochanges, true);
   720		}
   721	
   722		if (IS_ERR(sb->bdev_handle)) {
   723			ret = PTR_ERR(sb->bdev_handle);
   724			prt_printf(&err, "error opening %s: %s", path, bch2_err_str(ret));
   725			goto err;
   726		}
   727		sb->bdev = sb->bdev_handle->bdev;
   728	
   729		ret = bch2_sb_realloc(sb, 0);
   730		if (ret) {
   731			prt_printf(&err, "error allocating memory for superblock");
   732			goto err;
   733		}
   734	
   735		if (bch2_fs_init_fault("read_super")) {
   736			prt_printf(&err, "dynamic fault");
   737			ret = -EFAULT;
   738			goto err;
   739		}
   740	
   741		ret = read_one_super(sb, offset, &err);
   742		if (!ret)
   743			goto got_super;
   744	
   745		if (opt_defined(*opts, sb))
   746			goto err;
   747	
   748		prt_printf(&err2, "bcachefs (%s): error reading default superblock: %s\n",
   749		       path, err.buf);
   750		if (ret == -BCH_ERR_invalid_sb_magic && ignore_notbchfs_msg)
   751			bch2_print_opts(opts, KERN_INFO "%s", err2.buf);
   752		else
   753			bch2_print_opts(opts, KERN_ERR "%s", err2.buf);
   754	
   755		printbuf_exit(&err2);
   756		printbuf_reset(&err);
   757	
   758		/*
   759		 * Error reading primary superblock - read location of backup
   760		 * superblocks:
   761		 */
   762		bio_reset(sb->bio, sb->bdev, REQ_OP_READ|REQ_SYNC|REQ_META);
   763		sb->bio->bi_iter.bi_sector = BCH_SB_LAYOUT_SECTOR;
   764		/*
   765		 * use sb buffer to read layout, since sb buffer is page aligned but
   766		 * layout won't be:
   767		 */
   768		bch2_bio_map(sb->bio, sb->sb, sizeof(struct bch_sb_layout));
   769	
   770		ret = submit_bio_wait(sb->bio);
   771		if (ret) {
   772			prt_printf(&err, "IO error: %i", ret);
   773			goto err;
   774		}
   775	
   776		memcpy(&layout, sb->sb, sizeof(layout));
   777		ret = validate_sb_layout(&layout, &err);
   778		if (ret)
   779			goto err;
   780	
   781		for (i = layout.sb_offset;
   782		     i < layout.sb_offset + layout.nr_superblocks; i++) {
   783			offset = le64_to_cpu(*i);
   784	
   785			if (offset == opt_get(*opts, sb))
   786				continue;
   787	
   788			ret = read_one_super(sb, offset, &err);
   789			if (!ret)
   790				goto got_super;
   791		}
   792	
   793		goto err;
   794	
   795	got_super:
   796		if (le16_to_cpu(sb->sb->block_size) << 9 <
   797		    bdev_logical_block_size(sb->bdev) &&
   798		    opt_get(*opts, direct_io)) {
   799	#ifndef __KERNEL__
   800			opt_set(*opts, direct_io, false);
   801			bch2_free_super(sb);
   802			goto retry;
   803	#endif
   804			prt_printf(&err, "block size (%u) smaller than device block size (%u)",
   805			       le16_to_cpu(sb->sb->block_size) << 9,
   806			       bdev_logical_block_size(sb->bdev));
   807			ret = -BCH_ERR_block_size_too_small;
   808			goto err;
   809		}
   810	
   811		sb->have_layout = true;
   812	
   813		ret = bch2_sb_validate(sb, &err, READ);
   814		if (ret) {
   815			bch2_print_opts(opts, KERN_ERR "bcachefs (%s): error validating superblock: %s\n",
   816					path, err.buf);
   817			goto err_no_print;
   818		}
   819	out:
   820		printbuf_exit(&err);
   821		return ret;
   822	err:
   823		bch2_print_opts(opts, KERN_ERR "bcachefs (%s): error reading superblock: %s\n",
   824				path, err.buf);
   825	err_no_print:
   826		bch2_free_super(sb);
   827		goto out;
   828	}
   829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
