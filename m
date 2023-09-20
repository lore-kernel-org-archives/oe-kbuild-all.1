Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840583CCF9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 19:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695238149; x=1726774149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5bus4JomaMT2B0sfk6IwhIfAbpKTvNbve2f6eVboVD4=;
  b=mVmh83KP7TRkiL4vh2VW1Q4DrNKLU+S0J8od002WHP1Jx8tTDw5Uq5JN
   KuYxVRYR2ar6lmWsZa1xhmWCJ0oHV3u6Wj3NQB+6bETaLmz5/qFa5FXZB
   mNtd1+JU9yLQqHXTrwwIkJsp82ofnDBuhoxX6E+aMHKb/TJnsIb1K7tlg
   ej5a/mDXgHzYzkKu2PnCWQ2JvbIykJ6poopE0a3nH4HZK+OmTrN5guRrv
   mSS9Y5kFKXv1gtWHsGEk3qZ1pYQKE9kLkTZ7m+b1+cwFMGpGSBGSIHu7u
   i56BnWrcHGkqx0Q+bx2dhzeEwm/RRA/70w3PULUYt6zh8cyG0MN2woZh6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466630084"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="466630084"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 12:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="696450735"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="696450735"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 20 Sep 2023 12:29:06 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj2si-00093y-02;
	Wed, 20 Sep 2023 19:29:04 +0000
Date: Thu, 21 Sep 2023 03:28:56 +0800
From: kernel test robot <lkp@intel.com>
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Manish Narani <manish.narani@xilinx.com>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 670/1365] core.c:undefined
 reference to `dwc3_gadget_exit_hibernation'
Message-ID: <202309210358.96RcLAUU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: cbd364755cd28447d078372bda5ab27896856c84 [670/1365] usb: dwc3: don't setup event buffers when operating in host mode
config: x86_64-buildonly-randconfig-003-20230920 (https://download.01.org/0day-ci/archive/20230921/202309210358.96RcLAUU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210358.96RcLAUU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210358.96RcLAUU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/dwc3/core.o: in function `dwc3_suspend':
>> core.c:(.text+0x667a): undefined reference to `dwc3_gadget_exit_hibernation'
   ld: drivers/usb/dwc3/core.o: in function `dwc3_remove':
   core.c:(.text+0x687c): undefined reference to `dwc3_gadget_exit_hibernation'
   ld: sound/soc/intel/skylake/skl.o: in function `skl_codec_create':
   skl.c:(.text+0x1074): undefined reference to `snd_hda_codec_device_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
