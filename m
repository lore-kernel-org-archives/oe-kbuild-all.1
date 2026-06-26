Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849C33793BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 16:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492533; cv=none; b=qQj4ph8LWzDfCvLP9+0n/Y8Jqql374L3maKaIG/scdiCjKUcTDvY88/gQRecenuTNZ3MM0QRQUXIpdE4JHXFaP4pTLhbe6NOqWAeZiRJHCytyGcRQvjZ5zhx3bRfKnUGLJUBuBrTnUWc7RyLiHYxYkG3jjDtJBcs6a2pex5ecX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492533; c=relaxed/simple;
	bh=5HNeJmY1Ruk/oBtSv8LTLeRZ9ovsdgIlTowHoUd+PaU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qdk7Gk7VgkspIAx1S5ZKOV8sj9CZ6KoHMfc8CMNDgLSh7B+xhsD5PTL3jXcnl0kNiCTE0KgEXQnMWKLA5s7rB1PWF6iz2JhO6EO09hf4kVdPS3jppeNM6VjfK5tQfwWNhobuYgkStY/9Z9ztn4vvWkLmh2DaF+0T4MKqMVkpw9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Os+zb3oP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Os+zb3oP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782492532; x=1814028532;
  h=date:from:to:cc:subject:message-id;
  bh=5HNeJmY1Ruk/oBtSv8LTLeRZ9ovsdgIlTowHoUd+PaU=;
  b=Os+zb3oPVlbp2JdBoqYYAd5dAPMVWt56nPWx3ZaQtN7gwcXJuZbUvNg4
   AzI6R1t1KRALPR54a8br3bzWo2u7FhF1GrIbbbqWAqojwcsHzMGK4EP0Q
   gHNqU9oJjGlgBY2MHd81xwoaaY5bDe+gzC9fc2Oh00tmzLj6gq8VvcRSB
   Ij0H6YCRjsL7ZojL3U/5MnhNpJEeBUq9T71VTBJSmWWYy6VGabWA82d6G
   f5RvPlv7LRRA7Ra0PTiUV6IJllADExUun05RM4/Vd4MKDtviQbXb9D2q1
   mUaITjYaazB3xUKU6fKVJlEpwQI1kRNBIcRTVj3Or6tBytWTAMHLF0twl
   A==;
X-CSE-ConnectionGUID: QN0MjTo/SA6VTQz59ZPnYw==
X-CSE-MsgGUID: HIgmxW+0TTCWoYxTOsd6Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="83487392"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="83487392"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 09:48:51 -0700
X-CSE-ConnectionGUID: qen/gCflSSyqG4nqXJFe0w==
X-CSE-MsgGUID: 5W3fm5nLRbidbcyTqBjk6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="249692808"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Jun 2026 09:48:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd9jT-000000005G1-0GNz;
	Fri, 26 Jun 2026 16:48:47 +0000
Date: Sat, 27 Jun 2026 00:48:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] arm-linux-gnueabi-ld:
 error: .tmp_vmlinux1.btf.o is already in final BE8 format
Message-ID: <202606270022.auBqM8zY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   912f4481cdde10f8124efa91f26605e5e8175d36
commit: adec6338b04390df174f195944a64857342d4bc2 [2/2] phy: rockchip: fix Kconfig dependency more
config: arm-randconfig-r131-20260626 (https://download.01.org/0day-ci/archive/20260627/202606270022.auBqM8zY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270022.auBqM8zY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270022.auBqM8zY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: error: .tmp_vmlinux1.btf.o is already in final BE8 format
   arm-linux-gnueabi-ld: failed to merge target specific data of file .tmp_vmlinux1.btf.o

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
