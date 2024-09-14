Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DADD539A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 00:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726272035; cv=none; b=tDBRSkAaf2iqMRARaW4Qe8yvpMLx5K0N9yh2hdfzHcRA+FJC5cBRVOHXzM7M3P0XMEVYT1L6rVbP+WolCpysH2QzFQ4vwr1kyWuidsfycUM9v5YYaxwtYEnRDWr2/kb5ByszKAvqxClg9HAuiq1Hd9vJfWtA9ZGcc7hy6DMjfEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726272035; c=relaxed/simple;
	bh=JooVsG7ZX/M7Pw650b8msHYyszjQHxMey6OeoTWTOFg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XFKcyn7Y6jIiMRay9WFVrCUUmclUihhGzw/vsx/VrmNhAm1KajKWcM0szCQVENM8s7b1Ac4F4IrwvnDiwXaVYjx7ac74QHLziFGeHIRSBXDiC6KQhhP/MHN9eYWGRiWppmGu4KUmv220PsJNIK3GYQKSD9wa00WhGawyL8f4a6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QE8FXZHx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QE8FXZHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726272033; x=1757808033;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JooVsG7ZX/M7Pw650b8msHYyszjQHxMey6OeoTWTOFg=;
  b=QE8FXZHxHvickqLdQ0bQ04wHc4b+vvGRPFUuMfsymXRBhOX6fXcc1zGf
   xDd2Yekx+86dxQ1S/7SknrdKYeYygVKMijB6S89PKRHgf7YlA1vTj4jQw
   LPTac/g0YG4ewvYs8RgvbeMa4VSFVU1dVlmalec6soRfstWjxHrjHWFaW
   r/gELEKECbhyJ6cuPYJRylu/G4/+bH654/bEoh5+e63LZ1qCEbfmG19Pr
   4HQ4bkfp61G6JTb0ic25csaSPVV0FLlDgL3xUyVM53QxrMitbKw0TKaRP
   zoI2XK3XnHJi5CTaCnMOW59Fx3ImrD7eQHhx6/d1uhi4Ly6aA1XjZ7423
   g==;
X-CSE-ConnectionGUID: 6s+pxaFUQp2+/jD2sePvDg==
X-CSE-MsgGUID: o1jBMQ1FT/mEzVFouOcN3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35762326"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="35762326"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 17:00:33 -0700
X-CSE-ConnectionGUID: Q3nSt3/8SXG5f/27iHOeMQ==
X-CSE-MsgGUID: AMhk+wk+TuOJJ4ZC6PvSVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68558577"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Sep 2024 17:00:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spGDF-0007A6-3A
	for oe-kbuild-all@lists.linux.dev;
	Sat, 14 Sep 2024 00:00:29 +0000
Date: Sat, 14 Sep 2024 08:00:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 7083/30000] cc1: error:
 '-fsanitize=shadow-call-stack' requires '-ffixed-x18'
Message-ID: <202409140730.mpTbTGIb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sami,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 332eaac720a2ecaa3227b70cc792a1698cafdfb9 [7083/30000] FROMLIST: arm64: implement Shadow Call Stack
config: arm64-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140730.mpTbTGIb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140730.mpTbTGIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140730.mpTbTGIb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: '-fsanitize=shadow-call-stack' requires '-ffixed-x18'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
