Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BAA446846
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433499; cv=none; b=ZWIZ0kGg/mHAs2Lp4rhg3K6uYhSIzjEDxw69hQ9swige+funDO+QgX4q1IIUAkIvw27RvVoUUerP+DFR7uowIUPpV7gpR15X5n7Cz1Y85RFxZMtaRDqs6PpEkNlyqj/G946x4VHEsdHJ38QH+CIWGx9n+Fi8wUqzN5+fXGJ3dSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433499; c=relaxed/simple;
	bh=sT6YI5zqTctMVs22OX8486db+wyGPjobvLLvriLi7VU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IvVutTLa0+ZgDAjfZwpHvo8xskDipMrNQ78NbbVMryblbPD/pFmQGdFzzaqy5DvCH82snums60iHOKC71N2utT+ji9TuSQbvh1v+giSTxkMcdqxEDBg1/yVkApSsqoJO3BZKpeWoW+uQ1BsVe40+eoOqPff5trxUOO2mOSD96jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOiAuzFE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOiAuzFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785433498; x=1816969498;
  h=date:from:to:cc:subject:message-id;
  bh=sT6YI5zqTctMVs22OX8486db+wyGPjobvLLvriLi7VU=;
  b=mOiAuzFEqKaxY34DPV16kbSBLWsszAVpfUb5BB1zyQN/bmO6c5zehqbU
   KNQ5Y2JxjiihP/1oH3M/fmDX6h6+pabyPJyKuYrKk01QAJKnr3IWyzkQg
   X6BFQa039kk5z2ZLHrYWBqRWmavD808IaK2xvuguGv3rSKTThDewecFLR
   7VY+KcyOoIMxckBQrx9pknypMviCQOLfUKnjJrXRp4bmxelvNWYrvSWrz
   mrhksXenatCkZ7RVydTGLdLaaVCwsBc1Ur8nLJ4rAvsJ1VSKNNyFTYeiI
   hcrJfHLNwjeBCx6Xlz0OTtFehhZIzuVffywPb0v8UOYAPd+VCiqrr+U+s
   g==;
X-CSE-ConnectionGUID: FVyWUiEBR/a7PCMawsjsjA==
X-CSE-MsgGUID: tzgLINEjT0WDLzNvu9oPTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="89949230"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="89949230"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 10:44:58 -0700
X-CSE-ConnectionGUID: ERYEFH81T8mIvtf/JpgYkQ==
X-CSE-MsgGUID: KbDPwyCQTOmHmZ3g0qhlHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="260970033"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Jul 2026 10:44:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpUoQ-00000000hOX-133K;
	Thu, 30 Jul 2026 17:44:54 +0000
Date: Fri, 31 Jul 2026 01:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 36/44] arch/x86/kernel/nmi.c:88:15: sparse:
 sparse: symbol 'toolong_nmi_panic' was not declared. Should it be static?
Message-ID: <202607310118.XAgMp4qi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev
head:   9df1c10e4ddffa50d054112facefa25376c7a219
commit: 2203ef58a5e3cd2a8b4879488d25a52afebaf64f [36/44] x86/nmi: Enable panic() when NMI handler runs too long
config: i386-randconfig-r131-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310118.XAgMp4qi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310118.XAgMp4qi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310118.XAgMp4qi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/nmi.c:88:15: sparse: sparse: symbol 'toolong_nmi_panic' was not declared. Should it be static?

vim +/toolong_nmi_panic +88 arch/x86/kernel/nmi.c

    86	
    87	int unknown_nmi_panic;
  > 88	unsigned long toolong_nmi_panic = 0;
    89	int panic_on_unrecovered_nmi;
    90	int panic_on_io_nmi;
    91	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
