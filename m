Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56154DF49
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Sep 2025 03:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758772142; cv=none; b=ZypFH2XGHPo23DVan2EYT6tuaVXrCfYEgVIPbpIWTglvMPv0KjoN0fC8XazdO7ViHIVxdvkJf8dFSfpcsG3xhZdP7jO27xKH7KpncqmyOCa3vpgQifhDS5PMXEREyGZIyjLjE5L4e5GiJZ5/CtZk4TeA3bCkdbghylQE2VJ/bxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758772142; c=relaxed/simple;
	bh=1+JdL3b8onh0ZppyyCvXHpe4kl8bUBZieOsFEPMhp9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vxr9ca4YHS6TR3tnyVOdE9p5W7n4pQm6f85UUfxLRPW4AKlxsqGu/k038OsGjaH0qVGBK45YuG8fyIrVcTG3mPRuMPgnPUqFnOUHMHp37dfHjntmrNpCyld5K7d86E72e1fhOKXRFm8nF0XFIJKnDZ/8EtMhswZWRyIkYtzjJDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtSnG/oW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtSnG/oW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758772141; x=1790308141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1+JdL3b8onh0ZppyyCvXHpe4kl8bUBZieOsFEPMhp9s=;
  b=XtSnG/oW84AJS3ETgsFWc8n4dSD02TuMACmJlnaRAi5+7FvV1SBKQlIc
   bAI3AdP/CMLHZcrTdTgKyE0DAXX4vk6KeXTJiLI2NtSLcJorQQDInFdGp
   Yxkp7Kt/TzVqGeLKIw1Mpm+oM5/w6t+foq87j4Qr+UjgWeCHoyYMh6jSA
   OQ83w1HZ8SjpfRN9x4WnZKCfm7DYv5j+mUoKZ62BU6v4ndq9EXbuPedAD
   xJmX6nBueKb70XRgDM79N7o6W/9BMDQq42iS0ZbzPfUNCW6VJ/0dYIF/o
   4tT+AKTQfCJpm0ZR6LZ8pp/IJ+QZFgD7+D7BmiZxKx0UpkRbpEQ8bpm8k
   Q==;
X-CSE-ConnectionGUID: tirhZ9VlTSW+bkszvISjqw==
X-CSE-MsgGUID: F4+g26u4SXqFBOgivfEHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64888743"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64888743"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 20:49:00 -0700
X-CSE-ConnectionGUID: bLdPZX2XTjuTXito4H6o0g==
X-CSE-MsgGUID: Itc0iBzrSd6UKu6MqQX6zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="214347522"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2025 20:48:59 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1cyW-0004u9-0t;
	Thu, 25 Sep 2025 03:48:56 +0000
Date: Thu, 25 Sep 2025 11:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 3/9] include/linux/ftrace.h:561:
 multiple definition of `unregister_ftrace_direct_hash';
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:561: first
 defined here
Message-ID: <202509251110.E3O2GY0v-lkp@intel.com>
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
commit: 2343ed53ba7f3e2615ad0e325bbf0766ab00e9b6 [3/9] ftrace: Add unregister_ftrace_direct_hash function
config: arm-randconfig-003-20250925 (https://download.01.org/0day-ci/archive/20250925/202509251110.E3O2GY0v-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251110.E3O2GY0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251110.E3O2GY0v-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:559: first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:561: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:561: first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:559: first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:561: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:561: first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:559: first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:561: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:561: first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:559: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:559: first defined here
   arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.o: in function `unregister_ftrace_direct_hash':
>> include/linux/ftrace.h:561: multiple definition of `unregister_ftrace_direct_hash'; drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:include/linux/ftrace.h:561: first defined here


vim +561 include/linux/ftrace.h

763e34e74bb7d5 Steven Rostedt (VMware  2019-11-08  557) 
203fbea7336ac9 Jiri Olsa               2024-11-12  558  int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
203fbea7336ac9 Jiri Olsa               2024-11-12  559  {
203fbea7336ac9 Jiri Olsa               2024-11-12  560  	return -ENODEV;
203fbea7336ac9 Jiri Olsa               2024-11-12 @561  }
203fbea7336ac9 Jiri Olsa               2024-11-12  562  

:::::: The code at line 561 was first introduced by commit
:::::: 203fbea7336ac9a34f6150f753774e1a030b751e ftrace: Add register_ftrace_direct_hash function

:::::: TO: Jiri Olsa <jolsa@kernel.org>
:::::: CC: Jiri Olsa <jolsa@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
