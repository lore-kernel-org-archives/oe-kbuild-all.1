Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C239A25B09D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790405582; cv=none; b=ST32yyhmSR3UXdzlZlAf4YO/WxdpM80dM8/O63W4ipYU7SCsyBdZNeWGCU/T98ouKhxW3xGLPrHUzWVs6g0r5gDrqsuXb00AKdQdHggXZEPFGwHHSgXb1FwCbHIi36ptS/ZYwp40dHLEbwdD7wVtzJhLwgR6lkdXJl0mAAvbl3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790405582; c=relaxed/simple;
	bh=KyZq/Jlrj8S6+s/mF6L8gw6UtwgIO6tEi+U3Z03mlJY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E7HPQcURgMHObi+CFSUJJB+4QdPWvfJku1D7o3D9IS+bcNpXigYwTuKvYixrdeWBrDwqCtE4kr6FRZyHLqpK4Y8z2PLdQucW2KnDVqTTmlDe+8u27ALbYXBJv38goyw22xMHJ3VH+6kzhqkJ2Ecqx72qETTlXLVb5WLxsWgDWKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKHiYc2b; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKHiYc2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790405579; x=1821941579;
  h=date:from:to:cc:subject:message-id;
  bh=KyZq/Jlrj8S6+s/mF6L8gw6UtwgIO6tEi+U3Z03mlJY=;
  b=hKHiYc2bLp68Ud7VbFDu7iUQMymuluJx5GHvXIj17cAugpjGOwKR08rh
   a3pkspfmLP62uDkNAbtClRcNKumiwFzBxowA6llKRL0XHLju2Fhm7okZB
   c8F8rFrQPXq+Smjkupyc9xZvTjy5ybAfiPab0CKpriJduukQF4rb8eEW2
   4UTzCZNXOe+uvHm5F1CzpDyyUmeqAEKJRD2sNsoTKHWQZSqoCk+sISqOC
   IXGZMzeNfaYov0Llf0jkdyegOEcKzjdNHRETtGLemje2OuiJGGJak5Xnf
   XJ15tCUo/99BR+s4Lr9NQW5teuIE8SY8oroEhe+/kuZF4Y3c5bKw+NE7+
   Q==;
X-CSE-ConnectionGUID: CI8awRloQ82tRh9CNfVYbQ==
X-CSE-MsgGUID: gY4DCGPnQ3WAOIVQVgSbng==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90088680"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90088680"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 23:52:58 -0700
X-CSE-ConnectionGUID: KTe9P0+QQ32nR5muvY3W+g==
X-CSE-MsgGUID: /SYBXLvoT4y2y/KYj1QZWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="312432622"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Sep 2026 23:52:57 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAMHH-000000000Rl-1e7C;
	Sat, 26 Sep 2026 06:52:55 +0000
Date: Sat, 26 Sep 2026 08:52:01 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 214/214] Warning:
 drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'ds' not
 described in 'mxl862xx_fdb_add_per_fid'
Message-ID: <202609260849.Z9jP5Rkj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   27e8d41a42f73cb2b271df0e897e25224889f6d0
commit: 1b92949971e4134c342da0019f908d61e62816e7 [214/214] net: dsa: add 802.1Q VLAN-based tag driver for MxL862xx
config: um-randconfig-2000-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260849.Z9jP5Rkj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260849.Z9jP5Rkj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260849.Z9jP5Rkj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'ds' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'addr' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'vid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'fid' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2780 function parameter 'port_id' not described in 'mxl862xx_fdb_add_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'ds' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'addr' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'vid' not described in 'mxl862xx_fdb_del_per_fid'
>> Warning: drivers/net/dsa/mxl862xx/mxl862xx.c:2799 function parameter 'fid' not described in 'mxl862xx_fdb_del_per_fid'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
