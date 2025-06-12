Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF31C6FE9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 02:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749696545; cv=none; b=qbiaIILqELr8XcuTdPukTnOau9cLu0+zWhDRIclcvzLG03mH5CNva0ko3esqQ2Gg24IZo1uNsT35ixGf3ynD/GlRp6eL8EiCxE6hnCyg4mYO1F5FiwKn95xa4+ibKMoQysk62RII35G2yqarlnZbI8fxnWih0QlhtPTicFD4JCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749696545; c=relaxed/simple;
	bh=RC4MHfxNBsAZM1O6VKzaCowmALLcKayHlngMiCsW2Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avrtOAYFHGufkSvTmTQoVhIGzzBK9S/6k1UuhL7kI0uL2Kd99L+35gCsexEAlAoBIGWGMSTWzXePj2/4xfuV6F3Y/yKbTopdn5qRKu1ZmOFjxZCNV6vsXxtwxyt/hJkuFhY1a24fXU1MJDW5NcVlvr0v2QNeEn+BEtCdykoWdt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHdXynrH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHdXynrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749696544; x=1781232544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RC4MHfxNBsAZM1O6VKzaCowmALLcKayHlngMiCsW2Dc=;
  b=iHdXynrHRKL1uz3huxU4zciR2ipvV2+pwGWQ+9VvP+PXt9x4NbN+W6eP
   Ul7GmbNnqG2CSVqRFi24XgmQOwBv9dTiqfNCLV1dBZzPQZQzNOPxIX4YH
   nQWj3k4MCHDVy2mPkBZTu3s8J47f7lrnO0woS+OHBOnpnkvjg1QQJsbRB
   n0DAiizgg4KbJietMpxlT57F3R/37BgSQPBT7hyXlejjxY68FJs7lnAXu
   /tcCgB4vekPZ8YECnU32T5rqgTlg4oAZEPqt7GOCuayhdQ38bOp2V+24v
   v8yjwyoREvznQg2C40ViL0IMx7sCu4x5M9EEUuWAyMLcJJ5VO/irLAXps
   w==;
X-CSE-ConnectionGUID: ffxbHiy6SY+cv0M5TvTmJg==
X-CSE-MsgGUID: 0aI4+Jq1RY2gIKYA4RkUyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51848818"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51848818"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 19:49:01 -0700
X-CSE-ConnectionGUID: niQbklRIQk6HpG6zwyxk9Q==
X-CSE-MsgGUID: Zu+oJcLYRjGyJ46gIMPozg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147370999"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2025 19:49:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPXzt-000B2y-1z;
	Thu, 12 Jun 2025 02:48:57 +0000
Date: Thu, 12 Jun 2025 10:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 1519/1841] sound/pci/hda/patch_ca0132.c:4413:45:
 warning: '%s' directive output may be truncated writing up to 767 bytes into
 a region of size 44
Message-ID: <202506121025.G9uunMlx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   19a60293b9925080d97f22f122aca3fc46dadaf9
commit: a409c60111e6bb98fcabab2aeaa069daa9434ca0 [1519/1841] ALSA: hda/ca0132: Fix buffer overflow in add_tuning_control
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250612/202506121025.G9uunMlx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121025.G9uunMlx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506121025.G9uunMlx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/pci/hda/patch_ca0132.c: In function 'ca0132_build_controls':
>> sound/pci/hda/patch_ca0132.c:4413:45: warning: '%s' directive output may be truncated writing up to 767 bytes into a region of size 44 [-Wformat-truncation=]
    4413 |         snprintf(namestr, sizeof(namestr), "%s %s Volume", name, dirstr[dir]);
         |                                             ^~
   In function 'add_tuning_control',
       inlined from 'add_tuning_ctls' at sound/pci/hda/patch_ca0132.c:4423:9,
       inlined from 'ca0132_build_controls' at sound/pci/hda/patch_ca0132.c:7195:2:
   sound/pci/hda/patch_ca0132.c:4413:9: note: 'snprintf' output 9 or more bytes (assuming 776) into a destination of size 44
    4413 |         snprintf(namestr, sizeof(namestr), "%s %s Volume", name, dirstr[dir]);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   arch/openrisc/kernel/head.o: in function `_dispatch_do_ipage_fault':
>> (.head.text+0x900): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   (.head.text+0xa00): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   arch/openrisc/kernel/head.o: in function `exit_with_no_dtranslation':
>> (.init.text+0x21bc): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   arch/openrisc/kernel/head.o: in function `exit_with_no_itranslation':
   (.init.text+0x2264): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   init/main.o: in function `trace_event_raw_event_initcall_level':
   main.c:(.text+0x28c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `strlen' defined in .text section in lib/string.o
   init/main.o: in function `initcall_blacklisted':
   main.c:(.text+0x70c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `strcmp' defined in .text section in lib/string.o
   init/main.o: in function `trace_initcall_finish_cb':
   main.c:(.text+0x830): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/15.1.0/libgcc.a(_muldi3.o)
   main.c:(.text+0x854): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/15.1.0/libgcc.a(_muldi3.o)
   main.c:(.text+0x894): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/15.1.0/libgcc.a(_muldi3.o)
   main.c:(.text+0x8c0): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/15.1.0/libgcc.a(_muldi3.o)
   init/main.o: in function `do_one_initcall':
   main.c:(.text+0xdb4): additional relocation overflows omitted from the output
   `xe_configfs_exit' referenced in section `.rodata' of drivers/gpu/drm/xe/xe_module.o: defined in discarded section `.exit.text' of drivers/gpu/drm/xe/xe_configfs.o


vim +4413 sound/pci/hda/patch_ca0132.c

  4376	
  4377	static int add_tuning_control(struct hda_codec *codec,
  4378					hda_nid_t pnid, hda_nid_t nid,
  4379					const char *name, int dir)
  4380	{
  4381		char namestr[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
  4382		int type = dir ? HDA_INPUT : HDA_OUTPUT;
  4383		struct snd_kcontrol_new knew =
  4384			HDA_CODEC_VOLUME_MONO(namestr, nid, 1, 0, type);
  4385	
  4386		knew.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
  4387				SNDRV_CTL_ELEM_ACCESS_TLV_READ;
  4388		knew.tlv.c = NULL;
  4389		knew.tlv.p = NULL;
  4390		switch (pnid) {
  4391		case VOICE_FOCUS:
  4392			knew.info = voice_focus_ctl_info;
  4393			knew.get = tuning_ctl_get;
  4394			knew.put = voice_focus_ctl_put;
  4395			knew.tlv.p = voice_focus_db_scale;
  4396			break;
  4397		case MIC_SVM:
  4398			knew.info = mic_svm_ctl_info;
  4399			knew.get = tuning_ctl_get;
  4400			knew.put = mic_svm_ctl_put;
  4401			break;
  4402		case EQUALIZER:
  4403			knew.info = equalizer_ctl_info;
  4404			knew.get = tuning_ctl_get;
  4405			knew.put = equalizer_ctl_put;
  4406			knew.tlv.p = eq_db_scale;
  4407			break;
  4408		default:
  4409			return 0;
  4410		}
  4411		knew.private_value =
  4412			HDA_COMPOSE_AMP_VAL(nid, 1, 0, type);
> 4413		snprintf(namestr, sizeof(namestr), "%s %s Volume", name, dirstr[dir]);
  4414		return snd_hda_ctl_add(codec, nid, snd_ctl_new1(&knew, codec));
  4415	}
  4416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
