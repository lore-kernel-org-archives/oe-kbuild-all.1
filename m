Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FE8BE49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714491392; cv=none; b=Vwc386SvyAu7anBqGbxw9XwO9M9wQr4MePR+W0OyfIMa7hkr35fd7JE5eIb5rD8pN6hTALr8Opv7Wgs5b9nbfAXfSH//qvIUP4ERtR0tp4L4vffP8Z/ZMRDCVje14cKpv5a9yl0AOjm4jOm6DzOwQHripPoUFNowLLRSOGv654Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714491392; c=relaxed/simple;
	bh=/xnt0Xsyy7aavYcdhVvLoR5DXl5bc4ZxYzG82VhuM84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D0iIcsq+Cw5knCS6HrN4UFlzPuzkwXYePQU4zsUF1RGMYsLsEP9jfKMtV53HSHvvL3hPJCmFTrC2qHjKj7deNrJuS1kXBo0MfXXrfu0TS55ud5igLQdkUT2g19CcR81cjkpgrgMKFH57SWmviOgVufGy2te+0euIIGZ/3sIZIec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4/khFyt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4/khFyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714491391; x=1746027391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/xnt0Xsyy7aavYcdhVvLoR5DXl5bc4ZxYzG82VhuM84=;
  b=b4/khFytba3DWlHBrGxYyFqup8PFNBvQMpx5jxkLVQlFZub7sBEW5nYq
   zscUVwD5IHyqM5tAywpcXgGatKvw7Z6A+h/W+TFverISZzpkYBnnVVinX
   p6VY1L4jVR4GHkcFViW2UTS5d3Fdd4iYy9JvIY3xbFa9yFXCGjbz6yg84
   k9a1FrgqyAP3xcjmYEQKGhz30Z84MHp58L6wN7dyxGaAE0/AiLfcuKAHv
   v12CSnp3O2F7JKBSgGelqix4r7vD4RjlYhWK3gU0X0ZY9qH4xiW35NWxX
   xxiYt6bbWfpUr+AGK0nPctNlCCvn7dafqeL+b8X7XvvW3Jm94iyycP6cx
   Q==;
X-CSE-ConnectionGUID: 1YeYIAfCS0m4fSiERKq2Qw==
X-CSE-MsgGUID: khVBvIciSjubQYLs8M6YkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10427090"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10427090"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 08:36:30 -0700
X-CSE-ConnectionGUID: 8V/taisCQlKEmKBHBIfT7g==
X-CSE-MsgGUID: QkiIFAe2R3CwRi2JgqWiaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="57384787"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Apr 2024 08:36:29 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1pWr-0008Gv-28;
	Tue, 30 Apr 2024 15:36:25 +0000
Date: Tue, 30 Apr 2024 23:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 7401/11728]
 drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h:26:10:
 fatal error: linux/mali_kbase_debug_coresight_csf.h: No such file or
 directory
Message-ID: <202404302327.utOHguCZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: c72487fafcbdaddc79c61ac5a119c5d89af807c9 [7401/11728] MGS-7531-2 [#nxp] update the include path
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404302327.utOHguCZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404302327.utOHguCZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404302327.utOHguCZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: drivers/gpu/arm/midgard/platform/imx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/gpu/arm/midgard/platform/imx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: kbuild/src/consumer/drivers/gpu/arm/midgard: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/gpu/arm/midgard/csf/mali_kbase_csf_defs.h:39,
                    from drivers/gpu/arm/midgard/mali_kbase_defs.h:353,
                    from drivers/gpu/arm/midgard/mali_kbase.h:56,
                    from drivers/gpu/arm/midgard/mali_kbase_cache_policy.h:29,
                    from drivers/gpu/arm/midgard/mali_kbase_cache_policy.c:26:
>> drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h:26:10: fatal error: linux/mali_kbase_debug_coresight_csf.h: No such file or directory
      26 | #include <linux/mali_kbase_debug_coresight_csf.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   cc1: warning: drivers/gpu/arm/midgard/platform/imx: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/gpu/arm/midgard/csf/mali_kbase_csf_defs.h:39,
                    from drivers/gpu/arm/midgard/mali_kbase_defs.h:353,
                    from drivers/gpu/arm/midgard/mali_kbase.h:56,
                    from drivers/gpu/arm/midgard/tests/mali_kutf_irq_test/mali_kutf_irq_test_main.c:26:
>> drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h:26:10: fatal error: linux/mali_kbase_debug_coresight_csf.h: No such file or directory
      26 | #include <linux/mali_kbase_debug_coresight_csf.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +26 drivers/gpu/arm/midgard/debug/backend/mali_kbase_debug_coresight_internal_csf.h

d5c5f8c95d8fe5 Shuming Fan 2023-08-07  24  
d5c5f8c95d8fe5 Shuming Fan 2023-08-07  25  #include <mali_kbase.h>
d5c5f8c95d8fe5 Shuming Fan 2023-08-07 @26  #include <linux/mali_kbase_debug_coresight_csf.h>
d5c5f8c95d8fe5 Shuming Fan 2023-08-07  27  

:::::: The code at line 26 was first introduced by commit
:::::: d5c5f8c95d8fe590d3ca321d3d5a04c32f50f11d MGS-7263 VX504X08X-SW-99002-r42p0-01eac0

:::::: TO: Shuming Fan <shuming.fan@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
