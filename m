Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAC1EEDE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735490516; cv=none; b=C9oRHNVdZkROV/oE+f7JlALZNORtIgFztliAM9KjIkQv28j7x3UTzS2WDm3BpWPr/yNIz1I9d9n5aImcPkczuvieYg6auih0v0GcLoEIv1iwdSfB6gWVVb2f3YXO8AukyFBhG0ZUnVa8MzXiU3faXa9/EbqM9i7S/gs0xq+d3NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735490516; c=relaxed/simple;
	bh=wY4u2IZytAM//DiidxwPYVLyjDV7QjNWupZCkLnKpyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vg9UXyuHmGDZQO/y0U5ImTZDVkvMGg73me5Kj7Wl/LYSwrXePandASrSXbRp64OxQcLk+Y08BN30mVY9tSP1X7WaqeSiSDsde9m9J5tDGF+MrQR5OApnskJIxEWH4rpV7/TnDpQ5M9ywu7J9MdNGqVyAFYoMmoQT4nCYGpbwiYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rv+6EEU2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rv+6EEU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735490514; x=1767026514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wY4u2IZytAM//DiidxwPYVLyjDV7QjNWupZCkLnKpyU=;
  b=Rv+6EEU2ty6u/kKwD+6GoUysd3daK6zK1BKRJimkiMBJfi/XX0Ch4IZY
   w5TRK+Yf51jYHmxQY89/nYPLfGWuK8qifwGWODpG2jDCsfANUZnlTCzWP
   ULw3DTYceNGMjJD5s7ZAf4zTTUuU60+uDwIxHb0BFQLpnSEBp8nxgGgSY
   JBvofJy7R1saOAYHT/8F7nNGQYCdzSO9ais6otZJ4xUa4vp+EyE6yxZzY
   XRlr2mC58tTUJLYE0QglvP8C6VELSNrYqY7YWpGRIXqvVpwsHqzVzRofy
   gfcOeTIFplKeU9DZpg8yrp6BQtZA/23Ql9k1PcW7iRCevIN+T1d2jKp+q
   A==;
X-CSE-ConnectionGUID: 6x9+trdYQumze4Z9uRhPXA==
X-CSE-MsgGUID: 66THY6TnS0WL1Xzqy+G6yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35510903"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="35510903"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 08:41:54 -0800
X-CSE-ConnectionGUID: Vk22mZ08SQqV2cPlxpZUiQ==
X-CSE-MsgGUID: /oHpW3r3TJebvbTdKWSTiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100438703"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Dec 2024 08:41:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRwMQ-0004pg-1Z;
	Sun, 29 Dec 2024 16:41:50 +0000
Date: Mon, 30 Dec 2024 00:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: codecs: ES8326: Reduce pop noise
Message-ID: <202412300023.AZpA3xBC-lkp@intel.com>
References: <20241220104322.31867-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220104322.31867-1-zhangyi@everest-semi.com>

Hi Zhang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.13-rc4 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Yi/ASoC-codecs-ES8326-Reduce-pop-noise/20241229-205825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20241220104322.31867-1-zhangyi%40everest-semi.com
patch subject: [PATCH] ASoC: codecs: ES8326: Reduce pop noise
config: arm64-randconfig-002-20241229 (https://download.01.org/0day-ci/archive/20241230/202412300023.AZpA3xBC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412300023.AZpA3xBC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412300023.AZpA3xBC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/codecs/es8326.c: In function 'es8326_jack_button_handler':
>> sound/soc/codecs/es8326.c:786:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     786 |                 if (es8326->version > ES8326_VERSION_B) {
         |                    ^
   sound/soc/codecs/es8326.c:790:9: note: here
     790 |         case 0x4b:
         |         ^~~~


vim +786 sound/soc/codecs/es8326.c

   759	
   760	/*
   761	 *	For button detection, set the following in soundcard
   762	 *	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
   763	 *	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
   764	 *	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
   765	 */
   766	static void es8326_jack_button_handler(struct work_struct *work)
   767	{
   768		struct es8326_priv *es8326 =
   769			container_of(work, struct es8326_priv, button_press_work.work);
   770		struct snd_soc_component *comp = es8326->component;
   771		unsigned int iface;
   772		static int button_to_report, press_count;
   773		static int prev_button, cur_button;
   774	
   775		if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
   776			return;
   777	
   778		mutex_lock(&es8326->lock);
   779		iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
   780		switch (iface) {
   781		case 0x93:
   782			/* pause button detected */
   783			cur_button = SND_JACK_BTN_0;
   784			break;
   785		case 0x6f:
 > 786			if (es8326->version > ES8326_VERSION_B) {
   787				cur_button = SND_JACK_BTN_0;
   788				break;
   789			}
   790		case 0x4b:
   791			/* button volume up */
   792			cur_button = SND_JACK_BTN_1;
   793			break;
   794		case 0x27:
   795			/* button volume down */
   796			cur_button = SND_JACK_BTN_2;
   797			break;
   798		case 0x1e:
   799		case 0xe2:
   800			/* button released or not pressed */
   801			cur_button = 0;
   802			break;
   803		default:
   804			break;
   805		}
   806	
   807		if ((prev_button == cur_button) && (cur_button != 0)) {
   808			press_count++;
   809			if (press_count > 3) {
   810				/* report a press every 120ms */
   811				snd_soc_jack_report(es8326->jack, cur_button,
   812						SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
   813				press_count = 0;
   814			}
   815			button_to_report = cur_button;
   816			queue_delayed_work(system_wq, &es8326->button_press_work,
   817					   msecs_to_jiffies(35));
   818		} else if (prev_button != cur_button) {
   819			/* mismatch, detect again */
   820			prev_button = cur_button;
   821			queue_delayed_work(system_wq, &es8326->button_press_work,
   822					   msecs_to_jiffies(35));
   823		} else {
   824			/* released or no pressed */
   825			if (button_to_report != 0) {
   826				snd_soc_jack_report(es8326->jack, button_to_report,
   827					    SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
   828				snd_soc_jack_report(es8326->jack, 0,
   829					    SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
   830				button_to_report = 0;
   831			}
   832			es8326_disable_micbias(es8326->component);
   833		}
   834		mutex_unlock(&es8326->lock);
   835	}
   836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
