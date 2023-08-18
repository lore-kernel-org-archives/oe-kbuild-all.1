Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADA4375
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 00:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692319984; x=1723855984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7svyFjIEem690j/RBzaZB0SBww983vX8louC5F2ePYc=;
  b=NYYYeAeKXvnsix9731JMVH8w62Pgdk7Mt3Ij1HOCgP/3ZX9hgoR/7Iv5
   6vYIAxbz+UrhsbDzFih1f3B7vEZX9iuHF7q/QeXO6WNQhvA+/JVPuJit8
   rhkhFZ1p4+OtkqfEw9Bl0+z7pLxgbwxQs7N0dDstw+w6Q8T/XLddZNqfp
   BBEQxjMyOoRBe9zDAGnkFOwxtsOmDJjsfKRYvhZHwnxhFCWDs1YD+o5pV
   H2N9g35lBTOB3t3nS5lRJiw15SAQy0xB/FSYVipQUPDpft0zv2Em7w/mX
   wVF2oiRPQlM2oL/+PYPwTLTiC7Yo1Qt+SbcxiBZFUEnkwsuGdsscXKAVg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363134503"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="363134503"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 17:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="800269546"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="800269546"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 17:53:02 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWnjZ-0001Zj-1u;
	Fri, 18 Aug 2023 00:53:01 +0000
Date: Fri, 18 Aug 2023 08:52:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14448/30000]
 sound/core/pcm_lib.c:2601: warning: Function parameter or member 'usr' not
 described in 'snd_pcm_add_usr_ctls'
Message-ID: <202308180801.Vp1sB3cG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a89c7b9715e2d482a08b58b698f0cf37da373070
commit: 613434fe6ffb5996982901dcd6a89605548ae7e8 [14448/30000] ANDROID: GKI: ALSA: PCM: User control API implementation
config: x86_64-randconfig-x054-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180801.Vp1sB3cG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180801.Vp1sB3cG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180801.Vp1sB3cG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/pcm_lib.c:2512: warning: Function parameter or member 'volume' not described in 'snd_pcm_add_volume_ctls'
>> sound/core/pcm_lib.c:2601: warning: Function parameter or member 'usr' not described in 'snd_pcm_add_usr_ctls'
>> sound/core/pcm_lib.c:2601: warning: Function parameter or member 'max_kctrl_str_len' not described in 'snd_pcm_add_usr_ctls'


vim +2601 sound/core/pcm_lib.c

  2495	
  2496	/**
  2497	 * snd_pcm_add_volume_ctls - create volume control elements
  2498	 * @pcm: the assigned PCM instance
  2499	 * @stream: stream direction
  2500	 * @max_length: the max length of the volume parameter of stream
  2501	 * @private_value: the value passed to each kcontrol's private_value field
  2502	 * @info_ret: store struct snd_pcm_volume instance if non-NULL
  2503	 *
  2504	 * Create volume control elements assigned to the given PCM stream(s).
  2505	 * Returns zero if succeed, or a negative error value.
  2506	 */
  2507	int snd_pcm_add_volume_ctls(struct snd_pcm *pcm, int stream,
  2508				   const struct snd_pcm_volume_elem *volume,
  2509				   int max_length,
  2510				   unsigned long private_value,
  2511				   struct snd_pcm_volume **info_ret)
> 2512	{
  2513		struct snd_pcm_volume *info;
  2514		struct snd_kcontrol_new knew = {
  2515			.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
  2516			.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |
  2517				SNDRV_CTL_ELEM_ACCESS_READWRITE,
  2518			.info = pcm_volume_ctl_info,
  2519		};
  2520		int err;
  2521		int size;
  2522	
  2523		info = kzalloc(sizeof(*info), GFP_KERNEL);
  2524		if (!info)
  2525			return -ENOMEM;
  2526		info->pcm = pcm;
  2527		info->stream = stream;
  2528		info->volume = volume;
  2529		info->max_length = max_length;
  2530		size = sizeof("Playback ") + sizeof(" Volume") +
  2531			STRING_LENGTH_OF_INT*sizeof(char) + 1;
  2532		knew.name = kzalloc(size, GFP_KERNEL);
  2533		if (!knew.name) {
  2534			kfree(info);
  2535			return -ENOMEM;
  2536		}
  2537		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
  2538			snprintf((char *)knew.name, size, "%s %d %s",
  2539				"Playback", pcm->device, "Volume");
  2540		else
  2541			snprintf((char *)knew.name, size, "%s %d %s",
  2542				"Capture", pcm->device, "Volume");
  2543		knew.device = pcm->device;
  2544		knew.count = pcm->streams[stream].substream_count;
  2545		knew.private_value = private_value;
  2546		info->kctl = snd_ctl_new1(&knew, info);
  2547		if (!info->kctl) {
  2548			kfree(info);
  2549			kfree(knew.name);
  2550			return -ENOMEM;
  2551		}
  2552		info->kctl->private_free = pcm_volume_ctl_private_free;
  2553		err = snd_ctl_add(pcm->card, info->kctl);
  2554		if (err < 0) {
  2555			kfree(info);
  2556			kfree(knew.name);
  2557			return -ENOMEM;
  2558		}
  2559		pcm->streams[stream].vol_kctl = info->kctl;
  2560		if (info_ret)
  2561			*info_ret = info;
  2562		kfree(knew.name);
  2563		return 0;
  2564	}
  2565	EXPORT_SYMBOL(snd_pcm_add_volume_ctls);
  2566	
  2567	static int pcm_usr_ctl_info(struct snd_kcontrol *kcontrol,
  2568				    struct snd_ctl_elem_info *uinfo)
  2569	{
  2570		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
  2571		uinfo->count = MAX_USR_CTRL_CNT;
  2572		uinfo->value.integer.min = 0;
  2573		uinfo->value.integer.max = INT_MAX;
  2574		return 0;
  2575	}
  2576	
  2577	static void pcm_usr_ctl_private_free(struct snd_kcontrol *kcontrol)
  2578	{
  2579		struct snd_pcm_usr *info = snd_kcontrol_chip(kcontrol);
  2580	
  2581		info->pcm->streams[info->stream].usr_kctl = NULL;
  2582		kfree(info);
  2583	}
  2584	
  2585	/**
  2586	 * snd_pcm_add_usr_ctls - create user control elements
  2587	 * @pcm: the assigned PCM instance
  2588	 * @stream: stream direction
  2589	 * @max_length: the max length of the user parameter of stream
  2590	 * @private_value: the value passed to each kcontrol's private_value field
  2591	 * @info_ret: store struct snd_pcm_usr instance if non-NULL
  2592	 *
  2593	 * Create usr control elements assigned to the given PCM stream(s).
  2594	 * Returns zero if succeed, or a negative error value.
  2595	 */
  2596	int snd_pcm_add_usr_ctls(struct snd_pcm *pcm, int stream,
  2597				 const struct snd_pcm_usr_elem *usr,
  2598				 int max_length, int max_kctrl_str_len,
  2599				 unsigned long private_value,
  2600				 struct snd_pcm_usr **info_ret)
> 2601	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
