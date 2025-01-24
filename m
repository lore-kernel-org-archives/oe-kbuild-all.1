Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE0A1D5142
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 02:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737687274; cv=none; b=R94zRWqN/aWX7+9xpJ/xxHWo9c92kUEXZbPbZ6dbWga68N3tiLdk9rQBAo8t6mXC/j5PUfW//sTznxweQHdimSUhnKrAx+pf0JPZ7dYFGinKN5+6vpFkakmXQD/pVLe6hfpmU50l231WiJ9uNSM5qNOA/0VykFbyOyYq/h1lFK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737687274; c=relaxed/simple;
	bh=VMASbKY5XrBwjygvF9PgGCyoum7JopFPR8Lh628IY+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f+fySjMkoQ6Z5LxwxpyIWTVz4kYpi7XjH+aXQwrv+MY7td/TjXV77cNF33UOFe0quFvLVYreZBXgWnIC2ESkby5Z8FJqn0KG/w4K6evBgG5AALszyWUB2U9CRrJgBEjBFmDCVkbs74KwXBZ80EDb+hyZeKyeZeTbO6QVnjTetZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwEkiZOC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwEkiZOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737687273; x=1769223273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMASbKY5XrBwjygvF9PgGCyoum7JopFPR8Lh628IY+0=;
  b=fwEkiZOCNO/36hLR9r/tFM8QhyFEbeMEag/WMbLmUWuJ72KgcpNa7Hio
   30jrwnzr551vmPTDVB8SInZ0XW7Lm5sE15tJvcwhqPLYgSw1HQZ56iZbq
   XjzIkIuBQ/4KOkNE6/XQABsS8vLTER7rBMG95GNFIluYCc9CZrHNUtvMv
   k8jev0BN9WLugQdBV3gQJ4ThsqIwQcJ1xO53PSLbLI6aCx+2P05xPfySX
   SWyG8MfrfuOhE/oBNLCxcB4SePGLooI1s9wyoC/+cyuoIcqSUVJIYA45c
   Dj5tnK3d+g0M9HkQk3WKJUolhClQvlPJ7T3ajB9msVOVIcpm0n2JQrN2Q
   g==;
X-CSE-ConnectionGUID: HwKvtN8uRHi1ETIPb1GMtQ==
X-CSE-MsgGUID: T3WD6/N9Sn6Wdf0mJJGNtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37420094"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="37420094"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 18:54:32 -0800
X-CSE-ConnectionGUID: epLXMWzSTiiFvtHkN34pog==
X-CSE-MsgGUID: g9GA/cz6SM69dR5riaepKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107498391"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 18:54:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb9q0-000c3h-26;
	Fri, 24 Jan 2025 02:54:28 +0000
Date: Fri, 24 Jan 2025 10:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_SH4_SIU when selected by SND_SIU_MIGOR
Message-ID: <202501241032.oOmsmzvk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   606489dbfa979dce53797f24840c512d0e7510f9
commit: 2dbf11ec7d3a63ebde946b5747ad6bd74d45adb1 ASoC: sh: Replace 'select' DMADEVICES 'with depends on'
date:   4 years, 6 months ago
config: sh-kismet-CONFIG_SND_SOC_SH4_SIU-CONFIG_SND_SIU_MIGOR-0-0 (https://download.01.org/0day-ci/archive/20250124/202501241032.oOmsmzvk-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241032.oOmsmzvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241032.oOmsmzvk-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_SH4_SIU when selected by SND_SIU_MIGOR
   WARNING: unmet direct dependencies detected for SND_SOC_SH4_SIU
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (SUPERH [=y] || ARCH_RENESAS || COMPILE_TEST [=n]) && ARCH_SHMOBILE [=y] && HAVE_CLK [=y] && DMADEVICES [=n]
     Selected by [y]:
     - SND_SIU_MIGOR [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (SUPERH [=y] || ARCH_RENESAS || COMPILE_TEST [=n]) && SH_MIGOR [=y] && I2C [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA1
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - IPV6_SEG6_HMAC [=y] && NET [=y] && INET [=y] && IPV6 [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_HMAC
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - IPV6_SEG6_HMAC [=y] && NET [=y] && INET [=y] && IPV6 [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - IPV6_SEG6_HMAC [=y] && NET [=y] && INET [=y] && IPV6 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
