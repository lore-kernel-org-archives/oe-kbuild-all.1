Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B4679D0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721567362; cv=none; b=UftSj8R6sg/FMZrjtYaJi8dkyn9HcFarGWaK5FG4jTdWRAAGHjOz2czly+irGecffrVjNmV0qeD+0m/SXRTxHkyOMSrGMuZ0C0plVdsoh7Rtpk0X5NeGISp5BFR0+wh7Zb0bfsVnpXFs4UySizXuyEeZccXLJw8/juvod1jyeCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721567362; c=relaxed/simple;
	bh=V6DKCP6xIqIicBtcvoekhOi/2/+n0WRYnM6RRHAvFmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHLDRHZR3vVSxJLcwgvJ769tTe+o/4D1tB4HMC1uKZmmGVSvqqj6eFKp9uvaHVi++N62S495C6vAtFrxjeT7ZkFDqTzdqwR2iMaq7ikbxLfNRmHDgEv4ijpMF8I9OSRAXR9ttbhBo2mjxkOxppPh1Sd6DxUImDlperayZpDnUhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtquXVif; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtquXVif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721567361; x=1753103361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V6DKCP6xIqIicBtcvoekhOi/2/+n0WRYnM6RRHAvFmM=;
  b=CtquXVifpNKSIpKV/T0r8F7BkltN8NykwJjIuIdvg1HU7sDkJEumDwhB
   SxZeRC15u5mqXlTcIg2NaCdCwRyJ5hGCeDIKeTczTQR3uQwJ1oZ0jm9pL
   nENrEU+b1tZu9aKR13Cy/TMkLATa6BsmXzs3nQnZhmIzWR4foen6+gxkI
   IBwXpK3r0UM5SBhuZN5joZZFwqpRcm87+tAfhUwl7bXUx44NBgGoRWHBe
   2dR4wxuY7PwPfSwBG6YCD62bCRf0qYx4Dn2qHC69DadVGZUzMyPUSevlj
   Cb01G5zc6IEGIZLq2mWMocOMdIq/fyh33hDazx0m8ZcA0R5S7clvJWPtP
   Q==;
X-CSE-ConnectionGUID: 0dxp8AbwRPip65VgPfdGBQ==
X-CSE-MsgGUID: OcrCAvMnQ6KXk/FpU5OGLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="36573711"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="36573711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 06:09:20 -0700
X-CSE-ConnectionGUID: quUVgrO1S6yAgSM9tYQ9IQ==
X-CSE-MsgGUID: 1H2swh89SfmkaZyhZzcUUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51263711"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2024 06:09:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVWJP-000kHq-38;
	Sun, 21 Jul 2024 13:09:15 +0000
