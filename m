Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69849C8CF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 04:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687321875; x=1718857875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7rU88H+8OJ26uJtwb1bI2OpmAWHcVoht1vyi3HUZeO4=;
  b=Xl79hwk2yIZSTRXItNCMQw2CRWlbRdnY9vTyl9Ru6f80Jdg8/d9OGob0
   FYdXbtH1sh6YDYEWEa0aTLuMqJcpNUxd5T1WvoSDyDV25VJV+XkC1OBZx
   bllqBsC3Y11EASse3h+BMIgN+jYO92Oga2J/bTHm04wIMGafwYr3r7Un8
   5Q9WZcLLmkLFElQeW9mX477OlTe3YRMcHBE50aZhrGbkZ5p6cdrGBk0VO
   lN2wPQU0iYrv25QIsHjS+v77CIIo9n8ef0tGCeGLRHuDmH0HFjQVOaFHO
   YbQNSNIjawnjQaTU7hjokSh1IcHrJkAabB1VJs2w+3aWPS6xKx+soiq/q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="389473067"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="389473067"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 21:30:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="717471214"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="717471214"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2023 21:30:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBpUd-0006YR-32;
	Wed, 21 Jun 2023 04:30:55 +0000
Date: Wed, 21 Jun 2023 12:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2i 12/18] ERROR: modpost: "map_level_names"
 [lib/test_dynamic_debug_submod.ko] undefined!
Message-ID: <202306211200.Rseo5dD8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2i
head:   706822e871c197cefca034dce9582e0fc916732b
commit: c3109b624b9d040f1002ae267886572688fd2d93 [12/18] dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230621/202306211200.Rseo5dD8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211200.Rseo5dD8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211200.Rseo5dD8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "map_level_names" [lib/test_dynamic_debug_submod.ko] undefined!
>> ERROR: modpost: "map_disjoint_names" [lib/test_dynamic_debug_submod.ko] undefined!
>> ERROR: modpost: "map_level_num" [lib/test_dynamic_debug_submod.ko] undefined!
>> ERROR: modpost: "map_disjoint_bits" [lib/test_dynamic_debug_submod.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
WARNING: modpost: suppressed 17 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
