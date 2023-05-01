Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80633362
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 01:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682905855; x=1714441855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jD179LK6PD0AJBtEUho8z/FtYK7l6DUbQuhZW1JqJ7g=;
  b=CSeXGM9QFVcOOBet0iXHlpUu0tkkZA9Px65UqZWmlN9TXbw+HGcBXVBm
   d+AXlOubI/ZWtoV9sBGK0/HvFrwypw/ZNgEgeTsvNf5Ay89eZ1YnCNbkf
   qRBn7HPcyDe2jQZS5fXwKhGzNdG4Hcbj8b7KifXOQUUupvnE4zXmqPLBw
   wB5ypDfWuyaR2svvqtWNMcIBc0yYMVyN3y/3aSw/LxaWnEnERJ0dl4ed+
   yuHQj4243Hjq2Qsrk/weSbUzHItxH02me7FW3sFeJQujiCkJFKnHefM3u
   9lcn8hHhOwnbsFMICEiwfUBr5L9K9Osq4Bfy0/5o7YY3aVLP6fu0FjRfo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="376114355"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="376114355"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 18:50:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="807260326"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="807260326"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2023 18:50:53 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptIgn-0000F9-0B;
	Mon, 01 May 2023 01:50:53 +0000
Date: Mon, 1 May 2023 09:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:ssm3515 1/1] sound/soc/codecs/ssm3515.c:178:20: warning: this
 statement may fall through
