Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463B1386
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 02:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674269985; x=1705805985;
  h=date:from:cc:subject:message-id:mime-version;
  bh=L7mOwbTRUNWV/bcAS3I1ccKy1rWmRpmTQNd5VEnmKDw=;
  b=KLstJYn5/5MKnaN6cH2WIUxMKblBRVXTL9Gb5wWOTTyseD8E/8RPyuaH
   +bae20nyfV8mvwTsiG/9NPUMX96ExecVDYE2toy58yejXUaI9S7O46LZP
   snAzpI+YNLO7dwyPedqtEi0IkIwv7hZRas9QPPg/9w3erVVIcdqPOLUJU
   eVNZHz3qsuK9+F3KSqvYX+mwIQWprhZ4zQIPqO6kn8EgWe8pAUnvnPLq8
   XQuXGLcSSbR1xVdOMQpZMhLRu4AveSvpU8bgJsibV8DLpCN8Bne0RY7/X
   O3FlqfvHAqCk+DCFqCLr/To2r187VqtNQoYYpC0wOXaQ3hynjiIZFGQHF
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="325789439"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="325789439"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 18:59:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="768909887"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="768909887"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2023 18:59:43 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ46Y-0003IU-1t;
	Sat, 21 Jan 2023 02:59:42 +0000
Date: Sat, 21 Jan 2023 10:59:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:test/soc-core-helper-function 25/25]
 sound/soc/intel/atom/sst-atom-controls.c:1337:36: error: 'struct
 snd_soc_dai' has no member named 'playback_widget'
Message-ID: <202301211010.nB1rGh7f-lkp@intel.com>
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
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20230121/202301211010.nB1rGh7f-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/plbossart/sound/commit/0df4868031fdd5738d8d9d151eac509e1f5a54de
        git remote add plbossart-sound https://github.com/plbossart/sound
        git fetch --no-tags plbossart-sound test/soc-core-helper-function
        git checkout 0df4868031fdd5738d8d9d151eac509e1f5a54de
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/intel/atom/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from sound/soc/intel/atom/sst-atom-controls.c:17:
   sound/soc/intel/atom/sst-atom-controls.c: In function 'sst_send_pipe_gains':
>> sound/soc/intel/atom/sst-atom-controls.c:1337:36: error: 'struct snd_soc_dai' has no member named 'playback_widget'
    1337 |                                 dai->playback_widget->name);
         |                                    ^~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:1336:17: note: in expansion of macro 'dev_dbg'
    1336 |                 dev_dbg(dai->dev, "Stream name=%s\n",
         |                 ^~~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:1338:24: error: 'struct snd_soc_dai' has no member named 'playback_widget'
    1338 |                 w = dai->playback_widget;
         |                        ^~
   In file included from include/linux/printk.h:566,
                    from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from sound/soc/intel/atom/sst-atom-controls.c:17:
>> sound/soc/intel/atom/sst-atom-controls.c:1356:36: error: 'struct snd_soc_dai' has no member named 'capture_widget'
    1356 |                                 dai->capture_widget->name);
         |                                    ^~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:1355:17: note: in expansion of macro 'dev_dbg'
    1355 |                 dev_dbg(dai->dev, "Stream name=%s\n",
         |                 ^~~~~~~
   sound/soc/intel/atom/sst-atom-controls.c:1357:24: error: 'struct snd_soc_dai' has no member named 'capture_widget'
    1357 |                 w = dai->capture_widget;
         |                        ^~


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
