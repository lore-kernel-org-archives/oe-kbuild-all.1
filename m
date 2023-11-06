Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182B1A50
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 02:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZpgs7ug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699237656; x=1730773656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2GJpYqysQuTF5tqL/b1VeNnpS+0M2mXiG2Sc6wszklQ=;
  b=hZpgs7ugViBsEEvruzcq9+/f3sfPNCwpq6ofivl92zbgBN9JZ7D+Kzz+
   aEJQ0r9x9fGbU/bk989y0+l5heeGtxv7YOyUDqiFBTUbAm8mlf/vuNtRM
   IL+BWAHys+BVmc6v/1inEbIozlUdLubQWzrW4qQQra5RyWz0Gj+l3ffv/
   MzJNwxgQjvdVvVquuC+ddpoazm5+1bTdploaTObNvBJJrPNzcYKsmZN9S
   wFZi6Fng9qehk8nv/FnybXQRN8fH4I+R7b1zik9J9EDYYGZnjaVjKWVvk
   xHHrRD9S5W/izTSKZBUoF2gMUMeFQFBqWLVWsMMkNBGn3vcE+l6DnRxMX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420310409"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="420310409"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 18:27:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="885760713"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="885760713"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Nov 2023 18:27:28 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzpKn-00060u-2U;
	Mon, 06 Nov 2023 02:27:25 +0000
Date: Mon, 6 Nov 2023 10:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Lai <justinlai0215@realtek.com>, kuba@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, andrew@lunn.ch, pkshih@realtek.com,
	larry.chiu@realtek.com, Justin Lai <justinlai0215@realtek.com>
Subject: Re: [PATCH net-next v10 12/13] net:ethernet:realtek: Update the
 Makefile and Kconfig in the realtek folder
Message-ID: <202311060957.C85OYvxq-lkp@intel.com>
References: <20231102154505.940783-13-justinlai0215@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102154505.940783-13-justinlai0215@realtek.com>

Hi Justin,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Justin-Lai/net-ethernet-realtek-rtase-Add-pci-table-supported-in-this-module/20231103-032946
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231102154505.940783-13-justinlai0215%40realtek.com
patch subject: [PATCH net-next v10 12/13] net:ethernet:realtek: Update the Makefile and Kconfig in the realtek folder
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060957.C85OYvxq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060957.C85OYvxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060957.C85OYvxq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/realtek/rtase/rtase_main.c:68:10: fatal error: net/page_pool.h: No such file or directory
      68 | #include <net/page_pool.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +68 drivers/net/ethernet/realtek/rtase/rtase_main.c

db2657d0fa3a98 Justin Lai 2023-11-02 @68  #include <net/page_pool.h>
db2657d0fa3a98 Justin Lai 2023-11-02  69  #include <net/pkt_cls.h>
db2657d0fa3a98 Justin Lai 2023-11-02  70  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
