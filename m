Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672461CD13
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 10:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716372526; cv=none; b=cKnWfiHhuoNi0xspFnt3srjhwSIwwzB/XV8dbVPLH0Ppeo2lH2Os3MxZu+4sPq7sfbM2lMSUj7v/7dmDeLzctwcTHNkFokWROWycy9FDuq/4cbeYxaZI3Ji3gueTZ6TNUHvgS7JtbECfaMM8HOkBDx3FH1tP5j2tzxhZgbq+X8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716372526; c=relaxed/simple;
	bh=q1mKwHMBwphSnp0PbfAhJjvNMjOoaxhUO3drEPCzuWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BlV44z7f+wBIYGGb4qMPRwaR1Lj3q/MkEJbQhShJGUeIIHUuv1qlg2Ng8CwXerSaHvv23nkw6Sz8i0anicmctvNiB/U/JoTrUrQSMqbpBRDKA6neEW4IpVjehIrpzj6oTe2y4rqq3b/YgmM8y2+zpyq/5WZPUJonszLulQxys6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mv+D5mnJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mv+D5mnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716372524; x=1747908524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1mKwHMBwphSnp0PbfAhJjvNMjOoaxhUO3drEPCzuWY=;
  b=Mv+D5mnJ3uASRCElkmi1Lfsk/LELJ2fJ8HxgGCA05x57iBIal34nZJZq
   bwXvDdJL09kfK3n8zaFjRGrQfDFTtHy5M8z9rUahLRgFjfPHmo7yU6Ukb
   yFlLHtZFVrR8I8ncrqV+ekP6s4YJdRVpnD+dK0cY0mxQn4vo2lw5YQ/iG
   1F0APTP8C6lQGL8YHJRqY/xZh08qaE4wMPM5ZiACc7eEbknH3vqs1TXm2
   JAImes0Qfna0aaw8l5viTLaIVBefy2+hIXt5xi3Liq9x9R5Mv31/YjxsR
   pej/qkFAPJfuZmK82oujsGaKyKiyh7ovnN1ZOgyKvvfldMDSHgmMNKzkl
   w==;
X-CSE-ConnectionGUID: Wz/zyNG+QPS4ZaY8Nrt40A==
X-CSE-MsgGUID: onuoDcn6QjeNb5V6lcrUZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16402094"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="16402094"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 03:08:43 -0700
X-CSE-ConnectionGUID: bxG65zeRTpWyjI8t98eyxQ==
X-CSE-MsgGUID: pFzswIdwR+Sc3zR2071BBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33103871"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 May 2024 03:08:42 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9itk-0001Gn-1d;
	Wed, 22 May 2024 10:08:40 +0000
Date: Wed, 22 May 2024 18:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/sdca-function-devices 25/26]
 include/sound/sdca.h:66:5: warning: no previous prototype for
 'sdca_dev_register_functions'
Message-ID: <202405221730.HdcCPdKg-lkp@intel.com>
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
config: loongarch-randconfig-r071-20240522 (https://download.01.org/0day-ci/archive/20240522/202405221730.HdcCPdKg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405221730.HdcCPdKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405221730.HdcCPdKg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/soundwire/sdw.h:13,
                    from sound/soc/mediatek/mt8186/../../codecs/rt5682.h:18,
                    from sound/soc/mediatek/mt8186/mt8186-mt6366.c:24:
>> include/sound/sdca.h:66:5: warning: no previous prototype for 'sdca_dev_register_functions' [-Wmissing-prototypes]
      66 | int sdca_dev_register_functions(struct sdw_slave *slave)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/sound/sdca.h:70:6: warning: no previous prototype for 'sdca_dev_unregister_functions' [-Wmissing-prototypes]
      70 | void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sdca_dev_register_functions +66 include/sound/sdca.h

    59	
    60	static inline void sdca_lookup_functions(struct sdw_slave *slave) {}
    61	static inline void sdca_lookup_interface_revision(struct sdw_slave *slave) {}
    62	static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk)
    63	{
    64		return false;
    65	}
  > 66	int sdca_dev_register_functions(struct sdw_slave *slave)
    67	{
    68		return 0;
    69	}
  > 70	void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
    71	#endif
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
