Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014AE14BF92
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 16:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771086643; cv=none; b=ogAlSque8rvaPb6mdtZQZAYZJl+RuffhcyVvqLf0bIJ2C5SaidjoWwLXADCJ/kRLKq9omQpxErh/t6orP9hBIDV8VEUfPu1idI16vZ89Hk4rKltyvLjS4xsXW4VS9pD/UKeJ5K/ivCH5xgjBD0Ri4pEPouZD7IZjLv9/yGqVli4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771086643; c=relaxed/simple;
	bh=4HXT3am0G4E3hAus85DGrtM9v8kJyl7HUrmLy3rWrr0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aK2FI5zSPy5OW5TOxysedRxMfqxuwyknaVaqETuMB3SM2V0Us2XogTs/Zu1m+ybThOB71tM731LDgo/g8z6sDtToDSqTS7fagTyzYVwPdTF74AxxUWRK74UEUctZKCe82J/gSwLyA3UstDvjSoWxGfSZI7Fw3aqhMyEyfqnF6Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xpm0LWe+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xpm0LWe+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771086641; x=1802622641;
  h=date:from:to:cc:subject:message-id;
  bh=4HXT3am0G4E3hAus85DGrtM9v8kJyl7HUrmLy3rWrr0=;
  b=Xpm0LWe+Hy6zVg3TyiXjwi7uLvhtI3eumayH4ISBb7KAd+nAhdXH1tnU
   rs/vN3OKoC6bV4F3YCvn4knrgJXyCbeiQziLOJzTg8KFVCxHPBDkC0RDp
   kOBuIGK3ThmtBxEoiOc6NHMXwhrqHs2Xd7r6kz3PAOhFBU20qFRp+m26I
   41Sxl7xecegOtfJW4JA10i7PWbxC2CZAqyMuOfzyIN8gEIs4TPQXtu8dl
   0ljQRY1e67agLi5KGhXh3sTpA/VBsW1ufa2GMLAnn/HZ/QXI+rHqpUct9
   DKoBhGTQnWci0z3i7BsQLmieHCOHfphXreBlWXd8yJ9Zh3rLFpRvS56SK
   w==;
X-CSE-ConnectionGUID: wR6SHIG+TS6lzWZHL1QDqA==
X-CSE-MsgGUID: RNwuImEiRcSWeiJB0ZiqRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="59812305"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="59812305"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 08:30:40 -0800
X-CSE-ConnectionGUID: E4Oj3PYXT76XOGrisH2OpQ==
X-CSE-MsgGUID: eM6uUtGpTxio173AUfAk7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="217743543"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Feb 2026 08:30:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrIXU-00000000wji-1V9F;
	Sat, 14 Feb 2026 16:30:36 +0000
Date: Sun, 15 Feb 2026 00:29:51 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/firmare-acpm-counted 3/4]
 drivers/firmware/samsung/exynos-acpm-dvfs.c:53:40: error: implicit
 declaration of function 'ARRAY_SIZE'
Message-ID: <202602150012.MgXN6flQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/krzk/linux b4/firmare-acpm-counted
head:   c446778ac8dbd96a1ec1a82ad39abdabb80594bf
commit: a185cddcfe370dc12ac5ddeafebeb7a57bd42563 [3/4] firmware: exynos-acpm: Count number of commands in acpm_xfer
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260215/202602150012.MgXN6flQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602150012.MgXN6flQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602150012.MgXN6flQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/samsung/exynos-acpm-dvfs.c: In function 'acpm_dvfs_set_rate':
>> drivers/firmware/samsung/exynos-acpm-dvfs.c:53:40: error: implicit declaration of function 'ARRAY_SIZE' [-Wimplicit-function-declaration]
      53 |         acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
         |                                        ^~~~~~~~~~


vim +/ARRAY_SIZE +53 drivers/firmware/samsung/exynos-acpm-dvfs.c

    44	
    45	int acpm_dvfs_set_rate(const struct acpm_handle *handle,
    46			       unsigned int acpm_chan_id, unsigned int clk_id,
    47			       unsigned long rate)
    48	{
    49		struct acpm_xfer xfer = {0};
    50		u32 cmd[4];
    51	
    52		acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
  > 53		acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
    54	
    55		return acpm_do_xfer(handle, &xfer);
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
