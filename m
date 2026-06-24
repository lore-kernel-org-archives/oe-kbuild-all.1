Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A673E5A01
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335227; cv=none; b=l4WCW2nixLunu4XCivpCCe1tLHHaU8zF81AKNBYoeHQnu71CdzlFhsmqycXkapgyvVWa+8ggPUEH5npQ46vp1fWPrk476NFf74xMgKxdmO1BiEsIyUV+QVlTJO5dIa0ojFKZp31PydGS08PQnShu1GG4+D9BVnQV4QphFLheExY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335227; c=relaxed/simple;
	bh=TGIeY2Asfc4JSekV/5pKke62CPito7eTDLPGTONMyOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WdvuBkjn21KYWsKUI5l18z592ksP+XCfhXk/4xHAzDEry0jMMHRePrheO9MsYDmnTFsCUUkUufLXBIwx2BIDX0G3/H185pKl+OUlfS8ajC+O+o1G2iMXXqaQwynLSxA6qlms+HGF0pX4BDaFcUDWUIIfVFl2+xT2nY1zlp5qYvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3EYRjgM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3EYRjgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782335224; x=1813871224;
  h=date:from:to:cc:subject:message-id;
  bh=TGIeY2Asfc4JSekV/5pKke62CPito7eTDLPGTONMyOI=;
  b=W3EYRjgM35jwl4jDT8wI86UaNOkFpKWkC0hBzjtHk2DI0BuPqPlpzHyT
   tdDr0BEp1Rg5bQteeN2W2qgasws4pMqF5N13XDsP49SdoeY3DfbYdIyw0
   xCEAgieZrUgz6FWQwtk4t/SZJU4Iw2KG3fRVn4zefWYlt7NOxyQ+V4/j4
   ju4SGQwpjupKyM62YbD8FBjPsvomjAmYrps5OdUd9i3ZFXCW8vhxd4KAi
   w8YOyYNvTh3YRL0p+5udl0nsyaSLcTJnv1n+J+yjtO4CEAcqU3173avP2
   OtBY2+C6/MhVP1rKjF8cjyGrjjyofZdffpSvTcuGtGtxsIXJkulxgT0bc
   g==;
X-CSE-ConnectionGUID: mICAWt6MRUevsa/fmMNLJQ==
X-CSE-MsgGUID: J7XY9cq4Q3+q+UwUEGSjIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="100658718"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="100658718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 14:07:04 -0700
X-CSE-ConnectionGUID: +eHKfjZtSGymGucxyExYrA==
X-CSE-MsgGUID: 0KB4f7XMSRidcLuS0LltyQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jun 2026 14:07:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcUnt-000000003fR-0bmf;
	Wed, 24 Jun 2026 21:06:45 +0000
Date: Thu, 25 Jun 2026 05:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:abi-test 13/34]
 arch/arm64/include/asm/compat.h:41:25: error: conflicting types for
 'compat_dev_t'; have 'u16' {aka 'short unsigned int'}
Message-ID: <202606250423.9Z1NcX9e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git abi-test
head:   741e95c4b46803e113402223592189848b0ac9c8
commit: 22a837585b767b81a7f0604a815a07fd9cc627f0 [13/34] arm64: fix compat_dev_t definition
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260625/202606250423.9Z1NcX9e-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250423.9Z1NcX9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250423.9Z1NcX9e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/stat.h:13,
                    from include/linux/stat.h:6,
                    from include/linux/sysfs.h:22,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/acpi.h:15,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
>> arch/arm64/include/asm/compat.h:41:25: error: conflicting types for 'compat_dev_t'; have 'u16' {aka 'short unsigned int'}
      41 | #define compat_dev_t    compat_dev_t
         |                         ^~~~~~~~~~~~
   arch/arm64/include/asm/compat.h:42:25: note: in expansion of macro 'compat_dev_t'
      42 | typedef u16             compat_dev_t;
         |                         ^~~~~~~~~~~~
   In file included from arch/arm64/include/asm/compat.h:20:
   include/asm-generic/compat.h:80:13: note: previous declaration of 'compat_dev_t' with type 'compat_dev_t' {aka 'unsigned int'}
      80 | typedef u32 compat_dev_t;
         |             ^~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +41 arch/arm64/include/asm/compat.h

    40	
  > 41	#define compat_dev_t    compat_dev_t
    42	typedef u16             compat_dev_t;
    43	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
