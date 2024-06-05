Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86C82E403
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717599416; cv=none; b=pbGtMxinz9TJd7qFyaNVeaHm4HN0Kc9Yb6u53K6WgXIE+oNBCQx2xgYikRuOWRh21uABvm0+e5r4j7qjclZt/99P75D3mWPYPPGmw+57ZsKprKn55QKbV88RsKXjKlK9bsx0KasZwXRDdkRBEbDKTuC+RnY/1c73xR61CGkcNIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717599416; c=relaxed/simple;
	bh=GebQ0PUVBHX5d+0GXEuAawR18uNHSv/aJ1Isp0kricg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZWtgFSV2qnu4tNtdpqfF5vJzRB1+4H5lZEfKPsJRJmwlnU15U+FPKjrZBbH+Pp92WDFb6OPx51Jaubkju3r+lDCG01YZA6HHPsPSyQJUSusmF0wn277FSxvPbIsTZLTOn55AHgTTYVk4wRyuxVGwQ0qNLfSh51gzMDecXLKp86U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVtjmIWb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVtjmIWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717599415; x=1749135415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GebQ0PUVBHX5d+0GXEuAawR18uNHSv/aJ1Isp0kricg=;
  b=OVtjmIWbJCMG/kLZryh7x7yXlQ1T7z+NKbW5AnLspAKZbEK9ZNWe6WWT
   HsHAZ8vkpf9q47F0dY9idCGKDOxsvtiUh59pF7WXBpzUivTSCkD4dtt6v
   V0eRAGl8zDEhglcRIOPenwt8pC3pWUTNvAFDDD2z59pdI65upI0OZEKCm
   gCbAN7w3AFu1X+vWWZ9RNqS076kOdG2gpAgY4JqhtnYQhdI7om9upmzWw
   C0BGOKNG9ex8fcSF5ZzSvHTpLAIZhTHSm8BDbSA9VzQvnptCQMUS1nfwe
   du/EMj1aRHT8C1ltNIXGxKu5yDGHQoLkKTe5LTm3JIkkpWtL3z3jiZX4z
   g==;
X-CSE-ConnectionGUID: wXJnQRiTShavNXXjKn7OoA==
X-CSE-MsgGUID: 4QByhbodTE6gCrVOUYEhBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14333050"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="14333050"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 07:56:52 -0700
X-CSE-ConnectionGUID: 2xdzCP6kQ56AQzcEpIIAzw==
X-CSE-MsgGUID: MKUPsCPeQMWDYKiOfmr/Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="42074955"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2024 07:56:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEs4F-0001lo-28;
	Wed, 05 Jun 2024 14:56:47 +0000
Date: Wed, 5 Jun 2024 22:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/sdca-interrupt-handler 22/24]
 sound/soc/sdca/sdca_interrupts.c:285:6: error: redefinition of
 'sdca_interrupt_clear_history'
Message-ID: <202406052259.WanpSd1N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/sdca-interrupt-handler
head:   29c13e7e99fdbbe864c31571d446c99b46cacdfc
commit: 8f80b6d5086267ba847153ddf5ab9413d2ccc6fb [22/24] sdca_interrupts: add detected_mask
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240605/202406052259.WanpSd1N-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406052259.WanpSd1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406052259.WanpSd1N-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/soundwire/sdw.h:13,
                    from sound/soc/sdca/sdca_interrupts.c:10:
