Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0AD2F4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 22:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691793496; x=1723329496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=keh0xLPcKJEPYjXBq0PVb4LJjIz0yP6YBJ9GOLi1vEE=;
  b=f5cEwTik2ku51vfW1KRKw7JMeh5/6LFXovtAP/rmXVwt7yvbd8IUXToj
   4hmfOgJs2BWI0qkdRVlQ2P7aZ4cs4iGm+n3aPbFXFzCsW2ZyNvZGWjHh1
   dAmwwKn0C2l4ej5rxZINoB8eoaHIOLZFi4XwrDNDpU4VhmwSVp5o7mF3C
   56kb9POKwVJF3k2JSc8gWVjQbbP4jHgjBk6oDn9aTRhgkWQA3j70hQdTu
   PoHke4tijZScS2NJtBN9KMlb3SGjTF4hLUaGq5ZU+OsUaaCp8brtaLN0T
   AsdHHF1A3TxypWjtQAw8rHqJ8axIaXTRpv7R6fjw3aBZDTgirH/txlzK6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="356739229"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="356739229"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 15:37:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="735915267"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="735915267"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 Aug 2023 15:37:54 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUalV-00085M-0z;
	Fri, 11 Aug 2023 22:37:53 +0000
Date: Sat, 12 Aug 2023 06:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 24047/28677]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202308120609.a9eigXxU-lkp@intel.com>
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
head:   020f099b296ebdd186f3ece99fd8da51fcc478cc
commit: d9a579535cd0f4623e627c3375781fb29c78692b [24047/28677] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-randconfig-r046-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120609.a9eigXxU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120609.a9eigXxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120609.a9eigXxU-lkp@intel.com/

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
