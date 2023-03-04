Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7D21FD1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 10:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677925672; x=1709461672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aKG6rPgGhnosrfx8RqwVrFtLUmTalxs//Wxcr6lAZuM=;
  b=T+IJXrIGtidVGaHQnxQXO/m05WIpQmbZtk+/HML0+cx1Zun8CkDcuTZf
   LfYZ4O10yt3vp2sfAiaQOiC8qJoTV8tELyPvVmmyPFzksnXn5bM69sT7H
   CUjWxPkwg/fJ3GSMvkeGuC/qTavmxANzYUqrkZpPHl3TUxDF7DKu3EXmd
   kOuUgkNEd1wofdMHqTVOcU/lH7Y42OBIQGBggyElKIVBKfEYT8fbcNzj3
   gbveEtioRqPERIFS4xZFeUkUL8sOP9G4er1Y4xIQigri2+FhwnMt4uDZi
   SeiyZpO8eua9gxtkOYsIbzXXZSSAAYIR5pSoZaam78tLxZJpucg7fKXVa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="314905098"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="314905098"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 02:27:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="675634173"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="675634173"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2023 02:27:50 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYP7F-000250-1Q;
	Sat, 04 Mar 2023 10:27:49 +0000
Date: Sat, 4 Mar 2023 18:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v13 10/10] drm/bridge: it6505: Register Type C mode
 switches
Message-ID: <202303041841.ecVU7uik-lkp@intel.com>
References: <20230303143350.815623-11-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303143350.815623-11-treapking@chromium.org>

Hi Pin-yen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus drm/drm-next linus/master next-20230303]
[cannot apply to chrome-platform/for-next v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pin-yen-Lin/device-property-Add-remote-endpoint-to-devcon-matcher/20230303-223717
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230303143350.815623-11-treapking%40chromium.org
patch subject: [PATCH v13 10/10] drm/bridge: it6505: Register Type C mode switches
config: openrisc-randconfig-r014-20230303 (https://download.01.org/0day-ci/archive/20230304/202303041841.ecVU7uik-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3072317d81f03b7c592a65ade65e6c40cc0fd39d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pin-yen-Lin/device-property-Add-remote-endpoint-to-devcon-matcher/20230303-223717
        git checkout 3072317d81f03b7c592a65ade65e6c40cc0fd39d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041841.ecVU7uik-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_dp_register_typec_switches" [drivers/gpu/drm/bridge/ite-it6505.ko] undefined!
>> ERROR: modpost: "drm_dp_unregister_typec_switches" [drivers/gpu/drm/bridge/ite-it6505.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
