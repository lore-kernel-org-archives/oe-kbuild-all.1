Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634DB224D6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531236; cv=none; b=TRsG9MO7S2X2lWxG6udPnMvW8oODaRtgWq+nSiV3MPWOaEPVazbstiepvu8KLjmFwBu/t76mLDqBJBWk2Z59QTIleAb0RyBeTCj6MvNFHyD7Uq+o5NaFJhFU2NFmC+l62yFR5S2MROwoFyOfuTAcevFTASg52IYJEKJ6O35q8lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531236; c=relaxed/simple;
	bh=idI5rkwPIfQAJvvxHKwU4Ma9Gb/YivOMQumzXKHr4do=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OyKfTFtf++9sEyy9BrlduFUXmAztvxO7G/rKYh4bO/3jrKPbIeni3k2G7sacCcV4fXoeC/kI85EUgL4YgVfMPtjNYbN4HEYbvYcXwOp+vVcfhx5YeSHltYvdMJJTRcxUHFY4FNvExkPmTKMAVaZO/sm4lyjhlvdFi9MkjX16hA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxgbB4eI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxgbB4eI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777531234; x=1809067234;
  h=date:from:to:cc:subject:message-id;
  bh=idI5rkwPIfQAJvvxHKwU4Ma9Gb/YivOMQumzXKHr4do=;
  b=VxgbB4eIn/rGnukHy0Au1NjSsqp5rk7qlaxtDwE4lG9FrkPc1OX5s5nh
   Im8N9b5FHnscXKfiSo8dGYll622FgaJDpyVmPB0mge2VeEgHm7+9wfXpf
   R+RzPBeJQSpYMCT4ZqP+9WhLe/9gkYb2OCzE5cu/KAAO0bVl/+JK6Pnx+
   Nnd/Z74SEyClCSe0US3CSqgF1huWtG91hpsaGCK45smRYNgJdFDDxv5hU
   L8594NnfmQe49U5ATg246VpWGy+nMFgrAlxzXemUbfShQ+4uTxXK4loYL
   Tobjc7yAG3kjHePKPj3jtIvmAWkBhfjvk7pH0IurTlaUW+vBlEyShQLCz
   g==;
X-CSE-ConnectionGUID: CK4zI5IUQ/uMUOMEFkd/NQ==
X-CSE-MsgGUID: rJtOti/0TIu+jlvjto2x3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="103927545"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="103927545"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 23:40:33 -0700
X-CSE-ConnectionGUID: lWIJskuvSUGzx8G2SnHFog==
X-CSE-MsgGUID: B8r5a4OdTDWpbnPotuRSPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="231849429"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2026 23:40:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIL4Y-000000004lF-3KVZ;
	Thu, 30 Apr 2026 06:40:30 +0000
Date: Thu, 30 Apr 2026 08:40:00 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-mt7622 72/103] Warning:
 drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202604300830.1rB73Ttc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-mt7622
head:   d8b6134553d0f268ed594061eba808fcb51257f4
commit: 7c26b11ce540a16cfaaee9da4894d8449bfe32e0 [72/103] net: phy: mxl: toggle SGMII AN on link change
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260430/202604300830.1rB73Ttc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300830.1rB73Ttc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300830.1rB73Ttc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * in some cases the GPY211 will link up but not RX packets

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
