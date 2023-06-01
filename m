Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0B310FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 23:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685663631; x=1717199631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oc7b37mXb1MZdv9E7aYIIQnet+Ysn1Ud1w3QAVVLaWw=;
  b=dKCGnxjCKbjmottvMVN/Qd2ZoELNdrYTeYP/akIODxK+Ff3HqLfldHiN
   7vxKYlxbAGwpVrrZ8fAHtQdEL2H68D7bo/Hb8+QXtGBDsU8lKrql3rUWP
   CEWpAlpBFGkeSTspsDGXqJ8EexN4VFTjxfNJYHvQ465i3CyKi8ExW49QN
   jXaQcHWhCcx2/m9I4D/tnzInP0zZgiSdiS0R4wLIlyiWepxAmk1SOShyH
   euVljKM/yYH66JpvJ8HptMOMux9ZnAscuux2KrDdMzCDwW/FnPQ70YM4z
   JMY/4NE+Rug2b+AoIgiz/IX7KPR6dvqfOW+/3EzTjJHFL4naIvF5eHxuB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442091872"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="442091872"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 16:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="831749961"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="831749961"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Jun 2023 16:53:48 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4s72-0002mi-0E;
	Thu, 01 Jun 2023 23:53:48 +0000
Date: Fri, 2 Jun 2023 07:53:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 12/12] cc1: warning: include/uapi/drm: No
 such file or directory
Message-ID: <202306020738.Efjx4L8k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   f67d263e68b42c6ed85c11c3b2ebe4f149a34a5a
commit: f67d263e68b42c6ed85c11c3b2ebe4f149a34a5a [12/12] CHROMIUM: drm/evdi: Port evdi from github.com/DisplayLink/evdi.git
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230602/202306020738.Efjx4L8k-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout f67d263e68b42c6ed85c11c3b2ebe4f149a34a5a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306020738.Efjx4L8k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: include/uapi/drm: No such file or directory [-Wmissing-include-dirs]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
