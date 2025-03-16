Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A80E567
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Mar 2025 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742114801; cv=none; b=tGkhQCxj7D/+xmv4ImC5yTQwM/ySgenfQpI1EHchw+kV3n/ojM++nVsinwq/osX/5lkCuLdv2EX8MCNqwaYaeBJ5E+bIZB0CtqHGs/U3pe2dBlBqZg+miC/MvWc2j9/pcdWeaZI/6xD3L1hkmvmzz6MJg+aE3GUgQPzLlWrhtQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742114801; c=relaxed/simple;
	bh=xaHEhALNzcSeHnSOYbc3UduHpVmR00T46YuQcPeYWC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TBpQ2WzYGHEEBQs+0q53eKibzNxsguI4bgdTUz07KJwXjFNQHPQqLGuBRGGPJBcSs9SQTA8shoYThS/7KGSjX3RH1wX4YJDTbR3S0rCfmBqQThd9K0NtgrM09Qg7kJUA0NHPtnqBd8zQRGVt3R70bVNzU5x/PcoMFbf4wB/URQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTvoRkIF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTvoRkIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742114800; x=1773650800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xaHEhALNzcSeHnSOYbc3UduHpVmR00T46YuQcPeYWC8=;
  b=BTvoRkIFZv3i+Bw5tHr7NWVkdhAtkQR+m+80LEMiZQFDkRqDbNHHlDDH
   w2VM4HYkIRgeqcxApE82k8rHwWS6AOzAkFq1RwnRme1Xw9F4Ws7DLhCAO
   mG4xbyQhmQ9XUBMl4xrHAJj4zr8t5woFZheT3fRWt+NTCKHPU7y59GQrV
   fEEkCaaQWmqXpABOGLFehWAQ6CMzWzQgtN6E7OeCr+cjFRolcYA9Tl1Oc
   K+ZO9kzDrJvSD06g5zXB+gxVlk5g+lhS4aDP9JtL2HAAvy+jnFjNV5bY8
   J45EfPWtbx0xRX64Wh1hRjwd8JQCTXeUJkvpmLPOERGsWWZz1x3ajn+Um
   w==;
X-CSE-ConnectionGUID: oO36PF7WTFOby4LPEGD0Dw==
X-CSE-MsgGUID: kJMrZjAwTFW4LfFZq2ZkBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43108271"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="43108271"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 01:46:39 -0700
X-CSE-ConnectionGUID: zNoElJxRSuqSkp0AjFbP0g==
X-CSE-MsgGUID: BGOVxtElRL6awsjs/7pawA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="152602667"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Mar 2025 01:46:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttjdk-000Bv9-0K;
	Sun, 16 Mar 2025 08:46:36 +0000
Date: Sun, 16 Mar 2025 16:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to_build 13/15] WARNING: modpost: vmlinux: section
 mismatch in reference: ne_drv_probe+0x78 (section: .text) -> ne_probe1
 (section: .init.text)
Message-ID: <202503161647.pYXZ0xEp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   342285dbd4470b93120d697a37084f742dbb581b
commit: eed3bdb4b86a34c1af67e5384c704767c78ae15e [13/15] ne2000: split out ethernec driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250316/202503161647.pYXZ0xEp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503161647.pYXZ0xEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503161647.pYXZ0xEp-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: ne_drv_probe+0x78 (section: .text) -> ne_probe1 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
