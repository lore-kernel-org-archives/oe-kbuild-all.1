Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8181168DE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 17:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2Bl8M/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697476755; x=1729012755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eHRsAWrbfvlh85BzIt6vUSgZcx3TNkoG4sevSokR0qA=;
  b=e2Bl8M/haKrT2vp+ISYEuAtceALplrj802/Drab9jPFdBGxJ36GpAMak
   nHpYrLALgcuvAVk/j1NmG31avmxHUFT6amyVLPvFzkfab5k8K/YgLvlm5
   8X/egvtzT/ovBNZ3scZw6fxU8+agRdmx04Bvs8szjoIUZFv+JRakaS8EG
   jeF0Ixe6VehgtDCMVNIC0MS4btRfIXBci9q0DDQQuEvK31y70iJddMaLH
   8Q+AYEDSmn/Sa5oHurS3cGxGEzlnBhDGNI5dHJVsiG8Jtn9P4YTnngiU1
   LcOq5vHYzR6q9qIOnbtVKhT9nszm3th2SU2yrPGtfaCx9KkSikIdFFleb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="389458389"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="389458389"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 10:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872203983"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="872203983"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2023 10:15:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsRBF-0008XA-0e;
	Mon, 16 Oct 2023 17:15:01 +0000
Date: Tue, 17 Oct 2023 01:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/cpus_have_const_cap 13/38] checkpatch: WARNING:
 Missing a blank line after declarations
Message-ID: <202310170158.8iF0bKA8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/cpus_have_const_cap
head:   e8d4006dc24e66105444715d6d5daa244aa2bdec
commit: 34f66c4c4d5518c11bfb7d10defff8f814c9f28a [13/38] arm64: Use a positive cpucap for FP/SIMD
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170158.8iF0bKA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170158.8iF0bKA8-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#176: FILE: arch/arm64/kernel/fpsimd.c:2126:
+	unsigned long enable = CPACR_EL1_FPEN_EL1EN | CPACR_EL1_FPEN_EL0EN;
+	write_sysreg(read_sysreg(CPACR_EL1) | enable, CPACR_EL1);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