Message-ID: <202305010919.hGbJFy70-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux ssm3515
head:   d21bf64e223abceae841cda9e62bb5655d31264c
commit: d21bf64e223abceae841cda9e62bb5655d31264c [1/1] UNTESTED: ASoC: Add SSM3515 amp driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230501/202305010919.hGbJFy70-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/d21bf64e223abceae841cda9e62bb5655d31264c
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik ssm3515
        git checkout d21bf64e223abceae841cda9e62bb5655d31264c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010919.hGbJFy70-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/ssm3515.c:78:9: note: in expansion of macro 'SOC_SINGLE'
      78 |         SOC_SINGLE("Low EMI Mode Switch", SSM3515_GEC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: error: initializer element is not constant
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:80:9: note: in expansion of macro 'SOC_SINGLE'
      80 |         SOC_SINGLE("Soft Volume Ramping Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: note: (near initialization for 'ssm3515_snd_controls[2]')
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:80:9: note: in expansion of macro 'SOC_SINGLE'
      80 |         SOC_SINGLE("Soft Volume Ramping Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: error: initializer element is not constant
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:82:9: note: in expansion of macro 'SOC_SINGLE'
      82 |         SOC_SINGLE("HPF Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: note: (near initialization for 'ssm3515_snd_controls[3]')
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:82:9: note: in expansion of macro 'SOC_SINGLE'
      82 |         SOC_SINGLE("HPF Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: error: initializer element is not constant
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:84:9: note: in expansion of macro 'SOC_SINGLE'
      84 |         SOC_SINGLE("Low Power Mode Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: note: (near initialization for 'ssm3515_snd_controls[4]')
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:84:9: note: in expansion of macro 'SOC_SINGLE'
      84 |         SOC_SINGLE("Low Power Mode Switch", SSM3515_DAC,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: error: initializer element is not constant
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:86:9: note: in expansion of macro 'SOC_SINGLE'
      86 |         SOC_SINGLE("DAC Invert Switch", SSM3515_SAI1,
         |         ^~~~~~~~~~
   include/sound/soc.h:33:9: note: (near initialization for 'ssm3515_snd_controls[5]')
      33 |         {.reg = xreg, .rreg = xreg, .shift = shift_left, \
         |         ^
   include/sound/soc.h:42:9: note: in expansion of macro 'SOC_DOUBLE_VALUE'
      42 |         SOC_DOUBLE_VALUE(xreg, xshift, xshift, xmax, xinvert, xautodisable)
         |         ^~~~~~~~~~~~~~~~
   include/sound/soc.h:63:26: note: in expansion of macro 'SOC_SINGLE_VALUE'
      63 |         .private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
         |                          ^~~~~~~~~~~~~~~~
   sound/soc/codecs/ssm3515.c:86:9: note: in expansion of macro 'SOC_SINGLE'
      86 |         SOC_SINGLE("DAC Invert Switch", SSM3515_SAI1,
         |         ^~~~~~~~~~
   sound/soc/codecs/ssm3515.c: In function 'ssm3515_hw_params':
>> sound/soc/codecs/ssm3515.c:178:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     178 |                 if (ret < 0)
         |                    ^
   sound/soc/codecs/ssm3515.c:181:9: note: here
     181 |         default:
         |         ^~~~~~~


vim +178 sound/soc/codecs/ssm3515.c

    74	
    75	static const struct snd_kcontrol_new ssm3515_snd_controls[] = {
    76		SOC_SINGLE_TLV("DAC Playback Volume", SSM3515_DAC_VOLUME,
    77			       0, 255, 1, ssm3515_dac_volume),
    78		SOC_SINGLE("Low EMI Mode Switch", SSM3515_GEC,
    79			   ffs(SSM3515_GEC_EDGE) - 1, 1, 0),
    80		SOC_SINGLE("Soft Volume Ramping Switch", SSM3515_DAC,
    81			   ffs(SSM3515_DAC_HV) - 1, 1, 1),
    82		SOC_SINGLE("HPF Switch", SSM3515_DAC,
    83			   ffs(SSM3515_DAC_HPF) - 1, 1, 0),
    84		SOC_SINGLE("Low Power Mode Switch", SSM3515_DAC,
    85			   ffs(SSM3515_DAC_LPM) - 1, 1, 0),
  > 86		SOC_SINGLE("DAC Invert Switch", SSM3515_SAI1,
    87			   ffs(SSM3515_SAI1_DAC_POL) - 1, 1, 0),
    88	};
    89	
    90	static void ssm3515_read_faults(struct snd_soc_component *component)
    91	{
    92		int ret;
    93	
    94		ret = snd_soc_component_read(component, SSM3515_STATUS);
    95		if (ret <= 0) {
    96			/*
    97			 * If the read was errorneous, ASoC core has printed a message,
    98			 * and that's all that's appropriate in handling the error here.
    99			 */
   100			return;
   101		}
   102	
   103		dev_err(component->dev, "device reports:%s%s%s%s%s%s%s\n",
   104			FIELD_GET(SSM3515_STATUS_UVLO_REG, ret) ? " voltage regulator fault" : "",
   105			FIELD_GET(SSM3515_STATUS_LIM_EG, ret)   ? " limiter engaged" : "",
   106			FIELD_GET(SSM3515_STATUS_CLIP, ret)     ? " clipping detected" : "",
   107			FIELD_GET(SSM3515_STATUS_AMP_OC, ret)   ? " amp over-current fault" : "",
   108			FIELD_GET(SSM3515_STATUS_OTF, ret)      ? " overtemperature fault" : "",
   109			FIELD_GET(SSM3515_STATUS_OTW, ret)      ? " overtemperature warning" : "",
   110			FIELD_GET(SSM3515_STATUS_BAT_WARN, ret) ? " bat voltage low warning" : "");
   111	}
   112	
   113	static int ssm3515_reset(struct snd_soc_component *component)
   114	{
   115		int ret;
   116	
   117		ret = snd_soc_component_update_bits(component, SSM3515_PWR,
   118				SSM3515_PWR_S_RST, SSM3515_PWR_S_RST);
   119	
   120		if (ret < 0)
   121			return ret;
   122		return 0;
   123	}
   124	
   125	static int ssm3515_setup(struct snd_soc_component *component)
   126	{
   127		struct ssm3515_data *data =
   128				snd_soc_component_get_drvdata(component);
   129		int ret;
   130	
   131		ret = snd_soc_component_update_bits(component, SSM3515_GEC,
   132				SSM3515_GEC_ANA_GAIN,
   133				FIELD_PREP(SSM3515_GEC_ANA_GAIN, data->ana_gain));
   134	
   135		if (ret < 0)
   136			return ret;
   137		return 0;
   138	}
   139	
   140	static int ssm3515_probe(struct snd_soc_component *component)
   141	{
   142		int ret;
   143	
   144		ret = ssm3515_reset(component);
   145		if (ret < 0)
   146			return ret;
   147	
   148		return ssm3515_setup(component);
   149	}
   150	
   151	static int ssm3515_mute(struct snd_soc_dai *dai, int mute, int direction)
   152	{
   153		int ret;
   154	
   155		ret = snd_soc_component_update_bits(dai->component,
   156						    SSM3515_DAC,
   157						    SSM3515_DAC_MUTE,
   158						    FIELD_PREP(SSM3515_DAC_MUTE, mute));
   159		if (ret < 0)
   160			return ret;
   161		return 0;
   162	}
   163	
   164	static int ssm3515_hw_params(struct snd_pcm_substream *substream,
   165				     struct snd_pcm_hw_params *params,
   166				     struct snd_soc_dai *dai)
   167	{
   168		struct snd_soc_component *component = dai->component;
   169		int ret, rateval;
   170	
   171		switch (params_format(params)) {
   172		case SNDRV_PCM_FORMAT_S16:
   173		case SNDRV_PCM_FORMAT_S24:
   174			ret = snd_soc_component_update_bits(component,
   175					SSM3515_SAI2, SSM3515_SAI2_DATA_WIDTH,
   176					FIELD_PREP(SSM3515_SAI2_DATA_WIDTH,
   177						   params_width(params) == 16));
 > 178			if (ret < 0)
   179				return ret;
   180	
   181		default:
   182			return -EINVAL;
   183		}
   184	
   185		switch (params_rate(params)) {
   186		case 8000 ... 12000:
   187			rateval = 0;
   188			break;
   189		case 16000 ... 24000:
   190			rateval = 1;
   191			break;
   192		case 32000 ... 48000:
   193			rateval = 2;
   194			break;
   195		case 64000 ... 96000:
   196			rateval = 3;
   197			break;
   198		case 128000 ... 192000:
   199			rateval = 4;
   200			break;
   201		case 48001 ... 63999: /* this is ...72000 but overlaps */
   202			rateval = 5;
   203			break;
   204		default:
   205			return -EINVAL;
   206		}
   207	
   208		ret = snd_soc_component_update_bits(component,
   209				SSM3515_DAC, SSM3515_DAC_FS,
   210				FIELD_PREP(SSM3515_DAC_FS, rateval));
   211		if (ret < 0)
   212			return ret;
   213	
   214		return 0;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
