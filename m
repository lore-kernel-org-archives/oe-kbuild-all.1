Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7774524B4A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630686; cv=none; b=pZtgZ6UoriQINPF2AELQw3gux9XR7FMVxARnMvXbqQqiLkp4prww+5IG/9G+1A3GMOwlkPDggeOVaYT4zGgYCBoEt/mOprtwdB/uEE5qo6ukJ4HGwi1VhDsxbuvLM51pWZT0HJ6Ig1TSOwQ5VsJ/Ug4DBkKNe7ltWGKPRXN4drg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630686; c=relaxed/simple;
	bh=JRcARsLZIXYbz0NYMxp4Q9AIklPcRLfRY6nXKdx86x4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFIwyfT5MDOMmh4WWlj+rSfg+XBXkGht+PRWzKkl3AvJ8NzCpXGpoAygUN6z69C1wjND/nqrcBTWZERUd4b0beFwQfWjiJoxX6ODtC9n6INwF6Du5zV81koPpPrCvwm8lbZcs1dIeqip6fdtNfBJaGauXDb46kCu9TwoOnHgPcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6uqiZXx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6uqiZXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727630685; x=1759166685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JRcARsLZIXYbz0NYMxp4Q9AIklPcRLfRY6nXKdx86x4=;
  b=F6uqiZXx82CWSyJ5r+7CLcShFOANlzZ8Q0utzn0k1uUqJQA/0W2211Cf
   iktu7ktwhSs+Ulhvd79R9l4uoQQCS6M+t0Yi5LBpDx2DWb1tfZPpg8N3Z
   VifzSkbZAXFe+tUJ8xqYXpBEBkIRRjWqsD5erYwYRCnCMCbJxLgLiIoL7
   teUIUEWXgBoOLFO1L4bkyDdxbAExeDdnwOLxcP4MqOUKWLga7EruBZpNT
   bOL4Onz2IYCxO8ULqm6pdPgXLs2VJxS+ewuLcSLdhSUpq4W7VK1chBbV8
   LnSSFORFUD3n5Q0r190no1nBg1shErHNqMZx8L8eL4WGHiKRIcO+Dgnz1
   w==;
X-CSE-ConnectionGUID: Xq9z115GSI2qckU5LkqYeg==
X-CSE-MsgGUID: JMhXSZXETQSpL6vg4alWyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26592678"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26592678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:24:42 -0700
X-CSE-ConnectionGUID: 2Ih1A4XITRiQOpH6jZaM+Q==
X-CSE-MsgGUID: EM9RLQJ/TimDLsIk5Ogr6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="103858836"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Sep 2024 10:24:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suxew-000OVE-16;
	Sun, 29 Sep 2024 17:24:38 +0000
Date: Mon, 30 Sep 2024 01:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 215/218] fs/ext4/mballoc-test.c:90:24:
 error: passing argument 1 of 'INIT_LIST_HEAD' from incompatible pointer type
Message-ID: <202409300157.E5ZVKoeI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   31dd5392c7007b3d01a4eff5179e1c27faaac8be
commit: 03b37c7d400d2b5fbe80dcb15c24a342560fb9e3 [215/218] vfs: use fast_list for superblock's inode list
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240930/202409300157.E5ZVKoeI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300157.E5ZVKoeI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300157.E5ZVKoeI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/ext4/mballoc.c:7047:
   fs/ext4/mballoc-test.c: In function 'mbt_mb_init':
>> fs/ext4/mballoc-test.c:90:24: error: passing argument 1 of 'INIT_LIST_HEAD' from incompatible pointer type [-Werror=incompatible-pointer-types]
      90 |         INIT_LIST_HEAD(&sb->s_inodes);
         |                        ^~~~~~~~~~~~~
         |                        |
         |                        struct fast_list *
   In file included from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/ext4/ext4_jbd2.h:15,
                    from fs/ext4/mballoc.c:12:
   include/linux/list.h:35:53: note: expected 'struct list_head *' but argument is of type 'struct fast_list *'
      35 | static inline void INIT_LIST_HEAD(struct list_head *list)
         |                                   ~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/INIT_LIST_HEAD +90 fs/ext4/mballoc-test.c

