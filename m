Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4F8F5A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 07:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691046435; x=1722582435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OrWUgDJhXR79c9Gps3i7kx3sYVObaXX/y0mhSqVuxFw=;
  b=HYhEuvuhC3bbMKwauf/imHSd66BtBcLz1EX0elmurSSl4AozMKoViKPV
   9XcyZV9AWFekFhtFKtgGelsIECsr1wr1voXlBfSMj7oAoY+DKf4O0mPPm
   /LriDV3pjRYG2JknKKMmQ8kr/lkoeeyDa7zgsEGW1K6u+44AlACs1ah+T
   HJiLL9IAgf8ojfgZuSqhrvXrdkSgWrw0sTOFz8TK6zgjOf22B5nkb+uoj
   VQH5WRsxzzFU7cto3LDBy0IjKvpRyZ1r/9Ky3xJYKcEfyhLZ7fiCJS7rJ
   sEkiJ2UJG7aB8rp+t6Bx5+Bkcp6RbZxjYCrr4v5qgg/C6dWB0V0ffIkga
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="354703376"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="354703376"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 00:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794882331"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="794882331"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2023 00:06:59 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRSQE-0001qZ-2O;
	Thu, 03 Aug 2023 07:06:58 +0000
Date: Thu, 3 Aug 2023 15:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/core 15/17]
 arch/x86/include/asm/cpu_device_id.h:161:46: error:
 'INTEL_FAM6_SIERRAFOREST_X' undeclared here (not in a function); did you
 mean 'INTEL_FAM6_BROADWELL_X'?
