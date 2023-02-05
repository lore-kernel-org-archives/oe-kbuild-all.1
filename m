Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8FB2F43
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 13:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675603942; x=1707139942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YwSx44h3sQogzlGlhLFyKAw6k1t90zoydHWlZcNJbBk=;
  b=DXFukXIsRPG+K4PDpb3ogGer34fKJfSljJLQID/LjX02i+lYNuloXVTq
   6O1v/kYE9rDIp4rT3oYgcCpkfcJX3QPCsJ375apscUbG8AblYRle+SLlZ
   zcnNpFktD0cRcLlSm+B8UFnnzH8BdbivTs7Zmma1yeZbc27hK09biD5so
   a2B4HCef3L4GdhrmbcJWNTI5XWOGMp/W8JXP1eyw4Zm2iSGrk+Huj3Qhr
   xakMxD9z5FiQY3YAX1WazCXvaYOuWHkwNsVTclg+dkJFz8IcV/HjlA9eG
   ZdqvgdanV9v0Z0tzuBAXvY5mqLeDJ2A0FTQnG2OZYmnDFHQqY3acK7D0J
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309380470"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="309380470"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 05:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698598287"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="698598287"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 05:32:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOf80-00021x-0k;
	Sun, 05 Feb 2023 13:32:20 +0000
Date: Sun, 5 Feb 2023 21:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3984/20209]
 drivers/phy/phy-mixel-lvds-combo.c:34: warning: "SS" redefined
Message-ID: <202302052136.Dr6OsNOi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 27e9b835ef416f1f11f2944be449bda6577585a7 [3984/20209] phy: Add Mixel LVDS combo PHY support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302052136.Dr6OsNOi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/27e9b835ef416f1f11f2944be449bda6577585a7
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 27e9b835ef416f1f11f2944be449bda6577585a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/phy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/phy/phy-mixel-lvds-combo.c:34: warning: "SS" redefined
      34 | #define SS              0x20
         | 
   In file included from arch/x86/include/uapi/asm/ptrace.h:6,
                    from arch/x86/include/asm/ptrace.h:7,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/smp.h:110,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/phy/phy-mixel-lvds-combo.c:15:
   arch/x86/include/uapi/asm/ptrace-abi.h:23: note: this is the location of the previous definition
      23 | #define SS   16
         | 


vim +/SS +34 drivers/phy/phy-mixel-lvds-combo.c

    33	
  > 34	#define SS		0x20
    35	#define CH_HSYNC_M(id)	BIT(0 + ((id) * 2))
    36	#define CH_VSYNC_M(id)	BIT(1 + ((id) * 2))
    37	#define CH_PHSYNC(id)	BIT(0 + ((id) * 2))
    38	#define CH_PVSYNC(id)	BIT(1 + ((id) * 2))
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
