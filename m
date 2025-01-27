Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580531F60A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 19:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738006364; cv=none; b=BCLCJv8bF7Cgrfy93Pr6K45h0AbEIQzU91TGIXnpe/Y5l39r8xqlLtKMyW57Gg5muPX4bBjEDIelElIwFWiVWaTDANXmKSEYuMQ5zF1u7W2F7ByQbWy0r4BtLq8BKS6KL6DUNLXRtOwEjIqNM8kNnjjK6AMKP3pXDlwgBIL2azg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738006364; c=relaxed/simple;
	bh=RXnu/iVq33lx8GejEpm2UML/O/g1eFXt9n+i8dBMIwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=APl0nWWi+ky2vaIvTMiQmtXZeDh4XP5+/Bbailiv2u/d2DFjJFLWyIPg6zEP/T26OR/Tt/7p8pb9mD9+7afKfZ3IMF+g2TlNDo54ExzPAdaqw0lbSK6udOzCR2ePRV39TAxLFvFlnsKX0g3f9MGCw3z4fAlT8pnIPyWQMfta8zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHuHSdq5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHuHSdq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738006362; x=1769542362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXnu/iVq33lx8GejEpm2UML/O/g1eFXt9n+i8dBMIwE=;
  b=jHuHSdq5/jDb5cKbFREUvl2DFCY7DaWSO7zv/aPbWKlw/HNIcuZyCYmU
   AcSildS+95+9cyqSqNhsysiD2xbW1BxKtlfza4GE6TekmM1vBQNiNcf5X
   KiWEnClbNgxVVfwQcSVnWw820E7ahJfrbyIGsqeWJ4PIV35l8XalLDOi8
   JOWjtYYTiVnjwtydfQyboJed/q/E+DvvSrAXCMwVToDuuEhg/Zyy7R5WK
   cHKtbRoq+OkcIvuQiAZJjhBN0ly263LHcp9KGnggzcxxeSo1r+87WV3hr
   ekVNj/Dl9Kh9Rk/JWCJudsJUfVVsKb11qVY6CebIyIQGQKw367YHrp4J0
   A==;
X-CSE-ConnectionGUID: YxjcTY4aQniZtvLxLAIqAQ==
X-CSE-MsgGUID: b7s4/LEkRQ+I+0bTwHN2xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="26080282"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; 
   d="scan'208";a="26080282"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 11:32:41 -0800
X-CSE-ConnectionGUID: r8YLMQmjTiSOjF670t7EMA==
X-CSE-MsgGUID: 76Or58mWRiKgDuA/sX5RfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113157581"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jan 2025 11:32:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcUqb-000h5b-2G;
	Mon, 27 Jan 2025 19:32:37 +0000
Date: Tue, 28 Jan 2025 03:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: James Clark <james.clark@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:b4/dead-deamons 2/5] kismet: WARNING: unmet direct
 dependencies detected for GENERIC_IRQ_IPI_MUX when selected by APPLE_AIC
Message-ID: <202501280307.bJcBLfbm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/dead-deamons
head:   337a23015919bdcaf25c1f3bbfcb7b5bd11d7029
commit: a3a4fafbdc9963ed91b21a60f503fdf1ccdc8183 [2/5] Allow no SMP builds
config: arm64-kismet-CONFIG_GENERIC_IRQ_IPI_MUX-CONFIG_APPLE_AIC-0-0 (https://download.01.org/0day-ci/archive/20250128/202501280307.bJcBLfbm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250128/202501280307.bJcBLfbm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501280307.bJcBLfbm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_IRQ_IPI_MUX when selected by APPLE_AIC
   WARNING: unmet direct dependencies detected for GENERIC_IRQ_IPI_MUX
     Depends on [n]: SMP [=n]
     Selected by [y]:
     - APPLE_AIC [=y] && ARM64 [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
