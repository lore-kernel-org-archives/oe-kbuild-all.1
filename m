Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F13F8061B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716384098; cv=none; b=eFiObTnyUHMc5fVmnzX0T/1Hu7wRMPF4Nr7sQcxr2ckmDxxaLOAoviRoVuQcn8p4Sp04bZqk2NRtg99nuC8dba8ZRLbZDpyycCzhrfQCd9G0VOdMfFwQU+DSSorbbq6sLXNetk4ARddbjTog0y81VX4fA4SjoZSv//RHS1nZR1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716384098; c=relaxed/simple;
	bh=EbbmwZNGbvNPkcPGsAOeuKACbv8764p7ei7Y7pEtcuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jmrTxBzyicNB7BtU2Pzxn/E8pCwNdMAVhyoXIAiCQRB/b8rfQHgMP9slFp8sXOYo5+yoiFlsNPBONPaimTHwt7huizHaUEMYQ2MFK7KxGJ5A9rnCQPSBeR31WxGgMgME32DbMOYzcYmAtOg3TV/F/1BQI+h8gLflkyMGlHq466U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsGy5JSz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsGy5JSz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716384096; x=1747920096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EbbmwZNGbvNPkcPGsAOeuKACbv8764p7ei7Y7pEtcuE=;
  b=TsGy5JSzcc3NRg2LEneC6jqm8jsK46kX2j8VYcGSa5cpQnWd20ffTLaC
   73Wo50BpxqItTAb82W0iZxr2DoSPtKVpHeDae8vL3ZlTMXVTuu83GQ1VC
   2mG+EGZWvkYt1kwmpEF9uNElgsDQffGrASXN0bj+aITDzp6wc86LL5AqY
   VgCKPAjFfF9/I9sZ6hAD/x7LpbELefW0uDPHcGisCpJCjCfpxfCgY9BaM
   I0vXTq+3HLoMn/JTRVGKDanoLzON5WzLtWiC1Ok9cjwDUa7zotRwdsEbp
   RYvwt9x67uKjfoiQA5ezunziENFjrNa7H+dIqcQF7G+m5rSP7QtCOQsfV
   Q==;
X-CSE-ConnectionGUID: GTAkoG8KQ+OgEGHgkvyQjQ==
X-CSE-MsgGUID: 1pYUb1dKSLK/Ww59gLue0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="23767763"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="23767763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 06:21:35 -0700
X-CSE-ConnectionGUID: mxya+J1eSNq9YdRx8WYK0g==
X-CSE-MsgGUID: HZdit9LsSGWYkrHWKYxSEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="38061142"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 May 2024 06:21:34 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9lu7-0001ab-05;
	Wed, 22 May 2024 13:21:23 +0000
Date: Wed, 22 May 2024 21:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/sdca-function-devices 25/26]
 include/sound/sdca.h:69: multiple definition of
 `sdca_dev_register_functions';
 drivers/soundwire/bus_type.o:include/sound/sdca.h:69: first defined here
Message-ID: <202405222112.XpfJJtBq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/sdca-function-devices
head:   f46b8e859911a824897639b737e4df43e17e1f42
commit: 2ac8e1bbf1ec8eeb41f02e27879939321999656b [25/26] ASoC: SDCA: add function devices
config: i386-randconfig-141-20240522 (https://download.01.org/0day-ci/archive/20240522/202405222112.XpfJJtBq-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405222112.XpfJJtBq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405222112.XpfJJtBq-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/soundwire/bus.o: in function `sdca_dev_register_functions':
>> include/sound/sdca.h:69: multiple definition of `sdca_dev_register_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:69: first defined here
   ld: drivers/soundwire/bus.o: in function `sdca_dev_unregister_functions':
>> include/sound/sdca.h:70: multiple definition of `sdca_dev_unregister_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:70: first defined here
   ld: drivers/soundwire/master.o: in function `sdca_dev_register_functions':
>> include/sound/sdca.h:69: multiple definition of `sdca_dev_register_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:69: first defined here
   ld: drivers/soundwire/master.o: in function `sdca_dev_unregister_functions':
>> include/sound/sdca.h:70: multiple definition of `sdca_dev_unregister_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:70: first defined here
   ld: drivers/soundwire/slave.o: in function `sdca_dev_register_functions':
>> include/sound/sdca.h:69: multiple definition of `sdca_dev_register_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:69: first defined here
   ld: drivers/soundwire/slave.o: in function `sdca_dev_unregister_functions':
>> include/sound/sdca.h:70: multiple definition of `sdca_dev_unregister_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:70: first defined here
   ld: drivers/soundwire/mipi_disco.o: in function `sdca_dev_register_functions':
>> include/sound/sdca.h:69: multiple definition of `sdca_dev_register_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:69: first defined here
   ld: drivers/soundwire/mipi_disco.o: in function `sdca_dev_unregister_functions':
>> include/sound/sdca.h:70: multiple definition of `sdca_dev_unregister_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:70: first defined here
   ld: drivers/soundwire/stream.o: in function `sdca_dev_register_functions':
>> include/sound/sdca.h:69: multiple definition of `sdca_dev_register_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:69: first defined here
   ld: drivers/soundwire/stream.o: in function `sdca_dev_unregister_functions':
>> include/sound/sdca.h:70: multiple definition of `sdca_dev_unregister_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:70: first defined here
   ld: drivers/soundwire/sysfs_slave.o: in function `sdca_dev_register_functions':
>> include/sound/sdca.h:69: multiple definition of `sdca_dev_register_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:69: first defined here
   ld: drivers/soundwire/sysfs_slave.o: in function `sdca_dev_unregister_functions':
>> include/sound/sdca.h:70: multiple definition of `sdca_dev_unregister_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:70: first defined here
   ld: drivers/soundwire/sysfs_slave_dpn.o: in function `sdca_dev_register_functions':
>> include/sound/sdca.h:69: multiple definition of `sdca_dev_register_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:69: first defined here
   ld: drivers/soundwire/sysfs_slave_dpn.o: in function `sdca_dev_unregister_functions':
>> include/sound/sdca.h:70: multiple definition of `sdca_dev_unregister_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:70: first defined here
   ld: drivers/soundwire/debugfs.o: in function `sdca_dev_register_functions':
>> include/sound/sdca.h:69: multiple definition of `sdca_dev_register_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:69: first defined here
   ld: drivers/soundwire/debugfs.o: in function `sdca_dev_unregister_functions':
>> include/sound/sdca.h:70: multiple definition of `sdca_dev_unregister_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:70: first defined here
   ld: drivers/soundwire/irq.o: in function `sdca_dev_register_functions':
>> include/sound/sdca.h:69: multiple definition of `sdca_dev_register_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:69: first defined here
   ld: drivers/soundwire/irq.o: in function `sdca_dev_unregister_functions':
>> include/sound/sdca.h:70: multiple definition of `sdca_dev_unregister_functions'; drivers/soundwire/bus_type.o:include/sound/sdca.h:70: first defined here


vim +69 include/sound/sdca.h

    59	
    60	static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
    61	static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
    62	static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
    63	{
    64		return false;
    65	}
    66	int sdca_dev_register_functions(struct sdw_slave *slave)
    67	{
    68		return 0;
  > 69	}
  > 70	void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
    71	#endif
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
