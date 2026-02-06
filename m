Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6318D428487
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 18:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770404295; cv=none; b=G4F/fImWNQLGn+OZ7GZFez0U8BtefNnzUrEDqCupB0hG+4qdlkqmJ8FjyAkGwbK1pYMZ2tmBwBsibrd7vBBw52dklBMfwUD6cMAi4PZ/+NLARhPuXRkaz6Bzvvkg8G6SooFWyAcwGRKYSIhgAzqK18nWn07YmkIF4QfIC+DCUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770404295; c=relaxed/simple;
	bh=kdhHn1aU+LGwtdk0F6OxFjBYYCvDJR0wDI8x9Ze6Xws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+9V2jMrUfKEsIdKFpcn6kVUcnY0y8DthURDX8hPVfqu8Xb+Io7bvaCIjG1D8fNzUJNVPqZ6P4qv1CGLWcJa0IsVy1Slxa3rZNYg82spdz6XutVird4y5BifxOQmpFVUzK80+F8YnvqHLuvsSGjqnICMMFFTQMt2hPCHFOGNqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLHUOXi0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLHUOXi0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770404295; x=1801940295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kdhHn1aU+LGwtdk0F6OxFjBYYCvDJR0wDI8x9Ze6Xws=;
  b=gLHUOXi0YR+vD3SY9eXMvC1zOd+CMSU31H0l5+L/BeWoEYB1C/TQgzDp
   sJKzWunBqgLsZconXZyXS4PkuFML4GY4Mq6bGnaYXDvsvX0hUMCB6Jrst
   lDeihAsjSzG9gJMF9T698vZvMUhb+ppkNp+HFv0RJEIXAiqSGNHLY817r
   6mCHj98RO6g1BiuJLWF2SFCinScJJ7aOMfVUmLWUHhsO+TaE1S5DpGzMk
   0x0OapJMTRs95s8V9+Wmts/UMusG0aaLGill8wr5pAtg+bRUBRAz5xLSj
   UhuqSOZ6URkO7MGJvLvofad387t1zsnNZ6G17ZcdG1z/y4UbWagdSEheP
   Q==;
X-CSE-ConnectionGUID: E2UxpkezQoStRp7kERnsRw==
X-CSE-MsgGUID: jnYbgfRCTTqSccA2Ng40zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="59185942"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="59185942"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 10:58:15 -0800
X-CSE-ConnectionGUID: ix9tU7lSS4SEwZI4qGpqTg==
X-CSE-MsgGUID: dAHJ53QVQPmPJDh0ZGYBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215128465"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2026 10:58:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voR1t-00000000l2e-0gvE;
	Fri, 06 Feb 2026 18:58:09 +0000
Date: Sat, 7 Feb 2026 02:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Frank Binns <frank.binns@imgtec.com>,
	Brajesh Gupta <brajesh.gupta@imgtec.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Alexandru Dadu <alexandru.dadu@imgtec.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Matt Coster <matt.coster@imgtec.com>
Subject: Re: [PATCH 1/2] drm/imagination: Define packed BVNCs in the uapi
Message-ID: <202602070204.PjaKNSpZ-lkp@intel.com>
References: <20260206-bvnc-cleanup-v1-1-f3c818541fbe@imgtec.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-bvnc-cleanup-v1-1-f3c818541fbe@imgtec.com>

Hi Matt,

kernel test robot noticed the following build errors:

[auto build test ERROR on 55473b60178060a4fdb4631bd0c91879cc7d18d8]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Coster/drm-imagination-Define-packed-BVNCs-in-the-uapi/20260206-175844
base:   55473b60178060a4fdb4631bd0c91879cc7d18d8
patch link:    https://lore.kernel.org/r/20260206-bvnc-cleanup-v1-1-f3c818541fbe%40imgtec.com
patch subject: [PATCH 1/2] drm/imagination: Define packed BVNCs in the uapi
config: riscv-randconfig-r112-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070204.PjaKNSpZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070204.PjaKNSpZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070204.PjaKNSpZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/imagination/pvr_device.c: In function 'pvr_gpu_support_level':
>> drivers/gpu/drm/imagination/pvr_device.c:550:2: error: case label does not reduce to an integer constant
     550 |  case PVR_PACKED_BVNC(33, 15, 11, 3):
         |  ^~~~
   drivers/gpu/drm/imagination/pvr_device.c:551:2: error: case label does not reduce to an integer constant
     551 |  case PVR_PACKED_BVNC(36, 53, 104, 796):
         |  ^~~~
   drivers/gpu/drm/imagination/pvr_device.c:554:2: error: case label does not reduce to an integer constant
     554 |  case PVR_PACKED_BVNC(36, 52, 104, 182):
         |  ^~~~


vim +550 drivers/gpu/drm/imagination/pvr_device.c

1c21f240fbc1e4 Matt Coster 2026-01-13  545  
1c21f240fbc1e4 Matt Coster 2026-01-13  546  static enum pvr_gpu_support_level
1c21f240fbc1e4 Matt Coster 2026-01-13  547  pvr_gpu_support_level(const struct pvr_gpu_id *gpu_id)
1c21f240fbc1e4 Matt Coster 2026-01-13  548  {
1c21f240fbc1e4 Matt Coster 2026-01-13  549  	switch (pvr_gpu_id_to_packed_bvnc(gpu_id)) {
1c21f240fbc1e4 Matt Coster 2026-01-13 @550  	case PVR_PACKED_BVNC(33, 15, 11, 3):
1c21f240fbc1e4 Matt Coster 2026-01-13  551  	case PVR_PACKED_BVNC(36, 53, 104, 796):
1c21f240fbc1e4 Matt Coster 2026-01-13  552  		return PVR_GPU_SUPPORTED;
1c21f240fbc1e4 Matt Coster 2026-01-13  553  
1c21f240fbc1e4 Matt Coster 2026-01-13  554  	case PVR_PACKED_BVNC(36, 52, 104, 182):
1c21f240fbc1e4 Matt Coster 2026-01-13  555  		return PVR_GPU_EXPERIMENTAL;
1c21f240fbc1e4 Matt Coster 2026-01-13  556  
1c21f240fbc1e4 Matt Coster 2026-01-13  557  	default:
1c21f240fbc1e4 Matt Coster 2026-01-13  558  		return PVR_GPU_UNKNOWN;
1c21f240fbc1e4 Matt Coster 2026-01-13  559  	}
1c21f240fbc1e4 Matt Coster 2026-01-13  560  }
1c21f240fbc1e4 Matt Coster 2026-01-13  561  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
