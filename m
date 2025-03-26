Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03FC33F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742974449; cv=none; b=oVxrOBiX/F+8/rvVbdtNeU9g/yGi0eODnEIS8wsAfHocpc5ktmvKzLbrctg2cfOYIUDgJP9fPwFV3HqRLBFX17liQwHlVPIzgq1lfUcogYa5KK7oFtTdQYFmCTFQrmWvF5R2y9HwFRg5/Z2c9sX5ztQIjDxxFsBRDE6WVxj4W2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742974449; c=relaxed/simple;
	bh=lh5mk7hqpaty/xF9Gz1roPB7CtqXO2cVURp7JCi2g+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WtU0aYgY+OwqD1dTgjBSKKJ2Kc+fmcM7LZM8rdpmjV81pZJA/AiDraEkPctYm6P8T0dijYZY2fT0b3fk3hbBDIVEJcRgCv+Y0agAEvS1MWNgcDgO1hpsYaFuVvumxGVagNSVD2Izx7D/u1qk+usHcT8k95Y+KetM5Puwqk2oRyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpPDS4ss; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpPDS4ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742974447; x=1774510447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lh5mk7hqpaty/xF9Gz1roPB7CtqXO2cVURp7JCi2g+I=;
  b=IpPDS4ssJulDWZGF8k9f6jbT/k+SVsoOUI4mss+iA3cWAuMMKufvZFEw
   1kUeJvlvH1ummBkuwSFI5EJe6UUuKgwzQx4XKWQ4peGqVAte1yp1LCCRv
   D+su8cag1J59Fr2lyjN2lyUEqfZtAmjxTYQ4hrRq6ejzWn4BDTJN/CD6m
   wvTVTqJAY5pIll32EHDABa+AV6uKmzY7/BVJ3yw6l9Xf3vaY74EwgO+x9
   8J2Wy7WvcQITtOr+yLELjzh6YYBYwi2lK83/7QnEs0JjRpNZzYcyaH6rX
   176ADbbL1MgH1GL9GFa7Vhc1W/Lg03sorkuXdoxPzzOAB/K2LK/LlQ2a5
   w==;
X-CSE-ConnectionGUID: oYdUT9KwSsmlpSv0pk0AQA==
X-CSE-MsgGUID: Hu27r6kCQc25eFnDUsS45Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44367968"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="44367968"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 00:34:06 -0700
X-CSE-ConnectionGUID: jRVlxOS3RO+cFDtLIuJwzg==
X-CSE-MsgGUID: QPh/WuRiQSap5hyAauu4UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="129789728"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Mar 2025 00:34:06 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txLH1-0005Xh-1j;
	Wed, 26 Mar 2025 07:34:03 +0000
Date: Wed, 26 Mar 2025 15:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 32/32] make[3]: *** No rule to make
 target 'sched_ext_clean'.
Message-ID: <202503261556.6UQuB3mg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   1355a80cc32f9ae2fdcf9aefa7c97c6eee9149a9
commit: 2e953dfef122e371d4ab9778ad628e9a18c78827 [32/32] sched_ext: Add scx_simple and scx_example_qmap example schedulers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250326/202503261556.6UQuB3mg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503261556.6UQuB3mg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503261556.6UQuB3mg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'sched_ext_clean'.
   make[2]: *** [Makefile:1354: sched_ext] Error 2
   make[2]: Target 'distclean' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.
--
>> make[3]: *** No rule to make target 'sched_ext_clean'.
   make[2]: *** [/kbuild/src/consumer/Makefile:1354: sched_ext] Error 2
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/consumer/Makefile:234: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
