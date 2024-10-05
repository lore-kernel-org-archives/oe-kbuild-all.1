Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD49F288B1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728150445; cv=none; b=ah8+tgOT08xQfE9xhhuAnV2euQgJbpOfehrMKcs3Y/rgUTKM2NAZUDtYHN79+ZXQu9WeRhSYYIxl3YSnB+8LzWJS1zcS9oS8yubRPIBP/cOfkWfUHEbkwsTk+DVdGD0D47xwQZy1zGttywhgDcSPk6y/6KW3R7Bdivm0UJwmhZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728150445; c=relaxed/simple;
	bh=xp9n2K2VcnZKWZXS+5cSmALcBw8kxWNa82QceuFu1ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tgid8oFpY4HNiu65idaxeG0Y9RK2FnR7c44FwCzDJxlHrwh7/72HJHphbF1c3efJdOlemIcGrxR240NO9/BXwQff3AC1H/gYMuUR7vp97eD6RgaxGa7isGHmMy0tFvEreWxnEV/z7PiAf+GONLs5B5fsp+WnlT06jbedEF3pCr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjVp0g4B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjVp0g4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728150444; x=1759686444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xp9n2K2VcnZKWZXS+5cSmALcBw8kxWNa82QceuFu1ho=;
  b=jjVp0g4BMez9bRLvGJ/mrsk7uAsVPPkBi5/UdN7XTyUuVvcdmBWUfOFg
   Fhf0E9njTtfF2PU6Qg9ZX4fdD4QZ1+aeCqq4veGFmXKp5esHVXinzv2nD
   76JDEw59Ya0BEQAmQ/EU/LsneueykedrpxiYu1U9ebCitAIkr4FMj259J
   NajLnU+loUmZokkldcaWOm12xG4aDHGLzNvGONzRZ/A7wpLko7datxYbL
   7HPnVJDIx3f4Vo7DxYaFjM7RsdSD+g4S3bXOrJoj1Pss66we2nx4oHlX9
   pVXJ1j4VmrJNGT1vsYNWQPhQN8Jq7Z1t/WDUog5BYQuwmVmFRXMwq8F+1
   w==;
X-CSE-ConnectionGUID: +OF3+UJKQGKqWJH/AL1Q3A==
X-CSE-MsgGUID: E2sUiB5WTh64TtOeyKNapQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27160785"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="27160785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 10:47:24 -0700
X-CSE-ConnectionGUID: QY/gB5oPTleBqQ7D+krU2w==
X-CSE-MsgGUID: mTAeDYl0QtyYB9lc73xeaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="79003313"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Oct 2024 10:47:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx8sC-0003E4-0p;
	Sat, 05 Oct 2024 17:47:20 +0000
Date: Sun, 6 Oct 2024 01:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 19/23] drivers/fwctl/cxl/cxl.c:
 linux/auxiliary_bus.h is included more than once.
Message-ID: <202410060126.YpzV62Sh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   2eddaade7d83ea112f18e4ea87b7071a5eed936b
commit: e861ebf8800c69649ebf74364ac2777536df5a23 [19/23] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060126.YpzV62Sh-lkp@intel.com/

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
