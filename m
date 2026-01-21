Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF61FE46D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 21:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769032054; cv=none; b=V9TINd/S9iw1DhxKakn9XTIW561NWzmIXdtKY+yxhzDk7Kkxh4ZOKp2EkkG2GMIaDHEal4Sdtx0YWdcNWunGSR5FAVKj7wMGyg2bLdFnLZcufjV1025YWfdVAZAtATEloN8WCjwI8vVx9E5EJ4/py1hDxsINTf33jL8Z2UFzLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769032054; c=relaxed/simple;
	bh=prHRUbhqQKJCMUebhyuOtlaPths+nbbNppXIXVgxu6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nw4I/PegI4omIqzqAS88EF3R7ncybhCbDPpc2EuMb4l8nlQ5sCsh1ZilvWHO08f/1nTQWu4yGRqX6/kn3NlBzDa7F0aN9J4tuXTNR9f+CxZ+7GeoYWtInfYfgEaHfllcVx2H1yX023/1FyR9S+6UNuz0TL9YBSxrTIIG9ee3xqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ej5hkJfG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ej5hkJfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769032052; x=1800568052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=prHRUbhqQKJCMUebhyuOtlaPths+nbbNppXIXVgxu6k=;
  b=ej5hkJfG0m8cHW6ssy6nz6YPCa+MJNe13mWXdtYW1KjCLVygV2OgoZAI
   /4CgCsmdye1x7pSCJfrxf5OnPA+WGocVX+pPRsP/4uj31uelWwaPZ0sH1
   RpUdIXCPwLQLGPWJI0VBlTWbFhiPNJFVpNZ/I2e+gHVqjL2bfN50pHKrO
   Tn/1JLX0Hm0kBBl7ib85H5LtGTDKLdoXildTVQ5QoLXQIsDypSpL54K2w
   b6hsOR0SxAWpnd5mPPU7vjVYi88Zw7h6KZ24/yil0/1k+yS5RIdsXX7FC
   jrE2X4aQv1qiuxC4MzeSyJhWIQbPaTT6DnPXboJDbYWIcZRazYXeXAFVJ
   A==;
X-CSE-ConnectionGUID: x9PhwQJfR9KsBh+B0cTagw==
X-CSE-MsgGUID: fq2FB8ypSsaFJIEcX5MYHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70321984"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70321984"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 13:47:31 -0800
X-CSE-ConnectionGUID: xataWh1BT3m7K3Tl07VWKg==
X-CSE-MsgGUID: apAUjfZVRWCz8GPYQXu3Cw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jan 2026 13:47:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vig2x-000000000Np-3RkV;
	Wed, 21 Jan 2026 21:47:27 +0000
Date: Wed, 21 Jan 2026 22:47:23 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 1/28] kismet:
 WARNING: unmet direct dependencies detected for PROVE_LOCKING when selected
 by DEBUG_TIMERS
Message-ID: <202601212253.dykLtr5x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   90614b63ef6a2f10b6e486e486ca8d5bfd2b7a81
commit: 3d3535e426c8e15bef8f2b193de5a970bbc84a20 [1/28] debugging
config: alpha-kismet-CONFIG_PROVE_LOCKING-CONFIG_DEBUG_TIMERS-0-0 (https://download.01.org/0day-ci/archive/20260121/202601212253.dykLtr5x-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260121/202601212253.dykLtr5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212253.dykLtr5x-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PROVE_LOCKING when selected by DEBUG_TIMERS
   WARNING: unmet direct dependencies detected for PROVE_LOCKING
     Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=n]
     Selected by [y]:
     - DEBUG_TIMERS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
