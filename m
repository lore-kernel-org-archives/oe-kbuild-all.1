Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0134A1D9595
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 23:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739921184; cv=none; b=HQMVa1dXtC0ZfJO8SstBh5yRYjEu+nu8dgMxaM1EqnAE8EP45kjorA9bjg1e05mN8N/oKqnMZDUc5g+CKrH0fsnMKneZ252DsR5RZpEArVEmX6rtP9T046qkyeDV+5EvModcOT20oCZ7D2QuX2Z9KipgiPVx07wD9M521RIINlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739921184; c=relaxed/simple;
	bh=BzNtQHrRn83uN6HG1kXXsyNdayQzzFKkWK4aKc87EyE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUk5OMXD/lCF7+jpRZBRDaOaqJk8tY5fYGnlhay7X1AZa2cQLi22kqxfftl84HdVffKnJmxNJMgvULz57YrrhjSzZrYdFBzriUhZcIypYrPo84Urtl9A0CtFbr1+2WD7xq38BdBivuByZPFU8/mgUVX1vZh8iCgfja2Hzsdi/Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLAwhEQR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLAwhEQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739921183; x=1771457183;
  h=date:from:cc:subject:message-id:mime-version;
  bh=BzNtQHrRn83uN6HG1kXXsyNdayQzzFKkWK4aKc87EyE=;
  b=nLAwhEQRUabv4cETwYUpvc13ovrGrR12nnd9/Q5mWmz7cC8Q9GdVtPyt
   tJn1CW/QMdHTKT6q8EBjAPk/U4ho/chof9sPzX/AbxoUvY+YAXDL9RLlr
   ZWTo7CAkKnelwVQmU5pjczTb0RxXvW18CyzDycoM5mwgJppyl7iZvdm8t
   Lel7SC+zmzMGQiBj5zyki3LyuN3zdE9+darR46L/7SAsZ16vbQIFxzfSt
   1iiq+afFPWYwYm32uiUCJSVAH+zQrPdzJMLWegANtSZudrCMFIHKwGkgj
   94Hjm4ABW8xDRRwuMjA7AgGnYhtuKL7c6fwikCTIg48ouEcZZvkfvMXVb
   w==;
X-CSE-ConnectionGUID: S5v2+GZNQYiKspzr+Oqn/Q==
X-CSE-MsgGUID: CrL4Ox6nTEyB0JOj9r3hcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40498569"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40498569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 15:26:22 -0800
X-CSE-ConnectionGUID: 4Hc5ZUJ+QAO8lrZmoB5rzw==
X-CSE-MsgGUID: eHul3CLXQoKia0AlpihqDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="145391731"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Feb 2025 15:26:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkWyp-0000xn-0T
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Feb 2025 23:26:19 +0000
Date: Wed, 19 Feb 2025 07:26:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] drivers/block/loop.c:662:16: warning: variable
 'inode' set but not used
Message-ID: <202502190714.GkOSy4o2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Theodore,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 6f9f5797fc7de2e9f801b2f7af0726e1349d33a4 [1/1] loop: add recursion validation to LOOP_CHANGE_FD
config: sh-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250219/202502190714.GkOSy4o2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502190714.GkOSy4o2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502190714.GkOSy4o2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/loop.c: In function 'loop_change_fd':
>> drivers/block/loop.c:662:16: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
     struct inode *inode;
                   ^~~~~


vim +/inode +662 drivers/block/loop.c

