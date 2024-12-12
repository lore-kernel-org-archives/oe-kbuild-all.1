Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A99745027
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733998713; cv=none; b=jK2rEyYMUV/ro6aRLsl/6O8pFVfEHwTZVFn6tFQA40wkgp66J+7c1ICfHp8xhKfwtEwOafUN0rOiljOusKKM2o/09ExX6cee6XpT4LgkbhLSwXvD7VNaZckt+uLO0eGB6Ya7utNMR2mbyNKlY5lJMNDCSC/SuKiJgYzrcGFOESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733998713; c=relaxed/simple;
	bh=qiO/GCo3ZILZ3muL+w1nkIsZS9lyGttQ5LqEbBNdvyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avGiWbquqnJyAOfWfF8dqrV4S4qC2Wif/uvAUuf+YiOES8eKlJJX7Wj+vKrWvym7x2dm/U/yEhZdUsaTG9uETFFHI5z4TOitMsIykgwwqdPM301mbw8RozfOiPlup2qkfiIV0MIbCeiBnQbYWlhfXRflf3sLB3LTdyCN6oL1TMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xc8Vhy18; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xc8Vhy18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733998712; x=1765534712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qiO/GCo3ZILZ3muL+w1nkIsZS9lyGttQ5LqEbBNdvyU=;
  b=Xc8Vhy188l5rEitkeoB0gwlgrRtQGW0/5y23emUrIVCSdwykteU3WiOo
   AnVA0JtOtuPQG3RWl1Ifty7M/3FynEr0S37dkJnqgXpWbLrolQTDRyIxL
   GxeesVUuRkcE/y/o8+VqKTu8rTThIZhQmx1Kch22oKyni9FAGMUF+ysZe
   sjqk8T2MpwP1l9trjr6ZDLst9FCaS8R/5weUpiFe23llMXIWiajylYq08
   5ZK+02Em4McCLJ0F5J/aruRFP7dIGQTAf6MtSg5p6+l0dd0mNQZfxekoy
   ftG34KtYMYpTTlyfOyE7zv+lsSIq2Cw+39av+1/IVUy//lag+RET/EMuW
   Q==;
X-CSE-ConnectionGUID: tvkMl3JQSFafAIIHmy5oIQ==
X-CSE-MsgGUID: WoXXT1bBStCZPBUY4VuJKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34135088"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34135088"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 02:18:31 -0800
X-CSE-ConnectionGUID: ngwhA16oQCSqfX3ebZdyJQ==
X-CSE-MsgGUID: XAMTfpzETOGX6IWbnxtOjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96984931"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2024 02:18:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLgH5-0007iW-1z;
	Thu, 12 Dec 2024 10:18:27 +0000
Date: Thu, 12 Dec 2024 18:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 11115/30000]
 sound/usb/card.c:134: warning: Function parameter or member 'disconnect_cb'
 not described in 'find_snd_usb_substream'
Message-ID: <202412121813.2tj3r4Pa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hridya,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: 6da0c634f8bda1a50698a245374b8f86fdda6640 [11115/30000] ANDROID: GKI: sound: usb: Add snd_usb_enable_audio_stream/find_snd_usb_substream
config: x86_64-buildonly-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121813.2tj3r4Pa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121813.2tj3r4Pa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121813.2tj3r4Pa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/usb/card.c:134: warning: Function parameter or member 'disconnect_cb' not described in 'find_snd_usb_substream'
   sound/usb/card.o: warning: objtool: missing symbol for section .init.text


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
