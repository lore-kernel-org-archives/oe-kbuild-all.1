Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F19634
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 05:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727934982; cv=none; b=itnRQ21OCJVLurAdFZrEhR+WIn7kAeptM0sxNM4GA5HikAwv/szSmC46Qo1E4CQj5n6Zn8FjsZ43Q+lhgAZXoxTlYVnecSySDlfJL4x2A6bPG0O8LfrxoezwUWUnAQDY5y5Asxk2X3XtlNWcn4c0MN5VkVpR/D2h6apF62UVTf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727934982; c=relaxed/simple;
	bh=Q/oCtjMlw+EtBfgmACPmryQtOmqctTwoJmYwZvRhv/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0PZoZcPQ9n4+PHbcOllq+KzG2/GmJRQv+//XoAc04V5ylepcHZ9101ouCVuPyYpHY1uwO9IOo0XRTuXwpC9AazeBNj+AXUJKT2Z5mGUdNnAl76Mf1O4z0fJinZrtahEx5Bhu9DpjPRj+vbHBh/2zFabjVCiEydMEg0JDS349eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naq4dshW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naq4dshW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727934979; x=1759470979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q/oCtjMlw+EtBfgmACPmryQtOmqctTwoJmYwZvRhv/0=;
  b=naq4dshW/eRip+b90hXgrYDqR8+OpQ6j8c1zDdSRthSZvXeyvdrn53bT
   xenNjqPP78aZ9zWQUovIOCqtP5YZ76m62I/9MvwT1SGZf0xFk0w8tbrCF
   GuQKUyfvYU2yxVi+gmklsBzdux+DI3DrJtyNu5AtL2NF5RfTJH9uCtxUa
   Fqi20/RNWbRq8tWrjcZaLRJU6jXG1qWzhtMcBdhlmIC7Z0t9ntSbwlmtl
   fo3kECdn/eLS7figHZE5H0uPLZZAj4cb2QmLrR4ShIoA3uCHf4I8F3AEI
   xVH/izk8i8fIquFNfxI/rIcE5ubz8Xj3X5gH1EOnN6Gd/Qn/tyButROQO
   g==;
X-CSE-ConnectionGUID: 3quZjaayRjijgtwGj+2A1w==
X-CSE-MsgGUID: 78lKNVcLRBeTMlJtw2ADkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="44586809"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="44586809"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 22:56:19 -0700
X-CSE-ConnectionGUID: CMLjw9SuQjuBtRRUzVZ+dA==
X-CSE-MsgGUID: qAu/nJKUQWKcj/zuw1N+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="75052176"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Oct 2024 22:56:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swEox-00006I-0x;
	Thu, 03 Oct 2024 05:56:15 +0000
Date: Thu, 3 Oct 2024 13:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 1904/2170] sound/hda/hdac_stream.c:668: warning:
 Function parameter or struct member 'start' not described in
 'snd_hdac_stream_timecounter_init'
Message-ID: <202410031300.ecLmATNd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c02d24a5af66a9806922391493205a344749f2c4
commit: df5215618fbe425875336d3a2d31bd599ae8c401 [1904/2170] ALSA: hda: fix trigger_tstamp_latched
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20241003/202410031300.ecLmATNd-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031300.ecLmATNd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031300.ecLmATNd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/hda/hdac_stream.c:668: warning: Function parameter or struct member 'start' not described in 'snd_hdac_stream_timecounter_init'


vim +668 sound/hda/hdac_stream.c

14752412721c61 Takashi Iwai    2015-04-14  655  
14752412721c61 Takashi Iwai    2015-04-14  656  /**
14752412721c61 Takashi Iwai    2015-04-14  657   * snd_hdac_stream_timecounter_init - initialize time counter
14752412721c61 Takashi Iwai    2015-04-14  658   * @azx_dev: HD-audio core stream (master stream)
14752412721c61 Takashi Iwai    2015-04-14  659   * @streams: bit flags of streams to set up
14752412721c61 Takashi Iwai    2015-04-14  660   *
14752412721c61 Takashi Iwai    2015-04-14  661   * Initializes the time counter of streams marked by the bit flags (each
14752412721c61 Takashi Iwai    2015-04-14  662   * bit corresponds to the stream index).
14752412721c61 Takashi Iwai    2015-04-14  663   * The trigger timestamp of PCM substream assigned to the given stream is
14752412721c61 Takashi Iwai    2015-04-14  664   * updated accordingly, too.
14752412721c61 Takashi Iwai    2015-04-14  665   */
14752412721c61 Takashi Iwai    2015-04-14  666  void snd_hdac_stream_timecounter_init(struct hdac_stream *azx_dev,
df5215618fbe42 Jaroslav Kysela 2024-10-02  667  				      unsigned int streams, bool start)
14752412721c61 Takashi Iwai    2015-04-14 @668  {
14752412721c61 Takashi Iwai    2015-04-14  669  	struct hdac_bus *bus = azx_dev->bus;
14752412721c61 Takashi Iwai    2015-04-14  670  	struct snd_pcm_runtime *runtime = azx_dev->substream->runtime;
14752412721c61 Takashi Iwai    2015-04-14  671  	struct hdac_stream *s;
14752412721c61 Takashi Iwai    2015-04-14  672  	bool inited = false;
a5a1d1c2914b53 Thomas Gleixner 2016-12-21  673  	u64 cycle_last = 0;
14752412721c61 Takashi Iwai    2015-04-14  674  
df5215618fbe42 Jaroslav Kysela 2024-10-02  675  	if (!start)
df5215618fbe42 Jaroslav Kysela 2024-10-02  676  		goto skip;
df5215618fbe42 Jaroslav Kysela 2024-10-02  677  
14752412721c61 Takashi Iwai    2015-04-14  678  	list_for_each_entry(s, &bus->stream_list, list) {
26257869672fd4 Takashi Iwai    2023-11-21  679  		if ((streams & (1 << s->index))) {
14752412721c61 Takashi Iwai    2015-04-14  680  			azx_timecounter_init(s, inited, cycle_last);
14752412721c61 Takashi Iwai    2015-04-14  681  			if (!inited) {
14752412721c61 Takashi Iwai    2015-04-14  682  				inited = true;
14752412721c61 Takashi Iwai    2015-04-14  683  				cycle_last = s->tc.cycle_last;
14752412721c61 Takashi Iwai    2015-04-14  684  			}
14752412721c61 Takashi Iwai    2015-04-14  685  		}
14752412721c61 Takashi Iwai    2015-04-14  686  	}
14752412721c61 Takashi Iwai    2015-04-14  687  
df5215618fbe42 Jaroslav Kysela 2024-10-02  688  skip:
14752412721c61 Takashi Iwai    2015-04-14  689  	snd_pcm_gettime(runtime, &runtime->trigger_tstamp);
14752412721c61 Takashi Iwai    2015-04-14  690  	runtime->trigger_tstamp_latched = true;
14752412721c61 Takashi Iwai    2015-04-14  691  }
14752412721c61 Takashi Iwai    2015-04-14  692  EXPORT_SYMBOL_GPL(snd_hdac_stream_timecounter_init);
14752412721c61 Takashi Iwai    2015-04-14  693  

:::::: The code at line 668 was first introduced by commit
:::::: 14752412721c61d9ac1e8d8fb51d7148cb15f85b ALSA: hda - Add the controller helper codes to hda-core module

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
