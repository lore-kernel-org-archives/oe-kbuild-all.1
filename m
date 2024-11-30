Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B7B3FC2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 04:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732941302; cv=none; b=lnI4vWHo77BH7ZFBB3occKSN8Cw11QYD0PuPgwB9How0rmX0neDVkrVXNS4aZXFrG+c1RwUY8XNV4mTlab8Zmwm/xWgBsZnUxLRJTUOrVTorPhxuzucs9DmM69h7A0aF5Ic71RrTkO5yv06Rf0Sws9aQVvjZb0f4WmRKXexVgqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732941302; c=relaxed/simple;
	bh=j5zxIBvE+wF0/mW1mJgMuTCUkcBw/u0/677AaXnWh90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tWBt4K/JV6YBMZRgBBw0aurbUXos8YMi0RWnBoFtcjh2y2qi8WDwzbtU2H2Li3VsFGe4Q9ISyCdEqF7cT1sQGS5M4xOtpWjp56auihh1KH4gmE3hVyaWQtma9bfYBfIvCxcmDK+IzDINYWzDDKeE3ImvANqr7eoS0FiyrWJ04u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGH0BJel; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGH0BJel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732941301; x=1764477301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j5zxIBvE+wF0/mW1mJgMuTCUkcBw/u0/677AaXnWh90=;
  b=QGH0BJelWsGMi/3sgnGc1bZKAs0jvl7uaCh4bo6znnGpw1YxS0aPJSj8
   wVWFdBaSfW0W7OOkIivqUuIZzXhFZ/OmOmG+oBMY3c9/W3Up29iGg0dyp
   hMIygXfxqSCFX0pHdaJqpomHg7yfkxdyJsLgIFmIZ4b+GFJLkmagH630T
   T1XlEmVWNU8xCUPMVrJtBOW9LII0x4f4yAS3Xa74mw+eEt0PmUT54pqCg
   u/MDMMOwOg6wOw8Ubx29ilxLr5NM1RW916kjsY5H0ITNIkFgNwunkn5Us
   OFs99kFjt6EXkP1CEJgp/NeaHyIUhcu3CjVMOM2fhWAJd8g6Lp5gQ+Wlx
   g==;
X-CSE-ConnectionGUID: No5oxnkrQuaXwQjfNbbcSQ==
X-CSE-MsgGUID: +iWaOeTQSQm9EQqC9/0mJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="43834497"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="43834497"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 20:35:00 -0800
X-CSE-ConnectionGUID: JL/4m4IjRc2OuTId6MuL4A==
X-CSE-MsgGUID: BimZrBeaQCaAPnEtAPpQSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="97734777"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Nov 2024 20:34:58 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHFC4-000059-1t;
	Sat, 30 Nov 2024 04:34:56 +0000
Date: Sat, 30 Nov 2024 12:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?unknown-8bit?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 16/119] sound/soc/apple/macaudio.c:778:1:
 sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it
 be static?
Message-ID: <202411301227.CoRet7u6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   070347d4a0876921be5b0bbc11fff848c2ed3e59
commit: 19a2b533a8813a6a3f8368f4198977afc2049339 [16/119] ASoC: apple: Add macaudio machine driver
config: sparc64-randconfig-r122-20241118 (https://download.01.org/0day-ci/archive/20241130/202411301227.CoRet7u6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241130/202411301227.CoRet7u6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301227.CoRet7u6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/apple/macaudio.c:778:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:788:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +/macaudio_spk_mux_enum +778 sound/soc/apple/macaudio.c

   777	
 > 778	SOC_ENUM_SINGLE_VIRT_DECL(macaudio_spk_mux_enum, macaudio_spk_mux_texts);
   779	
   780	static const struct snd_kcontrol_new macaudio_spk_mux =
   781		SOC_DAPM_ENUM("Speaker Playback Mux", macaudio_spk_mux_enum);
   782	
   783	static const char * const macaudio_hp_mux_texts[] = {
   784		"Primary",
   785		"Secondary"
   786	};
   787	
 > 788	SOC_ENUM_SINGLE_VIRT_DECL(macaudio_hp_mux_enum, macaudio_hp_mux_texts);
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
