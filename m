Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7510AA34
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 06:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693031283; x=1724567283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h8Xf+62uIAm22+dLXgsrdQE/Xlzs+fOnUeC4UM09wEA=;
  b=IFKq8i87F/F4OMNt3cNLksiRIHB9gJAIxwhJFvDmxSINxbLnjtAUQGbn
   7vLXruVNmEL/GZ/ZJlcoXZjKY5JTeodS8SgNILdtvExwKI0X9541HLY4K
   gibN0VY+oM/uBOAXSSvIi0w8wiBWl79hD2j7H32/iO/2PDtrhikSSn1FX
   C69nuLlDOhTjjPb7ZMRKR1xLGXOJP4A30kvme37P0v9oVyxBeNraPtgXL
   U6fDCSdJBi+i4xFwg9RzyfJ2en9Af3HwJPI4aRvNBh61pkGTZQHc0WPki
   jmchqADadwO4MuGyfQrJqbNbO1DsLhN39BjFgl852Wbtf2GcU7cUyjOWV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="377588681"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="377588681"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 23:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="767138001"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="767138001"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 23:28:01 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZmm2-0004Qd-2q;
	Sat, 26 Aug 2023 06:27:57 +0000
Date: Sat, 26 Aug 2023 14:27:10 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 3831/9999] kernel/module.c:4792:6:
 warning: no previous declaration for 'android_debug_for_each_module'
Message-ID: <202308261444.DfIXsO4z-lkp@intel.com>
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
commit: 0bb433e0140efece0a1ce8124283cb68fda33a3f [3831/9999] ANDROID: debug_symbols: Add android_debug_for_each_module
config: x86_64-buildonly-randconfig-006-20230824 (https://download.01.org/0day-ci/archive/20230826/202308261444.DfIXsO4z-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261444.DfIXsO4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261444.DfIXsO4z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module.c:4792:6: warning: no previous declaration for 'android_debug_for_each_module' [-Wmissing-declarations]
    void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]


vim +/android_debug_for_each_module +4792 kernel/module.c

  4790	
  4791	#ifdef CONFIG_ANDROID_DEBUG_SYMBOLS
> 4792	void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
  4793		void *data)
  4794	{
  4795		struct module *module;
  4796	
  4797		preempt_disable();
  4798		list_for_each_entry_rcu(module, &modules, list) {
  4799			if (fn(module->name, module->core_layout.base, data))
  4800				goto out;
  4801		}
  4802	out:
  4803		preempt_enable();
  4804	}
  4805	EXPORT_SYMBOL_GPL(android_debug_for_each_module);
  4806	#endif
  4807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
