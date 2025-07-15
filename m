Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32081C84AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 03:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752549543; cv=none; b=hHM1A+nIZaB0ha2j/f6qRvXLunPrH0Net1z0ogzjvPknvQKQzND2HNo905quOz4/CUSlsT0ixNRowngNW5hjYOaeXLnppuqi0PC3ebo4/l+keRSPIJI2W5n81aIYR6EMJnHRA7aIZDRhq+fHoxWz0B9GGsFgHf2MYiT7QJNC2Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752549543; c=relaxed/simple;
	bh=naB+miAqX+hMvmE/fJR/EZeqBHJG4sztQZOoxW3+l7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BywHCNDD/j8x6A+lwxgWO0B5aghekvXJBGYaTO1vBJdcIMKZnnDuGuF8gJLepnfBA73uYmH1OvRnFC2M43NQT6JNdAcHt8hEzFaVf38bIRwM5fl8gvq/ereNDUlziAX6fhxvBD3pt1cxjNKp2XDk8j7lk/v3n7jQnj2X9d69eag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vyclr5wc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vyclr5wc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752549541; x=1784085541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=naB+miAqX+hMvmE/fJR/EZeqBHJG4sztQZOoxW3+l7E=;
  b=Vyclr5wcIYx2OEngUADjWTjB6jzK7//YuQdcrIHnr/NSZGmlBJ30IzFw
   PEYaCvLKJGqTgHURQoxmIk2kmeRk8uat3C65A0xjnFGNiDhEL/wEIQ0eB
   bps4eZoPHlaVaStwZwox7NY1wFSvkJmnYeXtN3mksVjwhj+AG4kXIBiyF
   k+TLhWLdX2xJxjjT+XCo6yuw9noPuqvEBdONmx47vVL3o45zxbIPjTvqU
   PcFpRNnATy8x74UG+q06UKLZMn5TVTeBnny87EReVjN3y8Ws9XpMXEmVz
   lg8MnDVcaEwtAUcExjcBWhG5mMQXaRKUDuCfKVX36TEpmmre7bPqJKW/x
   Q==;
X-CSE-ConnectionGUID: HkfZwv+4Q4C1z2XFP2pb+Q==
X-CSE-MsgGUID: OGjJA4S0QXSD5iy4t3rxEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72333634"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="72333634"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 20:19:00 -0700
X-CSE-ConnectionGUID: 1+UjZz4uQnqe/C33hUAgBA==
X-CSE-MsgGUID: aJBGP5/tSkW5aBiE4uB/Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="161126104"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jul 2025 20:18:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubWC0-0009ay-3A;
	Tue, 15 Jul 2025 03:18:56 +0000
Date: Tue, 15 Jul 2025 11:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Prike Liang <Prike.Liang@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:505:6-22: duplicated
 argument to && or ||
Message-ID: <202507151101.012avOrF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   347e9f5043c89695b01e66b3ed111755afcf1911
commit: 42a66677805d03df9e2600fab82d0cbe855500e1 drm/amdgpu/userq: use consistent function naming
date:   3 months ago
config: arm-randconfig-r064-20250714 (https://download.01.org/0day-ci/archive/20250715/202507151101.012avOrF-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507151101.012avOrF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:505:6-22: duplicated argument to && or ||

vim +505 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c

5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  480  
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  481  int amdgpu_userq_ioctl(struct drm_device *dev, void *data,
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  482  		       struct drm_file *filp)
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  483  {
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  484  	union drm_amdgpu_userq *args = data;
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  485  	int r;
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  486  
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  487  	switch (args->in.op) {
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  488  	case AMDGPU_USERQ_OP_CREATE:
4ec2141d23d3bb drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  489  		if (args->in.flags & ~(AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK |
4ec2141d23d3bb drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  490  				       AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE))
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  491  			return -EINVAL;
42a66677805d03 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Alex Deucher    2025-04-16  492  		r = amdgpu_userq_create(filp, args);
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  493  		if (r)
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  494  			DRM_ERROR("Failed to create usermode queue\n");
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  495  		break;
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  496  
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  497  	case AMDGPU_USERQ_OP_FREE:
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  498  		if (args->in.ip_type ||
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  499  		    args->in.doorbell_handle ||
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  500  		    args->in.doorbell_offset ||
fced8e7d2ddeba drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  501  		    args->in.flags ||
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  502  		    args->in.queue_va ||
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  503  		    args->in.queue_size ||
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  504  		    args->in.rptr_va ||
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26 @505  		    args->in.wptr_va ||
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  506  		    args->in.wptr_va ||
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  507  		    args->in.mqd ||
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  508  		    args->in.mqd_size)
158bfbc72c5d76 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-26  509  			return -EINVAL;
42a66677805d03 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     Alex Deucher    2025-04-16  510  		r = amdgpu_userq_destroy(filp, args->in.queue_id);
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  511  		if (r)
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  512  			DRM_ERROR("Failed to destroy usermode queue\n");
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  513  		break;
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  514  
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  515  	default:
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  516  		DRM_DEBUG_DRIVER("Invalid user queue op specified: %d\n", args->in.op);
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  517  		return -EINVAL;
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  518  	}
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  519  
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  520  	return r;
5501117d24a38d drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2023-10-10  521  }
f540f69256a3a0 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2024-08-27  522  #else
f540f69256a3a0 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2024-08-27  523  int amdgpu_userq_ioctl(struct drm_device *dev, void *data,
f540f69256a3a0 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2024-08-27  524  		       struct drm_file *filp)
f540f69256a3a0 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2024-08-27  525  {
df85baa767ca39 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Alex Deucher    2025-02-28  526  	return -ENOTSUPP;
f540f69256a3a0 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2024-08-27  527  }
f540f69256a3a0 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2024-08-27  528  #endif
bf33cb6551a8c5 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c Shashank Sharma 2024-08-26  529  

:::::: The code at line 505 was first introduced by commit
:::::: 158bfbc72c5d7675039df540b120ccdd37bca5f0 drm/amdgpu: validate user queue parameters

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
