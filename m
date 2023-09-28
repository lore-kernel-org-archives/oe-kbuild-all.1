Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D141134CDC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 10:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695897083; x=1727433083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b3Xtw+ICEZYJPbeIS4LH2iZNvfVlli050cv1cck2ZsQ=;
  b=YLfst5bqGp8MIuGy0Xh3MlIzwmXfuZ0xDU5PUHHJbeJcdS3ynpaeNXAk
   yKbfXfuoI38vV9b8pGyjxML5o+SgGffruqEiTyqXPcFtwuqdg3KhccNBn
   E0WSnH0eZaJxr5lwuzAGOyixZfCkpWB0rcPKmB18nYPzwiV0bAH3UwLeV
   12frLQvJou4t1f38QzU6nko0At67C6RvLVI7Uw9SfJLhmDc5Ud4XCtVy8
   s99fvPljIIEyuJG9vUb1Grt1UWBPBG5wuq1QaQv6TzgYIeW9b7p79/9eq
   TgdGu7NbtycSGpT41fbBt9PfRTMA0m3M6GIZFiiDoZZdJxycChaoKZUIA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="372386815"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="372386815"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 03:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752920517"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="752920517"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Sep 2023 03:31:21 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qloIh-0001MG-0I;
	Thu, 28 Sep 2023 10:31:19 +0000
Date: Thu, 28 Sep 2023 18:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Yadong <yadong.qi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	"Huang, Yang" <yang.huang@intel.com>,
	Tomas Winkler <tomas.winkler@intel.com>
Subject: [intel-lts:4.19/android_t 3105/30000]
 drivers/char/rpmb/mux/key.c:32:19: warning: 'get_abl_params_addr' defined
 but not used
Message-ID: <202309281803.CWWdeHN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: fced89f01cbd53f1af13b9219b0ad57d64225a3c [3105/30000] rpmb: mux: add key retrieval for RPMB multiplexor
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230928/202309281803.CWWdeHN9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309281803.CWWdeHN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281803.CWWdeHN9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from drivers/char/rpmb/mux/key.c:10:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/char/rpmb/mux/key.c: At top level:
>> drivers/char/rpmb/mux/key.c:32:19: warning: 'get_abl_params_addr' defined but not used [-Wunused-function]
      32 | static int __init get_abl_params_addr(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~
>> drivers/char/rpmb/mux/key.c:21:19: warning: 'get_sbl_params_addr' defined but not used [-Wunused-function]
      21 | static int __init get_sbl_params_addr(char *str)
         |                   ^~~~~~~~~~~~~~~~~~~
   sh4-linux-ld: warning: drivers/char/rpmb/mux/.tmp_mc_key.o: missing .note.GNU-stack section implies executable stack
   sh4-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker


vim +/get_abl_params_addr +32 drivers/char/rpmb/mux/key.c

     9	
  > 10	#include <linux/module.h>
    11	#include <linux/init.h>
    12	#include <linux/kernel.h>
    13	
    14	#include "key.h"
    15	#include "key_sbl.h"
    16	#include "key_abl.h"
    17	
    18	static ulong sbl_params_addr;
    19	static ulong abl_params_addr;
    20	
  > 21	static int __init get_sbl_params_addr(char *str)
    22	{
    23		if (kstrtoul(str, 16, &sbl_params_addr)) {
    24			pr_err("Failed to parse ImageBootParamsAddr\n");
    25			return -EINVAL;
    26		}
    27	
    28		return 0;
    29	}
    30	__setup("ImageBootParamsAddr=", get_sbl_params_addr);
    31	
  > 32	static int __init get_abl_params_addr(char *str)
    33	{
    34		if (kstrtoul(str, 16, &abl_params_addr)) {
    35			pr_err("Failed to parse dev_sec_info.param\n");
    36			return -EINVAL;
    37		}
    38	
    39		return 0;
    40	}
    41	__setup("dev_sec_info.param_addr=", get_abl_params_addr);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
