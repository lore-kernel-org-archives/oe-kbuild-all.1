Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DD93C01
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 01:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758763067; cv=none; b=mKtxUQe0BNJXd7OZU5hvYmc4AQUzDNNhLu6V5w4ciiAI57mPo02dsd7NOfNOY9wxIm8ekmDThs4Mi2CDx0BB+0cogeVawDIXxVk711HLJnpK4GjiVSVXh8iOf4xvI9s34yVgJ61VI5LjR08CxO9NaxTXmB8T9SUAC5BGftfW0GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758763067; c=relaxed/simple;
	bh=0c3EjT4m2wnLDVu7SeJR6GcYerczHRzAcrZ7PKIfHH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUWoEJteThnuXTMeKGph+ctFGCaA2aDf0CyiPlWhLQDEKcn6PU8uOynUl555OF0kOcuVmy7PUvUbbYYnEQrs806xmVh/CRjTQo4joCBtWwcTC9OZ1qlgJF9QJJxMyZ8feIcdIeDZUsQqJxf5t9l+TcG9c9YebAwuAxoVIyAnJD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WORA2fwK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WORA2fwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758763065; x=1790299065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0c3EjT4m2wnLDVu7SeJR6GcYerczHRzAcrZ7PKIfHH8=;
  b=WORA2fwKOdNgMW38dN9uWd9qfIwCwZ89I7i+bXUvVbFDSl7oTbDGCQic
   RoY5YeECsfm7msNxVQ2EdLMnsHPt8z9F/mhUl1QAQVjWTz6yD1N1vTsOT
   T9YeUGy4HJ/E9aTE53ANh7S39of9ktAxGa9RHHYUP/sAXTMAEnP0fmyjY
   yYNvOzzU97FYFyd2z/znCOAl1eLRQqn2OPXAtQx6FP0iRFPp+32FKmGkr
   42P6M+/vk2FKO0gR9xdsIQL4dCVe8soP2eO1sKK29xXEUI1+ndQbFgWBX
   s0mo3+kOZBZOvof+FCKumMnwb7xVGrNc3THUL/m18iKYpW0dHD5zQRutc
   Q==;
X-CSE-ConnectionGUID: WZ32KlsLS7SkIl6oisH8tQ==
X-CSE-MsgGUID: BBMuMJDmRUGGOBLUSXzyTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="71752685"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="71752685"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:17:45 -0700
X-CSE-ConnectionGUID: jPNX5w7JTDiY4O+FSMSwEw==
X-CSE-MsgGUID: E2jDRVdES5mi3TLZsS809Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177620553"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Sep 2025 18:17:40 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1ac6-0004mp-1b;
	Thu, 25 Sep 2025 01:17:38 +0000
Date: Thu, 25 Sep 2025 09:17:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 2/9] include/linux/ftrace.h:558:
 multiple definition of `register_ftrace_direct_hash';
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:558: first
 defined here
Message-ID: <202509250905.19LKGOa2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   512bde773529ffbb0241c282793b7f4641034fe7
commit: 203fbea7336ac9a34f6150f753774e1a030b751e [2/9] ftrace: Add register_ftrace_direct_hash function
config: arm-randconfig-003-20250925 (https://download.01.org/0day-ci/archive/20250925/202509250905.19LKGOa2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250905.19LKGOa2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250905.19LKGOa2-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:558: first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:558: first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:558: first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:558: first defined here


vim +558 include/linux/ftrace.h

   556	
   557	int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
 > 558	{
   559		return -ENODEV;
   560	}
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
