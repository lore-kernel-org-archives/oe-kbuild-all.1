Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9283205
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 22:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675637145; x=1707173145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BlZ8PuKRi1LgunT9QR51Xqzb1RDyZnEwWV/sZQ9V2UI=;
  b=XoCm+aWQZ9n3ah1Ia11Y16GNlKDEGzvi+oJTkkGwREwg6zPPE8LA9OlN
   GhbvBj/yfNVqva6CQYEfcT6+dM4ppcgHcVeuHB9ZtHUNLs7hzwgXWeZT+
   BSXSUtK3yQvFaXKiy45CAfAMGBYMYKKxsQPJiGceCPclhgfV5VxGH80Tj
   fzZshYJ3Plh0LisN2PQBzavxFpQ6szgziURracrQ7QtfTrVKn66CMLPXE
   G9BkqPovk08JPp8FD3uLOAKE9W5hvmCix/k2ZxJNZ78LbHhDvlf5uibVS
   XDx2e5D4aD9wStCy4v6D2rQZSa22gqFy1/HD6bnijYgEkCT002qkh3WbD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="356450575"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="356450575"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 14:45:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="698672347"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="698672347"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 14:45:43 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOnlR-0002GH-0m;
	Sun, 05 Feb 2023 22:45:37 +0000
Date: Mon, 6 Feb 2023 06:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: ERROR: modpost: "__ld_r13_to_r17_ret" [lib/zstd/zstd_decompress.ko]
 undefined!
Message-ID: <202302060657.M1Bw6XxF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4ec5183ec48656cec489c49f989c508b68b518e3
commit: 7416cdc9b9c10968c57b1f73be5d48b3ecdaf3c8 lib: zstd: Don't add -O3 to cflags
date:   1 year, 3 months ago
config: arc-buildonly-randconfig-r005-20230206 (https://download.01.org/0day-ci/archive/20230206/202302060657.M1Bw6XxF-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7416cdc9b9c10968c57b1f73be5d48b3ecdaf3c8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7416cdc9b9c10968c57b1f73be5d48b3ecdaf3c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__st_r13_to_r18" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r22" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r25_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r18_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r24_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r23" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r19" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r21" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r17_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r24" [lib/zstd/zstd_decompress.ko] undefined!
WARNING: modpost: suppressed 7 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
