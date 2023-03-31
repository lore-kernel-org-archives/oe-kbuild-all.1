Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA889472
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 23:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680305352; x=1711841352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iBy+pVXp4cvCvrANrAcgTMjhwawvqzxMncEv02Txpko=;
  b=k9IWm8//iT6U8YaU31L1yc23OpwkpvNOHGa/ZVvxCgSpFo4B2K1NpzMp
   uBjEmMispRdG8p1ROwPehFViKmWaNpMbt98wvRKu/+935CbNqeRc5JK8w
   Ahprd12Oiq9etkQxKX7nv5pP+352/J0NfEJ4Gtbbk6FztmokEWbBhY4IK
   wrMc7el782n3j/lCge0IFeOXtZqd1kJWL5EevlQB9QKE606MW8NRDfdVQ
   ZKI/J6jXyDGTiX3gYudaBawn9/iteIe7MKdt+LJekFr25Vm24UUhcRBWv
   NOyZLD1djyo/GdIxLiuCfxasXgAv0ainGL2LqW7cXYu+dmrfNFsYHQL3k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340306127"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="340306127"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 16:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="859509646"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="859509646"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Mar 2023 16:29:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piOB3-000MGT-07;
	Fri, 31 Mar 2023 23:29:01 +0000
Date: Sat, 1 Apr 2023 07:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:tmp 6/25] sound/usb/media.c:125:61: error:
 incompatible type for argument 1 of 'media_devnode_is_registered'
Message-ID: <202304010711.4iOT63HK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git tmp
head:   42249987f00786a33526b973c650743bc49681c2
commit: 15f1c7087ec4c7e0c3e07781be4ca7d3d54ff0af [6/25] Revert "[media] media-device: dynamically allocate struct media_devnode"
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230401/202304010711.4iOT63HK-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree tmp
        git checkout 15f1c7087ec4c7e0c3e07781be4ca7d3d54ff0af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010711.4iOT63HK-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/usb/media.c: In function 'snd_media_stream_delete':
