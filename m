Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742B2A935
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 21:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681336477; x=1712872477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yu0r1HUDwvkkkFHvh8gHu28JvpA5snRQx5ktJBSc9w8=;
  b=f/oQuVfSQRrMy1H3tM1igaU0CiWZu9PM5gB+3IM+ZDJQFRAp31uaS58K
   RdIypBqm7Xg9U2jr2lQL7L5EA8Xb4neQaqOaQhvIX9qGEvVXsmMZMRd9E
   J17/5j4QSRCu4BnQJ5PJNfCvn+HPSN6Zi+a9UE6lNAUnYOU2hMvei9gek
   LlzuqJlzgB3LvJBQ0FJ+xNzycTimr1NVDKlAwM/haxYVUMXlXkUyRnlMo
   F8zq66JG5u6W2bv7FqlBCjDIKHcFSxAR2od6HIpK/MohAnMeUFWHhUuWh
   Liq/7nF8aKtZGo7Ip3M3pQ+ulKLlHDUlMMWZxKAmP32pkt6Qb2eWVKMfS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341522886"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="341522886"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 14:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="863477654"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="863477654"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2023 14:54:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmiQ3-000Y4V-2b;
	Wed, 12 Apr 2023 21:54:23 +0000
Date: Thu, 13 Apr 2023 05:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Gal Pressman <gal@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	Eric Dumazet <edumazet@google.com>
Subject: xtensa-linux-ld: section .start VMA
 [00000000d1000000,00000000d1000007] overlaps section .image VMA
 [00000000d0003000,00000000d100bbe7]
Message-ID: <202304130556.wv6Mc4BM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bcc4025550403ae28d2984bddacafbca0a2f112
commit: 48cec899e357cfb92d022a9c0df6bbe72a7f6951 tcp: Add a stub for sk_defer_free_flush()
date:   1 year, 3 months ago
config: xtensa-buildonly-randconfig-r004-20230412 (https://download.01.org/0day-ci/archive/20230413/202304130556.wv6Mc4BM-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=48cec899e357cfb92d022a9c0df6bbe72a7f6951
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 48cec899e357cfb92d022a9c0df6bbe72a7f6951
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130556.wv6Mc4BM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .start VMA [00000000d1000000,00000000d1000007] overlaps section .image VMA [00000000d0003000,00000000d100bbe7]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
