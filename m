Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B598D26CE3B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 02:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766543446; cv=none; b=Jlncy9V8g7aj4QBC0BoBV41AaH4nLysI+wl1n9/eXqoIexr6X0kcfcF2TFlT+hKQdxHJFBZWihXIvmHAe/YEJaNeNKZGuCdkq3gfH3q5DnMxA7Wz9YAk/lC4ZF2M50J3OLVTkgsbzNpTVwq1GGGfd3TK/ICipGEOm4if3+ETh2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766543446; c=relaxed/simple;
	bh=dBM2XemX+nu84Fh8Sz/kTWT19Q2tv/0upZ46zvWFOkU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PTLPBxnZ+OLdCK3tIKfC7EEeYVok9qa58D2aWQsxY23k0TzTLTwfFffuFXj3ivdJa3LPNtaN6TMU4P4WmRWv3qtHt6tLXDIzywAeo0T/Ib2t1+p2m7rDHE3YaxEqOIxHMiXtcz1cRWlbeEbWxCUwdo28pBAvvVbwSOgWXJWIiCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJB3yscB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJB3yscB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766543445; x=1798079445;
  h=date:from:to:cc:subject:message-id;
  bh=dBM2XemX+nu84Fh8Sz/kTWT19Q2tv/0upZ46zvWFOkU=;
  b=oJB3yscBV4Li25kBJ4FBNivgeB+G0GMJIEi51FAf+gEUzcEFdwFSH1zs
   5o0zb3rcSnzWooEJ0xLPAIft8/3IKHXbJ8gJUJBtxD1cm97yf9/ZnzdaD
   uWAhsPe1r4xn04YCev6xoJxJk+tNW5P+DDAn0dFHw9JMIBn7ryPSr5KXJ
   E6tuN66WhpCOAakrtkwysDo4p81UOt0U0W0hrUaEdUoEM2BxPF97DoSzN
   IiZK8P++Lg2MLFAb3mFvEJNEWBbg3AMawFfZwLgJAq9zGSdX4OxgOJIuQ
   TEt+/defsuA6uuyrCjPjrucmhRHGss8KdzlvpK+xnF+ePEEhI7yfxP3Sy
   Q==;
X-CSE-ConnectionGUID: rmgTA4csTbuOJ0uLPeycJA==
X-CSE-MsgGUID: xLDRVORhSZCAWj7FZmmpHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68433983"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="68433983"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 18:30:44 -0800
X-CSE-ConnectionGUID: Olu8UQRuSjOR984quB8aTw==
X-CSE-MsgGUID: Hfq5mxNVRo2tWspNWlny1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="200211067"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Dec 2025 18:30:43 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYEe2-000000002af-3N6S;
	Wed, 24 Dec 2025 02:30:37 +0000
Date: Wed, 24 Dec 2025 10:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] Warning:
 security/smack/smack_access.c:650 function parameter 'label' not described in
 'smk_import_valid_label'
Message-ID: <202512241032.211brIyC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   70c2b455c56de02cb2af8676c611516155cbe597
commit: cf008f5bd3d5db210d1edd244e7cd1d879cb1a5e [2/2] smack: fix bug: setting task label silently ignores input garbage
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251224/202512241032.211brIyC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241032.211brIyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241032.211brIyC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/smack/smack_access.c:650 function parameter 'label' not described in 'smk_import_valid_label'
>> Warning: security/smack/smack_access.c:650 function parameter 'label_len' not described in 'smk_import_valid_label'
>> Warning: security/smack/smack_access.c:650 function parameter 'gfp' not described in 'smk_import_valid_label'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
