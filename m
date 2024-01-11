Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02B61C29
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 04:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWbk4Y6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704946915; x=1736482915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3v+FV8oq+eQRff/3Zck2avBZcpNPuLj80WQBO1gbYYY=;
  b=mWbk4Y6LILW2cCjdICcMPTJhKMaHpqLGTMozLArGQrPo1FVhIr/mbWkY
   NKs0whh5meXFGU1/ch73XDi0x2cILp2iA8EHUQd/2c49iEyHEz/KHNe/o
   k6BOyiH0IZBXkHl1gKZSdIakFkuZgYxfMp67ox+JcsGzCUUu6oJiR0wwf
   4bQjvcUpL7oltcTYCNvZ/yKA2hhAzU7mEE/QYqvy2YLbjmRNy9npnqyrf
   StYZtt51seW+OS2PBUUYa/5+IhGpl+9isLznl+xyZGEXkv7ADR+afYD6m
   rvi8jdXfSBVEqVgoqdFvwxktERReg3arTXgIkY/YkiHwaXIFk8fXlCcAO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="389169088"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="389169088"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 20:21:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1113693621"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="1113693621"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jan 2024 20:21:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNmZY-0007p8-2I;
	Thu, 11 Jan 2024 04:21:40 +0000
Date: Thu, 11 Jan 2024 12:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1768/2334] kernel/module/strict_rwx.c:36:6:
 warning: no previous prototype for 'module_disable_ro'
Message-ID: <202401111251.kNMCTrC0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c780cd23389087490b4199975c7e16cb696da852
commit: c8783f92771c891518257c9deb22cd91d4e1a212 [1768/2334] livepatch/core: Revert module_enable_ro and module_disable_ro
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240111/202401111251.kNMCTrC0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111251.kNMCTrC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111251.kNMCTrC0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/strict_rwx.c:36:6: warning: no previous prototype for 'module_disable_ro' [-Wmissing-prototypes]
      36 | void module_disable_ro(const struct module *mod)
         |      ^~~~~~~~~~~~~~~~~


vim +/module_disable_ro +36 kernel/module/strict_rwx.c

    34	
    35	#ifdef CONFIG_LIVEPATCH_WO_FTRACE
  > 36	void module_disable_ro(const struct module *mod)
    37	{
    38		if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
    39			return;
    40	#ifdef CONFIG_STRICT_MODULE_RWX
    41		if (!rodata_enabled)
    42			return;
    43	#endif
    44	
    45		module_set_memory(mod, MOD_TEXT, set_memory_rw);
    46		module_set_memory(mod, MOD_INIT_TEXT, set_memory_rw);
    47		module_set_memory(mod, MOD_RODATA, set_memory_rw);
    48		module_set_memory(mod, MOD_INIT_RODATA, set_memory_rw);
    49	}
    50	#endif /* CONFIG_LIVEPATCH_WO_FTRACE */
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
