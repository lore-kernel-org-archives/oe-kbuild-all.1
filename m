Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB5303CA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Nov 2025 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762498488; cv=none; b=eHKuPSlERVC92QzmVMJSgXFj0cgdc0zavJOb/rL5fdtwI68qU3ErhjccmK0S7R80MCfvrGQzmO+ZztfzrQ/muV/rR3neqzzPMNa/1ANx4m7t/BiPyp7f20rp30la9qZABz4YgJYqFGABZ48cNmZJBqaW3bQ6bXk1fiXhm/CJVC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762498488; c=relaxed/simple;
	bh=baqHi0dMXDMwqcuZ0IiBEJFEHLA4yuvJjuO6eYSjQWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6SA2XYJuKnHFXXwr3aos6LpdddPlyOgtxNRben0OigKHIEpaLqWY8w5Vh+9iX3j8GI4iHBy9dEy5Eoe/u0X/0e89jK0BVjOD/ylpNYhz/EdDWSD3bnk+pbROcNcRBohBzcxfrZmegY9KcnwMNmo5UbZxr55cPWO59ibD0GSIWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZYEN/EC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZYEN/EC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762498486; x=1794034486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=baqHi0dMXDMwqcuZ0IiBEJFEHLA4yuvJjuO6eYSjQWo=;
  b=JZYEN/ECASloBsB3bOx/mABP7md2HRZksZDZcac+UeCRT0X1YX13KAgc
   nIkSaDpo3GLdJd4KF30u6FUSipnnF7FpO6EuFzbN99GFqseV4vtzbdKRp
   hRYk5zHBun3SVm0Jkr2mYBzuecqisd6LxfootfjnL2MBef5fMyPn9qqkF
   /TS9mynIg4A73KtOGoYxYhlIrsFfYq3JFw4VowiyY28hl0XSYSZJKUGPQ
   md1lgr40GsM+ZmYM035vjq5M3kjW3UUqbI9KTM2XPapb5cf2Z7d50NAx2
   RlLV3mTMqBMrFtrkVUWSrBoMyIjeC86U8CPFdmuvm/J4JJAhbL7PC4i82
   A==;
X-CSE-ConnectionGUID: 81U+pjbET9Wriq4Qrt47yw==
X-CSE-MsgGUID: 7cRNRxUhQpCVU1xM2eVPTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75759859"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="75759859"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 22:54:46 -0800
X-CSE-ConnectionGUID: izkHjS9MTA2yQuRLAk25jw==
X-CSE-MsgGUID: rGfDkCzhQnura6ISz0qw7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="193135607"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2025 22:54:44 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHGMr-000Uoh-1h;
	Fri, 07 Nov 2025 06:54:41 +0000
Date: Fri, 7 Nov 2025 14:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Artem Shimko <a.shimko.dev@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Artem Shimko <a.shimko.dev@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Replace magic numbers with named
 constants
Message-ID: <202511071402.qHS6LLi9-lkp@intel.com>
References: <20251106160206.2617785-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106160206.2617785-1-a.shimko.dev@gmail.com>

Hi Artem,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on westeri-thunderbolt/next linus/master v6.18-rc4 next-20251107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Artem-Shimko/i2c-designware-Replace-magic-numbers-with-named-constants/20251107-000812
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20251106160206.2617785-1-a.shimko.dev%40gmail.com
patch subject: [PATCH v2] i2c: designware: Replace magic numbers with named constants
config: loongarch-randconfig-001-20251107 (https://download.01.org/0day-ci/archive/20251107/202511071402.qHS6LLi9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511071402.qHS6LLi9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511071402.qHS6LLi9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-designware-common.c: In function 'i2c_dw_set_fifo_size':
>> drivers/i2c/busses/i2c-designware-common.c:712:25: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     712 |         tx_fifo_depth = FIELD_GET(DW_IC_FIFO_TX_FIELD, param) + 1;
         |                         ^~~~~~~~~


vim +/FIELD_GET +712 drivers/i2c/busses/i2c-designware-common.c

   684	
   685	int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
   686	{
   687		u32 tx_fifo_depth, rx_fifo_depth;
   688		unsigned int param;
   689		int ret;
   690	
   691		/* DW_IC_COMP_PARAM_1 not implement for IP issue */
   692		if ((dev->flags & MODEL_MASK) == MODEL_WANGXUN_SP) {
   693			dev->tx_fifo_depth = TXGBE_TX_FIFO_DEPTH;
   694			dev->rx_fifo_depth = TXGBE_RX_FIFO_DEPTH;
   695	
   696			return 0;
   697		}
   698	
   699		/*
   700		 * Try to detect the FIFO depth if not set by interface driver,
   701		 * the depth could be from 2 to 256 from HW spec.
   702		 */
   703		ret = i2c_dw_acquire_lock(dev);
   704		if (ret)
   705			return ret;
   706	
   707		ret = regmap_read(dev->map, DW_IC_COMP_PARAM_1, &param);
   708		i2c_dw_release_lock(dev);
   709		if (ret)
   710			return ret;
   711	
 > 712		tx_fifo_depth = FIELD_GET(DW_IC_FIFO_TX_FIELD, param) + 1;
   713		rx_fifo_depth = FIELD_GET(DW_IC_FIFO_RX_FIELD, param) + 1;
   714		if (!dev->tx_fifo_depth) {
   715			dev->tx_fifo_depth = tx_fifo_depth;
   716			dev->rx_fifo_depth = rx_fifo_depth;
   717		} else if (tx_fifo_depth >= DW_IC_FIFO_MIN_DEPTH) {
   718			dev->tx_fifo_depth = min_t(u32, dev->tx_fifo_depth,
   719					tx_fifo_depth);
   720			dev->rx_fifo_depth = min_t(u32, dev->rx_fifo_depth,
   721					rx_fifo_depth);
   722		}
   723	
   724		return 0;
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
