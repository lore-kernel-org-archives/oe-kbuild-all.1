Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B67120329
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 21:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cz8a0wiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699652486; x=1731188486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14lKfPnXMCnKxOwjZlGr/AeEcsnVkqWBZHP4F1RWiQg=;
  b=cz8a0wiHdpcwuKPbosF28DnzqldHH9+rnBPVam6M3kQMm5/u/RrtLqWS
   VHPDTtd9rWJ/5RXc0oKLx7PjqOR4o37R8dEu+9tNAMSaU+Vg+tcXecE30
   XRHaoth92B+3SQeelhbzj7bqWW5D0h8rhnTcsLgwvU+Eu7ETVGTuXR5cW
   BGexCHGaz3/69y99bY71PTlZS/hq01Dv4quvZYc2+DK2TKSAe9k4cZ3rs
   kJN8ZQa3h5ZJ0Z6KHqn8DiJhdee4RChxmqyx2+GtpoBVKQgQBKbFBrpgh
   aQi5jhrnPmHCH0DtevgyaeUtBsqugII3gPfanKod7yS5FCEA5rPvBycYm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421327638"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="421327638"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="11948525"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2023 13:41:24 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ZFi-0009ve-0V;
	Fri, 10 Nov 2023 21:41:22 +0000
Date: Sat, 11 Nov 2023 05:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3754/30000]
 drivers/gpu/drm/i915/intel_hdcp.c:772:5: sparse: sparse: symbol
 'intel_hdcp_enable' was not declared. Should it be static?
Message-ID: <202311110544.6UOKR5At-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: a82c652f55df396b641e6812b7078e328bbae280 [3754/30000] drm/i915: Commit CP without modeset
config: x86_64-randconfig-121-20230910 (https://download.01.org/0day-ci/archive/20231111/202311110544.6UOKR5At-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110544.6UOKR5At-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110544.6UOKR5At-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/intel_hdcp.c:772:5: sparse: sparse: symbol 'intel_hdcp_enable' was not declared. Should it be static?
>> drivers/gpu/drm/i915/intel_hdcp.c:784:5: sparse: sparse: symbol 'intel_hdcp_disable' was not declared. Should it be static?
   drivers/gpu/drm/i915/intel_hdcp.c:772:5: warning: no previous prototype for 'intel_hdcp_enable' [-Wmissing-prototypes]
     772 | int intel_hdcp_enable(struct intel_connector *connector)
         |     ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_hdcp.c:784:5: warning: no previous prototype for 'intel_hdcp_disable' [-Wmissing-prototypes]
     784 | int intel_hdcp_disable(struct intel_connector *connector)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_hdcp.o: warning: objtool: intel_hdcp_auth_downstream()+0xaf: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_hdcp.o: warning: objtool: intel_hdcp_auth()+0x923: sibling call from callable instruction with modified stack frame

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
