Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE4D3DBB2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oK8g6MLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700075606; x=1731611606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UnwaWSnKj21fqbI7LoTqr7zqVIHJgRL+YfEgy/pSXpQ=;
  b=oK8g6MLUYQFrJ1bAzESpbQjowNHadMLFmDgDW1xR5XiOKvuzOqaiTcjk
   g6Gjyzc8JbJfbmHhvvDzVetb+MSdSefxQXbdj1iWmLygZ3qIcI/8qte8h
   yCmYoSFs7FXIhCppaE//OJR/3IR4nrqyVKvih/jjikruDIphIcAzC21NV
   NwNg/XwkaWeZlGf/jx/3YmcCRQ0+DGC7heb1Q7JW1kzzcy1foXjH94Z2D
   HlcbHAm7FKteryLKge50/TYAXFQECEi4zBPPFK6phsv66tTbht3+RgJ0b
   7XZ3hxa8d1uQPnCBWIMy5fnORGxsDfmgwd9aamr4AOLl7toNGJaIoieHK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370288061"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="370288061"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 11:13:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="741519647"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="741519647"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Nov 2023 11:13:23 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3LKC-0000jk-2o;
	Wed, 15 Nov 2023 19:13:20 +0000
Date: Thu, 16 Nov 2023 03:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2023-11 3634/30000]
 drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202311160346.pWKp73p5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10-2023-11
head:   4a17384380d80175aa17dc7d6741e2c0ff2b077b
commit: 3fcbb15c1a91a318fb9367bee24603af24648a2d [3634/30000] ANDROID: android: Create debug_symbols driver
config: x86_64-randconfig-123-20231113 (https://download.01.org/0day-ci/archive/20231116/202311160346.pWKp73p5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160346.pWKp73p5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160346.pWKp73p5-lkp@intel.com/

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
