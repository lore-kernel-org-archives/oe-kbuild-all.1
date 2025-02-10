Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B07B17BCE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 21:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739224226; cv=none; b=uR4CKTEP10kqevihGnsCmd/hpMzmWdByI5ZvnlMVUdu/DW/91Hl9GjN7QyxxURPeAwOO+O/UdcgdZ7P7ikULvcKpBTlZ/J2SVaBwCtTnLI0fAn+uaNlnYIqn7OcS/rmFqITkarpfuaEQ1AHIVcmZwuQRdiUgtm4LLnQBcJSwb20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739224226; c=relaxed/simple;
	bh=42HVQ0RMDpe5h1LMRayN31KQuGXECfpJjb6LkzKaAKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u3JSOQsNu2+5CwYO7ClYw+Ca1e2Yc0pciNexqN9dJdrfGPq1yqBTzvMyYzgWMCQg4g+5p+N5/J/VXcjsJx4xPvOTqw2Xha2zSJeux3UQzUGJ4A2CNPhmpxEjodLuzo9QleHCDcN3AgzIvAg28T5YLit18is4ZtXBjGTxGwFOaRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHFQ3nQm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHFQ3nQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739224224; x=1770760224;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=42HVQ0RMDpe5h1LMRayN31KQuGXECfpJjb6LkzKaAKg=;
  b=eHFQ3nQm6VL2tBYkF3TeX7RZq8xMfWAjYQaK4bs7C2Agvwrm38EBSgXg
   wP1PplqSWSsKSZDHilho3cbU72yo8HZIKOPGT+iBEyrvY01mhCLko7aRN
   qW2T7ZeUxQKMWKGzDuZBDNVTsQ4fG9aD9n55WF5MK1Ts/hRcrbkkj7h7E
   2WUaGDOpS1OxX0/nEnDTBEHi3/lyNhn+JSUPRDJuv54VA4UOqv/Pu8E/E
   hSgYmBA4mHfUeeydKozaBR2oSUHiYxmr+H8RpCo+MzT+td0FRtNQ6XSpM
   0GuN1RYmTMFT5lYbxILzHWrOBUKauxaXnRyfDy3lJ438QdR+24kYO2pVv
   g==;
X-CSE-ConnectionGUID: +R9NPdZlSvGQsdLgHMMAEw==
X-CSE-MsgGUID: ajDNqLXYR16Uw3mIyRW6tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="27426285"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="27426285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 13:50:23 -0800
X-CSE-ConnectionGUID: cIrmj/k2RbeBFO3QREhH6A==
X-CSE-MsgGUID: Hh+fDMw0QuKZfl7XDC3+oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117232940"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Feb 2025 13:50:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thbfY-0013Rr-0q;
	Mon, 10 Feb 2025 21:50:20 +0000
Date: Tue, 11 Feb 2025 05:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/070-audio 114/114]
 sound/soc/apple/macaudio.c:1285:1: sparse: sparse: symbol
 'macaudio_spk_mux_enum' was not declared. Should it be static?
Message-ID: <202502110546.SH4HLpZ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Janne,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   6374439594d500a1555ebfed447ade5e4c203509
commit: 6374439594d500a1555ebfed447ade5e4c203509 [114/114] fixup! ASoC: macaudio: Sense improvements
config: parisc-randconfig-r123-20250211 (https://download.01.org/0day-ci/archive/20250211/202502110546.SH4HLpZ5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250211/202502110546.SH4HLpZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110546.SH4HLpZ5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/apple/macaudio.c:1285:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1295:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1485:30: sparse: sparse: symbol 'macaudio_j180_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1488:30: sparse: sparse: symbol 'macaudio_j274_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1492:30: sparse: sparse: symbol 'macaudio_j293_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1496:30: sparse: sparse: symbol 'macaudio_j313_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1500:30: sparse: sparse: symbol 'macaudio_j314_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1504:30: sparse: sparse: symbol 'macaudio_j316_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1508:30: sparse: sparse: symbol 'macaudio_j37x_j47x_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1512:30: sparse: sparse: symbol 'macaudio_j413_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1516:30: sparse: sparse: symbol 'macaudio_j415_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1520:30: sparse: sparse: symbol 'macaudio_j45x_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1524:30: sparse: sparse: symbol 'macaudio_j493_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1528:30: sparse: sparse: symbol 'macaudio_fallback_cfg' was not declared. Should it be static?

vim +/macaudio_spk_mux_enum +1285 sound/soc/apple/macaudio.c

dad277d2ededa0 Martin Povišer 2022-02-19  1284  
dad277d2ededa0 Martin Povišer 2022-02-19 @1285  SOC_ENUM_SINGLE_VIRT_DECL(macaudio_spk_mux_enum, macaudio_spk_mux_texts);
dad277d2ededa0 Martin Povišer 2022-02-19  1286  
dad277d2ededa0 Martin Povišer 2022-02-19  1287  static const struct snd_kcontrol_new macaudio_spk_mux =
dad277d2ededa0 Martin Povišer 2022-02-19  1288  	SOC_DAPM_ENUM("Speaker Playback Mux", macaudio_spk_mux_enum);
dad277d2ededa0 Martin Povišer 2022-02-19  1289  
dad277d2ededa0 Martin Povišer 2022-02-19  1290  static const char * const macaudio_hp_mux_texts[] = {
dad277d2ededa0 Martin Povišer 2022-02-19  1291  	"Primary",
dad277d2ededa0 Martin Povišer 2022-02-19  1292  	"Secondary"
dad277d2ededa0 Martin Povišer 2022-02-19  1293  };
dad277d2ededa0 Martin Povišer 2022-02-19  1294  
dad277d2ededa0 Martin Povišer 2022-02-19 @1295  SOC_ENUM_SINGLE_VIRT_DECL(macaudio_hp_mux_enum, macaudio_hp_mux_texts);
dad277d2ededa0 Martin Povišer 2022-02-19  1296  

:::::: The code at line 1285 was first introduced by commit
:::::: dad277d2ededa05b7bacd2c278f79431606fb522 ASoC: apple: Add macaudio machine driver

:::::: TO: Martin Povišer <povik+lin@cutebit.org>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
