Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFECC1FE10E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 05:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786051; cv=none; b=TCQau6qnvsNoWYZfA/N6XIWD+bZkXn2AyJXNOCixJhlY1ReK+CAaHDfMQq/cyIUEQbVOaIvgnYb9UxYZkwEnBZnBil3S4CdISKYS6ci/3ZwRC/r/Gf14Go3OrCzvHGiFB3JBCTD1XaRPC3mngCHumcNuXomcOD80QWawYnoiwjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786051; c=relaxed/simple;
	bh=I0XnaG5jsuQL2BpI0MPILpl2yLJShP2IrU/2d9ATkww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQkMylHxStPjFx61i6uYuslKtzK2VgWSer0cSAcioSJgsFmVJTt8Fi17xaeAzmJjfL5UucJnb/gomD/751f/vQfnuNAiYiuHOhv6fCu7d/0+WB8vu3MH3toe7plLwSUxWgB5rDCaxg90JGZOMl4YGwyxPmBKogg470y5NbUCyNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L90x+AqS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L90x+AqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730786050; x=1762322050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I0XnaG5jsuQL2BpI0MPILpl2yLJShP2IrU/2d9ATkww=;
  b=L90x+AqStEvehrvaTbR99zu4W2Ufl//5ur0zkHyCubiK/3/gMW6I6EbH
   mpMHTM9MXyB89953ieRcnUCF50DvoNYfOSFoDsbigqd8v3kJhNbGCcf3G
   5EaTN+BDd2+6HQoUwJrJ1R4ij4JvVYysbOBseCtPOTyDF6kliKFaIXAUz
   8P4QkkBtU4CVbfPeaXVpFldwze4fYDwFm09dsHP/hTrh/piZIzIsuHVwE
   V6Fe087eXry+ka+xg+BzAzHB4aqxO7LfM/eMAQ/kkbWUNSbLpRwGljklE
   Z5c9Ec7uOLiIeF5kWLnV0xf+Z6G+U+jAj4b22KPxlJCUbhytJAkKQ3+gn
   A==;
X-CSE-ConnectionGUID: PNGaaoRwQoSaH7XsBueXCQ==
X-CSE-MsgGUID: qPTAU+RXQs+qqIyBewu+mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33351594"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="33351594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 21:54:09 -0800
X-CSE-ConnectionGUID: kVm36FkaQpSm0KPHhaXoiA==
X-CSE-MsgGUID: vG4ZDL9dS3CMMC2zw+i/lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="87816223"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 21:54:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8CVy-000lgh-0s;
	Tue, 05 Nov 2024 05:54:06 +0000
Date: Tue, 5 Nov 2024 13:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/platforms/pseries/lparcfg.c:189:15: sparse: sparse:
 symbol 'boot_pool_idle_time' was not declared. Should it be static?
Message-ID: <202411051330.xDtEUGBZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2e1b3cc9d7f790145a80cb705b168f05dab65df2
commit: 9c74ecfd0fc46e2eaf92c1b6169cc0c8a87f1dc2 powerpc/pseries: Add pool idle time at LPAR boot
date:   6 months ago
config: powerpc64-randconfig-r132-20241104 (https://download.01.org/0day-ci/archive/20241105/202411051330.xDtEUGBZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241105/202411051330.xDtEUGBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051330.xDtEUGBZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/lparcfg.c:189:15: sparse: sparse: symbol 'boot_pool_idle_time' was not declared. Should it be static?

vim +/boot_pool_idle_time +189 arch/powerpc/platforms/pseries/lparcfg.c

   188	
 > 189	unsigned long boot_pool_idle_time;
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