>> sound/usb/media.c:125:61: error: incompatible type for argument 1 of 'media_devnode_is_registered'
     125 |                 if (mdev && media_devnode_is_registered(mdev->devnode)) {
         |                                                         ~~~~^~~~~~~~~
         |                                                             |
         |                                                             struct media_devnode
   In file included from include/media/media-device.h:19,
                    from sound/usb/media.h:23,
                    from sound/usb/media.c:31:
   include/media/media-devnode.h:140:69: note: expected 'struct media_devnode *' but argument is of type 'struct media_devnode'
     140 | static inline int media_devnode_is_registered(struct media_devnode *devnode)
         |                                               ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   sound/usb/media.c: In function 'snd_media_mixer_delete':
   sound/usb/media.c:242:53: error: incompatible type for argument 1 of 'media_devnode_is_registered'
     242 |                 if (media_devnode_is_registered(mdev->devnode)) {
         |                                                 ~~~~^~~~~~~~~
         |                                                     |
         |                                                     struct media_devnode
   include/media/media-devnode.h:140:69: note: expected 'struct media_devnode *' but argument is of type 'struct media_devnode'
     140 | static inline int media_devnode_is_registered(struct media_devnode *devnode)
         |                                               ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   sound/usb/media.c:249:45: error: incompatible type for argument 1 of 'media_devnode_is_registered'
     249 |         if (media_devnode_is_registered(mdev->devnode))
         |                                         ~~~~^~~~~~~~~
         |                                             |
         |                                             struct media_devnode
   include/media/media-devnode.h:140:69: note: expected 'struct media_devnode *' but argument is of type 'struct media_devnode'
     140 | static inline int media_devnode_is_registered(struct media_devnode *devnode)
         |                                               ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   sound/usb/media.c: In function 'snd_media_device_create':
   sound/usb/media.c:287:46: error: incompatible type for argument 1 of 'media_devnode_is_registered'
     287 |         if (!media_devnode_is_registered(mdev->devnode)) {
         |                                          ~~~~^~~~~~~~~
         |                                              |
         |                                              struct media_devnode
   include/media/media-devnode.h:140:69: note: expected 'struct media_devnode *' but argument is of type 'struct media_devnode'
     140 | static inline int media_devnode_is_registered(struct media_devnode *devnode)
         |                                               ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
--
   drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: In function 'mtk_vcodec_dec_remove':
>> drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:496:54: error: incompatible type for argument 1 of 'media_devnode_is_registered'
     496 |         if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
         |                                         ~~~~~~~~~~~~~^~~~~~~~
         |                                                      |
         |                                                      struct media_devnode
   In file included from include/media/media-device.h:19,
                    from include/media/media-request.h:20,
                    from include/media/videobuf2-core.h:20,
                    from include/media/videobuf2-v4l2.h:16,
                    from include/media/v4l2-mem2mem.h:16,
                    from drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:16:
   include/media/media-devnode.h:140:69: note: expected 'struct media_devnode *' but argument is of type 'struct media_devnode'
     140 | static inline int media_devnode_is_registered(struct media_devnode *devnode)
         |                                               ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
--
   drivers/media/test-drivers/visl/visl-core.c: In function 'visl_remove':
>> drivers/media/test-drivers/visl/visl-core.c:490:50: error: incompatible type for argument 1 of 'media_devnode_is_registered'
     490 |         if (media_devnode_is_registered(dev->mdev.devnode)) {
         |                                         ~~~~~~~~~^~~~~~~~
         |                                                  |
         |                                                  struct media_devnode
   In file included from include/media/media-device.h:19,
                    from include/media/media-request.h:20,
                    from include/media/v4l2-ctrls.h:14,
                    from drivers/media/test-drivers/visl/visl-core.c:44:
   include/media/media-devnode.h:140:69: note: expected 'struct media_devnode *' but argument is of type 'struct media_devnode'
     140 | static inline int media_devnode_is_registered(struct media_devnode *devnode)
         |                                               ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~


vim +/media_devnode_is_registered +125 sound/usb/media.c

66354f18fe5fbb Shuah Khan 2019-04-01  116  
66354f18fe5fbb Shuah Khan 2019-04-01  117  void snd_media_stream_delete(struct snd_usb_substream *subs)
66354f18fe5fbb Shuah Khan 2019-04-01  118  {
66354f18fe5fbb Shuah Khan 2019-04-01  119  	struct media_ctl *mctl = subs->media_ctl;
66354f18fe5fbb Shuah Khan 2019-04-01  120  
66354f18fe5fbb Shuah Khan 2019-04-01  121  	if (mctl) {
66354f18fe5fbb Shuah Khan 2019-04-01  122  		struct media_device *mdev;
66354f18fe5fbb Shuah Khan 2019-04-01  123  
66354f18fe5fbb Shuah Khan 2019-04-01  124  		mdev = mctl->media_dev;
66354f18fe5fbb Shuah Khan 2019-04-01 @125  		if (mdev && media_devnode_is_registered(mdev->devnode)) {
66354f18fe5fbb Shuah Khan 2019-04-01  126  			media_devnode_remove(mctl->intf_devnode);
66354f18fe5fbb Shuah Khan 2019-04-01  127  			media_device_unregister_entity(&mctl->media_entity);
66354f18fe5fbb Shuah Khan 2019-04-01  128  			media_entity_cleanup(&mctl->media_entity);
66354f18fe5fbb Shuah Khan 2019-04-01  129  		}
66354f18fe5fbb Shuah Khan 2019-04-01  130  		kfree(mctl);
66354f18fe5fbb Shuah Khan 2019-04-01  131  		subs->media_ctl = NULL;
66354f18fe5fbb Shuah Khan 2019-04-01  132  	}
66354f18fe5fbb Shuah Khan 2019-04-01  133  }
66354f18fe5fbb Shuah Khan 2019-04-01  134  

:::::: The code at line 125 was first introduced by commit
:::::: 66354f18fe5fbb65f7b10a519654013d6df09f80 media: sound/usb: Use Media Controller API to share media resources

:::::: TO: Shuah Khan <shuah@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
