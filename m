Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B38C3093A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 23:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766531155; cv=none; b=BjO9RkMWWBalYh+v1+oPf5Z9EUiZ84qqGDMBu9MJPfTOKscpBh+FtxkVkw66kQs5doA0VLq92XjRUbtxID2behyMLrWj5OruQIHE449e1ilevWqwwSvj9T1zbIiyK6naS5QtcFUz3a6kxVToi0ORY3575QsYwCHEisZ2dK4Pa3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766531155; c=relaxed/simple;
	bh=ftOhOWmhr2J5AdAISNDsVaDDGnBHi9cFE5drCS7QCp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T6V48kR4HCvWLUys7lv24FcYGz+pRQWkC2Ui7/j93eVu/7eypQW3/bUHItNiHCWnDHE/a80DJsbHJ1jxeXFwNObpK07qNxPugiWNppoyeVug9mKQ+cQ4LBhKT9YbyQuQ7wPTbPPPYpKDCHQxVBGy/Kn2DTew0bpjTRiJwqNzC+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuKbUF4k; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuKbUF4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766531153; x=1798067153;
  h=date:from:to:cc:subject:message-id;
  bh=ftOhOWmhr2J5AdAISNDsVaDDGnBHi9cFE5drCS7QCp0=;
  b=NuKbUF4kc7E8KwJgfjdrzsFbiDR9ryGqnwN9Ze7fwwQ25LBeKIQE7e/r
   tXyoBP9Y7VIy5coIboYlBnzSMhvm3RHoc5PuQuQqQdC+FdK+BzjtnQC+f
   zTMhCCjITmiQ6IPO05P5s997xqHRrkEbhfLZc1uFez337SqJ9hl+L+06n
   Rvossqp5KFehDczWw2uoqdSSuCwjkVPKhkx+0BDlt0lGlSZHMDwjw+l/z
   QGcC55mtluivxR1rOkx3AN4JCo8wIrGurOi97RhbWP1iyKvD0pcVSvUYP
   oQBSYYKqfPZOkSZm8EeB7OIttNZ4dbM5rSnF61KwEQMVHAOVt8wefCh3J
   w==;
X-CSE-ConnectionGUID: uRXRLIwPSpKvKYlrhngtoQ==
X-CSE-MsgGUID: GnGPZcBGRkGONNcrdwRF3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68260843"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68260843"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:05:52 -0800
X-CSE-ConnectionGUID: dB2SbGezT22ILPlfgRiZfw==
X-CSE-MsgGUID: cTFxUVKnT5WwPp41gKcTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199636909"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Dec 2025 15:05:51 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYBRs-000000002Sj-2w07;
	Tue, 23 Dec 2025 23:05:48 +0000
Date: Wed, 24 Dec 2025 07:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544]
 drivers/net/ethernet/yunsilicon/xsc/pci/hal/diamond_impl.c:411:30: sparse:
 sparse: invalid bitfield specifier for type restricted __le32.
Message-ID: <202512240606.03jP75lH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: d0888acfac5d4aca4538e40f027e80d9230c5002 [3544/3544] drivers: update Yunsilicon drivers to version rel_2412_std_card
config: x86_64-randconfig-r121-20251215 (https://download.01.org/0day-ci/archive/20251224/202512240606.03jP75lH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240606.03jP75lH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240606.03jP75lH-lkp@intel.com/

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
