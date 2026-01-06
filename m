Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F370288AD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709208; cv=none; b=OsnU4tMGYIhRjMM7XXjJ0F15DCC+8w3hINEsKUBg3fz2truiE0Q0hu86aPF1IP8SneyHNaS20F4USeJPbPLx150nACGB2js/tSpWaFVcFnLWzYPEm29f51DR/sFVvRUI6mLDZlhuzvnjWRYczdICPkoWtmxJ0RFh3p+IdWJ4dKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709208; c=relaxed/simple;
	bh=PxYlRKZwJFv0szTDGdH9k0FYyLAEqNgIaUhJJ8Emb7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UPaRFRqQr+e09/gzlOzKNgo7dFrGIQJzA4mJ8dra+0Ef70+AGJ1IRQbsnvpXrhM4Yot2qndG/8+gFZE/Q9n0RPo5s76TEy626NmD4GfaMwNW3xlsghSnzjD33/TWv1+u8NNaeqBZf9vwUspinmyZsXaaTSzjENArbuBidAr9uNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4ghi20K; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4ghi20K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767709206; x=1799245206;
  h=date:from:to:cc:subject:message-id;
  bh=PxYlRKZwJFv0szTDGdH9k0FYyLAEqNgIaUhJJ8Emb7I=;
  b=R4ghi20K3CY7BHGN/dpXpgHAn3QBFi49vxx4+EMczQLCGNo+rHTQzDZQ
   HkgZ5iFdt486+HWx0Mwd2b0chWJVDCuHFHSf4YsMe64MMXrNdoGPqICYZ
   376e+wQw1odIcFUCRoIk6bP5ImXj3bWcDXdlOsSitm453Wb3T2tl4B+Sd
   3H8Pl5XSuGdIhKyUzFqxmlfb9IRbhdx52SzRKP5JeIJX6HEN+izHIiGCP
   DhIGQ54IVK+CZ60yirdz85F3cKA+BsCMaP8pyQEd6sLGX2FuUuIUgOqg6
   iPEE/2idFCynBB4OqACbRtM57190eJb2KGmRORzNQ64P1w2PVF12PDmlt
   w==;
X-CSE-ConnectionGUID: LmLWYCJRSqO6PkN8TqZoMw==
X-CSE-MsgGUID: 7qYF+/83SBef17w2Ldj+JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="94542375"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="94542375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 06:20:05 -0800
X-CSE-ConnectionGUID: FPaiUadtTz2EhDts4Avr2Q==
X-CSE-MsgGUID: skI/zwMjQresHYfUvtVIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="233799681"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jan 2026 06:20:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd7uk-0000000020z-27NL;
	Tue, 06 Jan 2026 14:20:02 +0000
Date: Tue, 06 Jan 2026 22:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3+i386 8/19] vmlinux.o: error: objtool:
 ___bpf_prog_run+0xd: ignoring unreachables due to jump table quirk
Message-ID: <202601062220.W1ZYnRut-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3+i386
head:   a20d624caa8286933eee60458c6992b4192ff9a4
commit: 63e720d1d0189a0d9a81aad89e7a9895b27f8e2d [8/19] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-005-20260106 (https://download.01.org/0day-ci/archive/20260106/202601062220.W1ZYnRut-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601062220.W1ZYnRut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601062220.W1ZYnRut-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: ___bpf_prog_run+0xd: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
