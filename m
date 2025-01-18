Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F562B9BF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 04:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737173481; cv=none; b=Q1i3Gw2W29/imxS/I2fIoyZSJLenZoLL39lc2eKdvSKpNoX5PXFLNVB3lLyXfOTXk3Y8ga5ozh+pCDrYfFB7GJmztSCSPRyP3oMhtIedbWSSja9U3GVDHwNFGHX72NlEq/EsAINM9yfLlBPBQFtKHx/fnr/NsKTCH7leSaq5jD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737173481; c=relaxed/simple;
	bh=wcd55nkg3XnfvOl9s92FkNXLJidb1M1ezxJV0yRPiT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FS0upj6ahUojoC+mLR2xF+I+v+oR4hqQCPpvSdtpiZEBDzM/xiXkU1EMNjCqd400w3/3cunb7WceOO3DEtD2bBNWS0pyS/zglbYxkZt8qhhFFxIi2bMfCUJae7Z7+xLuHmOZmhCVWIcNXyMUx43UucmxClJTC6FNleyoehuH3PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyWoelCG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyWoelCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737173480; x=1768709480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcd55nkg3XnfvOl9s92FkNXLJidb1M1ezxJV0yRPiT0=;
  b=MyWoelCGvFUIzcta1vAmh2Ncq+fAbozfb4Sg5ZbvHmHAjla986n7mShC
   p2V7bzQ89Ko8QXRM33Z0l7Z84P9nh9L2wcsy0//6a8dI6pURwl1im+NPA
   NZgs35o9Zc0mc9dogRRt3biosEJ09S8cUl5aS4U/6Sn2aRWRHK2jl/bwV
   1gvYMrOfs6ck1MGqUPGPYbMxxFkuD5rhmWyGI+WzzHhgMpbWB/n/i/KHT
   jan03IiHYPTMH0qxKU4tqxW8t45tQAJifqHnfcX4e8TrsBp7ri0FC+Lmw
   5GcGNhnsVBRMLP/nonhQ7xWtA4OorhpB+XAWm37o9WDvYbXd4Ld/Dohvl
   w==;
X-CSE-ConnectionGUID: aH6wolURS5+i+jIOR0O56Q==
X-CSE-MsgGUID: ELLMHI4GRHGM0a+2lE0KaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41294696"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="41294696"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 20:11:19 -0800
X-CSE-ConnectionGUID: t51AhVbSR4+a/Q0ZSG2/LQ==
X-CSE-MsgGUID: FrXBKhBSQA2/QDf1z0SesA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106447367"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 20:11:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ0B2-000U4w-14;
	Sat, 18 Jan 2025 04:11:16 +0000
Date: Sat, 18 Jan 2025 12:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 34/38] include/linux/unwind_deferred.h:46: multiple
 definition of `unwind_deferred_cancel';
 drivers/gpu/drm/xe/xe_trace.o:include/linux/unwind_deferred.h:46: first
 defined here
Message-ID: <202501181232.e0D1FOw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   948ab489fae86f8e78722ba0668e9f100b5eb313
commit: d9da8a8d507bc447b93d9783e6335e16abdad3f2 [34/38] perf: Support deferred user callchains
config: i386-buildonly-randconfig-004-20250118 (https://download.01.org/0day-ci/archive/20250118/202501181232.e0D1FOw1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181232.e0D1FOw1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181232.e0D1FOw1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/xe/xe_trace_bo.o: in function `unwind_deferred_cancel':
>> include/linux/unwind_deferred.h:46: multiple definition of `unwind_deferred_cancel'; drivers/gpu/drm/xe/xe_trace.o:include/linux/unwind_deferred.h:46: first defined here
   ld: drivers/gpu/drm/xe/xe_trace_guc.o: in function `unwind_deferred_cancel':
>> include/linux/unwind_deferred.h:46: multiple definition of `unwind_deferred_cancel'; drivers/gpu/drm/xe/xe_trace.o:include/linux/unwind_deferred.h:46: first defined here
--
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.o: in function `unwind_deferred_cancel':
>> include/linux/unwind_deferred.h:46: multiple definition of `unwind_deferred_cancel'; drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o:include/linux/unwind_deferred.h:46: first defined here
   ld: drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.o: in function `unwind_deferred_cancel':
>> include/linux/unwind_deferred.h:46: multiple definition of `unwind_deferred_cancel'; drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o:include/linux/unwind_deferred.h:46: first defined here
   ld: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.o: in function `unwind_deferred_cancel':
>> include/linux/unwind_deferred.h:46: multiple definition of `unwind_deferred_cancel'; drivers/gpu/drm/amd/amdgpu/amdgpu_trace_points.o:include/linux/unwind_deferred.h:46: first defined here


vim +46 include/linux/unwind_deferred.h

61cc2f05402a86e Josh Poimboeuf 2025-01-17  43  
61cc2f05402a86e Josh Poimboeuf 2025-01-17  44  static inline void unwind_deferred_init(struct unwind_work *work, unwind_callback_t func) {}
61cc2f05402a86e Josh Poimboeuf 2025-01-17  45  static inline int unwind_deferred_request(struct task_struct *task, struct unwind_work *work, u64 *cookie) { return -ENOSYS; }
61cc2f05402a86e Josh Poimboeuf 2025-01-17 @46  bool unwind_deferred_cancel(struct task_struct *task, struct unwind_work *work) { return false; }
61cc2f05402a86e Josh Poimboeuf 2025-01-17  47  

:::::: The code at line 46 was first introduced by commit
:::::: 61cc2f05402a86efc3bd2c5b4d422ee47191b9f5 unwind_user/deferred: Add deferred unwinding API

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
