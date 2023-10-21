Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33271C16
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrVFNfHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697880062; x=1729416062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9IscNcB6lrR9gjqVMLXZi5aYfl6rSfp6+lDv3tUFxMM=;
  b=HrVFNfHfruLZinz+o5d8+f5l2fWsAxZmGGIt+AmDNGDEW9ict6rk3GGX
   9OiAhGovGYco9ESqnCTgkgdy3RpwWyuhQstX3Q5iNQTCB9nXjueyl3z7K
   lG0/WEwggclBdKOblMdW+je7TXzbBFva9D5CDrN2iyzcRgpWlN5sln3ay
   dHhaCnenZrSNceZgWP5Lxb4d/ppK4qoyA7dBbc3y+IFgKSjHrcrm6t5gn
   3ysN5KZZgt5/b+szWNFFY7csffPIo06zgVqgC81JlgufGqBCx33QoA+i1
   Rn/3DtKjzjmBuU4ZNyaXK3C7gDF+FIZSKrgMNp+MjoDfj65v+WyiimcPF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="386433956"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="386433956"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 02:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="787014224"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="787014224"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Oct 2023 02:21:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu8AD-0004gM-1s;
	Sat, 21 Oct 2023 09:20:57 +0000
Date: Sat, 21 Oct 2023 17:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: Shannon Nelson <shannon.nelson@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/amd/pds_core/dev.c:257:22: warning: '%s'
 directive output may be truncated writing up to 64 bytes into a region of
 size 23
Message-ID: <202310211736.66syyDpp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shannon,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c5d00cb7b6bbc5a7965d9ab7d223b5402d1f02c
commit: ddbcb22055d136f58841c73ca2226dab79eb6101 pds_core: Kconfig and pds_core.rst
date:   6 months ago
config: x86_64-randconfig-r031-20230608 (https://download.01.org/0day-ci/archive/20231021/202310211736.66syyDpp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211736.66syyDpp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211736.66syyDpp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/amd/pds_core/dev.c: In function 'pdsc_identify':
>> drivers/net/ethernet/amd/pds_core/dev.c:257:22: warning: '%s' directive output may be truncated writing up to 64 bytes into a region of size 23 [-Wformat-truncation=]
     257 |                  "%s %s", PDS_CORE_DRV_NAME, utsname()->release);
         |                      ^~
   drivers/net/ethernet/amd/pds_core/dev.c:256:9: note: 'snprintf' output between 10 and 74 bytes into a destination of size 32
     256 |         snprintf(drv.driver_ver_str, sizeof(drv.driver_ver_str),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     257 |                  "%s %s", PDS_CORE_DRV_NAME, utsname()->release);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/amd/pds_core/core.c: In function 'pdsc_qcq_alloc':
