Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905472AF1B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717170; cv=none; b=Qyzxi+arKK6bsc8sPNMQvVrzhl09tzgusJJ9M9kOAdFlPXGqDmnnsNz3C+nKMDIpOg5kmyUkOjcYL6NISC4ORNcKRpbDRhJpRyGWr7EmKumZ5sX87faccSVpI7cdOzNRTAuNtgwzYAZxO30cwGj1L6xtpp1qFNCJRIJdgcxhMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717170; c=relaxed/simple;
	bh=Ib6LYbNyHMWi0bvWNTR1siEDoJmbwYPzqVMwKR6VjSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9IZR8QbcDVPoAXu3RXL8zNcLssuWU28GhNi2HGDfGkGZXLQX4cnYiMNaduLLIFO4dLtF87BUgzirC+Ox0L0x6WvJPtxKSwxo9n/3SjEvzTOBuc3BCxwdLQj4vdVWJV2ad2m788rMT6UIx8+R2kyKSBNuJhiNRcearxSx/qway0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VrlktDQy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VrlktDQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717169; x=1765253169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ib6LYbNyHMWi0bvWNTR1siEDoJmbwYPzqVMwKR6VjSg=;
  b=VrlktDQy01OIdIPB8uRO4QaY3WzWHqdEkUMsOSRNesTiLSBqjJjJkwRE
   5aQ+I5+I/j8Xq5ONDFTNBnGZcn3JZxWVxWoYD7OAyy9fDE5pMc/vbP7uF
   yo8IXzaIt/M1rug+fV5jGjLVBD6RwvSdeqEwZSzerkJQYmyHnSkYjbRD9
   JDiM5R+p92VviklZzoytzeYyQVeo7yheLxck4wF9kLL7fN05nKO9U8RRe
   RDVKTPu80siuQ4/IZGFM9pcPrkV6/bjWRz5nVY6SSqPglxTxhijH59kAd
   NO+Htf78FbaF9c49lexPbUD4MMvIboMtw3qWp5ZnHiN14/fmUMoiRrrrY
   w==;
X-CSE-ConnectionGUID: G7KIU7xAQGKNcv3TmEghmg==
X-CSE-MsgGUID: XcAZzKhbQaKeBWSfrQduhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="59402285"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="59402285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:06:06 -0800
X-CSE-ConnectionGUID: Ox+TqtLwRKCpQTKtYSsC5w==
X-CSE-MsgGUID: b9+Yw6bFRIy3C0QNGBn2hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99987603"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Dec 2024 20:06:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV22-0003mt-0y;
	Mon, 09 Dec 2024 04:06:02 +0000
Date: Mon, 9 Dec 2024 12:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: drivers/gpu/drm/xe/xe_oa.c:401:15: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202412071146.uzl1t7vz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: cdf02fe1a94a768cbcd20f5c4e1a1d805f4a06c0 drm/xe/oa/uapi: Add/remove OA config perf ops
date:   6 months ago
config: s390-randconfig-r112-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071146.uzl1t7vz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412071146.uzl1t7vz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071146.uzl1t7vz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_oa.c:388:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [usertype] *ptr @@     got void [noderef] __user * @@
   drivers/gpu/drm/xe/xe_oa.c:388:25: sparse:     expected unsigned long long [usertype] *ptr
   drivers/gpu/drm/xe/xe_oa.c:388:25: sparse:     got void [noderef] __user *
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     expected void const volatile [noderef] __user *ptr
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     got unsigned long long [usertype] *ptr
>> drivers/gpu/drm/xe/xe_oa.c:401:15: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     expected void const [noderef] __user *ptr
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     got unsigned long long [usertype] *ptr
>> drivers/gpu/drm/xe/xe_oa.c:401:15: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     expected void const [noderef] __user *ptr
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     got unsigned long long [usertype] *ptr
>> drivers/gpu/drm/xe/xe_oa.c:401:15: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     expected void const [noderef] __user *ptr
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     got unsigned long long [usertype] *ptr
>> drivers/gpu/drm/xe/xe_oa.c:401:15: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     expected void const [noderef] __user *ptr
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     got unsigned long long [usertype] *ptr

vim +401 drivers/gpu/drm/xe/xe_oa.c

   377	
   378	/**
   379	 * xe_oa_remove_config_ioctl - Removes one OA config
   380	 * @dev: @drm_device
   381	 * @data: pointer to struct @drm_xe_perf_param
   382	 * @file: @drm_file
   383	 */
   384	int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
   385	{
   386		struct xe_oa *oa = &to_xe_device(dev)->oa;
   387		struct xe_oa_config *oa_config;
 > 388		u64 arg, *ptr = u64_to_user_ptr(data);
   389		int ret;
   390	
   391		if (!oa->xe) {
   392			drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
   393			return -ENODEV;
   394		}
   395	
   396		if (xe_perf_stream_paranoid && !perfmon_capable()) {
   397			drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
   398			return -EACCES;
   399		}
   400	
 > 401		ret = get_user(arg, ptr);
   402		if (XE_IOCTL_DBG(oa->xe, ret))
   403			return ret;
   404	
   405		ret = mutex_lock_interruptible(&oa->metrics_lock);
   406		if (ret)
   407			return ret;
   408	
   409		oa_config = idr_find(&oa->metrics_idr, arg);
   410		if (!oa_config) {
   411			drm_dbg(&oa->xe->drm, "Failed to remove unknown OA config\n");
   412			ret = -ENOENT;
   413			goto err_unlock;
   414		}
   415	
   416		WARN_ON(arg != oa_config->id);
   417	
   418		sysfs_remove_group(oa->metrics_kobj, &oa_config->sysfs_metric);
   419		idr_remove(&oa->metrics_idr, arg);
   420	
   421		mutex_unlock(&oa->metrics_lock);
   422	
   423		drm_dbg(&oa->xe->drm, "Removed config %s id=%i\n", oa_config->uuid, oa_config->id);
   424	
   425		xe_oa_config_put(oa_config);
   426	
   427		return 0;
   428	
   429	err_unlock:
   430		mutex_unlock(&oa->metrics_lock);
   431		return ret;
   432	}
   433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
