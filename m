Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8503FB31
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Sep 2025 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758439213; cv=none; b=IQf+QIngnVOQ/Mpkdj2NIe04VebTO3IIKyj+N/mqB7hKUJTIZ7eWN+uCDMr5sZh+392bFz5VIJSpbZzVp0GPIDaIw680KsnUBXP/OAKQ6AP4YtowNCBSmgaGJOMFo7AKNYBm7UADDyNjqHLyH3KHKzHDhU0fBEJQcAUnwUoVWdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758439213; c=relaxed/simple;
	bh=9Znnjnbg5X4bpVszhO/6AC05h1RYJaRJxOQH4DGE4Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DqBIpTusnNxUokn8goHsQW7/ILWivqQfVR1g3NZSwisuaYmAdGXXYjuN1cT9Vl6FP2yuYHgtReHE6WJL5wh486cpMSMss59K43mvf3xXf2DBsPSNlZSN3RnE8681gbLRfWkML/wHcrfOLpJFOhVFw38lLCLiauJmOqBZ4FQP4lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2iTmwG/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2iTmwG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758439211; x=1789975211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Znnjnbg5X4bpVszhO/6AC05h1RYJaRJxOQH4DGE4Xc=;
  b=I2iTmwG/Xnbk/Xd4DYeQsv7fTbeHJo8CrpBMEbdKZHo3JwOcPev3LoHl
   u0WjNoS34qsPxahcIAe9aLPILGqDzqDcH06bR68iRsEppR/3tw3LXSVq9
   LRiaXH+3AJfuxcRxSf313dkZuIxehYq/XRdaZGHgS5PYgADvVtaiLXsJH
   8zXzTdc4QERGthbU1/p3DoxhO7/eciAeP0O0oEMlbyhqw7UYKXgL0u6Oa
   VnrqKIhYQTzK/+mKIeS7sZ3yVTYxeXqKJjEM+/y1ktOuecKAeszZEi/Mn
   iwXgp9GHvusKdFD5/Fji8oEUnLufQsyQbA80oqJTXY9Ddu9HWk3AhU8Lm
   A==;
X-CSE-ConnectionGUID: ifBtmlPOQAeBzG5QltxFDQ==
X-CSE-MsgGUID: JBmmUBgUQ2mdL/J0E2tfYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60789190"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60789190"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 00:20:11 -0700
X-CSE-ConnectionGUID: JXE9Eh6HRVyw3/cOE+8gog==
X-CSE-MsgGUID: o9BU5T+1S5SdUqHKzYV8jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="175341349"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Sep 2025 00:20:10 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0EMh-0000Y5-1z;
	Sun, 21 Sep 2025 07:20:07 +0000
Date: Sun, 21 Sep 2025 15:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/14] fs/binfmt_elf.c:2143:13: error:
 no member named 'min_coredump' in 'struct linux_binfmt'
Message-ID: <202509211544.W5E8EOBz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   8419b8c58fd11c74638c1facb3373aee34497b8a
commit: 58e2fa4ec4b1e15b7c7510bc98befafa31c03f70 [0/14] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-randconfig-061-20250921 (https://download.01.org/0day-ci/archive/20250921/202509211544.W5E8EOBz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211544.W5E8EOBz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509211544.W5E8EOBz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/binfmt_elf.c:2143:13: error: no member named 'min_coredump' in 'struct linux_binfmt'
    2143 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |         ~~~~~~~~~~ ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +2143 fs/binfmt_elf.c

  2140	
  2141	static int __init init_elf_binfmt(void)
  2142	{
> 2143		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2144		register_binfmt(&elf_format);
  2145		return 0;
  2146	}
  2147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
