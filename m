Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BBF3019A9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 04:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777610729; cv=none; b=bX/r3KCmle0CgEFWSIttNVMHt2ov3ojkfaccr3PQS4ZbcpA33p9gjbPjqEaSqV73AGtp3EEmxDCh1tPbLVpAUMVhlIEhtmhhw1NzKjIOZAGLfdIjsn5R99/mXUsrVdl/h72j8nPMaitj94yWrLDs8cH+IJsEtz6fCuhQ125u4zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777610729; c=relaxed/simple;
	bh=AtkJgVMINchZ6PkiujUwYepjE306tPVOJA6Rnyqobyw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q1YR8Neg3FDnwbKwrLSj4XJoSc0zVx4YkBkECrIEYrvXbhTT53iT1h1u6TQ2wyhFed2N2NQnEUu1VnGv0F3NPAVJD1/53jHXkel2Xc9NEdpqrjAB/9XaXmUTchaIowPNVtWe7BKQI76E83dx+Pup+Cu0gVokbZxl1l05RmysF88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0X20LCs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0X20LCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777610727; x=1809146727;
  h=date:from:to:cc:subject:message-id;
  bh=AtkJgVMINchZ6PkiujUwYepjE306tPVOJA6Rnyqobyw=;
  b=a0X20LCstVvhZMfWwUz7VfIq2GxejMxjlCNWUVKhKll6ydDyNfDAwvEP
   S54sddKO3ygrRjt+Yu36+Z9g45lK4RioD2eOm2Ji6m4Zr89fAm9lIjgV2
   dWEAf2FE7Biga87HMFqIRK1MxTGqQJ9/NsLzRXMuKUONV2lrRH43GyNyR
   OCoCdqiYjqSA2lZ18watVdvY1REiS25EZCMy8Lw7zr2Sb86CihrjosfXW
   EUpvZVHCpTwlTvO/85iH1Ojfj7VZOddgvMTZNZvCB71cZ6djMHBliGeqk
   diV72pxU3GseKOTrQ+FmnnH11vN1IMokmTmaGyxFOGDSeZCf5Q8EZ+BpL
   Q==;
X-CSE-ConnectionGUID: P46w8UH3TjGJNkVE8tNtNw==
X-CSE-MsgGUID: xOTy2PRXQA+GoR1zMDHrlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78771467"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="78771467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 21:45:26 -0700
X-CSE-ConnectionGUID: 2NCHyeU/QvuWpNOdEwOwnA==
X-CSE-MsgGUID: Q0OtHtTATsq7w7A/tfKqLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="233914416"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Apr 2026 21:45:25 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIfkg-000000000BS-2ep9;
	Fri, 01 May 2026 04:45:22 +0000
Date: Fri, 01 May 2026 12:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v7.0.0-net-next-driver-removal-v1 13/18]
 /kbuild/src/scripts/Makefile.clean:12:
 /kbuild/src/drivers/net/ethernet/fujitsu/Makefile: No such file or directory
Message-ID: <202605011218.bFTfETIC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://github.com/lunn/linux.git v7.0.0-net-next-driver-removal-v1
head:   75e17109856eb8e407a19759d3ad750fe3854b63
commit: 9b67496f74c3d885af0541d8c378fd73f8ca2f5d [13/18] drivers: net: fujitsu: fmvj18x: Remove this driver
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260501/202605011218.bFTfETIC-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011218.bFTfETIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011218.bFTfETIC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/drivers/net/ethernet/fujitsu/Makefile: No such file or directory
>> make[7]: *** No rule to make target '/kbuild/src/drivers/net/ethernet/fujitsu/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/drivers/net/ethernet/fujitsu/Makefile'.
   make[6]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/ethernet/fujitsu] Error 2
   make[6]: Target '__clean' not remade because of errors.
   make[5]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net/ethernet] Error 2
   make[5]: Target '__clean' not remade because of errors.
   make[4]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers/net] Error 2
   make[4]: Target '__clean' not remade because of errors.
   make[3]: *** [/kbuild/src/scripts/Makefile.clean:61: drivers] Error 2
   make[3]: Target '__clean' not remade because of errors.
   make[2]: *** [/kbuild/src/Makefile:2144: _clean_.] Error 2
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
