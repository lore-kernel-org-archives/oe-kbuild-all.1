Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64EF6108
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jan 2024 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYHIayqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704118911; x=1735654911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=41AUz8E6lWakZzvcwoksU7/tiizKzPJ3V6kqdpuuKUM=;
  b=SYHIayqeloh9vnE2tpKxJRSTMOnPsl1Jjwt1hOgFWV2F9kNFXtVFQwz2
   djnvy8Mpor/xb1kZJ+04lEYhUTKu79z5aChxP/WesStMwEBRuPbkFYYTG
   /AhiTqka0IhNQ21qJVQIbe9FwPiUsHPlgz8YCiS54D8bSC/gyiJTHKjSd
   IG+E5N+F7PiOnQRHrprpruBkpv+3DioBSEG9MXQO1Gie3tDG++/HsSQMf
   zbBCHmcV/90R8Qpwu4WiUTz7duu3kFDvBFrnv1hyUGrADU5/9b3DHhQvc
   MnH05cnalDLA6wFGukgPQ/ooiyyyy27UPHJBcbGqcZp/WCNDXNpvpbMLv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="461106144"
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; 
   d="scan'208";a="461106144"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2024 06:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="952679710"
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; 
   d="scan'208";a="952679710"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 01 Jan 2024 06:21:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKJAp-000KJI-11;
	Mon, 01 Jan 2024 14:21:47 +0000
Date: Mon, 1 Jan 2024 22:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:topic/scarlett2 82/97]
 sound/usb/mixer_scarlett2.c:2853:30: sparse: sparse: dubious: !x | y
Message-ID: <202401012256.rka1TRGf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/scarlett2
head:   4a2c8cc1644738191d9d6c0bca24516cfe390d41
commit: 1b53c116232e082db06ab5310c1be1d4bf75dfe1 [82/97] ALSA: scarlett2: Allow for controls with a "mute mode"
config: x86_64-randconfig-122-20240101 (https://download.01.org/0day-ci/archive/20240101/202401012256.rka1TRGf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240101/202401012256.rka1TRGf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401012256.rka1TRGf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/usb/mixer_scarlett2.c:2853:30: sparse: sparse: dubious: !x | y
   sound/usb/mixer_scarlett2.c:3138:30: sparse: sparse: dubious: !x | y

vim +2853 sound/usb/mixer_scarlett2.c

  2824	
  2825	static int scarlett2_level_enum_ctl_put(struct snd_kcontrol *kctl,
  2826						struct snd_ctl_elem_value *ucontrol)
  2827	{
  2828		struct usb_mixer_elem_info *elem = kctl->private_data;
  2829		struct usb_mixer_interface *mixer = elem->head.mixer;
  2830		struct scarlett2_data *private = mixer->private_data;
  2831		const struct scarlett2_device_info *info = private->info;
  2832	
  2833		int index = elem->control + info->level_input_first;
  2834		int oval, val, err = 0;
  2835	
  2836		mutex_lock(&private->data_mutex);
  2837	
  2838		if (private->hwdep_in_use) {
  2839			err = -EBUSY;
  2840			goto unlock;
  2841		}
  2842	
  2843		oval = private->level_switch[index];
  2844		val = !!ucontrol->value.enumerated.item[0];
  2845	
  2846		if (oval == val)
  2847			goto unlock;
  2848	
  2849		private->level_switch[index] = val;
  2850	
  2851		/* To set the Gen 4 muteable controls, bit 1 gets set instead */
  2852		if (private->config_set->items[SCARLETT2_CONFIG_LEVEL_SWITCH].mute)
> 2853			val = (!val) | 0x02;
  2854	
  2855		/* Send switch change to the device */
  2856		err = scarlett2_usb_set_config(mixer, SCARLETT2_CONFIG_LEVEL_SWITCH,
  2857					       index, val);
  2858		if (err == 0)
  2859			err = 1;
  2860	
  2861	unlock:
  2862		mutex_unlock(&private->data_mutex);
  2863		return err;
  2864	}
  2865	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
