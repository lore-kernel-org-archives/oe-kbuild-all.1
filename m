Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1E2363C7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651913; cv=none; b=ZnTdEzXvgkn7pNRY6c9A/D9BIMSmg1Wy34Y/EqqluDAE+qIp5tBsTR10C6pRWraATxbK0d7+gLHqaiHvOLKIU3G4yT7OGH+ltT3tfORYuC37Xp6ngcMnbzHurBNdVIFGegvgFA9/0ktrvI0+6x2mt0gbJUsCIYUKmE9Uek3EJgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651913; c=relaxed/simple;
	bh=ayAelaroOzrF5G05vvsK2JrCQ8DVzTmywpBgkHdL4K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ged25C5Psavk6QnBX73fBE/D52sjTwi5uYeeUzf8FOJWSXjXdbO2oxR1GuDBacGMnGpCURt5ZsDb4fPA//LOk+3t2LoRo39EgDPlXbrQJImpHviPhe5FbyZRj24AYqlGFfST6qK+6tymokAmFfXiArSaEmvjiZyrHf6nXTZ73Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBHVJ0SA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBHVJ0SA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763651911; x=1795187911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ayAelaroOzrF5G05vvsK2JrCQ8DVzTmywpBgkHdL4K0=;
  b=JBHVJ0SAuJTSVCnrxpcgx06h4cmkptWsAU7WWWBrmiW9uPAxlt25v3Rp
   1bQR/Tq0ZfolSmRXobFjmN68H33P67i7TmngOVIi+GlttY28ER8N1gSl9
   w4Du5bJj5i5amJF5liM16ah8k/ZsgAJWnfHi4+4vqaxWJmngAdetTChQQ
   h8uIBqkjvFyaIc2iJgEXesKnQqLXD+QAUqTHdvzbpzI4Y7vttLCs+6knv
   HMa+bS6HX9qzVWOF0HzaQ1mThdGG5/iEDoOqA8E3AIDRA9RjY7S7eX0Uz
   KCuZc7cXSXVhBdn301g18ljN+f5k1Sp0txCUWJYv+GHg53w5INUlxYDKX
   w==;
X-CSE-ConnectionGUID: uABGDyycTcOUFOzPQcYo4g==
X-CSE-MsgGUID: XofTCNijTBiY7ND2EUvhiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76337128"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="76337128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 07:18:30 -0800
X-CSE-ConnectionGUID: 6o1d5qfkRfifJJ3IzBVwlg==
X-CSE-MsgGUID: VcSUuQtmSo6DwS1henTY6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191192988"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Nov 2025 07:18:28 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM6QT-0004BB-2x;
	Thu, 20 Nov 2025 15:18:25 +0000
Date: Thu, 20 Nov 2025 23:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Adrien Ricciardi <aricciardi@baylibre.com>
Subject: [fustini:b4/ssqosid-cbqri 20/24] include/linux/riscv_qos.h:10:10:
 fatal error: asm/qos.h: No such file or directory
Message-ID: <202511202324.kqzxvrSY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   f8bf739ad96594b69b3bf724e65ddf8c25a7d570
commit: 6ef95cee3c96622eb715a3f707edc237f0bbdf89 [20/24] DO_NOT_MERGE soc: build Foobar SoC drivers
config: sparc-randconfig-6001-20251120 (https://download.01.org/0day-ci/archive/20251120/202511202324.kqzxvrSY-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202324.kqzxvrSY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511202324.kqzxvrSY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/foobar/foobar_cbqri_memory.c:10:
>> include/linux/riscv_qos.h:10:10: fatal error: asm/qos.h: No such file or directory
      10 | #include <asm/qos.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +10 include/linux/riscv_qos.h

323bf1bd959da7 Drew Fustini 2023-04-19   9  
323bf1bd959da7 Drew Fustini 2023-04-19 @10  #include <asm/qos.h>
323bf1bd959da7 Drew Fustini 2023-04-19  11  

:::::: The code at line 10 was first introduced by commit
:::::: 323bf1bd959da71b544db59810cec3a50afffe5b RISC-V: QoS: define properties of CBQRI controllers

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
