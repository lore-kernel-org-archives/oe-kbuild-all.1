Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6B036C9C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296176; cv=none; b=PQCytWISybDBzkG3yj9Z4NGF/hmYVw164TfB8sO4yl5or7q854MBg1toDLh2/oGmffz9CcltJ5yH5ACVdgOW5XmvT3bNs4j6rMfGYjV9EIgG4kws4DzjnZxbUp80t1UorLq5nooops+bmt1CDhIWCwbBpVbMELxN0gDK3jOa6mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296176; c=relaxed/simple;
	bh=4XqwwHMgpmnw0xG/gsyscx0Tx711K0sBz1x2OpdUKqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PkZz9yA8e5kg8f9aH+jBsbdt6FhF5fCAhpy+5eZOBbj6F01bHZu0vMmHLrpRt/qSKsJiUrSvHQkRWhE5P5npBnPqA5V7CZMQzF06y8anHoKdTOgwA4lW2uL71QVpmiuSJ5jYyZN+BMgeK7qVDmQbPrxlzzofqjToUJQ5CJEk9J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7vvp6vl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7vvp6vl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774296174; x=1805832174;
  h=date:from:to:cc:subject:message-id;
  bh=4XqwwHMgpmnw0xG/gsyscx0Tx711K0sBz1x2OpdUKqo=;
  b=L7vvp6vlpTSNiHwgPP5biEJbx/Avo61GITmnNnpZSrF/0vz3abfQq2VI
   E0vlKzA5KPVs6xsrTegTbs6hDvPl2o5TSQ+RUwXwsDoxP5KfRO/hFTzxr
   HtFZTFfwdLwnFCwNkw7C0m5LFe6/1Iroy2owUtUST0mtmHEsALfGdyqEw
   2b5bC9fuW7d09OZc+2QYSWpaGknC2Qfg1zD56vej1F3gZCM1SOkuhFz+9
   TzNx+w86JVHtr4sWPqtdPdF26aP8Muie6cK7lji04nSaZl7kWjQE1nHX+
   jh0d094mfTDAdWBEmNJO7DptberKdhBFUE/MlDrpfOFPr39Q82XLLdi4U
   g==;
X-CSE-ConnectionGUID: eOyAEX3SSyqpuaZ/p0sdmg==
X-CSE-MsgGUID: lqsTwopoRsSEkoOp2Sov4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79213917"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="79213917"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 13:02:54 -0700
X-CSE-ConnectionGUID: zBzl7d1vTnOfE0B0kop7xg==
X-CSE-MsgGUID: ecvTAt+MQuazHhk6DVwm+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="219722124"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Mar 2026 13:02:53 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4lUA-0000000039d-2mAw;
	Mon, 23 Mar 2026 20:02:50 +0000
Date: Tue, 24 Mar 2026 04:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:setattr-cleanups 5/7] include/linux/fs.h:228:25:
 error: passing argument 4 of 'do_truncate' makes pointer from integer without
 a cast
Message-ID: <202603240354.zQyASCVO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git setattr-cleanups
head:   e22469ce880a705f47908e2f012a7f0fdeab826b
commit: fc6ce49614e5951db7205c96f4926fa8ad518a45 [5/7] fs: simplify do_truncate
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260324/202603240354.zQyASCVO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240354.zQyASCVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240354.zQyASCVO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/namei.c:22:
   fs/namei.c: In function 'handle_truncate':
>> include/linux/fs.h:228:25: error: passing argument 4 of 'do_truncate' makes pointer from integer without a cast [-Wint-conversion]
     228 | #define ATTR_MTIME      (1 << 5)
         |                         ^
         |                         |
         |                         int
   fs/namei.c:4280:37: note: in expansion of macro 'ATTR_MTIME'
    4280 |                                     ATTR_MTIME|ATTR_CTIME|ATTR_OPEN,
         |                                     ^~~~~~~~~~
   In file included from fs/namei.c:46:
   fs/internal.h:202:30: note: expected 'struct file *' but argument is of type 'int'
     202 |                 struct file *file);
         |                 ~~~~~~~~~~~~~^~~~
