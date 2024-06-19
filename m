Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88717A55
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 20:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718827783; cv=none; b=ItbtCMzDSnvcpEJUMQa1+cTif9nHPE2ewZ3jT6LYSVbGLwSBDV66oJ9wM5zTS/3ZCXw/SdPmWYou1lOvoNcEh8Ni3Lm5mzlo2g3zFzPDfx5j8PWVAlx+Rqb0dxNNWJDK821QExDe7z+XP16hy9YHXB27k+l0oHEMRDKTaZptj0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718827783; c=relaxed/simple;
	bh=1egkmuccAhB2tTJHm0Cw8yu6+yKw8UybriYu5XdpFDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DGLdY3r/bNXP4YXLLU9wPQ5O+DgbWnD10drZbaHZZtxOTR3C2qoONRqlb74zDcO89Z6vQKFKmKRbKkYI+X06pgTb3VJT3H3153YlC6LZ+jQ3nwTWMEY/dOvnszqqPX3mxm1gNN1SlX94zw4dE/Hl8kwo3sC3bskxglzJsSlVZBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrMAQS7S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrMAQS7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718827782; x=1750363782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1egkmuccAhB2tTJHm0Cw8yu6+yKw8UybriYu5XdpFDs=;
  b=DrMAQS7SIMJRhKNjJRz384DaoJbqB73CBO7WC8rgCk4LCG5yX2/oXTYH
   JJNR8HTIoCHTCV7p62vLto/YwxzbCadKJ8MY7JDZSaNqnaZ93fNuAkE+s
   wqGd5xmFDR6IZrZC/rzX/FDSz2oZJsqEmCf4LCGUdxD8v+e/9VudSYNLY
   kTs9DRjJUFvl7yovdfvsg8e8hLYR2VIQq1iJ0axMc9a32V0cabNiCdHuH
   ZLB3vKztfEudFnP0dC04gECyDvoKn6/XWtKlBtFmWJTVsYFa6IfPsg4MB
   3zqrp5+n9akY7wBifZy8JiX6bIJfLxf8a97DBt+ZHdIKIZet+S2elZSUu
   A==;
X-CSE-ConnectionGUID: vXEtwtSvShWMTFXEo+72pg==
X-CSE-MsgGUID: xooztvaRQZ64b8S1XRgClg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15900829"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15900829"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 13:09:41 -0700
X-CSE-ConnectionGUID: YB0w+ziSQcyva9XV0qMRUA==
X-CSE-MsgGUID: vWozgc0lTrS6IoDCvI5JCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="65261429"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2024 13:09:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK1cf-0006ws-1T;
	Wed, 19 Jun 2024 20:09:37 +0000
Date: Thu, 20 Jun 2024 04:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [linux-next:master 6397/7105] drivers/gpu/drm/xe/xe_oa.c:388:25:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202406200413.W16nHKXV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: cdf02fe1a94a768cbcd20f5c4e1a1d805f4a06c0 [6397/7105] drm/xe/oa/uapi: Add/remove OA config perf ops
config: powerpc-randconfig-r111-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200413.W16nHKXV-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20240620/202406200413.W16nHKXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200413.W16nHKXV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_oa.c:388:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [usertype] *ptr @@     got void [noderef] __user * @@
   drivers/gpu/drm/xe/xe_oa.c:388:25: sparse:     expected unsigned long long [usertype] *ptr
   drivers/gpu/drm/xe/xe_oa.c:388:25: sparse:     got void [noderef] __user *
>> drivers/gpu/drm/xe/xe_oa.c:401:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [noderef] __user *_gu_addr @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     expected unsigned long long [noderef] __user *_gu_addr
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     got unsigned long long [usertype] *ptr

vim +388 drivers/gpu/drm/xe/xe_oa.c

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
