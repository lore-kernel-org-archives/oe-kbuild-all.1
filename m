Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874A411184
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 04:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709787349; cv=none; b=GRfPwP6IsaMpJT4P3xJjMAZnjvVoJA9XV+AZhefLYZOv7hmOTrKYc1DfIj4FMsKG3J7GLVLx4tCMJfYEwWgIlC1Oc/nc1kImph/e/tUddkBK5OHB5n7qJgVMHNYnsIpxxt3L3w8wkOVlz3lNiU15kYEnKsza5ES/BN5kplkgzZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709787349; c=relaxed/simple;
	bh=XdWPLT4d0toYaKu+/Is/UVicxk1zKFC1fml86Lp8/Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L3M2tagGM+t54cmrWTAu0DMkaPzmWpQh4KLVYA2IBhnwDBOApMc5PhbzaWJmyCzLY5eiY6w45NbqewO8nU/hZkt/j1TjFh/xqySZbK8ItPnjiZYfv+9sloNxgmwG6qVDwQWSS+WLJ5vrHMMBlK/spZkHu6wtX4qU0bWGae0LCzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hc7BrvHl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hc7BrvHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709787347; x=1741323347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XdWPLT4d0toYaKu+/Is/UVicxk1zKFC1fml86Lp8/Ro=;
  b=Hc7BrvHlyISRqZMT0gP9IE/KSxhf7LO+Js/dDFJe+lw0BNqNU6x+Es1A
   tvS/+9bI2g7lrZJQsdkI+4WfIxSgFjWtFGgY3nZsRBYaVAcfhxgeRvHpE
   jsnRJEWFJVjaaA40QSg2t8+PKHk7OyoQiSLUOasH0ihYV86fHcNO359lC
   b+JVV+snzo2ntt/JTY8QPSyfVXDUZQU1GtPZ/gOJ2v9lRSy5SNdPGeyqI
   8BLb7vyNce2w86EMGmoD89cL0fJOkgVJUxt776QSGeQ5/Fa2NCfbFnTy6
   sR4IBwsOUuicdd7xpDt9F/is0cLyNMHcxtp1dI1OqZVGT6R74T0z8m/uj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="5020111"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="5020111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 20:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="10415876"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2024 20:55:45 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri5nB-0004ov-2Y;
	Thu, 07 Mar 2024 04:55:41 +0000
Date: Thu, 7 Mar 2024 12:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:evm-fscaps-v2 29/29] security/security.c:2375:15:
 error: implicit declaration of function 'ima_inode_set_fscaps'; did you mean
 'evm_inode_set_fscaps'?
Message-ID: <202403071228.6gAA2DMl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux evm-fscaps-v2
head:   49621962de7e9bad18b99e21dcb8b32f5af7b61e
commit: 49621962de7e9bad18b99e21dcb8b32f5af7b61e [29/29] fixes
config: x86_64-randconfig-122-20240306 (https://download.01.org/0day-ci/archive/20240307/202403071228.6gAA2DMl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071228.6gAA2DMl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071228.6gAA2DMl-lkp@intel.com/

All errors (new ones prefixed by >>):

   security/security.c: In function 'security_inode_set_fscaps':
>> security/security.c:2375:15: error: implicit declaration of function 'ima_inode_set_fscaps'; did you mean 'evm_inode_set_fscaps'? [-Werror=implicit-function-declaration]
    2375 |         ret = ima_inode_set_fscaps(idmap, dentry, caps, flags);
         |               ^~~~~~~~~~~~~~~~~~~~
         |               evm_inode_set_fscaps
   security/security.c: In function 'security_inode_remove_fscaps':
>> security/security.c:2434:15: error: implicit declaration of function 'ima_inode_remove_fscaps'; did you mean 'evm_inode_remove_fscaps'? [-Werror=implicit-function-declaration]
    2434 |         ret = ima_inode_remove_fscaps(dentry);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
         |               evm_inode_remove_fscaps
   cc1: some warnings being treated as errors


vim +2375 security/security.c

  2353	
  2354	/**
  2355	 * security_inode_set_fscaps() - Check if setting fscaps is allowed
  2356	 * @idmap: idmap of the mount
  2357	 * @dentry: file
  2358	 * @caps: fscaps to be written
  2359	 * @flags: flags for setxattr
  2360	 *
  2361	 * Check permission before setting the file capabilities given in @vfs_caps.
  2362	 *
  2363	 * Return: Returns 0 if permission is granted.
  2364	 */
  2365	int security_inode_set_fscaps(struct mnt_idmap *idmap, struct dentry *dentry,
  2366				      const struct vfs_caps *caps, int flags)
  2367	{
  2368		int ret;
  2369	
  2370		if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
  2371			return 0;
  2372		ret = call_int_hook(inode_set_fscaps, 0, idmap, dentry, caps, flags);
  2373		if (ret)
  2374			return ret;
> 2375		ret = ima_inode_set_fscaps(idmap, dentry, caps, flags);
  2376		if (ret)
  2377			return ret;
  2378		return evm_inode_set_fscaps(idmap, dentry, caps, flags);
  2379	}
  2380	
  2381	/**
  2382	 * security_inode_post_set_fscaps() - Update the inode after setting fscaps
  2383	 * @idmap: idmap of the mount
  2384	 * @dentry: file
  2385	 * @caps: fscaps to be written
  2386	 * @flags: flags for setxattr
  2387	 *
  2388	 * Update inode security field after successfully setting fscaps.
  2389	 *
  2390	 */
  2391	void security_inode_post_set_fscaps(struct mnt_idmap *idmap,
  2392					    struct dentry *dentry,
  2393					    const struct vfs_caps *caps, int flags)
  2394	{
  2395		if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
  2396			return;
  2397		call_void_hook(inode_post_set_fscaps, idmap, dentry, caps, flags);
  2398		evm_inode_post_set_fscaps(idmap, dentry, caps, flags);
  2399	}
  2400	
  2401	/**
  2402	 * security_inode_get_fscaps() - Check if reading fscaps is allowed
  2403	 * @dentry: file
  2404	 *
  2405	 * Check permission before getting fscaps.
  2406	 *
  2407	 * Return: Returns 0 if permission is granted.
  2408	 */
  2409	int security_inode_get_fscaps(struct mnt_idmap *idmap, struct dentry *dentry)
  2410	{
  2411		if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
  2412			return 0;
  2413		return call_int_hook(inode_get_fscaps, 0, idmap, dentry);
  2414	}
  2415	
  2416	/**
  2417	 * security_inode_remove_fscaps() - Check if removing fscaps is allowed
  2418	 * @idmap: idmap of the mount
  2419	 * @dentry: file
  2420	 *
  2421	 * Check permission before removing fscaps.
  2422	 *
  2423	 * Return: Returns 0 if permission is granted.
  2424	 */
  2425	int security_inode_remove_fscaps(struct mnt_idmap *idmap, struct dentry *dentry)
  2426	{
  2427		int ret;
  2428	
  2429		if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
  2430			return 0;
  2431		ret = call_int_hook(inode_remove_fscaps, 0, idmap, dentry);
  2432		if (ret)
  2433			return ret;
> 2434		ret = ima_inode_remove_fscaps(dentry);
  2435		if (ret)
  2436			return ret;
  2437		return evm_inode_remove_fscaps(dentry);
  2438	}
  2439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
