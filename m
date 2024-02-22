Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16077446D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708601717; cv=none; b=diuLXiltGkp6whZiL8wmaiRt7lAWVolwyYtTacCfHktnvVEGNZmAusfTERS8v6w89oO5u1uSOSNsDflKnxtyakmNhvLM9JMl51EP3MJTfLhTorrrYV96rjq4BktzHY9B3vdT1LLBOkBlsVt2K9rObqIwf6aHGO4pIJGNzl6LWts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708601717; c=relaxed/simple;
	bh=trazvE7mG7FAA0KaFtW4Yp71axUAKMovuztXE0ZM77A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RdmLlBbnLVFcMvN8vVktm1eZIeubrCMqSDUbRClQjW4ggXnF6/zeCNNG5D66nWW8z78vvpracXv8IEV7nS7+842Xy8r80newGBp0/mqfpuYKDFAZNpv5xh3QvsEXKRSfAz6GmLtFJhzL8IKClD0Qu548fxw+JYCWij7GAlV7ysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kn42Cf6h; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kn42Cf6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708601716; x=1740137716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=trazvE7mG7FAA0KaFtW4Yp71axUAKMovuztXE0ZM77A=;
  b=kn42Cf6hUznwtk9b8FjA63k//C1AJyAgNBmPY5lhnA/gSx9zob9R3OIG
   9HTMo+nrnnkNLrU/WGkr5XJbn9dTwGY8O3LsYzlFwNqVCqjYITqdNZ8YX
   T0NkbwTULUBSn16RaGqQkk9xt7nxg5paP/ECUBp9nznBn0pdtzTljalvz
   eOuiBfcw+Yjn9jWsCevyjvyrNmF/OkAPrgd8zOgE1jdVGvcE1q+d+UXOy
   86OCb+JYUCNJyF2SPlBL4kpGcuECMMDc6SC7VIJ0ADJLbmgz/R79rJRGz
   t2Jij7XF1Y6pq0mYh2OmAUCgihV/+OdA346uNPW6iRehaHaARUzYnaZD3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14243269"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="14243269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 03:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="10146268"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Feb 2024 03:35:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd7M5-0006Ge-0P;
	Thu, 22 Feb 2024 11:35:09 +0000
Date: Thu, 22 Feb 2024 19:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>,
	Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>
Subject: [cel:nfsd-5.15.y 41/47] samples/fanotify/fs-monitor.c:7:10: fatal
 error: errno.h: No such file or directory
Message-ID: <202402221911.JtULlZQ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.15.y
head:   a5aab01194d8736b0d197129d1202ac94e67ede6
commit: 88586fc1009fee86a38c041aed71d2e51a4f2f82 [41/47] orDate: Mon Oct 25 16:27:45 2021 -0300
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240222/202402221911.JtULlZQ8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221911.JtULlZQ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221911.JtULlZQ8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/fanotify/fs-monitor.c:7:10: fatal error: errno.h: No such file or directory
       7 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +7 samples/fanotify/fs-monitor.c

   > 7	#include <errno.h>
     8	#include <err.h>
     9	#include <stdlib.h>
    10	#include <stdio.h>
    11	#include <fcntl.h>
    12	#include <sys/fanotify.h>
    13	#include <sys/types.h>
    14	#include <unistd.h>
    15	#include <sys/types.h>
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
