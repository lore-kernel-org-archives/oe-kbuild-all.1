Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ECC17A5A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 04:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631347; cv=none; b=qaLrElFumoXgp2XY0JiKona/LaPdliPCCox5P06wxX5djUYUdVT0ppn02WRINfx0gysQNY830fH3FuxvNdo0vETGfOoPzsd5eimN7yVyWot+e6+mXbauALMdrzj7/DoPbS09PMU99WjYrLoEiLiZX1qXpD9yv+EaivmgJWUNso8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631347; c=relaxed/simple;
	bh=JYhl5UOB072beA10VY5B3cNosqJERuq6ujMGudN/19E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AkOaxEfl4V6A3563tovU7hRRabjfwzwVXoxxzWSbjuJ8zeH/WWqbZ6hHGYsgwocrouRyaAT3kXDrxTrYhRg0Fb25E1hXx3WZl+I/8eOe0icmKBmscmjjLJK0FBSi1GUChuvuM8+TpgZmlTGmeLemgjNFJisQCf73toznxI4qmCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUdXhhR7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUdXhhR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740631346; x=1772167346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JYhl5UOB072beA10VY5B3cNosqJERuq6ujMGudN/19E=;
  b=CUdXhhR7YfyY0P9Mzq5CtHN6JftwEML0Zo3Nh+P4DUcDB5m8/33hfvYQ
   6EfgpAnogyilgCLih+OkNgPLRkGvzQTAFixsAZPLVNpgn8wKNc8a6aFit
   JT0VNP6YbOr6xRYE/pp3zDq0AjVSL8eKYlpZAMrkdp5mVU+Woy0tQaKkz
   wfzzCLCWkcdXnYCD+oxcltUuDaKELWttxdDO8cd8ErCIZRblwzzTwxet/
   ne4zYgdkqKeGMWy6xmuLsvHX+UgtzMgkDLCKceExSjuOEqZVtMYry8vbE
   cjwccXASPta4W89G9EumqIRXkDeG64FRedwc//xiI1gKEXVshvyXg+ENW
   A==;
X-CSE-ConnectionGUID: TTu5mB/MSlCwwENtu++TFQ==
X-CSE-MsgGUID: wQSeb3+IRbGF+ckK+9y9kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44332898"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="44332898"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 20:42:25 -0800
X-CSE-ConnectionGUID: a3ETDYPmSTuV1YooSAwKcw==
X-CSE-MsgGUID: rEJ7oRWsQtq9nMx2UCRhxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116783993"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Feb 2025 20:42:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnVhz-000Cqw-2A;
	Thu, 27 Feb 2025 04:41:39 +0000
Date: Thu, 27 Feb 2025 12:40:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-dir-i-size 123/123]
 fs/bcachefs/fs-ioctl.c:72:54: error: 'bcachefs_metadata_version_casefolding'
 undeclared; did you mean 'bcachefs_metadata_version_major_minor'?
Message-ID: <202502271209.OUuNyZC0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-dir-i-size
head:   559ae9ec988de991142b6a067c313aeb530c2b11
commit: 559ae9ec988de991142b6a067c313aeb530c2b11 [123/123] bcachefs: bcachefs_metadata_version_directory_size_v2
config: um-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271209.OUuNyZC0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271209.OUuNyZC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271209.OUuNyZC0-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/fs-ioctl.c: In function 'bch2_inode_flags_set':
>> fs/bcachefs/fs-ioctl.c:72:54: error: 'bcachefs_metadata_version_casefolding' undeclared (first use in this function); did you mean 'bcachefs_metadata_version_major_minor'?
      72 |                 if (!bch2_request_incompat_feature(c,bcachefs_metadata_version_casefolding))
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                      bcachefs_metadata_version_major_minor
   fs/bcachefs/fs-ioctl.c:72:54: note: each undeclared identifier is reported only once for each function it appears in


