Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3380837998A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 21:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773782027; cv=none; b=AdKLNbcIE0RWolpQp6upE4fVzD81fQdAtJl6dVpohA6nJni8ZHSXwW9HS67vPMt/DEHA7jpMbwHKFtnGRhZDGJNzCBibHzVAHEiKmjuTWAPslI2LN6RD9OmVffjKNjE/SNw8aJvG7fc7fdCKOjRsV0SCFwqMPONjZhaeB/bQ0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773782027; c=relaxed/simple;
	bh=A1fi8trEw7yV048vKFYiitv1L5o1zDoFC29fqQgA/7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jbRiQJPKyGI3cG58KTp8qIUEe5LzvG9mCR82xCZwVEMAzGKd8yt2+6pdBH+WZDedsWh23xSEi/opLgT+jPTzN3byWnm1OMlKnVodmQ2jZT6elov9XNAI7Ryuh7RbETW2eWeCJTKCJhXLfVnGnJIc8MWTWN+4v9HKtsRqab17ZAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=II4tpHd/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="II4tpHd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773782025; x=1805318025;
  h=date:from:to:cc:subject:message-id;
  bh=A1fi8trEw7yV048vKFYiitv1L5o1zDoFC29fqQgA/7k=;
  b=II4tpHd/ewjj0p9vw5/kfNHgw/V2tnxRCP/I5s5oXnsJ6iGSpgXVV+pT
   S3z85uHBQtoVA+tLkN+pfHsfMd/boF/QfVweWTJvkCUFINEQ0Ywmu2QK0
   fUSitknsVdusGQRkLA+G3UQ7QS6ry2wsCPawkwCHVxEHMEB1V6VUbmCnr
   fWv+k5/RjQsnCnx++sRymIUtWjx7RdmYdqzZG+gBQZ9nQ6GXoCGqEEmBK
   3cszCxhkbhmD8QTI3glZSCxaUkJkESN3wILi5vqSV6kipaxsEAOC9EJMI
   UJpOd+XrchzkuwJQvo3Bk3wn/n+6fCzNB+Hqe5f+R5VCaeB9TEnUHmCPq
   Q==;
X-CSE-ConnectionGUID: Kr+dZp0KQy2xOWViE+2MyA==
X-CSE-MsgGUID: +lMMJH7vTlqC0SyeLR5Mlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85143723"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85143723"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 14:13:45 -0700
X-CSE-ConnectionGUID: QWl9RLNLSzabtILgP2iJvA==
X-CSE-MsgGUID: NYat1DlpQLCyVryCP89/7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="246995254"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2026 14:13:43 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2bjQ-0000000020H-3dvq;
	Tue, 17 Mar 2026 21:13:40 +0000
Date: Wed, 18 Mar 2026 05:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/gpu/drm/i915/display/intel_dp_tunnel.c:6:10: fatal error:
 'i915_drv.h' file not found
Message-ID: <202603180556.KCJCUH5N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Imre,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   84a08aae07bb37efecc7e53784d0f13af15a374f
commit: 58ddeae369465978bb68daa9937ebb3dac413451 [1/1] UPSTREAM: drm/xe/dp: Enable DP tunneling
config: i386-randconfig-141-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180556.KCJCUH5N-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180556.KCJCUH5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180556.KCJCUH5N-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp_tunnel.c:6:10: fatal error: 'i915_drv.h' file not found
       6 | #include "i915_drv.h"
         |          ^~~~~~~~~~~~
   1 error generated.


vim +6 drivers/gpu/drm/i915/display/intel_dp_tunnel.c

91888b5b1ad2fda Imre Deak 2024-02-26 @6  #include "i915_drv.h"
91888b5b1ad2fda Imre Deak 2024-02-26  7  

:::::: The code at line 6 was first introduced by commit
:::::: 91888b5b1ad2fda3f4c6b8de5dd42dbe8b90ac2c drm/i915/dp: Add support for DP tunnel BW allocation

:::::: TO: Imre Deak <imre.deak@intel.com>
:::::: CC: Imre Deak <imre.deak@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
