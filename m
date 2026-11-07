Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074797;
	b=s2aOIyzKBo4WK14Tbdfim0k1+zX3t4ohnYapL7i7SyGUNRSi/RlzGwiewa9vY8GfdaY2
	 yLTovWKnlYBAyHKIhv3dRiA+LNONPIcuVqNxLtnVLIZyw98A8O2f7jjSwmSWLXuDxF3uB
	 QQMrZd6QYeVTv+dG9o827EXbH8gst7nQhplEBCYf4LMG9vyDAz0uZQLp5cZrXdd8YbyqK
	 NkQHmRyXobMVIHoGJ00qU/abNyZWqdTMhr9ARrFUywWz6p5xJvueHghqz2F7odPq+vZkf
	 BeLitJT/MIQbiRfWgLVTqpqogihWppzOhs/je2HlOp5N3m0n0Yk6xeGS/TnMeA86b4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074797;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZsYoGHyAiQWJ4ezPXbzO9jCEiqtRT4joe9WI+aMewag=;
	b=j65mWfA5OidFpgVvV+lnSCqmWiZB+Yf5QLZs0FVv5KG87fxd+1ayMcRrFEGJvSh7ZfM6
	 LMgzJtufZATRgwjcj1wVJPZHRVZUjo+LpkJGROaleeK+U1t9FD8+jAFInGEIaqBtyWp3q
	 E8cJrM7K472Si1dk8y8yC9xb+iWS2cRU44XFTh4bnTxWbcPCaVCsvW/1m1UngONPkevrz
	 mO9Uh52wEiCvb9zUewVgVDxP+XL0Zjh1HwlH4b8ujCZhjuKoo3wKX5knCAcviLnVI3l4v
	 t36TpYaYf6zcTE7fyFjC+Izf5BJB8+19WcWRctWlqgGU1kzhD0vA3fUBEB/U4La9FRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="n/uERqgO";
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00F606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 18:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B00F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n/uERqgO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794074797; x=1825610797;
  h=date:from:to:cc:subject:message-id;
  bh=loCEBTty8GH05Er9Oy7tfOyyfMXxpA+fKcyPshJBE5k=;
  b=n/uERqgOaaE4h15jUoUR46jUAXMx+oEWQABN21/M7V+KQOt5yvPL/Ubm
   Q/Lwt9ZQKQvxyjUGImGcdU7K34JDPnyIhMTYa6xb4ynAc14hrFFXM/xMX
   WbTWZtUUSsB1A8X/1IurUT7kKLoNKtMx8Kx8HBzcLTHz1ITZ1FmUDYi+J
   YZHi1BgpaHoUvGahcp+82CdmPoX9sWrh6gdao9qib881TIQKaOAnGoUAc
   Q2OohsFe0GXqKrw0Coi31sCYKrdfWWgrTyJ7u9EPhoqyjr0MXZiEyc1b2
   7rzbOPmFin/LQrvsFUMbxr4kEuY3s9KxvtRGts5BIlMpsQcSJKXaCtjE8
   A==;
X-CSE-ConnectionGUID: k71EGRKbSaWJ2P9sUfC2aw==
X-CSE-MsgGUID: ib+Yqj+rSqyNQmiXGkzTvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2752580"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2752580"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 10:06:36 -0800
X-CSE-ConnectionGUID: Gzw0ZTwERaKHJPFqF3kFlQ==
X-CSE-MsgGUID: n9ZLAbACSNuWVLC/sEjm/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7702529"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2026 10:06:34 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPkoC-00000000Akp-1TeX;
	Sat, 07 Nov 2026 18:06:32 +0000
Date: Sat, 07 Nov 2026 19:06:10 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-main 151/151] Warning:
 drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202611071915.RZiqJe6z-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-main
head:   933c2827bb87dddc6074db77c90f8c3b965e13f5
commit: 92e0b518c5e0607ad0daa9c82b305a45226050eb [151/151] net: ethtool: report PHY firmware version in PHY_GET
config: sparc64-randconfig-2000-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071915.RZiqJe6z-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071915.RZiqJe6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071915.RZiqJe6z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * in some cases the GPY211 will link up but not RX packets

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
