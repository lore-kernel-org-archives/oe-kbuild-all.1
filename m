Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCDF49620
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450219; cv=none; b=fDqpF1LyDklScfBZN/CJV2fbh0ScYoJWKjWk9Mve1yldRR0aMb4oM5hnayTXrDRCFqjqWrh0PWnbM6KfO1V8pX00IbmoVEYOo5kFo/dSie2A2qq/VmVJcIr+RJ1f4JistEqkCD37vfkot/ZkFgGGM7OmQAius7VHHEnaGyFLm1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450219; c=relaxed/simple;
	bh=EC+Abz8zfx7NkaC46KdmRbmIyRt4HHCYky+QgeK9ciw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Rz8AmQzInXyGWttVG+o/dhapybdgN/RRZCR9Lq1i/ywzxrekLSF8UrJHFkIMG8TJFA7IJZ2aXSXYi6UfbZP/P+UnE1qHnA06Tjkbj2csVsGBtSjGxGv8r1nJ9jvjBytcRFuPTKpx21tISPj8Qx6TD/pHcHKZkHXjXQNaecPW2Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxlqOu04; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxlqOu04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783450218; x=1814986218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EC+Abz8zfx7NkaC46KdmRbmIyRt4HHCYky+QgeK9ciw=;
  b=VxlqOu041IO3TlAXX8K29QJGCj10DgWt44/f+VrQ1rEfcf8sdUw8Z59K
   HQoSxLmCNyBKqU4P85+josUrmEDiAVH9mXNzN+ahtJArw3j7iABk7Xrj+
   q9f2FlJYtXiW5XKK08wdlAE4M1JjymM7oxNxmDNH4mcKTvLS39Lvna1Fs
   2CYWJFPX/ihja29nzb8uxudFgXDWUruLWiABskMDnKZtnhelkQoCRWiYf
   1S/qeICo32gsTDHMtYq+HVYJXUZXbnqy74kZXtUr+24f09lgeLiGU8XHt
   loBGtz74KelaJUatr5LrM3EfCYnEkSpGfyXb/t4y5VL9Tsr/60vcPSlrj
   A==;
X-CSE-ConnectionGUID: s5ASb4qBRXqeBbba/jqycg==
X-CSE-MsgGUID: FbV+tI0qQ0yauEPTrpNe4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="106906453"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="106906453"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 11:50:17 -0700
X-CSE-ConnectionGUID: mxhoTyRoSa6soyER1cvXxQ==
X-CSE-MsgGUID: e8SiteXbQLeY7ddn2ny0wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="284178939"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Jul 2026 11:50:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whArO-00000000FaH-2Gsr;
	Tue, 07 Jul 2026 18:49:44 +0000
Date: Wed, 08 Jul 2026 02:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sysfs 2/2] tar:
 .tmp_vdso_debug.tar.xz/vdso/: Cannot open: No such file or directory
Message-ID: <202607080233.390hpCW3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-sysfs
head:   8ae6b40fd6f555925afd049732cb12e502f22a4d
commit: 8ae6b40fd6f555925afd049732cb12e502f22a4d [2/2] vDSO, kbuild: Provide debug variants of vDSO at runtime
config: arm-randconfig-r132-20260708 (https://download.01.org/0day-ci/archive/20260708/202607080233.390hpCW3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080233.390hpCW3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080233.390hpCW3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> tar: .tmp_vdso_debug.tar.xz/vdso/: Cannot open: No such file or directory
   tar: Error is not recoverable: exiting now
   make[2]: *** [Makefile:1563: vdso_debug.tar.xz] Error 2
   make[2]: *** Deleting file 'vdso_debug.tar.xz'
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
