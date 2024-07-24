Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEA66CDC0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 07:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721805253; cv=none; b=qw7ECICcuECOO4ge56UbnR9nF70wda8LS1s5mtlj68THSEebB3pvnVl2qgMc3f7DvN9VC8nTX0R+ThgSda0V+ukIy1x9vbM1kUFpbXnqV3DL1pB3/pgD8j3sfIYU1bkWfL2K8bEu24kLLyLeJB1qCu86TF4lHfJQO0zg0m9iACU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721805253; c=relaxed/simple;
	bh=UO8XnQGYLOmIGVY65DRoSkqoiqnTn6fowJhC2Q22kj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxvvSYvBEyDI1IE/Qvpvno54f6KZBLTrsm1Bq9XUb+kDFJ+dvhrTt3FAfHgUcpnlL7oZju4TGg/0NQohKQGIPUvda52DTOQpvyO+COFCZP+EkXvmRuEFahQz+52NYLYc1oBiHJYgz4aYzcAZEkrpatx5em4PhtrqXZJD0ox7T04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LdnWL0Qb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LdnWL0Qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721805252; x=1753341252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UO8XnQGYLOmIGVY65DRoSkqoiqnTn6fowJhC2Q22kj8=;
  b=LdnWL0QbMBZUzTUu2BG3eB5eoLWYfoCE9ymErIH+O4s6f5gdShVErorl
   4HTLzbK/S61TyuE3rOqmDnuQXvLDyfiP9zH8qzKivu5X3XCVEbTjZJaod
   3QP6HNopbfLWlzhZEFPZPlbNmv7mR97zSM8E6N9TiKFUq/nY9ynwnhERC
   H9kgYy5wuxGF9bBH3Xpw25Eens5u2WN7+6/EZZsyXALuvNz/jZwXjpBhO
   5Ex1ZHzmVsA2e2K5+d1l1mHyws2xJRmyZMHFWC2O33dVXVmJkdfJhppnw
   GU5Beph9Nq30+cmqEg6OGgqkC4eexd0CalUhNo8xLwVnhL+gA1kYddEwG
   g==;
X-CSE-ConnectionGUID: VNXPCc2jTCe0KXVaI7id4g==
X-CSE-MsgGUID: 7oUVJ7sfTw2tpUjlQOEDiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30849129"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="30849129"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 00:14:12 -0700
X-CSE-ConnectionGUID: 9g4WNudnT2a9A4lvDnmxKA==
X-CSE-MsgGUID: Fd4XJ6qUTxqpJ0+Y0HQGdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="89958199"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jul 2024 00:14:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWWCN-000mlc-1i;
	Wed, 24 Jul 2024 07:14:07 +0000
Date: Wed, 24 Jul 2024 15:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>
Subject: [linux-next:master 13398/13762]
 arch/riscv/kernel/vendor_extensions/andes.c:11:33: sparse: sparse: symbol
 'riscv_isa_vendor_ext_andes' was not declared. Should it be static?
Message-ID: <202407241530.ej5SVgX1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ec6ec93f2c1e6cd2911e2a4acd5ac85e13bb3e2
commit: 23c996fc2bc1978a02c64eddb90b4ab5d309c8df [13398/13762] riscv: Extend cpufeature.c to detect vendor extensions
config: riscv-randconfig-r123-20240724 (https://download.01.org/0day-ci/archive/20240724/202407241530.ej5SVgX1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240724/202407241530.ej5SVgX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241530.ej5SVgX1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/vendor_extensions/andes.c:11:33: sparse: sparse: symbol 'riscv_isa_vendor_ext_andes' was not declared. Should it be static?

vim +/riscv_isa_vendor_ext_andes +11 arch/riscv/kernel/vendor_extensions/andes.c

     9	
    10	/* All Andes vendor extensions supported in Linux */
  > 11	const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[] = {
    12		__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_VENDOR_EXT_XANDESPMU),
    13	};
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
