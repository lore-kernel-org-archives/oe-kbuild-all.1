Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DC341D23B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 05:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790140367; cv=none; b=mP6VPnERioGi8zHsbDXMBRkc69zirQXiHbuNJIJS6529Jd30vPxblTMytcM1NHO0tfJ7KfDYosfffMIlAkBc+XZ6wHaC7oEN8xhmw20/UwDKbbltaaHUlDotcm7JWbQwYh/KB4E9lMddi7odw3x2G7ekrKCgm5MijkYGnRsaUIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790140367; c=relaxed/simple;
	bh=qtzE2qlKpfRiqV9hzGIcBOoC19mIuInrRJ4kUjElYXs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tKSgfLGPkbp35IX7bsDBM73+xYkZOGtRCviysfII6pFUvFGZKuvDO33MM0uDtz5CmDFR+bn4LY1X3dN32Jx+qo/mzsjpAtKx4EG1eW9T1SbVHdwhR+Q0Q/5IxaPxA23XXM1DDhVLdB3aequbVbB02kn10Zb3aQ1hdC/YpoKq1Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQwyFeft; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQwyFeft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790140363; x=1821676363;
  h=date:from:to:cc:subject:message-id;
  bh=qtzE2qlKpfRiqV9hzGIcBOoC19mIuInrRJ4kUjElYXs=;
  b=YQwyFeftCVHl8v2EPOAz+njmccC/V8Cd4vhLufgwSIUu/1iKV/LNyrgr
   bulQWHwmd+a4gEz7E84OBYWaPwPhHNT+LeaWxvJAJYMsKSBX4xMDrFgND
   Oe765b8JgZdY+UYjxsHTheimMT45Vc1cyYG0Xt2S3GYSDVk7dwPvtLSMi
   ekLlU5uuYHE1rndsvUnOthNX6GHKIauvWxiWKSHtrc3mYBSVD/NBDkzLH
   fnvQXEYyCBAU0Ta9smT0IkpsFNwLCf2hBnf9c6QaozW/WwzpKH5VrgEuY
   dSbkYRgCdn9kNeA0d2H8C5rzVFGGSw8oM7lBMBZctZlXNgUBo+Gv9iZ9W
   A==;
X-CSE-ConnectionGUID: fdmdYNGVTlWB41ZAuf0eDg==
X-CSE-MsgGUID: OgZPEP7VTpuBZD3fJoGT4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90820159"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90820159"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 22:12:27 -0700
X-CSE-ConnectionGUID: DKeSnLzBTpWBDwPAd90PUw==
X-CSE-MsgGUID: DZPOZt/vR/qmVjwHq7w37g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="4518021"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 22 Sep 2026 22:12:26 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9FHM-000000000Wt-09q1;
	Wed, 23 Sep 2026 05:12:24 +0000
Date: Wed, 23 Sep 2026 07:12:21 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:extent-map 15/18] fs/fuse/inode.c:438:49:
 error: 'struct fuse_conn' has no member named 'vdax'
Message-ID: <202609230758.qGk9n06S-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map
head:   70caed148725b4dd32916ecfe906977e2f79aff1
commit: 343c66361a8e8ab509910030bf19eab3357555b2 [15/18] fuse: add support for opening dax device as backing
config: arc-randconfig-r2202-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230758.qGk9n06S-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609230758.qGk9n06S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230758.qGk9n06S-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fuse/inode.c: In function 'fuse_init_inode':
>> fs/fuse/inode.c:438:49: error: 'struct fuse_conn' has no member named 'vdax'
     438 |         if ((attr->flags & FUSE_ATTR_DAX) && !fc->vdax) {
         |                                                 ^~


vim +438 fs/fuse/inode.c

   409	
   410	static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
   411				    struct fuse_conn *fc)
   412	{
   413		inode->i_mode = attr->mode & S_IFMT;
   414		inode->i_size = attr->size;
   415		inode_set_mtime(inode, attr->mtime, attr->mtimensec);
   416		inode_set_ctime(inode, attr->ctime, attr->ctimensec);
   417		if (S_ISREG(inode->i_mode)) {
   418			fuse_init_common(inode);
   419			fuse_init_file_inode(inode, attr->flags);
   420		} else if (S_ISDIR(inode->i_mode))
   421			fuse_init_dir(inode);
   422		else if (S_ISLNK(inode->i_mode))
   423			fuse_init_symlink(inode);
   424		else if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode) ||
   425			 S_ISFIFO(inode->i_mode) || S_ISSOCK(inode->i_mode)) {
   426			fuse_init_common(inode);
   427			init_special_inode(inode, inode->i_mode,
   428					   new_decode_dev(attr->rdev));
   429		} else
   430			BUG();
   431		/*
   432		 * Ensure that we don't cache acls for daemons without FUSE_POSIX_ACL
   433		 * so they see the exact same behavior as before.
   434		 */
   435		if (!fc->posix_acl)
   436			inode->i_acl = inode->i_default_acl = ACL_DONT_CACHE;
   437	
 > 438		if ((attr->flags & FUSE_ATTR_DAX) && !fc->vdax) {
   439			inode->i_flags |= S_DAX;
   440			inode->i_data.a_ops = &fuse_dax_aops;
   441		}
   442	}
   443	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
