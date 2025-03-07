Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7DC250C11
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 19:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741375212; cv=none; b=SlInaJrObg0ds/5weoEBo1sEOxjLfs35FfYfBo93s9nCLCLAPSneIbpKQrPxRpWRwVJbKKq4DxVFA5xEp7L64bxo9DCiuL8+MJkmhRzxBusjPCks6WjVBw8JlarvOUOE+4qS6b0IyTnSmJbeYCAUcLhlaaZWQQ5kmq7RlgcNLkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741375212; c=relaxed/simple;
	bh=gU0GqW3cmInhXG9O03bAraymE1FYSdtwOZ/pgGvgwXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rm8qduiPyH7FQFwctgNXvkHNXiP0cE+fmCBuBica+Z7uYXYpl40F6RTzyAwXaX1odBeqbmF+tGuOUzMQ/Wp5N1kJwvkWMvGzRVJacuqbsv36aQedeBjj3QdtiW0Bl4xrWqdsnW0ltt6cFifOCclHLJzUgzuaJsdqw7K976eH8v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zi3aIMyF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zi3aIMyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741375211; x=1772911211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gU0GqW3cmInhXG9O03bAraymE1FYSdtwOZ/pgGvgwXo=;
  b=Zi3aIMyFjufT92W0YSGaBZMBp42XE2++bxQmmvqoQyPOJ0kARLLxlQVa
   K+U0ZsvCU4RgNBIErJ6WIDgMZFN9LbXQcOfKxYFbBbNgaF+Bcoa/nm1Pn
   gdm2/k4ODsi/rzOTtUqwpHY92GXyL5JQbmLY1yWfr+HatjFjxWSVPPlbo
   Xkuk4pBmHiZL1ENYN0jVJs4ZwVnQ+JlUDB/YZ9xQ8i9pIHptkXGypj8Wd
   PmljOMq1+neqrZS8oRYC+4kXjPcBw9YL5DAAda+4FJdDdmPgFF2AJt2U6
   xGPmPdZjj3SK2sHj4KDQQSmRqVgf1X5mU6dFmBg4TXy2Bw+3/KGQjVP3j
   g==;
X-CSE-ConnectionGUID: Y2RdtKPbQMGR8VJj0HoWHg==
X-CSE-MsgGUID: 6TMC6I0+SsqbJziG2EuFSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="67805363"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="67805363"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 11:20:10 -0800
X-CSE-ConnectionGUID: waeVlautTJ2IYVof9V7P1Q==
X-CSE-MsgGUID: 1lBT4qWrRc+sReajmoiGyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120320544"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Mar 2025 11:20:09 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqdEs-0000xr-30;
	Fri, 07 Mar 2025 19:20:06 +0000
Date: Sat, 8 Mar 2025 03:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 222/411]
 drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:25: warning: Function parameter or
 struct member 'vgpu_mgr' not described in 'nvidia_vgpu_mgr_put'
Message-ID: <202503080329.dVSi46qm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 407a6f7688cc03a8e53bfab2f3298b73e1956d79 [222/411] vfio/vgpu_mgr: introdcue vGPU lifecycle management prelude
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250308/202503080329.dVSi46qm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080329.dVSi46qm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080329.dVSi46qm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:25: warning: Function parameter or struct member 'vgpu_mgr' not described in 'nvidia_vgpu_mgr_put'
>> drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:25: warning: Excess function parameter 'vgpu' description in 'nvidia_vgpu_mgr_put'


vim +25 drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c

    18	
    19	/**
    20	 * nvidia_vgpu_mgr_put - put the vGPU manager
    21	 * @vgpu: the vGPU manager to put.
    22	 *
    23	 */
    24	void nvidia_vgpu_mgr_put(struct nvidia_vgpu_mgr *vgpu_mgr)
  > 25	{
    26		if (!nvidia_vgpu_mgr_support_is_enabled(vgpu_mgr->handle))
    27			return;
    28	
    29		mutex_lock(&vgpu_mgr_attach_lock);
    30		kref_put(&vgpu_mgr->refcount, vgpu_mgr_release);
    31		mutex_unlock(&vgpu_mgr_attach_lock);
    32	}
    33	EXPORT_SYMBOL(nvidia_vgpu_mgr_put);
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
