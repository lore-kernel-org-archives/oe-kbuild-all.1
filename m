Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CF9395ADD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185922; cv=none; b=X0KTESVKjpnfEW7Sa90BLKs+SnvB38HJODJrbBZ4fpjFhqFcqF/UXY+pp59am1bNIkBU/hFKBfyOybS/rbC7Tr1VoWfKhjXt+UPzeHDmn3tdIspv/nhdI/6eMQMvv2y62Y+GHfBoaBaVmIZtqy+NOL9hq/fPGP3d0i5NxR60aDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185922; c=relaxed/simple;
	bh=tbOX70aTlcEGvFlncg3RB9droIsEFc6Zs2rwc8X9hh8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mYggo1ngvTFYj8fsXJrlNzj0TxrRQvX1sA+Ej6KTbP7IrbnFSNETXkaMD1gbkF3bX9lOfb+AX1Al+aXwuUxr2DqUDjr1lWi2hVwI68mXQxGv6QWUsoWOmi90ZXWezAv22hQCG/GIRz3N0hhvaiwhuOb9qMCmKhXgVuLV6iGh2D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBoQE81O; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBoQE81O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784185914; x=1815721914;
  h=date:from:to:cc:subject:message-id;
  bh=tbOX70aTlcEGvFlncg3RB9droIsEFc6Zs2rwc8X9hh8=;
  b=nBoQE81OQtsml/iu5RoMAqoaLgmO8g3uR7q1LZ0jf6dKKrDRLnE6OFwh
   QauBMAi7pGngb/hyC4j7M3kWJ/NhyFUI0aZh1Iyuc8cOhBY+zGBiI1EZQ
   biVse0LVqTTxEuQFMUrEdoj18O12U0NT4EHprbiS5jF/LnW0WPXjktILk
   59rAl2mIdcUHplvXFxqJJsJqYdz3Ju9WXVemQZJ7x20HAWZA08TG/imSw
   flIHKZZInsKaPYxBh3wewAYA57OmWvkoy6H91ULv7YI+o9CSAvpe2XYKS
   1RBc3KLWM9p87UMRBwlRGv8fWkQZIaUVAlb42vuXevzaL73Hn+WpVszJE
   w==;
X-CSE-ConnectionGUID: UjoEiycDQ62nZPuJ3w1HFQ==
X-CSE-MsgGUID: hq3mYDezS0mRT1AClZMLEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96350975"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="96350975"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 00:11:48 -0700
X-CSE-ConnectionGUID: G/KpiSJfR1WPu/uM2YVjdg==
X-CSE-MsgGUID: 4qNkoLZtRemmaC9/kb65/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="280860698"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jul 2026 00:11:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkGFz-00000000OOU-1EjU;
	Thu, 16 Jul 2026 07:11:43 +0000
Date: Thu, 16 Jul 2026 15:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Prike Liang <Prike.Liang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Michael Chen <michael.chen@amd.com>
Subject: [linux-next:master 5820/6789] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1046 function parameter 'queue' not
 described in 'amdgpu_mes_alloc_proc_ctx_index'
Message-ID: <202607161557.k0m45A1e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
commit: aa459cc2497b947fc02f7143d6bac9689b18a443 [5820/6789] drm/amdgpu: add mes process context alloc/free
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260716/202607161557.k0m45A1e-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161557.k0m45A1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161557.k0m45A1e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not described in 'amdgpu_mes_rs64mem_fini'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1046 function parameter 'queue' not described in 'amdgpu_mes_alloc_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'mes' not described in 'amdgpu_mes_free_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'queue' not described in 'amdgpu_mes_free_proc_ctx_index'
   Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:958 function parameter 'mes' not described in 'amdgpu_mes_rs64mem_fini'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1046 function parameter 'queue' not described in 'amdgpu_mes_alloc_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'mes' not described in 'amdgpu_mes_free_proc_ctx_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1071 function parameter 'queue' not described in 'amdgpu_mes_free_proc_ctx_index'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
