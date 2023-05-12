Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE107F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 10:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683888648; x=1715424648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J2dG31As9TRW7e1SmPhgtpCZL+tN38kkyhM1HVVBQzw=;
  b=FG5N+fgTs2dEIpz/79cK+2eqRrnLvfSzAdhWdZ3yQS0lXgJL+TFcfbVX
   2Vtr5U8Ix/oWewIj5sdFsQAthAEJpGLUzQzGxCDzzN2p7jiDeJ9D2wUmo
   3EhW329YAQVBfGzxpGimOdXo0/znq5c6mXdlE20JbXbeUtKCZgraMZaF5
   SeTls4IRAnTbsVbsLDaCe8swar7iZEspUs5g7/B5T8TKor4zrysKspl2K
   +ZTwKNAfeEVBtQBKksHUc2Ql5vBWsR57pbWmj9p9t5PUF68giZfn8reHD
   KC6wnU9akD0BFPZ/j2Gf3xBqtS5ND4RfKyAgXIE96ooa+Ifb0snlWMzWW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="349603023"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="349603023"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 03:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="946591224"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="946591224"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 May 2023 03:50:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxQMH-0004n6-0R;
	Fri, 12 May 2023 10:50:45 +0000
Date: Fri, 12 May 2023 18:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 4848/30000]
 drivers/gpu/drm/i915/intel_hdcp.c:772:5: warning: no previous prototype for
 'intel_hdcp_enable'
Message-ID: <202305121848.8X4FBwYV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   180df1199944ebd8928f320a1bd16c8a87dba2ed
commit: a82c652f55df396b641e6812b7078e328bbae280 [4848/30000] drm/i915: Commit CP without modeset
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230512/202305121848.8X4FBwYV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/a82c652f55df396b641e6812b7078e328bbae280
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_t
        git checkout a82c652f55df396b641e6812b7078e328bbae280
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121848.8X4FBwYV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_hdcp.c:772:5: warning: no previous prototype for 'intel_hdcp_enable' [-Wmissing-prototypes]
     772 | int intel_hdcp_enable(struct intel_connector *connector)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/intel_hdcp.c:784:5: warning: no previous prototype for 'intel_hdcp_disable' [-Wmissing-prototypes]
     784 | int intel_hdcp_disable(struct intel_connector *connector)
         |     ^~~~~~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests
