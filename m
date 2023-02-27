Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3FF746B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677510708; x=1709046708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gcXkyaQgCSlBhAthc0OqndMPRI97SG85pD9fj+XVBnk=;
  b=U53xb9P8KM31IdQFfUgJK7AdvGueK9LE2x7WZoprd//WrqyOoanRe6Xm
   cuRY7vzvbppOODQFYN0iwnlz576eDmDjYsc2gPHWfhtaCdVff2FR+E/Gv
   4TPfFtSefCmBDKMHqQYolRFsRl9G9/m4RXCMqKC7t6DTMIzBvLXbCaYza
   t7t5EIQVSm59gjwgcOc9GwCNNj7y3OzmznDdS+F9B1D4s/T8h1HN+96A9
   26ISd2ttYDAnLxFXNNULaSKIVMrD2em+kS+Zuo4JXzOMmeqUyab1MmX8D
   ZMS3Tlf6Ahyu9iyD7xrxmfL11DDZiimJpA6cc/D1BhxvsDWLx9JI3gVR6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="396431467"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="396431467"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 07:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="675912415"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="675912415"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2023 07:11:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWfAH-0004WF-2d;
	Mon, 27 Feb 2023 15:11:45 +0000
Date: Mon, 27 Feb 2023 23:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 163/583]
 drivers/clk/clk-allo-dac.c:39: warning: expecting prototype for struct
 allo_dac_clk. Prototype was for struct clk_allo_hw instead
Message-ID: <202302272318.5IKDVbUE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: c5abbb8f699bfb53c0cba64c782345a48814b1a7 [163/583] Add support for all the downstream rpi sound card drivers
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230227/202302272318.5IKDVbUE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/c5abbb8f699bfb53c0cba64c782345a48814b1a7
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout c5abbb8f699bfb53c0cba64c782345a48814b1a7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/char/broadcom/ drivers/clk/ drivers/gpio/ drivers/media/i2c/ drivers/staging/fbtft/ drivers/staging/vc04_services/ drivers/video/fbdev/ sound/soc/bcm/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272318.5IKDVbUE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-allo-dac.c:39: warning: expecting prototype for struct allo_dac_clk. Prototype was for struct clk_allo_hw instead
--
>> drivers/clk/clk-hifiberry-dacpro.c:38: warning: expecting prototype for struct hifiberry_dacpro_clk. Prototype was for struct clk_hifiberry_hw instead
--
   sound/soc/bcm/allo-boss2-dac.c: In function 'cs43130_pcm_pdn':
>> sound/soc/bcm/allo-boss2-dac.c:261:27: warning: variable 'pdn_int' set but not used [-Wunused-but-set-variable]
     261 |         unsigned int reg, pdn_int;
         |                           ^~~~~~~
>> sound/soc/bcm/allo-boss2-dac.c:260:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     260 |         int ret;
         |             ^~~
   sound/soc/bcm/allo-boss2-dac.c: In function 'cs43130_hw_params':
   sound/soc/bcm/allo-boss2-dac.c:665:36: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     665 |         unsigned int required_clk, ret;
         |                                    ^~~
>> sound/soc/bcm/allo-boss2-dac.c:665:22: warning: variable 'required_clk' set but not used [-Wunused-but-set-variable]
     665 |         unsigned int required_clk, ret;
         |                      ^~~~~~~~~~~~
   sound/soc/bcm/allo-boss2-dac.c: At top level:
   sound/soc/bcm/allo-boss2-dac.c:955:35: warning: initialized field overwritten [-Woverride-init]
     955 |         .idle_bias_on           = 1,
         |                                   ^
   sound/soc/bcm/allo-boss2-dac.c:955:35: note: (near initialization for 'cs43130_component_driver.idle_bias_on')
   In file included from sound/soc/bcm/allo-boss2-dac.c:46:
   sound/soc/bcm/../codecs/cs43130.h:486:26: warning: 'cs43130_supply_names' defined but not used [-Wunused-const-variable=]
     486 | static const char *const cs43130_supply_names[CS43130_NUM_SUPPLIES] = {
         |                          ^~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/bcm/allo-katana-codec.c:249:5: warning: no previous prototype for 'katana_codec_dai_mute_stream' [-Wmissing-prototypes]
     249 | int katana_codec_dai_mute_stream(struct snd_soc_dai *dai, int mute,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   sound/soc/bcm/pifi-40.c: In function 'snd_pifi_40_hw_params':
>> sound/soc/bcm/pifi-40.c:143:22: warning: variable 'sample_bits' set but not used [-Wunused-but-set-variable]
     143 |         unsigned int sample_bits;
         |                      ^~~~~~~~~~~
--
   sound/soc/bcm/dacberry400.c: In function 'snd_rpi_dacberry400_set_bias_level':
>> sound/soc/bcm/dacberry400.c:83:31: warning: variable 'aic3x' set but not used [-Wunused-but-set-variable]
      83 |         struct dacberry_priv *aic3x;
         |                               ^~~~~
   sound/soc/bcm/dacberry400.c: In function 'snd_rpi_dacberry400_hw_params':
>> sound/soc/bcm/dacberry400.c:139:12: warning: variable 'clock' set but not used [-Wunused-but-set-variable]
     139 |         u8 clock = 0;
         |            ^~~~~
--
   sound/soc/codecs/ma120x0p.c: In function 'ma120x0p_mute_stream':
>> sound/soc/codecs/ma120x0p.c:976:31: warning: variable 'ma120x0p' set but not used [-Wunused-but-set-variable]
     976 |         struct ma120x0p_priv *ma120x0p;
         |                               ^~~~~~~~
   sound/soc/codecs/ma120x0p.c: In function 'ma120x0p_clear_err':
   sound/soc/codecs/ma120x0p.c:1016:31: warning: variable 'ma120x0p' set but not used [-Wunused-but-set-variable]
    1016 |         struct ma120x0p_priv *ma120x0p;
         |                               ^~~~~~~~
   sound/soc/codecs/ma120x0p.c: In function 'ma120x0p_remove':
   sound/soc/codecs/ma120x0p.c:1040:31: warning: variable 'ma120x0p' set but not used [-Wunused-but-set-variable]
    1040 |         struct ma120x0p_priv *ma120x0p;
         |                               ^~~~~~~~
   sound/soc/codecs/ma120x0p.c: In function 'ma120x0p_probe':
   sound/soc/codecs/ma120x0p.c:1047:31: warning: variable 'ma120x0p' set but not used [-Wunused-but-set-variable]
    1047 |         struct ma120x0p_priv *ma120x0p;
         |                               ^~~~~~~~
   sound/soc/codecs/ma120x0p.c: In function 'ma120x0p_set_bias_level':
   sound/soc/codecs/ma120x0p.c:1133:31: warning: variable 'ma120x0p' set but not used [-Wunused-but-set-variable]
    1133 |         struct ma120x0p_priv *ma120x0p;
         |                               ^~~~~~~~
--
   sound/soc/codecs/tas5713.c: In function 'tas5713_remove':
>> sound/soc/codecs/tas5713.c:165:30: warning: variable 'tas5713' set but not used [-Wunused-but-set-variable]
     165 |         struct tas5713_priv *tas5713;
         |                              ^~~~~~~
   sound/soc/codecs/tas5713.c: In function 'tas5713_probe':
   sound/soc/codecs/tas5713.c:173:30: warning: variable 'tas5713' set but not used [-Wunused-but-set-variable]
     173 |         struct tas5713_priv *tas5713;
         |                              ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_TLV320AIC32X4_I2C
   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && I2C [=m] && COMMON_CLK [=n]
   Selected by [m]:
   - SND_AUDIOSENSE_PI [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   WARNING: unmet direct dependencies detected for COMMON_CLK_HIFIBERRY_DACPRO
   Depends on [n]: COMMON_CLK [=n]
   Selected by [m]:
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUS [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSADC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSADCPRO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])
   WARNING: unmet direct dependencies detected for COMMON_CLK_HIFIBERRY_DACPLUSHD
   Depends on [n]: COMMON_CLK [=n]
   Selected by [m]:
   - SND_BCM2708_SOC_HIFIBERRY_DACPLUSHD [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (SND_BCM2708_SOC_I2S || SND_BCM2835_SOC_I2S [=m])


vim +39 drivers/clk/clk-allo-dac.c

    30	
    31	/**
    32	 * struct allo_dac_clk - Common struct to the Allo DAC
    33	 * @hw: clk_hw for the common clk framework
    34	 * @mode: 0 => CLK44EN, 1 => CLK48EN
    35	 */
    36	struct clk_allo_hw {
    37		struct clk_hw hw;
    38		uint8_t mode;
  > 39	};
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
