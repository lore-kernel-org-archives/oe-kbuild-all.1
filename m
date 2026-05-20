Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8047C2EA754
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305399; cv=none; b=mUHGms3BWJiA8WxZrB/iutrFjDLCYk5abBgI4yieKSNK3N2Zv5JEadPYGJPttyGZEgj1dnbqP4hJp/cFxQKCFNywdp0kQ0jWylHiWGUlUrLBSLoWYVKwWN3F542a6URwBwEVddfLEZ7RiM/e5Lk4kn9iyTHYvaYYWlDF69ewfYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305399; c=relaxed/simple;
	bh=8tix0abokQNyGImJjP54u+YpZ0m8mWP6xBcjR39Z0Ko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PvtgGpKRLgZFWabHUzE94zWUJKAvq6NkIvaV0Xuhxu9A0PHBD2OrrTxWlJPKQTxQtH4SAVlfqAapW7emOzpEYVuiBf1Q1x4DLIU+1H8Ud8jDirI5IhGv4pEyIupVgorPhagC4bQf6pv1YeZPmhkpsTU/F7zjIeBtAuEaQZsCdm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRpgUUrF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRpgUUrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779305397; x=1810841397;
  h=date:from:to:cc:subject:message-id;
  bh=8tix0abokQNyGImJjP54u+YpZ0m8mWP6xBcjR39Z0Ko=;
  b=iRpgUUrFcVOrE2YW4rVSUlSbfu9Ccw8At7+iAxpt0BkxXdx+dJct/iIm
   i95co7PPxOztiOFpTtvbrtFsX8fl86No5Q07slKB6r+4+Fz+vmaAc9kUG
   +kJcYFtSFMR+MiE/7B+eBQYi98zqGpBxYMfRO0TiO6Ce4N6BtATZWVkIl
   NO+10zY/Ay5md0UAHouP3cs0uUh5jaKy3+AF+xm1TdNgAEntZGsofXtm4
   vIaqMvT4zA/kWb/58eY3buUHoF9b+ccSH3gfPLtvxYWKPMJCCTvRjy+fW
   a2Xi4iNj5nH1balYKBngQhnmii9Orsmay4bG1OM7bVz9tjqotCEU5As8A
   Q==;
X-CSE-ConnectionGUID: KLI5KbPHRmq50tuZwgzXRA==
X-CSE-MsgGUID: 00fgNqcQSOuUkkcUFBLz+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80395744"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80395744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 12:29:57 -0700
X-CSE-ConnectionGUID: pw9WXbsiTaeW3qSofaRhww==
X-CSE-MsgGUID: wuNl2bexSyGl9xSvVsNbBA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2026 12:29:56 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPmc5-000000003lB-1ebt;
	Wed, 20 May 2026 19:29:53 +0000
Date: Thu, 21 May 2026 03:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dlech:b4/iio-adc-ti-ads122c14 3/4] ERROR: modpost:
 "__udivdi3" [drivers/iio/adc/ti-ads112c14.ko] undefined!
Message-ID: <202605210318.A48LPcT5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi David,

First bad commit (maybe != root cause):

tree:   https://github.com/dlech/linux b4/iio-adc-ti-ads122c14
head:   4a3600a0052aa9fbf058af069a2b0282a8922432
commit: b5b1b66752a90560368bb9ac27e8aadf2b598362 [3/4] iio: adc: ti-ads112c14: implement gain on internal short SYS_MON channel
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260521/202605210318.A48LPcT5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210318.A48LPcT5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210318.A48LPcT5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-ipq.o
>> ERROR: modpost: "__udivdi3" [drivers/iio/adc/ti-ads112c14.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/iio/adc/ti-ads112c14.ko] undefined!
ERROR: modpost: "__divdi3" [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!
ERROR: modpost: "__udivdi3" [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
