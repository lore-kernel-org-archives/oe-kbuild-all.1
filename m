Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4116CAD2C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jun 2024 03:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717299878; cv=none; b=sxPrYFVw4kc6wrbXN/JPSQ8MX7BaP2Y7tA1jrPNrXHEvCwBycDbIwGslLVaNiRiJPEGiIzRPUP5Wpcyv/FJdzhgG1zrUGx4HdJ6HSG4ZVMe+1R22G3irxUiaMrrA+haF+mwb3jlC6n1kmFlb3CxIm74Fzgdt5zwV9Y7V+7S7xT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717299878; c=relaxed/simple;
	bh=K89P/xkUsOLUW7md+G8BTTMvF97Bes8SRqGkcMdhIT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjqWDn/A8z631JA8iXKeVhfeIjCPiBSAEZDBh1WpkML8mJ/BfOaEWbmXTQZmF+Ahpp8jqFelN22lgsxyjfjZjbe95wdGHeyEr9nfbScAdj6LadBj07ysLsXtLDkLSDZ+Lbd4ANxtzyKN4Yh7SIIM3TJOt2mOZ++4cH8G5OX4UYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMXZZiiE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMXZZiiE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717299876; x=1748835876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K89P/xkUsOLUW7md+G8BTTMvF97Bes8SRqGkcMdhIT4=;
  b=nMXZZiiEj6hem9WgvZw81yn4iIF/JeO7gDUwRH4vcpUGWTQ0fjFzO6qV
   WpImLs9i2smhSIWFYPq0Y7JFmZW3O1N5wmT2I818O8Pn61xqGlFFUSUEN
   k5Xq86IKW2ZGbhEGt9weQG4LvzTnEWqW3lgBHDBK0hySBb7zOjEqaDr3A
   MJ8SGpFsQ4egbp9suThS/2LUJ4RlE7ypfLgxIjoYmn8BJG0ShPStTRsoc
   3rkM5K6Y6Gy6rdsYqjKIFs4hBO1NXxOVZTCxbYifQ9WElRq2OAEXHyzRp
   arZL4LekWQiVEQCO8WV7aQV64uFelAtd7pO4mYNypC1dq9NKi0bmeNiRy
   w==;
X-CSE-ConnectionGUID: 7O45OIzCTEuJmKZPBEDuzQ==
X-CSE-MsgGUID: Rssk/inWRiKIENk6UXWjXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="31309739"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="31309739"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 20:44:35 -0700
X-CSE-ConnectionGUID: lyTimgPUT7CZWK4T+vystg==
X-CSE-MsgGUID: tZkHygrRQW+GPkoImXPRtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="41082190"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jun 2024 20:44:34 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDc92-000Je7-1T;
	Sun, 02 Jun 2024 03:44:32 +0000
Date: Sun, 2 Jun 2024 11:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find-and-bit-v6 20/42]
 arch/powerpc/platforms/powernv/pci-sriov.c:6:10: fatal error:
 'linux/find-atomic.h' file not found
Message-ID: <202406021158.uZqQNaDm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find-and-bit-v6
head:   5e71daee3822b67746a0d93189a36722c28470d4
commit: 07872bf286fb7ec07c300d5e9912237ad980c231 [20/42] powerpc: optimize arch code by using atomic find_bit() API
config: powerpc64-randconfig-001-20240602 (https://download.01.org/0day-ci/archive/20240602/202406021158.uZqQNaDm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406021158.uZqQNaDm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406021158.uZqQNaDm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/powernv/pci-sriov.c:6:10: fatal error: 'linux/find-atomic.h' file not found
       6 | #include <linux/find-atomic.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +6 arch/powerpc/platforms/powernv/pci-sriov.c

     2	
     3	#include <linux/kernel.h>
     4	#include <linux/ioport.h>
     5	#include <linux/bitmap.h>
   > 6	#include <linux/find-atomic.h>
     7	#include <linux/pci.h>
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
