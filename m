Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACBF2E415
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 06:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709189518; cv=none; b=cRV7nKYx7T4s2cTeP+RjrFN5sL/G0mnDRQXgVmUlW2dgKEQdHkcT5XLo+aJha0zyyY9AgaWBXwrqqUOnGyD8G4F2PLPgBEz+waetzLG4sD33S2SzC+nqAQY/gwvM8rBxl5oA4ZhVbsSjXqKKPSMHDa1OSKYcy5+ByIfCTKssDEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709189518; c=relaxed/simple;
	bh=HijMCLHs1uL4uq0BqgfHX+gDkrn9tlo7qZOyqfbsbyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ijUVFDyjEUDq9dqBJ4p9liV5LG1+fLzejUZA9DzBEOdrEBCwlHj7SQJV1xgOAA+Pr7feSwQ8DEJshlHHrC0ZcKOgQOsDMWOlFKa//TdNDFWddeZqyaYIj0XS94NDoTO9CbJ4e7oyTMuXu9D2jK7BJwY1eXKj7bpu2GiOsEvSZUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ex95M/6D; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ex95M/6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709189517; x=1740725517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HijMCLHs1uL4uq0BqgfHX+gDkrn9tlo7qZOyqfbsbyU=;
  b=ex95M/6DpGvdbnHnR/iFDsP3Gy6jdVYQ96xZIjlGIxBZgztLmflnONVo
   2rmm2yKYegAtH2oki7yFrfq8nGGQk10W55GO/0vnkRdZypHDdQnAOq7NU
   3Rifts9i7Fh5ZNIfvJQLFlJpQGj5mykOJ7HL6aSApAnpONZytPf/ilnMO
   TPaMIx75rir2Zd9FSS/jHkZrmElAaTksMbGkvrfWzzVuLrHKCi5NWHWSQ
   mQInKJ8yX1K/WvmXhezQluRlBbzBtHu77xfmqyL+omHkaBULG6IiMVEQX
   rVW178WZ35x2Jj/Ra4o0XqQbvUuLZNMH/a+E6DVvvM1FMtIVJ7BnJnWZo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="29072222"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="29072222"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 22:51:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="8143640"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Feb 2024 22:51:46 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfaFm-000Cip-33;
	Thu, 29 Feb 2024 06:51:04 +0000
Date: Thu, 29 Feb 2024 14:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [linux-next:master 8933/10830]
 arch/riscv/boot/dts/sophgo/sg2042.dtsi:9:10: fatal error:
 dt-bindings/reset/sophgo,sg2042-reset.h: No such file or directory
Message-ID: <202402291433.taqwZ1GP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
commit: 1ce7587e507e1762df1dadc22affcd41376040d5 [8933/10830] riscv: dts: add reset generator for Sophgo SG2042 SoC
config: riscv-randconfig-r061-20240228 (https://download.01.org/0day-ci/archive/20240229/202402291433.taqwZ1GP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402291433.taqwZ1GP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402291433.taqwZ1GP-lkp@intel.com/

Note: the linux-next/master HEAD 20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts:6:
>> arch/riscv/boot/dts/sophgo/sg2042.dtsi:9:10: fatal error: dt-bindings/reset/sophgo,sg2042-reset.h: No such file or directory
       9 | #include <dt-bindings/reset/sophgo,sg2042-reset.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 arch/riscv/boot/dts/sophgo/sg2042.dtsi

     8	
   > 9	#include <dt-bindings/reset/sophgo,sg2042-reset.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
