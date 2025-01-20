Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FCB1DF992
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737374984; cv=none; b=o9GW5w6kC77P3d2RCVxvn5qoACedriyNnyalgxKWeBTGdd5Qq59OJpzx68GZbpJXVK3dc16fbpMIO4Iy0Xn1j0m4Wc0l3kSsvr6aR5mXzSJCIvZvCrN5QCM2dv58OCYKcOb88Fe+/2DFF76FLwgQP8WpyCEcAwjd7Mze7Mytu4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737374984; c=relaxed/simple;
	bh=YdSajOPYcPlq/YPaWf5AcufzF6rrpTyEG+hpbrugNo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gw839mbtHjaQe6k9t4X4ObqEDOllasnlekKzhOSa3N3opgiUJcivtnJA0Zx2g5hJLmEQx3F61T4OGKqim9xAWAsZNbfOvkseWO//o5k6JYoY5HKIg+sCs7fR34ClbAlIqsSpqmEL2CHYJi9sULtZuots1Os6eynzY9hqhB8WX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejVEEsm0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejVEEsm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737374983; x=1768910983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YdSajOPYcPlq/YPaWf5AcufzF6rrpTyEG+hpbrugNo0=;
  b=ejVEEsm0z57niBDtHyvwhN3nsB3xBF1j2e3aDi673DTZ3Bvkq36tnGvk
   HOlMSehUIqwM04NCVayW0GInAIXZl/pIFCdM+riTm6zPYt9giNsA62Ecn
   UHkeSfU01OrovNSeSy7sV1KfEH1vv3dBZ/46SK09D2YwTOMozVAUDakPC
   PZow8bGqzCpYxrxvWgOrGSwKd23m7j4Wykh3sxBfiCNejO/3m+nFnUXG4
   3xyhbeaAM5Bwnlu0tf+qkmFR9boyuhy8Dbf6+auRVUg8q5Gz9VkN9Lqyo
   tDYTllAieeqNWn+S9O25bbHIAPCjUYn1NYiCjBCLClXsdLx99jbHeP7MJ
   A==;
X-CSE-ConnectionGUID: p2SSVT5sQgyKgwehTKUunA==
X-CSE-MsgGUID: 4JRUoz2cRGeNT73zW30Hvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37915237"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37915237"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 04:09:42 -0800
X-CSE-ConnectionGUID: Xk3z/7/8S6+bojInw5wShA==
X-CSE-MsgGUID: Es0i+N7xQyCHZSGpTavJ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137391783"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jan 2025 04:09:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZqb4-000WWO-0g;
	Mon, 20 Jan 2025 12:09:38 +0000
Date: Mon, 20 Jan 2025 20:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: drivers/most/most_snd.c:58: warning: Excess struct member 'opened'
 description in 'channel'
Message-ID: <202501201910.qK26lfmz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: 512d092d78823f9813f4af38090b33c454137a4c ALSA: Enable build with UML
date:   1 year, 6 months ago
config: um-randconfig-001-20240624 (https://download.01.org/0day-ci/archive/20250120/202501201910.qK26lfmz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201910.qK26lfmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201910.qK26lfmz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/most/most_snd.c:58: warning: Excess struct member 'opened' description in 'channel'


vim +58 drivers/most/most_snd.c

54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  26  
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  27  /**
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  28   * struct channel - private structure to keep channel specific data
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  29   * @substream: stores the substream structure
fba3993e86cc44 drivers/most/most_snd.c                Randy Dunlap    2023-01-12  30   * @pcm_hardware: low-level hardware description
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  31   * @iface: interface for which the channel belongs to
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  32   * @cfg: channel configuration
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  33   * @card: registered sound card
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  34   * @list: list for private use
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  35   * @id: channel index
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  36   * @period_pos: current period position (ring buffer)
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  37   * @buffer_pos: current buffer position (ring buffer)
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  38   * @is_stream_running: identifies whether a stream is running or not
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  39   * @opened: set when the stream is opened
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  40   * @playback_task: playback thread
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  41   * @playback_waitq: waitq used by playback thread
fba3993e86cc44 drivers/most/most_snd.c                Randy Dunlap    2023-01-12  42   * @copy_fn: copy function for PCM-specific format and width
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  43   */
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  44  struct channel {
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  45  	struct snd_pcm_substream *substream;
d801887248312f drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-09-28  46  	struct snd_pcm_hardware pcm_hardware;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  47  	struct most_interface *iface;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  48  	struct most_channel_config *cfg;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  49  	struct snd_card *card;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  50  	struct list_head list;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  51  	int id;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  52  	unsigned int period_pos;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  53  	unsigned int buffer_pos;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  54  	bool is_stream_running;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  55  	struct task_struct *playback_task;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  56  	wait_queue_head_t playback_waitq;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  57  	void (*copy_fn)(void *alsa, void *most, unsigned int bytes);
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24 @58  };
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  59  

:::::: The code at line 58 was first introduced by commit
:::::: 54b4856fb3624609dd5d9ed013bfec7d67083622 Staging: most: add MOST driver's aim-sound module

:::::: TO: Christian Gromm <christian.gromm@microchip.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
