Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5E43E6DDB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 21:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779225713; cv=none; b=V6ZgwHvaV48CSq4VG6icnqK/uxxVxFArT4Ht/NEmKEMnNZCMG4OzWqHhayJBSJXLHwzPL7eCIt7Kf/fBfjX88nDints6Lq4PR3YGdz6vNuS/HNmT/irnD7K03Pu+9aMSiKgPM28JYIi938Atq0uIH4U0G5iWnpVQy8tkTPI59gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779225713; c=relaxed/simple;
	bh=9G8/N2pjUnCdMM5HaOqy8mvR5lUq026+W/hKA/gFTOk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aawUe6xZMkWFjRxv8ak4KFFWPqc2f+xjfHsO1E+4XfpT84t9BI2LcH9r3OUbDdJ7xXPLh1FfTlbgDqUmmum6qShtP+K05iUglxMOrc/SFDkXOiHrTunWhQIISPIwUzX4PHCbmzubjuYVnEAm43k90W0wxoSKXPzAdt7QCY+Uwfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TU5PZ5TB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TU5PZ5TB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779225712; x=1810761712;
  h=date:from:to:cc:subject:message-id;
  bh=9G8/N2pjUnCdMM5HaOqy8mvR5lUq026+W/hKA/gFTOk=;
  b=TU5PZ5TBNsHAEox2JXoQmz44+CbmFd4LHqqX98ldeOSk0m+M4DFSVI8s
   ESbk1wyygh10tb0fq5IxMbhfC3Qpk67hc++CL7gjcsbG7kqWknJ2N5RSD
   RqYfESFmp+kxBQ5fJsT/5wZkjhCCNqST3SadYmEROu4q0wOkK1Sv7FvLl
   NfvhbhtNFZgoxhcQSHC3hPU8fg7nRltcFqw6jQBBkjjXi+46M+I6c3n+g
   +9cO2aEqT4LrOx2lKtgTK+WvLyT1cnCEuCOxQ3B4FedH3eBQBjrzQHKBN
   ytkJfhv9sR0awXg2qMMKsP6OkLdyJSm3Rzq/4wCpyoPmKMFDHDRI7RE+h
   Q==;
X-CSE-ConnectionGUID: 1WImAFg0SrS4/6inoVXiXg==
X-CSE-MsgGUID: 8V8Qft6TRaiu5SgeeT/saA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="82686954"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="82686954"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 14:21:51 -0700
X-CSE-ConnectionGUID: ubE0eSTVSfe3Z2uqmhauWA==
X-CSE-MsgGUID: QOFKcCjXSsae96g/TgSypA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237284257"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 May 2026 14:21:50 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPRsL-000000001vp-0kJO;
	Tue, 19 May 2026 21:21:25 +0000
Date: Wed, 20 May 2026 05:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/fpsimd/asm-cleanup 17/18]
 arch/arm64/include/asm/fpsimd.h:781:77: error: implicit declaration of
 function 'BUILD_BU'; did you mean 'BUILD_BUG'?
Message-ID: <202605200548.fBu8X2Co-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/fpsimd/asm-cleanup
head:   9a625452a16d74ae234b328853e88722a53ba633
commit: eedf6eece9afecf4bf671050632c6b5f3ef8d587 [17/18] WIP: arm64: fpsimd: Move SME save/restore inline
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260520/202605200548.fBu8X2Co-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200548.fBu8X2Co-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200548.fBu8X2Co-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/processor.h:419,
                    from include/asm-generic/qrwlock.h:18,
                    from ./arch/arm64/include/generated/asm/qrwlock.h:1,
                    from arch/arm64/include/asm/spinlock.h:9,
                    from include/linux/spinlock.h:95,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:17,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   arch/arm64/include/asm/fpsimd.h: In function 'sme_load_state':
>> arch/arm64/include/asm/fpsimd.h:781:77: error: implicit declaration of function 'BUILD_BU'; did you mean 'BUILD_BUG'? [-Wimplicit-function-declaration]
     781 | static inline void sme_load_state(const struct sme_state *state, bool zt) { BUILD_BU(); }
         |                                                                             ^~~~~~~~
         |                                                                             BUILD_BUG
   make[3]: *** [scripts/Makefile.build:184: arch/arm64/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1373: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +781 arch/arm64/include/asm/fpsimd.h

   779	
   780	static inline void sme_save_state(struct sme_state *state, bool zt) { BUILD_BUG(); }
 > 781	static inline void sme_load_state(const struct sme_state *state, bool zt) { BUILD_BU(); }
   782	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
