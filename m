Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B7A289808
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752746835; cv=none; b=XTwEZjzKc3NZdaWkuSmCCEgnCXufrAu/l76Q5QqhLNY2KPsgpnn1knzwlY8QKCDOzmE9Bw/gd+pCGPJDp/to4PzMb+Yum+6doHvtJ5GZg7SNwqNKRVXNj1UWx/1YW/nQzOYDDOuHcsEytD3j0j87kARQtzAj7MsZ5FPJjcZd/NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752746835; c=relaxed/simple;
	bh=x2DrxX4hHNiUI9m8JnZfbnoIJ9wkxi9hQen7/ZVFQh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FIAaatxQiSQwsycpTPDdmm0vpPPP6jzZwQ6DT+yLHK2ZbIj2r9ARddpmy7LOQCtkDreQiVHUbJIDwhsAIl3D1pp0gvFBnXajqzejVF1Vv04a/xGmgpx70ylQwQmipe76KcY64k+2OgX+3JHELa9OuEaKyhreuND20jUM5fXktqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8l53Ira; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8l53Ira"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752746834; x=1784282834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x2DrxX4hHNiUI9m8JnZfbnoIJ9wkxi9hQen7/ZVFQh0=;
  b=R8l53IrakbUICUkApkRxwvCwCDLX4fsGJTHPpybWQjomoROpbntRaYLA
   AuYMf7SrRIgX9NBqxqSIykE3uB3oRMSMd+SJdIXVS/MPUwYnJwUZwQD9D
   euL863AjmIJyzEY0lQkpVlw3zWd6rZnCaizhINsAprInfbOj8Q+oHMFfZ
   ARAh2+D6CBThg0x7rJxwaX43jKG8Un7ma/pEQlwxEZMeP4G3SE4ipB+ka
   lIOmPj7lYUZudwgXkPKR5gpBQPGQomXTbGQOjCA0cdfI+3HOHgmiw5njK
   2xeEqBFA8AYLC3+pyWYpVTrwriCkjfyMEHAu9/zNmGOAtuDNBX1T83uZc
   Q==;
X-CSE-ConnectionGUID: Ki9mE7YWTCWynQ89Zz2d0A==
X-CSE-MsgGUID: EInRxFTDTVyoep1tXLecSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57628315"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="57628315"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 03:07:13 -0700
X-CSE-ConnectionGUID: bS5gGM07ReSZK/pIJI6aHA==
X-CSE-MsgGUID: N82w3fqlQFyCW463ygZIzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="157558458"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jul 2025 03:07:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucLW9-000DVz-2C;
	Thu, 17 Jul 2025 10:07:09 +0000
Date: Thu, 17 Jul 2025 18:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [palmer:wip-hwprobe 10/10] arch/riscv/kernel/sys_hwprobe.c:534:1:
 warning: no return statement in function returning non-void
Message-ID: <202507171820.DomyM5Hp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git wip-hwprobe
head:   4327171a587ac2af9620f085edb06605ab091884
commit: 4327171a587ac2af9620f085edb06605ab091884 [10/10] WIP
config: riscv-randconfig-001-20250717 (https://download.01.org/0day-ci/archive/20250717/202507171820.DomyM5Hp-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171820.DomyM5Hp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171820.DomyM5Hp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/sys_hwprobe.c: In function 'init_hwprobe_vdso_data':
>> arch/riscv/kernel/sys_hwprobe.c:534:1: warning: no return statement in function returning non-void [-Wreturn-type]
     534 | }
         | ^


vim +534 arch/riscv/kernel/sys_hwprobe.c

   524	
   525	static int __init init_hwprobe_vdso_data(void)
   526	{
   527		struct vdso_arch_data *avd = vdso_k_arch_data;
   528	
   529		/*
   530		 * Prevent the vDSO cached values from being used, as they're not ready
   531		 * yet.
   532		 */
   533		avd->ready = false;
 > 534	}
   535	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
