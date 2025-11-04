Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C0C1B0F23
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 00:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762216000; cv=none; b=IVovNi1jp9Pzt8vgowah4RknpLAEyxrIKm1n5XKz+ce+gdH0KN0vvTmPj0gOhuQzwCbP5Aqy3JqzfoVrzcTjbfJ9If9rRUC2lZVi5fRfOKYLGaueAzXX8lOTnJUamreCmYQbIURAeVl7WmEShOZZ6O6orgQzPiChsWnQZuihocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762216000; c=relaxed/simple;
	bh=7VtOk+l1KzIkcjDpEzysoP/mmq8ICfm3pYZZI/Z8TME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezC5NH698y0WiXb72zrlHfqKwYzQLMURyeWidW7yG3JeWxdTxGp7sphgyhoKGZlazf4AwISwVCA2lVgxkirxKDAdDtWZxiAZ1qHIE8h1Orn4z0w2kCe4OMU31/lBjPntj96lPyUvO457GfJWDLawIlhcbmToYuhNEwBlDEKGNQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5lXA70P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5lXA70P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762215999; x=1793751999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7VtOk+l1KzIkcjDpEzysoP/mmq8ICfm3pYZZI/Z8TME=;
  b=g5lXA70PZlcoDvm+yrDL4G6dqNHQA4XtighPaHCAwyEffGyrkrB08iRC
   Aez5sUXXAcwJ5bP0hFJjVgV+/zQydE98RNFJx1QssoQpIWkkROT/mn5yA
   NASrfaUuclVK8/mqQnGI7hDfZEx+GofktkGROh+wJeuswmFxqDUNfT5nQ
   3cftOSIpA/Yl/+PDbTvOE9HhNFfHXBdHzQbvya9U92V7NyneaA0vR5CwM
   UHhDUT0K3aFbf9YLmRHxO8PYRIDuX6q+RyfGfYLA4K5gakC5TJG3ldTpx
   ha6xo8CqQjfq+9sGXxknvZFAVzw0PvzWTf8DUYtPGe5ahvFQaW6+znI5t
   g==;
X-CSE-ConnectionGUID: 3W31iX77QJuDl0uBMeOAZA==
X-CSE-MsgGUID: ZYjmkZGQQwqK5eegsWlyTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75653969"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="75653969"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 16:26:38 -0800
X-CSE-ConnectionGUID: HfaZHcmsSWSgRXBfmuDsvQ==
X-CSE-MsgGUID: mH87W9X/S12M7jS/NoNFQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="191323219"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 03 Nov 2025 16:26:37 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG4sX-000QfT-2f;
	Tue, 04 Nov 2025 00:26:31 +0000
Date: Tue, 4 Nov 2025 08:25:43 +0800
From: kernel test robot <lkp@intel.com>
To: Varad Gautam <varadgautam@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against
 symbol 'abatron_pteptrs'; recompile with -fPIC
Message-ID: <202511040818.lT806PAp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6146a0f1dfae5d37442a9ddcba012add260bceb0
commit: 8327bd4fcb6c1dab01ce5c6ff00b42496836dcd2 asm-generic/io.h: Skip trace helpers if rwmmio events are disabled
date:   6 weeks ago
config: powerpc-randconfig-r123-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040818.lT806PAp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040818.lT806PAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040818.lT806PAp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against symbol 'abatron_pteptrs'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/mm/nohash/mmu_context.o)
   >>> referenced by head_44x.S:212 (arch/powerpc/kernel/head_44x.S:212)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0xbe) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'abatron_pteptrs'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/mm/nohash/mmu_context.o)
   >>> referenced by head_44x.S:213 (arch/powerpc/kernel/head_44x.S:213)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0xc2) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against symbol 'start_kernel'; recompile with -fPIC
   >>> defined in vmlinux.a(init/main.o)
   >>> referenced by head_44x.S:224 (arch/powerpc/kernel/head_44x.S:224)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0xde) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'start_kernel'; recompile with -fPIC
   >>> defined in vmlinux.a(init/main.o)
   >>> referenced by head_44x.S:225 (arch/powerpc/kernel/head_44x.S:225)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0xe2) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'critirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:251 (arch/powerpc/kernel/head_44x.S:251)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x106) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'critirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:251 (arch/powerpc/kernel/head_44x.S:251)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x10a) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'critirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:254 (arch/powerpc/kernel/head_44x.S:254)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x286) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'critirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:254 (arch/powerpc/kernel/head_44x.S:254)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x28a) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol 'mcheckirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:256 (arch/powerpc/kernel/head_44x.S:256)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x406) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'mcheckirq_ctx'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/irq.o)
   >>> referenced by head_44x.S:256 (arch/powerpc/kernel/head_44x.S:256)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x40a) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'init_thread_union'; recompile with -fPIC
   >>> defined in ./arch/powerpc/kernel/vmlinux.lds:134
   >>> referenced by head_44x.S:109 (arch/powerpc/kernel/head_44x.S:109)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x52) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
