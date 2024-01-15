Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF1E15B3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 01:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btlyCqMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705283572; x=1736819572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rbbp1V9b7oP7GFL+oUY6idGZtCch0WqL1A9t90HLd/Q=;
  b=btlyCqMCz7ZNTLkWvIdsNQ5C2lDWM2yy81l8iveDIb88z6klVvmMX+KQ
   63Xv5VazCKqqW2lcaLiJEkpxlq3UYuRxp/s5KdUeJ8+Tf8XVw9HjWNWKi
   iV0tMtODoswAlrpx/JwGJ9a4AX57ypWmsbX+85zcHsMIp7wPCLCODshiH
   ZW6yk0RdXMhKcyTbgxrLi3qeNauwdCyS5kMryM3vZryd3Z4ShTZ7vEBZC
   iEKuo0Sl3aEXOputEm9ataaMjMCGznsTPFzoHKvhA3Bk61f2qNLgz2L68
   AjB2GiRP8CRVYJXJgbPTaFqUvNlHIgKIofbUe7duaQ5ca9ndCtrRMrS9e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="398379867"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="398379867"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 17:52:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="786941690"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="786941690"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Jan 2024 17:52:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPC9V-000Bzs-37;
	Mon, 15 Jan 2024 01:52:42 +0000
Date: Mon, 15 Jan 2024 09:52:16 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify-perf 3/3] include/linux/fsnotify.h:115:51: error:
 'struct inode' has no member named 'i_fsnotify_mask'
Message-ID: <202401150910.4JqL8o4n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify-perf
head:   f602365f9bbe01bd2faf490e801fe35368fbde98
commit: f602365f9bbe01bd2faf490e801fe35368fbde98 [3/3] fsnotify: optimize the case of no content event watchers
config: i386-buildonly-randconfig-004-20240115 (https://download.01.org/0day-ci/archive/20240115/202401150910.4JqL8o4n-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150910.4JqL8o4n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150910.4JqL8o4n-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/configfs/dir.c:14:
   include/linux/fsnotify.h: In function 'fsnotify_path':
>> include/linux/fsnotify.h:115:51: error: 'struct inode' has no member named 'i_fsnotify_mask'
     115 |                 __u32 marks_mask = d_inode(dentry)->i_fsnotify_mask |
         |                                                   ^~
>> include/linux/fsnotify.h:116:48: error: 'struct super_block' has no member named 's_fsnotify_mask'
     116 |                                    dentry->d_sb->s_fsnotify_mask;
         |                                                ^~


vim +115 include/linux/fsnotify.h

    97	
    98	static inline int fsnotify_path(const struct path *path, __u32 mask)
    99	{
   100		struct dentry *dentry = path->dentry;
   101	
   102		if (!fsnotify_sb_has_watchers(dentry->d_sb))
   103			return 0;
   104	
   105		/* Optimize the likely case of sb/mount/parent not watching content */
   106		if (mask & FSNOTIFY_CONTENT_EVENTS &&
   107		    likely(!(dentry->d_flags & DCACHE_FSNOTIFY_PARENT_WATCHED)) &&
   108		    likely(!(dentry->d_sb->s_iflags & SB_I_CONTENT_WATCHED))) {
   109			/*
   110			 * XXX: if SB_I_CONTENT_WATCHED is not set, checking for content
   111			 * events in s_fsnotify_mask is redundant, but it will be needed
   112			 * if we use the flag FS_MNT_CONTENT_WATCHED to indicate the
   113			 * existence of only mount content event watchers.
   114			 */
 > 115			__u32 marks_mask = d_inode(dentry)->i_fsnotify_mask |
 > 116					   dentry->d_sb->s_fsnotify_mask;
   117	
   118			if (!(mask & marks_mask))
   119				return 0;
   120		}
   121	
   122		/*
   123		 * sb/mount/parent are being watched. Need to call fsnotify_parent()
   124		 * to check the event masks of sb/mount/parent/inode marks.
   125		 */
   126		return fsnotify_parent(path->dentry, mask, path, FSNOTIFY_EVENT_PATH);
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
