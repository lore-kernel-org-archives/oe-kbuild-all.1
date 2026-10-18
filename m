Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745A743F0B9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309961; cv=none; b=FqB82kkuBj6EButcF0ap/Urb8e9U0wsGphQY/tP5C/+VX6lgPEAw+pKnGNeS5F4Xm8Tx9sQ9RqYRY+m3J8QPwqZsdFFO1CyV/CxisJbGmC8DnRjvdOBE1eB1iYi+Kvtia0iIy/HQTjPx+2cVNqreCFhyP0pNHfE6fMtbqbh4DpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309961; c=relaxed/simple;
	bh=rKHohQAa/2aI3SzNuQG5WXaXesAEhYkttO+OloGi2UY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a/Fhq19f/Lt/uxYERZMB56M6cH5C0yC2pDxs6NZfthn/kLuLYYYVEQDB/ENZfaTF77NOZlGsJHkSioBEdYT6hC4sW+mIv566i0gza+uY2hAi0/wi4OG59v6jzZ9A03wmZqFOsdSmjF4zYBw6vf2OeWvFd4sDKeO03gO183uFrIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPJ3JH82; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPJ3JH82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309959; x=1823845959;
  h=date:from:to:cc:subject:message-id;
  bh=rKHohQAa/2aI3SzNuQG5WXaXesAEhYkttO+OloGi2UY=;
  b=XPJ3JH82gWebULg5Yp/odNbXBr/YnwV4TkNqBxqaL2ZyJAysT//I63Aq
   0J3wAHa05rXAZiiSWVPupfqgNRtJDX6HcI+pP5c32sIE+g/wQpzs78Z+I
   QBssjU1pKvZzWt7hiVWa0sO3U5yvkGohfrjlqCMZtgmyEnFssgJJeZtJM
   denIEGlOn1MEHSbncGHvkkT08BKRBThAhmDnixsKeF6UVMMCrcb+65ZeD
   Xc/IXm6DjVnii7rRufVkTfgpwPRYvWhbtF6rEfx8XDmLi09SMpzdJrx3T
   IxL6P/+OhaELXZwHuf63PEeUjpqR3CucdCN6sLXY2GoaLPWNvl8C8PNxc
   Q==;
X-CSE-ConnectionGUID: 27ieQTJlToyFUtv/sWeAog==
X-CSE-MsgGUID: 4RJqhFQsR7+4ToO7NnhaSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908848"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908848"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:36 -0700
X-CSE-ConnectionGUID: FwnVlHmtQD21sw6D+N7iLA==
X-CSE-MsgGUID: bxHjqJ+DTLOgwDFjFfwwOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115548"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xN-0CCK;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:46:20 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 18057/18293] undefined reference to
 `fuse_backing_open_64'
Message-ID: <202610171310.uqRzJkIx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
commit: 693a206243f02abdd96f040d19c9c8c12f482e2c [18057/18293] fuse: support 64 bit, server allocated backing ID
config: parisc-randconfig-r2104-20261017 (https://download.01.org/0day-ci/archive/20261017/202610171310.uqRzJkIx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171310.uqRzJkIx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171310.uqRzJkIx-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: fs/fuse/dev.o: in function `fuse_dev_ioctl':
>> (.text+0x3a08): undefined reference to `fuse_backing_open_64'
>> hppa-linux-ld: (.text+0x3bcc): undefined reference to `fuse_backing_open'
>> hppa-linux-ld: (.text+0x3c4c): undefined reference to `fuse_backing_close'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
