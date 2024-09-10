Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28EA187325
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725958867; cv=none; b=ABJ5srCydf6C5rBJuexq3Omjktd4Oi7m8hjxZkqNCiq+N+smZuD4x7V8I109ReoAxtYXd23o1SMVKlCyKqkzj90NmL9Jd9o1VClRqXz06cSjGTbY9Ce7C7CPu69K9q8SOIbkHoCvzCKWNG/HJOTzJ6n6bPbpWHa37Usuy5kXmkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725958867; c=relaxed/simple;
	bh=BGZl869YqdVt2s1wmK1hshko6HG0cHTa/7jN6hXioCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mQ3E1JRNClJ3opeypuKiw4Jk0DqYvr+/55Aeeo78YA3QaPpVKKLedHAXqM8CVXTuh6fHd9NBY/tVoMk+tniwgThFZT6P7tXmoK/NjCH6ovyyT2p5+JwEhbtGphTRxLjoWrNpHwGbFNOIvuMQvdnksWzjNNea2ve2xRszvHmXuM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNdDbBBD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNdDbBBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725958866; x=1757494866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BGZl869YqdVt2s1wmK1hshko6HG0cHTa/7jN6hXioCw=;
  b=SNdDbBBD4MQD2ktGNjsvN+COHD405cJHvqou2gDox5/LOhT593szlq20
   +1IDmL2h/aWUn3FyRXKGV8HHMc4iWg0A7CszpvuCX5suyx8spqu7ILBoY
   yXl5Btu400ZfAVFtnJFJYbfj1Fgwuk75E6tWwNjlpPOVhwTV7i3NaX6yr
   fhQ4aGsGJNdLaL1oMN3xQnZ6+a/ydFtrZWCm9UGzmcpnuQQ0cYBjqFRuz
   VZFitExxpqERmJO5VVk/P/xEBge6TgfXgfB2ogdkttBYnOw6rASDe2Mhd
   cr0RIBW5tsOrnIoZvzIZTjCkOZfpMcBj7fmGaG9gqkekJ8EH1ojAfSixq
   w==;
X-CSE-ConnectionGUID: i4J6ATQPShej2tPngDtCTg==
X-CSE-MsgGUID: YPuyLDljRNGXSTxW36KknA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35358902"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="35358902"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 02:01:05 -0700
X-CSE-ConnectionGUID: 35S7HKWdT42X5G3lo17cmg==
X-CSE-MsgGUID: 50H18zViQK22x2pm9INtZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="67208325"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Sep 2024 02:01:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snwk9-0000KB-2v;
	Tue, 10 Sep 2024 09:01:01 +0000
Date: Tue, 10 Sep 2024 17:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip 18/31] kismet: WARNING: unmet direct
 dependencies detected for AX45MP_L2_CACHE when selected by ARCH_R9A07G043
Message-ID: <202409101628.fbP1QhtP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   d5cc54849a0b793a2413dcd5f31b45d9907066ab
commit: c868ba37129f941bf55e6e20fd666f1bc3a27ad7 [18/31] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
config: riscv-kismet-CONFIG_AX45MP_L2_CACHE-CONFIG_ARCH_R9A07G043-0-0 (https://download.01.org/0day-ci/archive/20240910/202409101628.fbP1QhtP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240910/202409101628.fbP1QhtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101628.fbP1QhtP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE when selected by ARCH_R9A07G043
   WARNING: unmet direct dependencies detected for ERRATA_ANDES
     Depends on [n]: RISCV_ALTERNATIVE [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]
   
   WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
     Depends on [n]: ERRATA_ANDES [=y] && MMU [=n] && ARCH_R9A07G043 [=y]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]
   
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
     Depends on [n]: RISCV_DMA_NONCOHERENT [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
