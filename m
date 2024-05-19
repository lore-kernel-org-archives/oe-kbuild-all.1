Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D78BEA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 May 2024 12:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716123457; cv=none; b=YpdNxwBCX29am2rH/3a20J90quQb1U7d3sY3haUe60HyEn2LPEtZAmDRV+ZIUe6dZV165OhRd8gkUZ614hAL9xcUocje6LM2uitlhhhGU7u/lB+zfpbPZBSK1+uZM46pEUm6Hbrz4k3kgxxzmLhqtSawXveoKtEo/PNv5vMTD7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716123457; c=relaxed/simple;
	bh=mw158NR9ZEHqfg2fW6qsGFLUb89TlfjM0S/O76NpRgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fCdadUj5UvqlOAlI9wc4BsDcWl/HgnLehS2nyTeg1ZmskJj4cfBkKKZoiU4Tm3IvYY5fSCL1OBxScqtr8xvTY0+T/UeUCbWAfrzgulYq2TgH4Y8V/R0U7H1A+9c73qiT4JbWIFoAXy/7k8jkzSTYXG1leXJ7cRJaRCrm2TpFAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hot/TTaT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hot/TTaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716123455; x=1747659455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mw158NR9ZEHqfg2fW6qsGFLUb89TlfjM0S/O76NpRgA=;
  b=Hot/TTaTrOM+YBdcr3BUQ3tKo5l2KRH7oz7/lTDxwvMcIJmJiJBM2VSE
   sx5DwBbyvVxsIypmyhro7nZ5F8t8EZ1ZQz47ML81E3YM/yZi3rLBBQ9U+
   JJEyP3sS6pCPOySZ75UcG91VRy276oGvPlhRlTum60cP1xa2sn02kCXMp
   QhDHVK79TNNwEqOoZgImAN9tPqeohrkhhBhpa7wRQ4VFF87bSFpoJvRn7
   wQe3ZTA9rvwrcVR5FlrElvjVVq1xIZrP1gxO6vvh31sTUv65Opp3OQBXj
   lQr7Uakyo9coO4ohMKDDU336YFCLcKcPnkHUIb/xXO7EybNv1x+76MD6a
   Q==;
X-CSE-ConnectionGUID: 5V24/Fa3RqeXKTIaVp+ngQ==
X-CSE-MsgGUID: nzPSuIlHTti6B1TVVm3ZJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12099292"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="12099292"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 05:57:35 -0700
X-CSE-ConnectionGUID: VgWClamCSZGUKSwoCWfKWQ==
X-CSE-MsgGUID: DLpl1gjBSzGbgkqGpGzqMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="32173767"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 May 2024 05:57:33 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8g6V-0003e4-0U;
	Sun, 19 May 2024 12:57:31 +0000
Date: Sun, 19 May 2024 20:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2_key-2 5/6] tpm2_key.c:undefined reference to
 `look_up_OID'
Message-ID: <202405192044.qRoS7ya0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2_key-2
head:   f576cb4d2006cb2edd425432dab8bc97df63720d
commit: 43a5881d4fd3804353c06034ce9901947e067b41 [5/6] KEYS: trusted: Migrate tpm2_key_{encode,decode}() to TPM driver
config: loongarch-randconfig-001-20240519 (https://download.01.org/0day-ci/archive/20240519/202405192044.qRoS7ya0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405192044.qRoS7ya0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405192044.qRoS7ya0-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/char/tpm/tpm2_key.o: in function `tpm2_key_type':
>> tpm2_key.c:(.text+0x510): undefined reference to `look_up_OID'
>> loongarch64-linux-ld: tpm2_key.c:(.text+0x574): undefined reference to `sprint_oid'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
