Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A16846C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 20:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688070833; x=1719606833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rIkKyyWfBzwQwxt25WaqxDg7ezhw9SIp9UwaiUfNwuM=;
  b=eXuVbXmwJaqh8zOUAcP89anQ4V5jTHYAg7Ubrun3hXw9bE76YqGzfxiQ
   EqjIIyfv2LOGxIRAG4EZqQbbkiKN/QbXV51B3BCwXbDYf05yh/Rv6jhd8
   4ZbROOTLnygvNVedzeznNqpGmu8qfnTE00e2HVU2xlfaS5xD2YvS2f0rQ
   J/NUtS5CPMAKLVuvOgyaZYT7uDH4SBFseqofaoLYUIgE0o3QI2jDGwv31
   xzvO5xkbWAXHzziJAyOIKvOar5HHizssLtTWrgE6d6IHr5ONlcuto8XUS
   Zy3Pm96kmFlAMLLCV522DwBZrk+P+kNOoJEMC+Gr3krJDi6cPEtFwbI1t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364800455"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="364800455"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 13:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="667692845"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="667692845"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jun 2023 13:33:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEyKp-000ENl-0E;
	Thu, 29 Jun 2023 20:33:47 +0000
Date: Fri, 30 Jun 2023 04:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/midi20-gadget 56/56] ERROR: modpost:
 "snd_ump_block_new" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
Message-ID: <202306300438.HICMJktb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20-gadget
head:   ed28b6939ebadd073e731ccf0f2c6ce4ab102ffd
commit: ed28b6939ebadd073e731ccf0f2c6ce4ab102ffd [56/56] usb: gadget: add support for USB MIDI 2.0 function driver (WIP)
config: arm-randconfig-r046-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300438.HICMJktb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300438.HICMJktb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300438.HICMJktb-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/usb/gadget/function/f_midi2.c:483:6: warning: no previous prototype for 'reply_ump_stream_fb_info' [-Wmissing-prototypes]
     483 | void reply_ump_stream_fb_info(struct f_midi2 *midi2, int blk)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> ERROR: modpost: "snd_ump_block_new" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
>> ERROR: modpost: "snd_ump_receive_ump_val" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
>> ERROR: modpost: "snd_ump_transmit" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
>> ERROR: modpost: "snd_ump_receive" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
>> ERROR: modpost: "snd_ump_endpoint_new" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
