Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA44F355F49
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778138701; cv=none; b=CeTlYmNtOsw5fwrwPJ/f9cBo9l7g2Ez8tS9HfHOlHNtXKCukBD5lN5Uw8UEPwkjqI6QnIaOUCYJb/qd8PCQ4wFfjaz3uJsi2jWu1Jg6Ls5KiYsblWrHbwFjUMdsEQdN4vyJaAct4+jiWLQNvoYLmrHhPGjkOhXL4gBK/wxaWaoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778138701; c=relaxed/simple;
	bh=WElJ+0Uy7bxEWDOjrxULwrDNsj9GsX5T3P8gTuqNopg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZQFfFz9l9anrEOFKaCmZhtKStSaUpmEyh6LcpZMo0vB+xmm2wpIdgo6kfQuQNPpXPShQew4BS9QSluEaycPkLxR0yExgIT4ROc6G7rmemyFm8vuYinwxmKvpymEH6llu0+afIWdjMfXFxBZk/z5Mb8DD8oKAXinn3QRvLMstrww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNQ1+k6K; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNQ1+k6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778138696; x=1809674696;
  h=date:from:to:cc:subject:message-id;
  bh=WElJ+0Uy7bxEWDOjrxULwrDNsj9GsX5T3P8gTuqNopg=;
  b=lNQ1+k6KxitCRwPqLPXjWCY05/x40roFHiJr8MEHM/eQf1bW7HXhXQfG
   nqGXVVe3tEMm2MOEVJbuxiNdpem8hzOCWLmqJc5nPlcVUcDRmEHtqTq6P
   XRtn/AZEhx6iVwupfRFMgTeyuip2tOwI2C8AcLoE/UZqwNEpEXcdFM85r
   ECy0PYFpt8OCuX9CWr7jqXDcrykWHXdUewa8f5dEHBnAJGQ2Q1ewath5/
   4T+8IJpacXq5JBtZFv4Q1cWHRl7/Dw1SZkPUdUUqbGRM4BbWNBav/aOHn
   Y73DK1NKHsSeK+dNQqesqObNxr6B+tFFl5wop2WXGHY0qYf12l7S3svgc
   Q==;
X-CSE-ConnectionGUID: mbB1MZcdSnKgxu9xXx/XYw==
X-CSE-MsgGUID: a+J3KTf3T2q+FuPlKcyuaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="89777439"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="89777439"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 00:24:54 -0700
X-CSE-ConnectionGUID: r8IOu+8aTXmxu/ix2ikK+Q==
X-CSE-MsgGUID: pC6EL30ETCOFbWZvJ/I2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="235394591"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2026 00:24:53 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKt6I-00000000063-1EuR;
	Thu, 07 May 2026 07:24:50 +0000
Date: Thu, 07 May 2026 15:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 126/157]
 include/linux/pcs/pcs.h:95:12: warning: 'unregister_fwnode_pcs_notifier'
 defined but not used
Message-ID: <202605071512.csRqyLKZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ce3735b05f8971cb2a88ba66c5df025751f12b10
commit: abf80d1a32d7d515b764b1c6c6b8ebc5f7abfc05 [126/157] net: ethernet: mediatek: mtkmux: harden mux/phylink lifecycle
config: powerpc64-randconfig-002-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071512.csRqyLKZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071512.csRqyLKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071512.csRqyLKZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_eth_soc.c:25:
   include/linux/pcs/pcs.h:107:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
     107 | fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:95:12: warning: 'unregister_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      95 | static int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pcs/pcs.h:90:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      90 | static int register_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/unregister_fwnode_pcs_notifier +95 include/linux/pcs/pcs.h

    94	
  > 95	static int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
    96	{
    97		return -EOPNOTSUPP;
    98	}
    99	
   100	static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
   101							 int index)
   102	{
   103		return ERR_PTR(-ENOENT);
   104	}
   105	
   106	static struct phylink_pcs *
 > 107	fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
   108					   struct fwnode_handle *pcs_fwnode)
   109	{
   110		return ERR_PTR(-ENOENT);
   111	}
   112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
