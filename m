Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6137E30B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830514; cv=none; b=nNwf9+WIxvx+7fs/Yxs7LHgQqfWMBQ/zK0Hyw25uDRtCXO8A9boSj3WxPZnnPEE8Qh88ngk/+d1JPgzC/H6IfES1mZY6psvtJTRjeNPoPiRYhM6HhH7Oo5xt5CSPPKSU0un2VI6lTKFh459Q3LgQQQPokVTgtgpC+6O/M2TmxgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830514; c=relaxed/simple;
	bh=lMoqlw8DF1Nr7q9i7W/PsrQdYqq94yulJl2wVQyISA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pOzDyM5v4lwG5Au2RDxlmoVGbFZsuHhm363RmSVphqGIADP78xCAV9i8vJaX/72rSlBsnbP+gJpYcZXuegrAUSNpZuBinBZaOKcAk/m61HnUO0I7c025YWUKVyOutX9XJvagJkRTOQb7aZJuqLuTgH/fx8RwR7GIwiHNyhqpB74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kk/rTOGW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kk/rTOGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773830512; x=1805366512;
  h=date:from:to:cc:subject:message-id;
  bh=lMoqlw8DF1Nr7q9i7W/PsrQdYqq94yulJl2wVQyISA4=;
  b=Kk/rTOGWBYbRbUM+VXa7Skm5w67FD9mYPtEI0mI3ePFfB5YRf4ir8p3A
   A7OY5meMqgSVZ68iVNcICb2/inHQwKgIzvEAYJ9FXj3ipSI1PYpfDYzqL
   oRfkpRE0SuBdUWt67WbUiTm6j8/h6Or4ZqXJGB4ue3L4wGwc85Q/oKb4y
   bZL5GHT29x0RwUFXEM2ng3zFv8xpe0MEKIuAiSHtEy4a/JFZw1fCGGKHm
   JQyxUx3Z4H88rfn3AYBGcO11fpM34qzJDVW+2ExOvxplkqhv8xHOKlwQp
   RcdUQExSqGlJbG7WD8b6arAs4mSLNZb/jtRTExaTqSmwHwPce1G5JTuKl
   g==;
X-CSE-ConnectionGUID: eSJ/NZg2Q5qy9w2tdZh8Wg==
X-CSE-MsgGUID: R5ph9bz0Q4OjZyB2iZ1KyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="75000380"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="75000380"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 03:41:51 -0700
X-CSE-ConnectionGUID: +SIJVVUTRD+beqy2j9EUHg==
X-CSE-MsgGUID: Bu/N4OzTQPKc7F5bEOp+3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227272898"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 03:41:50 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2oLS-000000002oj-3gNM;
	Wed, 18 Mar 2026 10:41:46 +0000
Date: Wed, 18 Mar 2026 18:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-misc:asoc-7.1 10/10] ERROR: modpost:
 "wm_adsp_hibernate" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
Message-ID: <202603181810.1605kET4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-7.1
head:   4ebaf9d999327ce8e2ea5847ac96fe53fde3fe9a
commit: 00da2edc646c851114c78affdc3e34a089136d8a [10/10] ASoC: wm_adsp: Some improvements to firmware file
config: mips-randconfig-r054-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181810.1605kET4-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181810.1605kET4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181810.1605kET4-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "wm_halo_init" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp2_remove" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
>> ERROR: modpost: "wm_adsp_hibernate" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp2_component_probe" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp2_component_remove" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp_event" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp_early_event" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp2_preloader_get" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp2_preloader_put" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
ERROR: modpost: "wm_adsp_fw_get" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
WARNING: modpost: suppressed 10 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
