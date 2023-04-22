Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1928747C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682189573; x=1713725573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yblBYpAyBWT2Fl/Quo0ypMH6DzJG4HDwQCixGJtBSfw=;
  b=LMAytG8dH6X67lWo2eN/WqrLk9qCC2hIOgsIUc3JexzKpnEkEJVeI+vK
   o5ys3FBJoyj2koIKJ2yVdlKlNf+BqVhzWIorIT/Ec1VwXb0YUW315H4S+
   odb5IYQdooMbZnMcFrTYrzAi4SKwBhwX6StfsQqwZOm3gobqeyARdnEyi
   Ykq7nuMNWQs8qWk6SD9iiOIWvUfv7FwaJr46w5UY/TUvvv2OQGaqBgzhu
   +hM3Qwpvg8nuxuKaf+QtXMoi/ONxD1l4vX1Ay+RUgNrP8c9Vj9E2ofrfy
   BDR7bLSzv9rLgcxsKnKRtoW9myx623xOfkeBq36/ARWZpuEYdCFqFWMzl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="432462609"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="432462609"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 11:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="816769029"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="816769029"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Apr 2023 11:52:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pqILq-000hRI-1S;
	Sat, 22 Apr 2023 18:52:50 +0000
Date: Sun, 23 Apr 2023 02:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 7/7] ALSA: emu10k1: use more existing defines instead of
 open-coded numbers
Message-ID: <202304230230.Hzwubvl5-lkp@intel.com>
References: <20230422161021.1143903-8-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422161021.1143903-8-oswald.buddenhagen@gmx.de>

Hi Oswald,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[cannot apply to tiwai-sound/for-linus linus/master v6.3-rc7 next-20230421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oswald-Buddenhagen/ALSA-emu10k1-comment-updates/20230423-002113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230422161021.1143903-8-oswald.buddenhagen%40gmx.de
patch subject: [PATCH 7/7] ALSA: emu10k1: use more existing defines instead of open-coded numbers
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230423/202304230230.Hzwubvl5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/e9c8b11aa4d8ccd105aba0217ff72e87bad545bf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oswald-Buddenhagen/ALSA-emu10k1-comment-updates/20230423-002113
        git checkout e9c8b11aa4d8ccd105aba0217ff72e87bad545bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304230230.Hzwubvl5-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/emu10k1/p16v.c: In function 'snd_p16v_pcm_prepare_capture':
>> sound/pci/emu10k1/p16v.c:313:38: error: 'A_I2S_CAPTURE_RATE' undeclared (first use in this function); did you mean 'A_I2S_CAPTURE_RATE_MASK'?
     313 |           snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_44100);
         |                                      ^~~~~~~~~~~~~~~~~~
         |                                      A_I2S_CAPTURE_RATE_MASK
   sound/pci/emu10k1/p16v.c:313:38: note: each undeclared identifier is reported only once for each function it appears in


vim +313 sound/pci/emu10k1/p16v.c

   295	
   296	/* prepare capture callback */
   297	static int snd_p16v_pcm_prepare_capture(struct snd_pcm_substream *substream)
   298	{
   299		struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
   300		struct snd_pcm_runtime *runtime = substream->runtime;
   301		int channel = substream->pcm->device - emu->p16v_device_offset;
   302	
   303		/*
   304		dev_dbg(emu->card->dev, "prepare capture:channel_number=%d, rate=%d, "
   305		       "format=0x%x, channels=%d, buffer_size=%ld, period_size=%ld, "
   306		       "frames_to_bytes=%d\n",
   307		       channel, runtime->rate, runtime->format, runtime->channels,
   308		       runtime->buffer_size, runtime->period_size,
   309		       frames_to_bytes(runtime, 1));
   310		*/
   311	        switch (runtime->rate) {
   312		case 44100:
 > 313		  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_44100);
   314		  break;
   315		case 96000:
   316		  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_96000);
   317		  break;
   318		case 192000:
   319		  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_192000);
   320		  break;
   321		case 48000:
   322		default:
   323		  snd_emu10k1_ptr_write(emu, A_I2S_CAPTURE_RATE, channel, A_I2S_CAPTURE_48000);
   324		  break;
   325		}
   326		/* FIXME: Check emu->buffer.size before actually writing to it. */
   327		snd_emu10k1_ptr20_write(emu, CAPTURE_FIFO_POINTER, channel, 0);
   328		snd_emu10k1_ptr20_write(emu, CAPTURE_DMA_ADDR, channel, runtime->dma_addr);
   329		snd_emu10k1_ptr20_write(emu, CAPTURE_BUFFER_SIZE, channel, frames_to_bytes(runtime, runtime->buffer_size) << 16); // buffer size in bytes
   330		snd_emu10k1_ptr20_write(emu, CAPTURE_POINTER, channel, 0);
   331		//snd_emu10k1_ptr20_write(emu, CAPTURE_SOURCE, 0x0, 0x333300e4); /* Select MIC or Line in */
   332		//snd_emu10k1_ptr20_write(emu, EXTENDED_INT_MASK, 0, snd_emu10k1_ptr20_read(emu, EXTENDED_INT_MASK, 0) | (0x110000<<channel));
   333	
   334		return 0;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
