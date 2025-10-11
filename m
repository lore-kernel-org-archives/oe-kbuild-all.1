Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A627A935
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760203279; cv=none; b=FDUKhMtwl3vhUAYC9Zznb2uNCkp0XnVZ6Nr/7I/lDCxBbqnt3wfbNcImS4X735NGpQMC7ecGOgmFl127MtO1vULtF0y5qYEtFdzs8ZZm4d6qeliWqSA57I2SciCc0PKdA4UN2dfaoUaLQihuKZLKVHuX6lmmUf4Fg3jWz51L7J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760203279; c=relaxed/simple;
	bh=XUHPLDy3ahSohjQRyrVVW43zWmk2SKMAdtQCHjA93mo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNTIU4WZjJ3JEySv7UHNu+SRbeojD0137iPdV8fD72APz/aznsFivdkuObMfvq8oiNWnRRxgEHuHPQJYWLZMyQ3p8hBXG5eNUxl43odOw024OBD8gpw9ighCR9y6thI+670Sy1UzmVgt63dTTt9BxrPp2LdrLbqYaAPeD/18aUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHEbq3aj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHEbq3aj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760203278; x=1791739278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XUHPLDy3ahSohjQRyrVVW43zWmk2SKMAdtQCHjA93mo=;
  b=CHEbq3ajxfuhB0Ej1p9oxdXQleU25+evHmtOI4vAHiDHiShWFxVOXJYK
   xuWLhixC9k4OhDI716IGWdJ8Fo+Wg9MHprNLEwwjQYjzD8BE5DhU20g9o
   jNjhFRseJQXAeth6Nbvv5KuMm/ctVdQbWnorvif4iR0ca328vcmhSezDQ
   ZoFyEK7evYkaHBZYNJNDqMMQYXYeB2bncBSBhRBuwKwuZSo4FuJhZNPUc
   52MlOEX3htVeQgjhVvuMkkQiXJIcey+FLLNcDGfj5CqoipQm1u4/zd9Xy
   JAfeEvK0u5Z/2OeHCk5yGL4kpwPMSbYo34UhhudffyB7YZJ9z8YswfRl0
   g==;
X-CSE-ConnectionGUID: dCBLIDPzQyGwCxnhIJEeKg==
X-CSE-MsgGUID: rGtUlaxtSPuiOYZIYc40VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="65017449"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="65017449"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 10:21:18 -0700
X-CSE-ConnectionGUID: UTN5lWA5SiSnuUmkNlICnw==
X-CSE-MsgGUID: JDfQEKL3TlWysw6UVZMuJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="181991376"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Oct 2025 10:21:16 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7dHO-0003tb-2R;
	Sat, 11 Oct 2025 17:21:14 +0000
Date: Sun, 12 Oct 2025 01:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Eric Biggers <ebiggers@kernel.org>
Subject: [ardb:arm64-fpsimd-on-stack-v4 8/21] lib/crc/arm/crc-t10dif.h:22:81:
 error: expected ')' before '{' token
Message-ID: <202510120119.EhaHVPre-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-fpsimd-on-stack-v4
head:   4924331534c3687fd56cd3b5a0c2432cf3c0b4c3
commit: a563dcdce73e7c95ab0bda641dd9fe29c7d70c9e [8/21] lib/crc: Switch ARM and arm64 to 'ksimd' scoped guard API
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251012/202510120119.EhaHVPre-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120119.EhaHVPre-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510120119.EhaHVPre-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/crc/crc-t10dif-main.c:63:
   lib/crc/arm/crc-t10dif.h: In function 'crc_t10dif_arch':
>> lib/crc/arm/crc-t10dif.h:22:81: error: expected ')' before '{' token
      22 |                 if (static_branch_likely(&have_pmull) && likely(may_use_simd()) {
         |                    ~                                                            ^
>> lib/crc/arm/crc-t10dif.h:35:9: error: expected expression before '}' token
      35 |         }
         |         ^


vim +22 lib/crc/arm/crc-t10dif.h

    14	
    15	asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
    16	asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
    17					  u8 out[16]);
    18	
    19	static inline u16 crc_t10dif_arch(u16 crc, const u8 *data, size_t length)
    20	{
    21		if (length >= CRC_T10DIF_PMULL_CHUNK_SIZE) {
  > 22			if (static_branch_likely(&have_pmull) && likely(may_use_simd()) {
    23				scoped_ksimd()
    24					return crc_t10dif_pmull64(crc, data, length);
    25			} else if (length > CRC_T10DIF_PMULL_CHUNK_SIZE &&
    26				   static_branch_likely(&have_neon) &&
    27				   likely(may_use_simd())) {
    28				u8 buf[16] __aligned(16);
    29	
    30				scoped_ksimd()
    31					crc_t10dif_pmull8(crc, data, length, buf);
    32	
    33				return crc_t10dif_generic(0, buf, sizeof(buf));
    34			}
  > 35		}
    36		return crc_t10dif_generic(crc, data, length);
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
