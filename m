Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B575E1AAA00
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 02:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733882561; cv=none; b=EOUnhcVMEw/Resg67Fq7JBBYBQyXfOkdrtC3cyAwWMxLhczTWyNBrp/8jmglnODcPsqZjUA3tLVxtVX6fZMNZgBZcmcPplotNmNOtkm+ajrXHNn7q5URcD8psnWvoGAQtSvVCAcNhvC4oBcxNJivOudAqbBSbvY/RlJOj1aOrF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733882561; c=relaxed/simple;
	bh=Rg9dEN5mIADTmk9B5yacxZMm5Y+GbLBBl+WWd2OAjhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XrqD1GPSoPfcMdw1ULXjduXXMSO2CecsLduN3cxESH9wfLHWyBInpophCGioBI5Tdf7Pe83Sp7zTG4Kj8KwRS7s9iZlUpRY47T7araZjXvA5zMEGfSdYYKoy7gQzgu4xUQXc5U2mkb1NI6xiuxqd2R4TK3q63epAMfZrttuzXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UBG2UzA2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBG2UzA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733882560; x=1765418560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rg9dEN5mIADTmk9B5yacxZMm5Y+GbLBBl+WWd2OAjhc=;
  b=UBG2UzA2y7rQJ00umdBvNq+9020XBDK4+rqCxXA6Fy8PqJtur75YZw+q
   xex0lQ2OCnzQq4l7Qs5QLgDSOiQr8jJ7+IrzE3UutIsykEOOfRp7olFed
   JDAf18r/RgG70fb/F5hylmc6oBUSnoGGM2FUArxY/lIV/zl6wMVD0Ka+K
   fQMnWs/M0ZyWvVzlOmgEj5DVW4Nlzzxh8hKcTVjgl47zCmkRI0P1I3oki
   TfbTgbmqud/N7cUGg3j/Hkw04gvmYF2plEdI+hqx4KeEVW2D5Bxv9uAZ/
   cxnggJCr5sY64yboV72D2iziz6xZV0jEkYGfcGtrDICHfMMUL1D5R9hPa
   Q==;
X-CSE-ConnectionGUID: vx7SheWDTI+icx3QUyfunA==
X-CSE-MsgGUID: r5PmBgVoRXW80lqD5B27qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45630913"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45630913"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 18:02:39 -0800
X-CSE-ConnectionGUID: a//XWO0EQ1iGU/rCUqthTg==
X-CSE-MsgGUID: 6h3udOcSSLSPbR+GTEG3Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95478967"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Dec 2024 18:02:38 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLC3f-000693-2c;
	Wed, 11 Dec 2024 02:02:35 +0000
Date: Wed, 11 Dec 2024 10:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 2/2] v4l2-loopback.c:undefined reference
 to `__aeabi_ldivmod'
Message-ID: <202412110907.DHNHY2qE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   a3f82e653c46a6e972edb5f623ab83190db10758
commit: d30bd179ced57489fd4142f71a97a1f20fb95162 [2/2] media: v4l2-loopback
config: arm-randconfig-r131-20241210 (https://download.01.org/0day-ci/archive/20241211/202412110907.DHNHY2qE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241211/202412110907.DHNHY2qE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110907.DHNHY2qE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `buffer_written':
>> v4l2-loopback.c:(.text+0x8d8): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `vidioc_reqbufs':
   v4l2-loopback.c:(.text+0x2e9c): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `v4l2_loopback_write':
   v4l2-loopback.c:(.text+0x313c): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: drivers/media/v4l2-core/v4l2-loopback.o: in function `get_capture_buffer':
   v4l2-loopback.c:(.text+0x3564): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: v4l2-loopback.c:(.text+0x361c): undefined reference to `__aeabi_ldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
