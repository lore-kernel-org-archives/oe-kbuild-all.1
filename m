Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0714E6BFA3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714032352; cv=none; b=LGjPCkNxQ1djFQ2OP+w2CCoDNRYwt/V6HQjDtHOI5rMDymcEJjsSAR9bagPoTMIZRPKk7uL6QCEigvcWQDA8ws++Yleyt1kY08/WoGwUJ73G6FFp6kyX0pS38YgvAbRCl0IQnCHP17LbFuebI3RyAcTzwXfYNNxNkMEa/TVb2CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714032352; c=relaxed/simple;
	bh=EFpcc71zxv0XxEP4Vjuu8+zl2ZWiC7K0r+DB9bXX+qM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mj7UyIJqetmwIJZ9Hkk/VfLyqthGlGo8sjO12QM4m9ysQIvXdhzuxdrvzMqBUDdzvCe5zUM8JGblfPvMDsJvvWr9W6A6jmhA1xdxLy1nDCfEjs3KtqprNIK/Hz3j9UtnGd9azfuhAdtN2RTaIDFT52s+Uv+mEUzdbobBmUN/R70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVCrLMso; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVCrLMso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714032350; x=1745568350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EFpcc71zxv0XxEP4Vjuu8+zl2ZWiC7K0r+DB9bXX+qM=;
  b=ZVCrLMsoX5TJm0eq/6fuBp8LGj547kQcSkYWCGV11+YWDhD9bz/cPzhp
   cuum7cFkjIM0dS1+cZLc2OPFLycfsqVI8wG/pudbrccBBXnVdssw3Q7ZS
   3IRS6AV0e6m8mTvNU6X1poHOdZ+h7xfdV7pBxVWLFebC28DCVE4Oc5esY
   HJDVDNMS0pQgz1PRTmFM57R8NgO/vC9FcxF8UGlz7rVcPcSmNIpX19QVH
   MQAUBAnJrBFOeX6fo7SdJi3oTqkfTCaAlJ74bH7fhBuqte6O4VoqQt2BE
   uBGypl7Dpa8Rq/LrYXV2EoiIDdYVgFXUywA50CHO8yTGShy5uJn1RLQ+D
   Q==;
X-CSE-ConnectionGUID: /8Sf3xz8R7mkISjN1JzuMw==
X-CSE-MsgGUID: do8QbEQORg20nBP6WXKXJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20851108"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="20851108"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 01:05:49 -0700
X-CSE-ConnectionGUID: l2ke/Am/Rr6HjOsuLoDZFQ==
X-CSE-MsgGUID: /2yh2j14S+aaLVPU2elAoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25607301"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Apr 2024 01:05:49 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzu70-00029e-1S;
	Thu, 25 Apr 2024 08:05:46 +0000
Date: Thu, 25 Apr 2024 16:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 9/10] crypto/fips140-module.c:46:11:
 sparse: sparse: symbol '__initcall_start_marker' was not declared. Should it
 be static?
Message-ID: <202404251509.oIIERzhy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c61278bb705a1891885b578a71656264da61be5b
commit: c6d5a767217ce93403528e99f1a1eb401a26eeb3 [9/10] ANDROID: fips140: add kernel crypto module
config: arm64-randconfig-r112-20240425 (https://download.01.org/0day-ci/archive/20240425/202404251509.oIIERzhy-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce: (https://download.01.org/0day-ci/archive/20240425/202404251509.oIIERzhy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251509.oIIERzhy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/fips140-module.c:46:11: sparse: sparse: symbol '__initcall_start_marker' was not declared. Should it be static?
>> crypto/fips140-module.c:47:11: sparse: sparse: symbol '__initcall_end_marker' was not declared. Should it be static?
>> crypto/fips140-module.c:62:10: sparse: sparse: symbol '__text_start' was not declared. Should it be static?
>> crypto/fips140-module.c:63:10: sparse: sparse: symbol '__rodata_start' was not declared. Should it be static?

vim +/__initcall_start_marker +46 crypto/fips140-module.c

    45	
  > 46	const u32 __initcall_start_marker __section(".initcalls._start");
  > 47	const u32 __initcall_end_marker __section(".initcalls._end");
    48	
    49	const u8 __fips140_text_start __section(".text.._start");
    50	const u8 __fips140_text_end __section(".text.._end");
    51	
    52	const u8 __fips140_rodata_start __section(".rodata.._start");
    53	const u8 __fips140_rodata_end __section(".rodata.._end");
    54	
    55	/*
    56	 * We need this little detour to prevent Clang from detecting out of bounds
    57	 * accesses to __fips140_text_start and __fips140_rodata_start, which only exist
    58	 * to delineate the section, and so their sizes are not relevant to us.
    59	 */
    60	const u32 *__initcall_start = &__initcall_start_marker;
    61	
  > 62	const u8 *__text_start = &__fips140_text_start;
  > 63	const u8 *__rodata_start = &__fips140_rodata_start;
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
