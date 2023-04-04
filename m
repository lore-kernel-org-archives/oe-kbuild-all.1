Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290C7BA3E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680623317; x=1712159317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UptvTG4aFR011GJLVts1oxOoxLMLOROueUPWZC1W3/A=;
  b=Ycj4ulKfx8EXCSw7ad/j+6DhXtqVT6kyCMj5fgGVVmn+eqMH8E8uOovF
   qJg3MVeeTQ9zreO3zIb6jUY+2dkxcrWVbvWG4hb7JUSW/30xMTYFc85jO
   88tdnpMNAOjCkWoWA/izzTTCxix3sjm11UBO75/bdDSMXJFkXEnCuUSb2
   kc5s9UbVlRtbV4Lkjzmkw9AcU+bf4uVS+4zuH25RYVSE02YPU1aQ5SUA4
   1WQPxdAk5ZcMhfPj92J46L/XqUM9yQULJBvVJ27WljmljvetCWw+srZar
   LQCiiExee6oFuMwY/6P4920vOQyegvpIeRfVGUbhmXPYHf3orHNsXMs7Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428510616"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="428510616"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 08:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="775683593"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="775683593"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Apr 2023 08:48:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjitb-000Pqe-2p;
	Tue, 04 Apr 2023 15:48:31 +0000
Date: Tue, 4 Apr 2023 23:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, derek.fang@realtek.com,
	pierre-louis.bossart@intel.com, bard.liao@intel.com,
	Yijun.Shen@dell.com, Shuming Fan <shumingf@realtek.com>
Subject: Re: [PATCH v3] ASoC: rt712-sdca: Add RT712 SDCA driver for Mic
 topology
Message-ID: <202304042324.kTGAiaCz-lkp@intel.com>
References: <20230329090737.254649-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329090737.254649-1-shumingf@realtek.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.3-rc5 next-20230404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shumingf-realtek-com/ASoC-rt712-sdca-Add-RT712-SDCA-driver-for-Mic-topology/20230329-171313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230329090737.254649-1-shumingf%40realtek.com
patch subject: [PATCH v3] ASoC: rt712-sdca: Add RT712 SDCA driver for Mic topology
config: arc-randconfig-r043-20230404 (https://download.01.org/0day-ci/archive/20230404/202304042324.kTGAiaCz-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aeee9e435d2d3b75d6cacb0b19bd6afb06c287ac
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review shumingf-realtek-com/ASoC-rt712-sdca-Add-RT712-SDCA-driver-for-Mic-topology/20230329-171313
        git checkout aeee9e435d2d3b75d6cacb0b19bd6afb06c287ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/virtio/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304042324.kTGAiaCz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt712-sdca-dmic.c:178:5: warning: no previous prototype for 'rt712_sdca_dmic_io_init' [-Wmissing-prototypes]
     178 | int rt712_sdca_dmic_io_init(struct device *dev, struct sdw_slave *slave)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/rt712-sdca-dmic.c:765:5: warning: no previous prototype for 'rt712_sdca_dmic_init' [-Wmissing-prototypes]
     765 | int rt712_sdca_dmic_init(struct device *dev, struct regmap *regmap,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/rt712_sdca_dmic_io_init +178 sound/soc/codecs/rt712-sdca-dmic.c

   177	
 > 178	int rt712_sdca_dmic_io_init(struct device *dev, struct sdw_slave *slave)
   179	{
   180		struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
   181	
   182		if (rt712->hw_init)
   183			return 0;
   184	
   185		if (rt712->first_hw_init) {
   186			regcache_cache_only(rt712->regmap, false);
   187			regcache_cache_bypass(rt712->regmap, true);
   188			regcache_cache_only(rt712->mbq_regmap, false);
   189			regcache_cache_bypass(rt712->mbq_regmap, true);
   190		} else {
   191			/*
   192			 * PM runtime is only enabled when a Slave reports as Attached
   193			 */
   194	
   195			/* set autosuspend parameters */
   196			pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
   197			pm_runtime_use_autosuspend(&slave->dev);
   198	
   199			/* update count of parent 'active' children */
   200			pm_runtime_set_active(&slave->dev);
   201	
   202			/* make sure the device does not suspend immediately */
   203			pm_runtime_mark_last_busy(&slave->dev);
   204	
   205			pm_runtime_enable(&slave->dev);
   206		}
   207	
   208		pm_runtime_get_noresume(&slave->dev);
   209	
   210		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   211			RT712_ADC0A_08_PDE_FLOAT_CTL, 0x1112);
   212		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   213			RT712_ADC0B_11_PDE_FLOAT_CTL, 0x1111);
   214		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   215			RT712_DMIC1_2_PDE_FLOAT_CTL, 0x1111);
   216		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   217			RT712_I2S_IN_OUT_PDE_FLOAT_CTL, 0x1155);
   218		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   219			RT712_DMIC_ENT_FLOAT_CTL, 0x2626);
   220		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   221			RT712_ADC_ENT_FLOAT_CTL, 0x1e19);
   222		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   223			RT712_DMIC_GAIN_ENT_FLOAT_CTL0, 0x1515);
   224		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   225			RT712_ADC_VOL_CH_FLOAT_CTL2, 0x0304);
   226		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   227			RT712_DMIC_GAIN_ENT_FLOAT_CTL2, 0x0304);
   228		rt712_sdca_dmic_index_write(rt712, RT712_VENDOR_HDA_CTL,
   229			RT712_HDA_LEGACY_CONFIG_CTL0, 0x0050);
   230		regmap_write(rt712->regmap,
   231			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT712_SDCA_ENT_IT26, RT712_SDCA_CTL_VENDOR_DEF, 0), 0x01);
   232		rt712_sdca_dmic_index_write(rt712, RT712_ULTRA_SOUND_DET,
   233			RT712_ULTRA_SOUND_DETECTOR6, 0x3200);
   234		regmap_write(rt712->regmap, RT712_RC_CAL, 0x23);
   235		regmap_write(rt712->regmap, 0x2f52, 0x00);
   236	
   237		if (rt712->first_hw_init) {
   238			regcache_cache_bypass(rt712->regmap, false);
   239			regcache_mark_dirty(rt712->regmap);
   240			regcache_cache_bypass(rt712->mbq_regmap, false);
   241			regcache_mark_dirty(rt712->mbq_regmap);
   242		} else
   243			rt712->first_hw_init = true;
   244	
   245		/* Mark Slave initialization complete */
   246		rt712->hw_init = true;
   247	
   248		pm_runtime_mark_last_busy(&slave->dev);
   249		pm_runtime_put_autosuspend(&slave->dev);
   250	
   251		dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
   252		return 0;
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
