Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1952AEF5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935073; cv=none; b=Y2yfZkRInBU+6eIODdOsGMvG6AP6zwMkoX+RVJhFkolTpx2oNixMU5K93+RDTseU792cp12AE7fpcB5yzFlABrZMngbjcMXu46eiCLDGS6W/nA67wE0/8QW8jGnnIw5parUHRnhHpzRXYldGzi9mdL2inlMjZXtXd/i/8PDweCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935073; c=relaxed/simple;
	bh=FDZrge4MRKKGUK+r5H8eOtTLZYT05xyB/1hgHre/+wY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o0ABc02P8OKRHbkY/j8KhXmn8jW7zCCSWMI9roAtMT6Cs/0sOcl6NxrAjmi80SHFGLXvsZjg7vb5zDzB9hvVCezmduH+/VL85o+1p0v1rmvnEY3igTn9xd4TwRTZWFEDSHz9gkhN5STNczv9tT1Em9SGzyEiH4mXAuL9OUBr8tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C3SJnfWG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3SJnfWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747935071; x=1779471071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FDZrge4MRKKGUK+r5H8eOtTLZYT05xyB/1hgHre/+wY=;
  b=C3SJnfWGwHhuyzSbZoQ2pY7AdIklIJ4ybKELhScb2frxEWmngiH4z1E6
   XVN/VzLoSa6/jiDVDKcP/9Q6VwY3j5hdR8HUfgeSRqp1UrVOcBpP2/dNS
   WqbOSDjx2byZb2BiSraHhI7wKmvIPH3rzWuYwLjgtkByJh29lW4x9B5wm
   1kMHSdQ6cgoDvmyG9lTZWwKiyojbvHYzar0Z5/1zdGv7Lag4M9ro1mpuy
   VS1GMVji7OTW4N2MRq9Ygen6y5/dkqbY4IyyN3o2E4D0AE9UaUvw26Dpb
   DdlorJV2RDraj7bzTzT/x7OWyG6d9kgizCkGbVCmBQRFqh/Iab87zXA/Y
   A==;
X-CSE-ConnectionGUID: 8Yzzlw1RSKyWlSm8+MOPVw==
X-CSE-MsgGUID: mWKUZKTkTU+G7kbnB6BSTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75373793"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="75373793"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 10:31:11 -0700
X-CSE-ConnectionGUID: jYQEiqolSimjxAVmgGmJKw==
X-CSE-MsgGUID: PYTQX11cTRGovXOGVaBEmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140771760"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 May 2025 10:31:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI9l5-000PYu-3B;
	Thu, 22 May 2025 17:31:07 +0000
Date: Fri, 23 May 2025 01:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 37/43] fs/nfsd/filecache.c:762:undefined
 reference to `nfsd_handle_dir_event'
Message-ID: <202505230136.JY4zY48t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   0c6668479bba48114e5031d6fb3db53d80d8d6ad
commit: f12b06e436e2fc09a2451fbc713d1a6fe5fccfb8 [37/43] nfsd: add notification handlers for dir events
config: sh-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230136.JY4zY48t-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505230136.JY4zY48t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505230136.JY4zY48t-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/nfsd/filecache.o: in function `nfsd_file_fsnotify_handle_event':
>> fs/nfsd/filecache.c:762:(.text+0x1120): undefined reference to `nfsd_handle_dir_event'


vim +762 fs/nfsd/filecache.c

65294c1f2c5e72 Jeff Layton             2019-08-18  734  
65294c1f2c5e72 Jeff Layton             2019-08-18  735  static int
b9a1b9772509cb Amir Goldstein          2020-07-22  736  nfsd_file_fsnotify_handle_event(struct fsnotify_mark *mark, u32 mask,
b9a1b9772509cb Amir Goldstein          2020-07-22  737  				struct inode *inode, struct inode *dir,
950cc0d2bef078 Amir Goldstein          2020-12-02  738  				const struct qstr *name, u32 cookie)
65294c1f2c5e72 Jeff Layton             2019-08-18  739  {
24dca90590509a Gabriel Krisman Bertazi 2021-10-25  740  	if (WARN_ON_ONCE(!inode))
24dca90590509a Gabriel Krisman Bertazi 2021-10-25  741  		return 0;
24dca90590509a Gabriel Krisman Bertazi 2021-10-25  742  
65294c1f2c5e72 Jeff Layton             2019-08-18  743  	trace_nfsd_file_fsnotify_handle_event(inode, mask);
65294c1f2c5e72 Jeff Layton             2019-08-18  744  
f12b06e436e2fc Jeff Layton             2024-10-17  745  	if (dir)
f12b06e436e2fc Jeff Layton             2024-10-17  746  		return nfsd_handle_dir_event(mask, inode, dir, name);
f12b06e436e2fc Jeff Layton             2024-10-17  747  
65294c1f2c5e72 Jeff Layton             2019-08-18  748  	/* Should be no marks on non-regular files */
65294c1f2c5e72 Jeff Layton             2019-08-18  749  	if (!S_ISREG(inode->i_mode)) {
65294c1f2c5e72 Jeff Layton             2019-08-18  750  		WARN_ON_ONCE(1);
65294c1f2c5e72 Jeff Layton             2019-08-18  751  		return 0;
65294c1f2c5e72 Jeff Layton             2019-08-18  752  	}
65294c1f2c5e72 Jeff Layton             2019-08-18  753  
65294c1f2c5e72 Jeff Layton             2019-08-18  754  	/* don't close files if this was not the last link */
65294c1f2c5e72 Jeff Layton             2019-08-18  755  	if (mask & FS_ATTRIB) {
65294c1f2c5e72 Jeff Layton             2019-08-18  756  		if (inode->i_nlink)
65294c1f2c5e72 Jeff Layton             2019-08-18  757  			return 0;
65294c1f2c5e72 Jeff Layton             2019-08-18  758  	}
65294c1f2c5e72 Jeff Layton             2019-08-18  759  
65294c1f2c5e72 Jeff Layton             2019-08-18  760  	nfsd_file_close_inode(inode);
65294c1f2c5e72 Jeff Layton             2019-08-18  761  	return 0;
65294c1f2c5e72 Jeff Layton             2019-08-18 @762  }
65294c1f2c5e72 Jeff Layton             2019-08-18  763  

:::::: The code at line 762 was first introduced by commit
:::::: 65294c1f2c5e72b15b76e16c8c8cfd9359fc9f6f nfsd: add a new struct file caching facility to nfsd

:::::: TO: Jeff Layton <jeff.layton@primarydata.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
