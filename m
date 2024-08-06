Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396EC3612D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 22:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722983197; cv=none; b=WucXhLphUhkW0257XoH5etkBXcLNdwK10NHyo7Isdh0fl3wlYbkJB+wW2dZJIKKKAA5IpCB/ndp+pxsr+u74/4I0PIbAi41otBQk2R7PFg4ATft+yQXCo95i4338eFb08l4AQUde0Z6znALl+9kIY/7O5Se7oTopYIZlDSvwpEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722983197; c=relaxed/simple;
	bh=0T80cfqZ0UgDh5tioHXH3FJUxPD567GEWKTXZfXUZng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=au0M1zxBoBaAToG76BLFt+Qa7uLHzixZXCf7s3SRxTxpq8aBM48ZWMr+piqdXu6nvc1eDwRo4ry8CgS/qClvXyZ6Ytv0hijub1N/4qh3GlDc0Fa8squGXfrmmMgEsabXqArYKsKfO7ICJcNae4dS/gO97enI++4A7LuAdAzY7DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6YVXwF+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6YVXwF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722983195; x=1754519195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0T80cfqZ0UgDh5tioHXH3FJUxPD567GEWKTXZfXUZng=;
  b=d6YVXwF+sZjdnh0s9nw0Su5N6Bu3as2wtwKagAYeAsxB9I87R7pSI9cN
   WtYm7VAz0k2w3lNEKdLgwgfM+rmFdi/WGems8gDqJeilzplI21VM80i9l
   m4hctxWb5CshlGPvsb9jGkqpmeXgEVIFvSEqQNhvA/1RLtMNsXY9sbonO
   YDAPkp4qZv65b8eDGVQvdYsA1+nlUE/wpLCSKjBPOjU6Tl11yTdsYmKGM
   XWPNpTMc4X45uS0gk+v+0vH1VJ9anyG9uTr+7grhtCWszrhJ0FXfjPnFW
   D/tPd09/0RV44ZpzfvjBZCiGbuGwaOupKsTmOQmwndW8Pwr2g6uqV/7D7
   w==;
X-CSE-ConnectionGUID: 9AVU4/nHRL6HxImWdbmf8g==
X-CSE-MsgGUID: +yWe4JZETrqgXDTVmSp5+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="31660272"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="31660272"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 15:26:35 -0700
X-CSE-ConnectionGUID: tJxHI7OnQY6+vbtn2VVYfA==
X-CSE-MsgGUID: 7HvdbTirQ9G3bghfpsau/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="61595639"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Aug 2024 15:26:34 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbSdT-0004sS-0b;
	Tue, 06 Aug 2024 22:26:31 +0000
Date: Wed, 7 Aug 2024 06:25:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/sdca-library 14/16]
 sound/soc/sdca/sdca_interrupts.c:328:2: error: use of undeclared identifier
 'registered_source_mask'
Message-ID: <202408070603.lKNbsScC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pierre-Louis,

First bad commit (maybe != root cause):

