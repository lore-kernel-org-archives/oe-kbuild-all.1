Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832A75380
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680876242; x=1712412242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z9qTvPgOTqBU7YO9/CR9XPNsqcsOT4bTAsPFk18GhUs=;
  b=cao29FcmmkfPU9O83ckV+x03Nmjkd5FvIMUa9sA3aERwVSofZ0p6pnJR
   H27qhtM+0PEYqKRasGd2UvEL++ZYquuI5nQ9tB5bG2PSOSum4ipti5hq9
   BifvcCT6yzho7WkmqdLqxD4Z4hCH9q9zw89l8+i00p3uUkbV79tSIscuO
   r86MmD07eXYvhIFr7n6s6eSMHsk0zAd4diS5NzITu0yXoVBtaLE11mfms
   qdN6gehSCzk5cHUIu3yim76IGVlG9V0JEtWUbBVFX919OyFo56QRtwth3
   O+3w0mUdsT8x3CIGNhOXTeYjPSsXjRZveHP3nBHPvUKSjqAXDdhd5b0eM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="408122543"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="408122543"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 07:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="637713487"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="637713487"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 07:03:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkmgt-000SZN-1T;
	Fri, 07 Apr 2023 14:03:47 +0000
Date: Fri, 7 Apr 2023 22:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: introduce defer free for cma
Message-ID: <202304072127.DuosvCPC-lkp@intel.com>
References: <1680864131-4675-1-git-send-email-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1680864131-4675-1-git-send-email-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-introduce-defer-free-for-cma/20230407-184459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/1680864131-4675-1-git-send-email-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH] mm: introduce defer free for cma
config: ia64-randconfig-r002-20230403 (https://download.01.org/0day-ci/archive/20230407/202304072127.DuosvCPC-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7abee7e8d17803e68bfff3de73df6a1dff270ff6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhaoyang-huang/mm-introduce-defer-free-for-cma/20230407-184459
        git checkout 7abee7e8d17803e68bfff3de73df6a1dff270ff6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072127.DuosvCPC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/cma.c: In function 'cma_free_get':
>> mm/cma.c:165:26: warning: suggest parentheses around '-' inside '<<' [-Wparentheses]
     165 |         val = cma->count - (u64)used << cma->order_per_bit;
         |               ~~~~~~~~~~~^~~~~~~~~~~
   mm/cma.c: At top level:
   mm/cma.c:157:22: warning: 'cma_free_get' defined but not used [-Wunused-function]
     157 | static unsigned long cma_free_get(struct cma *cma)
         |                      ^~~~~~~~~~~~


vim +165 mm/cma.c

   156	
   157	static unsigned long cma_free_get(struct cma *cma)
   158	{
   159		unsigned long used;
   160		unsigned long val;
   161	
   162		spin_lock_irq(&cma->lock);
   163		/* pages counter is smaller than sizeof(int) */
   164		used = bitmap_weight(cma->bitmap, (int)cma_bitmap_maxno(cma));
 > 165		val = cma->count - (u64)used << cma->order_per_bit;
   166		spin_unlock_irq(&cma->lock);
   167	
   168		return val;
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
