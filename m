Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192B3224E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 22:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYgCqJlw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702506620; x=1734042620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVGJUpyHKIKMh8bBTmXBx97y+0Rh1eyy+jATrJSpG1E=;
  b=OYgCqJlwuZidswODWgb8JX00Z333HZk3pz+X9ECoSs3LGcYqvLH25G/m
   K6m2fDFWvS/9iLYihO7jZ9c3iDWSmFEGLSqiQAR98KtH9Lm5yUGyfKuNQ
   dDtuLLPfuxXD5fTtpTTwdTlCU1VlGI7p+6PV1pR5vYM80TxKtg/p99x8a
   Wo/VTOfK2i4eIaGBsNLH+kQW6Lud9dfEhYhp/D0dQSYz2WhjMAKwN6Gbp
   +2kT9zfhUMF5ctUAUMrnLf2GPsl+dBS6OCVrThYOGjXG6Tn9nZKhAMHc6
   X7e87rA4/tL17soLDWx0+iqWcNJnzIeUd2tV14y/8Ep1SEaXHYhJgFlFR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="459357005"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="459357005"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 14:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="777667060"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="777667060"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Dec 2023 14:30:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDXk7-000LDp-0E;
	Wed, 13 Dec 2023 22:30:15 +0000
Date: Thu, 14 Dec 2023 06:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Matyas <daniel.matyas@analog.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 6248/7300] drivers/hwmon/max31827.c:394:16:
 sparse: sparse: dubious: x & !y
Message-ID: <202312140633.nmHowPIh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
commit: 88548710d2aed71677f7594a78219bf081d4297f [6248/7300] hwmon: (max31827) Handle new properties from the devicetree
config: arc-randconfig-r131-20231212 (https://download.01.org/0day-ci/archive/20231214/202312140633.nmHowPIh-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312140633.nmHowPIh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140633.nmHowPIh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/max31827.c:394:16: sparse: sparse: dubious: x & !y
   drivers/hwmon/max31827.c:401:24: sparse: sparse: dubious: x & !y

vim +394 drivers/hwmon/max31827.c

   373	
   374	static int max31827_init_client(struct max31827_state *st,
   375					struct device *dev)
   376	{
   377		struct fwnode_handle *fwnode;
   378		unsigned int res = 0;
   379		u32 data, lsb_idx;
   380		bool prop;
   381		int ret;
   382	
   383		fwnode = dev_fwnode(dev);
   384	
   385		st->enable = true;
   386		res |= MAX31827_DEVICE_ENABLE(1);
   387	
   388		res |= MAX31827_CONFIGURATION_RESOLUTION_MASK;
   389	
   390		prop = fwnode_property_read_bool(fwnode, "adi,comp-int");
   391		res |= FIELD_PREP(MAX31827_CONFIGURATION_COMP_INT_MASK, prop);
   392	
   393		prop = fwnode_property_read_bool(fwnode, "adi,timeout-enable");
 > 394		res |= FIELD_PREP(MAX31827_CONFIGURATION_TIMEOUT_MASK, !prop);
   395	
   396		if (fwnode_property_present(fwnode, "adi,alarm-pol")) {
   397			ret = fwnode_property_read_u32(fwnode, "adi,alarm-pol", &data);
   398			if (ret)
   399				return ret;
   400	
   401			res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK, !!data);
   402		} else {
   403			/*
   404			 * Set default value.
   405			 */
   406			res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
   407					  MAX31827_ALRM_POL_LOW);
   408		}
   409	
   410		if (fwnode_property_present(fwnode, "adi,fault-q")) {
   411			ret = fwnode_property_read_u32(fwnode, "adi,fault-q", &data);
   412			if (ret)
   413				return ret;
   414	
   415			/*
   416			 * Convert the desired fault queue into register bits.
   417			 */
   418			if (data != 0)
   419				lsb_idx = __ffs(data);
   420	
   421			if (hweight32(data) != 1 || lsb_idx > 4) {
   422				dev_err(dev, "Invalid data in adi,fault-q\n");
   423				return -EINVAL;
   424			}
   425	
   426			res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK, lsb_idx);
   427		} else {
   428			/*
   429			 * Set default value.
   430			 */
   431			res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
   432					  MAX31827_FLT_Q_1);
   433		}
   434	
   435		return regmap_write(st->regmap, MAX31827_CONFIGURATION_REG, res);
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
