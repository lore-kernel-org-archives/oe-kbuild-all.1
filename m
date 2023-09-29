Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5535651B89
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 15:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696000620; x=1727536620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1kLpy3dB+VJOp8zEqcUujG2sanJ8/OMGcmiBfYh23uo=;
  b=Cnhe1Yi977B0vRKTsMyu06u+JlWg62bB/7j59rlHGWqtgOYArNgSV1sI
   zPv6Fg3kyJDQA4eVGK3AOZERpgxrwtVJxWs0Edw40qWgzZBonlEGF60A8
   H+CRn/KFl6aHmmy4k1X6D170SjSw99c6oea2k7OzRQUfbSAkjMawS06Yu
   0K/hEKDWqeqooiB/GEB84JeKmnTu9QccnAGTRhMDIOLKkkiL03cxnGbCe
   f8IgVBxH1DxReADHNlK7edc2wN7oQRvQdy43OOxL4YlNfYLOuvkTaLejQ
   QIpITf0QhShE633fyegXK+D4G2+oImGlhdY5FlBuaW1dMiTjF0N9v7HTT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="448812168"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="448812168"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 08:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="779313236"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="779313236"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Sep 2023 08:16:36 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmFE2-0002yS-0x;
	Fri, 29 Sep 2023 15:16:18 +0000
Date: Fri, 29 Sep 2023 23:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Subject: [asahilinux:isp/t602x-v2 5/62]
 drivers/media/platform/apple/isp/isp-drv.c:392:34: warning:
 'apple_isp_hw_t8110' defined but not used
Message-ID: <202309292350.MQmJw1u2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux isp/t602x-v2
head:   4491bb9e0fe8e2ff33c9ee38524fa577f1086781
commit: 8f851b56c1023bec74060f8d0b2c8450431dee06 [5/62] media: apple: isp: IMX558 initial support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230929/202309292350.MQmJw1u2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309292350.MQmJw1u2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309292350.MQmJw1u2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/isp/isp-drv.c:392:34: warning: 'apple_isp_hw_t8110' defined but not used [-Wunused-const-variable=]
     392 | static const struct apple_isp_hw apple_isp_hw_t8110 = {
         |                                  ^~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-drv.c:365:34: warning: 'apple_isp_hw_t6000' defined but not used [-Wunused-const-variable=]
     365 | static const struct apple_isp_hw apple_isp_hw_t6000 = {
         |                                  ^~~~~~~~~~~~~~~~~~


vim +/apple_isp_hw_t8110 +392 drivers/media/platform/apple/isp/isp-drv.c

   391	
 > 392	static const struct apple_isp_hw apple_isp_hw_t8110 = {
   393		.pmu_base = 0x23b704000,
   394	
   395		.dsid_clr_base0 = 0x200014000, // TODO
   396		.dsid_clr_base1 = 0x200054000,
   397		.dsid_clr_base2 = 0x200094000,
   398		.dsid_clr_base3 = 0x2000d4000,
   399		.dsid_clr_range0 = 0x1000,
   400		.dsid_clr_range1 = 0x1000,
   401		.dsid_clr_range2 = 0x1000,
   402		.dsid_clr_range3 = 0x1000,
   403	
   404		.clock_scratch = 0x23b3d0560,
   405		.clock_base = 0x0,
   406		.clock_bit = 0x0,
   407		.clock_size = 0x8,
   408		.bandwidth_scratch = 0x23b3d05d0,
   409		.bandwidth_base = 0x0,
   410		.bandwidth_bit = 0x0,
   411		.bandwidth_size = 0x8,
   412	
   413		.stream_command = DART_T8020_STREAM_COMMAND, // TODO
   414		.stream_select = DART_T8020_STREAM_SELECT,
   415		.ttbr = DART_T8020_TTBR,
   416		.stream_command_invalidate = DART_T8020_STREAM_COMMAND_INVALIDATE,
   417	};
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
