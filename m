Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E6323746
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716031992; cv=none; b=mJB5XOqaXNb3zfMO86XcehEQi1duD2F3eKMEZ5285n+syqE8r1AhdAqBrC4oqXWlGPy932YzaKMYxfj3w0r6C6jK/McjuyZtd7FOXYefSoGFam3sUqCx7HcgqPRr34hjhMNcF1Ax/gOfwOYP/+N0bbLY8qlFvf0/Y4BRF4tgU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716031992; c=relaxed/simple;
	bh=Wrvmy5WK+iyOuMnPQ6wNk9jg7NA/MbCxu3Fki4KXNb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JlndoyK6Wn86kHEN2fp7CX5LdCl0mW1kF40VapU61lTPHQVuqFFUf8GltTNMVf0rnSKBDNE3urZGvOY/iP/NHGuZHhFTW4OqdNcvWSA5Mkx+XzZ6Cwr5Bk3tNQy5vdigEGrpNZz3bgGlYvqXrr5oHnEmDhrSshxFVCGe8VnORKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAHI3xvb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAHI3xvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716031989; x=1747567989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wrvmy5WK+iyOuMnPQ6wNk9jg7NA/MbCxu3Fki4KXNb0=;
  b=LAHI3xvbQh633PPEQ6YSsTIcgFOSAmcYnPrNg1FPttU6QCXRXMEz1O4M
   Qr/p7UScilFKjTqDi1WMGexOX/NigM2c4+Rm+kq/LnLKtcgbtwl8Z4SDJ
   EqYIiTxoSugGYtE6i+PXyQ0j/tOulMDyVb2SFzWPaf+iAZjvn4z2ajODD
   5wYMEgjehpNd8AZDcuAMUhT+7SnVAl4C56TEkM2pug4B+qfBYVNGjTqz+
   zW8Xu3TwywkWImkP2AwhGCF2IrOYhp0TvAuk78DYY0aJUDscGY9lRhqno
   FQACPG1l7iAExdKm6rHrJuBQFdyLZhEIooYqfkSWA10eaEA/TCeBYP3HT
   A==;
X-CSE-ConnectionGUID: LQry64eQRcCdBMf7LnSJOw==
X-CSE-MsgGUID: zDpa2QvSSgWJQ2qODJq29g==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12154030"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="12154030"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 04:33:09 -0700
X-CSE-ConnectionGUID: cqIogxynSfGkEkUjhmztCw==
X-CSE-MsgGUID: BXSUG3nCQGWpdtakt2kQNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="62893216"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 May 2024 04:33:08 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8IJG-00028y-00;
	Sat, 18 May 2024 11:33:06 +0000
Date: Sat, 18 May 2024 19:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/rt712-quirks 17/25]
 drivers/soundwire/amd_init.c:181:18: error: 'struct sdw_amd_ctx' has no
 member named 'ids'
Message-ID: <202405181943.2VOkQ62s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/rt712-quirks
head:   ff658f42df42bc9bb86c54be12714ed220b88994
commit: 2e90b1ef0200f17af369e575e92d915a4f7e9db4 [17/25] soundwire: AMD: remove unused structure members
config: i386-buildonly-randconfig-001-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181943.2VOkQ62s-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181943.2VOkQ62s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181943.2VOkQ62s-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soundwire/amd_init.c: In function 'sdw_amd_exit':
>> drivers/soundwire/amd_init.c:181:18: error: 'struct sdw_amd_ctx' has no member named 'ids'
     181 |         kfree(ctx->ids);
         |                  ^~
   drivers/soundwire/amd_init.c: In function 'sdw_amd_get_slave_info':
   drivers/soundwire/amd_init.c:208:12: error: 'struct sdw_amd_ctx' has no member named 'ids'
     208 |         ctx->ids = kcalloc(num_slaves, sizeof(*ctx->ids), GFP_KERNEL);
         |            ^~
   drivers/soundwire/amd_init.c:208:51: error: 'struct sdw_amd_ctx' has no member named 'ids'
     208 |         ctx->ids = kcalloc(num_slaves, sizeof(*ctx->ids), GFP_KERNEL);
         |                                                   ^~
   drivers/soundwire/amd_init.c:209:17: error: 'struct sdw_amd_ctx' has no member named 'ids'
     209 |         if (!ctx->ids)
         |                 ^~
>> drivers/soundwire/amd_init.c:211:12: error: 'struct sdw_amd_ctx' has no member named 'num_slaves'
     211 |         ctx->num_slaves = num_slaves;
         |            ^~
   drivers/soundwire/amd_init.c:219:36: error: 'struct sdw_amd_ctx' has no member named 'ids'
     219 |                                 ctx->ids[i].id = slave->id;
         |                                    ^~
   drivers/soundwire/amd_init.c:220:36: error: 'struct sdw_amd_ctx' has no member named 'ids'
     220 |                                 ctx->ids[i].link_id = bus->link_id;
         |                                    ^~


vim +181 drivers/soundwire/amd_init.c

