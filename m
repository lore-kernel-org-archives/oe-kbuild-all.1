Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DED715B980
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 05:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716960271; cv=none; b=YL+lfxfT/VmxIGhuddZh9pRDWy6D+uSxNQwUolAdUtUc5rodGCnXCzMwEI9usDe8QkXTUexCjV+72XjwdgAaBB/p6xNhrzFfJI68EeaiOEdmsIIw/OM9zat0O1z9ZCcd33911W5fwciXXFuRvCwg3u6u6TIIoNrQZ/Jg0H2cmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716960271; c=relaxed/simple;
	bh=Gd63o1EZEgIPPYuiQc1nyiBy2S6S9bQDHLhJNfdoxkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bnbU5PK8KUqIYE1Ctfq/cHNeiGvRZbKqbjqsqxEnA6/ynVPTyfPkEmtwcRmsL0+zNai+1ZC+gWptMPfGUe3Y8oLLlO/Y5y158U6DiWlI0rvnsKHBtbo32ZXOiQuz1rVokhBnrFE/aJ1YCvj/O/d7WBm+MJ0Pdyu4n44dwwmgAQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CILrmLjr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CILrmLjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716960270; x=1748496270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gd63o1EZEgIPPYuiQc1nyiBy2S6S9bQDHLhJNfdoxkY=;
  b=CILrmLjr3fcwZYqDgYVBB3+wGBz8WWqb39oiJZqamaOITR3Ot2eMMUrQ
   qKvI1m1F2vxdYq5Fnl+hf6q32oV+FWEc5ToC3b+PIAf5qRswY8++AvPXM
   Wqn/DDLhtyZ5Bo5A7loumU4Lq2edcL6dpcDsSyoginZ3c93d6jm3xT1hV
   sur3wHwJyei0jHdzsEGIb9mSglpQOOCGR+/a61vLaRAb44INdFSkt2uzv
   gqnjsc+QLINO/yQN8w6LocP1MnmsHVMODpVhIHJTUsuFAwHLBFrSTrDxb
   BOqh8fRGuEV21uaMuIIUgql2t7uj1tyg01FUAu0fIekQNx4WPnT5cznxH
   Q==;
X-CSE-ConnectionGUID: e8HfuxToSAaky1kFSRRvvg==
X-CSE-MsgGUID: pAVLZ7vuQcCBfhIpLvSxPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24754957"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="24754957"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 22:24:30 -0700
X-CSE-ConnectionGUID: eN+ThbrlT6WbGl8CpSW9BQ==
X-CSE-MsgGUID: rVGYw1PeSA2Z9HfsyIJ5Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="39742113"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 May 2024 22:24:28 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCBnV-000DAB-0O;
	Wed, 29 May 2024 05:24:25 +0000
Date: Wed, 29 May 2024 13:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:struct-device 6/20] drivers/opp/core.c:1406:20: error:
 conflicting types for '_add_opp_dev'; have 'struct opp_device *(const struct
 device *, struct opp_table *)'
Message-ID: <202405291357.0WmchXmT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux struct-device
head:   f37061809bb98e131179785e0d1ff3fe5bfbd819
commit: 038d6d6ae0da46eb5240a2a5ec65e8bd8cb149bc [6/20] driver core/cpu: Move the CPUID into struct cpu
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240529/202405291357.0WmchXmT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291357.0WmchXmT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291357.0WmchXmT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/opp/core.c:1406:20: error: conflicting types for '_add_opp_dev'; have 'struct opp_device *(const struct device *, struct opp_table *)'
    1406 | struct opp_device *_add_opp_dev(const struct device *dev,
         |                    ^~~~~~~~~~~~
   In file included from drivers/opp/core.c:23:
   drivers/opp/opp.h:257:20: note: previous declaration of '_add_opp_dev' with type 'struct opp_device *(struct device *, struct opp_table *)'
     257 | struct opp_device *_add_opp_dev(struct device *dev, struct opp_table *opp_table);
         |                    ^~~~~~~~~~~~
   drivers/opp/core.c: In function '_add_opp_dev':
>> drivers/opp/core.c:1416:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1416 |         opp_dev->dev = dev;
         |                      ^


vim +1406 drivers/opp/core.c

064416586190cb drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1405  
ef43f01ac06976 drivers/opp/core.c            Viresh Kumar       2020-10-22 @1406  struct opp_device *_add_opp_dev(const struct device *dev,
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1407  				struct opp_table *opp_table)
064416586190cb drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1408  {
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1409  	struct opp_device *opp_dev;
064416586190cb drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1410  
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1411  	opp_dev = kzalloc(sizeof(*opp_dev), GFP_KERNEL);
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1412  	if (!opp_dev)
064416586190cb drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1413  		return NULL;
064416586190cb drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1414  
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1415  	/* Initialize opp-dev */
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar       2016-02-16 @1416  	opp_dev->dev = dev;
3d2556992a878a drivers/opp/core.c            Viresh Kumar       2018-08-03  1417  
ef43f01ac06976 drivers/opp/core.c            Viresh Kumar       2020-10-22  1418  	mutex_lock(&opp_table->lock);
052c6f19141dd1 drivers/base/power/opp/core.c Viresh Kumar       2017-01-23  1419  	list_add(&opp_dev->node, &opp_table->dev_list);
ef43f01ac06976 drivers/opp/core.c            Viresh Kumar       2020-10-22  1420  	mutex_unlock(&opp_table->lock);
064416586190cb drivers/base/power/opp.c      Viresh Kumar       2015-07-29  1421  
2c2709dc6921c5 drivers/base/power/opp/core.c Viresh Kumar       2016-02-16  1422  	/* Create debugfs entries for the opp_table */
a2dea4cb907022 drivers/opp/core.c            Greg Kroah-Hartman 2019-01-22  1423  	opp_debug_register(opp_dev, opp_table);
283d55e68d8a0f drivers/opp/core.c            Viresh Kumar       2018-09-07  1424  
283d55e68d8a0f drivers/opp/core.c            Viresh Kumar       2018-09-07  1425  	return opp_dev;
283d55e68d8a0f drivers/opp/core.c            Viresh Kumar       2018-09-07  1426  }
283d55e68d8a0f drivers/opp/core.c            Viresh Kumar       2018-09-07  1427  

:::::: The code at line 1406 was first introduced by commit
:::::: ef43f01ac06976b2aa2b17266d307bb1a4f7e6f9 opp: Always add entries in dev_list with opp_table->lock held

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
