Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2EE1C39
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692609340; x=1724145340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/WAhkvhOC9Pa6MjPmRhiOv+JWggEkVVvxMTdjhPDRs=;
  b=ci1uo8cXLROElQi5KugkiHp2nvxxxu7kenkHT1H1rJpsTXhLzMN10z5H
   kK4XCnh90YBL+sYmCuU1daEITUPuewtAH5AvDV0RfRnE8W07VCmZIFKxl
   27veV1s9qkUmmMs4rC5JoLvejXNoL2eYHSK2PnCrDZEpu5ekRP4U1qoBR
   aS+5UeEKGMAKmwX76Mp+7UYacuayxcipnPRzyQDtnpdYRNHXusA5jxkGR
   x5P/nElKC14y4m1KTGLivLMCY38A5EPqAz1rgrXMu/KSUC+LdG8Nm0Ea9
   Ppxe73+vRBGJW1hWzAWZw4RAQ34/jLh3FZChsepB31ZXP4ZSHAmtx4ShD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="459907500"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="459907500"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 02:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="982401393"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="982401393"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Aug 2023 02:15:37 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY0yq-0000MK-26;
	Mon, 21 Aug 2023 09:14:39 +0000
Date: Mon, 21 Aug 2023 17:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 7/7] lib/test_map_h.c:32:13: warning: 'MAPH_BUILD_BUG'
 defined but not used
Message-ID: <202308211744.grp4p8kb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jim,

First bad commit (maybe != root cause):

tree:   https://github.com/jimc/linux.git maph
head:   7f5a5e57c1ce6971acdfa13d3e177b14fe615838
commit: 7f5a5e57c1ce6971acdfa13d3e177b14fe615838 [7/7] drop-DD-CORE-dep
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230821/202308211744.grp4p8kb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308211744.grp4p8kb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308211744.grp4p8kb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_map_h.c:32:13: warning: 'MAPH_BUILD_BUG' defined but not used [-Wunused-function]
      32 | static void MAPH_BUILD_BUG(void)
         |             ^~~~~~~~~~~~~~


vim +/MAPH_BUILD_BUG +32 lib/test_map_h.c

8bf2d83c02781d Jim Cromie 2023-03-25  25  
8bf2d83c02781d Jim Cromie 2023-03-25  26  #define BUILD_BUG_STREQ(_var, ref)					\
8bf2d83c02781d Jim Cromie 2023-03-25  27  	BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref)))
8bf2d83c02781d Jim Cromie 2023-03-25  28  #define BUILD_BUG_STREQ_VI(_vec_, idx, ref)		\
8bf2d83c02781d Jim Cromie 2023-03-25  29  	BUILD_BUG_STREQ(_vec_##_names[idx], ref)
8bf2d83c02781d Jim Cromie 2023-03-25  30  
8bf2d83c02781d Jim Cromie 2023-03-25  31  /* force compile, even if its not called */
3acf936f65d59e Jim Cromie 2023-04-25 @32  static void MAPH_BUILD_BUG(void)
8bf2d83c02781d Jim Cromie 2023-03-25  33  {
8bf2d83c02781d Jim Cromie 2023-03-25  34  	BUILD_BUG_ON(sum != 6);
8bf2d83c02781d Jim Cromie 2023-03-25  35  	BUILD_BUG_STREQ(caten, "YESNOMAYBE");
8bf2d83c02781d Jim Cromie 2023-03-25  36  
8bf2d83c02781d Jim Cromie 2023-03-25  37  	BUILD_BUG_STREQ_VI(debug_cats, 0, "DRMx_CORE");
8bf2d83c02781d Jim Cromie 2023-03-25  38  	BUILD_BUG_STREQ_VI(debug_cats, 1, "DRMx_DRIVER");
8bf2d83c02781d Jim Cromie 2023-03-25  39  	BUILD_BUG_STREQ_VI(debug_cats, 2, "DRMx_KMS");
8bf2d83c02781d Jim Cromie 2023-03-25  40  

:::::: The code at line 32 was first introduced by commit
:::::: 3acf936f65d59ef4588b1c10924acc77c157b205 strip-used-MAPH-BB

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
