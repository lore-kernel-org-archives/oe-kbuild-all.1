Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA7C19F489
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678609; cv=none; b=J5dTO16MFyqoi0nft2EvzD2l+S3EmsELWDlwKEWfSUpY2SMNfxgF9uwR6FyeIHuWt4CdDSn+pj1gyAVdO/4fzvPQPI3+huIIXIgst/rQ+fFXIjYGt/0wy9H+KWkZaz8909eAI+byIJ9vzoCZLeFQovkdcAlx54qtEKklRKt5E3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678609; c=relaxed/simple;
	bh=SyuishFG8a4wwKfJsMXIbAaOFHaaS+ouj+RnfIBLbT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o5K1DsF8dG458Bs3xLvLw0ujhuTtRIbdYp6HCj9hqBRVoFUmHDaakZfe+6vL6KnsNUNJxL8RU+Ev7aQqS9V5yQHqQYHVB3YpGwZzeIz7Ict/Y/7GhDEOUD5wL874EH1ZFUNOMoABWftN8IBp19yy7IWBPcmxJ1AkMR+4gVMeVD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzY45f3f; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzY45f3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678606; x=1761214606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SyuishFG8a4wwKfJsMXIbAaOFHaaS+ouj+RnfIBLbT0=;
  b=SzY45f3fv8sNHhMOujuLdOlxWk1W3N5jwY368Ymz53AQQDOfxWuLsYs9
   4KLuthI5ZxjEnLOa4aCvd4SMulhV4ISG+SFcMcwUiHV9XXZzO6ewck5Np
   FUgdngcRGHCtaYzYBmsFMks0tg9831EgHIhfEziozaMd3b5qhOZf0rcTL
   bXKkTEtrQe8xof6fBkqQ9pVkc4UJKzRs9HISEjMfvEsefwaqS6Ai+KfOd
   2p+DZTTYcSawNlKn9AMuYFhPzEQX9M/QKiOfzVxprLDe3qdluViIzDteX
   s3WcpvXh2YDm+WLoZs5O+G6s2iIxTAo4w86Sk4BOoTNWZeKJSHIIRuh02
   A==;
X-CSE-ConnectionGUID: jsbrNweCRDiyz5Goyk5RRA==
X-CSE-MsgGUID: XiNAUEMyQfmrEgulpHp7jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29418142"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29418142"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:16:45 -0700
X-CSE-ConnectionGUID: LlgnhnpAT8CCYHZA+MxQ3w==
X-CSE-MsgGUID: fUpJPINXRfmW5Dev19yNiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80229400"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2024 03:16:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3YPy-000Umi-25;
	Wed, 23 Oct 2024 10:16:42 +0000
Date: Wed, 23 Oct 2024 18:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2024-08 641/30000]
 drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202410231844.jzo32nJs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2024-08
head:   bd674d735f838f966d3a1aff5e3eb8a9ef2ad915
commit: 3fcbb15c1a91a318fb9367bee24603af24648a2d [641/30000] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-r113-20241023 (https://download.01.org/0day-ci/archive/20241023/202410231844.jzo32nJs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231844.jzo32nJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231844.jzo32nJs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +50 drivers/android/debug_symbols.c

    41	
    42	/*
    43	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    44	 */
    45	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    46	#ifdef CONFIG_ARM64
    47		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    48	#endif
    49	#ifdef CONFIG_X86
  > 50		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    51	#endif
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
