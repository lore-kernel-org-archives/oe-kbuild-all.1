Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677BA7F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 04:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687752374; x=1719288374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLx4pY/El2R4B2KZGB1Z8r/nmiM2A6hDV+bh7PvmWTU=;
  b=FNbpG1jPe1eOPYXDuxlXVtA5QLCUeURDAlziGI+9KjfJhMPzRhz0/aOg
   f5wg0AdKi6OL+CT7K80V8c3alxa2phSAGoP67c0URf53cbn0AWEk3wOvS
   gvj2mmtJzzahTAapYsYJ6WCztQQC28uQXNLn+7Q0A0Gffq/XyC4xZaY2s
   Qp+GxpbbNGRXGJ6QRlCmN6ilsAug0CrF2cYkoeekKYlfg5LZ/otFhzjzk
   uJzR/PR3jW8uEZ8SMLvlwJz5rVG4yomxiWf3h9X5k82ueEiJxnA0n1SQX
   gjijWEjNGWHsXNR8H0P69Nu6ba5PYs2xvNCPbHMMYXp0LcNKZRI+f4cwl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="364616776"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="364616776"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 21:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="890150589"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="890150589"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Jun 2023 21:06:10 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDdUP-000AT8-35;
	Mon, 26 Jun 2023 04:06:09 +0000
Date: Mon, 26 Jun 2023 12:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.3 10/13] make[4]: *** No rule to make target
 'arch/sparc/mm/execmem.o', needed by 'arch/sparc/mm/built-in.a'.
Message-ID: <202306261142.l2DELHJs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v2.3
head:   d39d8a2d337a10acfad9e49f1c4674ffc3b47852
commit: a43d511cddaa76bca8b3c1ddb392f001fcf02c9f [10/13] arch: make execmem setup available regardless of CONFIG_MODULES
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230626/202306261142.l2DELHJs-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306261142.l2DELHJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306261142.l2DELHJs-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[4]: *** [scripts/Makefile.build:252: arch/sparc/mm/init_64.o] Error 1
>> make[4]: *** No rule to make target 'arch/sparc/mm/execmem.o', needed by 'arch/sparc/mm/built-in.a'.
   make[4]: Target 'arch/sparc/mm/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
