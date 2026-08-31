Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526F7199FB0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 04:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150651; cv=none; b=EEXd1GCLGoAk69zeJicQ+U3mOdK5Ee8krDnIvMVjd8B8f4dir9YeoDHCb6irJbUn/maTltYeIcmE0fyxVo8q8fFE80fvoI4gc1YhIAyj1V2okXFe66yAWNEvpQ/yIRaRDTK7TqU47l65CByXOED6NhRR3CEAtGAdxZnhguSvqt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150651; c=relaxed/simple;
	bh=Yv0BkLDcA+5NQjGb/fg5H4LlJ9cdLdFKVp/uqBbbwjs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YXeCP9EGV7bDRiN+sp9mGcsPKMcgMtfvKMX0vvQvLT1BtAa1Kq6bZB04o+786h/3bd9naL9M1JJlqmU1QMMeGmN8nvKr3Mi/shhVNjwuYrVzpBt1bC4tDAZYvdP2Gpx69kY8gFpdzeKzfKZCY6mNrRMV5U8TCcFLbmAikeSJ5Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7RAbO5J; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7RAbO5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788150649; x=1819686649;
  h=date:from:to:cc:subject:message-id;
  bh=Yv0BkLDcA+5NQjGb/fg5H4LlJ9cdLdFKVp/uqBbbwjs=;
  b=N7RAbO5J73VYdJVmgHUxVlBuLoltvIhcbngOvz7VUm/NFzbXNHUjWheS
   thWBysp3UInz4RU1rwpfKqHQ64iPd3ux06VG2YCFrz7n84TCmBSkNNqZY
   4hBlSFyXhvUgy3AYer6/6cybuyKMxxQEGxoPNyvYdLN8wKMY4rYkDqxfO
   nAlRDVfaP3JUT62jQ/f9qcvdkQhPPAeP+yfH7nFCYaUVquL2e2oRpuC5x
   MFJfXrCn5jDhu926MPhfjKOzfIJGzKjULBIysZkBjNskEmjJeoXgSKpoO
   n5bida2DBwoP33/QenSSRVwQqWhLNr3HwmxHzMgujyBUFRSWS7A3G2x6/
   Q==;
X-CSE-ConnectionGUID: uk0nRgF8QC2xbaiQ1Q2aCQ==
X-CSE-MsgGUID: Zg3w6SolT7q6ssUaRVLivA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99708126"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99708126"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 21:30:49 -0700
X-CSE-ConnectionGUID: zyvO/jdrRi6ObADqOCOc8w==
X-CSE-MsgGUID: /b80zqsBRXOETRn00mtNZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="264940054"
Received: from lkp-server01.sh.intel.com (HELO 12c799cf0c09) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2026 21:30:47 -0700
Received: from kbuild by 12c799cf0c09 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0tad-000000000GV-0G4O;
	Mon, 31 Aug 2026 04:25:54 +0000
Date: Mon, 31 Aug 2026 12:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/vramstuff 18/29] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:932 function parameter 'exec' not
 described in 'amdgpu_bo_pin'
Message-ID: <202608311134.vrfA9i0r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/vramstuff
head:   13a8e2000329a36f994acf2fd31d307d27fa9189
commit: 07a1b5bc107c22a7457914175381ae7cf2a0b22f [18/29] drm/amdgpu: Use drm_exec to reliably pin fb buffers
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260831/202608311134.vrfA9i0r-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608311134.vrfA9i0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608311134.vrfA9i0r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:932 function parameter 'exec' not described in 'amdgpu_bo_pin'
>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:932 function parameter 'exec' not described in 'amdgpu_bo_pin'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
