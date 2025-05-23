Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0140621480C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 May 2025 23:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748043528; cv=none; b=a8wBakslfEo78wQ+DtJ2PKsGrN7H5it95MGhLpU3Cl1eSOCGopqD8XvdoC10lcbrIWh73q/zNYwAYnNdaamx/31CRTv3yDNK8qM0PndqgQ1qiFld2XLnJWQrTQIlsqWWJVzW3Dj1coQByfiZJTzmUGn1k6zXD+d2DAjDITPPr2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748043528; c=relaxed/simple;
	bh=DA4KiH8rd/BLD9rSxcbDx3MbScp6KpZyNlaXOviJx5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WmiO2iWl99EtMFDzOtVGDixWjI4XzxJejGfAeTlbnuodSs6z0YerfewRI7Qmu9bRsKGLOqqoj8/uG+zbr5AYzsPqMG2R1bwUowyBbo4YNN0I5NmAwJ5Vy9QTT2UyMQv7FXVtAqjoNbgNPLIvtYHJfeRxAEz+ofrMKCLkvTfA8Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hi0SHlff; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hi0SHlff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748043526; x=1779579526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DA4KiH8rd/BLD9rSxcbDx3MbScp6KpZyNlaXOviJx5Y=;
  b=hi0SHlff8jTEV0KyECqTVMGQfW4XvVk3p+Qd0p1UeP9K4GWoXWOI6oyO
   FpemhpY88ya4HOBjcVis0iVDNRtoEuByhRFaOogdfgIdOTQZNOllCqe/o
   hxdkhDlY+5rkhSWQIPunL0Hxox6NMfR9CYG0qP3rDW/KK0MKTKz7KVplV
   bxdWJSXI+lM3MpIi036PIZCH8dFmAxeBb1GP9el1wKtnfJ0IzPa41uQbR
   LH5sQgNrZXcfF3iD3j4XLsVMmjOiLlBzWbefA26jV23ZPCwI0gOKxdPv7
   fmczsLGzezHtAcyzmH3vvRnXjoeidDNvzrmE1vM4arOUH/9J2qMoSg4Gc
   A==;
X-CSE-ConnectionGUID: ue7VvgIBQBSlArQkID7Ldw==
X-CSE-MsgGUID: Ph1+RdYzS066rF3YTKUVkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61514091"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="61514091"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 16:38:45 -0700
X-CSE-ConnectionGUID: 1emRrV6SQi+9ghUzrvoNAA==
X-CSE-MsgGUID: KbiXjJiMTE25dB0rwg+qVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="141838251"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2025 16:38:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIbyM-000QoG-0J;
	Fri, 23 May 2025 23:38:42 +0000
Date: Sat, 24 May 2025 07:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2279/2279]
 drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_impl.c:411:30: sparse:
 sparse: invalid bitfield specifier for type restricted __le32.
Message-ID: <202505240747.f4mA28J9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7cbbcd205be44f74ce9d3a0eac672439d8db65af
commit: d0888acfac5d4aca4538e40f027e80d9230c5002 [2279/2279] drivers: update Yunsilicon drivers to version rel_2412_std_card
config: x86_64-randconfig-r132-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240747.f4mA28J9-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240747.f4mA28J9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240747.f4mA28J9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_impl.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1277:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1278:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1279:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1280:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1282:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1283:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1284:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1285:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1286:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1287:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1288:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1299:33: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1300:30: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1301:32: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1302:33: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1303:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1304:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1305:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1357:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1358:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1359:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1360:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1361:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1362:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1363:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1364:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1365:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1366:33: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1367:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1368:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1369:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1370:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1371:33: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1372:30: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1373:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1378:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1379:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1380:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_impl.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:195:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:205:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:210:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
>> drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_impl.c:411:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_impl.c:421:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_impl.c:426:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_next_impl.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1277:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1278:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1279:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1280:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1282:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1283:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1284:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1285:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1286:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1287:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1288:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1299:33: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1300:30: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1301:32: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1302:33: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1303:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1304:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1305:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1357:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1358:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1359:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1360:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1361:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1362:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1363:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1364:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1365:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1366:33: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1367:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1368:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1369:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1370:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1371:33: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1372:30: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1373:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1378:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1379:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1380:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_next_impl.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:195:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:205:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:210:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
>> drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_next_impl.c:405:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_next_impl.c:415:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_next_impl.c:420:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
--
   drivers/net/ethernet/yunsilicon/xsc/pci/hal/andes_impl.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1277:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1278:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1279:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1280:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1282:41: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1283:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1284:48: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1285:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1286:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1287:51: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1288:45: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1299:33: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1300:30: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1301:32: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1302:33: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1303:37: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1304:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1305:42: sparse: sparse: invalid bitfield specifier for type restricted __be16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1357:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1358:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1359:44: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1360:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1361:34: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1362:35: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1363:28: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1364:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1365:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1366:33: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1367:42: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1368:40: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1369:39: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1370:32: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1371:33: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1372:30: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1373:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1378:36: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1379:37: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_cmd.h:1380:29: sparse: sparse: invalid bitfield specifier for type restricted __be32.
   drivers/net/ethernet/yunsilicon/xsc/pci/hal/andes_impl.c: note: in included file:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:195:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:205:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:210:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_hsi.h:218:24: sparse: sparse: invalid bitfield specifier for type restricted __le16.
>> drivers/net/ethernet/yunsilicon/xsc/pci/hal/andes_impl.c:508:30: sparse: sparse: invalid bitfield specifier for type restricted __le32.
>> drivers/net/ethernet/yunsilicon/xsc/pci/hal/andes_impl.c:518:27: sparse: sparse: invalid bitfield specifier for type restricted __le64.
>> drivers/net/ethernet/yunsilicon/xsc/pci/hal/andes_impl.c:521:29: sparse: sparse: invalid bitfield specifier for type restricted __le16.

vim +411 drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_impl.c

   408	
   409	struct diamond_cqe {
   410		u8		error_code;
 > 411		__le32		qp_id:15;
   412		u8		raw_is_cut:1;
   413		u8		se:1;
   414		u8		has_pph:1;
   415		u8		type:1;
   416		u8		with_immdt:1;
   417		u8		csum_err:4;
   418		__le32		imm_data;
   419		__le32		msg_len;
   420		__le32		vni;
 > 421		__le64		ts:48;
   422		__le16		wqe_id;
   423		u8		msg_opcode;
   424		u8		rsv;
   425		__le16		rsv1[2];
 > 426		__le16		rsv2:15;
   427		u8		owner:1;
   428	};
   429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
