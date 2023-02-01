Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3897F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675246342; x=1706782342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gVEJnTlwxqfkFH0rVKpv2lHcdZ0OFKuz7/27Hr9H6HU=;
  b=Sc/JrbLuPiTY1UODFu7z3nmu/LUiQh0KMCY2uh9B3wEc3+TVNqJ7e6PG
   eZDOBz02SmrunyiVxq98UHWi5tkEsAny+3AruuhUWpjHw4aMks9hCmAZk
   2xcSvhV9/6ytgA0v9WNmg/CA7AzlOSfK87t2JPN03IRqZTpvBRn0uDlnh
   +C6Mo75ZtiwYaWOUk83Bchq/SN28FbXsDQP8GcUfTMSUmLN4Zj4PpYGWb
   BBUqKtMQ/b+nfKvuwv4GS//SN2iAD9j4mk1TaCx4JnuBayhVywMiSbKnR
   vUPIpTglojXLHEz+c8lASvwhIH2CfFUkNfhWAX5ZKmagm0PKZ+x8Y66cb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="329396855"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="329396855"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 02:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="697190459"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="697190459"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Feb 2023 02:12:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNA6F-0005Kw-33;
	Wed, 01 Feb 2023 10:12:19 +0000
Date: Wed, 1 Feb 2023 18:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sung Joon Kim <sungkim@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Chao-kai Wang <Stylon.Wang@amd.com>
Subject: [linux-next:master 9102/9815]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:62:10: fatal
 error: mod_info_packet.h: No such file or directory
Message-ID: <202302011836.kA3BxqdY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66eee64b235411d512bed4d672c2d00683239daf
commit: 5b49da02ddbe1b9082cfc9be1cd848375da178ea [9102/9815] drm/amd/display: Enable Freesync over PCon
config: ia64-randconfig-r013-20230201 (https://download.01.org/0day-ci/archive/20230201/202302011836.kA3BxqdY-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5b49da02ddbe1b9082cfc9be1cd848375da178ea
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 5b49da02ddbe1b9082cfc9be1cd848375da178ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu.h:90,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:43:
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:62:10: fatal error: mod_info_packet.h: No such file or directory
      62 | #include "mod_info_packet.h"
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +62 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h

    58	
    59	#include "irq_types.h"
    60	#include "signal_types.h"
    61	#include "amdgpu_dm_crc.h"
  > 62	#include "mod_info_packet.h"
    63	struct aux_payload;
    64	struct set_config_cmd_payload;
    65	enum aux_return_code_type;
    66	enum set_config_status;
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
