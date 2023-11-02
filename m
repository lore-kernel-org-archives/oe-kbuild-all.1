Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049962110F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 18:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P84znkbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698948951; x=1730484951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8vcqu7QPgjROB1Pk3eDjg1orL0VkfW09STK4mQVDXrg=;
  b=P84znkbidyfVA8npa16x9bkBbk3DY+CXJgpErseiyn4Ebg2TwZHbVVYU
   zWXdynxcCPkTR+IcdAOJcNwTXDKxXf5V6zdrjEmTKcmap4q7eFijFe4d8
   4uQEMxgo5szzLZ4NM7qwNprZ5ize8+C0ZG6piDaiBW5rWq4YdYRetJA9s
   xzSXElwqOtz/Ngql4whV4UEx8kMkvJs7xf5UhU0LduyIT1+kMnxcb2Si0
   ZbDM1XiOcPgGWc5tsZzfO1AYlRI9JhHVTpecNfwiPux10ocX7q/lHqXDF
   zWqN7xYFHaFg2kZcDHSPpwhyiUvi29SlfzJ7+a8RQPKbkSPzIukmutvAN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="419888246"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="419888246"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 11:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="737842898"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="737842898"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Nov 2023 11:15:49 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qycEN-0001kq-1D;
	Thu, 02 Nov 2023 18:15:47 +0000
Date: Fri, 3 Nov 2023 02:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 24034/30000]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202311030247.gePzM1zK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   d4e78df6f2fc1f0d9d21c3602b0e435118a5f909
commit: d9a579535cd0f4623e627c3375781fb29c78692b [24034/30000] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231103/202311030247.gePzM1zK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030247.gePzM1zK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030247.gePzM1zK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such file or directory
      11 | #include <asm/archrandom.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 drivers/firmware/smccc/smccc.c

     7	
     8	#include <linux/init.h>
     9	#include <linux/arm-smccc.h>
    10	#include <linux/kernel.h>
  > 11	#include <asm/archrandom.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