Message-ID: <202308031423.d3xaT2ch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   322e3d171eb9e48484a86fc187e26132f063e5c4
commit: 271f9a993c86023cf4dfd331e7a6d3e7a8f8bdeb [15/17] x86/cpu: Fix Crestmont uarch
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230803/202308031423.d3xaT2ch-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031423.d3xaT2ch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031423.d3xaT2ch-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/x86/intel/speed_select_if/isst_if_common.c:22:
>> arch/x86/include/asm/cpu_device_id.h:161:46: error: 'INTEL_FAM6_SIERRAFOREST_X' undeclared here (not in a function); did you mean 'INTEL_FAM6_BROADWELL_X'?
     161 |         X86_MATCH_VENDOR_FAM_MODEL(INTEL, 6, INTEL_FAM6_##model, data)
         |                                              ^~~~~~~~~~~
   arch/x86/include/asm/cpu_device_id.h:46:27: note: in definition of macro 'X86_MATCH_VENDOR_FAM_MODEL_STEPPINGS_FEATURE'
      46 |         .model          = _model,                                       \
         |                           ^~~~~~
   arch/x86/include/asm/cpu_device_id.h:129:9: note: in expansion of macro 'X86_MATCH_VENDOR_FAM_MODEL_FEATURE'
     129 |         X86_MATCH_VENDOR_FAM_MODEL_FEATURE(vendor, family, model,       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cpu_device_id.h:161:9: note: in expansion of macro 'X86_MATCH_VENDOR_FAM_MODEL'
     161 |         X86_MATCH_VENDOR_FAM_MODEL(INTEL, 6, INTEL_FAM6_##model, data)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/intel/speed_select_if/isst_if_common.c:723:9: note: in expansion of macro 'X86_MATCH_INTEL_FAM6_MODEL'
     723 |         X86_MATCH_INTEL_FAM6_MODEL(SIERRAFOREST_X,      NULL),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +161 arch/x86/include/asm/cpu_device_id.h

ba5bade4cc0d20 Thomas Gleixner 2020-03-20   51  
e9d7144597b10f Mark Gross      2020-04-16   52  /**
e9d7144597b10f Mark Gross      2020-04-16   53   * X86_MATCH_VENDOR_FAM_MODEL_FEATURE - Macro for CPU matching
e9d7144597b10f Mark Gross      2020-04-16   54   * @_vendor:	The vendor name, e.g. INTEL, AMD, HYGON, ..., ANY
e9d7144597b10f Mark Gross      2020-04-16   55   *		The name is expanded to X86_VENDOR_@_vendor
e9d7144597b10f Mark Gross      2020-04-16   56   * @_family:	The family number or X86_FAMILY_ANY
e9d7144597b10f Mark Gross      2020-04-16   57   * @_model:	The model number, model constant or X86_MODEL_ANY
e9d7144597b10f Mark Gross      2020-04-16   58   * @_feature:	A X86_FEATURE bit or X86_FEATURE_ANY
e9d7144597b10f Mark Gross      2020-04-16   59   * @_data:	Driver specific data or NULL. The internal storage
e9d7144597b10f Mark Gross      2020-04-16   60   *		format is unsigned long. The supplied value, pointer
e9d7144597b10f Mark Gross      2020-04-16   61   *		etc. is casted to unsigned long internally.
e9d7144597b10f Mark Gross      2020-04-16   62   *
e9d7144597b10f Mark Gross      2020-04-16   63   * The steppings arguments of X86_MATCH_VENDOR_FAM_MODEL_STEPPINGS_FEATURE() is
e9d7144597b10f Mark Gross      2020-04-16   64   * set to wildcards.
e9d7144597b10f Mark Gross      2020-04-16   65   */
e9d7144597b10f Mark Gross      2020-04-16   66  #define X86_MATCH_VENDOR_FAM_MODEL_FEATURE(vendor, family, model, feature, data) \
e9d7144597b10f Mark Gross      2020-04-16   67  	X86_MATCH_VENDOR_FAM_MODEL_STEPPINGS_FEATURE(vendor, family, model, \
e9d7144597b10f Mark Gross      2020-04-16   68  						X86_STEPPING_ANY, feature, data)
e9d7144597b10f Mark Gross      2020-04-16   69  
20d437447c0089 Thomas Gleixner 2020-03-20   70  /**
20d437447c0089 Thomas Gleixner 2020-03-20   71   * X86_MATCH_VENDOR_FAM_FEATURE - Macro for matching vendor, family and CPU feature
20d437447c0089 Thomas Gleixner 2020-03-20   72   * @vendor:	The vendor name, e.g. INTEL, AMD, HYGON, ..., ANY
20d437447c0089 Thomas Gleixner 2020-03-20   73   *		The name is expanded to X86_VENDOR_@vendor
20d437447c0089 Thomas Gleixner 2020-03-20   74   * @family:	The family number or X86_FAMILY_ANY
20d437447c0089 Thomas Gleixner 2020-03-20   75   * @feature:	A X86_FEATURE bit
20d437447c0089 Thomas Gleixner 2020-03-20   76   * @data:	Driver specific data or NULL. The internal storage
20d437447c0089 Thomas Gleixner 2020-03-20   77   *		format is unsigned long. The supplied value, pointer
20d437447c0089 Thomas Gleixner 2020-03-20   78   *		etc. is casted to unsigned long internally.
20d437447c0089 Thomas Gleixner 2020-03-20   79   *
20d437447c0089 Thomas Gleixner 2020-03-20   80   * All other missing arguments of X86_MATCH_VENDOR_FAM_MODEL_FEATURE() are
20d437447c0089 Thomas Gleixner 2020-03-20   81   * set to wildcards.
20d437447c0089 Thomas Gleixner 2020-03-20   82   */
20d437447c0089 Thomas Gleixner 2020-03-20   83  #define X86_MATCH_VENDOR_FAM_FEATURE(vendor, family, feature, data)	\
20d437447c0089 Thomas Gleixner 2020-03-20   84  	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(vendor, family,		\
20d437447c0089 Thomas Gleixner 2020-03-20   85  					   X86_MODEL_ANY, feature, data)
20d437447c0089 Thomas Gleixner 2020-03-20   86  
20d437447c0089 Thomas Gleixner 2020-03-20   87  /**
20d437447c0089 Thomas Gleixner 2020-03-20   88   * X86_MATCH_VENDOR_FEATURE - Macro for matching vendor and CPU feature
20d437447c0089 Thomas Gleixner 2020-03-20   89   * @vendor:	The vendor name, e.g. INTEL, AMD, HYGON, ..., ANY
20d437447c0089 Thomas Gleixner 2020-03-20   90   *		The name is expanded to X86_VENDOR_@vendor
20d437447c0089 Thomas Gleixner 2020-03-20   91   * @feature:	A X86_FEATURE bit
20d437447c0089 Thomas Gleixner 2020-03-20   92   * @data:	Driver specific data or NULL. The internal storage
20d437447c0089 Thomas Gleixner 2020-03-20   93   *		format is unsigned long. The supplied value, pointer
20d437447c0089 Thomas Gleixner 2020-03-20   94   *		etc. is casted to unsigned long internally.
20d437447c0089 Thomas Gleixner 2020-03-20   95   *
20d437447c0089 Thomas Gleixner 2020-03-20   96   * All other missing arguments of X86_MATCH_VENDOR_FAM_MODEL_FEATURE() are
20d437447c0089 Thomas Gleixner 2020-03-20   97   * set to wildcards.
20d437447c0089 Thomas Gleixner 2020-03-20   98   */
20d437447c0089 Thomas Gleixner 2020-03-20   99  #define X86_MATCH_VENDOR_FEATURE(vendor, feature, data)			\
20d437447c0089 Thomas Gleixner 2020-03-20  100  	X86_MATCH_VENDOR_FAM_FEATURE(vendor, X86_FAMILY_ANY, feature, data)
20d437447c0089 Thomas Gleixner 2020-03-20  101  
20d437447c0089 Thomas Gleixner 2020-03-20  102  /**
20d437447c0089 Thomas Gleixner 2020-03-20  103   * X86_MATCH_FEATURE - Macro for matching a CPU feature
20d437447c0089 Thomas Gleixner 2020-03-20  104   * @feature:	A X86_FEATURE bit
20d437447c0089 Thomas Gleixner 2020-03-20  105   * @data:	Driver specific data or NULL. The internal storage
20d437447c0089 Thomas Gleixner 2020-03-20  106   *		format is unsigned long. The supplied value, pointer
20d437447c0089 Thomas Gleixner 2020-03-20  107   *		etc. is casted to unsigned long internally.
20d437447c0089 Thomas Gleixner 2020-03-20  108   *
20d437447c0089 Thomas Gleixner 2020-03-20  109   * All other missing arguments of X86_MATCH_VENDOR_FAM_MODEL_FEATURE() are
20d437447c0089 Thomas Gleixner 2020-03-20  110   * set to wildcards.
20d437447c0089 Thomas Gleixner 2020-03-20  111   */
20d437447c0089 Thomas Gleixner 2020-03-20  112  #define X86_MATCH_FEATURE(feature, data)				\
20d437447c0089 Thomas Gleixner 2020-03-20  113  	X86_MATCH_VENDOR_FEATURE(ANY, feature, data)
20d437447c0089 Thomas Gleixner 2020-03-20  114  
20d437447c0089 Thomas Gleixner 2020-03-20  115  /**
20d437447c0089 Thomas Gleixner 2020-03-20  116   * X86_MATCH_VENDOR_FAM_MODEL - Match vendor, family and model
20d437447c0089 Thomas Gleixner 2020-03-20  117   * @vendor:	The vendor name, e.g. INTEL, AMD, HYGON, ..., ANY
20d437447c0089 Thomas Gleixner 2020-03-20  118   *		The name is expanded to X86_VENDOR_@vendor
20d437447c0089 Thomas Gleixner 2020-03-20  119   * @family:	The family number or X86_FAMILY_ANY
20d437447c0089 Thomas Gleixner 2020-03-20  120   * @model:	The model number, model constant or X86_MODEL_ANY
20d437447c0089 Thomas Gleixner 2020-03-20  121   * @data:	Driver specific data or NULL. The internal storage
20d437447c0089 Thomas Gleixner 2020-03-20  122   *		format is unsigned long. The supplied value, pointer
20d437447c0089 Thomas Gleixner 2020-03-20  123   *		etc. is casted to unsigned long internally.
20d437447c0089 Thomas Gleixner 2020-03-20  124   *
20d437447c0089 Thomas Gleixner 2020-03-20  125   * All other missing arguments of X86_MATCH_VENDOR_FAM_MODEL_FEATURE() are
20d437447c0089 Thomas Gleixner 2020-03-20  126   * set to wildcards.
20d437447c0089 Thomas Gleixner 2020-03-20  127   */
20d437447c0089 Thomas Gleixner 2020-03-20  128  #define X86_MATCH_VENDOR_FAM_MODEL(vendor, family, model, data)		\
20d437447c0089 Thomas Gleixner 2020-03-20  129  	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(vendor, family, model,	\
20d437447c0089 Thomas Gleixner 2020-03-20  130  					   X86_FEATURE_ANY, data)
20d437447c0089 Thomas Gleixner 2020-03-20  131  
20d437447c0089 Thomas Gleixner 2020-03-20  132  /**
20d437447c0089 Thomas Gleixner 2020-03-20  133   * X86_MATCH_VENDOR_FAM - Match vendor and family
20d437447c0089 Thomas Gleixner 2020-03-20  134   * @vendor:	The vendor name, e.g. INTEL, AMD, HYGON, ..., ANY
20d437447c0089 Thomas Gleixner 2020-03-20  135   *		The name is expanded to X86_VENDOR_@vendor
20d437447c0089 Thomas Gleixner 2020-03-20  136   * @family:	The family number or X86_FAMILY_ANY
20d437447c0089 Thomas Gleixner 2020-03-20  137   * @data:	Driver specific data or NULL. The internal storage
20d437447c0089 Thomas Gleixner 2020-03-20  138   *		format is unsigned long. The supplied value, pointer
20d437447c0089 Thomas Gleixner 2020-03-20  139   *		etc. is casted to unsigned long internally.
20d437447c0089 Thomas Gleixner 2020-03-20  140   *
20d437447c0089 Thomas Gleixner 2020-03-20  141   * All other missing arguments to X86_MATCH_VENDOR_FAM_MODEL_FEATURE() are
20d437447c0089 Thomas Gleixner 2020-03-20  142   * set of wildcards.
20d437447c0089 Thomas Gleixner 2020-03-20  143   */
20d437447c0089 Thomas Gleixner 2020-03-20  144  #define X86_MATCH_VENDOR_FAM(vendor, family, data)			\
20d437447c0089 Thomas Gleixner 2020-03-20  145  	X86_MATCH_VENDOR_FAM_MODEL(vendor, family, X86_MODEL_ANY, data)
20d437447c0089 Thomas Gleixner 2020-03-20  146  
20d437447c0089 Thomas Gleixner 2020-03-20  147  /**
20d437447c0089 Thomas Gleixner 2020-03-20  148   * X86_MATCH_INTEL_FAM6_MODEL - Match vendor INTEL, family 6 and model
20d437447c0089 Thomas Gleixner 2020-03-20  149   * @model:	The model name without the INTEL_FAM6_ prefix or ANY
20d437447c0089 Thomas Gleixner 2020-03-20  150   *		The model name is expanded to INTEL_FAM6_@model internally
20d437447c0089 Thomas Gleixner 2020-03-20  151   * @data:	Driver specific data or NULL. The internal storage
20d437447c0089 Thomas Gleixner 2020-03-20  152   *		format is unsigned long. The supplied value, pointer
20d437447c0089 Thomas Gleixner 2020-03-20  153   *		etc. is casted to unsigned long internally.
20d437447c0089 Thomas Gleixner 2020-03-20  154   *
20d437447c0089 Thomas Gleixner 2020-03-20  155   * The vendor is set to INTEL, the family to 6 and all other missing
20d437447c0089 Thomas Gleixner 2020-03-20  156   * arguments of X86_MATCH_VENDOR_FAM_MODEL_FEATURE() are set to wildcards.
20d437447c0089 Thomas Gleixner 2020-03-20  157   *
20d437447c0089 Thomas Gleixner 2020-03-20  158   * See X86_MATCH_VENDOR_FAM_MODEL_FEATURE() for further information.
20d437447c0089 Thomas Gleixner 2020-03-20  159   */
20d437447c0089 Thomas Gleixner 2020-03-20  160  #define X86_MATCH_INTEL_FAM6_MODEL(model, data)				\
20d437447c0089 Thomas Gleixner 2020-03-20 @161  	X86_MATCH_VENDOR_FAM_MODEL(INTEL, 6, INTEL_FAM6_##model, data)
20d437447c0089 Thomas Gleixner 2020-03-20  162  

:::::: The code at line 161 was first introduced by commit
:::::: 20d437447c0089cda46c683db219d3b4e2cde40e x86/cpu: Add consistent CPU match macros

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
