Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A6735CBC3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 14:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763215633; cv=none; b=axLaDv/hDNKhJBSnZS+rKZ2PDEqBair0q8PzUCW34LXKZt6UxHZDus3Nnzus+gYAEKD0nZ+vuTqZWFSP0G4qtsEe5jsMr9bcrwE49c1BVXe3rOvBA4O8adaZbYTLqgz59QODIDd+oFo0J9Isymh1BooJjk2c8+L4bwso9hqJnm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763215633; c=relaxed/simple;
	bh=zdTv0Z/rlXF4o6aneuvtH50SqLOZk/a7AFPZM9wCxY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmL7I128taNCrVNKeYFBzPju6OkTTavZgvlC5egipq9196xVtVIBn8qC3/Zufwe6Rijulv51PaI36CuLZE6PmEaPGoGN85QFHLfBUdsYQ/ZieqH43wQR75cWg6QScebu+QgMeFDmLAJVvqKMtVcuyhhJf+U2K+1Eh5+nqwhVuro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APrHuqpO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APrHuqpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763215631; x=1794751631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zdTv0Z/rlXF4o6aneuvtH50SqLOZk/a7AFPZM9wCxY8=;
  b=APrHuqpOUsd/uoUGVM43GbC6x695QuebF73s8lYiY0/jYALVcm5/U/7G
   mVDMRYQGwPtPhcfK9tJLCG9zur+Ow8w7wrITCOaTYjVI/K6UHdLhEeVx7
   Il9fTnXK6X4iLC0uYOnMra8nnEd5DwCGDcV2U4P7e8W1nT2UtXU9UDzMO
   OC8MfYS21DkTIhBv/9H9hgDdTLFF8vy5/StzCqY7cOvpo2AbEbzgp+5nf
   +PxtAOupUByfbJuWFgagiKzjuV4CfDb0NrX4Mmgkl+qq4hG5BpolFmcpq
   xCiwJHhwMuvODfWqNFGB4zTNhhWkipAkWHaUBXYwlO9lAcvuRjXjyfYcZ
   w==;
X-CSE-ConnectionGUID: 8ZJT/3rtSY+lDhz5Ph1+hw==
X-CSE-MsgGUID: WMp+xfRRTU6CYHHu07zIDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="82673635"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="82673635"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 06:07:11 -0800
X-CSE-ConnectionGUID: Vy3CaoHnTQKQrwgqUBa76g==
X-CSE-MsgGUID: 1icUTlfYQayJK4h1IapL0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="190481416"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Nov 2025 06:07:10 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKGvj-000815-2y;
	Sat, 15 Nov 2025 14:07:07 +0000
Date: Sat, 15 Nov 2025 22:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:pdirops 12/19] fs/overlayfs/dir.c:582:13: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202511152248.uA0YA4CD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux pdirops
head:   3c4028c13414cb58cd674b839b8faec6afbcad51
commit: b1f61c4156d084ae5f2532f87fd31e1bb74579cf [12/19] ovl: add prepare_creds_ovl cleanup guard
config: powerpc-randconfig-r123-20251115 (https://download.01.org/0day-ci/archive/20251115/202511152248.uA0YA4CD-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511152248.uA0YA4CD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511152248.uA0YA4CD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/overlayfs/dir.c:582:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/overlayfs/dir.c:582:13: sparse:    struct cred const [noderef] __rcu *
   fs/overlayfs/dir.c:582:13: sparse:    struct cred const *

vim +582 fs/overlayfs/dir.c

   577	
   578	static const struct cred *ovl_prepare_creds(struct dentry *dentry, struct inode *inode, umode_t mode)
   579	{
   580		int err;
   581	
 > 582		if (WARN_ON_ONCE(current->cred != ovl_creds(dentry->d_sb)))
   583			return ERR_PTR(-EINVAL);
   584	
   585		CLASS(prepare_creds, override_cred)();
   586		if (!override_cred)
   587			return ERR_PTR(-ENOMEM);
   588	
   589		override_cred->fsuid = inode->i_uid;
   590		override_cred->fsgid = inode->i_gid;
   591	
   592		err = security_dentry_create_files_as(dentry, mode, &dentry->d_name,
   593						      current->cred, override_cred);
   594		if (err)
   595			return ERR_PTR(err);
   596	
   597		return override_creds(no_free_ptr(override_cred));
   598	}
   599	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
