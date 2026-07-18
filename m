Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298C8369D4E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365334; cv=none; b=U0lYUuPv2lvMAKtoaTzfKVo7MYTj7D2vcX6UV280aDxWX2LEwp9iSUoQrkvDsgF2dwUkxUdy+uu1nWDytQI1uzGT8iHdxGzPNr9lhi0SYtyKDqb2Cy43F6V/BhWDuNiFwh+qBkmmqIpTykMDb5X4FQX7csn/2b5i6fxKY58KtSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365334; c=relaxed/simple;
	bh=kcqUSELEK1fBcvieKgJVbovbs3tZCdVizn6UceEEzcM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Koj2FZkYU0f8C+osqDzT5J9GYB2ur1REbmq7EfjYdio/xM72y7vOmpPt7+Nu0A2C2lYZsPiXJkzCka/hMHrPR72XpiZYS31jWbWDQ6w6/DfQxTwOr+eSN7vQ6IquBH0zEml3nhqVL0fsEXeXtRsSNt55REHvNwWPJkPCstCgRCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1AllJ03; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1AllJ03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784365333; x=1815901333;
  h=date:from:to:cc:subject:message-id;
  bh=kcqUSELEK1fBcvieKgJVbovbs3tZCdVizn6UceEEzcM=;
  b=K1AllJ03R8YjGLrZ+MzRZN7Kx+AB46MrsdGFlyh6eJrVVArT2FyA+Ioa
   Iqe/i75bJbyh2W2AN/dO8SjXIaeRV4syT8acg3bouWU5zDegyRak71fmi
   IqNlhwQw0Jh/dxzI/7srTJ+rrkW7s1Ydc520BuKHXfT9jOZBbLmStO+bP
   M/yvQEtEvgg8oHuo8z03SSwQiunX9udztyOGKbHrmL9DgQvgMDE8DtRJc
   kI7fbdpAiWTHuxHcU0ixWerc+ziM34yx2UIGlRHDF4fU3t3Vhss/CI8a8
   Hi+fl/ViF6arZDRETJSBBudorCenPSBP/oZvTB9fFXld8k1xxD9d0VMCt
   w==;
X-CSE-ConnectionGUID: Bc8iQqrGRMqL5VuJx9oLlg==
X-CSE-MsgGUID: Wy5XJQGCTgqij6i6QDHi4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="87563121"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="87563121"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 02:02:12 -0700
X-CSE-ConnectionGUID: M6njTZIVQtS8frDFM65Icw==
X-CSE-MsgGUID: x8P0rNA6TzOu8dpNT5H3sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="250635991"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jul 2026 02:02:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl0vu-00000000Tbf-3wA1;
	Sat, 18 Jul 2026 09:02:07 +0000
Date: Sat, 18 Jul 2026 16:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
 Danilo Krummrich <dakr@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-testing 75/90] ERROR: modpost:
 "of_node_ktype" [drivers/base/test/property-entry-test.ko] undefined!
Message-ID: <202607181651.RnUuV8n6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
head:   25acf039a5dbb40b6865d9392e05be8e713a39f3
commit: 4a9d084962d0f4ab6b261482d157702d83f170fd [75/90] device property: add test cases for fwnode_for_each_child_node()
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607181651.RnUuV8n6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181651.RnUuV8n6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181651.RnUuV8n6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "of_node_ktype" [drivers/base/test/property-entry-test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
