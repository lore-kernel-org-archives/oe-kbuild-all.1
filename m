Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81142DF68
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 01:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773882986; cv=none; b=HXeK9PZZWFgji4kmGk+v71J40AQn7FM/Rxv2XkbHTo1aAXUt43YwE/t0bKEp+p815lqMi1FgU4Hk0GLytGILQlWRNGXi/KZAAkYzklS1HvzIvTU4x3fWnL9Zbni341nUp/Zi/uZFh9p2TepQCBPI2jdDyAGrtMWr8sXnTA8TvMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773882986; c=relaxed/simple;
	bh=VfMqURMbUeNMaJ32K0detOhprD6+deJAM2MPjybSoVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fvz4SOWfMNYcsb1bVdqCuGx5gaJkjzmbFbAT61vWYv868sFbpwTdPW40DA9fjG47MavtgqPVKQUv8+END0Kv6G/Pv4Im/w3MAO3YFnORYEd7S4R+rnoIta7YdloTRqYm+2uCv/CHUXVZSv922CDdDrg8FxGy/1V24XOrvDVVMy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJWbBnc4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJWbBnc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773882985; x=1805418985;
  h=date:from:to:cc:subject:message-id;
  bh=VfMqURMbUeNMaJ32K0detOhprD6+deJAM2MPjybSoVQ=;
  b=GJWbBnc4Bl5Jl0lii88gkMQEa3r/xLDmF30fYgkTV3cgNCWXklKXq3N3
   cfRB/9scTuNVuow1QhsSYtJezlFfMdsghurlpHd+faUEvPFg7/YTWCbGj
   VC3koNQjMyxRWj4Hy0D0DmPthCjAqKTe5fkt2+8d2PuzZtv952tvZzaLY
   gdA3+Mr2PPLTl7d36ubjdew4c831hu7Tfb0cRFm6RoCQKKemWsut/dS38
   mgabifiqLRjISkI0qy6Bc+WAfZaAC2UDytInHkJZq+SJ2AMIXbY3iu75x
   WH2mf7p0XxV2qu5aUmFxJvjgP2NGDTZGaiSeuVwnjxgfg6IbB3ZQBRUiz
   w==;
X-CSE-ConnectionGUID: DItRw8+gTcmverncsrv94w==
X-CSE-MsgGUID: OZGZYmYmSfqxi8FPU1a8SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86029113"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="86029113"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 18:16:24 -0700
X-CSE-ConnectionGUID: 70II4+51RMqpOdmt68Rpug==
X-CSE-MsgGUID: lnqfHhKqRDKbkuS6ESuczQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="260699169"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 18:16:23 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w31zo-000000000AT-3Qy9;
	Thu, 19 Mar 2026 01:16:20 +0000
Date: Thu, 19 Mar 2026 09:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4757/7246] ERROR: modpost:
 "wm_adsp_hibernate" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
Message-ID: <202603190945.o0X1D7zr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 00da2edc646c851114c78affdc3e34a089136d8a [4757/7246] ASoC: wm_adsp: Some improvements to firmware file
config: sparc-randconfig-r113-20260318 (https://download.01.org/0day-ci/archive/20260319/202603190945.o0X1D7zr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190945.o0X1D7zr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190945.o0X1D7zr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "wm_adsp_fw_put" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
ERROR: modpost: "wm_adsp2_remove" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
>> ERROR: modpost: "wm_adsp_hibernate" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
ERROR: modpost: "wm_adsp_event" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
ERROR: modpost: "wm_adsp_fw_enum" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
ERROR: modpost: "wm_adsp2_component_probe" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
ERROR: modpost: "wm_adsp2_preloader_put" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
ERROR: modpost: "wm_adsp2_preloader_get" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
ERROR: modpost: "wm_adsp2_component_remove" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
ERROR: modpost: "wm_adsp_fw_get" [sound/soc/codecs/snd-soc-cs35l41.ko] undefined!
WARNING: modpost: suppressed 78 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
