Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8762FB6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727542648; cv=none; b=dMu67QyvZG1gJMgz9n+m8S0Vbh6UVBOieSJPBD1Cc/tHHYxW2fpT9MkfcXAZccCsgBpzuCHRh4RHqER/pFR2rfx5XYiQII9CnrkL7yrbrU3TQqLVisT+nENlzF4KjqWMLv0SZvFu4g+kuGpOoqt3YF4AP+hj2q8R6zxBrkL4jwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727542648; c=relaxed/simple;
	bh=jPM61uS5s2PXekrmCEnQPQ2yx6/mcSinK6vm3o/INUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ePNGzJubOYM15FlyfIKPnNWIOa3WdvhXqE2bRZ7BC/JUGiIhoQbCU1s3GO7k2qS7FneRgp0/8WXgpRz9ugLG/Ox5WwMR2mWX87uq/GmirNDh3cV4PgrmB2uDCyWqIAtwB/skT0IkuMxFetuMjCCtwVXsVgeEwmN07h/MB84WrBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKrtbIna; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKrtbIna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727542646; x=1759078646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPM61uS5s2PXekrmCEnQPQ2yx6/mcSinK6vm3o/INUs=;
  b=hKrtbInaFYgOj3aw1QYXHJkw47J/Exh/bD+OsrbNT7KY8LU2E4HRyDNW
   pTJ0TDvzi3GdTmyhijSNKXHqTgqO4sdLDp1T/UCAByUZ27VCeNZgQuJ7P
   jD6jtNMbfexLvfNiAaLUKuDXG0Qw/XxPXTV4FzxIK1sX2YB8E3asuYdSj
   fEw0jvPJDWzQ2hAO60qGRcOr2QdJi3vmet1Vf3B6uy2GaUZL0uGdkXwQ8
   pvcSvEAqS/wdpmxBbTa3a/sdxg0xVHmrzCN0IWd7goqXCMt3gGN8KnGuS
   1CjNsSyq7gGz5EUcIzzYXSJ6df5rqLfuWxr3mdZ5iPcWVOCQlQ2ATpJ6R
   w==;
X-CSE-ConnectionGUID: KGN59vjNRbas0pT0azUECA==
X-CSE-MsgGUID: hGJbaJ7HRtyZjSHG6au1+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30560878"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30560878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 09:57:26 -0700
X-CSE-ConnectionGUID: +TjyyTZHRuOoK/AJIoj2+g==
X-CSE-MsgGUID: ZZzhbfxVQQ6cH0nQ5WPQzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103631451"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Sep 2024 09:57:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sual0-000NTL-1L;
	Sat, 28 Sep 2024 16:57:22 +0000
Date: Sun, 29 Sep 2024 00:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3890/16788] ld.lld: error: undefined
 symbol: linkmode_support_c73
Message-ID: <202409290041.57gQwYfv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: b31734ed047209625878436aeceabe94ce902904 [3890/16788] net: phylink: add support for managed = "c73"
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290041.57gQwYfv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290041.57gQwYfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290041.57gQwYfv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: linkmode_support_c73
   >>> referenced by phylink.c
   >>>               drivers/net/phy/phylink.o:(phylink_create) in archive vmlinux.a
   >>> referenced by phylink.c
   >>>               drivers/net/phy/phylink.o:(phylink_validate_mac_and_pcs) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