>> include/sound/sdca.h:146:6: warning: no previous prototype for 'sdca_interrupt_clear_history' [-Wmissing-prototypes]
     146 | void sdca_interrupt_clear_history(struct sdw_slave *slave, u32 preserve_mask) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdca/sdca_interrupts.c:21:5: error: redefinition of 'sdca_interrupt_info_alloc'
      21 | int sdca_interrupt_info_alloc(struct sdw_slave *slave)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:115:19: note: previous definition of 'sdca_interrupt_info_alloc' with type 'int(struct sdw_slave *)'
     115 | static inline int sdca_interrupt_info_alloc(struct sdw_slave *slave)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdca/sdca_interrupts.c:44:6: error: redefinition of 'sdca_interrupt_info_release'
      44 | void sdca_interrupt_info_release(struct sdw_slave *slave)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:120:20: note: previous definition of 'sdca_interrupt_info_release' with type 'void(struct sdw_slave *)'
     120 | static inline void sdca_interrupt_info_release(struct sdw_slave *slave) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdca/sdca_interrupts.c:66:5: error: redefinition of 'sdca_interrupt_info_reset'
      66 | int sdca_interrupt_info_reset(struct sdw_slave *slave)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:122:19: note: previous definition of 'sdca_interrupt_info_reset' with type 'int(struct sdw_slave *)'
     122 | static inline int sdca_interrupt_info_reset(struct sdw_slave *slave)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdca/sdca_interrupts.c:90:5: error: redefinition of 'sdca_interrupt_initialize'
      90 | int sdca_interrupt_initialize(struct sdw_slave *slave,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:127:19: note: previous definition of 'sdca_interrupt_initialize' with type 'int(struct sdw_slave *, int)'
     127 | static inline int sdca_interrupt_initialize(struct sdw_slave *slave,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdca/sdca_interrupts.c:120:5: error: redefinition of 'sdca_interrupt_register_source'
     120 | int sdca_interrupt_register_source(struct sdw_slave *slave,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:133:19: note: previous definition of 'sdca_interrupt_register_source' with type 'int(struct sdw_slave *, struct sdca_interrupt_source *)'
     133 | static inline int sdca_interrupt_register_source(struct sdw_slave *slave,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdca/sdca_interrupts.c:209:5: error: redefinition of 'sdca_interrupt_enable'
     209 | int sdca_interrupt_enable(struct sdw_slave *slave,
         |     ^~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:139:19: note: previous definition of 'sdca_interrupt_enable' with type 'int(struct sdw_slave *, u32,  bool)' {aka 'int(struct sdw_slave *, unsigned int,  _Bool)'}
     139 | static inline int sdca_interrupt_enable(struct sdw_slave *slave,
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sdca/sdca_interrupts.c:285:6: error: redefinition of 'sdca_interrupt_clear_history'
     285 | void sdca_interrupt_clear_history(struct sdw_slave *slave, u32 preserve_mask)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:146:6: note: previous definition of 'sdca_interrupt_clear_history' with type 'void(struct sdw_slave *, u32)' {aka 'void(struct sdw_slave *, unsigned int)'}
     146 | void sdca_interrupt_clear_history(struct sdw_slave *slave, u32 preserve_mask) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdca/sdca_interrupts.c:375:5: error: redefinition of 'sdca_interrupt_handler'
     375 | int sdca_interrupt_handler(struct sdw_slave *slave)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/sound/sdca.h:148:19: note: previous definition of 'sdca_interrupt_handler' with type 'int(struct sdw_slave *)'
     148 | static inline int sdca_interrupt_handler(struct sdw_slave *slave)
         |                   ^~~~~~~~~~~~~~~~~~~~~~


vim +/sdca_interrupt_clear_history +285 sound/soc/sdca/sdca_interrupts.c

   284	
 > 285	void sdca_interrupt_clear_history(struct sdw_slave *slave, u32 preserve_mask)
   286	{
   287		struct sdca_interrupt_info *interrupt_info;
   288	
   289		interrupt_info = slave->sdca_data.interrupt_info;
   290	
   291		/*
   292		 * Clear all history except for the interrupts set in preserve_mask.
   293		 * This is very useful for SDCA UMP processing, where the
   294		 * interrupt is only thrown once when the ownership changes to
   295		 * HOST. If the processing happens in a work queue, and a new interrupt
   296		 * cancels the work queue, the interrupt will not be signaled again
   297		 */
   298		interrupt_info->detected_interrupt_mask &= preserve_mask;
   299	}
   300	EXPORT_SYMBOL_NS(sdca_interrupt_clear_history, SND_SOC_SDCA_IRQ_HANDLER);
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
