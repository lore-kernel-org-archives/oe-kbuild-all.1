Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A3EDDC8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+TL0A01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696693511; x=1728229511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XmIWdf5m97dS/N3IvZ6r1+0O5IMxO0p2FiDKMmUuuIQ=;
  b=J+TL0A01fCIIkoVeqJDXwUwmVnveF7d61FqnoTA/pvfMwNQTpJBJPBJA
   G0Hdsd7RsvVUs/U2JWsk71jEizELqT/52pX8aNYCkKw/tns6yJx3tVBU/
   TdEzDCS2l7YStFaFlBofa2klsmHsLAujwoPYNEYKKJp2lKIfz7JiDaPZe
   g2ns8Ku9/9LvoKrerq5X5L1ckkwAOnx1XXF0VL5YP2lpUqYC6faTuBObz
   1bfAzBnUbkl7B5my+/vaMNV2OrUXnJkV4ajJ7CmsfRHdJUuqwf7ITNPDf
   1S/148KYXqqk9F1wL9Phawr4y51cGJja+cidtLRk+WJh90xBqkI4MJBjF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="448129556"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="448129556"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 08:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="896282466"
X-IronPort-AV: E=Sophos;i="6.03,206,1694761200"; 
   d="scan'208";a="896282466"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2023 08:43:34 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qp9UI-0004VT-2i;
	Sat, 07 Oct 2023 15:45:06 +0000
Date: Sat, 7 Oct 2023 23:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3984/25021]
 drivers/phy/phy-mixel-lvds-combo.c:34: warning: "SS" redefined
Message-ID: <202310072347.LC7022Ob-lkp@intel.com>
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
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: 27e9b835ef416f1f11f2944be449bda6577585a7 [3984/25021] phy: Add Mixel LVDS combo PHY support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231007/202310072347.LC7022Ob-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310072347.LC7022Ob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310072347.LC7022Ob-lkp@intel.com/

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
