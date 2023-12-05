Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD723F8C3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 17:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMsSvRr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701795665; x=1733331665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NorfMYAxtIF0UVu3Z61cw37IOpDU1S3BZ9PwLb2diK0=;
  b=mMsSvRr4gAysYJKNfVJNd18kbdtKJzkGRGOW/0fyUEzwM8cC9KvdFpC2
   xDZPdwXYdfzTn7T+gYNwL5BNV9Obe7BUBNDZmbjfpD9pKFoypTgp0wJHp
   ASFb0DlApS/zFDo9spHiTr8o5CuayxD19nAjpejLw5t6B9lPh3DnpqJh9
   B6Gb3FEZGkHSOI7tCZq+BKhDxzKVQW4c7AZBaL5bRQXJ8SwGF4kbPas2V
   HS2RCl2xDESLbkHMKdtGQ4/kCwUPxKapTVHNoU3wICkFy7QbMDuWx6Quf
   3BreL4XKQa7xtP9idzucAR/wDAywsZrEDFGUKJg5Kxezsp9X1vC/fDxVv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="397820588"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="397820588"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="861807097"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="861807097"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 09:01:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAYn7-0009Ow-0c;
	Tue, 05 Dec 2023 17:01:01 +0000
Date: Wed, 6 Dec 2023 01:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [linux-next:master 4248/4884] include/drm/bridge/aux-bridge.h:29:16:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202312060025.BdeqZrWx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: 7d9f1b72b29698e3030c2b163522cf4aa91b47e9 [4248/4884] usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
config: sh-randconfig-r112-20231205 (https://download.01.org/0day-ci/archive/20231206/202312060025.BdeqZrWx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060025.BdeqZrWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060025.BdeqZrWx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c: note: in included file:
>> include/drm/bridge/aux-bridge.h:29:16: sparse: sparse: Using plain integer as NULL pointer

vim +29 include/drm/bridge/aux-bridge.h

2a04739139b2b2 Dmitry Baryshkov 2023-12-03  20  
e560518a6c2e60 Dmitry Baryshkov 2023-12-03  21  #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
e560518a6c2e60 Dmitry Baryshkov 2023-12-03  22  struct device *drm_dp_hpd_bridge_register(struct device *parent,
e560518a6c2e60 Dmitry Baryshkov 2023-12-03  23  					  struct device_node *np);
e560518a6c2e60 Dmitry Baryshkov 2023-12-03  24  void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
e560518a6c2e60 Dmitry Baryshkov 2023-12-03  25  #else
e560518a6c2e60 Dmitry Baryshkov 2023-12-03  26  static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
e560518a6c2e60 Dmitry Baryshkov 2023-12-03  27  							struct device_node *np)
e560518a6c2e60 Dmitry Baryshkov 2023-12-03  28  {
e560518a6c2e60 Dmitry Baryshkov 2023-12-03 @29  	return 0;
e560518a6c2e60 Dmitry Baryshkov 2023-12-03  30  }
e560518a6c2e60 Dmitry Baryshkov 2023-12-03  31  

:::::: The code at line 29 was first introduced by commit
:::::: e560518a6c2e60f1566473c146fddcff3281f617 drm/bridge: implement generic DP HPD bridge

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
