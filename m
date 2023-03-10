Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7EE7B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 03:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678420134; x=1709956134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mL2DRpBazU8fwgOWeSWR9Ow+lcD2zlz+GLEsCd38Hd0=;
  b=c8z4a2hl7zhwhkd4htwLScNrLuR6IVAc3R/IMpotg8jqq/nQYs00vxti
   jR3ikatUU/RGe4drWxCPfybU2KueL9asNLiZDqGnX4q9lddF90OgItaD0
   lj5RYWKfGARnV5Va/SGQp2M3PYlfgpuLhDfT84mYhKAh9nYD2PgB4TdQa
   Ww1ZY6XxuxvDYD8umKgOi2JkKWpJNg1BZV1hb+GnecpH2yiO41S8GgnAO
   D7k6rep4ZOSRvTM3mLs6kK5rc7zk+B9Fo/r1wM+3VMc49cerD6KOzLYBc
   R6I3qoNigZBImFVlnvmbUTqFZl+tFDSCqNstmmtenIcL3tbOASEChI0o9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364290021"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="364290021"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 19:48:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="766682634"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="766682634"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2023 19:48:52 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paTkR-0003Sj-1K;
	Fri, 10 Mar 2023 03:48:51 +0000
Date: Fri, 10 Mar 2023 11:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ERROR: modpost: "create_function_device"
 [drivers/usb/gadget/function/usb_f_audio_source.ko] undefined!
Message-ID: <202303101155.Pw3Q6LzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 79847ce8aefb51dd32202ad9c186aff0541b14a6 ANDROID: usb: gadget: f_audio_source: New gadget driver for audio output
date:   2 years, 3 months ago
config: h8300-randconfig-r023-20230308 (https://download.01.org/0day-ci/archive/20230310/202303101155.Pw3Q6LzQ-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=79847ce8aefb51dd32202ad9c186aff0541b14a6
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 79847ce8aefb51dd32202ad9c186aff0541b14a6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=h8300 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303101155.Pw3Q6LzQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "create_function_device" [drivers/usb/gadget/function/usb_f_audio_source.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
