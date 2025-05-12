Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FBE252908
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 20:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747081404; cv=none; b=DPQejfAFxG5LMKxprZwq7S6qZSR1HU2+if1fE7KqZvjFRgVh8ctVgkVmCbmqu/sQYDwtcpd00VxjTn0+6HpYPp6SGfJzkcNPJbcnKqnHJXcRiMG0ZT9u/wFYTI08fH9we4XoFfhC5eXd7T9kCVuiuBg1kg7fgor8hn2smNquKaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747081404; c=relaxed/simple;
	bh=ne9hcForkoj/dyMjXqH5/aq0qYxuf6vWkv/eOH44GgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U4IGaM0eOlU8bY1u0n1ghYyMKB/CWp9p+CsMXez+I34Fy5aPPW1gKQqVEja2XsRaKGk4tViXZJllHgvUgejVRoOCi1a3iUuVP01nZi+wpxHrDQ03DRfD77+d3t+ql3emldlOnAFyokAmX00LmfHHKUNv9rL8LhpECFkVvXfEqkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAsS03nd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAsS03nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747081402; x=1778617402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ne9hcForkoj/dyMjXqH5/aq0qYxuf6vWkv/eOH44GgM=;
  b=LAsS03ndP0qFFB+0IilzZ8TSniXuycZiUXwRjDxXR4xprRdfzY7HOEtm
   J8cn76KJ5x+lBe0ZQucqeVffg7CPA+mF5Ifo8OMAUQ9RuHOMMuEdcrvmA
   LJA9jGmPnvNiW/zY1PSp2bHYk0qNQw0W4XBUBob+1FQ/9gPgL3/NLvGoQ
   f7/g0BqlD2qD4ASOyodsW+m2xlyVPKJ+GtKe5sThHuxGlTYBoAUdDX8SY
   wk2hj4GWmQWzWA9G1T/6ISNZisdqzrbWgQKQwDlLQcI52E876UsQqVLHt
   mkmi1Ggj4uNAxF7Q/EbeyQtgkcRuCTAJy5Y7PzXQxTgenF4jFNug2Mla0
   A==;
X-CSE-ConnectionGUID: Y+oG9kDDQ5W3ZSYP+eszwQ==
X-CSE-MsgGUID: KOlVKakmTPGTObBpFa9JOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74295463"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="74295463"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 13:23:21 -0700
X-CSE-ConnectionGUID: nvJtVrBwSU+ufBay8iyE1g==
X-CSE-MsgGUID: 8VpxAx1uSjeTTzywsHi5oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="168568118"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 May 2025 13:23:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEZfv-000FOU-0T;
	Mon, 12 May 2025 20:22:59 +0000
Date: Tue, 13 May 2025 04:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 8818/10491]
 sound/pci/hda/tas2781_hda_spi.c:496:25: sparse: sparse: symbol
 'tas2781_snd_ctls' was not declared. Should it be static?
Message-ID: <202505130420.vr9yDI3k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
commit: 28a09d9e42c500204fd79e91f40434b16b4c9372 [8818/10491] ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver
config: i386-randconfig-062-20250512 (https://download.01.org/0day-ci/archive/20250513/202505130420.vr9yDI3k-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130420.vr9yDI3k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130420.vr9yDI3k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/hda/tas2781_hda_spi.c:496:25: sparse: sparse: symbol 'tas2781_snd_ctls' was not declared. Should it be static?
>> sound/pci/hda/tas2781_hda_spi.c:505:25: sparse: sparse: symbol 'tas2781_prof_ctl' was not declared. Should it be static?
>> sound/pci/hda/tas2781_hda_spi.c:512:25: sparse: sparse: symbol 'tas2781_dsp_ctls' was not declared. Should it be static?

vim +/tas2781_snd_ctls +496 sound/pci/hda/tas2781_hda_spi.c

   495	
 > 496	struct snd_kcontrol_new tas2781_snd_ctls[] = {
   497		ACARD_SINGLE_RANGE_EXT_TLV(NULL, TAS2781_AMP_LEVEL, 1, 0, 20, 0,
   498			tas2781_amp_getvol, tas2781_amp_putvol, amp_vol_tlv),
   499		ACARD_SINGLE_RANGE_EXT_TLV(NULL, TAS2781_DVC_LVL, 0, 0, 200, 1,
   500			tas2781_digital_getvol, tas2781_digital_putvol, dvc_tlv),
   501		ACARD_SINGLE_BOOL_EXT(NULL, 0, tas2781_force_fwload_get,
   502			tas2781_force_fwload_put),
   503	};
   504	
 > 505	struct snd_kcontrol_new tas2781_prof_ctl = {
   506		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
   507		.info = tasdevice_info_profile,
   508		.get = tasdevice_get_profile_id,
   509		.put = tasdevice_set_profile_id,
   510	};
   511	
 > 512	struct snd_kcontrol_new tas2781_dsp_ctls[] = {
   513		/* Speaker Program */
   514		{
   515			.iface = SNDRV_CTL_ELEM_IFACE_CARD,
   516			.info = tasdevice_info_programs,
   517			.get = tasdevice_program_get,
   518			.put = tasdevice_program_put,
   519		},
   520		/* Speaker Config */
   521		{
   522			.iface = SNDRV_CTL_ELEM_IFACE_CARD,
   523			.info = tasdevice_info_config,
   524			.get = tasdevice_config_get,
   525			.put = tasdevice_config_put,
   526		},
   527	};
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
