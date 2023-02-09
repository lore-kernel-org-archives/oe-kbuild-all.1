Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CCEA94B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 22:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675980743; x=1707516743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xds66Q2sWmPIw52hB69M2lXNd1EZKk7cyIgbO7VdXWM=;
  b=kkq4ERWEuhTv6Bc3+0gb31/pBh8eTiQVI6ypRb236HqTV6C6CbgcHVfT
   X9CaScOVGnhFp9xXuM5UUwc269cFrHQ5rVoACMnA+0+n5QP1VxvzeKEL6
   SuUOb48PipKl5t4vPzOueRZEgJNMBNSTbqoEOsTLjLqokr6POIQ9ioRS+
   NHTjXmNWaVnw72Wnu1zgU+ZKhTCwrxenqGYoOq49hg9ugS8FRppqHgjVn
   +3f+LDTCbUI+TaRACLYCjVa/9UsTEWuS9g8hfKeFFErujUBk4O4FfqhPR
   t8OugklhZF3UHBIJ13/LoAemv/mpL5YCtoVa/5/t7mV8ow+CMwcPwGNHG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="309898217"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="309898217"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 14:12:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="810548121"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="810548121"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2023 14:12:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQF9F-0005LK-2Y;
	Thu, 09 Feb 2023 22:12:09 +0000
Date: Fri, 10 Feb 2023 06:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/arm64/boot/dts/qcom/sa8775p.dtsi:7:10: fatal error:
 dt-bindings/clock/qcom,sa8775p-gcc.h: No such file or directory
Message-ID: <202302100613.vyIxVR5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/dt-bindings-arm-qcom-add-the-sa8775p-ride-board/20230131-204844
head:   1adb509e8796e237c554946297a8d41b444efbee
commit: 9a74a091be0f496c4b062a14ebeaec3e2515f053 arm64: dts: qcom: add initial support for qcom sa8775p-ride
date:   9 days ago
config: arm64-randconfig-r036-20230209 (https://download.01.org/0day-ci/archive/20230210/202302100613.vyIxVR5J-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9a74a091be0f496c4b062a14ebeaec3e2515f053
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bartosz-Golaszewski/dt-bindings-arm-qcom-add-the-sa8775p-ride-board/20230131-204844
        git checkout 9a74a091be0f496c4b062a14ebeaec3e2515f053
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100613.vyIxVR5J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/sa8775p-ride.dts:8:
>> arch/arm64/boot/dts/qcom/sa8775p.dtsi:7:10: fatal error: dt-bindings/clock/qcom,sa8775p-gcc.h: No such file or directory
       7 | #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +7 arch/arm64/boot/dts/qcom/sa8775p.dtsi

   > 7	#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
     8	#include <dt-bindings/clock/qcom,rpmh.h>
     9	#include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
    10	#include <dt-bindings/power/qcom-rpmpd.h>
    11	#include <dt-bindings/soc/qcom,rpmh-rsc.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
