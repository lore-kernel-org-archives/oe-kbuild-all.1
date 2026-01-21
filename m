Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CD53E8C71
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036022; cv=none; b=uBHlXMAOUa9hN7pfZjF8+BrfpbpR0qmriRydVHp1+2nNBeqMSR0B7qyzr1SlpmH+z3MdcUnTG9Po60usaAlHEcaW4RVBv6Y0BYDO7VOknw/gx6FhZcvs5/bYIrfSDhJYM43UnZDjy2f9DtxbharykhLJCnTqchZHIQ35TtUmH5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036022; c=relaxed/simple;
	bh=4RAzTNnNgT5BXxYLVJxXZPKB0L52gncvEBcR+buYx18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ilXCafMXoLrqD9Eyp3pJMlBaD2d+MFAJtaA2VqwWdbgDzCKKB7KyNjtTAyj5d4MtJzPwkK43DAlUkp4Zf79hdHVstVlBEAWGWF2BOhpTqrR9dcs0nf+EvDed+DZtKz4BdbBgRklqSGvaUs2MK3kxf81XSJDdjJwmioZgR8SrTyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJhFw1vm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJhFw1vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769036017; x=1800572017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4RAzTNnNgT5BXxYLVJxXZPKB0L52gncvEBcR+buYx18=;
  b=aJhFw1vmAPUYNcyzpQKvkX7N6bt4kY91ZDKpJRpH48sbnx5FssRm3Gr9
   vxbISJsMx540uivm3Hgd25XwJbURQGyeilbc+AUYuXJSA/BRKV3RURayM
   6KqDn0w5PxxK9WAV400NXpit+ci4pGgUvngSIp4CyTbF8G5SqlP89NsJS
   N8IcphgCDH2+UD7HsGtrx5QsJu8CRWfNisnXhkHBjstd4JjngoxHlgRhg
   sIxITuZ8LQlIGCrtHQ4BOo5O+sVdxBylxwtrtAEJNIiFqSMwlxvPWfGFw
   N6ygygQRv0I6Suv+b3mXKhrMaAsuuuu1SVEyFO6YCTS+yfEk4wnomw9zO
   g==;
X-CSE-ConnectionGUID: CHlve9+pSaONuAKEID0/uw==
X-CSE-MsgGUID: AkEiMSXhT8i10XQE06zPPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70187352"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70187352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 14:53:32 -0800
X-CSE-ConnectionGUID: d5F3pEi1SpOQjUjiY6LiNA==
X-CSE-MsgGUID: Pde3EDDPQqiz75bPH4SQ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="207001815"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jan 2026 14:53:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vih4q-000000000OB-0TTf;
	Wed, 21 Jan 2026 22:53:28 +0000
Date: Wed, 21 Jan 2026 23:53:21 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 1/28] kismet:
 WARNING: unmet direct dependencies detected for DEBUG_MUTEXES when selected
 by DEBUG_TIMERS
Message-ID: <202601212353.pXDLyTi6-lkp@intel.com>
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
config: arm64-kismet-CONFIG_DEBUG_MUTEXES-CONFIG_DEBUG_TIMERS-0-0 (https://download.01.org/0day-ci/archive/20260121/202601212353.pXDLyTi6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260121/202601212353.pXDLyTi6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212353.pXDLyTi6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DEBUG_MUTEXES when selected by DEBUG_TIMERS
   WARNING: unmet direct dependencies detected for DEBUG_MUTEXES
     Depends on [n]: DEBUG_KERNEL [=y] && !PREEMPT_RT [=y]
     Selected by [y]:
     - DEBUG_TIMERS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
