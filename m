Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E294430
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 04:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748578776; cv=none; b=bzNXEkykw7evXwDKZ2cEQtvmCIC8tojpVxtYKCVuvgaCTRIWqHQi2d0rJJv0qUID3WXFyq1CM28mFVD3rgz/fITLcGbK5X23yDVSaDUMdBQqkiIL7RkpGMjhr3WceLXwW8I+7gNY9mA4XPOXGdndvHRqN4XWimHRMVUkMbb/Xuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748578776; c=relaxed/simple;
	bh=2/7fYxZcXFP2ae9oNo1HoBagYmHLCI3hMZivYOsHSjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKZFLBeAAGLIEvlopXGTUlRS1xGZF2b8WbbmGss/XIgcPJtzAGFiL8jPS7QVj8wySTsLteq7sdIPbFbttn4CmyyvXGJ90KaaHV50jLXq8XFPl/ohUan9maJlSSJY9PnrUBJhXxklp3nSIQAhI2R2xbLbWQ3wqvLlYpQdFFUnI88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPBFCmha; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPBFCmha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748578775; x=1780114775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2/7fYxZcXFP2ae9oNo1HoBagYmHLCI3hMZivYOsHSjk=;
  b=QPBFCmhayqYPSdeYyl82fD1Jzj8KBi5iqrupXVu3k93+hUBp/USKYyMc
   BViDHFWaH0OWLmq+n9MMzQjI6EMWnsvmDNXi2yZKDJXXG7EByOvZJEnAa
   H8xMyiE3E4ZhIocnLXPT20LpR3IoZvFfqx2i3U461htYERuIbhvHdjS46
   JOYUq0dObOZ71Pk23zHxOzsdG9Q3VHYwcEvtuzEN6DLdrH8moZjbkRHWI
   R8l381sP92P5A43sQehoErXYLch/6TA1rGrhqm9NYacoqCw0vQ5td8dUC
   hxwykWcB6kQWDnIqB7OnPqsOuXQ6+ioCPczCf9/lauJpio6cz21Bg9Osn
   w==;
X-CSE-ConnectionGUID: o7GFZFqvS2qP4/fT5KQpWg==
X-CSE-MsgGUID: jOA4bRhoSmmhuQS0SAMwww==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68216462"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="68216462"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 21:19:33 -0700
X-CSE-ConnectionGUID: BGrvduIoTjmH9nNrr5RRYA==
X-CSE-MsgGUID: Z7VZ1WAJSU2JkHQpo62b3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="148627168"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 May 2025 21:19:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKrDO-000XKS-2W;
	Fri, 30 May 2025 04:19:30 +0000
Date: Fri, 30 May 2025 12:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [agd5f:kq_resets 7/28]
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:774: warning: Function parameter
 or struct member 'seq' not described in
 'amdgpu_fence_driver_seq_force_completion'
Message-ID: <202505301224.rjQpk2Kw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git kq_resets
head:   1946811570b0fe0d4600387174866fdbda525560
commit: 3f738456d243db5518cbda28d915bdcb64d235ee [7/28] drm/amdgpu: track ring state associated with a job
config: xtensa-randconfig-001-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301224.rjQpk2Kw-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301224.rjQpk2Kw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301224.rjQpk2Kw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:774: warning: Function parameter or struct member 'seq' not described in 'amdgpu_fence_driver_seq_force_completion'


vim +774 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c

   766	
   767	/**
   768	 * amdgpu_fence_driver_seq_force_completion - force signal of specified sequence
   769	 *
   770	 * @ring: fence of the ring to signal
   771	 *
   772	 */
   773	void amdgpu_fence_driver_seq_force_completion(struct amdgpu_ring *ring, u32 seq)
 > 774	{
   775		amdgpu_fence_write(ring, seq);
   776		amdgpu_fence_process(ring);
   777	}
   778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
