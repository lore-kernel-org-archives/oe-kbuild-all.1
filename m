Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954DE15C9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 03:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714273269; cv=none; b=Obyof1o6GKKGSSwzk4tvW+RBsIWUro2sdml8gnNBGFb7GTd0PW5T39GjW7kkTsxuJ8nvdbHFiHD3xqqRMTo8aK5vbM7Dhl7qbTHLMD4lSCPJKq8US2+oKO5BkX4j+++HKkhJ8X7xvLxUVSFOVm5k0YAQEPV/vduqZO1SF7SiPvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714273269; c=relaxed/simple;
	bh=23nnS/p0W3kFOBOxidLptCF4kG6bXz+gzhg4Wd6ulp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HofprKLEp3RqANm0Pu2XXul8jtt+GRiKXZD+6uPjaiR9t8Cv7lXyLGOPsIckjZfYt8lOzv10N0XsGPcQdxMYw8S9EFZOD7itS7yjzkn7JntaMwe770aBx9mT9trXGfQoAMqGIwBbut9cBvzvb1MlUi4Fu0n20/PrukmCuU9cBQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hM/3pQ7n; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hM/3pQ7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714273265; x=1745809265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=23nnS/p0W3kFOBOxidLptCF4kG6bXz+gzhg4Wd6ulp4=;
  b=hM/3pQ7ndt5KR0r5z5MDTcyFEkYCq1ORwKDtASMmfBZaSrIgQj9H+E1I
   ssDzp7Qx1VrgxMGm1b6dcyNzlFE22DvSg1pJWbHXf+6OUrCStczQMdG4u
   Pt0J9PUKnYs89SIk1yhk2WvjTo3eLb2GOlzVfGPSzaSB9o/bjZ+HpFQ0J
   k/CDTWNtCFTnFPJgTIiuZDwD7A6+lSAp8W7aqH/JmbE7PO/j76ZYyMHfs
   8Ca6vCAyfD1Txp5O6aegiw0EA974369aMYMiq2x5Gxk/p0qucV3epdL2b
   gI6OmAKtGGB1DuGSGUT3qEqwUiJyO9NVI7yeMRseXhyVpG3MOQZpBsuvg
   g==;
X-CSE-ConnectionGUID: 0qixNHSZSRGHZVIN4KRyxw==
X-CSE-MsgGUID: L4A1pdk+STSSZSHd6oCtbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27422531"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="27422531"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 20:01:04 -0700
X-CSE-ConnectionGUID: LhL3DDLoS2SxLqtO6br6EA==
X-CSE-MsgGUID: BxSfF9gWRGOhGjmD1oiUQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="56973812"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Apr 2024 20:01:04 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0umj-0005m6-04;
	Sun, 28 Apr 2024 03:01:01 +0000
Date: Sun, 28 Apr 2024 11:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 2665/11728] sh4-linux-ld:
 i2c-flexio.c:undefined reference to `flexio_writel'
Message-ID: <202404281030.3l91oBsB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 28f7ee66a10609525341c91f1aef06e8548f994f [2665/11728] LF-8343-2: driver: i2c: buses: flexio: rework to use mfd
config: sh-randconfig-001-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281030.3l91oBsB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281030.3l91oBsB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281030.3l91oBsB-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/i2c/busses/i2c-flexio.o: in function `imx_flexio_i2c_isr':
   i2c-flexio.c:(.text+0x218): undefined reference to `flexio_readl'
>> sh4-linux-ld: i2c-flexio.c:(.text+0x21c): undefined reference to `flexio_writel'
   sh4-linux-ld: i2c-flexio.c:(.text+0x3bc): undefined reference to `flexio_writel'
   sh4-linux-ld: i2c-flexio.c:(.text+0x4c4): undefined reference to `flexio_writel'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
