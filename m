Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3302A367F3D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 21:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779225145; cv=none; b=fUZIlhMoJ0YpCODr5oOR0VEXeqxlEDzySpttIv7xwGMm0w9fL0AHd4tcQ4z2PxQxNgf0ms5KjQBZx/LLnaXilmrq7MZzVp3Dq62oj8gjlifkG2VwBIE6LYP62Rpg4KdPQy/5BHKr3v/rK5TDztrpv7pUnEN1MAAzLkiVynnkFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779225145; c=relaxed/simple;
	bh=4sTa9Rmb58rBhqYzA2cPgfpQ77zW5uH3PwrrwO9FD60=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HBV/bXWHJR989K8GyizrUjVtyqiShffCiukbkSyNCJ5+gGlqisZYIfkTdz/1ANx2lr2gG5esPWj4a/oHXeOKmXAY5hWdIRq2iGrBFR2LGS/fViK9sPNFq1MAkqdn6KYX9V3XSz++jCETUmQDxj+uUUly3ehae0VTW3V/sZvQgVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSnw0uSj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSnw0uSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779225144; x=1810761144;
  h=date:from:to:cc:subject:message-id;
  bh=4sTa9Rmb58rBhqYzA2cPgfpQ77zW5uH3PwrrwO9FD60=;
  b=iSnw0uSjzddaaNUOFNpzONlSFopJVQM5E3AK9C/GFYOS/Ga1dB+KPRzG
   rtWVGVSPQ+FmOOlj91ykNuVNKtbXY2BJVWgS+DWZgDtf/IQ11flMYTzs3
   MPOnE9TpQOS3/7zqUdED9wS8+Sqk1oaK2PHG0camoK+hUoyKqiK6XjE1z
   nbo2oEkpwkvGPxq3L77gH43EaN2x4ktfs2+JnUiqdT4xY8KOa+tIdIWNK
   iGrloBkiFmZHTOB/2duPiPRC8CNNnYnGtlHJjM3a8ZClh2qA5oxlBkn4T
   n7ZkcfTid9IOTCMZfktc/fet0ZlI6GWFok7Gj64+SdONNTytNWMkUJQVO
   A==;
X-CSE-ConnectionGUID: SO8gfuBGQ0OXmLoRLVGvlA==
X-CSE-MsgGUID: WzVwIE2bS2W2/8+A+aAFSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="82686154"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="82686154"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 14:12:23 -0700
X-CSE-ConnectionGUID: 7XPqu/+IRSuXGsp7Vu0ysg==
X-CSE-MsgGUID: BS3WBdmpTIKc3ZxYmNRRAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243906993"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2026 14:12:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPRjg-00000000AJ1-1y1Y;
	Tue, 19 May 2026 21:12:20 +0000
Date: Tue, 19 May 2026 23:12:03 +0200
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/fpsimd/asm-cleanup 17/18]
 ./arch/arm64/include/asm/fpsimd.h:781:77: error: implicit declaration of
 function 'BUILD_BU'; did you mean 'BUILD_BUG'?
Message-ID: <202605192305.idkpZqQ5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/fpsimd/asm-cleanup
head:   9a625452a16d74ae234b328853e88722a53ba633
commit: eedf6eece9afecf4bf671050632c6b5f3ef8d587 [17/18] WIP: arm64: fpsimd: Move SME save/restore inline
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260519/202605192305.idkpZqQ5-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605192305.idkpZqQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605192305.idkpZqQ5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arm64/include/asm/processor.h:419,
                    from ./include/asm-generic/qrwlock.h:18,
                    from ./arch/arm64/include/generated/asm/qrwlock.h:1,
                    from ./arch/arm64/include/asm/spinlock.h:9,
                    from ./include/linux/spinlock.h:95,
                    from ./include/linux/mmzone.h:8,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/slab.h:17,
                    from ./include/linux/resource_ext.h:11,
                    from ./include/linux/acpi.h:14,
                    from ./include/acpi/apei.h:9,
                    from ./include/acpi/ghes.h:5,
                    from ./include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   ./arch/arm64/include/asm/fpsimd.h: In function 'sme_load_state':
>> ./arch/arm64/include/asm/fpsimd.h:781:77: error: implicit declaration of function 'BUILD_BU'; did you mean 'BUILD_BUG'? [-Wimplicit-function-declaration]
     781 | static inline void sme_load_state(const struct sme_state *state, bool zt) { BUILD_BU(); }
         |                                                                             ^~~~~~~~
         |                                                                             BUILD_BUG


vim +781 ./arch/arm64/include/asm/fpsimd.h

   779	
   780	static inline void sme_save_state(struct sme_state *state, bool zt) { BUILD_BUG(); }
 > 781	static inline void sme_load_state(const struct sme_state *state, bool zt) { BUILD_BU(); }
   782	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
