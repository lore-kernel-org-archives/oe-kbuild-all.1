Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EC728E2C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695737173; x=1727273173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TcK5us40vmqANLf7gKsmf2Y6kgwhwxQNl0QI2Yrl3Fs=;
  b=b8IGytXYP3sZqK/anSASeZhV387k2cbfp98X5DakTzf0hDLtkrombtpG
   Ms1lFt+LU011lShKH4IJuo1ftqaALIGMM4XDiX0dPc4O3vSJ4CE/2J5yE
   QuqjE9NekXw0ndLFVbXLdI8t719LlbVhtSk5kTKTIBGA4PpfQGfro15EZ
   S7bmnBqOv0DoYCK1rTU7u6jfKoMc18VOrkd513gzIpMG2BxkEZixQQ9VU
   8B8jT1rVNtIR/OVmGMMX9iIEHk1oQVTVM8ayaxoTvxsBkf42N80N8QbgG
   cKZ7N+HgWRGws2ei4YW1jLhaAqOs1JpQL5S6O3IM+YdGvLNuBgHnkdtaU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="381471089"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="381471089"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 07:06:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742375489"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="742375489"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 26 Sep 2023 07:06:11 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql8hU-0002sf-23;
	Tue, 26 Sep 2023 14:06:08 +0000
Date: Tue, 26 Sep 2023 22:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14475/30000]
 sound/usb/card.c:134: warning: Function parameter or member 'disconnect_cb'
 not described in 'find_snd_usb_substream'
Message-ID: <202309262152.h8PXX99E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   8daba3e055d00086f153f5562449f11065001703
commit: 6da0c634f8bda1a50698a245374b8f86fdda6640 [14475/30000] ANDROID: GKI: sound: usb: Add snd_usb_enable_audio_stream/find_snd_usb_substream
config: i386-randconfig-013-20230926 (https://download.01.org/0day-ci/archive/20230926/202309262152.h8PXX99E-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309262152.h8PXX99E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309262152.h8PXX99E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/usb/card.c:134: warning: Function parameter or member 'disconnect_cb' not described in 'find_snd_usb_substream'


vim +134 sound/usb/card.c

   121	
   122	/**
   123	 * find_snd_usb_substream - helper API to find usb substream context
   124	 * information using card number, pcm device number and direction.
   125	 * @card_num: card number
   126	 * @pcm_idx: pcm device number
   127	 * @direction: SNDRV_PCM_STREAM_PLAYBACK or SNDRV_PCM_STREAM_CAPTURE
   128	 * @uchip: substream context.
   129	 * disconnect_cb: callback to use for cleanup on disconnect.
   130	 */
   131	struct snd_usb_substream *find_snd_usb_substream(unsigned int card_num,
   132		unsigned int pcm_idx, unsigned int direction, struct snd_usb_audio
   133		**uchip, void (*disconnect_cb)(struct snd_usb_audio *chip))
 > 134	{
   135		int idx;
   136		struct snd_usb_stream *as;
   137		struct snd_usb_substream *subs = NULL;
   138		struct snd_usb_audio *chip = NULL;
   139	
   140		mutex_lock(&register_mutex);
   141		/*
   142		 * legacy audio snd card number assignment is dynamic. Hence
   143		 * search using chip->card->number
   144		 */
   145		for (idx = 0; idx < SNDRV_CARDS; idx++) {
   146			if (!usb_chip[idx] || !usb_chip[idx]->card)
   147				continue;
   148			if (usb_chip[idx]->card->number == card_num) {
   149				chip = usb_chip[idx];
   150				break;
   151			}
   152		}
   153	
   154		if (!chip || atomic_read(&chip->shutdown)) {
   155			pr_debug("%s: instance of usb card # %d does not exist\n",
   156				__func__, card_num);
   157			goto err;
   158		}
   159	
   160		if (pcm_idx >= chip->pcm_devs) {
   161			usb_audio_err(chip, "%s: invalid pcm dev number %u > %d\n",
   162				      __func__, pcm_idx, chip->pcm_devs);
   163			goto err;
   164		}
   165	
   166		if (direction > SNDRV_PCM_STREAM_CAPTURE) {
   167			usb_audio_err(chip, "%s: invalid direction %u\n", __func__,
   168				      direction);
   169			goto err;
   170		}
   171	
   172		list_for_each_entry(as, &chip->pcm_list, list) {
   173			if (as->pcm_index == pcm_idx) {
   174				subs = &as->substream[direction];
   175				if (subs->interface < 0 && !subs->data_endpoint &&
   176				    !subs->sync_endpoint) {
   177					usb_audio_err(chip, "%s: stream disconnected, bail out\n",
   178						      __func__);
   179					subs = NULL;
   180					goto err;
   181				}
   182				goto done;
   183			}
   184		}
   185	
   186	done:
   187		chip->card_num = card_num;
   188		chip->disconnect_cb = disconnect_cb;
   189	err:
   190		*uchip = chip;
   191		if (!subs)
   192			pr_err("%s: substream instance not found\n", __func__);
   193		mutex_unlock(&register_mutex);
   194		return subs;
   195	}
   196	EXPORT_SYMBOL_GPL(find_snd_usb_substream);
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
