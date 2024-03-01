Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10552E3FE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 01:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709257360; cv=none; b=bzzmweGAI/lAOoRuwleTUF/xEoVTK88Vagmo8ZdUcD+YytB7Co1FVajCe6q7ZlhSC6HL0kitXHIhjVjN/gXtrFvhaAOyL6sSRKctv6BuJ/2itPcm753jaoZh8X7hAcaiOQESBJjftqPM8fPar+SgYgvtEcyfZu28ARfzjp+Q/6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709257360; c=relaxed/simple;
	bh=1KbdRL2WXdTJTyY1S+KqMtAfKq8kJioaxA3f0dfO1XI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AdCHWxuVQnsNuyeOv8Vl/JJ7VLdfgFYgXg1njGriPzUGmxEi5OA2zdQn0+5Po2+UNStBQ1ksAM7Oq8d+0OctLAu295NI0PLRJeQlAJTn2ZvuRZJ2uqMPROTZyb/RSzudWDosdcaY/0HNRCgYuLU+DPUV1wZya0Dg65jMRxI+JBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TyAiSP13; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TyAiSP13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709257358; x=1740793358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1KbdRL2WXdTJTyY1S+KqMtAfKq8kJioaxA3f0dfO1XI=;
  b=TyAiSP13pN1Rp/LA1gSYlkeXV/BOAV8LYeWA89b9zdl38ynU811dh6mt
   0KTqa40OWemkDgUg/nvXfs3FbpS34QnataSl3LNYw3qiINC6TCaTaRGNg
   l4/7VuGdDdjUp8+FiDHBApJXKn2GrS7Nm1/oW67ojnu3ElD3NkZzoMpf5
   dRr1tHl0CPBamtR5TK4iJOHRtVHCibpBp5nQwCDswJguk3Kj9ECop80IA
   lCtvANHx3X6A5ze/J7Kpv5dp7WNj6Fx7wcRALf11hxRJq6xrC/kj+AXJD
   LOnFy8HvadS1SQBdY6NoUXwPhsBk46yQRHaviq/GVj8EcYqMq0dsCJoXi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3631992"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3631992"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 17:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8585187"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Feb 2024 17:42:36 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfrux-000DRW-1I;
	Fri, 01 Mar 2024 01:42:31 +0000
Date: Fri, 1 Mar 2024 09:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:ib-nomadik-gpio 7/25] kismet: WARNING: unmet direct
 dependencies detected for GPIO_NOMADIK when selected by PINCTRL_NOMADIK
Message-ID: <202403010917.pnDhdS1Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-nomadik-gpio
head:   6ad679cfaeea9291e9dce3247e34656080fc1d29
commit: ae82f5d2b18a6c6cd95f8896010b221780114cac [7/25] pinctrl: nomadik: Kconfig: allow building with COMPILE_TEST
config: alpha-kismet-CONFIG_GPIO_NOMADIK-CONFIG_PINCTRL_NOMADIK-0-0 (https://download.01.org/0day-ci/archive/20240301/202403010917.pnDhdS1Y-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240301/202403010917.pnDhdS1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010917.pnDhdS1Y-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_NOMADIK when selected by PINCTRL_NOMADIK
   
   WARNING: unmet direct dependencies detected for GPIO_NOMADIK
     Depends on [n]: GPIOLIB [=n] && HAS_IOMEM [=y] && (ARCH_U8500 || ARCH_NOMADIK || COMPILE_TEST [=y])
     Selected by [y]:
     - PINCTRL_NOMADIK [=y] && PINCTRL [=y] && (ARCH_U8500 || ARCH_NOMADIK || COMPILE_TEST [=y]) && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
