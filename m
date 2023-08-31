Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838191FD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 07:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693465491; x=1725001491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ByWFUT6Hrivhte0lEvxQtDc/iEUxGZv8yD4TKgLWNZ8=;
  b=dgKVHXu/bXxlX+ubSLbvLV7VnvFymOg2dLrqKy8sQePhoDD4SQ6fOpcr
   CRg5V8DcdrHNTvyU8NGuEkvqnPNexPGn1Ow1NzX1Jsyth9gAjutEPAsJM
   LgmqgyTKiic5eOiBETWfQo//9IP+3Iu8y5/H/gnNcDYVU8HOKcohguuxv
   CcCI/dy/bnAmFAqnMUKISRXhjIyUFpiLINyn83Kw1wfqxi/n5QH7QlArT
   3LLOooBTpB79LgbnS+P0tUdBxbMYpHuLnKO2cpdi73iRSGoDduvyCgh0q
   xb7IXWc5dLVINEyLwE2YyHB2KFkK+/8GHC166LaUr0gARqKqSm3Kj5MS1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442202840"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="442202840"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 00:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="742545266"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="742545266"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 31 Aug 2023 00:04:42 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbbjM-000B3z-0L;
	Thu, 31 Aug 2023 07:04:40 +0000
Date: Thu, 31 Aug 2023 15:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6157/24604]
 drivers/soc/imx/soc-imx8m.c:279:5: warning: no previous prototype for
 function 'check_m4_enabled'
Message-ID: <202308311407.HNQrn7c3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: afbf4e009ee7f83d492eabf1144fed73e9112a42 [6157/24604] Merge branch 'clock/next' into next
config: riscv-randconfig-r016-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311407.HNQrn7c3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311407.HNQrn7c3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311407.HNQrn7c3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx8m.c:279:5: warning: no previous prototype for function 'check_m4_enabled' [-Wmissing-prototypes]
     279 | int check_m4_enabled(void)
         |     ^
   drivers/soc/imx/soc-imx8m.c:279:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     279 | int check_m4_enabled(void)
         | ^
         | static 
   1 warning generated.


vim +/check_m4_enabled +279 drivers/soc/imx/soc-imx8m.c

d1e806347e888e Dong Aisheng 2019-04-19  278  
d1e806347e888e Dong Aisheng 2019-04-19 @279  int check_m4_enabled(void)

:::::: The code at line 279 was first introduced by commit
:::::: d1e806347e888e13d6fdddb28275dbce7fd9f780 soc: imx: fix build error of missing imx_src_is_m4_enabled

:::::: TO: Dong Aisheng <aisheng.dong@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
