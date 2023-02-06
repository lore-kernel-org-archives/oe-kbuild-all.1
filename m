Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8B1196
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 04:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675659291; x=1707195291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AYTw4ck8F7Lcq+lsgeaibjfR++UlYl+pfpt3hRz3JYI=;
  b=VUQr9reUoq0MDmoI89Uh0YduqiTXdNEKt1JB6HkE4zXKDtzhKmtSgR1j
   GtezAvIJ20Hto88+Y27u2w8u5cNk4/duotpCamDyFdSu0rnZPVV+aU6sd
   aQoa2wdEoDjJ+zS4gWWieKZm/gYfcvUn64b0T6+7Zw8LsMe7Lmm52MMuS
   byZwJHddSH+GtD8fx4s1nfJWYjMNwcDi2GRKcdJ/q3M/6TFI3fYLxkGMC
   2WnZyxLHvC6EokYDqOf65fNLY9WTVw1vod3DBCSyTOgcOKKrmPkJ/Lun4
   E8kV7h/LvtHlRVoWUDNXjpRUZoglxwYwzrTiQ00Ni6wZ+7S10u9m/+kmn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="415349744"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="415349744"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 20:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="995153326"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="995153326"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Feb 2023 20:54:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOtWj-0002Oq-05;
	Mon, 06 Feb 2023 04:54:49 +0000
Date: Mon, 6 Feb 2023 12:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4049/20209]
 include/linux/irqchip/arm-gic-v3.h:602:10: fatal error: asm/arch_gicv3.h: No
 such file or directory
Message-ID: <202302061213.ik67uFfb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anson,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: b86c23dd49687dcd77b99e45dd311157c644dc14 [4049/20209] firmware: imx: scu-pd: Add IRQSTEER wakeup support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230206/202302061213.ik67uFfb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/b86c23dd49687dcd77b99e45dd311157c644dc14
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout b86c23dd49687dcd77b99e45dd311157c644dc14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/imx/scu-pd.c:60:
>> include/linux/irqchip/arm-gic-v3.h:602:10: fatal error: asm/arch_gicv3.h: No such file or directory
     602 | #include <asm/arch_gicv3.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +602 include/linux/irqchip/arm-gic-v3.h

7e5802781c3e10 Andre Przywara        2014-11-12  601  
7936e914f7b082 Jean-Philippe Brucker 2015-10-01 @602  #include <asm/arch_gicv3.h>
021f653791ad17 Marc Zyngier          2014-06-30  603  

:::::: The code at line 602 was first introduced by commit
:::::: 7936e914f7b0827c2dcfe63fbefdc21de2d61dcb irqchip/gic-v3: Refactor the arm64 specific parts

:::::: TO: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
