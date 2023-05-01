Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1293D7465
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 19:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682969594; x=1714505594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ngjXAQhXB//UKXwZXbe8Gpuk0rGPz/OOJdRlSmqlzpw=;
  b=SKWa5XNaLiI32wjwzDyhVokEVZ4kQqY3GSVkVQDQV7ohInWbnsgt9AQa
   Xdy6ZShwfZltmfqC02sMnxhNv+XQInMgXSS3CYCvkI8nmPGkzDRMHTsAX
   2ZDm+hQb9zOX7IuwK5yyVcW48XCmaIV5gkCvo+q7KGy/pL3fg+MNZC0Yt
   UHP66nM/HEiQotGmH/9tZMI35I8PkD6k/8kHGf6uK+hgnFDKQkg0vmf9a
   YSkgIxYvxViq/KLOImOGAVl8L3kKzaOYiY72cONxUoCBAtGBh4AAfK07s
   8i+8n33tFOHh9X38/tQBKn1/l8cHOCPbUHBvXoU0f60JQTAqP7Rzh8hOT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="337344409"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="337344409"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 12:33:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="689997694"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="689997694"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 May 2023 12:33:12 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptZGp-0000bF-1s;
	Mon, 01 May 2023 19:33:11 +0000
Date: Tue, 2 May 2023 03:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/7] phy: qcom-qmp-combo: Introduce drm_bridge
Message-ID: <202305020313.fewkOUd1-lkp@intel.com>
References: <20230425034010.3789376-6-quic_bjorande@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425034010.3789376-6-quic_bjorande@quicinc.com>

Hi Bjorn,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/dt-bindings-phy-qcom-sc8280xp-qmp-usb43dp-Add-ports-and-orientation-switch/20230425-114219
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230425034010.3789376-6-quic_bjorande%40quicinc.com
patch subject: [PATCH 5/7] phy: qcom-qmp-combo: Introduce drm_bridge
config: arm-randconfig-c031-20230430 (https://download.01.org/0day-ci/archive/20230502/202305020313.fewkOUd1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9d1c54037e7501c68b3ad3347abda7f8ca0d4a7a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bjorn-Andersson/dt-bindings-phy-qcom-sc8280xp-qmp-usb43dp-Add-ports-and-orientation-switch/20230425-114219
        git checkout 9d1c54037e7501c68b3ad3347abda7f8ca0d4a7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305020313.fewkOUd1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/phy/qualcomm/phy-qcom-qmp-combo.o: in function `qmp_combo_bridge_attach':
>> drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3227: undefined reference to `devm_drm_of_get_bridge'
>> arm-linux-gnueabi-ld: drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3231: undefined reference to `drm_bridge_attach'
   arm-linux-gnueabi-ld: drivers/phy/qualcomm/phy-qcom-qmp-combo.o: in function `qmp_combo_dp_register_bridge':
>> drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3243: undefined reference to `devm_drm_bridge_add'


vim +3227 drivers/phy/qualcomm/phy-qcom-qmp-combo.c

  3217	
  3218	static int qmp_combo_bridge_attach(struct drm_bridge *bridge,
  3219					   enum drm_bridge_attach_flags flags)
  3220	{
  3221		struct qmp_combo *qmp = container_of(bridge, struct qmp_combo, bridge);
  3222		struct drm_bridge *next_bridge;
  3223	
  3224		if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
  3225			return -EINVAL;
  3226	
> 3227		next_bridge = devm_drm_of_get_bridge(qmp->dev, qmp->dev->of_node, 0, 0);
  3228		if (IS_ERR(next_bridge))
  3229			return dev_err_probe(qmp->dev, PTR_ERR(next_bridge), "failed to acquire drm_bridge\n");
  3230	
> 3231		return drm_bridge_attach(bridge->encoder, next_bridge, bridge, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
  3232	}
  3233	
  3234	static const struct drm_bridge_funcs qmp_combo_bridge_funcs = {
  3235		.attach	= qmp_combo_bridge_attach,
  3236	};
  3237	
  3238	static int qmp_combo_dp_register_bridge(struct qmp_combo *qmp)
  3239	{
  3240		qmp->bridge.funcs = &qmp_combo_bridge_funcs;
  3241		qmp->bridge.of_node = qmp->dev->of_node;
  3242	
> 3243		return devm_drm_bridge_add(qmp->dev, &qmp->bridge);
  3244	}
  3245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
