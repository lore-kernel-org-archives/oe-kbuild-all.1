Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9AF175A7D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 03:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782961684; cv=none; b=Ti0Q/0SCwE+dFaTXrDk+mcwbGWTUkBVaOmn9vCx+iHFzp5FPOG12/ebd/XTgFaNXfNNX2cq0s0XXskU7zPpLtiUGMjozzJ+KjfTH3f9AWFEVrOXPk+uEKtPpQWmG4qk3JKz+u2MLJhXvufGD706a1QnQRU2y5ctWJtV9T3VHj0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782961684; c=relaxed/simple;
	bh=T5B9cnz41vxea6Q5vQ/GCiX96fPhmrcSKdFUXShlJq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fy2JorviLnB/iED9UZSar5pyIpGHT5+EJ5FH5XxzxVtWhjZ9USBVL3TMAp4Z5TmLnoVZl/HmlxwZtLa3PfsZnPu2jg8ne2AG1vpoNQFHbB8blSqukGYpcDj62cK7IsSCkPPAZTafk9HhIVKeqE821ZrRhZlSsMnmMRWU5UdLGOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awW1HVJU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awW1HVJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782961683; x=1814497683;
  h=date:from:to:cc:subject:message-id;
  bh=T5B9cnz41vxea6Q5vQ/GCiX96fPhmrcSKdFUXShlJq0=;
  b=awW1HVJUpyYXWQ8nI7FjBfdXCX3VgwQOedE01tf4R6eEVqTeBjumTZgC
   ACudQqWYkP4/hNrySeggrzRNMQXEH0afBlnSgQay/g7Y5sy9CIf71VKj9
   XRGIpa9ZWUHYxl6zTGnmfTT+UAiWxhl7OEnxhqSXEUwg9u7U1n++fEaHh
   crgIuYIkVuvIqhFr4O9N/jjy2cS7nB2g4m5AZp9ODl63fKQTBLUAotxmJ
   F8bda4CQTm1BqXXNkQ15hvBnAB8q2BFnvEJCHq+F2TY33A/YjOLF2D/Ub
   5xEn71hwbVUTyWKr6L5lnp8lKSWolbaAvY0V+v7ee6HLSXsxwp5V5MLW7
   A==;
X-CSE-ConnectionGUID: VLD5U9UESM2Rov4rxI9ocw==
X-CSE-MsgGUID: WMkW82IvQz6vrabpcFbdFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="101126892"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="101126892"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:08:00 -0700
X-CSE-ConnectionGUID: CzEwK1oKSi+koxfPPXGMXQ==
X-CSE-MsgGUID: tWwEdHKRQIGk13qBdvzzhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251005905"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Jul 2026 20:07:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf7mK-000000009vB-3wNQ;
	Thu, 02 Jul 2026 03:07:54 +0000
Date: Thu, 02 Jul 2026 11:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 0/1]
 fs/proc/task_mmu.c:1858:8: warning: no previous prototype for
 '__pagemap_lseek'
Message-ID: <202607021122.C8sowvZw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   5556e039c32fa02b239611dc8e5ebb958a7f12e1
commit: 0715c0e2078d5e9bf1b2da50fae4a738cd346016 [0/1] ANDROID: 16K: Emulate /proc/pid/pagemap
config: i386-randconfig-003-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021122.C8sowvZw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021122.C8sowvZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021122.C8sowvZw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/task_mmu.c:1858:8: warning: no previous prototype for '__pagemap_lseek' [-Wmissing-prototypes]
    1858 | loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
         |        ^~~~~~~~~~~~~~~


vim +/__pagemap_lseek +1858 fs/proc/task_mmu.c

  1857	
> 1858	loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
  1859	{
  1860		unsigned long nr_subpages = __PAGE_SIZE / PAGE_SIZE;
  1861		loff_t ret;
  1862	
  1863		/*
  1864		 * Userspace thinks the pages are larger than they actually are, so adjust the
  1865		 * offset to compensate.
  1866		 */
  1867		offset *= nr_subpages;
  1868	
  1869		ret = mem_lseek(file, offset, orig);  /* borrow this */
  1870		if (ret < 0)
  1871			return offset;
  1872	
  1873		/* Re-adjust the offset to reflect the larger userspace page size. */
  1874		return ret / nr_subpages;
  1875	}
  1876	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
