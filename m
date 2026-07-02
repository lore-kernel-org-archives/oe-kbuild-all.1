Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5351A267
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 05:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782970997; cv=none; b=mDeaQ0nlwLioEhske3zIDYGD9fL2QaaoHmP4WjnjBIPfgmwQ9w9w4i7kQugwT9ulP51tvsMR89oSWw4Yks/iheTWRENJ4MXqUDaSAexUzfnUw8z2g1aDpEY2ISgz7kUP9bhHZSEyu/kW+XG0DKfvKvwkf9lui95xhECPWvbNoow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782970997; c=relaxed/simple;
	bh=/awCFuOC7QyoY6ShBdxujacf9NbM9fwN+afUZsUEKo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EB5J/SWSfw43t7BrCoXy+mxdZiIlP5QvLSAJdcJ5f2RhCmc/9l5SMOfCVFwk7FeTVHGMH2t/C7tNbr2O5vdNOHT+VBW3iCkg/doyeflmhOJojeHKyuX6pTJV3MCPZQbecEeuacnw6kkUN3eSt8wFZjA6byXujjI/BcRVxNZnoI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GsyqGVYS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GsyqGVYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782970996; x=1814506996;
  h=date:from:to:cc:subject:message-id;
  bh=/awCFuOC7QyoY6ShBdxujacf9NbM9fwN+afUZsUEKo4=;
  b=GsyqGVYSaWutEd6m8SCJAj3jW57l7Pvj/jNiiRvletnJ4DrCl5WkDV3r
   d2nmjzbUJMgG7JaCmRq45lv9vzUn+lNCzSaO1tvXijm7IdFNoNjpiAHx4
   oweSFk9pqOh1VCEoHw6Nk6/+I4fzELHAr5M67duiLKwl4M64hVvPug1Kd
   SYPHcsjFkgIP+6STNZGdgI8NZYu7BF+s7DIVUIaOoNZdtYCG3AxfST6MZ
   uhCRhK3SJQGHB0SI6xjjzkwakZlLKywmo3i8LHhK+3MB7tXa35CUVSHhY
   IASD631ssR4mQ0IdccSdVFZCYEVLpmMpSMfovGr9WgOPe/Q8sKkfSXYfY
   w==;
X-CSE-ConnectionGUID: cMJMiVp9REWTGHzfAneDcg==
X-CSE-MsgGUID: D1LUqj5lSDiGXCZSjrYnLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="95093432"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="95093432"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 22:43:15 -0700
X-CSE-ConnectionGUID: F8ytQucvSu65TtReby/4og==
X-CSE-MsgGUID: Y+U5gCjbSOS7/rzA2386xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="282834221"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Jul 2026 22:43:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfACd-00000000A1n-2SCw;
	Thu, 02 Jul 2026 05:43:11 +0000
Date: Thu, 02 Jul 2026 13:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] Warning:
 drivers/virt/gunyah/rsc_mgr.c:158 struct member 'adev' not described in
 'gunyah_rm'
Message-ID: <202607021305.PpkyFg8E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Elliot,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   e344d519d93fa6f51e7c3886a3ee4f7c044191a2
commit: 96f4587757641b28c77ef6a22d7303cabd726864 [2/2] ANDROID: virt: gunyah: Add RM info struct as alternative to devicetree
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607021305.PpkyFg8E-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021305.PpkyFg8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021305.PpkyFg8E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/virt/gunyah/rsc_mgr.c:158 struct member 'adev' not described in 'gunyah_rm'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
