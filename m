Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D31C698
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695130458; x=1726666458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ruEboSsoHtS6iH3hYLDRxQ1KqaqdvTIy6QR+YPRMU/A=;
  b=K1BcmeGCJRbUepZyGqHFysp/EJwf4k/QJfYVI3ZEOVnR9jtg/jFku8Yd
   Z51bgJMFWGVoDA2IwMMTkWEYxUmHAbYAnBFD5dvDJFh9s9nsRQ7aWsicI
   kIS6dxXVc/AleOWSrfHQL1YZ3dsNw5RXpUit/D4R0+hvO4is23jxrhZSA
   cbo5kUwwqlSE0YNE9qa+0n+LGzVpSZ4kAXckG5YkCYL5pL3osG5YaLFSa
   1uhSDavZrJC5lYzSBNo8fVqh4zTzYOuEq20lDTsZBXgsljpFAs2w9uOmm
   yzL4Jdpg6Kz81YAAlR0iJlDuuZR97ElcTDpIIbiQ7l43LHtvLufpmVycN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="410872935"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="410872935"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749481052"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="749481052"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2023 06:34:15 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiarl-0007Ou-1K;
	Tue, 19 Sep 2023 13:34:13 +0000
Date: Tue, 19 Sep 2023 21:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Milena Olech <milena.olech@intel.com>,
	Michal Michalik <michal.michalik@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jiri Pirko <jiri@nvidia.com>
Subject: [linux-next:master 5301/6333] ice_dpll.c:undefined reference to
 `ice_cgu_get_pin_name'
Message-ID: <202309192154.NJNpFIy5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   29e400e3ea486bf942b214769fc9778098114113
commit: d7999f5ea64bb10d2857b8cbfe973be373bac7c9 [5301/6333] ice: implement dpll interface to control cgu
config: powerpc-randconfig-s042-20230108 (https://download.01.org/0day-ci/archive/20230919/202309192154.NJNpFIy5-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192154.NJNpFIy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192154.NJNpFIy5-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/net/ethernet/intel/ice/ice_lib.o: in function `ice_init_feature_support':
   ice_lib.c:(.text+0x44ac): undefined reference to `ice_is_phy_rclk_present'
   powerpc-linux-ld: ice_lib.c:(.text+0x44d4): undefined reference to `ice_is_cgu_present'
   powerpc-linux-ld: ice_lib.c:(.text+0x44f0): undefined reference to `ice_is_clock_mux_present_e810t'
   powerpc-linux-ld: drivers/net/ethernet/intel/ice/ice_dpll.o: in function `ice_dpll_init_info_direct_pins':
>> ice_dpll.c:(.text+0x7a0): undefined reference to `ice_cgu_get_pin_name'
>> powerpc-linux-ld: ice_dpll.c:(.text+0x7b4): undefined reference to `ice_cgu_get_pin_type'
>> powerpc-linux-ld: ice_dpll.c:(.text+0x848): undefined reference to `ice_cgu_get_pin_freq_supp'
   powerpc-linux-ld: drivers/net/ethernet/intel/ice/ice_dpll.o: in function `ice_dpll_update_state':
>> ice_dpll.c:(.text+0xa50): undefined reference to `ice_get_cgu_state'
   powerpc-linux-ld: drivers/net/ethernet/intel/ice/ice_dpll.o: in function `ice_dpll_init_info':
>> ice_dpll.c:(.text+0x1610): undefined reference to `ice_get_cgu_rclk_pin_info'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
