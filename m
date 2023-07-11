Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBCD17FE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 19:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689102081; x=1720638081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kH0o7dm+Oo3z0Tyou5m1O+4nnqrHgADPks4GPvNy/z0=;
  b=nBT7D4ZT2tF9NHCRT6DShchx0HBt+HFWexwK6xeBAegYOVMswgCj1y7G
   0SAnAPttgL/1CvbhoEPKxIMGpy66JR6rbOOqgTtX0dceKvGTI6JGkmZMu
   hSzNvFwEqD9gtycwzrZFuavLuVmytJXR0O9Qr6PIX8PnqE4L2bJUk5UJu
   hSR3HhlsP2XyIQR8y2v/mlfgi9NkIZ00ToLxp9Wdw/kDcbDasPvqUiRuc
   qQ9bIFpPOYeQiwKUq9RkmZr6AVvVPqj7e7Ryc5M/J/MPXA8bAjD62Ne1G
   ZoN0tygAN/W5OHTMcja/GuDpaUxRih6vcAd65sogC03icVO3coL6iPAzw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344307198"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="344307198"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 12:01:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="698528261"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="698528261"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Jul 2023 12:01:17 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJIbt-00052g-09;
	Tue, 11 Jul 2023 19:01:17 +0000
Date: Wed, 12 Jul 2023 03:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/wake-en-sts 33/33]
 sound/soc/sof/intel/lnl.c:167:6: warning: no previous prototype for
 'lnl_sdw_check_wakeen_irq'
Message-ID: <202307120259.vxxBrLyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/wake-en-sts
head:   e6a1de2a1ef6fbe986f7c9571ffd692840a10a23
commit: e6a1de2a1ef6fbe986f7c9571ffd692840a10a23 [33/33] ASoC: SOF: Intel: lnl: add helper to detect SoundWire wakes
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230712/202307120259.vxxBrLyE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120259.vxxBrLyE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120259.vxxBrLyE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/intel/lnl.c:167:6: warning: no previous prototype for 'lnl_sdw_check_wakeen_irq' [-Wmissing-prototypes]
     167 | bool lnl_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/lnl_sdw_check_wakeen_irq +167 sound/soc/sof/intel/lnl.c

   166	
 > 167	bool lnl_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
   168	{
   169		struct hdac_bus *bus = sof_to_bus(sdev);
   170		u16 wake_sts;
   171	
   172		/*
   173		 * we need to use the global HDaudio WAKEEN/STS to be able to
   174		 * detect wakes in low-power modes. This does not provide a
   175		 * link-specific information but this will be handled in the
   176		 * process_wakeen() helper.
   177		 */
   178		wake_sts = snd_hdac_chip_readw(bus, STATESTS);
   179	
   180		/* filter out the range of SDIs that can be set for SoundWire */
   181		return wake_sts & GENMASK(SDW_MAX_DEVICES, SDW_INTEL_DEV_NUM_IDA_MIN);
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
