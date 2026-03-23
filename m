Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094AE37DE8C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 21:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774300805; cv=none; b=Pe82sOVPTVBaahX8N8NXOiy63mDXNhoncCLeM0zuHCJ+r7oBsPpfousywvcCzpH4R66KCev4gAuWZF42mlnfzaVTaivaIyTDMZE5cvvj/Gn71DMW4jL6kl9bwHBXmtLK8h69sJ/HhbXU2RybPzgm6eNYRmlPPRKW8C0VQXuLcWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774300805; c=relaxed/simple;
	bh=HLJoJWBOBJovK8pr/n6XEn63afIqOttP4+TNivOxzzw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bh7ani6tn6t3ku3AEvH3zvqde3+PnIHVMrqmMdv3xO6FrG77587pgDMAQqq+7sT4Vhe9r+KfzfLkhqAoWFjEliwtJX5U3EBdnc1jyPS6IQdfUlurpwzV26eUUHnBwI4OeR/FcW/74fTRkM6kPoBINg300ocbzDDV4vQzH1Mx96Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIGrs+CS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIGrs+CS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774300803; x=1805836803;
  h=date:from:to:cc:subject:message-id;
  bh=HLJoJWBOBJovK8pr/n6XEn63afIqOttP4+TNivOxzzw=;
  b=jIGrs+CSysA+fjGxyxH4BhhuNNCRqH3BcMEtF3IUyk/MAe9Ptsd42lMN
   cU3/NXDFsAngwQMaAh6ZMBfUPzegwqfYN8WIU5ne52LlP+ecYgFXtiDnG
   6xhXnzKnxAWIkLl1Np4koHeR7Lvjh/n3Yvsmsw1QFKBKnMSWxC4a+UybP
   wLoedumvs1QjTDvSMONGI8QuXLmARdagKCEdLZnp+kQr+HC6G0e+TZwqX
   +6SDvrHwVAvuxBSL+zy+kqhpJl80H9wTZuqeEz567Jgery3IJIevF6cin
   mQFbdUeKuVNG8kgMFzNIYNNqDOf0SmpnKb9T8i4Hf9K9G2AsUwQQPU+Xx
   A==;
X-CSE-ConnectionGUID: iUoXHzJvRSqjX6viebVPzA==
X-CSE-MsgGUID: bUH5jhz7SXOMhNNgRD/ToQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="78905820"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="78905820"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 14:20:03 -0700
X-CSE-ConnectionGUID: JWrxYG/sS7SjhM+h1P8Jow==
X-CSE-MsgGUID: pq/JgjXzS1+vruj1X9UZZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="247846438"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Mar 2026 14:20:01 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4mgo-000000003Ex-3Z5g;
	Mon, 23 Mar 2026 21:19:58 +0000
Date: Tue, 24 Mar 2026 05:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:setattr-cleanups 5/7] include/linux/fs.h:228:25:
 warning: passing argument 4 of 'do_truncate' makes pointer from integer
 without a cast
Message-ID: <202603240511.kjkylVEv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git setattr-cleanups
head:   e22469ce880a705f47908e2f012a7f0fdeab826b
commit: fc6ce49614e5951db7205c96f4926fa8ad518a45 [5/7] fs: simplify do_truncate
config: nios2-randconfig-r071-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240511.kjkylVEv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240511.kjkylVEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240511.kjkylVEv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/namei.c:22:
   fs/namei.c: In function 'handle_truncate':
>> include/linux/fs.h:228:25: warning: passing argument 4 of 'do_truncate' makes pointer from integer without a cast [-Wint-conversion]
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
   fs/namei.c:4279:25: error: too many arguments to function 'do_truncate'
    4279 |                 error = do_truncate(idmap, path->dentry, 0,
         |                         ^~~~~~~~~~~
   In file included from fs/namei.c:46:
   fs/internal.h:201:5: note: declared here
     201 | int do_truncate(struct mnt_idmap *idmap, struct dentry *dentry, loff_t new_size,
         |     ^~~~~~~~~~~


vim +/do_truncate +228 include/linux/fs.h

a94204f4d48e28a Amir Goldstein 2024-11-15  218  
^1da177e4c3f415 Linus Torvalds 2005-04-16  219  /*
^1da177e4c3f415 Linus Torvalds 2005-04-16  220   * Attribute flags.  These should be or-ed together to figure out what
^1da177e4c3f415 Linus Torvalds 2005-04-16  221   * has been changed!
^1da177e4c3f415 Linus Torvalds 2005-04-16  222   */
9767d74957450da Miklos Szeredi 2008-07-01  223  #define ATTR_MODE	(1 << 0)
9767d74957450da Miklos Szeredi 2008-07-01  224  #define ATTR_UID	(1 << 1)
9767d74957450da Miklos Szeredi 2008-07-01  225  #define ATTR_GID	(1 << 2)
9767d74957450da Miklos Szeredi 2008-07-01  226  #define ATTR_SIZE	(1 << 3)
9767d74957450da Miklos Szeredi 2008-07-01  227  #define ATTR_ATIME	(1 << 4)
9767d74957450da Miklos Szeredi 2008-07-01 @228  #define ATTR_MTIME	(1 << 5)
9767d74957450da Miklos Szeredi 2008-07-01  229  #define ATTR_CTIME	(1 << 6)
9767d74957450da Miklos Szeredi 2008-07-01  230  #define ATTR_ATIME_SET	(1 << 7)
9767d74957450da Miklos Szeredi 2008-07-01  231  #define ATTR_MTIME_SET	(1 << 8)
9767d74957450da Miklos Szeredi 2008-07-01  232  #define ATTR_FORCE	(1 << 9) /* Not a change, but a change it */
afc5b36e29b95fb Jeff Layton    2025-07-30  233  #define ATTR_CTIME_SET	(1 << 10)
9767d74957450da Miklos Szeredi 2008-07-01  234  #define ATTR_KILL_SUID	(1 << 11)
9767d74957450da Miklos Szeredi 2008-07-01  235  #define ATTR_KILL_SGID	(1 << 12)
9767d74957450da Miklos Szeredi 2008-07-01  236  #define ATTR_FILE	(1 << 13)
9767d74957450da Miklos Szeredi 2008-07-01  237  #define ATTR_KILL_PRIV	(1 << 14)
9767d74957450da Miklos Szeredi 2008-07-01  238  #define ATTR_OPEN	(1 << 15) /* Truncating from open(O_TRUNC) */
9767d74957450da Miklos Szeredi 2008-07-01  239  #define ATTR_TIMES_SET	(1 << 16)
f2b20f6ee842313 Miklos Szeredi 2016-09-16  240  #define ATTR_TOUCH	(1 << 17)
7e8ae8486e44715 Jeff Layton    2024-08-26  241  #define ATTR_DELEG	(1 << 18) /* Delegated attrs. Don't break write delegations */
^1da177e4c3f415 Linus Torvalds 2005-04-16  242  

:::::: The code at line 228 was first introduced by commit
:::::: 9767d74957450da6365c363d69e3d02d605d7375 [patch 1/4] vfs: utimes: move owner check into inode_change_ok()

:::::: TO: Miklos Szeredi <mszeredi@suse.cz>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
