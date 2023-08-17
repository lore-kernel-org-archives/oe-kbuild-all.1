Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A620E17FF3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 20:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692302458; x=1723838458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2EoKz7WNPyWWwAx1kYBT1mOqfthLxdjl0olYwvrcDw0=;
  b=Nodt328ajuUurNJHsUvPIcrvYwpxsyV7wizgB515sUVOykQ7pA7uQwAX
   /Aw3ChSanskRKftCw776o3KBumO6tIRmanBWB3FMGl+1mNrJitwV8rXcG
   19wKuIoHjb0aJQH5VohjwHVMWnr8wB3HIKHnLxvcObxqC4OB4iFzq7Ss3
   zFT5XlXTMUiy94CijdWZs25ZZ+rNE75KlpU22+gc6qN77dXVFdZs6/KkE
   45nJYEf5GOEcWplPdkI862QwaD27IFKaOapxzGuFlM7Mr+rrHAgq9kISB
   abvinBnGVWC4nGmwMXkvwU/xxDiwsSHmQMpzye+IVdx19gK+Caw4lbI/s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403897094"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="403897094"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 13:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="769813313"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="769813313"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Aug 2023 13:00:56 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWjAq-0001R9-2R;
	Thu, 17 Aug 2023 20:00:53 +0000
Date: Fri, 18 Aug 2023 04:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ramji Jiyani <ramjiyani@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:android13-5.10/ffa 8677/9999]
 kernel/gki_module.c:35:6: warning: no previous declaration for
 'gki_is_module_protected_symbol'
Message-ID: <202308180318.9WUG5Q2s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 9ab6a242258a9ac17506b74c6ed7332703d536f4 [8677/9999] ANDROID: GKI: Add module load time protected symbol lookup
config: x86_64-randconfig-m001-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180318.9WUG5Q2s-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180318.9WUG5Q2s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180318.9WUG5Q2s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:35:6: warning: no previous declaration for 'gki_is_module_protected_symbol' [-Wmissing-declarations]
    bool gki_is_module_protected_symbol(const char *name)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/gki_module.c:46:6: warning: no previous declaration for 'gki_is_module_exported_symbol' [-Wmissing-declarations]
    bool gki_is_module_exported_symbol(const char *name)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/gki_is_module_protected_symbol +35 kernel/gki_module.c

    29	
    30	/**
    31	 * gki_is_module_protected_symbol - Is a symbol protected from unsigned module?
    32	 *
    33	 * @name:	Symbol being checked against protection from unsigned module
    34	 */
  > 35	bool gki_is_module_protected_symbol(const char *name)
    36	{
    37		return bsearch(name, gki_protected_symbols, NO_OF_PROTECTED_SYMBOLS,
    38			       MAX_PROTECTED_NAME_LEN, cmp_name) != NULL;
    39	}
    40	
    41	/**
    42	 * gki_is_module_exported_symbol - Is a symbol exported from a GKI module?
    43	 *
    44	 * @name:	Symbol being checked against exported symbols from GKI modules
    45	 */
  > 46	bool gki_is_module_exported_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