vim +72 fs/bcachefs/fs-ioctl.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  33  
791236b85c2dfd Joshua Ashton   2023-08-12  34  static int bch2_inode_flags_set(struct btree_trans *trans,
791236b85c2dfd Joshua Ashton   2023-08-12  35  				struct bch_inode_info *inode,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  36  				struct bch_inode_unpacked *bi,
1c6fdbd8f2465d Kent Overstreet 2017-03-16  37  				void *p)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  38  {
2ea9004864b918 Kent Overstreet 2018-07-17  39  	struct bch_fs *c = inode->v.i_sb->s_fs_info;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  40  	/*
1c6fdbd8f2465d Kent Overstreet 2017-03-16  41  	 * We're relying on btree locking here for exclusion with other ioctl
1c6fdbd8f2465d Kent Overstreet 2017-03-16  42  	 * calls - use the flags in the btree (@bi), not inode->i_flags:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  43  	 */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  44  	struct flags_set *s = p;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  45  	unsigned newflags = s->flags;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  46  	unsigned oldflags = bi->bi_flags & s->mask;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  47  
103ffe9aaf8566 Kent Overstreet 2023-11-02  48  	if (((newflags ^ oldflags) & (BCH_INODE_append|BCH_INODE_immutable)) &&
1c6fdbd8f2465d Kent Overstreet 2017-03-16  49  	    !capable(CAP_LINUX_IMMUTABLE))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  50  		return -EPERM;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  51  
2ea9004864b918 Kent Overstreet 2018-07-17  52  	if (!S_ISREG(bi->bi_mode) &&
2ea9004864b918 Kent Overstreet 2018-07-17  53  	    !S_ISDIR(bi->bi_mode) &&
103ffe9aaf8566 Kent Overstreet 2023-11-02  54  	    (newflags & (BCH_INODE_nodump|BCH_INODE_noatime)) != newflags)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  55  		return -EINVAL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  56  
88969fa28d041c Joshua Ashton   2023-08-13  57  	if ((newflags ^ oldflags) & BCH_INODE_casefolded) {
88969fa28d041c Joshua Ashton   2023-08-13  58  #ifdef CONFIG_UNICODE
88969fa28d041c Joshua Ashton   2023-08-13  59  		int ret = 0;
88969fa28d041c Joshua Ashton   2023-08-13  60  		/* Not supported on individual files. */
88969fa28d041c Joshua Ashton   2023-08-13  61  		if (!S_ISDIR(bi->bi_mode))
88969fa28d041c Joshua Ashton   2023-08-13  62  			return -EOPNOTSUPP;
88969fa28d041c Joshua Ashton   2023-08-13  63  
88969fa28d041c Joshua Ashton   2023-08-13  64  		/*
88969fa28d041c Joshua Ashton   2023-08-13  65  		 * Make sure the dir is empty, as otherwise we'd need to
88969fa28d041c Joshua Ashton   2023-08-13  66  		 * rehash everything and update the dirent keys.
88969fa28d041c Joshua Ashton   2023-08-13  67  		 */
88969fa28d041c Joshua Ashton   2023-08-13  68  		ret = bch2_empty_dir_trans(trans, inode_inum(inode));
88969fa28d041c Joshua Ashton   2023-08-13  69  		if (ret < 0)
88969fa28d041c Joshua Ashton   2023-08-13  70  			return ret;
88969fa28d041c Joshua Ashton   2023-08-13  71  
88969fa28d041c Joshua Ashton   2023-08-13 @72  		if (!bch2_request_incompat_feature(c,bcachefs_metadata_version_casefolding))
88969fa28d041c Joshua Ashton   2023-08-13  73  			return -EOPNOTSUPP;
88969fa28d041c Joshua Ashton   2023-08-13  74  
88969fa28d041c Joshua Ashton   2023-08-13  75  		bch2_check_set_feature(c, BCH_FEATURE_casefolding);
88969fa28d041c Joshua Ashton   2023-08-13  76  #else
88969fa28d041c Joshua Ashton   2023-08-13  77  		printk(KERN_ERR "Cannot use casefolding on a kernel without CONFIG_UNICODE\n");
88969fa28d041c Joshua Ashton   2023-08-13  78  		return -EOPNOTSUPP;
88969fa28d041c Joshua Ashton   2023-08-13  79  #endif
88969fa28d041c Joshua Ashton   2023-08-13  80  	}
88969fa28d041c Joshua Ashton   2023-08-13  81  
65ff2d3a7abb9f Kent Overstreet 2022-10-12  82  	if (s->set_projinherit) {
65ff2d3a7abb9f Kent Overstreet 2022-10-12  83  		bi->bi_fields_set &= ~(1 << Inode_opt_project);
65ff2d3a7abb9f Kent Overstreet 2022-10-12  84  		bi->bi_fields_set |= ((int) s->projinherit << Inode_opt_project);
65ff2d3a7abb9f Kent Overstreet 2022-10-12  85  	}
65ff2d3a7abb9f Kent Overstreet 2022-10-12  86  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  87  	bi->bi_flags &= ~s->mask;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  88  	bi->bi_flags |= newflags;
2ea9004864b918 Kent Overstreet 2018-07-17  89  
2ea9004864b918 Kent Overstreet 2018-07-17  90  	bi->bi_ctime = timespec_to_bch2_time(c, current_time(&inode->v));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  91  	return 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  92  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  93  

:::::: The code at line 72 was first introduced by commit
:::::: 88969fa28d041c0f6fadb3d3460603648b760db0 bcachefs: bcachefs_metadata_version_casefolding

:::::: TO: Joshua Ashton <joshua@froggi.es>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
