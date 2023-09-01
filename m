Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AE523BC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 15:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693583936; x=1725119936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ssroFkpDypwIO8RsK8RAgsvFLt4qvb9XuddmU2Shl50=;
  b=coGZU2F0eD91N32xmpTYGDbiZ3pPwtw5XwYS7K+JbGI8+RFItNQljp90
   A9JLlwiU5fkZAS1C+QFkkzSrnw4zhR0rd/lGQRPpndSkGypCFp6gUWHLb
   ipJgDtu55rDfO0buDrsi1kxPsR/9cRDBVNMBXpzQfxC8dWJZu90CU6OlY
   M8bg4UQebi3fwKW3s03AGRjjbXTv32omUnVwmfbxYP7K57uiJxit7Lb9e
   0WW8eD0BSELcgtuumOOwgcs/nVGY30rOsURBEYcJH8PEL2de5vDgkh7dt
   0zWkAhVHEC7XgVSZAWxME+1ruET2ZXQlqSjd5urEI5Incfpp1yPvMWnwU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356559111"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="356559111"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 08:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913731319"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; 
   d="scan'208";a="913731319"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Sep 2023 08:58:45 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc6Xj-0001QR-05;
	Fri, 01 Sep 2023 15:58:43 +0000
Date: Fri, 1 Sep 2023 23:57:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3770/24603]
 ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not
 allowed in ISO C90
Message-ID: <202309012356.r2X23l1A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 0a3658b7bccb93a6ceec4bc4f6b220384f4d58b6 [3770/24603] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: x86_64-randconfig-r003-20230831 (https://download.01.org/0day-ci/archive/20230901/202309012356.r2X23l1A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012356.r2X23l1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012356.r2X23l1A-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./usr/include/linux/imx_vpu.h:17,
                    from <command-line>:
   ./usr/include/linux/videodev2.h:2428:41: error: field 'timestamp' has incomplete type
    2428 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~
>> ./usr/include/linux/imx_vpu.h:22:1: error: C++ style comments are not allowed in ISO C90
      22 | //ctrls & extension ctrls definitions
         | ^
   ./usr/include/linux/imx_vpu.h:22:1: note: (this will be reported only once per input file)
>> ./usr/include/linux/imx_vpu.h:111:9: warning: extra tokens at end of #endif directive [-Wendif-labels]
     111 | #endif  //#ifndef __LINUX_IMX_VPU_H
         |         ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
