Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874652609E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764062247; cv=none; b=osB2oBLpAacZesNvYGqFl1xyub3TslSu8pqEU6cPd1u6q5DCXGMio4B8Pt+0PbUsSWI3EH10kgLCRgCv8Rhi4DlLooxHnNQMEwie8s8+j4shNwuuqwt1iKWf7gzTqel71cR9LXPDu7xoKAnfLhTMRMw997HgWw/dkBb6g+P8OyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764062247; c=relaxed/simple;
	bh=8o0BUQaavy4WFfxNTFmpKRUt46OWrDz4KKHRXYqyXUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JjbAgJPHYX2IVhcZlKpycrOWvu/fKv5RNF8+6mZVqA7rZ+m0h7bpOxMGoy02sCfRkTz/bgJg1BK8rypt9Kb6rrw86j5ndNIkHVDTsUnnuGSt6ijlpRCrq75CMhZYKN8rp0RYmpdYPnn2iCdSw78AIs6YSLXYarvj52fyfm1R3B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBaR2tkQ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBaR2tkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764062246; x=1795598246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8o0BUQaavy4WFfxNTFmpKRUt46OWrDz4KKHRXYqyXUA=;
  b=RBaR2tkQTWdAmieIzQG5kCSCM/tJ9CZc5KH+5bm57qKh7/taG9R4kCRN
   ebPY7fYWwrX9Pp+xifNAx0FIlNEJYj8Dsy5DRNzXFwn/z642oZiIrVHy1
   +aS200+XP8PCqate/hryJ5xeMYsyeZA/atGH8yVPBcpmOj6h62VXrOUV+
   8pg+fOhVh2fBaPAyLfQqGR2adReu5mWhdwbg98rAXL2QW4CIz/d+W4qxn
   CyG5gdK3ToWphnCou6K4P292gRR76ehvjv07oJQoc/alYDdtQQtVZCwkW
   V3XMIRU9mlyxJdRNtuZqCSZy+MFt4S+9f9SGfSdWKwOn1OAOYLaZEKkzx
   Q==;
X-CSE-ConnectionGUID: j51svTp+TOiRofIhq50SWw==
X-CSE-MsgGUID: q1sKIYu9RpW0PcVJ/XdCJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66020287"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="66020287"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:17:22 -0800
X-CSE-ConnectionGUID: yR3xQGKsSvaAN8fGbH9+/g==
X-CSE-MsgGUID: OTeePa9uQVidSebqsWrFzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="196885271"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2025 01:17:21 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNpAk-000000001ZF-2fPu;
	Tue, 25 Nov 2025 09:17:18 +0000
Date: Tue, 25 Nov 2025 17:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare.scoped 66/73]
 drivers/gpu/drm/drm_syncobj.c:680:25-26: Unneeded semicolon
Message-ID: <202511251753.ZJdql3y4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare.scoped
head:   b3615a7114fbbe57748957de62fab0f18a31c3f9
commit: 9c0724630895d438355c9491dc66780d98fac465 [66/73] drm: convert drm_syncobj_get_fd() to FD_PREPARE()
config: arc-randconfig-r062-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251753.ZJdql3y4-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251753.ZJdql3y4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_syncobj.c:680:25-26: Unneeded semicolon

vim +680 drivers/gpu/drm/drm_syncobj.c

   663	
   664	/**
   665	 * drm_syncobj_get_fd - get a file descriptor from a syncobj
   666	 * @syncobj: Sync object to export
   667	 * @p_fd: out parameter with the new file descriptor
   668	 *
   669	 * Exports a sync object created with drm_syncobj_create() as a file descriptor.
   670	 *
   671	 * Returns 0 on success or a negative error value on failure.
   672	 */
   673	int drm_syncobj_get_fd(struct drm_syncobj *syncobj, int *p_fd)
   674	{
   675		FD_PREPARE(fdf, O_CLOEXEC,
   676			   anon_inode_getfile("syncobj_file", &drm_syncobj_file_fops, syncobj, 0));
   677		if (fdf.err)
   678			return fdf.err;
   679		drm_syncobj_get(syncobj);
 > 680		*p_fd = fd_publish(fdf);;
   681		return 0;
   682	}
   683	EXPORT_SYMBOL(drm_syncobj_get_fd);
   684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
