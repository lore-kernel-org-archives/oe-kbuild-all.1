Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6C753AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693515307; x=1725051307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rS0Mplolmem0o6OJt0npPmFsOgfwJE9GN6lUwiiwuJY=;
  b=RKS6BIlZ2vrPpG1qc0cV6be+dfFZa6cqF+E8p6RtskD17k86Sc1Y5TgL
   QgxgpwVfQWwD0FwjI5AjktmVazTU2fbGIH8PpBlhvEOOz/tSL8jW5KeNL
   X4SnVKZddzo3c2zqFCyGPQs/lxkMl3rUYSfrD+YvdGReRGR5oRny2p66V
   VmOX73Ku3fHewFdQaecn6+NrN4UCEGZJpumnyTfyc3oNKDuRNNGKppipt
   QuGdBBhmlAQvXlZpNgrxFjwnGXSEB/Qtw31lYam98EwSPeROf3zZoOcqY
   Ozfg7P6nO/ZY/dFhdmEcdgK/imcxcGCthWReHnaDTtK8ZJIHUbOBISSSy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373462780"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="373462780"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 13:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863282052"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="863282052"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2023 13:55:05 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbogx-0000XH-2I;
	Thu, 31 Aug 2023 20:55:03 +0000
Date: Fri, 1 Sep 2023 04:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 1331/24603]
 ./usr/include/linux/videodev2.h:2398:41: error: field 'timestamp' has
 incomplete type
Message-ID: <202309010420.yu0NODTi-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 0103d73732ea64a7956c8423ff3ec99d9f8b119f [1331/24603] MLK-21876-13 ipu: add uapi headfile for yocto build pass
config: x86_64-randconfig-r003-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010420.yu0NODTi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010420.yu0NODTi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010420.yu0NODTi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/ipu.h:29,
                    from <command-line>:
>> ./usr/include/linux/videodev2.h:2398:41: error: field 'timestamp' has incomplete type
    2398 |         struct timespec                 timestamp;
         |                                         ^~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
