Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE852CA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 22:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685138568; x=1716674568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJB9Dl/lG+QIri0DbLOrIHYlvXISnwJTexYGyCXLVw8=;
  b=Wha0YdDA2ZnNa/8rRAw2CCS5A9gMDYREIBoz+iqKgSJ3XIXzTzvLmBoc
   QOKxBJswGlLmwAws/ySI5T92mOtzoAq9A2P7ZNbSf/rb6GbPWC5PhB9ib
   o6A0Ela/meUmLvsxq+0HbSrpju8xq8DX18Pu6gkg8zLpnjQRfewDKsGhW
   WtsjAROpZ2m154uI5vxlQaduLCJqfYnGxwliGmFK7m80BiFd+JfxCuXVF
   SZG7ub3lmbJpvzRlfA//JqAhq8Z7msdkEWzDMFPTTAP7hn6MyJY/tySRM
   /apHekvwctyd3CCIX+pt9TW5MQ0uLEKJ6DSIHR2q/naqX5DPDcGRKGEk2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="351822079"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="351822079"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 15:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="699542639"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="699542639"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 May 2023 15:02:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2fWH-000Jcg-0K;
	Fri, 26 May 2023 22:02:45 +0000
Date: Sat, 27 May 2023 06:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:topic/midi20 9/40] sound/usb/midi2.c:548:16: sparse:
 sparse: cast to restricted __le16
Message-ID: <202305270534.odwHL9F0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20
head:   77700b81bd0e47d89d50eb4b3f2f323492f79998
commit: ff49d1df79aef7580fe3ac99d17c3f886655d080 [9/40] ALSA: usb-audio: USB MIDI 2.0 UMP support
config: microblaze-randconfig-s032-20230526 (https://download.01.org/0day-ci/archive/20230527/202305270534.odwHL9F0-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=ff49d1df79aef7580fe3ac99d17c3f886655d080
        git remote add tiwai-sound https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
        git fetch --no-tags tiwai-sound topic/midi20
        git checkout ff49d1df79aef7580fe3ac99d17c3f886655d080
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze SHELL=/bin/bash sound/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305270534.odwHL9F0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/usb/midi2.c:548:16: sparse: sparse: cast to restricted __le16
>> sound/usb/midi2.c:548:16: sparse: sparse: cast to restricted __le16
>> sound/usb/midi2.c:548:16: sparse: sparse: cast to restricted __le16
>> sound/usb/midi2.c:548:16: sparse: sparse: cast to restricted __le16

vim +548 sound/usb/midi2.c

   530	
   531	/* get the full group terminal block descriptors and return the size */
   532	static int get_group_terminal_block_descs(struct snd_usb_midi2_interface *umidi)
   533	{
   534		struct usb_host_interface *hostif = umidi->hostif;
   535		struct usb_device *dev = umidi->chip->dev;
   536		struct usb_ms20_gr_trm_block_header_descriptor header = { 0 };
   537		unsigned char *data;
   538		int err, size;
   539	
   540		err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
   541				      USB_REQ_GET_DESCRIPTOR,
   542				      USB_RECIP_INTERFACE | USB_TYPE_STANDARD | USB_DIR_IN,
   543				      USB_DT_CS_GR_TRM_BLOCK << 8 | hostif->desc.bAlternateSetting,
   544				      hostif->desc.bInterfaceNumber,
   545				      &header, sizeof(header));
   546		if (err < 0)
   547			return err;
 > 548		size = __le16_to_cpu(header.wTotalLength);
   549		if (!size) {
   550			dev_err(&dev->dev, "Failed to get GTB descriptors for %d:%d\n",
   551				hostif->desc.bInterfaceNumber, hostif->desc.bAlternateSetting);
   552			return -EINVAL;
   553		}
   554	
   555		data = kzalloc(size, GFP_KERNEL);
   556		if (!data)
   557			return -ENOMEM;
   558	
   559		err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
   560				      USB_REQ_GET_DESCRIPTOR,
   561				      USB_RECIP_INTERFACE | USB_TYPE_STANDARD | USB_DIR_IN,
   562				      USB_DT_CS_GR_TRM_BLOCK << 8 | hostif->desc.bAlternateSetting,
   563				      hostif->desc.bInterfaceNumber, data, size);
   564		if (err < 0) {
   565			kfree(data);
   566			return err;
   567		}
   568	
   569		umidi->blk_descs = data;
   570		umidi->blk_desc_size = size;
   571		return 0;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
