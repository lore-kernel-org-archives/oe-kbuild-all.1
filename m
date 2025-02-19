Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6201A8F6D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 04:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739939512; cv=none; b=YyokXjxYgIXw8pW+K8LqjcQAKZQkQ+W9/vay+R7rfgs8r+V6xUDLIM1a0osKNvhrqID7AIjWSoz/6hZEwaxdA+TooNWGRPJ2bpX6bBzTeYzO8svOEsLKSG76wk+AQJWc5xHmntYOcICDSXrmzt+C7o0pZHUNaEgdGpph4KTmahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739939512; c=relaxed/simple;
	bh=0lDwXtXS5B1vIK1dcvWzAmE9Y2fg22dUBUAze/upILo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fyTKRcCE2Fg+/N5g8WD0l+Wk2IQ8RNJt4X30n2/wY1syoU08GNr3N0QmXp+aKiJaMMzvva7Lrn/T7QoApFOYGNyVW9AmHjGYly+41HDnhgAbqt04UGbsCP/oXF+oSWH1DhwwMNNbsSP9lpll5XAO3sQUTaJ0OtwYedOiMlzOSFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flLCusDX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flLCusDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739939511; x=1771475511;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0lDwXtXS5B1vIK1dcvWzAmE9Y2fg22dUBUAze/upILo=;
  b=flLCusDX/7HHDGqVJdLBNMlQzRsoT5JNDUVyaSG6uOA3Bg9iaVAGC9qX
   dk3vxSZbFO4e5TroVvlIn881Bu3IDvr9NIY6xc8LZDwCgJL/fqClMeNgr
   ZHcajdRmOHOCAzBag9C4BoCB+23V3FW5Nu/XEW1IoXYY+NURFRpVX+WHM
   lRG+rO1U9V5/l3hlNfWy1NUkvVYNh5R5o1M1ghKKpgy4oPnfE/qT3Rmbi
   dnOeHCK5rwRKXAbA7fMedtqy5LYmwCBs3eeKj442YpRzQTAvSKPBknG1T
   a0fKK5Hszx/dkQwrIGTwJ31M+g2Km3/+oEX9CDNVrMArIW6JxIUmuG4Rj
   Q==;
X-CSE-ConnectionGUID: hRnZeJcGT9qlLXjSmdKDNg==
X-CSE-MsgGUID: NxakVNASTOiugI3Ls5dbGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="52066830"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="52066830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 20:31:51 -0800
X-CSE-ConnectionGUID: 25cS6XhtRXiDo/C//U/TPQ==
X-CSE-MsgGUID: Ee37PxLySJWmeq3HXui3tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="115116513"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Feb 2025 20:31:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkbkB-0001Er-0q
	for oe-kbuild-all@lists.linux.dev;
	Wed, 19 Feb 2025 04:31:35 +0000
Date: Wed, 19 Feb 2025 12:29:38 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] warning: (FAULT_INJECTION_STACKTRACE_FILTER &&
 ..) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL
 && ..) || ..)
Message-ID: <202502191253.0wbc4rkA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexander,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: f369f1486116b0f3e9630a2481addde6854df541 [1/1] kmemcheck: rip it out
config: sparc64-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502191253.0wbc4rkA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191253.0wbc4rkA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191253.0wbc4rkA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: (FAULT_INJECTION_STACKTRACE_FILTER && LATENCYTOP && LOCKDEP) selects FRAME_POINTER which has unmet direct dependencies (DEBUG_KERNEL && (CRIS || M68K || FRV || UML || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS || MCOUNT)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
