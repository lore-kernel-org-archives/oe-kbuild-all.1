Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E567E2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 03:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676001202; x=1707537202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OjjWca3hBfMIKs2O7Em3173GsK0Aik9dyEOYfYQVkQs=;
  b=AXMo+K5QQYWWyFCLzI9O6+XbggR1wydUK5wNczkhcXTw9d1jHOmjDVfy
   IGAI+dmroMccTCQmiOluOEzcmI3SMdJLQJfGbpVdZLKgW2qLOzSWKK1+a
   2R5q2ViIxrCm74rFUCnWh0UKgXiaaJqaG8kqxOMS3TkHKyo3S3TeQXDlw
   8JkJCkcVYF5DLfq31D8nr1ve9ulIy5LjKIuDiHf5DNMQsfzwnXcYnDD1/
   mbay4qfi8ogRVqZF41yOwv2uFGT5n5mGQf8M36riq5bh6ikUeJEQ1pCul
   gcYbNY9DMQKrXXJQAERdWQVluAI/BR5NJH86k5vj1gV5m7dmsuSu57yBV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="310694175"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="310694175"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 19:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="913391268"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="913391268"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Feb 2023 19:53:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQKTN-0005WK-2X;
	Fri, 10 Feb 2023 03:53:17 +0000
Date: Fri, 10 Feb 2023 11:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sound/soc/samsung/aries_wm8994.c:100:22: error: implicit declaration
 of function 'gpiod_get_value'; did you mean 'gpio_get_value'?
