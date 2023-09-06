Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234DD6ADB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 20:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694033721; x=1725569721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mEIONfvKaore8Z5w4DBDXnLV2WTs4xCaSnW4Ein8iBY=;
  b=GI3pdPgAMwNO42j+iwH9NEI8LWmm3k4l7IDbK2otD40i/eIpLdtKIPPA
   fK7k7lmXKcdrGQ9xohFg7WyaJgoGRuDY4o2VtH52IhyfQ97RSJYNP+0Pz
   UjR+oTXWcrvrj9TLQe7JeRY1MwBAASNJm7Omu3tKNXeZgVyQq/xoQfpBq
   Y7Rh408N+I8kONJhmtB4GZvtYE9QCuj8rSYWbcque3d8/UDjGWEXUYPpG
   /UvElRTsMPuq598GgPvT+xoHAKHF/cLXWvi4J+WXGuMEAVdAlJiXvS6Ya
   YGg071/ardZSDTY88GMrxlLFb/quSGZf0Jp+MqeAS0HNNob5gV9t79Fii
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="379891374"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="379891374"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 13:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865303790"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="865303790"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Sep 2023 13:54:02 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdzXE-0000Zp-1q;
	Wed, 06 Sep 2023 20:54:00 +0000
Date: Thu, 7 Sep 2023 04:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 3755/30000]
 drivers/gpu/drm/i915/intel_hdcp.c:772:5: warning: no previous declaration
 for 'intel_hdcp_enable'
Message-ID: <202309070437.AW3gmtpg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   6bfae51123c09ed71d82cfc739c5ccbeac60c4aa
commit: a82c652f55df396b641e6812b7078e328bbae280 [3755/30000] drm/i915: Commit CP without modeset
config: i386-randconfig-013-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070437.AW3gmtpg-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070437.AW3gmtpg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070437.AW3gmtpg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_hdcp.c:772:5: warning: no previous declaration for 'intel_hdcp_enable' [-Wmissing-declarations]
    int intel_hdcp_enable(struct intel_connector *connector)
        ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/intel_hdcp.c:784:5: warning: no previous declaration for 'intel_hdcp_disable' [-Wmissing-declarations]
    int intel_hdcp_disable(struct intel_connector *connector)
        ^~~~~~~~~~~~~~~~~~


vim +/intel_hdcp_enable +772 drivers/gpu/drm/i915/intel_hdcp.c

ee5e5e7a5e0fde Sean Paul            2018-01-08  771  
ee5e5e7a5e0fde Sean Paul            2018-01-08 @772  int intel_hdcp_enable(struct intel_connector *connector)
ee5e5e7a5e0fde Sean Paul            2018-01-08  773  {
ee5e5e7a5e0fde Sean Paul            2018-01-08  774  	if (!connector->hdcp_shim)
ee5e5e7a5e0fde Sean Paul            2018-01-08  775  		return -ENOENT;
ee5e5e7a5e0fde Sean Paul            2018-01-08  776  
ee5e5e7a5e0fde Sean Paul            2018-01-08  777  	mutex_lock(&connector->hdcp_mutex);
c01ebc711af8f6 Romli, Khairul Anuar 2018-09-19  778  	schedule_work(&connector->hdcp_enable_work);
ee5e5e7a5e0fde Sean Paul            2018-01-08  779  	mutex_unlock(&connector->hdcp_mutex);
c01ebc711af8f6 Romli, Khairul Anuar 2018-09-19  780  
c01ebc711af8f6 Romli, Khairul Anuar 2018-09-19  781  	return 0;
ee5e5e7a5e0fde Sean Paul            2018-01-08  782  }
ee5e5e7a5e0fde Sean Paul            2018-01-08  783  
ee5e5e7a5e0fde Sean Paul            2018-01-08 @784  int intel_hdcp_disable(struct intel_connector *connector)
ee5e5e7a5e0fde Sean Paul            2018-01-08  785  {
01468d6c711a31 Sean Paul            2018-01-09  786  	int ret = 0;
ee5e5e7a5e0fde Sean Paul            2018-01-08  787  
ee5e5e7a5e0fde Sean Paul            2018-01-08  788  	if (!connector->hdcp_shim)
ee5e5e7a5e0fde Sean Paul            2018-01-08  789  		return -ENOENT;
ee5e5e7a5e0fde Sean Paul            2018-01-08  790  
ee5e5e7a5e0fde Sean Paul            2018-01-08  791  	mutex_lock(&connector->hdcp_mutex);
ee5e5e7a5e0fde Sean Paul            2018-01-08  792  
01468d6c711a31 Sean Paul            2018-01-09  793  	if (connector->hdcp_value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
ee5e5e7a5e0fde Sean Paul            2018-01-08  794  		connector->hdcp_value = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
ee5e5e7a5e0fde Sean Paul            2018-01-08  795  		ret = _intel_hdcp_disable(connector);
01468d6c711a31 Sean Paul            2018-01-09  796  	}
ee5e5e7a5e0fde Sean Paul            2018-01-08  797  
ee5e5e7a5e0fde Sean Paul            2018-01-08  798  	mutex_unlock(&connector->hdcp_mutex);
ee5e5e7a5e0fde Sean Paul            2018-01-08  799  	cancel_delayed_work_sync(&connector->hdcp_check_work);
ee5e5e7a5e0fde Sean Paul            2018-01-08  800  	return ret;
ee5e5e7a5e0fde Sean Paul            2018-01-08  801  }
ee5e5e7a5e0fde Sean Paul            2018-01-08  802  

:::::: The code at line 772 was first introduced by commit
:::::: ee5e5e7a5e0fdeca5add8de6314b1f0a62604bdf drm/i915: Add HDCP framework + base implementation

:::::: TO: Sean Paul <seanpaul@chromium.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
