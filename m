Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4001A23AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 01:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758676449; cv=none; b=kV8XCRUu7K6o+2uB0GeX1mQMDsyukzzJE4vzCjSGhxIvhVNyRBqMT4MFJv7OejTlUwSR8R8BmCeChCPQearAXi5awjy3IXLDn6vWraxLzEj8Np+DkCETXUwEoiJDwY5F1yzl+SoS5qU0gM3i/Beh1rLtUHbao+kPWV19OmvWOOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758676449; c=relaxed/simple;
	bh=JYVvGJG7c0UqK7M7SY9hBMBf4tpKVcZAh8EsoE1C6e8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CddSnpZoaBwHOp59hMSReosBLYk6M9pTnVM92g5ECZ35HP1H6mT7dBQoOnrhmzva+RJDWVIaj3zrJMKhiuF3eADPvuTRWwI/kmdBoWAzxCnKZ6aeePlsNnWqkymTcr+0cDQhmVlKXSyiwSPhs8Pm1pgyhpk1xv912pawTg29/eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4gZbBOs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4gZbBOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758676447; x=1790212447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JYVvGJG7c0UqK7M7SY9hBMBf4tpKVcZAh8EsoE1C6e8=;
  b=f4gZbBOscMZxsNiO4uVvMqjPWGMco3YE9cbbSftCVOAEsCnXWdfg3pl6
   Q5qwrdohxZDpNDmwb8a/33NbI2CAmJBSEPPBlQJk5UgghyDC1mucwFBDC
   pLZiRsUw8LZvCkNpF6iKbngc12f7w0gW9fxUKkO4iin8e7WHUaxEec0xJ
   vITYHqhaI4Gk8q7danj6jSQuUwPvCbbfILJkpFS/drS4hQDZObg6k3d19
   rkBWpF/7lSpI0Vt7t42OcGfN4VfCXl/5QJEkRy3V8/IdbitxbVtngmzSG
   1egNKBngOOtMTaHaxHfzLpoq9uTM3ki8W+MmwkM9thfQM66woXQViVq9l
   g==;
X-CSE-ConnectionGUID: w5ZA8CtoQBWi2pjtlSdHVw==
X-CSE-MsgGUID: q0c917vLRAa+2oxNG6snAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72392107"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="72392107"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 18:14:07 -0700
X-CSE-ConnectionGUID: 7mCIdtPKSea6PmVvPl0+Pw==
X-CSE-MsgGUID: /Mtn402kR7mhlm0C5mNpGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="214035800"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Sep 2025 18:14:06 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1E55-0003gz-2R;
	Wed, 24 Sep 2025 01:14:03 +0000
Date: Wed, 24 Sep 2025 09:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:test 2/10] include/linux/ftrace.h:558: multiple
 definition of `register_ftrace_direct_hash';
 drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first
 defined here
Message-ID: <202509240922.oDHJyqMf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git test
head:   1b7fc74c36a93e90816f58c37a84522f0949095a
commit: 9e61f8f6a969f104f5beb67d18c95deeabfba73a [2/10] ftrace: Add register_ftrace_direct_hash function
config: x86_64-buildonly-randconfig-004-20250924 (https://download.01.org/0day-ci/archive/20250924/202509240922.oDHJyqMf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240922.oDHJyqMf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240922.oDHJyqMf-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/nouveau/nouveau_drm.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_hwmon.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_led.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_nvif.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vga.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo0039.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bo5039.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_gem.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_mem.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_prime.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sgdma.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_ttm.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_vmm.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_exec.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_sched.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_uvmm.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_backlight.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_bios.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_connector.o: in function `register_ftrace_direct_hash':
>> include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_display.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/nouveau_dp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/arb.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/crtc.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/cursor.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dac.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/dfp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/disp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/hw.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/nouveau_i2c_encoder.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/overlay.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv04.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv04/tvnv17.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/lut.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core507d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core827d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core907d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/core917d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/corec37d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/corec57d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/coreca7d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/crc.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/crc907d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/crcc37d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/crcc57d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/crcca7d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/dac507d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/dac907d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/pior507d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/sor507d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/sor907d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/sorc37d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/head.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/head507d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/head827d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/head907d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/head917d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/headc37d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/headc57d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/headca7d.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/wimm.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/wimmc37b.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/wndw.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/wndwc37e.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/wndwc57e.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/wndwc67e.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here
   ld: drivers/gpu/drm/nouveau/dispnv50/wndwca7e.o: in function `register_ftrace_direct_hash':
   include/linux/ftrace.h:558: multiple definition of `register_ftrace_direct_hash'; drivers/gpu/drm/nouveau/nouveau_debugfs.o:include/linux/ftrace.h:558: first defined here


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
