Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6E921514
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 20:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689193166; x=1720729166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uTF+IuUM88A+oBrr8Sf7WDpPzzY93nhhgMOkWGAedjg=;
  b=FhlMWNFiNioMpD2qFS+PxZ68rgamX/e43GBGNLBvfV9BcsXjhXHRdNXp
   GH3ie4neDWXmDcR6zhHcSRfXmI6SAzI7L6QCqMcQPXv3C+k7NsU7fZQAH
   XfaYqXlCJ3nd3jhnwRW0zxVXKZhl7AvZMDo82y4WTdAxvaxd51SjHG/pI
   6xnxdRxEVdrzSNyBDvyPgnHEe5Vqm37wldWCdpN35DpuFKw4b92slOi2g
   xB7Bkrh+xOMD8QlLj0sNu0eausTqCW8QgzRnYJK+/vd1jKdnEUAw/bHVV
   n32PGrv/gR7WN1FGp8Orsr8Pq01eprEMg/M1RpOjBQ3r/iXEKY3cA3YOi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="451358126"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="451358126"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 13:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="791746137"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="791746137"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2023 13:19:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJgIj-0005y1-2S;
	Wed, 12 Jul 2023 20:19:05 +0000
Date: Thu, 13 Jul 2023 04:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 20/93]
 drivers/char/hw_random/n2-drv.c:17:10: fatal error: platform_device.h: No
 such file or directory
Message-ID: <202307130443.dva6Z9J5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   931bfd077a7b267f99362274fda4f2df5c36b71f
commit: 185cd0fdfe9d03d0e43b3ce12c000624aed92df1 [20/93] char: Explicitly include correct DT includes
config: sparc64-randconfig-r032-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130443.dva6Z9J5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130443.dva6Z9J5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130443.dva6Z9J5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/hw_random/n2-drv.c:17:10: fatal error: platform_device.h: No such file or directory
      17 | #include <platform_device.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +17 drivers/char/hw_random/n2-drv.c

    15	
    16	#include <linux/of.h>
  > 17	#include <platform_device.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
