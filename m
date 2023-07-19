Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A06125AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689772363; x=1721308363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJOVtpNF7D8q9ZYf/0cjI7c8ASs1gx1xybwr+ctpLWg=;
  b=U5eCIKq4j/t7dXjrZ0SZkF9qnyAWHfbkuAgBQO9UESvzRm7u9PiAeM3F
   EwBWcRoQ+/FZOr7NPAU8lznfy/Wr/5GmjYSYW3kPQNaErQ5zJxpxyXdBo
   9txXPyvW/pex7shL9Sfi2yEOTEqYoazChxeNuYRNilzdRPz/STdWOiY4L
   FoSB4E4YcvZ8Ap4cs45GB7LdAH4cnLz8RKkUcPkYdg+IZCm6R2ier3wIk
   mOyn2nUwPqZ+JAiyNHsO2XKof5OcwqzzzZzK1gRwcAAgHlaf10rIMEynx
   ylAGUKodxRCjvtH971gwRNIRFAZY+kdaJoVlPeavQlTVY6ErraETinE7y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="351325324"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="351325324"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 06:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="727295256"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="727295256"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jul 2023 06:12:40 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM6yu-0004uC-0I;
	Wed, 19 Jul 2023 13:12:40 +0000
Date: Wed, 19 Jul 2023 21:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/637 3548/12466]
 drivers/phy/phy-mixel-lvds-combo.c:34: warning: "SS" redefined
Message-ID: <202307192112.wDXESnsk-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc pr/637
head:   ec33c7fc43bef23fa0b69db996fee0ba601875e9
commit: dac9aca0adab35a0848bb45a8d09e6ce13754654 [3548/12466] phy: Add Mixel LVDS combo PHY support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230719/202307192112.wDXESnsk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192112.wDXESnsk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307192112.wDXESnsk-lkp@intel.com/

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
