Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3DD2119
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4FWvG0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697361961; x=1728897961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mo+TpvT5LQD6EX1NLQaSYM+YJPLaHjw1if1OO0mH3cQ=;
  b=k4FWvG0pM0KvbHn5BmlfLJFRc/WTTT/NpaERXvKSqwncJfvXZNmzuDjo
   zMj3vpE0x//oDAWuH0hBbTTFRIOtTK2hWLr3eu6vIpWrnz1ljSsmhwfS7
   NOCsioc74/T0BaTyGu4ggi8n2swYxb3YqbBMAPcdejtm+lg/cYo9xtHus
   nSwkrsUxQPLQ6KmHHwctB8vcoaReNc3KWEHzPxPTETfVcP8BKzTY41UrD
   v6FyHHm8VqxU4UGDKfnXYexmO995xQWqpjBMW6jEaA139eDgXLiPAQraV
   a2YWW2OtmpHfwlEeF+bSCVLf3BvJNERmiB3FNNttPWS5LeyyMROzUPD5W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375731655"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375731655"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 02:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784719247"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="784719247"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Oct 2023 02:26:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrxNl-0007HN-1r;
	Sun, 15 Oct 2023 09:25:57 +0000
Date: Sun, 15 Oct 2023 17:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4479/15767]
 drivers/net/ethernet/freescale/dpaa2/dpsw.c:1674: warning: expecting
 prototype for dpsw_lag_set_cfg(). Prototype was for dpsw_lag_set() instead
Message-ID: <202310151723.yYHoksCa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cosmin-Florin,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: b15edd63499cd0b2d494ddf772813f28f7cbf58a [4479/15767] dpaa2-switch: Add the necessary MC API for HW LAG configuration
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231015/202310151723.yYHoksCa-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151723.yYHoksCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151723.yYHoksCa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/dpaa2/dpsw.c:1674: warning: expecting prototype for dpsw_lag_set_cfg(). Prototype was for dpsw_lag_set() instead


vim +1674 drivers/net/ethernet/freescale/dpaa2/dpsw.c

  1662	
  1663	/**
  1664	 * dpsw_lag_set_cfg() - Set LAG configuration
  1665	 * @mc_io:   Pointer to MC portal's I/O object
  1666	 * @cmd_flags:      Command flags; one or more of 'MC_CMD_FLAG_'
  1667	 * @token:   Token of DPSW object
  1668	 * @cfg:     pointer to LAG configuration
  1669	 *
  1670	 * Return:   '0' on Success; Error code otherwise.
  1671	 */
  1672	int dpsw_lag_set(struct fsl_mc_io *mc_io, u32 cmd_flags, u16 token,
  1673			 const struct dpsw_lag_cfg *cfg)
> 1674	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
