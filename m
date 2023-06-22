Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02425200AC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687454028; x=1718990028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xpm50zDTqKa7EU9JBOrT5Bfrm/FJ+hm5gG62jJgTqdM=;
  b=T16hK/sUWhEStLfjQHaGOxiFW9qme8BcMm/OVxhzh6wadlPscg/mjiIZ
   yg9vjbBHVD9O7l+hA5PIswiROw2rQpjYyGabxa5eGw9kRhm5B/6Mu6XfU
   g/wOxj9a3Tvy8meFCn9InqPZQzlYWodm6DkC+ScPJZXn4aKzDo4zI27qz
   x9Wq7GSK9xL5s4rv3bcPWkcTxViJbz6ycOFqB1FCWGG6rwwY7sIqnLABz
   DgHAJ4atyaeXqg131QloUtEh0XPrgaIGYvF5RSz5VvLGq9rKHL/Jv/Yqq
   ZF08oAd/ItgXi2wNtUvR0GAfvzxAj7WczHhGiPHKsFzL99ztYdGI3VQWA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="446929310"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="446929310"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 10:13:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="665141217"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="665141217"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Jun 2023 10:13:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCNsO-0007iF-17;
	Thu, 22 Jun 2023 17:13:44 +0000
Date: Fri, 23 Jun 2023 01:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 3548/9881]
 drivers/phy/phy-mixel-lvds-combo.c:34: warning: "SS" redefined
Message-ID: <202306230113.PS3kfQDE-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   3260d1af47b1bedfe12b79a26efa184b9a60a8a3
commit: dac9aca0adab35a0848bb45a8d09e6ce13754654 [3548/9881] phy: Add Mixel LVDS combo PHY support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306230113.PS3kfQDE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230113.PS3kfQDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230113.PS3kfQDE-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
