Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C5433BBC5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 06:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259325; cv=none; b=T6/TdZUSDSeB3Clzg5qWAZYULh1kGe9R+xN1ndrwSf5KCLjjyHRqfZOL/diTDlAD5UKHOhavCGiIOpDQISMqMiR184MMspbYBrzv9u92vXnGZCzRWZG3C8xbf3PqkSpsW40u0ocbl7WwlAXwlnHW/YmDaiM8OUC1vwndgQ2XAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259325; c=relaxed/simple;
	bh=vLGS329eXWbB1bgH+b5jG+OpRGkuvTiNPetrWQon/3c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sKDgU/4CC6yzKZaEsoJwwZxf4Z4KizOqUeKHPc52b5bhVqaE/QOf6UDsXpuyQbg0sEWFcWq+2rNpSA5xKPQvb8hqxIr2BQxncPX6qAgzJ1/pDUMWw3NcfbN15en5OPhi5w85NEXbsXCt1nHlLyzL/okTlVVkZDDcvRgX4PJZJEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wxc1o/aM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wxc1o/aM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779259322; x=1810795322;
  h=date:from:to:cc:subject:message-id;
  bh=vLGS329eXWbB1bgH+b5jG+OpRGkuvTiNPetrWQon/3c=;
  b=Wxc1o/aMPl4cHTTJ0x5Pu+IjuLnGfrqYrszh+4/gRDVlGCOgpULMIHt6
   G2dGco4W2hc79P3HOUxUQBijlu54uRwAkAqifsYeN80DqZfVgiYEwMbLk
   OS4pkk/xilohfXfBGmDVp8mQGUgNq9W7vP3cg7/Npq5fS1l+rC/FXcwNj
   4sxIRwSCMJP6Wg/lrOk7mCO7zWX9cc+ev+obUAbv00pUkhIUxYgRVy45B
   soHdwy4LC4ToQhARw07K1l0a3vXV4NcrgNJ2+ihStcXrrZdIxlQ1leSC2
   sXNrM4isz5yGz/XRa2wy0NHZ4Tx8b7XTAx5wxx91PN+TKMOqP0VX0RT1K
   g==;
X-CSE-ConnectionGUID: eKZKZ0fIQWuLJ2Py0YKykA==
X-CSE-MsgGUID: t5EQ4py4TEKqpfOhA0iPhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80052815"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80052815"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:41:49 -0700
X-CSE-ConnectionGUID: /VeRSQw2RRCcVN3U78EEuQ==
X-CSE-MsgGUID: 7zjMDgd9QfazH2lgFMkX+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="240304522"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 May 2026 23:41:48 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPacj-000000002f1-1stX;
	Wed, 20 May 2026 06:41:45 +0000
Date: Wed, 20 May 2026 14:41:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 7/8] buffered-io.c:undefined
 reference to `iomap_add_to_ioend'
Message-ID: <202605201441.3FbTatFu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   d78140ae7e41edad8f0971778c7c21a6f3da650c
commit: 30ec00229eecd235b3b6bc15f6fd20bcf9a3670a [7/8] iomap: map writeback ranges with iomap ops
config: x86_64-buildonly-randconfig-006-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201441.3FbTatFu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201441.3FbTatFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201441.3FbTatFu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/iomap/buffered-io.o: in function `iomap_writeback_map':
>> buffered-io.c:(.text+0x306): undefined reference to `iomap_add_to_ioend'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
