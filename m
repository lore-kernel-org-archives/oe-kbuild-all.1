Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528851D5CC6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 06:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764397435; cv=none; b=IJnZQGqYggfzbF/pc7jbu79E/Wyj21Y+0/PZbdK7LBnKSQoiHtwILJkxRzYFpTkTj9mYrDG+UPt4m4aiRMWvUDlH8NGtc24xX08iVkTHv+WWFviS5QZpNiMJGv3ihRzdtmw3a7rJrC+atMSh16xbJ3pB34ROhurQgC+wtbfY+no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764397435; c=relaxed/simple;
	bh=a3aAEjKyiTZOdPOeALf3CfY5/RlNrPvXMcPRK15S8j4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cw9/IZ/EI0U7VpRV5Cr0gc1uSyqtbY9FVSFdFOEozPy1CZnqsfne6a2yAk6SLISoOjFVwQK5b9nLIdi2ogTfz7/fO6qGETycjGnKrqJ+oHOVqw05FGH9nbhnkBS3Hvq4hH9HGx6MepMcNr0TXADTnui2fYpaUbuwQGOC049DYbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMiNf9Is; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMiNf9Is"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764397434; x=1795933434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3aAEjKyiTZOdPOeALf3CfY5/RlNrPvXMcPRK15S8j4=;
  b=LMiNf9IsjQ3hxe8sZGGqZMffMPKiFYuIbylXF7P2GaoHPJxdGFjrzr6j
   9JSS7AbeAWuZr23DZI15Ya1BwSOMbZEnRtiSCaVZUZd4N6BkqE3NzQe6C
   s0ChiYspbX1+hvYwIy9msvDF8StT3/9Uc3elhyrRF6qm5B+dHGJzvYK2Y
   OiBZ+3NLKQ5B2rguWIMH3ztWDgo9aWdN03FN6jNTUxlnNkv8+1+31c782
   zcsCXjN4skoK2DdLFpuKX2qWv4qx4wOuw6L+GIR7ipE281Mt7fd+uiq2/
   Uagyj3dtk/AwlVoz30FCrudYzu7WyVWDAJLgVaO7ZBUdwx4yyu/3ncsc3
   w==;
X-CSE-ConnectionGUID: MQWxLfvARCyyQxaq5bWTtw==
X-CSE-MsgGUID: kD48RXopSGGRipr3REn4fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="89057788"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="89057788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 22:23:53 -0800
X-CSE-ConnectionGUID: K6f2tkOgTYuDIzF5GVOZLQ==
X-CSE-MsgGUID: Yvz93jvnRQ6N2yWB9ValNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="224305806"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Nov 2025 22:23:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPEN3-0000000070j-16OX;
	Sat, 29 Nov 2025 06:23:49 +0000
Date: Sat, 29 Nov 2025 14:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 2429/2442] Warning:
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c:644 function parameter 'inst_mask'
 not described in 'sdma_v7_1_inst_gfx_resume'
Message-ID: <202511291415.N5G32nsO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Likun,

First bad commit (maybe != root cause):

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   d34985f3a79435ba6089096a491fe1d66149c57a
commit: f9b1da2b2d5f9b5ec40c35fbfd7e8875659ee72c [2429/2442] drm/amdgpu: Add sdma v7_1_0 support
config: arm-randconfig-003-20251129 (https://download.01.org/0day-ci/archive/20251129/202511291415.N5G32nsO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291415.N5G32nsO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291415.N5G32nsO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c:644 function parameter 'inst_mask' not described in 'sdma_v7_1_inst_gfx_resume'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
