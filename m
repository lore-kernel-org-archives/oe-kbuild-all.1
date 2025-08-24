Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F4BE571
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 04:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756008104; cv=none; b=hLPeKkODU7vSk9PWJON0wSM6D3ZMJFXzIr+Fie00IU7tVoRrHXuDXvbgejEKSo4GUusRZ19xrG4uh952Pq1YaabGm5jcO8/aMGJZ5wn1/rW29yLrNow2V4uaHSB+x/7gUm6OlqZ6bUPZ57Te6IVRFaWboGd0cVpzlkfSgLHJPbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756008104; c=relaxed/simple;
	bh=DSbsqCo62f2I7cUW/NtdCvveyEi8icWUS2ub9JnZtGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bl0GnJSrYg/MFgaN0R3/hd1Un+NkIb5bx7pHoN/ZbvcKgBXRAH08yfUzkO74G+e6Ub2lJl8uI1Ux9sRbbejrqdatk7XOcT3bf4mPzwXBLn8+LE+eyP485RKFW8hsY/K9P5qpAPp8upgFl9UCrIvf8qIEx+RitOW0Ib/MIt2QRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmMFdi/+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmMFdi/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756008102; x=1787544102;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DSbsqCo62f2I7cUW/NtdCvveyEi8icWUS2ub9JnZtGc=;
  b=QmMFdi/+GRaDpVb/bjPhnLlYQvO9mEoo5ZPIr6r1v8NZFL79DYpQo68i
   R3nYub4yA3ncYaRNcLoYkT7uvII6XD1iaNbEn0gGBTs6i9C5BVQqLFEco
   z2+Qldsf8Z4rrZdKzapw2DD+MVMEiFTPqOLQrpHHZ+SCRrTCu2SQgDKmU
   Oh0iI7hOD54DXkoS47BFcwqAXyZ0S33gz47kr8fpF11b8GTjCv5OSLjbB
   Z4excWk9h/6Cof0aT/ckf1tNvzr8dubOQ9hTRCyX63+eJ9//uE6Hx4gko
   QUrqG/xFEFJ8enRJXfDUXQM3I04dr8huweTzrQDQgGORbkVcfPMT4l8T5
   w==;
X-CSE-ConnectionGUID: AmpDkWAeSD6i5kuqDJvJyg==
X-CSE-MsgGUID: OTAryhBETNKhRi34FesEGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58121315"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58121315"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 21:01:40 -0700
X-CSE-ConnectionGUID: D5G9j+PIT+mcR8bJXuzjyA==
X-CSE-MsgGUID: IJW2c3yTRDyfxGZmqkI1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="192681177"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Aug 2025 21:01:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq1v0-000MkN-1X;
	Sun, 24 Aug 2025 04:01:24 +0000
Date: Sun, 24 Aug 2025 12:01:19 +0800
From: kernel test robot <lkp@intel.com>
To: Faith Ekstrand <faith@gfxstrand.net>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH 6/7] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
Message-ID: <202508241157.XlCVeP0d-lkp@intel.com>
References: <20250822142954.902402-7-faith.ekstrand@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822142954.902402-7-faith.ekstrand@collabora.com>

Hi Faith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Faith-Ekstrand/drm-shmem-Add-a-drm_gem_shmem_sync_mmap-helper/20250822-223306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250822142954.902402-7-faith.ekstrand%40collabora.com
patch subject: [PATCH 6/7] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
config: um-randconfig-r133-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241157.XlCVeP0d-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241157.XlCVeP0d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241157.XlCVeP0d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panfrost/panfrost_drv.c:664:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/panfrost/panfrost_drv.c:665:9: sparse:   also defined here

vim +664 drivers/gpu/drm/panfrost/panfrost_drv.c

f3ba91228e8e917 Rob Herring     2018-09-10  650  
f3ba91228e8e917 Rob Herring     2018-09-10  651  static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
f3ba91228e8e917 Rob Herring     2018-09-10  652  #define PANFROST_IOCTL(n, func, flags) \
f3ba91228e8e917 Rob Herring     2018-09-10  653  	DRM_IOCTL_DEF_DRV(PANFROST_##n, panfrost_ioctl_##func, flags)
f3ba91228e8e917 Rob Herring     2018-09-10  654  
c1572b756066235 Emil Velikov    2019-11-01  655  	PANFROST_IOCTL(SUBMIT,		submit,		DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  656  	PANFROST_IOCTL(WAIT_BO,		wait_bo,	DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  657  	PANFROST_IOCTL(CREATE_BO,	create_bo,	DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  658  	PANFROST_IOCTL(MMAP_BO,		mmap_bo,	DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  659  	PANFROST_IOCTL(GET_PARAM,	get_param,	DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  660  	PANFROST_IOCTL(GET_BO_OFFSET,	get_bo_offset,	DRM_RENDER_ALLOW),
7786fd1087774c6 Boris Brezillon 2019-06-18  661  	PANFROST_IOCTL(PERFCNT_ENABLE,	perfcnt_enable,	DRM_RENDER_ALLOW),
7786fd1087774c6 Boris Brezillon 2019-06-18  662  	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
013b6510131568c Rob Herring     2019-08-05  663  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
2f684bbbcb27048 Adrián Larumbe  2025-05-20 @664  	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
0f6b6cfee96633e Faith Ekstrand  2025-08-22  665  	PANFROST_IOCTL(SYNC_BO,		sync_bo,	DRM_RENDER_ALLOW),
f3ba91228e8e917 Rob Herring     2018-09-10  666  };
f3ba91228e8e917 Rob Herring     2018-09-10  667  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
