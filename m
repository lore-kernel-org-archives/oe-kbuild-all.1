Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F15846D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 07:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976118; cv=none; b=A/PaVh54+RFQY6TWQWgDp+dT99UXOWS0DBpo+oYJm+hn5UIyLbYcf/ePU74XahO2CBnqWMs6FAENe2n8uPND6LFGLD3kmcDjK1nL1YGGYRvheYnjJIRJD7zHMBBSHdrybfbLLVyzVASEWk5Pz84fmQq0wKJT7JTeBwIkcbdkz0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976118; c=relaxed/simple;
	bh=baKFsppe7fNIYX4dizqsBc2IO5NjHP6udTB/iU4Dk8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lHwP0MAOx4xyQhyWffUO4j8IP1LImhlrik8huv8HC8AAfp1OoMWyYeJY/rqcTuoY2PpDX+SGwqqs2hWvlpInv7bFDT2gBDHrAiV07cE0yjDEP7a3QoLF0LvZJOp1ihem5aykXEdTvlKz/q5Z+6HTF697VSL/naYhe+K/zWaTorQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+6+bgrV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+6+bgrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735976115; x=1767512115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=baKFsppe7fNIYX4dizqsBc2IO5NjHP6udTB/iU4Dk8c=;
  b=a+6+bgrV2BOct7OL7p02xhcUGcvWUorBZSJAthWIPLyrP3Cgv0vMyihJ
   HjKV77ICHA7M+gB5be1Z0Am3bM2AEPy+/AixGBTo7Q+wcPDxPnOJFMBMO
   oA7xCk0/jy1mkH7byjfXGhq3873DuB9JWOcEFDHC2m8ou6uF2P9jArRTP
   ipdC8r4nGVhdwNYC8UN+k7IpJvDc4GRvv8p3WiboEsaFgFX8On3VPHsWa
   ZGlsbIhzOSUZvAg16Sb7tgvqTwT4uqF/S8aEygSzcF2/SeMAXEwfwo/RY
   gtwWEfMK42tAUWanb8DXOOFzhwzKzTrsWMDpxsc5QSP1isrebz7hwsNdA
   A==;
X-CSE-ConnectionGUID: OPlEqtxTSnGSIPxVdrxtLA==
X-CSE-MsgGUID: nA+RIO0+Tb6yCrj6UQcjBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46879610"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="46879610"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 23:35:14 -0800
X-CSE-ConnectionGUID: +LSQg+bzSI6f2Or67sqxEA==
X-CSE-MsgGUID: GTO4XfJ8S+CcT2XrPisCIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="132811879"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jan 2025 23:35:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTygg-000AkF-2k;
	Sat, 04 Jan 2025 07:35:10 +0000
Date: Sat, 4 Jan 2025 15:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Gromm <christian.gromm@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/most/most_snd.c:56: warning: Excess struct member 'opened'
 description in 'channel'
Message-ID: <202501041510.2r8dyfcO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 13b41b5783068d01c259940975a2ab393b5acec5 drivers: most: add ALSA sound driver
date:   3 years, 9 months ago
config: alpha-randconfig-r026-20211101 (https://download.01.org/0day-ci/archive/20250104/202501041510.2r8dyfcO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041510.2r8dyfcO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041510.2r8dyfcO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/most/most_snd.c:56: warning: Function parameter or struct member 'pcm_hardware' not described in 'channel'
   drivers/most/most_snd.c:56: warning: Function parameter or struct member 'copy_fn' not described in 'channel'
>> drivers/most/most_snd.c:56: warning: Excess struct member 'opened' description in 'channel'
   drivers/most/most_snd.c:404: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initialization of struct snd_pcm_ops
   drivers/most/most_snd.c:514: warning: Function parameter or struct member 'device_name' not described in 'audio_probe_channel'
   drivers/most/most_snd.c:703: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Initialization of the struct most_component


vim +56 drivers/most/most_snd.c

54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  26  
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  27  /**
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  28   * struct channel - private structure to keep channel specific data
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  29   * @substream: stores the substream structure
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  30   * @iface: interface for which the channel belongs to
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  31   * @cfg: channel configuration
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  32   * @card: registered sound card
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  33   * @list: list for private use
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  34   * @id: channel index
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  35   * @period_pos: current period position (ring buffer)
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  36   * @buffer_pos: current buffer position (ring buffer)
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  37   * @is_stream_running: identifies whether a stream is running or not
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  38   * @opened: set when the stream is opened
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  39   * @playback_task: playback thread
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  40   * @playback_waitq: waitq used by playback thread
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  41   */
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  42  struct channel {
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  43  	struct snd_pcm_substream *substream;
d801887248312f drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-09-28  44  	struct snd_pcm_hardware pcm_hardware;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  45  	struct most_interface *iface;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  46  	struct most_channel_config *cfg;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  47  	struct snd_card *card;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  48  	struct list_head list;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  49  	int id;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  50  	unsigned int period_pos;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  51  	unsigned int buffer_pos;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  52  	bool is_stream_running;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  53  	struct task_struct *playback_task;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  54  	wait_queue_head_t playback_waitq;
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  55  	void (*copy_fn)(void *alsa, void *most, unsigned int bytes);
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24 @56  };
54b4856fb36246 drivers/staging/most/aim-sound/sound.c Christian Gromm 2015-07-24  57  

:::::: The code at line 56 was first introduced by commit
:::::: 54b4856fb3624609dd5d9ed013bfec7d67083622 Staging: most: add MOST driver's aim-sound module

:::::: TO: Christian Gromm <christian.gromm@microchip.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
