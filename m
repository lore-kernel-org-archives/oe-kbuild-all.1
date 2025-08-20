Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DBF1482F2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 01:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755654207; cv=none; b=tjItQskCaUQ7LSZN60vMmAyBy21uPO5V++2MNWGxIeT2af0SVNqN1rFF7O57dBh+9a6sh34QUjhzcNiCDGsXrqhhW7PR+grC5XkkDFqV8wGywk/1TcfzU1HbjM3zxeovqLU59JFZ5Q0mBvn2jKwGtZ7/3/nByHdu0rKV29rtW7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755654207; c=relaxed/simple;
	bh=xdnb72dXFc3ovT7kYARak9oxtgp5iSbNTC3k5wev39w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tBJLiI5bRebDztM3KaU5mXJs9vcD/cnRfZUSo4Klqg+Oo74F8Dwpu45ozUVvoRKIVa5stZWLWt3KcRg4f0akjXcFWsnbXHhMYUXpT0ZHSu8OGpzxZAO8WmY71KjXGIIxlmxpkSier7OXmAAYt+5hh14elX0d9ATR8PjvyoaJrsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HS2p08AH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HS2p08AH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755654206; x=1787190206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xdnb72dXFc3ovT7kYARak9oxtgp5iSbNTC3k5wev39w=;
  b=HS2p08AHz/e7seFhWCioy4GMrUkTzTe0lJgTfNEy5sZwaudZv0j2DkDI
   wiqqU/FUan6nPE5hXgbuEmTF+rFAiwijCPTaL/PI8NNEnYPrCmRJFUmA3
   Y+XjMhVD77GM6XKHdv0l6bgDrD0PqJKCuwcwGUEqUewTHkE5ntFZVCMQH
   ghTubB0IFo5YklRjLf689N4FW9uCQ89Nis6i3rx4CVnIS7hg/qEtvLvPi
   lldTX/bMMlM1rjtVaz/kaZIbdVSuM5dlhBSg/OITgtZQYUZAV3YJjgfAE
   +9Y/etocKigF9NeO2sKfC0otNxIc/ctSpVncQ6TaHCIg88ExdJMMjeCRu
   g==;
X-CSE-ConnectionGUID: eoU1ZTvMS66m7PSnMOVfMA==
X-CSE-MsgGUID: p2JhzcB7QBGBZ1WgY6NV/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="56939984"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="56939984"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 18:43:26 -0700
X-CSE-ConnectionGUID: r5i99c+iQeKRSCLRc6vbkw==
X-CSE-MsgGUID: AsK/L1moSAS/EEg3xJP3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168340439"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2025 18:43:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoXr9-000HwP-2V;
	Wed, 20 Aug 2025 01:43:17 +0000
Date: Wed, 20 Aug 2025 09:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-cache 61/63] fs/fuse/file_iomap.c:593:15:
 error: assignment to 'struct fuse_iomap_dev *' from incompatible pointer
 type 'struct fuse_backing *'
Message-ID: <202508200935.qWOIAiiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   3dc844fb9d8e17b6bf801ac080192c845a12467e
commit: 4e07307eb851f31e4c64e32a876273372f38c042 [61/63] fuse: use the iomap cache for iomap_begin
config: i386-buildonly-randconfig-002-20250820 (https://download.01.org/0day-ci/archive/20250820/202508200935.qWOIAiiU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508200935.qWOIAiiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508200935.qWOIAiiU-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fuse/file_iomap.c: In function 'fuse_iomap_from_cache':
>> fs/fuse/file_iomap.c:593:15: error: assignment to 'struct fuse_iomap_dev *' from incompatible pointer type 'struct fuse_backing *' [-Werror=incompatible-pointer-types]
     593 |         iodev = fuse_iomap_find_dev(fm->fc, &lmap->map);
         |               ^
>> fs/fuse/file_iomap.c:597:46: error: passing argument 3 of 'fuse_iomap_from_server' from incompatible pointer type [-Werror=incompatible-pointer-types]
     597 |         fuse_iomap_from_server(inode, iomap, iodev, &lmap->map);
         |                                              ^~~~~
         |                                              |
         |                                              struct fuse_iomap_dev *
   fs/fuse/file_iomap.c:348:70: note: expected 'const struct fuse_backing *' but argument is of type 'struct fuse_iomap_dev *'
     348 |                                           const struct fuse_backing *fb,
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
>> fs/fuse/file_iomap.c:600:9: error: implicit declaration of function 'fuse_iomap_dev_put'; did you mean 'fuse_iomap_dev_inval'? [-Werror=implicit-function-declaration]
     600 |         fuse_iomap_dev_put(iodev);
         |         ^~~~~~~~~~~~~~~~~~
         |         fuse_iomap_dev_inval
   cc1: some warnings being treated as errors


vim +593 fs/fuse/file_iomap.c

   585	
   586	/* Convert a mapping from the cache into something the kernel can use */
   587	static int fuse_iomap_from_cache(struct inode *inode, struct iomap *iomap,
   588					 const struct fuse_iomap_lookup *lmap)
   589	{
   590		struct fuse_mount *fm = get_fuse_mount(inode);
   591		struct fuse_iomap_dev *iodev;
   592	
 > 593		iodev = fuse_iomap_find_dev(fm->fc, &lmap->map);
   594		if (IS_ERR(iodev))
   595			return PTR_ERR(iodev);
   596	
 > 597		fuse_iomap_from_server(inode, iomap, iodev, &lmap->map);
   598		iomap->validity_cookie = lmap->validity_cookie;
   599	
 > 600		fuse_iomap_dev_put(iodev);
   601		return 0;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