8ffc0cd24c2a3e Kemeng Shi 2024-03-05   69  
67d2a11b22b4d5 Kemeng Shi 2024-01-03   70  static int mbt_mb_init(struct super_block *sb)
67d2a11b22b4d5 Kemeng Shi 2024-01-03   71  {
0ecae5410ab526 Kemeng Shi 2024-03-05   72  	ext4_fsblk_t block;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   73  	int ret;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   74  
67d2a11b22b4d5 Kemeng Shi 2024-01-03   75  	/* needed by ext4_mb_init->bdev_nonrot(sb->s_bdev) */
67d2a11b22b4d5 Kemeng Shi 2024-01-03   76  	sb->s_bdev = kzalloc(sizeof(*sb->s_bdev), GFP_KERNEL);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   77  	if (sb->s_bdev == NULL)
67d2a11b22b4d5 Kemeng Shi 2024-01-03   78  		return -ENOMEM;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   79  
67d2a11b22b4d5 Kemeng Shi 2024-01-03   80  	sb->s_bdev->bd_queue = kzalloc(sizeof(struct request_queue), GFP_KERNEL);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   81  	if (sb->s_bdev->bd_queue == NULL) {
67d2a11b22b4d5 Kemeng Shi 2024-01-03   82  		kfree(sb->s_bdev);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   83  		return -ENOMEM;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   84  	}
67d2a11b22b4d5 Kemeng Shi 2024-01-03   85  
67d2a11b22b4d5 Kemeng Shi 2024-01-03   86  	/*
67d2a11b22b4d5 Kemeng Shi 2024-01-03   87  	 * needed by ext4_mb_init->ext4_mb_init_backend-> sbi->s_buddy_cache =
67d2a11b22b4d5 Kemeng Shi 2024-01-03   88  	 * new_inode(sb);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   89  	 */
67d2a11b22b4d5 Kemeng Shi 2024-01-03  @90  	INIT_LIST_HEAD(&sb->s_inodes);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   91  	sb->s_op = &mbt_sops;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   92  
67d2a11b22b4d5 Kemeng Shi 2024-01-03   93  	ret = ext4_mb_init(sb);
67d2a11b22b4d5 Kemeng Shi 2024-01-03   94  	if (ret != 0)
67d2a11b22b4d5 Kemeng Shi 2024-01-03   95  		goto err_out;
67d2a11b22b4d5 Kemeng Shi 2024-01-03   96  
0ecae5410ab526 Kemeng Shi 2024-03-05   97  	block = ext4_count_free_clusters(sb);
0ecae5410ab526 Kemeng Shi 2024-03-05   98  	ret = percpu_counter_init(&EXT4_SB(sb)->s_freeclusters_counter, block,
0ecae5410ab526 Kemeng Shi 2024-03-05   99  				  GFP_KERNEL);
0ecae5410ab526 Kemeng Shi 2024-03-05  100  	if (ret != 0)
0ecae5410ab526 Kemeng Shi 2024-03-05  101  		goto err_mb_release;
0ecae5410ab526 Kemeng Shi 2024-03-05  102  
0ecae5410ab526 Kemeng Shi 2024-03-05  103  	ret = percpu_counter_init(&EXT4_SB(sb)->s_dirtyclusters_counter, 0,
0ecae5410ab526 Kemeng Shi 2024-03-05  104  				  GFP_KERNEL);
0ecae5410ab526 Kemeng Shi 2024-03-05  105  	if (ret != 0)
0ecae5410ab526 Kemeng Shi 2024-03-05  106  		goto err_freeclusters;
0ecae5410ab526 Kemeng Shi 2024-03-05  107  
67d2a11b22b4d5 Kemeng Shi 2024-01-03  108  	return 0;
67d2a11b22b4d5 Kemeng Shi 2024-01-03  109  
0ecae5410ab526 Kemeng Shi 2024-03-05  110  err_freeclusters:
0ecae5410ab526 Kemeng Shi 2024-03-05  111  	percpu_counter_destroy(&EXT4_SB(sb)->s_freeclusters_counter);
0ecae5410ab526 Kemeng Shi 2024-03-05  112  err_mb_release:
0ecae5410ab526 Kemeng Shi 2024-03-05  113  	ext4_mb_release(sb);
67d2a11b22b4d5 Kemeng Shi 2024-01-03  114  err_out:
67d2a11b22b4d5 Kemeng Shi 2024-01-03  115  	kfree(sb->s_bdev->bd_queue);
67d2a11b22b4d5 Kemeng Shi 2024-01-03  116  	kfree(sb->s_bdev);
67d2a11b22b4d5 Kemeng Shi 2024-01-03  117  	return ret;
67d2a11b22b4d5 Kemeng Shi 2024-01-03  118  }
67d2a11b22b4d5 Kemeng Shi 2024-01-03  119  

:::::: The code at line 90 was first introduced by commit
:::::: 67d2a11b22b4d520072db62620851615df13183e ext4: Add unit test of ext4_mb_generate_buddy

:::::: TO: Kemeng Shi <shikemeng@huaweicloud.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
