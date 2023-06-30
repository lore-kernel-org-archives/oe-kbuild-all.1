Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD062107A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 10:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688120004; x=1719656004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cIjaWWgKmxvRy9EARsTHBx4xO6XBMWkVAgQy1+arw3w=;
  b=SwuHW7XvKcbETzTJvaIRqghrHsIjNnANRZw7QbDMB65Q0lSvsZli0Zyx
   6cjEnUKf5cogQVsC7dFaDcckG9k6hySxlNwRtED9G81Znjinc8VnfvMec
   dffAdPRMeI1Ykj3X8mQtfW6WW6aFCQq4Y/eZdHITmHzRKIcRfuP0Zi1/5
   kOHFz9sgLgz5sxYxfqrrprDOalF53UcHAaK2SYnfihKz32WMMHjTwwogr
   jA2juCUTMg7ujiL9faLybsnfUpL5hx44XuRPb0T3WmFn/CWCeD8tMdxfV
   6ONGYporrLkYRrrGAenEV7PBKmSjMhkmXxT27osdeDgbJs9RffezaZYz/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="393089291"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="393089291"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 03:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711771801"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="711771801"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 03:13:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFB7x-000EsJ-1T;
	Fri, 30 Jun 2023 10:13:21 +0000
Date: Fri, 30 Jun 2023 18:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/midi20-gadget 58/62] ERROR: modpost:
 "snd_ump_switch_protocol" [drivers/usb/gadget/function/usb_f_midi2.ko]
 undefined!
Message-ID: <202306301823.km1gb5Cd-lkp@intel.com>
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
config: openrisc-randconfig-r001-20230630 (https://download.01.org/0day-ci/archive/20230630/202306301823.km1gb5Cd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301823.km1gb5Cd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301823.km1gb5Cd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_50g_base_r (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_50g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_100g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_ext_maps (section: .data) -> qed_mfw_ext_100g_base_r4 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_20g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_50g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.o: section mismatch in reference: qed_mfw_legacy_maps (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.o: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.o: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.o: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_20000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.o: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.o: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.o: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.o: section mismatch in reference: qede_forced_speed_maps (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
ERROR: modpost: "snd_ump_block_new" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
>> ERROR: modpost: "snd_ump_switch_protocol" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
ERROR: modpost: "snd_ump_receive_ump_val" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
ERROR: modpost: "snd_ump_transmit" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
ERROR: modpost: "snd_ump_receive" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!
ERROR: modpost: "snd_ump_endpoint_new" [drivers/usb/gadget/function/usb_f_midi2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
