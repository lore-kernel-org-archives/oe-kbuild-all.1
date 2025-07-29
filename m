Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E418A2253A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753827318; cv=none; b=OwIj1B6LJzKDcSgbV9ea+vLly83NTdIvapfjcXaOZxciP70CpLasZIXNKs0UQC7OTCWnLeCmgdb+iweSyoXfEvVif8l0JiGI6fOMrvVR7aHgItcfcF7BLqVX/2Ne++NZZuKScIClgjICNFrkciVUBfZ8DFQVGVRE2iGTledeKyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753827318; c=relaxed/simple;
	bh=qE1irq/pkCQwmhZPfMF3CXokwHdwGrZidyftnMHCe8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cWlks8tJH7JmL+n4VplSPuwXprAPdjfvLRrO41b4Ukj83uIWyvyR4B6Zb8U6zXtmI0ZLwiidFUdllF0sSVf8yt7xM/UQ3+YKAD6ZLmenihkFjXKOXfu121fjqNpvx380Lw0C+N5h6ISQwO+YLFmNOz9lQizzzlHkUlyv7PWQZNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMqyfP0Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMqyfP0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753827316; x=1785363316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qE1irq/pkCQwmhZPfMF3CXokwHdwGrZidyftnMHCe8I=;
  b=EMqyfP0ZEik33fLjh5uUUgSWbQ2QGpMciZc1FH4qwPzwq9rKwTZn1QrF
   Ly/TvvVtuEFGhDa78af1MqctYKaQrOrYo09kF/1Ykhck8a2/ZGMP29U1x
   LPGuriYeSrWJBMUpfxdiEUi503clXzRk/GO2iWFABOWmL9CKOUKjpWgy+
   Z2r4qbB8m2pJHgs+fd+rQwIEetnH373qwTGIO+laEBAYFvfWAsVd9tPhB
   7wF+diYn8oyTE3kduHJ7THHLNTlJQgHTy+3PQZK5A0ccXD82SXPwImhHJ
   CURgyAKnJjKmsRlzvEnwiA8/knJIrZr3cW+fFB3o35hyO+t+CADuSy33w
   w==;
X-CSE-ConnectionGUID: JYjv9pBhRLKSLVOfcLQ2ig==
X-CSE-MsgGUID: roedn7juSCaQ0kCTYF/wGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55325440"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55325440"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 15:15:15 -0700
X-CSE-ConnectionGUID: FPF3SlkNRIy0/qGZEhLtig==
X-CSE-MsgGUID: +CUeqjg2ROGcCmtrwDNOXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167028736"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jul 2025 15:15:14 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugsbH-0001jP-2M;
	Tue, 29 Jul 2025 22:15:11 +0000
Date: Wed, 30 Jul 2025 06:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [drm-exynos:exynos-drm-misc-next 1286/1301]
 drivers/accel/rocket/rocket_job.c:394:1: warning: control reaches end of
 non-void function
Message-ID: <202507300648.T4M5aAzS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-misc-next
head:   01ac6e4e53b6351df42c97d217b0d2dbeef5c917
commit: 0810d5ad88a18f1e6d549853a388ad0316f74e36 [1286/1301] accel/rocket: Add job submission IOCTL
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250730/202507300648.T4M5aAzS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300648.T4M5aAzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300648.T4M5aAzS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/accel/rocket/rocket_job.c: In function 'rocket_job_timedout':
   drivers/accel/rocket/rocket_job.c:393:16: error: 'DRM_GPU_SCHED_STAT_NOMINAL' undeclared (first use in this function); did you mean 'DRM_GPU_SCHED_STAT_NO_HANG'?
     393 |         return DRM_GPU_SCHED_STAT_NOMINAL;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                DRM_GPU_SCHED_STAT_NO_HANG
   drivers/accel/rocket/rocket_job.c:393:16: note: each undeclared identifier is reported only once for each function it appears in
   drivers/accel/rocket/rocket_job.c: In function 'rocket_ioctl_submit_job':
   drivers/accel/rocket/rocket_job.c:553:15: error: too few arguments to function 'drm_sched_job_init'
     553 |         ret = drm_sched_job_init(&rjob->base,
         |               ^~~~~~~~~~~~~~~~~~
   In file included from drivers/accel/rocket/rocket_core.h:7,
                    from drivers/accel/rocket/rocket_job.c:15:
   include/drm/gpu_scheduler.h:655:5: note: declared here
     655 | int drm_sched_job_init(struct drm_sched_job *job,
         |     ^~~~~~~~~~~~~~~~~~
   drivers/accel/rocket/rocket_job.c: In function 'rocket_job_timedout':
>> drivers/accel/rocket/rocket_job.c:394:1: warning: control reaches end of non-void function [-Wreturn-type]
     394 | }
         | ^


vim +394 drivers/accel/rocket/rocket_job.c

   381	
   382	static enum drm_gpu_sched_stat rocket_job_timedout(struct drm_sched_job *sched_job)
   383	{
   384		struct rocket_job *job = to_rocket_job(sched_job);
   385		struct rocket_device *rdev = job->rdev;
   386		struct rocket_core *core = sched_to_core(rdev, sched_job->sched);
   387	
   388		dev_err(core->dev, "NPU job timed out");
   389	
   390		atomic_set(&core->reset.pending, 1);
   391		rocket_reset(core, sched_job);
   392	
   393		return DRM_GPU_SCHED_STAT_NOMINAL;
 > 394	}
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
