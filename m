Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB023358B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029072; cv=none; b=r7QJgXcbdcXLsPbQxwX/RxPXXottLzb/CZbU6XQpDQvFcmFt0H/V0kUyJbMldjVnR26pLLzQLGhGaFcVBFwM62yT6Q7YySYUveQZG+SeFchTKU33iv+YiR8pDx9RHnk64qUyyADmYs9q+XrVrhXn7J6B6YtNKSZcX//hO5TSu/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029072; c=relaxed/simple;
	bh=Oq6+r2IB8M60QlDinOGylZL8ZRzl8654xp3a2LnYWxc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CtfncJtCxPxIBhN1a1QFCK5LcS3qrPXFF21KhBJmQ76bI9fUOJwJTDugRBC7kw544Zl260TnouD94+bGtDMumhKlpEkPN1DwL/cb8q4ilrzOcTUNlYHcFPY/nYRfFgWVmr/B0ZZkMLSTdP2kyHDwRN/IIFfDyODSeR5uYsFeVZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mt4I32zE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mt4I32zE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789029071; x=1820565071;
  h=date:from:to:cc:subject:message-id;
  bh=Oq6+r2IB8M60QlDinOGylZL8ZRzl8654xp3a2LnYWxc=;
  b=Mt4I32zEPPEFyEV722BsRekTmf5NnWTwimomVh3AUflbPnUZsp/1uN9i
   Drj3+ToD055zD0f3SBEo+Pck/ziwDQLZWUqInFFzvHt9XfUY+UegXKaGP
   uEwryYWaL+/Jbjll91GkNKzT7Uaq1mHVUc72iXMjQMKb5KSANW5SwEQxd
   ac9a+AeE7wGcNw4G9qC6Xl64hk3GLZZwYny2I48iUZaA5AmRPOXdBNrOC
   JAtaaDfmQ9ZkDFs26GiktNVKfSa/EgDSDpc5K1MPgATFoV0hZRcrZLrHQ
   OkTzPEKMMzaCX64Lj+guJHTTHZsrDSqQ8LjuyMf2btSWhkqPPMT1CM0kd
   g==;
X-CSE-ConnectionGUID: Ka8vnzSsRa+flHlyE1LVAw==
X-CSE-MsgGUID: OTm/GF7pSH6mxuTIJb/LuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100133694"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="100133694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 01:31:10 -0700
X-CSE-ConnectionGUID: OLVulUXSRjmXLkDMhQmSbw==
X-CSE-MsgGUID: v+SsfPVDSWaVYStVsRel8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301466408"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 01:31:09 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4aBW-000000001aK-2Sxb;
	Thu, 10 Sep 2026 08:31:06 +0000
Date: Thu, 10 Sep 2026 16:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 drivers/media/usb/cpia2/cpia2_core.o: warning: objtool:
 cpia2_do_command()+0x687: unreachable instruction
Message-ID: <202609101618.uy1X0vA3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   f598b4e36c5884e38780f70315660738694c035d
commit: 36b32816fbab267611f073223f1b0b816ec5920f [1/1] cpu: Re-enable CPU mitigations by default for !X86 architectures
config: x86_64-randconfig-r072-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101618.uy1X0vA3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c1872e7fd3307679a2da53f9d83de0ccf234b4ad)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101618.uy1X0vA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101618.uy1X0vA3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/usb/cpia2/cpia2_core.o: warning: objtool: cpia2_do_command()+0x687: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
