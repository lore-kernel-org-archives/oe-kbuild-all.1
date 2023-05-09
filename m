Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EC019904
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 21:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683666780; x=1715202780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hRZejTJV6CCnJ63NpPkgYIf83RuHHUvIEQG3FebdScs=;
  b=idPR50y5MRK67/bLninxIpS2mFesA+agbUBvHjQblXjF9rsG/DJKBldx
   Nu2Ce0cqk4Uxf8bG12ff9jvXUvzQCm1lPSiGOmLS52ErC2Wxp77S70ytQ
   fjxMEUuGJMn7cv4jGWmYoKGAw+24FoSPuzvzQFOF39rYjL6jNbPjaxT1B
   hnDNwMcBLLOCiGrrXhXYR6t5nlfcqoDE+al75ucvVummFn4TBhYV6WoPE
   14lITtFu4GL+6m/btcM5oE/EAKtzobqyM/vN/1J+UVcv+gEOSFnEvR+J5
   1DmUuTQs4cdbwqLvSbMEBmYjvBKam+WEbJI6sUzcWD/5pC1L7+bYH7pWj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="378147784"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="378147784"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 14:12:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="843260640"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="843260640"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 May 2023 14:12:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwUdd-0002VE-2x;
	Tue, 09 May 2023 21:12:49 +0000
Date: Wed, 10 May 2023 05:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:sound/ivsense-improvements 31/57]
 sound/soc/apple/macaudio.c:715:32: error: 'struct snd_soc_dai' has no member
 named 'capture_widget'
Message-ID: <202305100558.HHEVYt91-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/ivsense-improvements
head:   8db1ec849194a2607c8546306d0b9e0e1ed2a1da
commit: bfe8b9c1822c56ceea71f2580c9910025129c91f [31/57] ASoC: macaudio: Start speaker sense capture support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230510/202305100558.HHEVYt91-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/bfe8b9c1822c56ceea71f2580c9910025129c91f
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux sound/ivsense-improvements
        git checkout bfe8b9c1822c56ceea71f2580c9910025129c91f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100558.HHEVYt91-lkp@intel.com/

Note: the asahilinux/sound/ivsense-improvements HEAD 8db1ec849194a2607c8546306d0b9e0e1ed2a1da builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   sound/soc/apple/macaudio.c: In function 'macaudio_add_backend_dai_route':
>> sound/soc/apple/macaudio.c:715:32: error: 'struct snd_soc_dai' has no member named 'capture_widget'
     715 |                 r->source = dai->capture_widget->name;
         |                                ^~


vim +715 sound/soc/apple/macaudio.c

   685	
   686	static int macaudio_add_backend_dai_route(struct snd_soc_card *card, struct snd_soc_dai *dai,
   687						  bool is_speakers)
   688	{
   689		struct snd_soc_dapm_route routes[2];
   690		struct snd_soc_dapm_route *r;
   691		int nroutes = 0;
   692		int ret;
   693	
   694		memset(routes, 0, sizeof(routes));
   695	
   696		dev_dbg(card->dev, "adding routes for '%s'\n", dai->name);
   697	
   698		r = &routes[nroutes++];
   699		if (is_speakers)
   700			r->source = "Speaker Playback";
   701		else
   702			r->source = "Headphone Playback";
   703		r->sink = dai->stream[SNDRV_PCM_STREAM_PLAYBACK].widget->name;
   704	
   705		/* If headphone jack, add capture path */
   706		if (!is_speakers) {
   707			r = &routes[nroutes++];
   708			r->source = dai->stream[SNDRV_PCM_STREAM_CAPTURE].widget->name;
   709			r->sink = "Headset Capture";
   710		}
   711	
   712		/* If speakers, add sense capture path */
   713		if (is_speakers) {
   714			r = &routes[nroutes++];
 > 715			r->source = dai->capture_widget->name;
   716			r->sink = "Speaker Sense Capture";
   717		}
   718	
   719		ret = snd_soc_dapm_add_routes(&card->dapm, routes, nroutes);
   720		if (ret)
   721			dev_err(card->dev, "failed adding dynamic DAPM routes for %s\n",
   722				dai->name);
   723		return ret;
   724	}
   725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
