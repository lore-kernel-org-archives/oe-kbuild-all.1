Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E90299920
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774014277; cv=none; b=a13zmTjfpN3x8hyGUNtjF3SjUjBRPmvLRdNDUDsPijDI+lbmF4WCfeD+/AOYLTOUDafdq4r8evWshTbimwTOf9OB5otk8NuP2SjGf7/yaro0gXkGaLI9Abf1irSiPgEN+xtIHgV1c6A6Rg0Em70IRa1QTlAyPE0h1OT2ScQJ+bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774014277; c=relaxed/simple;
	bh=NrytiXcsODG/V+3DSR0vuR0sMjzy2/TXIlBxgqB6kDU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=baMGONSAP1MhvMNMTJCEYmkC+ZIggjDtME31zoCWELd8pn+//EE93gz0DezXv+IB/K6rsU57aomhUtED3tG1wocuC/urP1UpJazGf/XY/WHKqwZ8gmLF5+oAr4s0WJk/+zU3b7lVafF+2u1qEwI5GKqDDqFUFWWYdQRzdXkqjZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4lmIILY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4lmIILY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774014274; x=1805550274;
  h=date:from:to:cc:subject:message-id;
  bh=NrytiXcsODG/V+3DSR0vuR0sMjzy2/TXIlBxgqB6kDU=;
  b=X4lmIILYPlHwbnu8dwGI+rjUIoSy+oxz5fT6tvQczwigPB29m1mC/XJw
   Rgwm6jjaYg+Dn38TJpFnUPj9HZO59Jy+P61k2XsSnX+IN2FZUutCVEadV
   I3NWvait8DZraqBfV+Fz4mo1zsenFfxZ/tMF/NlYeKgibDoesCCGquIDM
   v9b91l6wGWc0OFfFJxqLlse5jzfMMkE4pF291lGwD/kw24RqTW706oAzZ
   5drvK/yaBvoJLDosYyPMQQraZSfS42EcZSTLYoIVPlaEYR1EYjSr8dvLO
   2S/4G/xcGr6q2HBo+elO7GIoNQ0AbssM58osSSFRiv0TcDkC19Qln5Rfx
   w==;
X-CSE-ConnectionGUID: CA2FGUX9SuaDQ9i0y4O9Mw==
X-CSE-MsgGUID: NObKFfV3STKIK+quUdT/eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86574264"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="86574264"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 06:44:33 -0700
X-CSE-ConnectionGUID: W+IIkfHXSUirvmGOIBXRlg==
X-CSE-MsgGUID: z+CabQ6QTyKfcDwLlmqLug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="220203105"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Mar 2026 06:44:32 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3a9O-0000000052f-0P8B;
	Fri, 20 Mar 2026 13:44:30 +0000
Date: Fri, 20 Mar 2026 14:43:31 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 357/357] liveupdate.c:190:18:
 error: implicit declaration of function 'memfd_create'
Message-ID: <202603201442.kmyFgXt0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   61d924e3c943dec5a1544973025226b69d3e9ae4
commit: 16deeeb8139c8017bc9a2eef904c688946fbabad [357/357] selftests/liveupdate: add userspace API selftests
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260320/202603201442.kmyFgXt0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201442.kmyFgXt0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201442.kmyFgXt0-lkp@intel.com/

All errors (new ones prefixed by >>):

   liveupdate.c: In function 'liveupdate_device_preserve_memfd':
>> liveupdate.c:190:18: error: implicit declaration of function 'memfd_create' [-Wimplicit-function-declaration]
     190 |         mem_fd = memfd_create("test-memfd", 0);
         |                  ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
