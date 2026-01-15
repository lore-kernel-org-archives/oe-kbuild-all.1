Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE536A02C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768473300; cv=none; b=nd4lzq4xXcmMyh51Krjn9Zyk9bIvWsoC1MetSFAcsrzqKuvcEQPqp/APoiInWI8GUiLczCSDgDhTkbRgu2stm/adXAw9gJvtw59SzO8GK0Bi/qwstmGquzWj0XZoIAHi8zgX4DhLlTfYyjtNttO8rBg3ulitJV91G91vk7ro94g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768473300; c=relaxed/simple;
	bh=mkt76RUvRJEn5btJnxhDFAOMDeRpdSrsk51rNuvwzO4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sU3dxkUhl+viFfeW3DxPJ+tyYbW6bzXCX9+j64Bq62Lwt5LhN8Oz4PNrVLFHt4rwcuqN0Vt9OYdCNLZQeNO+pBxX2exe3aucHnU3Au7Z1LnxSvaDwNuyJnL+86ddQ+fLkPWLPbyGOjoIVUm7tS4RLw/lbnO6PdonRU+rAIw9XtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTtaE41Y; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTtaE41Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768473300; x=1800009300;
  h=date:from:to:cc:subject:message-id;
  bh=mkt76RUvRJEn5btJnxhDFAOMDeRpdSrsk51rNuvwzO4=;
  b=LTtaE41YZSSx0+O3vyJ3fOlZKC3sG6TyNb+Gd20CNqvSeodUeWJlJmct
   VhReH195wACDHFXc7ubYef40HFq7Szh1KI75FiSZwqWt9bwP2wrLPiP9I
   fgoPsjOCDKAaiBY08X7RVaYeh3g2BiJcs47v0/CTiZakYTRCfAFlGYA4z
   qmbmFv00ZmC2qQrKeO2V3dGm/uuP5mkLezoL4AGVfTRgB9cKI4c7ojPO6
   PF9eISGZrk3BrhX3+dkezP2jbvXgZhiKrWco08gbu6Losq5sQzaNTXmXM
   CGmZt5qjdBM6NZF4f+2P0QQ7i43EnNP4XxE6LrNQJD6PvlklNoQ73OciH
   g==;
X-CSE-ConnectionGUID: 8QPjX5liR0y4zS8OW4fJKg==
X-CSE-MsgGUID: xczBJTgVTbq827aZLpT1Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69692927"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69692927"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:34:59 -0800
X-CSE-ConnectionGUID: mYDQ04KeSbu2xqQI6dooew==
X-CSE-MsgGUID: NXdtDPYjT4eGIeNRbbUTDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205334880"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jan 2026 02:34:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgKgp-00000000Hqi-2Yxn;
	Thu, 15 Jan 2026 10:34:55 +0000
Date: Thu, 15 Jan 2026 18:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-restrictions 16/16]
 register.c:(.text+0x980): relocation truncated to fit: R_NIOS2_CALL26 against
 `io_register_bpf_filter'
Message-ID: <202601151824.92HyDTlw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions
head:   29ac83fe2b009e9bc007cc44ea21832a904be4fe
commit: 29ac83fe2b009e9bc007cc44ea21832a904be4fe [16/16] io_uring: allow registration of per-task restrictions
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260115/202601151824.92HyDTlw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151824.92HyDTlw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151824.92HyDTlw-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: io_uring/io_uring.o: in function `io_init_req':
   io_uring.c:(.text+0x7d8): undefined reference to `__io_uring_run_bpf_filters'
   io_uring.c:(.text+0x7d8): relocation truncated to fit: R_NIOS2_CALL26 against `__io_uring_run_bpf_filters'
   nios2-linux-ld: io_uring/register.o: in function `io_free_restrictions':
   register.c:(.text+0x14): undefined reference to `io_uring_put_bpf_filters'
   register.c:(.text+0x14): relocation truncated to fit: R_NIOS2_CALL26 against `io_uring_put_bpf_filters'
   nios2-linux-ld: io_uring/register.o: in function `io_uring_register_blind':
   register.c:(.text+0x980): undefined reference to `io_register_bpf_filter'
>> register.c:(.text+0x980): relocation truncated to fit: R_NIOS2_CALL26 against `io_register_bpf_filter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