6f9f5797fc7de2 Theodore Ts'o  2018-05-07  649  
^1da177e4c3f41 Linus Torvalds 2005-04-16  650  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  651   * loop_change_fd switched the backing store of a loopback device to
^1da177e4c3f41 Linus Torvalds 2005-04-16  652   * a new file. This is useful for operating system installers to free up
^1da177e4c3f41 Linus Torvalds 2005-04-16  653   * the original file and in High Availability environments to switch to
^1da177e4c3f41 Linus Torvalds 2005-04-16  654   * an alternative location for the content in case of server meltdown.
^1da177e4c3f41 Linus Torvalds 2005-04-16  655   * This can only work if the loop device is used read-only, and if the
^1da177e4c3f41 Linus Torvalds 2005-04-16  656   * new backing store is the same size and type as the old backing store.
^1da177e4c3f41 Linus Torvalds 2005-04-16  657   */
bb21488482bd36 Al Viro        2008-03-02  658  static int loop_change_fd(struct loop_device *lo, struct block_device *bdev,
bb21488482bd36 Al Viro        2008-03-02  659  			  unsigned int arg)
^1da177e4c3f41 Linus Torvalds 2005-04-16  660  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  661  	struct file	*file, *old_file;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @662  	struct inode	*inode;
^1da177e4c3f41 Linus Torvalds 2005-04-16  663  	int		error;
^1da177e4c3f41 Linus Torvalds 2005-04-16  664  
^1da177e4c3f41 Linus Torvalds 2005-04-16  665  	error = -ENXIO;
^1da177e4c3f41 Linus Torvalds 2005-04-16  666  	if (lo->lo_state != Lo_bound)
^1da177e4c3f41 Linus Torvalds 2005-04-16  667  		goto out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  668  
^1da177e4c3f41 Linus Torvalds 2005-04-16  669  	/* the loop device has to be read-only */
^1da177e4c3f41 Linus Torvalds 2005-04-16  670  	error = -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  671  	if (!(lo->lo_flags & LO_FLAGS_READ_ONLY))
^1da177e4c3f41 Linus Torvalds 2005-04-16  672  		goto out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  673  
^1da177e4c3f41 Linus Torvalds 2005-04-16  674  	error = -EBADF;
^1da177e4c3f41 Linus Torvalds 2005-04-16  675  	file = fget(arg);
^1da177e4c3f41 Linus Torvalds 2005-04-16  676  	if (!file)
^1da177e4c3f41 Linus Torvalds 2005-04-16  677  		goto out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  678  
6f9f5797fc7de2 Theodore Ts'o  2018-05-07  679  	error = loop_validate_file(file, bdev);
6f9f5797fc7de2 Theodore Ts'o  2018-05-07  680  	if (error)
6f9f5797fc7de2 Theodore Ts'o  2018-05-07  681  		goto out_putf;
6f9f5797fc7de2 Theodore Ts'o  2018-05-07  682  
^1da177e4c3f41 Linus Torvalds 2005-04-16  683  	inode = file->f_mapping->host;
^1da177e4c3f41 Linus Torvalds 2005-04-16  684  	old_file = lo->lo_backing_file;
^1da177e4c3f41 Linus Torvalds 2005-04-16  685  
^1da177e4c3f41 Linus Torvalds 2005-04-16  686  	error = -EINVAL;
^1da177e4c3f41 Linus Torvalds 2005-04-16  687  
^1da177e4c3f41 Linus Torvalds 2005-04-16  688  	/* size of the new backing store needs to be the same */
^1da177e4c3f41 Linus Torvalds 2005-04-16  689  	if (get_loop_size(lo, file) != get_loop_size(lo, old_file))
^1da177e4c3f41 Linus Torvalds 2005-04-16  690  		goto out_putf;
^1da177e4c3f41 Linus Torvalds 2005-04-16  691  
^1da177e4c3f41 Linus Torvalds 2005-04-16  692  	/* and ... switch */
43cade803ebeb0 Omar Sandoval  2017-08-24  693  	blk_mq_freeze_queue(lo->lo_queue);
43cade803ebeb0 Omar Sandoval  2017-08-24  694  	mapping_set_gfp_mask(old_file->f_mapping, lo->old_gfp_mask);
43cade803ebeb0 Omar Sandoval  2017-08-24  695  	lo->lo_backing_file = file;
43cade803ebeb0 Omar Sandoval  2017-08-24  696  	lo->old_gfp_mask = mapping_gfp_mask(file->f_mapping);
43cade803ebeb0 Omar Sandoval  2017-08-24  697  	mapping_set_gfp_mask(file->f_mapping,
43cade803ebeb0 Omar Sandoval  2017-08-24  698  			     lo->old_gfp_mask & ~(__GFP_IO|__GFP_FS));
43cade803ebeb0 Omar Sandoval  2017-08-24  699  	loop_update_dio(lo);
43cade803ebeb0 Omar Sandoval  2017-08-24  700  	blk_mq_unfreeze_queue(lo->lo_queue);
^1da177e4c3f41 Linus Torvalds 2005-04-16  701  
^1da177e4c3f41 Linus Torvalds 2005-04-16  702  	fput(old_file);
e03c8dd14915fa Kay Sievers    2011-08-23  703  	if (lo->lo_flags & LO_FLAGS_PARTSCAN)
06f0e9e68c0d81 Ming Lei       2015-05-06  704  		loop_reread_partitions(lo, bdev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  705  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  706  
^1da177e4c3f41 Linus Torvalds 2005-04-16  707   out_putf:
^1da177e4c3f41 Linus Torvalds 2005-04-16  708  	fput(file);
^1da177e4c3f41 Linus Torvalds 2005-04-16  709   out:
^1da177e4c3f41 Linus Torvalds 2005-04-16  710  	return error;
^1da177e4c3f41 Linus Torvalds 2005-04-16  711  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  712  

:::::: The code at line 662 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
