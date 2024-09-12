Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B79718FDD7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 18:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726166360; cv=none; b=h5T3NMMBXstdsChChvxRnLgu4f6cXMqHMkYxodt9T3As31SRKKZi0Ye6RQ1EEXCnC0TajrLz2c/NR+z4h3p1izjYaH3OS1Kvh/0BFKHnLH4y7pRwsqdFH1ag2ENBV4OBlvhWRQkPc+NhdeVxtgHdIF8Vbac3PxMsNGChrA4OosY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726166360; c=relaxed/simple;
	bh=Q+DF7sFGI+2zyRVMNnYbv8udmxERp3hdi/2nQ/9gTkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eEgAimbjRYcwtpoom5C5Id/oaLOYaAP9CvbQlNhJUihn47NNig/w718q6IqQKojj5VtKyAonP2mrkwdNtDQMXOD0SleL9ALCf7vk7yh7wmZsOykldpPdl+7WimgHMwpCubCoIO8bFvocUvY3lErXtCKBFVPhzVz0GkAFZV0dHZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8iyXDNb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8iyXDNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726166359; x=1757702359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q+DF7sFGI+2zyRVMNnYbv8udmxERp3hdi/2nQ/9gTkc=;
  b=c8iyXDNbJCIFbqVlHd6o4kqd+KgG/iDwaHwwyPEXk7QLbm+aai8lmxr4
   9qm6FAfB5dD4J5jjQeMrbX/3ydIv1JJpE04RoEFnTEyAFtkUkJo7LlkDR
   mUqX4RSctEKYZzfUlzzpohKbSuu5cuBAGqhibPmnRj7ZFSHhcFhzVb6tC
   IswBp4AAK1HdAj7z9HOgRljpXSg9dYL9sAxYYP2xP+6xQ26FHOjaSoP7t
   6Q2jBwp1RwVcTsxoSb41SnFGYh1lhxnMdtGlXOXpPDPtkiWD8xtSrnwHy
   R5k0D6iA/fUWb4Wv4VOMuzAWFaJfjNC7W7WEnaJp9TGPlr68UlN/TCO18
   g==;
X-CSE-ConnectionGUID: Ho271/4sRqak2zBXxcA1ew==
X-CSE-MsgGUID: sy8lYxGMQD6cqezgyYylFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36183082"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="36183082"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 11:39:18 -0700
X-CSE-ConnectionGUID: yWJ9zHPaQL+n4QTIQwiNsg==
X-CSE-MsgGUID: sN86by69RP6ZVTyRumj9Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="72398525"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Sep 2024 11:39:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sooin-0005aa-2S;
	Thu, 12 Sep 2024 18:39:13 +0000
Date: Fri, 13 Sep 2024 02:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 12/18]
 drivers/firmware/arm_scpi.c:698:29: error: incompatible integer to pointer
 conversion passing 'u32' (aka 'unsigned int') to parameter of type 'struct
 dev_pm_opp_data *'
Message-ID: <202409130215.BqjQDPEQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b18f8bbc044f476aea4146be141bb9c5430b2a12
commit: adf41f47375e07a1c8c96bc53945ae6e30d6615d [12/18] BACKPORT: OPP: Add dev_pm_opp_add_dynamic() to allow more flexibility
config: x86_64-buildonly-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240913/202409130215.BqjQDPEQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130215.BqjQDPEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130215.BqjQDPEQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scpi.c:698:29: error: incompatible integer to pointer conversion passing 'u32' (aka 'unsigned int') to parameter of type 'struct dev_pm_opp_data *' [-Wint-conversion]
     698 |                 ret = dev_pm_opp_add(dev, opp->freq, opp->m_volt * 1000);
         |                                           ^~~~~~~~~
   include/linux/pm_opp.h:312:60: note: passing argument to parameter 'opp' here
     312 | dev_pm_opp_add(struct device *dev, struct dev_pm_opp_data *opp, unsigned long u_volt)
         |                                                            ^
   1 error generated.


vim +698 drivers/firmware/arm_scpi.c

45ca7df7c34546 Sudeep Holla 2017-04-27  684  
45ca7df7c34546 Sudeep Holla 2017-04-27  685  static int scpi_dvfs_add_opps_to_device(struct device *dev)
45ca7df7c34546 Sudeep Holla 2017-04-27  686  {
45ca7df7c34546 Sudeep Holla 2017-04-27  687  	int idx, ret;
45ca7df7c34546 Sudeep Holla 2017-04-27  688  	struct scpi_opp *opp;
45ca7df7c34546 Sudeep Holla 2017-04-27  689  	struct scpi_dvfs_info *info = scpi_dvfs_info(dev);
45ca7df7c34546 Sudeep Holla 2017-04-27  690  
45ca7df7c34546 Sudeep Holla 2017-04-27  691  	if (IS_ERR(info))
45ca7df7c34546 Sudeep Holla 2017-04-27  692  		return PTR_ERR(info);
45ca7df7c34546 Sudeep Holla 2017-04-27  693  
45ca7df7c34546 Sudeep Holla 2017-04-27  694  	if (!info->opps)
45ca7df7c34546 Sudeep Holla 2017-04-27  695  		return -EIO;
45ca7df7c34546 Sudeep Holla 2017-04-27  696  
45ca7df7c34546 Sudeep Holla 2017-04-27  697  	for (opp = info->opps, idx = 0; idx < info->count; idx++, opp++) {
45ca7df7c34546 Sudeep Holla 2017-04-27 @698  		ret = dev_pm_opp_add(dev, opp->freq, opp->m_volt * 1000);
45ca7df7c34546 Sudeep Holla 2017-04-27  699  		if (ret) {
45ca7df7c34546 Sudeep Holla 2017-04-27  700  			dev_warn(dev, "failed to add opp %uHz %umV\n",
45ca7df7c34546 Sudeep Holla 2017-04-27  701  				 opp->freq, opp->m_volt);
45ca7df7c34546 Sudeep Holla 2017-04-27  702  			while (idx-- > 0)
45ca7df7c34546 Sudeep Holla 2017-04-27  703  				dev_pm_opp_remove(dev, (--opp)->freq);
45ca7df7c34546 Sudeep Holla 2017-04-27  704  			return ret;
45ca7df7c34546 Sudeep Holla 2017-04-27  705  		}
45ca7df7c34546 Sudeep Holla 2017-04-27  706  	}
45ca7df7c34546 Sudeep Holla 2017-04-27  707  	return 0;
45ca7df7c34546 Sudeep Holla 2017-04-27  708  }
45ca7df7c34546 Sudeep Holla 2017-04-27  709  

:::::: The code at line 698 was first introduced by commit
:::::: 45ca7df7c345465dbd2426a33012c9c33d27de62 firmware: arm_scpi: add support to populate OPPs and get transition latency

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
