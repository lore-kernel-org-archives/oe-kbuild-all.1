Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F1F390C9E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886694; cv=none; b=qicTcpjcrE88SOKMGZjn+3iJD8hRmAZCnV2+nqCfZv62+ky7n2WxeR/5XpoV6U0O8ngfIW6HC7/DrGw11T09YvWtJrQB7PYqFhn6CtIG7Q/f0neFe3QqPuyzU62lyvTqdOZjP2wQefXIKstXwQSnPdFgI7BYMJJ/cAtH/34+DK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886694; c=relaxed/simple;
	bh=+Ae0GuAYsplPfKEQ8W8fL/Aygm1PTBQoFb6VwHw+YUM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t6/6e8aYrqb2fQ9xMp93pSuam4Wte2peTxAEVCIdlQuy9QEqRhosXUN2232TUnOTXJDu2KuL4IpRNseDVnywzvIk/JL2SFhvcplT1gwRRQGJZ1x9Slo6Zy6AIuSOJEcDZOaq21o4lu006XtQqfMedIE7DGEjN3Kk0b+0VSrk/I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aa8D75XU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aa8D75XU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784886691; x=1816422691;
  h=date:from:to:cc:subject:message-id;
  bh=+Ae0GuAYsplPfKEQ8W8fL/Aygm1PTBQoFb6VwHw+YUM=;
  b=aa8D75XUaL8CHFkbAg1ZxjHMyOwArxVevBluEzozZdVniiX+AO+sr8Zf
   0+PmJ8LBDIrqLJ9z9po9F/0AFHBkJ0h1vOvJZlIAFT5smSFTYUywdp6I4
   0QGn4FdEZO0SUw6DUQ/Am4LlRWK2bV2XRChhRP1eZ4WEPEobCgVsJkwhV
   rGLOJoIlblF24ElB2Y5nf8AKHEsMtYL139b8o38SFAcUuS9BV4mSoN06r
   urVkBWHGzSnhpx1+9eAvA5b6H4xRJDcof5JnAqmQ4k83qPoab5X7denSR
   t42/2E90Zd1jsv+VacJxxzeblf3CHd/Rgu5rBEAViOC1T/yuJB+2Xpsy8
   w==;
X-CSE-ConnectionGUID: +yt5BXYeSGe1NFevTRfotQ==
X-CSE-MsgGUID: GUp2o6i+QzinZlPwAYumTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="97066496"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="97066496"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 02:51:31 -0700
X-CSE-ConnectionGUID: XkLBOMWuQl2H0IwfUWwiPA==
X-CSE-MsgGUID: 2F+8sIWuSdKV7GPnO7ksOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="263646302"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Jul 2026 02:51:29 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnCYx-000000000xK-2xsf;
	Fri, 24 Jul 2026 09:51:27 +0000
Date: Fri, 24 Jul 2026 11:51:10 +0200
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:lazy-bounce 20/23] ld.lld: error: undefined symbol:
 fs_bio_integrity_verify
Message-ID: <202607241137.zDaKsPXC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs lazy-bounce
head:   929a35b173fce4af373ed0e17f7329523fd40bcb
commit: 3c21461b020acab739ebb50d85316d12df319739 [20/23] iomap,xfs: move integrity verification to the file system
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260724/202607241137.zDaKsPXC-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607241137.zDaKsPXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607241137.zDaKsPXC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fs_bio_integrity_verify
   >>> referenced by ioend.c:315 (fs/iomap/ioend.c:315)
   >>>               vmlinux.o:(iomap_ioend_integrity_verify)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
