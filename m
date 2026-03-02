Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B21A2C0B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462086; cv=none; b=B/hZrdPitwLNwYas8MyWWnYcjGX58Fh8QoeHhElBocTlANzyuMxoGYWCc+5VsvkFLPEJWirr5j32HfIsIFOLAhFK8/SWLI95LPkP8FCY2nCq1EaPHUV8gihj3v4X+gehKX4BQLT2kfwJVwQqHz/wV3BcsmB1l+Gwly4wlikJhJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462086; c=relaxed/simple;
	bh=Frra1jAuqP0lA2FBR+OsaYzxbEsrwM4NjrOL9x2JbFM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bqYppKKzppQw6ozx5dcDKExmUfmlLQKt/wbobciBcn5v0ak0r4MBrdF1Yxbd73lUfe2lMDl6nb0zeIRK7AyNUqi+zyr1mzeBgrqbi8ETw8AgGWTdLdT7HYcMH5YJITH6ikMP6hVeSxr9EcJpqq2OOwmUD/EJ2KsGgnnifmD5ktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWXYMyFy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWXYMyFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772462085; x=1803998085;
  h=date:from:to:cc:subject:message-id;
  bh=Frra1jAuqP0lA2FBR+OsaYzxbEsrwM4NjrOL9x2JbFM=;
  b=hWXYMyFylNDfihFvZtsN6iZ3f8tjyhbWFsrO3lCNGz5cfhVEeFF0uFJn
   4CmK+rhRPdHzec+F4WyZV/kFhhydIlZUGXXe7f2zySPYwbwsgwrfIwEn0
   oyo1zt8pTKXMLHzROmoiogskUfSgjdTKv/BJsT+6TKtpV8zeRmXiEXp/G
   iP/6GDkIH2psvsT7jfA6H8SkDDBxpi9HMru9N+T8qhDRLqn9ZSWLCNu5U
   +Fg/CMsVKuD0AhijDpS1+1gnEjqxXl0EwClBWChgAQk1mw3YC3rabiJB3
   DUvxvQZUZ71MUqhbG+Q0L7lA0z7tZeD4YJu+0XnBMDP7nawDph7YuikbC
   Q==;
X-CSE-ConnectionGUID: nLxAg2EVQ5KExpPf07QZwg==
X-CSE-MsgGUID: 9P3yFazFQdCY5akRmbG5Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="90865833"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="90865833"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 06:34:45 -0800
X-CSE-ConnectionGUID: 9doUQ6WKRhaIpaXCG5vdKQ==
X-CSE-MsgGUID: lPsdchhzQYWBAapsK851LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="220730471"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Mar 2026 06:34:43 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx4M4-000000000y9-1OyA;
	Mon, 02 Mar 2026 14:34:40 +0000
Date: Mon, 02 Mar 2026 22:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: undefined reference to
 `drm_connector_hdmi_audio_plugged_notify'
Message-ID: <202603022229.VyYP9sfI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11439c4635edd669ae435eec308f4ab8a0804808
commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
date:   10 weeks ago
config: parisc-randconfig-r053-20260302 (https://download.01.org/0day-ci/archive/20260302/202603022229.VyYP9sfI-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603022229.VyYP9sfI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603022229.VyYP9sfI-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/gpu/drm/bridge/lontium-lt9611uxc.o: in function `lt9611uxc_bridge_hpd_notify':
>> (.text+0x50c): undefined reference to `drm_connector_hdmi_audio_plugged_notify'
>> hppa-linux-ld: (.text+0x560): undefined reference to `drm_connector_hdmi_audio_plugged_notify'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