>> fs/namei.c:4279:25: error: too many arguments to function 'do_truncate'; expected 4, have 5
    4279 |                 error = do_truncate(idmap, path->dentry, 0,
         |                         ^~~~~~~~~~~
   fs/internal.h:201:5: note: declared here
     201 | int do_truncate(struct mnt_idmap *idmap, struct dentry *dentry, loff_t new_size,
         |     ^~~~~~~~~~~


vim +/do_truncate +228 include/linux/fs.h

a94204f4d48e28 Amir Goldstein 2024-11-15  218  
^1da177e4c3f41 Linus Torvalds 2005-04-16  219  /*
^1da177e4c3f41 Linus Torvalds 2005-04-16  220   * Attribute flags.  These should be or-ed together to figure out what
^1da177e4c3f41 Linus Torvalds 2005-04-16  221   * has been changed!
^1da177e4c3f41 Linus Torvalds 2005-04-16  222   */
9767d74957450d Miklos Szeredi 2008-07-01  223  #define ATTR_MODE	(1 << 0)
9767d74957450d Miklos Szeredi 2008-07-01  224  #define ATTR_UID	(1 << 1)
9767d74957450d Miklos Szeredi 2008-07-01  225  #define ATTR_GID	(1 << 2)
9767d74957450d Miklos Szeredi 2008-07-01  226  #define ATTR_SIZE	(1 << 3)
9767d74957450d Miklos Szeredi 2008-07-01  227  #define ATTR_ATIME	(1 << 4)
9767d74957450d Miklos Szeredi 2008-07-01 @228  #define ATTR_MTIME	(1 << 5)
9767d74957450d Miklos Szeredi 2008-07-01  229  #define ATTR_CTIME	(1 << 6)
9767d74957450d Miklos Szeredi 2008-07-01  230  #define ATTR_ATIME_SET	(1 << 7)
9767d74957450d Miklos Szeredi 2008-07-01  231  #define ATTR_MTIME_SET	(1 << 8)
9767d74957450d Miklos Szeredi 2008-07-01  232  #define ATTR_FORCE	(1 << 9) /* Not a change, but a change it */
afc5b36e29b95f Jeff Layton    2025-07-30  233  #define ATTR_CTIME_SET	(1 << 10)
9767d74957450d Miklos Szeredi 2008-07-01  234  #define ATTR_KILL_SUID	(1 << 11)
9767d74957450d Miklos Szeredi 2008-07-01  235  #define ATTR_KILL_SGID	(1 << 12)
9767d74957450d Miklos Szeredi 2008-07-01  236  #define ATTR_FILE	(1 << 13)
9767d74957450d Miklos Szeredi 2008-07-01  237  #define ATTR_KILL_PRIV	(1 << 14)
9767d74957450d Miklos Szeredi 2008-07-01  238  #define ATTR_OPEN	(1 << 15) /* Truncating from open(O_TRUNC) */
9767d74957450d Miklos Szeredi 2008-07-01  239  #define ATTR_TIMES_SET	(1 << 16)
f2b20f6ee84231 Miklos Szeredi 2016-09-16  240  #define ATTR_TOUCH	(1 << 17)
7e8ae8486e4471 Jeff Layton    2024-08-26  241  #define ATTR_DELEG	(1 << 18) /* Delegated attrs. Don't break write delegations */
^1da177e4c3f41 Linus Torvalds 2005-04-16  242  

:::::: The code at line 228 was first introduced by commit
:::::: 9767d74957450da6365c363d69e3d02d605d7375 [patch 1/4] vfs: utimes: move owner check into inode_change_ok()

:::::: TO: Miklos Szeredi <mszeredi@suse.cz>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
