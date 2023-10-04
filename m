Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB7810F8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 04:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696393031; x=1727929031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yB6TtLpXvKu8EF0B4m/dpQtc/4lR9xwPUvS2swdWKoA=;
  b=BbVP2IRmQIQidwwhUliyYxDyfhM8O86be8AiO57OM8evxumRHbzs2N2s
   sx8iEIf6Oo36+6JZTnvVCfdez84qClwJumc1SlbOkVPQ2j1R2QoDklAkr
   jE4oVGTeQUgWfr3l5xSWLbXG4kC78npZz2j981rN1D782oEWStQknJm03
   sAwAsp5HxigXbhR2ZO/8N7KdLBAQE6gi5mS61pwHSGidQlI0hyxGyJ5bD
   lWzERUzeC/WSGXCLI0tebcneiFS0Hj5feYggayo3NNdoeP8gAkIlC3bLE
   AIU+QuEP0j4LSLJYO7JC7j6IVwmu5rEQdwuZr5+A3o9DyT5NwSNUKyS6s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="381915741"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="381915741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 21:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="786350756"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
   d="scan'208";a="786350756"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Oct 2023 21:16:50 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qntJW-000BF4-1i;
	Wed, 04 Oct 2023 04:16:46 +0000
Date: Wed, 4 Oct 2023 12:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-2e 37/37] lib/dynamic_debug.c:117:6: warning: no
 previous prototype for function 'ddebug_clear_prefix_cache'
Message-ID: <202310041216.Krp9MLkF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-2e
head:   e29a79ca0888609c7442791bd8108f8323eded5f
commit: e29a79ca0888609c7442791bd8108f8323eded5f [37/37] dyndbg: cache the dynamic prefixes per callsite
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231004/202310041216.Krp9MLkF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310041216.Krp9MLkF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310041216.Krp9MLkF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:117:6: warning: no previous prototype for function 'ddebug_clear_prefix_cache' [-Wmissing-prototypes]
   void ddebug_clear_prefix_cache(const struct _ddebug *dp)
        ^
   lib/dynamic_debug.c:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ddebug_clear_prefix_cache(const struct _ddebug *dp)
   ^
   static 
   1 warning generated.


vim +/ddebug_clear_prefix_cache +117 lib/dynamic_debug.c

   116	
 > 117	void ddebug_clear_prefix_cache(const struct _ddebug *dp)
   118	{
   119		mtree_erase(&pr_prefixes, (unsigned long)dp);
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
