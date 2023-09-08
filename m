Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BBD30F81
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 19:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694200225; x=1725736225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aLDe2Tl9hFW12UqE169BAwh+81LwyCW1GeG7BF7xwc4=;
  b=WyOpmV0aVmnsE7b3dHXQ+69rqV3sLwtwcYcFqXAFrade097R6EHOARNr
   N+B2kcDjmIRjod4RV0qs8uTcus+gJ/+PfEGQ3IjYENjEsxuLilcq+zk08
   LWnQFEoOU/ofZccX6TxIFZG0AV2+Ngjz8kuJ70BoWtuSdlzMtCn/+AaqB
   H04DLZFH6kwaRuMilVsMI2+bGhnddLxLpAWnNCJ3XQIYw3zkw29BocUBJ
   NDmjZkk30iUXmm4WVBxRbI3wbWj7bpxzbfsY9+CPRygRHo1QP29b5WWM0
   H+dQz9ExLlVYKRl0Hh7+Oujjaar2aSFT9FlIz8/ZdrTb4H7TMj1b7bTTP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377636089"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="377636089"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 12:10:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742609206"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="742609206"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Sep 2023 12:10:22 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qegs0-0002XH-1R;
	Fri, 08 Sep 2023 19:10:20 +0000
Date: Sat, 9 Sep 2023 03:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: George Stark <GNStark@sberdevices.ru>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [amlogic:v6.7/arm64-dt 28/35] Error:
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi:228.21-22 syntax error
Message-ID: <202309090349.edkQ35JZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v6.7/arm64-dt
head:   1e728f46085667071fdf0f2d6f68c51c844d46c2
commit: 2aee4cd48c56062c37ade35f1bc3c0b5b8db14c8 [28/35] arm64: dts: meson: a1: add saradc definition
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230909/202309090349.edkQ35JZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090349.edkQ35JZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090349.edkQ35JZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/amlogic/meson-a1.dtsi:228.21-22 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
