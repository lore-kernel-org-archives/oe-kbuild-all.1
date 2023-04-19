Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC8028F2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 09:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681897968; x=1713433968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1JYSpyHVU42d2x/TOT8jBN4F5gidA5RMyYM07mN8big=;
  b=LQprqwaiCn6U91i8BbZ6Vq6s1F1ThhpIGNbhPUUh6RJHsq3CWN7pYqS0
   rVvkrYfpBYfpzVIyqWE6cUMTFxeUecv4XxaMbVZgN0Ww43dNElxZXR7qb
   Lb00I2HbwXxPz7CiT8ogW9DuowmWCy3y7V0GZL0iwBpSVC1yFXFNQUvps
   ZzcNvW3N/AveenyNhSF16BfWoxhLFJZwA6bCZWid5SZOh7L9bQ4lNRpND
   ziUosumv7SYjhk+vlWlmL0BMmkecIMqsUEok9a2myI5UeTc3bDIcap2oA
   zApROrY8OIqmdTyvJWJL2rePY1mCsvDyfrWFNGD6wepNlMDNeFAHH3v7D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="345406393"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="345406393"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 02:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="780803515"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="780803515"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Apr 2023 02:52:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp4UX-000emx-36;
	Wed, 19 Apr 2023 09:52:45 +0000
Date: Wed, 19 Apr 2023 17:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Yu <jack.yu@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: rt722-sdca: Add RT722 SDCA driver
Message-ID: <202304191703.YN0aeF6T-lkp@intel.com>
References: <20230419075130.29895-1-jack.yu@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419075130.29895-1-jack.yu@realtek.com>

Hi Jack,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20230418]
[cannot apply to linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Yu/ASoC-rt722-sdca-Add-RT722-SDCA-driver/20230419-155442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230419075130.29895-1-jack.yu%40realtek.com
patch subject: [PATCH] ASoC: rt722-sdca: Add RT722 SDCA driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230419/202304191703.YN0aeF6T-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8921f6bb62a04f5186b44864be481588925383a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jack-Yu/ASoC-rt722-sdca-Add-RT722-SDCA-driver/20230419-155442
        git checkout 8921f6bb62a04f5186b44864be481588925383a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191703.YN0aeF6T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/rt722-sdca.c: In function 'rt722_sdca_set_gain_put':
>> sound/soc/codecs/rt722-sdca.c:355:40: warning: variable 'changed' set but not used [-Wunused-but-set-variable]
     355 |         unsigned int adc_vol_flag = 0, changed = 0;
         |                                        ^~~~~~~


vim +/changed +355 sound/soc/codecs/rt722-sdca.c

   345	
   346	/* For SDCA control DAC/ADC Gain */
   347	static int rt722_sdca_set_gain_put(struct snd_kcontrol *kcontrol,
   348			struct snd_ctl_elem_value *ucontrol)
   349	{
   350		struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
   351		struct soc_mixer_control *mc =
   352			(struct soc_mixer_control *)kcontrol->private_value;
   353		struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
   354		unsigned int read_l, read_r, gain_l_val, gain_r_val;
 > 355		unsigned int adc_vol_flag = 0, changed = 0;
   356		unsigned int lvalue, rvalue;
   357		const unsigned int interval_offset = 0xc0;
   358		const unsigned int tendB = 0xa00;
   359	
   360		if (strstr(ucontrol->id.name, "FU1E Capture Volume") ||
   361			strstr(ucontrol->id.name, "FU0F Capture Volume"))
   362			adc_vol_flag = 1;
   363	
   364		regmap_read(rt722->mbq_regmap, mc->reg, &lvalue);
   365		regmap_read(rt722->mbq_regmap, mc->rreg, &rvalue);
   366	
   367		/* L Channel */
   368		gain_l_val = ucontrol->value.integer.value[0];
   369		if (gain_l_val > mc->max)
   370			gain_l_val = mc->max;
   371	
   372		if (mc->shift == 8) /* boost gain */
   373			gain_l_val = gain_l_val * tendB;
   374		else {
   375			/* ADC/DAC gain */
   376			if (adc_vol_flag)
   377				gain_l_val = 0x1e00 - ((mc->max - gain_l_val) * interval_offset);
   378			else
   379				gain_l_val = 0 - ((mc->max - gain_l_val) * interval_offset);
   380			gain_l_val &= 0xffff;
   381		}
   382	
   383		/* R Channel */
   384		gain_r_val = ucontrol->value.integer.value[1];
   385		if (gain_r_val > mc->max)
   386			gain_r_val = mc->max;
   387	
   388		if (mc->shift == 8) /* boost gain */
   389			gain_r_val = gain_r_val * tendB;
   390		else {
   391			/* ADC/DAC gain */
   392			if (adc_vol_flag)
   393				gain_r_val = 0x1e00 - ((mc->max - gain_r_val) * interval_offset);
   394			else
   395				gain_r_val = 0 - ((mc->max - gain_r_val) * interval_offset);
   396			gain_r_val &= 0xffff;
   397		}
   398	
   399		if (lvalue != gain_l_val || rvalue != gain_r_val)
   400			changed = 1;
   401		else
   402			return 0;
   403	
   404		/* Lch*/
   405		regmap_write(rt722->mbq_regmap, mc->reg, gain_l_val);
   406	
   407		/* Rch */
   408		regmap_write(rt722->mbq_regmap, mc->rreg, gain_r_val);
   409	
   410		regmap_read(rt722->mbq_regmap, mc->reg, &read_l);
   411		regmap_read(rt722->mbq_regmap, mc->rreg, &read_r);
   412		if (read_r == gain_r_val && read_l == gain_l_val)
   413			return 1;
   414	
   415		return -EIO;
   416	}
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
