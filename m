Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA0512EBCE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 17:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713290142; cv=none; b=dQ+R4S99UrUCMTAlzm1LwGHadistHF6IsNhja1DSitw3LC2nXU/F1HN2x27Bkuskmd0AZs6yo6ngGvkv021Ve6RU2LlSZQfkVtUNeb8wHWdu5w+lhB0kGUVNJRci4RJCc3faSauc4jWwUiHH1ZV4qmlZBuJk3c2KPRxdgWsOPcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713290142; c=relaxed/simple;
	bh=HbKlK9DVNF2+vKf2og9k1dqmrwgf+WLuZniYI39sw/g=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O1F93p21N8C7TbXcGVyNu2StDS43TEATzI46+l574k2Ot0wGn4rkgm50BQShRrexIK4IZNnkagG005w+i8CqSIvpfmpYXXbfPUb+PvEJpdkCaTqNYo8IhBgfCAWWtLCBuCii0pWQv+lO+j8kBKh5hRQ8ak8/Pm5PEGyRmnOtAs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EY5XkLdZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EY5XkLdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713290141; x=1744826141;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HbKlK9DVNF2+vKf2og9k1dqmrwgf+WLuZniYI39sw/g=;
  b=EY5XkLdZ0dUkTtasPeEHuIor9/X3zQAnjHe582To0t7+jaVD/gIo2OH4
   2OtlGSV3Zs1siPSt5Ph5N1kwVWRyo8dqXHdtUIe9gHAc7bxGS2gx3XKCw
   l2m50ZHgXrRT4NNljDnvNm5w4vl2h14FVw9HdEEqiv+w+qeDQnlpIZ/aX
   k7cbr2RfG/3Wxtb1YR8MViu3pI8U0U+W9q/S219vTUrPaDyrwvuEq3CwY
   depud9m3TmHL3/of744ajpXQ2ZfVGPiqZz55vNucp9PPdDew9DFdjE9lz
   e8NCkwMO+V5n9JMxTIvpb3ujzaztZY6pWf0zDEkBHI39SgQJCSMiPLqRs
   w==;
X-CSE-ConnectionGUID: n8ChlGZlTn6U6hHQFBjB3A==
X-CSE-MsgGUID: OAEJSeQmRQG0NqiWPY7Otg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8579323"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8579323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 10:55:25 -0700
X-CSE-ConnectionGUID: dUOfyF/GR7Kww0+8hevS/g==
X-CSE-MsgGUID: DYw7xop/Qy6SuzLegTAf3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="26905561"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 16 Apr 2024 10:55:24 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwn1e-0005cq-0O
	for oe-kbuild-all@lists.linux.dev;
	Tue, 16 Apr 2024 17:55:22 +0000
Date: Wed, 17 Apr 2024 01:55:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/drm_atomic_uapi.c:366: Error: unrecognized opcode
 `csrs sstatus,a2', extension `zicsr' required
Message-ID: <202404170113.aqDwf3Zb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6.1/dovetail-xenomai-cve
head:   ae50ab5b35a1f535d25c6c9576c161702409774a
commit: b8c7d7bc8386924f57aac0a745ae3240f07b743b drm/atomic: -EACCESS for lease-denied crtc lookup
date:   5 years ago
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20240417/202404170113.aqDwf3Zb-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404170113.aqDwf3Zb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404170113.aqDwf3Zb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic_uapi.c: In function 'complete_signaling':
   drivers/gpu/drm/drm_atomic_uapi.c:1213:26: warning: variable 'crtc' set but not used [-Wunused-but-set-variable]
    1213 |         struct drm_crtc *crtc;
         |                          ^~~~
   drivers/gpu/drm/drm_atomic_uapi.c: Assembler messages:
>> drivers/gpu/drm/drm_atomic_uapi.c:366: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
>> drivers/gpu/drm/drm_atomic_uapi.c:366: Error: unrecognized opcode `csrc sstatus,a2', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1074: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1074: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1250: Error: unrecognized opcode `csrs sstatus,s6', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1250: Error: unrecognized opcode `csrc sstatus,s6', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:468: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:468: Error: unrecognized opcode `csrc sstatus,a3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1316: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1316: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1333: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1333: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1346: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
   drivers/gpu/drm/drm_atomic_uapi.c:1346: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required


vim +366 drivers/gpu/drm/drm_atomic_uapi.c

72fdb40c1a4b48 Daniel Vetter 2018-09-05  356  
72fdb40c1a4b48 Daniel Vetter 2018-09-05  357  static int set_out_fence_for_connector(struct drm_atomic_state *state,
72fdb40c1a4b48 Daniel Vetter 2018-09-05  358  					struct drm_connector *connector,
72fdb40c1a4b48 Daniel Vetter 2018-09-05  359  					s32 __user *fence_ptr)
72fdb40c1a4b48 Daniel Vetter 2018-09-05  360  {
72fdb40c1a4b48 Daniel Vetter 2018-09-05  361  	unsigned int index = drm_connector_index(connector);
72fdb40c1a4b48 Daniel Vetter 2018-09-05  362  
72fdb40c1a4b48 Daniel Vetter 2018-09-05  363  	if (!fence_ptr)
72fdb40c1a4b48 Daniel Vetter 2018-09-05  364  		return 0;
72fdb40c1a4b48 Daniel Vetter 2018-09-05  365  
72fdb40c1a4b48 Daniel Vetter 2018-09-05 @366  	if (put_user(-1, fence_ptr))
72fdb40c1a4b48 Daniel Vetter 2018-09-05  367  		return -EFAULT;
72fdb40c1a4b48 Daniel Vetter 2018-09-05  368  
72fdb40c1a4b48 Daniel Vetter 2018-09-05  369  	state->connectors[index].out_fence_ptr = fence_ptr;
72fdb40c1a4b48 Daniel Vetter 2018-09-05  370  
72fdb40c1a4b48 Daniel Vetter 2018-09-05  371  	return 0;
72fdb40c1a4b48 Daniel Vetter 2018-09-05  372  }
72fdb40c1a4b48 Daniel Vetter 2018-09-05  373  

:::::: The code at line 366 was first introduced by commit
:::::: 72fdb40c1a4b48f5fa6f6083ea7419b94639ed57 drm: extract drm_atomic_uapi.c

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
