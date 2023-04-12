Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93275698
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681309213; x=1712845213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kmc4cNuUbt3xlnNiNs1NCFvtp3J1S+L+uuz326xwg5U=;
  b=W9Q+itsgZkuxf+fzepiT9M83SJFZrRaXW1TrOKn0PbljXcuUgvlSiCPH
   UT7G+C9RjS+rS4KHCIMlKlOr0IJLVqQMkRFdRxv/GqTBgFBwYRZreevaX
   YzRkuPQflGzqKA9Pxcl7vI9UFVxpqwAdPcMpBUaB8dP17fpZ9fZtDfoMq
   Wvyf8xYLxeXOkTnhwvjj5XR6hsBhAQmqK44NKnZ2INQ8ss2icVrhQcFfK
   w4tR21vbQTpZ+c/6AOVQuuzJ4aBxdxpeo7WZpY/DMUIJIIjUlgjZ8EK7G
   5C25fCWDKFF+TLcfPvaftGiQYS6rjTxxw/69w+JnBm1O1yck/ENuFsRK3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342666584"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="342666584"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 07:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800355472"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="800355472"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2023 07:20:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmbKV-000XmD-1D;
	Wed, 12 Apr 2023 14:20:11 +0000
Date: Wed, 12 Apr 2023 22:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10178/10976] include/linux/of_address.h:111:12:
 error: 'of_property_read_reg' defined but not used
Message-ID: <202304122211.Sgzf52OW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d8214bba44c1aa6a75921a09a691945d26a8d43
commit: 87b764b15f9a0279991f9518f561d25cab0cf1be [10178/10976] of/address: Add of_property_read_reg() helper
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20230412/202304122211.Sgzf52OW-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=87b764b15f9a0279991f9518f561d25cab0cf1be
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 87b764b15f9a0279991f9518f561d25cab0cf1be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304122211.Sgzf52OW-lkp@intel.com/

Note: the linux-next/master HEAD 7d8214bba44c1aa6a75921a09a691945d26a8d43 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/sparc/kernel/of_device_common.c:10:
>> include/linux/of_address.h:111:12: error: 'of_property_read_reg' defined but not used [-Werror=unused-function]
     111 | static int of_property_read_reg(struct device_node *np, int idx, u64 *addr, u64 *size)
         |            ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/of_property_read_reg +111 include/linux/of_address.h

   110	
 > 111	static int of_property_read_reg(struct device_node *np, int idx, u64 *addr, u64 *size)
   112	{
   113		return -ENOSYS;
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
