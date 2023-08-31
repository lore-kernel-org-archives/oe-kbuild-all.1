Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605BA1170A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 18:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693507024; x=1725043024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=piqUD+YFQZHhUayISe1OBhg4DzCNvkYdB6v2t61UYTs=;
  b=ZIAh3yi1TyWh6eabyeWsMgGe7fGH+kYmnwrJEn7sH4BJDt2wdk2HK/sn
   LIhtjy7rMZaqYOF8ucey569sqAI1I3XCe/EVxso5Y2VB+pPZTzYWyb8Wn
   tYWbxwxagBd2qpNvcVhCa/FotbLGoy5ge8owE1ANAeH9ajhYpUw77ilrS
   fvhLRQezXhj+XlYB9wA6sEP1P/SmErlBgWpyWqUsXWYyTzMe+lrniQvmk
   V4pPYpzuuO6ixY58lDAh4FVXPZPSquFvIdmdlQoctWI97TlBO6ueMkkw1
   94H7unk/xPf1QCNanEBtoiTmLbS3/f5mmML1IK+B1swkk5+xi9Ai58QFL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440016165"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="440016165"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809739083"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="809739083"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2023 11:37:02 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbmXM-0000SD-2L;
	Thu, 31 Aug 2023 18:37:00 +0000
Date: Fri, 1 Sep 2023 02:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 257/24603] make[5]: *** No rule to make
 target 'sound/soc/sof/intel/snd-sof-intel-ipc.o', needed by
 'sound/soc/sof/intel/built-in.a'.
Message-ID: <202309010237.sk3BDgtF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 51b86bcaf08f3cd48122cdbee63e8f469dcb3e64 [257/24603] LF-3774-1 ASoC: sof: Make Intel IPC stream ops generic
config: hexagon-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010237.sk3BDgtF-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010237.sk3BDgtF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010237.sk3BDgtF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'sound/soc/sof/intel/snd-sof-intel-ipc.o', needed by 'sound/soc/sof/intel/built-in.a'.
   make[5]: Target '__build' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
