Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D643C6AC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 20:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718915918; cv=none; b=VidWfhYuOzuo6G52sJ6x8RMZrYYt1j4SQhPdL5eeUkg8ozBq+MGoVDLbdXIGleGQWanXRjwWNBZvKt6pc4CfJTsnspYmw/bYUlPezWN9pF8rvDr4TteoqRx0vX8c9dSq2dwOpJiMsr0Y4Dt3EbZuXyiE3Ec8TulphAYTSfpLaBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718915918; c=relaxed/simple;
	bh=0d3AfDnOPZF/llH0mvEQdmjSPA6e/+ziAsDBitcWtDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ajRZKB7HBVAJpY9cXBjgNuh3tzmnBeUZx+6aSb2il7uHxZaKbJ3wvx1SBJgpKk7lq2X0OFAwAOebuIYKi8kdPwyBt+rlV6XkamtneFclW+H+es5MCYEwlThUNlRzAe2iOzEnFTYtUajsYnF8Yveu+V0CuwWVT1mQBNr+zfwa+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyziusPO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyziusPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718915915; x=1750451915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0d3AfDnOPZF/llH0mvEQdmjSPA6e/+ziAsDBitcWtDc=;
  b=GyziusPOvlMG5rv7B5snb806dEwKDVKpAhbpTeEe0ydlubPOVPllMgA4
   NbmRvtfw9RU8eWtZBAfXN/mulfvppTwzxVIqS4kdak3AQuYhdkvf0apEU
   8NTCwmbuaf0XeuWt2JRgRf4dDgxl9HXaa0nI70xq7HW2H8m5RafrhgO5y
   OEwo01ib45qZTFtI8HFoT6vpiYd3yQ4mI5Hn/cxJzAB8qftguRzZy6Pak
   AMfF4NW2lvkDfXcpIUUMXchKHh5PVEIHuMG6oAucew1rRzY+SklNzzpu6
   iZzBHWFxHsJsXVBwkgAMYNs/7XndRfMtfs924cvY7miftc9Eg3u+1imVv
   g==;
X-CSE-ConnectionGUID: FRCfGxZtSQCf4ugacs0l/Q==
X-CSE-MsgGUID: tucLaImMQjWx8AJn+oyGGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33384913"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="33384913"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 13:38:35 -0700
X-CSE-ConnectionGUID: pyH38nh6QWqMxPXwGMN4+A==
X-CSE-MsgGUID: PAanFQSDTWaBUVW9T4W4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42267769"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jun 2024 13:38:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKOY3-0007w9-0M;
	Thu, 20 Jun 2024 20:38:23 +0000
Date: Fri, 21 Jun 2024 04:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [linux-next:master 6327/7397] drivers/gpu/drm/xe/xe_oa.c:401:15:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202406210435.gX0OJVFq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
commit: cdf02fe1a94a768cbcd20f5c4e1a1d805f4a06c0 [6327/7397] drm/xe/oa/uapi: Add/remove OA config perf ops
config: i386-randconfig-062-20240621 (https://download.01.org/0day-ci/archive/20240621/202406210435.gX0OJVFq-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210435.gX0OJVFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210435.gX0OJVFq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_oa.c:388:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long [usertype] *ptr @@     got void [noderef] __user * @@
   drivers/gpu/drm/xe/xe_oa.c:388:25: sparse:     expected unsigned long long [usertype] *ptr
   drivers/gpu/drm/xe/xe_oa.c:388:25: sparse:     got void [noderef] __user *
>> drivers/gpu/drm/xe/xe_oa.c:401:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned long long [usertype] *ptr @@
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     expected void const volatile [noderef] __user *ptr
   drivers/gpu/drm/xe/xe_oa.c:401:15: sparse:     got unsigned long long [usertype] *ptr
   drivers/gpu/drm/xe/xe_oa.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/drm/drm_managed.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

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
   388		u64 arg, *ptr = u64_to_user_ptr(data);
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
