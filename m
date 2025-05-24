Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B63A1E9B0F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748101151; cv=none; b=PolrLd+duVonCmWWAFKoXqotN0gwmxBr0dI2udCM1tOc5F6/5G/HSBZz1/FqLfGcQztdu1xVf7Yedw52uSkvSwlfBh707E8qjK6yUR4+KjYXoL8oOOBY/Yj/+T8HfkoIIf9HOCeTeeaVbI0o0J9bCKJP2ij94rnpz1BwAsdFtdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748101151; c=relaxed/simple;
	bh=u4XSGRnLEUanTUMgLZrRbN8B/Ef+K49xO9FzMu6B6V4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNcS2ZvcWDFpRxoOMPCou2GscV1j58HHTHVPXAqD8sNDkzwdCPijpXtSb4h20BEBknMCJKYhCVh36Y9YN7PtheipfH4XfcwHRDTpO3Z7HwL8/iN0LEJOVbIfEVpfYPtcrzYjbWyIP2opuFAIvqNa49AUVw/7zaZY7vrNGQR5JWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5xsX3rR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5xsX3rR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748101150; x=1779637150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u4XSGRnLEUanTUMgLZrRbN8B/Ef+K49xO9FzMu6B6V4=;
  b=I5xsX3rRe36761vSn4DVp5gZR0PKWVeNbbXbAYwtoO61bblVlhkFOFOJ
   8b+WAmmm0969Q+O/kiv/S01kmam/7vRU/BKhprNwOs9pkS2niVa6X3Y2m
   2gkYOx8vXpXzGBfMH2HCMDgIkKoDNGUOIC9C5pXyrGs0rxR8RAxB4m//D
   WUHsxlTUuAQ+1hgEkq7E44BPgcXa/z169wRKnPXX5S/YTdQTD9aMh31N0
   h+SOHLcfVBQoADGpF89Wkd586O1xVMQzkspaimSaLLGydLcYvgq6jDhmC
   8jihO7YTL2fEmPEfUBUiSkoaaLr7y8fF+Z9gail0BHaTADo/iGr3/psfa
   g==;
X-CSE-ConnectionGUID: ziKebxYFTQ+UJ6vfov/0cQ==
X-CSE-MsgGUID: 8mbBZy1tQrOPKShnJ+gEhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="52758541"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="52758541"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 08:39:09 -0700
X-CSE-ConnectionGUID: hzskz309SsOuVP8+UQ/A2g==
X-CSE-MsgGUID: 9fmfJO2xTqyx50SNKTNB1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141655776"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 May 2025 08:39:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIqxl-000RGm-1r;
	Sat, 24 May 2025 15:39:05 +0000
Date: Sat, 24 May 2025 23:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	John Haxby <john.haxby@oracle.com>,
	Somasundaram Krishnasamy <somasundaram.krishnasamy@oracle.com>,
	Dave Kleikamp <dave.kleikamp@oracle.com>,
	John Donnelly <john.p.donnelly@oracle.com>
Subject: [jlayton:uek-localio 1973/2262] random.c:undefined reference to
 `crypto_alloc_rng'
Message-ID: <202505242313.R7hj1vQD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 345ccdb1d656e0a0035d39fbb4bed4d211d74c55 [1973/2262] random: wire /dev/random with a DRBG instance
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250524/202505242313.R7hj1vQD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505242313.R7hj1vQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505242313.R7hj1vQD-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/char/random.o: in function `get_random_bytes_user':
>> random.c:(.text+0x1b70): undefined reference to `crypto_alloc_rng'
>> aarch64-linux-ld: random.c:(.text+0x1b88): undefined reference to `crypto_rng_reset'
>> aarch64-linux-ld: random.c:(.text+0x1ba4): undefined reference to `crypto_destroy_tfm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