Date: Sun, 21 Jul 2024 21:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 53/56] mm/damon/tests/vaddr-kunit.h:82:undefined
 reference to `kunit_try_catch_throw'
Message-ID: <202407212029.0FGR4ymI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   c3004f235d68aa890660b532b04714a40abafd78
commit: dfbce92b00bf8691cb86026352354792271c39f5 [53/56] mm/damon/tests: Rename test files to have _kunit suffix
config: i386-randconfig-016-20240720 (https://download.01.org/0day-ci/archive/20240721/202407212029.0FGR4ymI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407212029.0FGR4ymI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407212029.0FGR4ymI-lkp@intel.com/

Note: the sj/damon/next HEAD c3004f235d68aa890660b532b04714a40abafd78 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ld: mm/damon/tests/core-kunit.h:24:(.text+0x3be5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:24:(.text+0x3bf3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:25:(.text+0x3c25): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:25:(.text+0x3c33): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:28:(.text+0x3c65): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:28:(.text+0x3c73): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:31:(.text+0x3ca5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:31:(.text+0x3cb3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:34:(.text+0x3ce5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:34:(.text+0x3cf3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_set_regions':
   mm/damon/tests/core-kunit.h:311:(.text+0x4551): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:311:(.text+0x455f): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:310:(.text+0x4591): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:310:(.text+0x459f): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:308:(.text+0x45d5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:308:(.text+0x45e3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_ops_registration':
   mm/damon/tests/core-kunit.h:260:(.text+0x4dbb): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:260:(.text+0x4dc9): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:282:(.text+0x507c): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:282:(.text+0x508a): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:263:(.text+0x50c4): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:263:(.text+0x50d2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:275:(.text+0x5104): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:275:(.text+0x5112): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:255:(.text+0x5144): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:255:(.text+0x5152): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_split_regions_of':
   mm/damon/tests/core-kunit.h:234:(.text+0x5365): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:234:(.text+0x5373): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:241:(.text+0x53a5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:241:(.text+0x53b3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_split_at':
   mm/damon/tests/core-kunit.h:134:(.text+0x55e5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:134:(.text+0x55f3): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:135:(.text+0x5630): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:135:(.text+0x563e): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:138:(.text+0x567b): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:138:(.text+0x5689): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:139:(.text+0x56cb): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:139:(.text+0x56d9): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:141:(.text+0x571a): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:141:(.text+0x5728): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:142:(.text+0x576a): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:142:(.text+0x5778): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:143:(.text+0x57b1): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:143:(.text+0x57bf): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_aggregate':
   mm/damon/tests/core-kunit.h:108:(.text+0x5baa): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:108:(.text+0x5bb8): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:112:(.text+0x5c18): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:112:(.text+0x5c26): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:116:(.text+0x5c7f): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:116:(.text+0x5c8d): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_target':
   mm/damon/tests/core-kunit.h:59:(.text+0x5f8f): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:59:(.text+0x5f9f): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:62:(.text+0x5ff5): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:62:(.text+0x6005): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:56:(.text+0x6040): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:56:(.text+0x6050): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/core.o: in function `damon_test_set_attrs':
   mm/damon/tests/core-kunit.h:366:(.text+0x638c): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:366:(.text+0x639a): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:374:(.text+0x63d4): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:374:(.text+0x63e2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/core-kunit.h:378:(.text+0x6414): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/core-kunit.h:378:(.text+0x6422): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/vaddr.o: in function `damon_test_split_evenly_succ':
   mm/damon/tests/vaddr-kunit.h:288:(.text+0x379): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:288:(.text+0x387): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:290:(.text+0x424): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:290:(.text+0x432): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:277:(.text+0x46c): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:277:(.text+0x47a): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:279:(.text+0x4b4): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:279:(.text+0x4c2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:285:(.text+0x4f2): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:285:(.text+0x500): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:283:(.text+0x530): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:283:(.text+0x53e): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/vaddr.o: in function `damon_test_split_evenly_fail':
   mm/damon/tests/vaddr-kunit.h:262:(.text+0x687): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:262:(.text+0x695): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:261:(.text+0x6cf): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:261:(.text+0x6dd): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:256:(.text+0x714): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:256:(.text+0x722): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:258:(.text+0x755): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:258:(.text+0x763): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/vaddr.o: in function `damon_test_split_evenly':
   mm/damon/tests/vaddr-kunit.h:297:(.text+0x81f): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:297:(.text+0x842): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/vaddr.o: in function `damon_do_test_apply_three_regions':
   mm/damon/tests/vaddr-kunit.h:149:(.text+0x9b1): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:149:(.text+0x9c2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:148:(.text+0x9f1): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:148:(.text+0xa02): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/vaddr.o: in function `damon_test_three_regions_in_vmas':
>> mm/damon/tests/vaddr-kunit.h:82:(.text+0x106c): undefined reference to `kunit_try_catch_throw'
   ld: mm/damon/tests/vaddr-kunit.h:86:(.text+0x11b7): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:86:(.text+0x11c5): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:91:(.text+0x120f): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:91:(.text+0x121d): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:90:(.text+0x1267): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:90:(.text+0x1275): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:89:(.text+0x12bf): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:89:(.text+0x12cd): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:88:(.text+0x1317): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:88:(.text+0x1325): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/vaddr-kunit.h:87:(.text+0x136f): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/vaddr-kunit.h:87:(.text+0x137d): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/sysfs.o: in function `damon_sysfs_test_add_targets':
   mm/damon/tests/sysfs-kunit.h:60:(.text+0x143c): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/sysfs-kunit.h:60:(.text+0x144c): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/sysfs-kunit.h:65:(.text+0x149c): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/sysfs-kunit.h:65:(.text+0x14ac): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/dbgfs.o: in function `damon_dbgfs_test_set_init_regions':
   mm/damon/tests/dbgfs-kunit.h:139:(.text+0x13ab): undefined reference to `kunit_binary_str_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:139:(.text+0x13b9): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:134:(.text+0x13fe): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:134:(.text+0x140c): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:151:(.text+0x1449): undefined reference to `kunit_binary_str_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:151:(.text+0x1457): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:146:(.text+0x149e): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:146:(.text+0x14ac): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:121:(.text+0x1525): undefined reference to `kunit_try_catch_throw'
   ld: mm/damon/dbgfs.o: in function `damon_dbgfs_test_set_targets':
   mm/damon/tests/dbgfs-kunit.h:86:(.text+0x16ea): undefined reference to `kunit_binary_str_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:86:(.text+0x16f8): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:90:(.text+0x1722): undefined reference to `kunit_binary_str_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:90:(.text+0x1730): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:94:(.text+0x175a): undefined reference to `kunit_binary_str_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:94:(.text+0x1768): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:78:(.text+0x179e): undefined reference to `kunit_try_catch_throw'
   ld: mm/damon/dbgfs.o: in function `damon_dbgfs_test_str_to_ints':
   mm/damon/tests/dbgfs-kunit.h:50:(.text+0x1e12): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:50:(.text+0x1e20): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:43:(.text+0x1e52): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:43:(.text+0x1e60): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:57:(.text+0x1e94): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:57:(.text+0x1ea2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:24:(.text+0x1ee7): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:24:(.text+0x1ef5): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:25:(.text+0x1f2f): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:25:(.text+0x1f3d): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:30:(.text+0x1f77): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:30:(.text+0x1f85): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:31:(.text+0x1fbf): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:31:(.text+0x1fcd): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:67:(.text+0x2007): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:67:(.text+0x2015): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:55:(.text+0x204c): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:55:(.text+0x205a): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:36:(.text+0x2097): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:36:(.text+0x20a5): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:41:(.text+0x20e4): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:41:(.text+0x20f2): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:48:(.text+0x213c): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:48:(.text+0x214a): undefined reference to `__kunit_do_failed_assertion'
   ld: mm/damon/tests/dbgfs-kunit.h:62:(.text+0x218f): undefined reference to `kunit_binary_assert_format'
   ld: mm/damon/tests/dbgfs-kunit.h:62:(.text+0x219d): undefined reference to `__kunit_do_failed_assertion'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DAMON_DBGFS
   Depends on [n]: DAMON_DBGFS_DEPRECATED [=n]
   Selected by [m]:
   - DAMON_DBGFS_KUNIT_TEST [=y] && KUNIT [=m]


vim +82 mm/damon/tests/vaddr-kunit.h

17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  38  
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  39  /*
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  40   * Test __damon_va_three_regions() function
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  41   *
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  42   * In case of virtual memory address spaces monitoring, DAMON converts the
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  43   * complex and dynamic memory mappings of each target task to three
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  44   * discontiguous regions which cover every mapped areas.  However, the three
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  45   * regions should not include the two biggest unmapped areas in the original
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  46   * mapping, because the two biggest areas are normally the areas between 1)
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  47   * heap and the mmap()-ed regions, and 2) the mmap()-ed regions and stack.
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  48   * Because these two unmapped areas are very huge but obviously never accessed,
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  49   * covering the region is just a waste.
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  50   *
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  51   * '__damon_va_three_regions() receives an address space of a process.  It
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  52   * first identifies the start of mappings, end of mappings, and the two biggest
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  53   * unmapped areas.  After that, based on the information, it constructs the
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  54   * three regions and returns.  For more detail, refer to the comment of
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  55   * 'damon_init_regions_of()' function definition in 'mm/damon.c' file.
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  56   *
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  57   * For example, suppose virtual address ranges of 10-20, 20-25, 200-210,
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  58   * 210-220, 300-305, and 307-330 (Other comments represent this mappings in
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  59   * more short form: 10-20-25, 200-210-220, 300-305, 307-330) of a process are
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  60   * mapped.  To cover every mappings, the three regions should start with 10,
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  61   * and end with 305.  The process also has three unmapped areas, 25-200,
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  62   * 220-300, and 305-307.  Among those, 25-200 and 220-300 are the biggest two
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  63   * unmapped areas, and thus it should be converted to three regions of 10-25,
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  64   * 200-220, and 300-330.
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  65   */
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  66  static void damon_test_three_regions_in_vmas(struct kunit *test)
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  67  {
d0cf3dd47f0d5d mm/damon/vaddr-test.h Liam R. Howlett 2022-09-06  68  	static struct mm_struct mm;
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  69  	struct damon_addr_range regions[3] = {0,};
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  70  	/* 10-20-25, 200-210-220, 300-305, 307-330 */
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  71  	struct vm_area_struct vmas[] = {
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  72  		(struct vm_area_struct) {.vm_start = 10, .vm_end = 20},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  73  		(struct vm_area_struct) {.vm_start = 20, .vm_end = 25},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  74  		(struct vm_area_struct) {.vm_start = 200, .vm_end = 210},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  75  		(struct vm_area_struct) {.vm_start = 210, .vm_end = 220},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  76  		(struct vm_area_struct) {.vm_start = 300, .vm_end = 305},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  77  		(struct vm_area_struct) {.vm_start = 307, .vm_end = 330},
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  78  	};
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  79  
d0cf3dd47f0d5d mm/damon/vaddr-test.h Liam R. Howlett 2022-09-06  80  	mt_init_flags(&mm.mm_mt, MM_MT_FLAGS);
34403fa579514a mm/damon/vaddr-test.h Liam R. Howlett 2023-01-20  81  	if (__link_vmas(&mm.mm_mt, vmas, ARRAY_SIZE(vmas)))
34403fa579514a mm/damon/vaddr-test.h Liam R. Howlett 2023-01-20 @82  		kunit_skip(test, "Failed to create VMA tree");
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  83  
d0cf3dd47f0d5d mm/damon/vaddr-test.h Liam R. Howlett 2022-09-06  84  	__damon_va_three_regions(&mm, regions);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  85  
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  86  	KUNIT_EXPECT_EQ(test, 10ul, regions[0].start);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  87  	KUNIT_EXPECT_EQ(test, 25ul, regions[0].end);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  88  	KUNIT_EXPECT_EQ(test, 200ul, regions[1].start);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  89  	KUNIT_EXPECT_EQ(test, 220ul, regions[1].end);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  90  	KUNIT_EXPECT_EQ(test, 300ul, regions[2].start);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  91  	KUNIT_EXPECT_EQ(test, 330ul, regions[2].end);
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  92  }
17ccae8bb5c928 mm/damon/vaddr-test.h SeongJae Park   2021-09-07  93  

:::::: The code at line 82 was first introduced by commit
:::::: 34403fa579514a6de378f06f79239821c92305bf mm/damon/vaddr-test.h: stop using vma_mas_store() for maple tree store

:::::: TO: Liam R. Howlett <Liam.Howlett@oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
