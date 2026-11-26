Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726087;
	b=AX3pzkXqbLM8WjFML5BM6jsKbj8DT8BFNzSAFpKE90dTmnKvMrjiXnwZZWQ4vl7nopI1
	 DdR2clEsP1LGKYwjFbx9Lh1QE3hY5nTG6Saev3vcd5vodUxnQb+FPnMHfOCLbkGhqeEds
	 oEe29CKoB0BNkfLLZ9UNvP3n6O05Gxl6GllxTgevZ/rxXtoFsnwetFfTKtAQRuBy4SNs0
	 vpnVxjh2SlLU3xQyOXTIpkujyUoV3EcVH682wEfPj0yr3mGdGn4XJ3yPBoNuQPKq0UGmN
	 V0KU83XDY23jBSnkSJYTs69J1pyFlU5yIT+1cQCrCI7GF6UAdNNDz2btlFKPqO6Cb/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HUkMv/hmTunxlayH/tKDYP5sqEjKRRWOq14t5h9+bS8=;
	b=bDsBWb/GZMXro7iadqJfwXGdcsx3mwH1XgOFqzpmP2tg3TXLcqJgHx67y3OGuRU61Ktm
	 Jj9jKklLk5g9iMUWYJ2hfOBUnasS39/o9gTBvqV/TPfXLLhEDiN/jAjx5WnnOHDnpPz8E
	 jKYvzfzYpiyWTaFndeSRGmWdgHaluBu5eJM0zmZ4dM230vq7H0UcLG6sivsAeXs1+RVjA
	 39DefsqBNCCyRHBqI9eMzdieF1Yx73Fe2qgjGetb59eGrK6/GEdupaIVauWjpKYJIvBvg
	 K4SUENK/pAzG0VDB0TViw2WPjIWG79ReA7r63soi2pU40w6dbzy59qqlNPtiv58xorA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nffMgODX;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2288B606A33B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 20:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2288B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nffMgODX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795726083; x=1827262083;
  h=date:from:to:cc:subject:message-id;
  bh=BQXRp3nvjwbiXdOK/rwmABz+5T83Ux1Rqm41pUiiEMo=;
  b=nffMgODXUuXEkI4f62GzX9l8kpCss4qIazA8M2ShjqV9BRBsFkHO6Xj9
   bbC60tF5onmJyQ6hf8EwIJk/6eeZRvNL+tfx/a0F6R+Kbq4EDx+s74dDr
   2LJJxRnQbQFTrlc2G7EoYga/Zy9MUice5aHGa7lquOSvqoqfgkg4TF9z2
   ++intngf4ytJmnKqMnIYRun6lRcwbwbvbTxiFtZTEGygKZPqdgj31GhcH
   oxJi5EXxE2+5e4VWI0XtXu0x3PyuMOEUa+kgni4SeUHJ1raXEnbKs6kSy
   ItzdgUWP0Mm6IcH3X/ZHwrR/Blgito8cOI5bhlLIV/HFsgwAXOx0D/IxQ
   Q==;
X-CSE-ConnectionGUID: nsncA982QIeK9V0UDy/R4A==
X-CSE-MsgGUID: b6NDASZ9Sb6eVFEh/dsXtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4729312"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4729312"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 12:48:02 -0800
X-CSE-ConnectionGUID: QDIpf3XSRAiPZ9QnJyQAEA==
X-CSE-MsgGUID: 0dqMTvPeQUax4LyQPRgyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12492455"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2026 12:48:01 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWgNr-000000000By-25Uf;
	Thu, 26 Nov 2026 20:47:59 +0000
Date: Thu, 26 Nov 2026 21:47:27 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 527/527]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:366: warning:
 Function parameter or member 'update_type' not described in
 'update_planes_and_stream_adapter'
Message-ID: <20261126214006.r4vkVFgX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Rodrigo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   402f2695349b32e867ee7056eb8925b3d243c0e4
commit: e538342002cbe468224f71b7ae116586e55c1134 [527/527] drm/amd/display: Add wrapper to call planes and stream update
config: x86_64-randconfig-2003-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126214006.r4vkVFgX-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126214006.r4vkVFgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126214006.r4vkVFgX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:366: warning: Function parameter or member 'dc' not described in 'update_planes_and_stream_adapter'
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:366: warning: Function parameter or member 'update_type' not described in 'update_planes_and_stream_adapter'
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:366: warning: Function parameter or member 'planes_count' not described in 'update_planes_and_stream_adapter'
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:366: warning: Function parameter or member 'stream' not described in 'update_planes_and_stream_adapter'
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:366: warning: Function parameter or member 'stream_update' not described in 'update_planes_and_stream_adapter'
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:366: warning: Function parameter or member 'array_of_surface_update' not described in 'update_planes_and_stream_adapter'


vim +366 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

   350	
   351	/**
   352	 * update_planes_and_stream_adapter() - Send planes to be updated in DC
   353	 *
   354	 * DC has a generic way to update planes and stream via
   355	 * dc_update_planes_and_stream function; however, DM might need some
   356	 * adjustments and preparation before calling it. This function is a wrapper
   357	 * for the dc_update_planes_and_stream that does any required configuration
   358	 * before passing control to DC.
   359	 */
   360	static inline bool update_planes_and_stream_adapter(struct dc *dc,
   361							    int update_type,
   362							    int planes_count,
   363							    struct dc_stream_state *stream,
   364							    struct dc_stream_update *stream_update,
   365							    struct dc_surface_update *array_of_surface_update)
 > 366	{
   367		/*
   368		 * Previous frame finished and HW is ready for optimization.
   369		 */
   370		if (update_type == UPDATE_TYPE_FAST)
   371			dc_post_update_surfaces_to_stream(dc);
   372	
   373		return dc_update_planes_and_stream(dc,
   374						   array_of_surface_update,
   375						   planes_count,
   376						   stream,
   377						   stream_update);
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