Message-ID: <202302101134.JyRppXYu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   38c1e0c65865426676123cc9a127526fa02bcac6
commit: 44bd27c42a1c9a00f1fbcb58301a7f3e6f5cdd0f ASoC: simple-amplifier: Remove spurious gpiolib select
date:   1 year ago
config: nios2-randconfig-r026-20230210 (https://download.01.org/0day-ci/archive/20230210/202302101134.JyRppXYu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=44bd27c42a1c9a00f1fbcb58301a7f3e6f5cdd0f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 44bd27c42a1c9a00f1fbcb58301a7f3e6f5cdd0f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash sound/soc/samsung/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101134.JyRppXYu-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/samsung/aries_wm8994.c: In function 'headset_det_irq_thread':
>> sound/soc/samsung/aries_wm8994.c:100:22: error: implicit declaration of function 'gpiod_get_value'; did you mean 'gpio_get_value'? [-Werror=implicit-function-declaration]
     100 |                 if (!gpiod_get_value(priv->gpio_headset_detect)) {
         |                      ^~~~~~~~~~~~~~~
         |                      gpio_get_value
>> sound/soc/samsung/aries_wm8994.c:103:25: error: implicit declaration of function 'gpiod_set_value'; did you mean 'gpio_set_value'? [-Werror=implicit-function-declaration]
     103 |                         gpiod_set_value(priv->gpio_earpath_sel, 0);
         |                         ^~~~~~~~~~~~~~~
         |                         gpio_set_value
   sound/soc/samsung/aries_wm8994.c: In function 'headset_button_check':
>> sound/soc/samsung/aries_wm8994.c:145:13: error: implicit declaration of function 'gpiod_get_value_cansleep'; did you mean 'gpio_get_value_cansleep'? [-Werror=implicit-function-declaration]
     145 |         if (gpiod_get_value_cansleep(priv->gpio_headset_key) &&
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
         |             gpio_get_value_cansleep
   sound/soc/samsung/aries_wm8994.c: In function 'aries_late_probe':
>> sound/soc/samsung/aries_wm8994.c:376:15: error: implicit declaration of function 'gpiod_to_irq'; did you mean 'gpio_to_irq'? [-Werror=implicit-function-declaration]
     376 |         irq = gpiod_to_irq(priv->gpio_headset_detect);
         |               ^~~~~~~~~~~~
         |               gpio_to_irq
   sound/soc/samsung/aries_wm8994.c: In function 'aries_audio_probe':
>> sound/soc/samsung/aries_wm8994.c:579:34: error: implicit declaration of function 'devm_gpiod_get'; did you mean 'devm_gpio_free'? [-Werror=implicit-function-declaration]
     579 |         priv->gpio_earpath_sel = devm_gpiod_get(dev, "earpath-sel",
         |                                  ^~~~~~~~~~~~~~
         |                                  devm_gpio_free
>> sound/soc/samsung/aries_wm8994.c:580:25: error: 'GPIOD_OUT_LOW' undeclared (first use in this function); did you mean 'GPIOF_INIT_LOW'?
     580 |                         GPIOD_OUT_LOW);
         |                         ^~~~~~~~~~~~~
         |                         GPIOF_INIT_LOW
   sound/soc/samsung/aries_wm8994.c:580:25: note: each undeclared identifier is reported only once for each function it appears in
>> sound/soc/samsung/aries_wm8994.c:602:25: error: 'GPIOD_IN' undeclared (first use in this function); did you mean 'GPIOF_IN'?
     602 |                         GPIOD_IN);
         |                         ^~~~~~~~
         |                         GPIOF_IN
   cc1: some warnings being treated as errors


vim +100 sound/soc/samsung/aries_wm8994.c

7a3a7671fa6c7e Jonathan Bakker 2020-06-14   91  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14   92  static irqreturn_t headset_det_irq_thread(int irq, void *data)
7a3a7671fa6c7e Jonathan Bakker 2020-06-14   93  {
7a3a7671fa6c7e Jonathan Bakker 2020-06-14   94  	struct aries_wm8994_data *priv = (struct aries_wm8994_data *) data;
7a3a7671fa6c7e Jonathan Bakker 2020-06-14   95  	int ret = 0;
7a3a7671fa6c7e Jonathan Bakker 2020-06-14   96  	int time_left_ms = 300;
7a3a7671fa6c7e Jonathan Bakker 2020-06-14   97  	int adc;
7a3a7671fa6c7e Jonathan Bakker 2020-06-14   98  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14   99  	while (time_left_ms > 0) {
7a3a7671fa6c7e Jonathan Bakker 2020-06-14 @100  		if (!gpiod_get_value(priv->gpio_headset_detect)) {
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  101  			snd_soc_jack_report(&aries_headset, 0,
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  102  					SND_JACK_HEADSET);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14 @103  			gpiod_set_value(priv->gpio_earpath_sel, 0);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  104  			return IRQ_HANDLED;
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  105  		}
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  106  		msleep(20);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  107  		time_left_ms -= 20;
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  108  	}
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  109  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  110  	/* Temporarily enable micbias and earpath selector */
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  111  	ret = regulator_enable(priv->reg_headset_micbias);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  112  	if (ret)
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  113  		pr_err("%s failed to enable micbias: %d", __func__, ret);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  114  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  115  	gpiod_set_value(priv->gpio_earpath_sel, 1);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  116  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  117  	ret = iio_read_channel_processed(priv->adc, &adc);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  118  	if (ret < 0) {
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  119  		/* failed to read ADC, so assume headphone */
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  120  		pr_err("%s failed to read ADC, assuming headphones", __func__);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  121  		snd_soc_jack_report(&aries_headset, SND_JACK_HEADPHONE,
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  122  				SND_JACK_HEADSET);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  123  	} else {
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  124  		snd_soc_jack_report(&aries_headset,
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  125  				snd_soc_jack_get_type(&aries_headset, adc),
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  126  				SND_JACK_HEADSET);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  127  	}
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  128  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  129  	ret = regulator_disable(priv->reg_headset_micbias);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  130  	if (ret)
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  131  		pr_err("%s failed disable micbias: %d", __func__, ret);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  132  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  133  	/* Disable earpath selector when no mic connected */
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  134  	if (!(aries_headset.status & SND_JACK_MICROPHONE))
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  135  		gpiod_set_value(priv->gpio_earpath_sel, 0);
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  136  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  137  	return IRQ_HANDLED;
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  138  }
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  139  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  140  static int headset_button_check(void *data)
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  141  {
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  142  	struct aries_wm8994_data *priv = (struct aries_wm8994_data *) data;
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  143  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  144  	/* Filter out keypresses when 4 pole jack not detected */
7a3a7671fa6c7e Jonathan Bakker 2020-06-14 @145  	if (gpiod_get_value_cansleep(priv->gpio_headset_key) &&
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  146  			aries_headset.status & SND_JACK_MICROPHONE)
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  147  		return SND_JACK_BTN_0;
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  148  
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  149  	return 0;
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  150  }
7a3a7671fa6c7e Jonathan Bakker 2020-06-14  151  

:::::: The code at line 100 was first introduced by commit
:::::: 7a3a7671fa6c7e90aff5f4242add2a40587b85ef ASoC: samsung: Add driver for Aries boards

:::::: TO: Jonathan Bakker <xc-racer2@live.ca>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
