Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3B71D88AC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 17:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731863583; cv=none; b=Pvary3aKcDaMkNrLlZqvzHDzPES3qoVK4u91+gTMcJ8NsZ7BMzBZH8KI+JNL9NA6hLhsHVwnpwnE/GcaZL+mh+NPap6RCfK/itknH6foUyTVDYaPqX0sadr9LqNsP1bUn5XL+np7xvXftfm4f2fdttWI2NB5Gni/sXcA7gpID1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731863583; c=relaxed/simple;
	bh=8PUPNaiw4sYCJPv8+toGQIR+uEAefp7ieGb/cxpVlLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dRZ6/xsde85nZbJv6Si41VsQDCKsasEqbA8H20BckZdDI5MkuH1mFHIRfFG1uDpME2cF2BLJbFDJJWjm1HP6+QPZXjx6VmX+UuiUH1h8PbKvfZ2Tkdoz6k32Fklj6OeCixpdgJLDGdPZHRxhyTaofbOBRVHSUfXnMAX/9ZxEGIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYShgDfR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYShgDfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731863582; x=1763399582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8PUPNaiw4sYCJPv8+toGQIR+uEAefp7ieGb/cxpVlLE=;
  b=XYShgDfRna1I1hZF1dR3Y7cxJ38fxydvV+dv0fX2Egk8LQaXr2A5OtFE
   XxKpDqPeKcolJCPR6HTgWuLbjp8SKE2PLIa8cZMFgGKo5L6cjF3+k0NgT
   q9fSZ3PodugeqqNwZwVVnxKcT3fenhtgQmWSZo2V7Op8daeRdQXHCcNfS
   oSqk67goqbcpEUp6OQxh3GypR5dLZJUKxVItDLIrlaaWi3v96EGG5JNJ9
   n6YPaOr7RfDPocyFfBTqjIGdQkiCDPolRdN9+5nghXYb9nTiAQC/hjSyN
   eG/Mn+7gOfsuHBLnSRBFbljj0CxV9Ez2idYH4lDbx/ggtk8qbxrusK+W8
   w==;
X-CSE-ConnectionGUID: shA7/jB6SvatWZ/Bw+qskw==
X-CSE-MsgGUID: cIHUPRokQbKr4CZ6EagJTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49345802"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="49345802"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 09:13:01 -0800
X-CSE-ConnectionGUID: DHLzlANqRqKlnLxgAfMjPQ==
X-CSE-MsgGUID: bHOB63eATum96YYbmYn7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="93472942"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2024 09:13:00 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCipV-0001xn-2S;
	Sun, 17 Nov 2024 17:12:57 +0000
Date: Mon, 18 Nov 2024 01:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 19/23] drivers/fwctl/cxl/cxl.c:
 linux/auxiliary_bus.h is included more than once.
Message-ID: <202411180139.qt4k0KMT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   e4450fb1459bf712009c7cb1461643287e0f9e75
commit: cd685083320fbb36fbe7973406d5001962699335 [19/23] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180139.qt4k0KMT-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/fwctl/cxl/cxl.c: linux/auxiliary_bus.h is included more than once.

vim +6 drivers/fwctl/cxl/cxl.c

   > 6	#include <linux/auxiliary_bus.h>
     7	#include <linux/rcuwait.h>
     8	#include <linux/cxl/mailbox.h>
   > 9	#include <linux/auxiliary_bus.h>
    10	#include <linux/slab.h>
    11	#include <uapi/fwctl/cxl.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
