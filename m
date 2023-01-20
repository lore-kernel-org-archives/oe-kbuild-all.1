Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78CF17C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 04:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674188380; x=1705724380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4fEeMrL3mfr40kFMoS/dtVTND1Z129RE6njLqzPBnL4=;
  b=UcDtZf2SClpM1WEqG3MmcOxJnG4W2cr8y+BDK3SUVc4OWMAESRrLarD3
   ER0b2x7hxqkcSpekMm5qptuh4tRCzY1/1NUE8qcOZeHu/HwEGHR4pivmt
   RnxF1wotZmZtcWmu5ywysKAIX+10+e/jTDXmzg48q7jnPemq2WXP/Heaq
   KW45cDxEydgOevrENkqtpBxbQyCLTeL9WFILv2eEowAzxNZvYDodG341e
   ZMg69rZLBVx9WqkLHLgjRlgdFfw3jPNvIXC0wlg2g5g7oEsRwwy1RRUQK
   dfxtU4CgPxVrbWf3rmxJdN2UqZCzSnt+y8cVG/Zo8BWU55cBf389ZWnZV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="309080498"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="309080498"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 20:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="610341625"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="610341625"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Jan 2023 20:19:39 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIisM-0002AW-2r;
	Fri, 20 Jan 2023 04:19:38 +0000
Date: Fri, 20 Jan 2023 12:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/qcom-rt 56/380] drivers/of/property.c:1195:28:
 warning: 'parse_remote_endpoint' defined but not used
Message-ID: <202301201206.rVScY6y3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/qcom-rt
head:   6880445158dd6376c96b5898fa41a7a3f8898b7d
commit: d48e81e7ae9a16ecbe7462d504a5de7b7e5e81d3 [56/380] Revert "of: property: fw_devlink: Add support for remote-endpoint"
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230120/202301201206.rVScY6y3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/krzk/linux/commit/d48e81e7ae9a16ecbe7462d504a5de7b7e5e81d3
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/qcom-rt
        git checkout d48e81e7ae9a16ecbe7462d504a5de7b7e5e81d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/of/property.c:1195:28: warning: 'parse_remote_endpoint' defined but not used [-Wunused-function]
    1195 | static struct device_node *parse_##fname(struct device_node *np,          \
         |                            ^~~~~~
   drivers/of/property.c:1299:1: note: in expansion of macro 'DEFINE_SIMPLE_PROP'
    1299 | DEFINE_SIMPLE_PROP(remote_endpoint, "remote-endpoint", NULL)
         | ^~~~~~~~~~~~~~~~~~


vim +/parse_remote_endpoint +1195 drivers/of/property.c

a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1193  
a436ef4aba1f01 Saravana Kannan 2019-11-04  1194  #define DEFINE_SIMPLE_PROP(fname, name, cells)				  \
a436ef4aba1f01 Saravana Kannan 2019-11-04 @1195  static struct device_node *parse_##fname(struct device_node *np,	  \
a436ef4aba1f01 Saravana Kannan 2019-11-04  1196  					const char *prop_name, int index) \
a436ef4aba1f01 Saravana Kannan 2019-11-04  1197  {									  \
a436ef4aba1f01 Saravana Kannan 2019-11-04  1198  	return parse_prop_cells(np, prop_name, index, name, cells);	  \
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1199  }
a3e1d1a7f5fccc Saravana Kannan 2019-09-04  1200  

:::::: The code at line 1195 was first introduced by commit
:::::: a436ef4aba1f011fa25f35fe7922d577ecde6c7c of: property: Make it easy to add device links from DT properties

:::::: TO: Saravana Kannan <saravanak@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
