Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448A5134A2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 11:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688123186; x=1719659186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CdAU2IjeZB76vtS5XyCLrXOmJWMiZnSf8TozRN8J2qQ=;
  b=HNdwUzWpW+RPDYaAXXdUtU14t0uP5Amy5TK4Q6O7Izwi/g+iOGTJ4zt6
   mLh3hs9drWN3HSy/di1Vsu76eSwkW3MKntv/fl6dPIxMoYtwj9cYmNg6c
   Qz/kc1ksHD+G6tVeey8i/iE8yvCMFsOKPlbOzn7l+sxpiyI+/Y3TUZgNQ
   kV9ID2AojX4yv7CS7pnN3hCrH+XLqJEcewEsSVk5imUOxYCUNvtDGeDWz
   dpClM9lOSV2ONKjT6RdIR53tC4GkPKlbIA2PbKEa882GWisH1+1Z5C8EH
   ICQ2Jxg0N+4KrkUC4zHZnGLz+J5xiVSTpT82tls2NzlDU0mmzIIzAUKX1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="347150962"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="347150962"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 04:06:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="752961625"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="752961625"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 30 Jun 2023 04:06:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFBxG-000Etf-17;
	Fri, 30 Jun 2023 11:06:22 +0000
Date: Fri, 30 Jun 2023 19:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/midi20-gadget 58/62] f_midi2.c:undefined
 reference to `snd_ump_switch_protocol'
Message-ID: <202306301830.QG614gSO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20-gadget
head:   9d606002a91a37796ae62afc5e6667126314e21b
commit: 0417de91e87de93793cd0d2cc4aef9062dc62f05 [58/62] usb: gadget: Add support for USB MIDI 2.0 function driver
config: x86_64-buildonly-randconfig-r001-20230629 (https://download.01.org/0day-ci/archive/20230630/202306301830.QG614gSO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301830.QG614gSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301830.QG614gSO-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/gadget/function/f_midi2.o: in function `f_midi2_create_card.constprop.0':
   f_midi2.c:(.text+0x35b6): undefined reference to `snd_ump_endpoint_new'
   ld: f_midi2.c:(.text+0x3bba): undefined reference to `snd_ump_block_new'
   ld: drivers/usb/gadget/function/f_midi2.o: in function `process_ump_stream_msg':
>> f_midi2.c:(.text+0x4b0f): undefined reference to `snd_ump_switch_protocol'
   ld: drivers/usb/gadget/function/f_midi2.o: in function `f_midi2_ep_out_complete':
   f_midi2.c:(.text+0x598e): undefined reference to `snd_ump_receive_ump_val'
   ld: f_midi2.c:(.text+0x5b36): undefined reference to `snd_ump_receive'
   ld: drivers/usb/gadget/function/f_midi2.o: in function `process_ump_transmit':
   f_midi2.c:(.text+0x5de1): undefined reference to `snd_ump_transmit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
