Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1CF249FF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 19:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705521023; cv=none; b=sI5NtULYKHtJ5FDo9O9TpbEnuBgTugH7HQUTAjHASPamAS6eA44m4kLdBErJ67DV4B8hJ+y75bWIS7KY8nhLXoILVy7SZRV36jmtzXARKM5+JP6g9wnETCbNRoLTrOA6huDHYNgoGdhVj+Zaat/4EGOFJmkQuvj1noQhpoYgeTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705521023; c=relaxed/simple;
	bh=Fm2CknV0MfegVZFPR7FGUg1R68g3ZxsXj4HRLDeUZq0=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=QD/0NLTS0D6uFGDH747h8NQqlOEgVuhCUvZ5RnfXAoteErrbgjfEgZqFa3jubUoWwX3/f+iXrEoVDK95z7VsAS0aNjOnXGntsmzMgeB7KqpT4KMpf7krNPtug9vQtZO8xp8bz9y2tFmAXfcxeg1WuLSfUaSxpmPJJ8VQxe1djdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsbdhRQV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsbdhRQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705521021; x=1737057021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fm2CknV0MfegVZFPR7FGUg1R68g3ZxsXj4HRLDeUZq0=;
  b=WsbdhRQVgvkiBfnWuRWQu7UF81LNmhW6ARcj6YLJqLs6AZ+DnixzrWFa
   QhwBFSg2RoIF0KMaXBkmfpeVvl2YSBfxlEFlS3pOq+vgr9FmSKOV4EMHo
   D8zpIWWHCs8qC+m/msquUL3aZ2tiahRlniolyxDsjn928vVFM9fm0ytx1
   rl1DoMjt/gXcT1l2EhiGAYuFMgDjUTvBHp45y7PTEC8/qadcYrWfYjSw4
   Itqq1j8bjxi6ozCToSApurZAQlpUSrVkVvSQhsTKmUzetqNTHCKNdMbA2
   KNeO0JnmkHzC/Igd9DbpFL0SSlEULkJsjOkB3aV8+7G4BSNy8WQyNS+pq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7349226"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7349226"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 11:50:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="18915504"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jan 2024 11:50:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQBvR-0002IY-1A;
	Wed, 17 Jan 2024 19:50:13 +0000
Date: Thu, 18 Jan 2024 03:49:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 105/105] fs/ceph/addr.c:471:13: warning:
 'ceph_fscache_write_to_cache' defined but not used
Message-ID: <202401180325.S7ZD6gvH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   2cf82c6e7baf6d3a2adc0692707028da395f1553
commit: 2cf82c6e7baf6d3a2adc0692707028da395f1553 [105/105] ceph: Use netfslib
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240118/202401180325.S7ZD6gvH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180325.S7ZD6gvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180325.S7ZD6gvH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ceph/addr.c: In function 'get_oldest_context':
   fs/ceph/addr.c:547:1: warning: label 'out' defined but not used [-Wunused-label]
     547 | out:
         | ^~~
   fs/ceph/addr.c: In function 'ceph_page_mkwrite':
   fs/ceph/addr.c:901:44: error: 'struct ceph_inode_info' has no member named 'head_snapc'; did you mean 'i_head_snapc'?
     901 |         return netfs_page_mkwrite(vmf, ci->head_snapc);
         |                                            ^~~~~~~~~~
         |                                            i_head_snapc
   fs/ceph/addr.c:897:35: warning: unused variable 'snapc' [-Wunused-variable]
     897 |         struct ceph_snap_context *snapc;
         |                                   ^~~~~
   fs/ceph/addr.c: At top level:
   fs/ceph/addr.c:66:12: warning: 'ceph_netfs_check_write_begin' used but never defined
      66 | static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c: In function 'ceph_page_mkwrite':
   fs/ceph/addr.c:902:1: warning: control reaches end of non-void function [-Wreturn-type]
     902 | }
         | ^
   fs/ceph/addr.c: At top level:
>> fs/ceph/addr.c:471:13: warning: 'ceph_fscache_write_to_cache' defined but not used [-Wunused-function]
     471 | static void ceph_fscache_write_to_cache(struct inode *inode, u64 off, u64 len, bool caching)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/addr.c:458:13: warning: 'ceph_folio_start_fscache' defined but not used [-Wunused-function]
     458 | static void ceph_folio_start_fscache(struct folio *folio)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:69:34: warning: 'folio_snap_context' defined but not used [-Wunused-function]
      69 | static struct ceph_snap_context *folio_snap_context(struct folio *folio)
         |                                  ^~~~~~~~~~~~~~~~~~


vim +/ceph_fscache_write_to_cache +471 fs/ceph/addr.c

f0702876e152f0 Jeff Layton             2020-06-01  456  
1702e79734104d Jeff Layton             2021-12-07  457  #ifdef CONFIG_CEPH_FSCACHE
797983eb27623a Matthew Wilcox (Oracle  2023-08-25 @458) static void ceph_folio_start_fscache(struct folio *folio)
1702e79734104d Jeff Layton             2021-12-07  459  {
797983eb27623a Matthew Wilcox (Oracle  2023-08-25  460) 	folio_start_fscache(folio);
1702e79734104d Jeff Layton             2021-12-07  461  }
1702e79734104d Jeff Layton             2021-12-07  462  
1702e79734104d Jeff Layton             2021-12-07  463  static void ceph_fscache_write_terminated(void *priv, ssize_t error, bool was_async)
1702e79734104d Jeff Layton             2021-12-07  464  {
1702e79734104d Jeff Layton             2021-12-07  465  	struct inode *inode = priv;
1702e79734104d Jeff Layton             2021-12-07  466  
1702e79734104d Jeff Layton             2021-12-07  467  	if (IS_ERR_VALUE(error) && error != -ENOBUFS)
1702e79734104d Jeff Layton             2021-12-07  468  		ceph_fscache_invalidate(inode, false);
1702e79734104d Jeff Layton             2021-12-07  469  }
1702e79734104d Jeff Layton             2021-12-07  470  
1702e79734104d Jeff Layton             2021-12-07 @471  static void ceph_fscache_write_to_cache(struct inode *inode, u64 off, u64 len, bool caching)
1702e79734104d Jeff Layton             2021-12-07  472  {
1702e79734104d Jeff Layton             2021-12-07  473  	struct ceph_inode_info *ci = ceph_inode(inode);
1702e79734104d Jeff Layton             2021-12-07  474  	struct fscache_cookie *cookie = ceph_fscache_cookie(ci);
1702e79734104d Jeff Layton             2021-12-07  475  
1702e79734104d Jeff Layton             2021-12-07  476  	fscache_write_to_cache(cookie, inode->i_mapping, off, len, i_size_read(inode),
1702e79734104d Jeff Layton             2021-12-07  477  			       ceph_fscache_write_terminated, inode, caching);
1702e79734104d Jeff Layton             2021-12-07  478  }
1702e79734104d Jeff Layton             2021-12-07  479  #else
797983eb27623a Matthew Wilcox (Oracle  2023-08-25  480) static inline void ceph_folio_start_fscache(struct folio *folio)
1702e79734104d Jeff Layton             2021-12-07  481  {
1702e79734104d Jeff Layton             2021-12-07  482  }
1702e79734104d Jeff Layton             2021-12-07  483  

:::::: The code at line 471 was first introduced by commit
:::::: 1702e79734104d711a84ff55bd6a93c21947bc01 ceph: add fscache writeback support

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
