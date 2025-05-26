Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78FC14E2F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516595; cv=none; b=nYwICBOAxUdelfFnuFZ6wiTb5LOf5VCNHbwWjhbxWVtVa7cDQzlFVYFBPB/SsNU9L1e1yCLwBh1SA9HT9aBuKmoO1sRXkM35vxwagLNSEPX7cuQ9VTrpJqm0C9TJbbRSFZpd+UyMMqNWjsrbI+IcGpW+XYCC5mx6XP6rZX4/+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516595; c=relaxed/simple;
	bh=dXa8dCTZjvz2YsBmfMUrVHx6XbKjDtw2JEPgUJ35Cvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JnfZmx2UxFxXfp357rGJsFQ72pigrxSDO4fA3tPazyTzS99lQ34nPvbD2KruU4Qm+e0gArU/mJMJVBFghna7oyz9artlZLufio6GbcioGDQRFU/A88JYVFfSD7tscZNx0nX/RNl9vamo3lwEDBQVX/u7fBP8wfDlerHjvb3QFdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyZJ3Dgi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyZJ3Dgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516592; x=1780052592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dXa8dCTZjvz2YsBmfMUrVHx6XbKjDtw2JEPgUJ35Cvk=;
  b=QyZJ3DgiHPICo3HQgpAyVmnx9f0Q1t2MEfd5kUqX6FNiueUSZGR0bPBS
   6cygYtc9tcgfsGmioGDcYLHzUfV8Zc0dXYknG/TY3mCvqvCGQoq5CPLI4
   IL01Y5I8jGREvNezmb0pbDZNi6HPIct4wg5t8f5dKWpv4AbLmqDdApSts
   SLn7sXMygbJXB5rSad4d1ibg9pi1lc3l5bDN/EoM19pEZ1rBdexyyWA6g
   HOc4nRco1gb8dUpiApHIpO0ub5rf+WCO3S9BBPHCvLziTQ+rWjNE9kBVa
   aT3srH3eB63UWW9roKq3LS54XxwvW8Zl2i1pkBDA6JZKS2RF8CU0Qq6QG
   g==;
X-CSE-ConnectionGUID: kGn7V4/MTeGm8KtmF+Kb4g==
X-CSE-MsgGUID: wtWIaHnATkagjpHljZpPsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="60830481"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="60830481"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:12 -0700
X-CSE-ConnectionGUID: bK9MwsDMSZeAE/Atf1BOhQ==
X-CSE-MsgGUID: DhmMUivORGe3cn2S0pQVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="143864439"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2025 04:03:09 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2R-0000FP-0m;
	Thu, 29 May 2025 11:03:07 +0000
Date: Tue, 27 May 2025 00:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1]
 drivers/gpu/drm/../../accel/drm_accel.c:66:29: error: invalid use of
 undefined type 'struct drm_master'
Message-ID: <202505270000.o3b4eTZL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 43a99aec6db468c17dbaf10f804fa54275bd3047 [0/1] accel: add dedicated minor for accelerator devices
config: x86_64-buildonly-randconfig-2001-20250514 (https://download.01.org/0day-ci/archive/20250527/202505270000.o3b4eTZL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270000.o3b4eTZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270000.o3b4eTZL-lkp@intel.com/

Note: the bytedance/5.15-velinux HEAD de277dab626c9ece4c9cf99ec9c56f23b298a042 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/../../accel/drm_accel.c: In function 'accel_name_info':
>> drivers/gpu/drm/../../accel/drm_accel.c:66:29: error: invalid use of undefined type 'struct drm_master'
      66 |         if (master && master->unique)
         |                             ^~
   drivers/gpu/drm/../../accel/drm_accel.c:67:51: error: invalid use of undefined type 'struct drm_master'
      67 |                 seq_printf(m, " master=%s", master->unique);
         |                                                   ^~


vim +66 drivers/gpu/drm/../../accel/drm_accel.c

    53	
    54	static int accel_name_info(struct seq_file *m, void *data)
    55	{
    56		struct drm_info_node *node = (struct drm_info_node *) m->private;
    57		struct drm_minor *minor = node->minor;
    58		struct drm_device *dev = minor->dev;
    59		struct drm_master *master;
    60	
    61		mutex_lock(&dev->master_mutex);
    62		master = dev->master;
    63		seq_printf(m, "%s", dev->driver->name);
    64		if (dev->dev)
    65			seq_printf(m, " dev=%s", dev_name(dev->dev));
  > 66		if (master && master->unique)
    67			seq_printf(m, " master=%s", master->unique);
    68		if (dev->unique)
    69			seq_printf(m, " unique=%s", dev->unique);
    70		seq_puts(m, "\n");
    71		mutex_unlock(&dev->master_mutex);
    72	
    73		return 0;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
