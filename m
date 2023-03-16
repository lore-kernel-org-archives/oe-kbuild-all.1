Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8E1323B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 12:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678971392; x=1710507392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GOpEHvKiVWSWdvLi+F4Kkyvs0hPWD9/34qtln3LsbrI=;
  b=L32WZxaY85vvi8EUGB8V8iGyYE9RP7HYArf864RrVZrcyNytons5IuJk
   HaIvT6lJguF56YKw3OcpPIEQbtaMDClnV/80Aj3a/QQ0RheZZobdlckSU
   Txf1P9XlX0ToPbD+NhyD0OEAp0wNVljXsk+tBQhzJZPAs2rQ0PKCRDunA
   KuRLQwBMdryiQ+VRXDAgFs1Z2nxWXMqmIXnEr+Nqg8VedyBKOz81LvEvR
   D5GmqrNTK6Zca7+o495VD/NmTBP80c1ixVFjpvGQGdzIYlXFLq4aXNtHB
   UDDrCKSjdA5xhXE6pBX0g6PD8wYyD+4JP5+RNR3VxrYnQU+UwDbCRDlYg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="321814976"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="321814976"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 05:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="925766793"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="925766793"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2023 05:56:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcn9h-0008Wa-2Y;
	Thu, 16 Mar 2023 12:56:29 +0000
Date: Thu, 16 Mar 2023 20:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kathiravan T <quic_kathirav@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.4 59/93]
 arch/arm64/boot/dts/qcom/ipq5332.dtsi:8:10: fatal error:
 dt-bindings/clock/qcom,ipq5332-gcc.h: No such file or directory
Message-ID: <202303162002.jQMR3mY1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.4
head:   608465f798bb3eaf6773a49b893902860858e294
commit: 0360f0ea8c0f67ec8a25c5ec89f044dbc66b5c5f [59/93] arm64: dts: qcom: add IPQ5332 SoC and MI01.2 board support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230316/202303162002.jQMR3mY1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?id=0360f0ea8c0f67ec8a25c5ec89f044dbc66b5c5f
        git remote add qcom https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux
        git fetch --no-tags qcom arm64-for-6.4
        git checkout 0360f0ea8c0f67ec8a25c5ec89f044dbc66b5c5f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303162002.jQMR3mY1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/qcom/ipq5332-mi01.2.dts:10:
>> arch/arm64/boot/dts/qcom/ipq5332.dtsi:8:10: fatal error: dt-bindings/clock/qcom,ipq5332-gcc.h: No such file or directory
       8 | #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +8 arch/arm64/boot/dts/qcom/ipq5332.dtsi

   > 8	#include <dt-bindings/clock/qcom,ipq5332-gcc.h>
     9	#include <dt-bindings/interrupt-controller/arm-gic.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
