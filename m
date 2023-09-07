Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD630EA9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 03:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694059079; x=1725595079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YOEQQed2aOINKukZbDIxvOC5x5gFSXF6d2ZC+WlXBxQ=;
  b=nLXlcVS/b0S6UzajF/FT51aymR8186OaUUmSYsVvbp0itB56BJOSg3I4
   o3kETDABy60bH+sWnZXdtc634kuf2idY4HDB747BQTask5ZMHnwXzSksA
   482zmwywllp4zUwbVnurcH3xwgkNTROVtJOu9S4N4X9JklYc3sZ+n+4oH
   pDYZnHZ0+iDLMhNQTUyBDxwSnaewhYhZ+6C/v4+QJNIBaQR1r/QzwW4wl
   +FRLyQt2dwYYKkKBycjJNTHfaGZhhZFq4G+LWRS4wQL0cWPM7Wev7wL2j
   Poplbr68h4poj9zsnXDyw7c/7gfI0cQGqNaPmaBBSFfq7ocqQ+0uXVY2a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443637279"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="443637279"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 20:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072685160"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="1072685160"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Sep 2023 20:57:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe69E-0000rP-19;
	Thu, 07 Sep 2023 03:57:40 +0000
Date: Thu, 7 Sep 2023 11:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/640 14597/24604] fsl_xcvr.c:undefined reference
 to `__udivdi3'
Message-ID: <202309071117.y82jTg72-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/640
head:   20d5c9a132fc5a44f95fe7410c3cac6f43f0bd6c
commit: e8119d420e52befc919c1dbe609d467436382a13 [14597/24604] MLK-25951-2: ASoC: fsl_xcvr: Add soc data of i.MX93
config: i386-buildonly-randconfig-002-20230906 (https://download.01.org/0day-ci/archive/20230907/202309071117.y82jTg72-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309071117.y82jTg72-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071117.y82jTg72-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: sound/soc/fsl/fsl_sai.o: in function `fsl_sai_hw_params':
   fsl_sai.c:(.text+0x2026): undefined reference to `__sw_hweight8'
   ld: fsl_sai.c:(.text+0x2229): undefined reference to `__sw_hweight8'
   ld: fsl_sai.c:(.text+0x226b): undefined reference to `__sw_hweight8'
   ld: sound/soc/fsl/fsl_xcvr.o: in function `fsl_xcvr_runtime_resume':
>> fsl_xcvr.c:(.text+0xbc0): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