tree:   https://github.com/plbossart/sound sdw/sdca-library
head:   86fef73acfdde4617610445f764813129e80587e
commit: 85417b9e17ebe038d2927b99da842ccb29a8a131 [14/16] ASoC: rt711-sdca: use generic SDCA interrupt handler
config: i386-buildonly-randconfig-004-20240807 (https://download.01.org/0day-ci/archive/20240807/202408070603.lKNbsScC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070603.lKNbsScC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070603.lKNbsScC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sdca/sdca_interrupts.c:328:2: error: use of undeclared identifier 'registered_source_mask'
     328 |         registered_source_mask = interrupt_info->registered_source_mask >> (reg_index << 3);
         |         ^
   sound/soc/sdca/sdca_interrupts.c:329:16: error: use of undeclared identifier 'registered_source_mask'
     329 |         if (status & ~registered_source_mask) {
         |                       ^
   sound/soc/sdca/sdca_interrupts.c:332:28: error: use of undeclared identifier 'registered_source_mask'
     332 |                                      __func__, status, registered_source_mask);
         |                                                        ^
   sound/soc/sdca/sdca_interrupts.c:334:29: error: use of undeclared identifier 'registered_source_mask'
     334 |         status_filtered = status & registered_source_mask;
         |                                    ^
   sound/soc/sdca/sdca_interrupts.c:374:30: error: use of undeclared identifier 'registered_source_mask'
     374 |                 status_filtered = status & registered_source_mask;
         |                                            ^
   5 errors generated.


vim +/registered_source_mask +328 sound/soc/sdca/sdca_interrupts.c

00aeb217afea12 Pierre-Louis Bossart 2024-05-30  301  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  302  /* helper called with the 'irq_lock' mutex held */
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  303  static int sdca_interrupt_register_handler(struct sdw_slave *slave,
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  304  					   struct sdca_interrupt_info *interrupt_info,
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  305  					   int reg_index)
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  306  {
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  307  	struct device *dev = &slave->dev;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  308  	unsigned long status_filtered;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  309  	unsigned long status2;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  310  	unsigned long status;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  311  	const int retry = 3;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  312  	int count = 0;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  313  	int bit;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  314  	int ret;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  315  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  316  	ret = sdw_read_no_pm(slave, SDW_SCP_SDCA_INT1 + reg_index);
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  317  	if (ret < 0) {
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  318  		dev_err_ratelimited(dev,
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  319  				    "%s: read of SDW_SCP_SDCA_INT%d failed: %d\n",
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  320  				    __func__, reg_index + 1, ret);
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  321  		goto io_error;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  322  	}
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  323  	status = ret;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  324  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  325  	if (!status)
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  326  		return 0;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  327  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30 @328  	registered_source_mask = interrupt_info->registered_source_mask >> (reg_index << 3);
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  329  	if (status & ~registered_source_mask) {
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  330  		dev_warn_ratelimited(dev,
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  331  				     "%s: interrupt %#x, registered sources %#x, unregistered sources will be ignored\n",
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  332  				     __func__, status, registered_source_mask);
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  333  	}
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  334  	status_filtered = status & registered_source_mask;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  335  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  336  	do {
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  337  		/*
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  338  		 * Record detected interrupt sources, source-specific actions
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  339  		 * will be taken after all interrupts have been cleared.
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  340  		 */
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  341  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  342  		for_each_set_bit(bit, &status_filtered, 8) {
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  343  			int index = (reg_index << 3) + bit;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  344  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  345  			interrupt_info->detected_interrupt_mask |= BIT(index);
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  346  		}
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  347  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  348  		/* clear the interrupts, including unregistered ones, for this register */
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  349  		ret = sdw_write_no_pm(slave,
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  350  				      SDW_SCP_SDCA_INT1 + reg_index,
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  351  				      status);
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  352  		if (ret < 0) {
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  353  			dev_err_ratelimited(dev,
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  354  					    "%s: write to SDW_SCP_SDCA_INT%d failed: %d\n",
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  355  					    __func__, reg_index + 1, ret);
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  356  			goto io_error;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  357  		}
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  358  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  359  		/*
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  360  		 * The SoundWire specification requires an additional read to make sure
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  361  		 * no interrupts are lost
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  362  		 */
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  363  		ret = sdw_read_no_pm(slave, SDW_SCP_SDCA_INT1 + reg_index);
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  364  		if (ret < 0) {
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  365  			dev_err_ratelimited(dev,
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  366  					    "%s: re-read of SDW_SCP_SDCA_INT%d failed: %d\n",
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  367  					    __func__, reg_index + 1, ret);
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  368  			goto io_error;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  369  		}
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  370  		status2 = ret;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  371  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  372  		/* filter to limit loop to interrupts identified in the first status read */
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  373  		status &= status2;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  374  		status_filtered = status & registered_source_mask;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  375  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  376  		count++;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  377  	} while (status_filtered && (count < retry));
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  378  
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  379  	if (count == retry)
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  380  		dev_warn_ratelimited(dev,
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  381  				     "%s: Reached max_retry %d on SDW_SCP_SDCA_INT%d\n",
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  382  				     __func__, retry, reg_index + 1);
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  383  io_error:
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  384  	return ret;
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  385  }
00aeb217afea12 Pierre-Louis Bossart 2024-05-30  386  

:::::: The code at line 328 was first introduced by commit
:::::: 00aeb217afea12f802d74042d21e8894becb69f5 ASoC: SDCA: add helpers to handle SDCA interrupt sources

:::::: TO: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
:::::: CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