>> drivers/net/ethernet/amd/pds_core/core.c:126:45: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 19 and 21 [-Wformat-truncation=]
     126 |         snprintf(name, sizeof(name), "%s-%d-%s",
         |                                             ^~
   In function 'pdsc_qcq_intr_alloc',
       inlined from 'pdsc_qcq_alloc' at drivers/net/ethernet/amd/pds_core/core.c:218:8:
   drivers/net/ethernet/amd/pds_core/core.c:126:9: note: 'snprintf' output between 12 and 45 bytes into a destination of size 32
     126 |         snprintf(name, sizeof(name), "%s-%d-%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     127 |                  PDS_CORE_DRV_NAME, pdsc->pdev->bus->number, qcq->q.name);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +257 drivers/net/ethernet/amd/pds_core/dev.c

523847df1b3718 Shannon Nelson 2023-04-19  248  
523847df1b3718 Shannon Nelson 2023-04-19  249  static int pdsc_identify(struct pdsc *pdsc)
523847df1b3718 Shannon Nelson 2023-04-19  250  {
523847df1b3718 Shannon Nelson 2023-04-19  251  	struct pds_core_drv_identity drv = {};
523847df1b3718 Shannon Nelson 2023-04-19  252  	size_t sz;
523847df1b3718 Shannon Nelson 2023-04-19  253  	int err;
523847df1b3718 Shannon Nelson 2023-04-19  254  
523847df1b3718 Shannon Nelson 2023-04-19  255  	drv.drv_type = cpu_to_le32(PDS_DRIVER_LINUX);
523847df1b3718 Shannon Nelson 2023-04-19  256  	snprintf(drv.driver_ver_str, sizeof(drv.driver_ver_str),
523847df1b3718 Shannon Nelson 2023-04-19 @257  		 "%s %s", PDS_CORE_DRV_NAME, utsname()->release);
523847df1b3718 Shannon Nelson 2023-04-19  258  
523847df1b3718 Shannon Nelson 2023-04-19  259  	/* Next let's get some info about the device
523847df1b3718 Shannon Nelson 2023-04-19  260  	 * We use the devcmd_lock at this level in order to
523847df1b3718 Shannon Nelson 2023-04-19  261  	 * get safe access to the cmd_regs->data before anyone
523847df1b3718 Shannon Nelson 2023-04-19  262  	 * else can mess it up
523847df1b3718 Shannon Nelson 2023-04-19  263  	 */
523847df1b3718 Shannon Nelson 2023-04-19  264  	mutex_lock(&pdsc->devcmd_lock);
523847df1b3718 Shannon Nelson 2023-04-19  265  
523847df1b3718 Shannon Nelson 2023-04-19  266  	sz = min_t(size_t, sizeof(drv), sizeof(pdsc->cmd_regs->data));
523847df1b3718 Shannon Nelson 2023-04-19  267  	memcpy_toio(&pdsc->cmd_regs->data, &drv, sz);
523847df1b3718 Shannon Nelson 2023-04-19  268  
523847df1b3718 Shannon Nelson 2023-04-19  269  	err = pdsc_devcmd_identify_locked(pdsc);
523847df1b3718 Shannon Nelson 2023-04-19  270  	if (!err) {
523847df1b3718 Shannon Nelson 2023-04-19  271  		sz = min_t(size_t, sizeof(pdsc->dev_ident),
523847df1b3718 Shannon Nelson 2023-04-19  272  			   sizeof(pdsc->cmd_regs->data));
523847df1b3718 Shannon Nelson 2023-04-19  273  		memcpy_fromio(&pdsc->dev_ident, &pdsc->cmd_regs->data, sz);
523847df1b3718 Shannon Nelson 2023-04-19  274  	}
523847df1b3718 Shannon Nelson 2023-04-19  275  	mutex_unlock(&pdsc->devcmd_lock);
523847df1b3718 Shannon Nelson 2023-04-19  276  
523847df1b3718 Shannon Nelson 2023-04-19  277  	if (err) {
523847df1b3718 Shannon Nelson 2023-04-19  278  		dev_err(pdsc->dev, "Cannot identify device: %pe\n",
523847df1b3718 Shannon Nelson 2023-04-19  279  			ERR_PTR(err));
523847df1b3718 Shannon Nelson 2023-04-19  280  		return err;
523847df1b3718 Shannon Nelson 2023-04-19  281  	}
523847df1b3718 Shannon Nelson 2023-04-19  282  
523847df1b3718 Shannon Nelson 2023-04-19  283  	if (isprint(pdsc->dev_info.fw_version[0]) &&
523847df1b3718 Shannon Nelson 2023-04-19  284  	    isascii(pdsc->dev_info.fw_version[0]))
523847df1b3718 Shannon Nelson 2023-04-19  285  		dev_info(pdsc->dev, "FW: %.*s\n",
523847df1b3718 Shannon Nelson 2023-04-19  286  			 (int)(sizeof(pdsc->dev_info.fw_version) - 1),
523847df1b3718 Shannon Nelson 2023-04-19  287  			 pdsc->dev_info.fw_version);
523847df1b3718 Shannon Nelson 2023-04-19  288  	else
523847df1b3718 Shannon Nelson 2023-04-19  289  		dev_info(pdsc->dev, "FW: (invalid string) 0x%02x 0x%02x 0x%02x 0x%02x ...\n",
523847df1b3718 Shannon Nelson 2023-04-19  290  			 (u8)pdsc->dev_info.fw_version[0],
523847df1b3718 Shannon Nelson 2023-04-19  291  			 (u8)pdsc->dev_info.fw_version[1],
523847df1b3718 Shannon Nelson 2023-04-19  292  			 (u8)pdsc->dev_info.fw_version[2],
523847df1b3718 Shannon Nelson 2023-04-19  293  			 (u8)pdsc->dev_info.fw_version[3]);
523847df1b3718 Shannon Nelson 2023-04-19  294  
523847df1b3718 Shannon Nelson 2023-04-19  295  	return 0;
523847df1b3718 Shannon Nelson 2023-04-19  296  }
523847df1b3718 Shannon Nelson 2023-04-19  297  

:::::: The code at line 257 was first introduced by commit
:::::: 523847df1b3718d6286dce0ed1c83742fe0ffa94 pds_core: add devcmd device interfaces

:::::: TO: Shannon Nelson <shannon.nelson@amd.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