ed5e8741b8db90 Vijendar Mukunda 2024-01-29  177  
ed5e8741b8db90 Vijendar Mukunda 2024-01-29  178  void sdw_amd_exit(struct sdw_amd_ctx *ctx)
ed5e8741b8db90 Vijendar Mukunda 2024-01-29  179  {
ed5e8741b8db90 Vijendar Mukunda 2024-01-29  180  	sdw_amd_cleanup(ctx);
ed5e8741b8db90 Vijendar Mukunda 2024-01-29 @181  	kfree(ctx->ids);
ed5e8741b8db90 Vijendar Mukunda 2024-01-29  182  	kfree(ctx);
ed5e8741b8db90 Vijendar Mukunda 2024-01-29  183  }
ed5e8741b8db90 Vijendar Mukunda 2024-01-29  184  EXPORT_SYMBOL_NS(sdw_amd_exit, SOUNDWIRE_AMD_INIT);
ed5e8741b8db90 Vijendar Mukunda 2024-01-29  185  
aff9d088a30654 Vijendar Mukunda 2024-01-29  186  int sdw_amd_get_slave_info(struct sdw_amd_ctx *ctx)
aff9d088a30654 Vijendar Mukunda 2024-01-29  187  {
aff9d088a30654 Vijendar Mukunda 2024-01-29  188  	struct amd_sdw_manager *amd_manager;
aff9d088a30654 Vijendar Mukunda 2024-01-29  189  	struct sdw_bus *bus;
aff9d088a30654 Vijendar Mukunda 2024-01-29  190  	struct sdw_slave *slave;
aff9d088a30654 Vijendar Mukunda 2024-01-29  191  	struct list_head *node;
aff9d088a30654 Vijendar Mukunda 2024-01-29  192  	int index;
aff9d088a30654 Vijendar Mukunda 2024-01-29  193  	int i = 0;
aff9d088a30654 Vijendar Mukunda 2024-01-29  194  	int num_slaves = 0;
aff9d088a30654 Vijendar Mukunda 2024-01-29  195  
aff9d088a30654 Vijendar Mukunda 2024-01-29  196  	for (index = 0; index < ctx->count; index++) {
aff9d088a30654 Vijendar Mukunda 2024-01-29  197  		if (!(ctx->link_mask & BIT(index)))
aff9d088a30654 Vijendar Mukunda 2024-01-29  198  			continue;
aff9d088a30654 Vijendar Mukunda 2024-01-29  199  		amd_manager = dev_get_drvdata(&ctx->pdev[index]->dev);
aff9d088a30654 Vijendar Mukunda 2024-01-29  200  		if (!amd_manager)
aff9d088a30654 Vijendar Mukunda 2024-01-29  201  			return -ENODEV;
aff9d088a30654 Vijendar Mukunda 2024-01-29  202  		bus = &amd_manager->bus;
aff9d088a30654 Vijendar Mukunda 2024-01-29  203  		/* Calculate number of slaves */
aff9d088a30654 Vijendar Mukunda 2024-01-29  204  		list_for_each(node, &bus->slaves)
aff9d088a30654 Vijendar Mukunda 2024-01-29  205  			num_slaves++;
aff9d088a30654 Vijendar Mukunda 2024-01-29  206  	}
aff9d088a30654 Vijendar Mukunda 2024-01-29  207  
aff9d088a30654 Vijendar Mukunda 2024-01-29  208  	ctx->ids = kcalloc(num_slaves, sizeof(*ctx->ids), GFP_KERNEL);
aff9d088a30654 Vijendar Mukunda 2024-01-29  209  	if (!ctx->ids)
aff9d088a30654 Vijendar Mukunda 2024-01-29  210  		return -ENOMEM;
aff9d088a30654 Vijendar Mukunda 2024-01-29 @211  	ctx->num_slaves = num_slaves;
aff9d088a30654 Vijendar Mukunda 2024-01-29  212  	for (index = 0; index < ctx->count; index++) {
aff9d088a30654 Vijendar Mukunda 2024-01-29  213  		if (!(ctx->link_mask & BIT(index)))
aff9d088a30654 Vijendar Mukunda 2024-01-29  214  			continue;
aff9d088a30654 Vijendar Mukunda 2024-01-29  215  		amd_manager = dev_get_drvdata(&ctx->pdev[index]->dev);
aff9d088a30654 Vijendar Mukunda 2024-01-29  216  		if (amd_manager) {
aff9d088a30654 Vijendar Mukunda 2024-01-29  217  			bus = &amd_manager->bus;
aff9d088a30654 Vijendar Mukunda 2024-01-29  218  			list_for_each_entry(slave, &bus->slaves, node) {
aff9d088a30654 Vijendar Mukunda 2024-01-29  219  				ctx->ids[i].id = slave->id;
aff9d088a30654 Vijendar Mukunda 2024-01-29  220  				ctx->ids[i].link_id = bus->link_id;
aff9d088a30654 Vijendar Mukunda 2024-01-29  221  				i++;
aff9d088a30654 Vijendar Mukunda 2024-01-29  222  			}
aff9d088a30654 Vijendar Mukunda 2024-01-29  223  		}
aff9d088a30654 Vijendar Mukunda 2024-01-29  224  	}
aff9d088a30654 Vijendar Mukunda 2024-01-29  225  	return 0;
aff9d088a30654 Vijendar Mukunda 2024-01-29  226  }
aff9d088a30654 Vijendar Mukunda 2024-01-29  227  EXPORT_SYMBOL_NS(sdw_amd_get_slave_info, SOUNDWIRE_AMD_INIT);
aff9d088a30654 Vijendar Mukunda 2024-01-29  228  

:::::: The code at line 181 was first introduced by commit
:::::: ed5e8741b8db908d51a26e368c18573ee1b9e208 soundwire: amd: refactor amd soundwire manager device node creation

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
