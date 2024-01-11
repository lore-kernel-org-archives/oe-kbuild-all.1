Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21013A1BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 18:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2kU1R/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704996126; x=1736532126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDUlt8cHUNRbo9p35sXswKdw7pM0gAGd1DD+yk0gvWE=;
  b=C2kU1R/CWtEio/5XT/IybK9GnvT9QGPNZWvPyJh9Baqze3XkPvrmFIMS
   Jhb63ua5UAYtucEdOi5rLQkfN3w2BkK431nNZ91lhMaRZ9bov3nn6U0x9
   Cq+cgZHvs6gvMjx9ZusdxG7pcP/6p97wHIxjgkehrAI5JFO6zGYy8VG7K
   GKA+AmJgZY/NtdX2Sg65RsIgHp+flqyxpM7Y7oyvn5Q+peTN9Wl9Dtb3C
   DIxg33b0i9FjIDdnMPfLdeHaX2ClayWfju2yNglfPdhn4WPPoaR9SAFT2
   BYEGiBiuf86JXPXPFS6Xfwrv08o/JoKYrXNjLbrhHTDaek6S1SGDc3p5Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="430117080"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="430117080"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 10:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="1113939250"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="1113939250"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jan 2024 10:02:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNzNS-0008Yw-1h;
	Thu, 11 Jan 2024 18:02:02 +0000
Date: Fri, 12 Jan 2024 02:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1784/2356] kernel/livepatch/core.c:97:12:
 warning: no previous prototype for 'arch_klp_init_func'
Message-ID: <202401120149.MK9hqdEe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: eabc33c6f2c91168537f10e9275b0921c9f78c45 [1784/2356] livepatch/ppc64: Implement livepatch without ftrace for ppc64be
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240112/202401120149.MK9hqdEe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120149.MK9hqdEe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120149.MK9hqdEe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/livepatch/core.c:97:12: warning: no previous prototype for 'arch_klp_init_func' [-Wmissing-prototypes]
      97 | int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
         |            ^~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:1756:12: warning: no previous prototype for 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1756 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:2011:14: warning: no previous prototype for 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    2011 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:2016:13: warning: no previous prototype for 'arch_klp_mem_free' [-Wmissing-prototypes]
    2016 | void __weak arch_klp_mem_free(void *mem)
         |             ^~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:2052:13: warning: no previous prototype for 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    2052 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/arch_klp_init_func +97 kernel/livepatch/core.c

    96	
  > 97	int __weak arch_klp_init_func(struct klp_object *obj, struct klp_func *func)
    98	{
    99		return 0;
   100	}
   101	#endif /* CONFIG_LIVEPATCH_FTRACE */
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
