Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B734062F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 06:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674281765; x=1705817765;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kEdvxRvKshQYGQRMR2RyMVegRQQNeBxKj6R2l1Ah4Mw=;
  b=eMhC3VQd/wwzga0uv9VEux+21hW7hHrSwJNEIaSefO7jWTQdlQNNax3z
   kIYop5+imozT74V38LILKRWyWN70MARTvFL8w0AVB4cFYZh0DMNL0/fws
   Uh230SFW9VvSbYc6MU9UvjmS4dMS5IJLES3isiUBPNHoheK1pduKaU1iG
   0KJ8cy4704TzYF++zTkCHjm+qJkLE8ywrAuSGPE9qfYwZssKdeFpCmmli
   1+nDmOZgY2zxp3XDFl3kh9pr2lhxBrNxgvtEKKQKwjwg3l+ATdo8KXC5R
   AS9JEf2fDuIhWIoycxC4+K2elsov8eZPkkcB/W/th8aspSC1rfQUmeNA/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="388122979"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="388122979"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 22:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="660846110"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="660846110"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jan 2023 22:15:59 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ7AU-0003eK-39;
	Sat, 21 Jan 2023 06:15:58 +0000
Date: Sat, 21 Jan 2023 14:15:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:test/soc-core-helper-function 25/25]
 sound/soc/intel/atom/sst-atom-controls.c:1337:10: error: no member named
 'playback_widget' in 'struct snd_soc_dai'
Message-ID: <202301211444.rEfezOGh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound test/soc-core-helper-function
head:   0df4868031fdd5738d8d9d151eac509e1f5a54de
commit: 0df4868031fdd5738d8d9d151eac509e1f5a54de [25/25] ASoC: soc-dai.h: cleanup Playback/Capture data for snd_soc_dai
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20230121/202301211444.rEfezOGh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/plbossart/sound/commit/0df4868031fdd5738d8d9d151eac509e1f5a54de
        git remote add plbossart-sound https://github.com/plbossart/sound
        git fetch --no-tags plbossart-sound test/soc-core-helper-function
        git checkout 0df4868031fdd5738d8d9d151eac509e1f5a54de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash sound/soc/intel/atom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/soc/intel/atom/sst-atom-controls.c:1337:10: error: no member named 'playback_widget' in 'struct snd_soc_dai'
                                   dai->playback_widget->name);
                                   ~~~  ^
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                ^~~~~~~~~~~
   include/linux/dynamic_debug.h:273:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:1338:12: error: no member named 'playback_widget' in 'struct snd_soc_dai'
                   w = dai->playback_widget;
                       ~~~  ^
>> sound/soc/intel/atom/sst-atom-controls.c:1356:10: error: no member named 'capture_widget' in 'struct snd_soc_dai'
                                   dai->capture_widget->name);
                                   ~~~  ^
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                ^~~~~~~~~~~
   include/linux/dynamic_debug.h:273:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:1357:12: error: no member named 'capture_widget' in 'struct snd_soc_dai'
                   w = dai->capture_widget;
                       ~~~  ^
   4 errors generated.


vim +1337 sound/soc/intel/atom/sst-atom-controls.c

24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1316  
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1317  /**
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1318   * sst_send_pipe_gains - send gains for the front-end DAIs
11013884025044 sound/soc/intel/atom/sst-atom-controls.c Pierre-Louis Bossart 2020-07-01  1319   * @dai: front-end dai
11013884025044 sound/soc/intel/atom/sst-atom-controls.c Pierre-Louis Bossart 2020-07-01  1320   * @stream: direction
11013884025044 sound/soc/intel/atom/sst-atom-controls.c Pierre-Louis Bossart 2020-07-01  1321   * @mute: boolean indicating mute status
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1322   *
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1323   * The gains in the pipes connected to the front-ends are muted/unmuted
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1324   * automatically via the digital_mute() DAPM callback. This function sends the
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1325   * gains for the front-end pipes.
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1326   */
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1327  int sst_send_pipe_gains(struct snd_soc_dai *dai, int stream, int mute)
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1328  {
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1329  	struct sst_data *drv = snd_soc_dai_get_drvdata(dai);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1330  	struct snd_soc_dapm_widget *w;
f6cd55a19f3f46 sound/soc/intel/atom/sst-atom-controls.c Pierre-Louis Bossart 2022-05-20  1331  	struct snd_soc_dapm_path *p;
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1332  
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1333  	dev_dbg(dai->dev, "enter, dai-name=%s dir=%d\n", dai->name, stream);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1334  
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1335  	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1336  		dev_dbg(dai->dev, "Stream name=%s\n",
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15 @1337  				dai->playback_widget->name);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1338  		w = dai->playback_widget;
e63bfd45aba426 sound/soc/intel/atom/sst-atom-controls.c Lars-Peter Clausen   2015-07-26  1339  		snd_soc_dapm_widget_for_each_sink_path(w, p) {
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1340  			if (p->connected && !p->connected(w, p->sink))
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1341  				continue;
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1342  
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1343  			if (p->connect && p->sink->power &&
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1344  					is_sst_dapm_widget(p->sink)) {
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1345  				struct sst_ids *ids = p->sink->priv;
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1346  
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1347  				dev_dbg(dai->dev, "send gains for widget=%s\n",
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1348  						p->sink->name);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1349  				mutex_lock(&drv->lock);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1350  				sst_set_pipe_gain(ids, drv, mute);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1351  				mutex_unlock(&drv->lock);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1352  			}
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1353  		}
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1354  	} else {
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1355  		dev_dbg(dai->dev, "Stream name=%s\n",
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15 @1356  				dai->capture_widget->name);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1357  		w = dai->capture_widget;
e63bfd45aba426 sound/soc/intel/atom/sst-atom-controls.c Lars-Peter Clausen   2015-07-26  1358  		snd_soc_dapm_widget_for_each_source_path(w, p) {
f5e056e1e46fcb sound/soc/intel/atom/sst-atom-controls.c Colin Ian King       2019-11-19  1359  			if (p->connected && !p->connected(w, p->source))
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1360  				continue;
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1361  
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1362  			if (p->connect &&  p->source->power &&
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1363  					is_sst_dapm_widget(p->source)) {
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1364  				struct sst_ids *ids = p->source->priv;
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1365  
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1366  				dev_dbg(dai->dev, "send gain for widget=%s\n",
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1367  						p->source->name);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1368  				mutex_lock(&drv->lock);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1369  				sst_set_pipe_gain(ids, drv, mute);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1370  				mutex_unlock(&drv->lock);
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1371  			}
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1372  		}
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1373  	}
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1374  	return 0;
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1375  }
24c8d14192cc63 sound/soc/intel/sst-atom-controls.c      Vinod Koul           2014-10-15  1376  

:::::: The code at line 1337 was first introduced by commit
:::::: 24c8d14192cc63661ca049b423d7baaa0bbafeb3 ASoC: Intel: mrfld: add DSP core controls

:::::: TO: Vinod Koul <vinod.koul@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
