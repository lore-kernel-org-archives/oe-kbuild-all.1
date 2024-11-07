Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B541DDC02
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730978411; cv=none; b=EBHByc+B7WoK0J4kCxm5oBzhryYPlo+jaaLmb6AWVElGxQj+OXrs2eQEFak0yYHgNIjqIICgRlSzkwGuzucRSypd172btSENyWdcuauHzTnxc2wsCkAWb+56FrzlqR8a257KbEk/ghCLWTTjMKehRirGhLg5S6bzrLHh3KfZHPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730978411; c=relaxed/simple;
	bh=kaWDTn54tYUOkPPmGS4anHepYcasBhJCnYhP9vz5kGY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UExlp2imsp00FWJXwYdlV66KO6JGW/7QpfTjXSOyA1ER43SYmai42EGcKsaDYI//rmY1332CxVOtskI0L1AXxznWal8RNUhu3PQ3Ajp+s22l7xUxEjV8pG956yP5lG6mOaZ2wRPUFCnqvLHybkMBGpvMwkel4DmTe20fyvyzlcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7GMxIxE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7GMxIxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730978409; x=1762514409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kaWDTn54tYUOkPPmGS4anHepYcasBhJCnYhP9vz5kGY=;
  b=d7GMxIxE5XUUuLsqHaQCnLoR6oC/5ZnFliRuDaATon0IahcuzNwxUC6s
   NO2FWT9OwztYZA2UNrwbDlIwpegSxe+3EwFuAStjRFO2R7D+KUBm9dqvN
   QLR6p18GZcfUEs1HXkwkjZE6/2VChOsVTZNBgznMYBvE1zq7kCeq4tNzx
   FCH7Y2Tbgl2bfCn+4K27AZY7xNqKtOdtbdz2hguclWc0SB6Vq1GyOVyR9
   2D+0h3HjudA7B9yWytczgaQTpix/va2xeyIJKJp+ocK40a/NgGuZImcVY
   VZf/Fw1B9Qdk1cpXkqD++mLOI+/vQrptNQNCViM+5aHxwBaf81aic/jFl
   g==;
X-CSE-ConnectionGUID: 27mlNXtQS2O4aqfP4YiPVw==
X-CSE-MsgGUID: XMCqV5C+QPyxbQjtG9Svhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30235883"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="30235883"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 03:20:09 -0800
X-CSE-ConnectionGUID: 6C9QLkpCSIiyl6EGJ7VOMg==
X-CSE-MsgGUID: ktpknP2NRBWt5x6H8HfEIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="89012242"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2024 03:20:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t90YX-000q9e-2H;
	Thu, 07 Nov 2024 11:20:05 +0000
Date: Thu, 7 Nov 2024 19:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tong Tiangen <tongtiangen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7453/16477] mm/kasan/shadow.c:90:undefined
 reference to `__memcpy_mc'
Message-ID: <202411071929.8uoaYBta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   22b613ee43a0f885bbff81aa3cad98b2b8d62850
commit: b991780c836ceb9a479c6c6e385e914b487e353a [7453/16477] arm64: introduce copy_mc_to_kernel() implementation
config: arm64-randconfig-002-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071929.8uoaYBta-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071929.8uoaYBta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071929.8uoaYBta-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: mm/kasan/shadow.o: in function `memcpy_mc':
>> mm/kasan/shadow.c:90:(.text+0x648): undefined reference to `__memcpy_mc'


vim +90 mm/kasan/shadow.c

    81	
    82	#ifdef __HAVE_ARCH_MEMCPY_MC
    83	#undef memcpy_mc
    84	int memcpy_mc(void *dest, const void *src, size_t len)
    85	{
    86		if (!kasan_check_range(src, len, false, _RET_IP_) ||
    87		    !kasan_check_range(dest, len, true, _RET_IP_))
    88			return (int)len;
    89	
  > 90		return __memcpy_mc(dest, src, len);
    91	}
    92	#endif
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
