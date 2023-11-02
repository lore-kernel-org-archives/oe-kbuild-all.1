Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944BA6FDE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dy4s9yXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698913364; x=1730449364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JotS70R+S8A+0CusysfyaQnTBqhpf0Ta1NGU7KHt7cU=;
  b=Dy4s9yXZRY9/HAGbu/KHz/veRIPL2BdVJ4QZzQo1/bW3suoCDNW/dV30
   CGllJL2oGGwAxxJKQHqPAvqSNSgKIZjYaTcDCFtPCg54qg93C/GKMDmAY
   B6bF0vNyQfCPRx5NMJdbNKR0EG0DFAATr5E0C2igzVn7B/wXhCw9F89fR
   xTuiveBW+zdFGzTARYGd54tGWEngX3mAapPKAoVesaiCqnXAPn+5ezFiz
   n7mTj1u1zsVAgx6WA9NQswPqLni5YTnHm/aNjg4z5pWja2fhe+/vngG63
   I0YmsMhFmqu2oVAMOzSoJ7i+m6NkE3TCN8yf1HiejWnRC4GVCNAuht3zT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="379055628"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="379055628"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 01:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="764842234"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="764842234"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Nov 2023 01:22:42 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qySyO-0001GK-1T;
	Thu, 02 Nov 2023 08:22:40 +0000
Date: Thu, 2 Nov 2023 16:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/start-BRA-support 33/35]
 drivers/soundwire/intel_ace2x.c:21:5: warning: no previous prototype for
 'intel_ace2x_bpt_open_stream'
Message-ID: <202311021639.poR9QhoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   435eecba9365ea702ed336be739716e72d20e78f
commit: 5bae05660fcd8c03cb0ed57107c708feac6fd160 [33/35] soundwire: intel_ace2x: add BPT open/close/send_async/wait
config: x86_64-randconfig-014-20231102 (https://download.01.org/0day-ci/archive/20231102/202311021639.poR9QhoU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021639.poR9QhoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021639.poR9QhoU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/intel_ace2x.c:21:5: warning: no previous prototype for 'intel_ace2x_bpt_open_stream' [-Wmissing-prototypes]
      21 | int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soundwire/intel_ace2x.c:116:5: warning: no previous prototype for 'intel_ace2x_bpt_close_stream' [-Wmissing-prototypes]
     116 | int intel_ace2x_bpt_close_stream(struct sdw_intel *sdw,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/intel_ace2x_bpt_open_stream +21 drivers/soundwire/intel_ace2x.c

    20	
  > 21	int intel_ace2x_bpt_open_stream(struct sdw_intel *sdw,
    22					struct sdw_slave *slave,
    23					enum sdw_bpt_type mode)
    24	{
    25		struct sdw_cdns *cdns = &sdw->cdns;
    26		struct sdw_stream_runtime *stream;
    27		struct sdw_stream_config sconfig;
    28		struct sdw_port_config *pconfig;
    29		struct sdw_cdns_pdi *pdi0;
    30		struct sdw_cdns_pdi *pdi1;
    31		const int ch = 1;
    32		int dir;
    33		int ret;
    34	
    35		if (mode != SDW_BRA)
    36			return -EINVAL;
    37	
    38		stream = sdw_alloc_stream("BPT", SDW_STREAM_BPT);
    39		if (!stream)
    40			return -ENOMEM;
    41		cdns->bus.bpt_stream = stream; /* FIXME: we need to de-alloc this */
    42	
    43		/* handle PDI0 first */
    44		dir = SDW_DATA_DIR_TX;
    45	
    46		pdi0 = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch,  dir, 0);
    47		if (!pdi0) {
    48			dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi0 failed\n", __func__);
    49			ret = -EINVAL;
    50			goto error;
    51		}
    52	
    53		/* FIXME: what does this mean ? */
    54		/* the SHIM will be configured in the callback functions */
    55	
    56		sdw_cdns_config_stream(cdns, ch, dir, pdi0);
    57	
    58		/* handle PDI1  */
    59		dir = SDW_DATA_DIR_RX;
    60	
    61		pdi1 = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch,  dir, 1);
    62		if (!pdi1) {
    63			dev_err(cdns->dev, "%s: sdw_cdns_alloc_pdi1 failed\n", __func__);
    64			ret = -EINVAL;
    65			goto error;
    66		}
    67	
    68		/* the SHIM will be configured in the callback functions */
    69	
    70		sdw_cdns_config_stream(cdns, ch, dir, pdi1);
    71	
    72	#if 0 // is this needed ?
    73		/* Inform DSP about PDI stream number */
    74		ret = intel_params_stream(sdw, substream, dai, params,
    75					  sdw->instance,
    76					  pdi->intel_alh_id);
    77		if (ret)
    78			goto error;
    79	#endif
    80	
    81		/*
    82		 * the port config direction, number of channels and frame
    83		 * rate is totally arbitrary
    84		 */
    85		sconfig.direction = dir;
    86		sconfig.ch_count = ch;
    87		sconfig.frame_rate = 16000;
    88		sconfig.type = SDW_STREAM_BPT;
    89		sconfig.bps = 32; /* this is required for BPT/BRA */
    90	
    91		/* Port configuration */
    92		pconfig = kzalloc(2 * sizeof(*pconfig), GFP_KERNEL);
    93		if (!pconfig) {
    94			ret =  -ENOMEM;
    95			goto error;
    96		}
    97	
    98		pconfig->num = 0;
    99		pconfig->ch_mask = ch;
   100		pconfig++;
   101	
   102		pconfig->num = 1;
   103		pconfig->ch_mask = ch;
   104	
   105		ret = sdw_stream_add_master(&cdns->bus, &sconfig,
   106					    pconfig, 2, stream);
   107		if (ret)
   108			dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
   109	
   110		kfree(pconfig);
   111	
   112	error:
   113		return ret;
   114	}
   115	
 > 116	int intel_ace2x_bpt_close_stream(struct sdw_intel *sdw,
   117					 struct sdw_slave *slave,
   118					 enum sdw_bpt_type mode)
   119	{
   120		struct sdw_cdns *cdns = &sdw->cdns;
   121		int ret;
   122	
   123		if (mode != SDW_BRA)
   124			return -EINVAL;
   125	
   126		ret = sdw_stream_remove_master(&cdns->bus, cdns->bus.bpt_stream);
   127		if (ret < 0) {
   128			dev_err(cdns->dev, "%s: remove master failed: %d\n",
   129				__func__, ret);
   130			return ret;
   131		}
   132		cdns->bus.bpt_stream = NULL;
   133	
   134		return 0;
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
