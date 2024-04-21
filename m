Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33BF28DDF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 19:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713728662; cv=none; b=EPxQGl2hJm5tffR0/2gP5VLry41VlCXbV4X/tPip2C1e1JJ/GY7hph4en36nrtOOfn5CyUb8F+h1VOg56/3E4gfDqk2uifORpMu4n69/22gLlD3zt6ML8PlgfK6PM2pupABjux0fx0JNNn4hMJ9paRHZhgUhqHWPdKffvgCrYzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713728662; c=relaxed/simple;
	bh=3LZUgoTfWfzVcveAG1QL7m6+ryIVHm3X/3GjFzQ6gQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KY6JuPvlVbKqL9F4K1xbQ5LQ2LfBpRPUMUQ8JOjwsIFHJ3ylchLnZIFMQZOgRjBXwro9G4lPRZ/IUsckPbMQDmit/8aKsl6lp6DzZS0qmCHi3mkAX02+ebM/1GHHz3md5FAGBkLLCZGZ8Ez6iIQMdxvMeMWlJ3aCEuhbNPlOFuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Znbf94P1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Znbf94P1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713728661; x=1745264661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3LZUgoTfWfzVcveAG1QL7m6+ryIVHm3X/3GjFzQ6gQ4=;
  b=Znbf94P1C/8C+2F0k7TbJcAHaKiLOldlDw56awXwjUaFBfylcRyvBBB8
   Uz3JIjNxXJN0c5tulaHog8IHldCKrteVUBhGPNvXnjSozHzaZCNO5vvJ3
   DEvu6fmlZTd8ReRfluo8gvfyQAaJ66OJb/nqrXHngx8nQbVs1e3y4pLpp
   Jx7FJIS3aocneQEwr5GF09ad3Tm94S7Cg40OHCaXfknC3/fjtZansqPZ/
   KmyVnNYiNHmNocapE7f0DBAfrQdIUgZabmNzehrEULowgOlp7PL+o2veR
   918fbBRb/iF+cz4+c2aUcchmcqpNsge67a2E9Bqto2RE2LrtPfSA/I16u
   g==;
X-CSE-ConnectionGUID: RikX3NjeQm2UKfRzVmxAIQ==
X-CSE-MsgGUID: 0iUTYdgiRviu1tX3sJwE5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="9418247"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9418247"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 12:44:20 -0700
X-CSE-ConnectionGUID: BFgiabAMSdC0izfV8jJFkQ==
X-CSE-MsgGUID: CLgFvtRkRNm+ywszmh/Nbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="24429613"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 21 Apr 2024 12:44:19 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryd6m-000C7w-1v;
	Sun, 21 Apr 2024 19:44:16 +0000
Date: Mon, 22 Apr 2024 03:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [morimoto:renesas-bsp/v6.1.86-2024-04-16 118/554]
 drivers/net/ethernet/renesas/rcar_gen4_ptp.c:32:40-45: WARNING: conversion
 to bool not needed here
Message-ID: <202404220345.MjI9JSS8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.86-2024-04-16
head:   cf0a95a2da78ebf959ef2c8b9136a94c665aab2f
commit: 118c5b64106239ab232f9db02f6b9dea51324d91 [118/554] net: ethernet: renesas: rswitch: Add R-Car Gen4 gPTP support
config: nios2-randconfig-r062-20240422 (https://download.01.org/0day-ci/archive/20240422/202404220345.MjI9JSS8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404220345.MjI9JSS8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/renesas/rcar_gen4_ptp.c:32:40-45: WARNING: conversion to bool not needed here

vim +32 drivers/net/ethernet/renesas/rcar_gen4_ptp.c

    28	
    29	static int rcar_gen4_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
    30	{
    31		struct rcar_gen4_ptp_private *ptp_priv = ptp_to_priv(ptp);
  > 32		bool neg_adj = scaled_ppm < 0 ? true : false;
    33		s64 addend = ptp_priv->default_addend;
    34		s64 diff;
    35	
    36		if (neg_adj)
    37			scaled_ppm = -scaled_ppm;
    38		diff = div_s64(addend * scaled_ppm_to_ppb(scaled_ppm), NSEC_PER_SEC);
    39		addend = neg_adj ? addend - diff : addend + diff;
    40	
    41		iowrite32(addend, ptp_priv->addr + ptp_priv->offs->increment);
    42	
    43		return 0;
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
