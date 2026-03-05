Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8049D288B8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691487; cv=none; b=iW0JT4w/ruMZnt0eewHuy6OgFWZC7SkRKkPwPl2DXfKY0DYuc495kfb62X2etBJGcYhfQT7Qo6WJAX9oN3DzFbFr9tPO+jPydRR+rhx1aYLPvv8IdbN9+LVHoGu75/zhuAFbfo9lvyEEPX87SrIs78RbF60iPKjQbMFj21w7W0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691487; c=relaxed/simple;
	bh=7R5ruamHVs0yd+uD+5WWjJbkxg3aOtFJVO/+Oi/FiP8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UKRXoN1Nqh0EjN9GfzgLJBLqB/u3K2JHDw4EG/8f4C4kdAtsrbB46H6u9U6A0yDPkliQh0C2jqV2b2dKFLDfb/NZPbbo4+9GbmPl/Y+LxzXFpxI4gxXxrCBxr1ltWWlfFHXFWo9d6RsWfiyL0JTh3eLFXodPHHQDI+IChVqIZh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPaCf2W9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPaCf2W9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772691485; x=1804227485;
  h=date:from:to:cc:subject:message-id;
  bh=7R5ruamHVs0yd+uD+5WWjJbkxg3aOtFJVO/+Oi/FiP8=;
  b=WPaCf2W969JEJc1MFHsHy769IuMraM8tDIwSnRe0CqaugjT9fy5i4lNz
   AAlZMQHiq9Pu1OeFkkCt7aAbIHSpw3nLeAXnmrKvUbl+LlOYB0mRq8Bsl
   5a4cYC1kf1qk1bHDzEp55BaEVb6nMWnEdAYUZ5zy8qP6N71YmrRyLUsN/
   iFEcSMNRNIVsXwW3CtYqBY9ZXbMk/jwexjs1Kg1ixyXFqMPrwzd/swH4q
   YCrfMEKLBhQa0cLnUlTXzHh1OxJ6NvA8IJSlmFR61b0a66QqI6ZDfqyWC
   fcat8U2JgPtmvFyeM+wYgCQpqrnhzsbODXIykmn2gJW6Jg18D6cPFE5Kf
   A==;
X-CSE-ConnectionGUID: C+jHa0VEQmePT8zC78geEQ==
X-CSE-MsgGUID: mgVcgr3USsyAJGmD/rTyWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77372149"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="77372149"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 22:18:05 -0800
X-CSE-ConnectionGUID: njLJ7u3wRfWAavFdDNZXjA==
X-CSE-MsgGUID: k5L47wOYQ8m9Tj4cHvtX2A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2026 22:18:03 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy225-0000000003l-031r;
	Thu, 05 Mar 2026 06:18:01 +0000
Date: Thu, 05 Mar 2026 14:17:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.12.y 955/955]
 arch/x86/kernel/setup.c:380:8: error: call to undeclared function
 'ima_validate_range'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202603051400.dKjsZMHs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.12.y
head:   c1924e059c728edf4138c6343fafb2c6d234ac35
commit: f8f73bf0f8a57ee9b86792456bd42079bc98c6b7 [955/955] x86/kexec: add a sanity check on previous kernel's ima kexec buffer
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260305/202603051400.dKjsZMHs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051400.dKjsZMHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051400.dKjsZMHs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/setup.c:380:8: error: call to undeclared function 'ima_validate_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     380 |         ret = ima_validate_range(ima_kexec_buffer_phys, ima_kexec_buffer_size);
         |               ^
   1 error generated.


vim +/ima_validate_range +380 arch/x86/kernel/setup.c

   372	
   373	int __init ima_get_kexec_buffer(void **addr, size_t *size)
   374	{
   375		int ret;
   376	
   377		if (!ima_kexec_buffer_size)
   378			return -ENOENT;
   379	
 > 380		ret = ima_validate_range(ima_kexec_buffer_phys, ima_kexec_buffer_size);
   381		if (ret)
   382			return ret;
   383	
   384		*addr = __va(ima_kexec_buffer_phys);
   385		*size = ima_kexec_buffer_size;
   386	
   387		return 0;
   388	}
   389	#endif
   390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
