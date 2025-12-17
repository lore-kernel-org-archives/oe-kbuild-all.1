Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8044F33C189
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765969295; cv=none; b=TWYS6xEQhycMnl2LVNeXTcRxqf51a/lB1Ibi3GO8NKROOb5ONI20J7dPAze2hKR6B5qZqC4VFpLlpGkSM84B+GBzel4uEI94T4QR/sfm+RCtRJICMkNpD7g5UDEOQb1jc7RjLhQJw6M5LAgz8vrvSiPTK/uc0Q+j//gjfIZQfr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765969295; c=relaxed/simple;
	bh=8uPAb+4tEjJ5Tie7lGnsuxgSJvewmRC4wROq4wTawRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Db0O3RvXzFcp3A9IZjYDTe4sVHdvoZRlOFssWqyvT6Rztw0XjCqH1Jt1TZvP2IK8AY2e3wAmFdlxwnClqqD0ZpJQrug05U3AyOLacr33dE/xOFc8wpUfhki8YlrugynkSnBnDnC0Fn2oeIxX/ExAaaEvZPD/uPwbnBPWwXsTXTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkGckaOM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkGckaOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765969293; x=1797505293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8uPAb+4tEjJ5Tie7lGnsuxgSJvewmRC4wROq4wTawRI=;
  b=OkGckaOMWNjqZwtFI793O06YK0XTZUygN/e6AlcH4vDp3KbnhQksqb34
   bJqlTBCmzORyCj3WvSPVaAXSeECdJ29nEQRKgvyVanRzK9iHQmSip/xwU
   MZuyOfzBzK7TBEejmAxc+nRutlCZG5cJiEfqme88Q/07nDl3aVA4zkFSZ
   JTGeVnFAvPvY5xIKzUY5/KbU6ZmTeYCdBYkiCJfuu52RwHdkmpkzawQvo
   zHUEtw7wgehCS3cB6h28u6HFW1QtDIKUDyIX/FjY6FrPzpKrUhdr+UGqA
   QaKrNnmSKxLN5+r5HkkI2cHEj4BOxgIYheP9nkQd6IU3V2QUcVNCsMnvl
   g==;
X-CSE-ConnectionGUID: nW0ev/9oQferZXqDmT+BkQ==
X-CSE-MsgGUID: QGCbalJ6QKOg1DwjALko7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78542705"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="78542705"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 03:01:32 -0800
X-CSE-ConnectionGUID: Yu4q+UBLR8yknExQPAfNNQ==
X-CSE-MsgGUID: CLY7ho0VQ+Kofrc/I7manw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="197369900"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Dec 2025 03:01:31 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVpHd-000000000Qp-1qnO;
	Wed, 17 Dec 2025 11:01:29 +0000
Date: Wed, 17 Dec 2025 19:00:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] arch/arm64/kernel/mte.c:197:13:
 warning: no previous prototype for 'kasan_hw_tags_enable'
Message-ID: <202512171836.yBRRn9Sz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: b5347f340a2b370346ce24b82dbbf6f8c0657567 [2/2] UPSTREAM: arm64: kasan: mte: move GCR_EL1 switch to task switch when KASAN disabled
config: arm64-randconfig-003-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171836.yBRRn9Sz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171836.yBRRn9Sz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171836.yBRRn9Sz-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/mte.c:197:13: warning: no previous prototype for 'kasan_hw_tags_enable' [-Wmissing-prototypes]
     197 | void __init kasan_hw_tags_enable(struct alt_instr *alt, __le32 *origptr,
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/kasan_hw_tags_enable +197 arch/arm64/kernel/mte.c

   196	
 > 197	void __init kasan_hw_tags_enable(struct alt_instr *alt, __le32 *origptr,
   198					 __le32 *updptr, int nr_inst)
   199	{
   200		BUG_ON(nr_inst != 1); /* Branch -> NOP */
   201	
   202		if (kasan_hw_tags_enabled())
   203			*updptr = cpu_to_le32(aarch64_insn_gen_nop());
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
