Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC27211A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685282109; x=1716818109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x7m/rfFeH5FuwJlv0OcnYXLwuFbwb4E5kJpG6UM7IDA=;
  b=QkGqTjpj6Eoex+LiULjm7LCpOP2wcPnDPWoOKsqYXgCYgU7NjVDOQaTW
   3QYUxiiqHlxrzaNBGEN+aE+4cBDyp+UG2kHC3WMddzaerfonaJUG3JCuT
   nbIntEhMi84hSq5RjkaOQcqdeylYqg23kV9kzGWosV+SHpUvNByx4KScE
   nlYwy/hj0sY3UCGnhfDZVL2yGk6s7MOgdi0iHVJgPXlahc0wR3n4v76aY
   K6ngDh4iVrXL/VDPa80PsvMLjeB0VMgcH8GyfFCVlYOlclMXLZyQ20OLD
   kn0u0eOrhtN2jZcMMe73vXrnFBAHtxh/TkKKg1kUQsAuvHqG/ZFG5jtMK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="339108790"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="339108790"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 06:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="850094613"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="850094613"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 May 2023 06:55:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3GrS-000KbY-2T;
	Sun, 28 May 2023 13:55:06 +0000
Date: Sun, 28 May 2023 21:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 3332/9879]
 ./usr/include/linux/imx_vpu.h:22:1: warning: // comments are not allowed in
 this language
Message-ID: <202305282101.raJmy7a3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: b82c78d77f16b30cffdd304eb2c6c1a3ab4f68ba [3332/9879] arm64: imx8mx: vpu: add vsi v4l2 decoder and encoder
config: i386-randconfig-i006-20230525 (https://download.01.org/0day-ci/archive/20230528/202305282101.raJmy7a3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/b82c78d77f16b30cffdd304eb2c6c1a3ab4f68ba
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout b82c78d77f16b30cffdd304eb2c6c1a3ab4f68ba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305282101.raJmy7a3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/imx_vpu.h:17:
   usr/include/linux/videodev2.h:2437:20: error: field has incomplete type 'struct timespec'
           struct timespec                 timestamp;
                                           ^
   usr/include/linux/videodev2.h:2437:9: note: forward declaration of 'struct timespec'
           struct timespec                 timestamp;
                  ^
   In file included from <built-in>:1:
>> ./usr/include/linux/imx_vpu.h:22:1: warning: // comments are not allowed in this language [-Wcomment]
   //ctrls & extension ctrls definitions
   ^
   1 warning and 1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
