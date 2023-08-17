Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B5312B97
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692304384; x=1723840384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jw2WpR6L7cSciLJx/AIkd6IhEBhUPE84/X32p5mhyaA=;
  b=ElZaHHKUrj5b1rAQEwf1KliRJ1Vp7YAjpzofkcb7sCFGar27FKzpjQAV
   DUyi3BLGFAYGDhVwLmbp4UZCw8SOX4iUldKWaNlqsfKhblGApAumjb5Zo
   qFMytqL064YJ+dlsHBFWo35oANjLcgUUzLIN5BVwjnk5CD5ZZu64+xwtB
   SsYJTuWHfxT5NKw9t45GKEfBi899/MzWIlfBq/PUUFHhEyaul9RNdsOiO
   +OoeZrVryKJk+976x1+w9uEiIQl/W0KrUweNTrioxkQJbAzquo2URcFOW
   RKR3wMEWmFuRpvqdU1Pj7jxOYycPd6y1HwRF38SipaF3onYBYVfz9RxA4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="436842291"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="436842291"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 13:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="824791122"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="824791122"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2023 13:32:57 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWjfs-0001SX-1y;
	Thu, 17 Aug 2023 20:32:56 +0000
Date: Fri, 18 Aug 2023 04:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] powerpc/512x: Make mpc512x_select_reset_compat() static
Message-ID: <202308180425.6UKT2U1O-lkp@intel.com>
References: <69739e99329507b93c11908dff744ddd9d0d0564.1692198388.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69739e99329507b93c11908dff744ddd9d0d0564.1692198388.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.5-rc6 next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-512x-Make-mpc512x_select_reset_compat-static/20230816-232327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/69739e99329507b93c11908dff744ddd9d0d0564.1692198388.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] powerpc/512x: Make mpc512x_select_reset_compat() static
config: powerpc-randconfig-r032-20230818 (https://download.01.org/0day-ci/archive/20230818/202308180425.6UKT2U1O-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180425.6UKT2U1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180425.6UKT2U1O-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/powerpc/platforms/512x/mpc512x_shared.c: In function 'mpc512x_restart_init':
>> arch/powerpc/platforms/512x/mpc512x_shared.c:37:24: error: implicit declaration of function 'mpc512x_select_reset_compat'; did you mean 'mpc512x_select_psc_compat'? [-Werror=implicit-function-declaration]
      37 |         reset_compat = mpc512x_select_reset_compat();
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        mpc512x_select_psc_compat
>> arch/powerpc/platforms/512x/mpc512x_shared.c:37:22: warning: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      37 |         reset_compat = mpc512x_select_reset_compat();
         |                      ^
   arch/powerpc/platforms/512x/mpc512x_shared.c: At top level:
>> arch/powerpc/platforms/512x/mpc512x_shared.c:366:27: error: conflicting types for 'mpc512x_select_reset_compat'; have 'const char *(void)'
     366 | static const char *__init mpc512x_select_reset_compat(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/512x/mpc512x_shared.c:37:24: note: previous implicit declaration of 'mpc512x_select_reset_compat' with type 'int()'
      37 |         reset_compat = mpc512x_select_reset_compat();
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/512x/mpc512x_shared.c:366:27: warning: 'mpc512x_select_reset_compat' defined but not used [-Wunused-function]
     366 | static const char *__init mpc512x_select_reset_compat(void)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +37 arch/powerpc/platforms/512x/mpc512x_shared.c

a8dbceb755f82f Anatolij Gustschin 2010-02-16  31  
a8dbceb755f82f Anatolij Gustschin 2010-02-16  32  static void __init mpc512x_restart_init(void)
a8dbceb755f82f Anatolij Gustschin 2010-02-16  33  {
a8dbceb755f82f Anatolij Gustschin 2010-02-16  34  	struct device_node *np;
0875a88e8569c2 Matteo Facchinetti 2013-06-10  35  	const char *reset_compat;
a8dbceb755f82f Anatolij Gustschin 2010-02-16  36  
0875a88e8569c2 Matteo Facchinetti 2013-06-10 @37  	reset_compat = mpc512x_select_reset_compat();
0875a88e8569c2 Matteo Facchinetti 2013-06-10  38  	np = of_find_compatible_node(NULL, NULL, reset_compat);
a8dbceb755f82f Anatolij Gustschin 2010-02-16  39  	if (!np)
a8dbceb755f82f Anatolij Gustschin 2010-02-16  40  		return;
a8dbceb755f82f Anatolij Gustschin 2010-02-16  41  
a8dbceb755f82f Anatolij Gustschin 2010-02-16  42  	reset_module_base = of_iomap(np, 0);
a8dbceb755f82f Anatolij Gustschin 2010-02-16  43  	of_node_put(np);
a8dbceb755f82f Anatolij Gustschin 2010-02-16  44  }
a8dbceb755f82f Anatolij Gustschin 2010-02-16  45  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
