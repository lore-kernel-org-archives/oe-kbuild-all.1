Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DDB1FDB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 07:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686815274; x=1718351274;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nGzkJqTw/h++YjnI7sDulDSKK8jw1GsovousdznBU8U=;
  b=K/tRknroB9UZErbKqve0RHdIVchn51gMwAEMDLund24uMGhDiYLiBc7Z
   WZFwR/Hzf8dixVAnuUrbmqM9sCYMn71ozPZ9OGMfrkhLGuyhIqqQd9y6U
   EG8PfNExaFFTMIpri0h2nOwq5aVp2ej2twch3qEXi5k9vSXCqkPxlCTae
   6bqnFDdirk5j4+JKzYI0Rov+pDT/hb62Eb5pdICisb0Xc+9ALo8CyH9E4
   UUsimVjfRC5iMxi0DUqgaQj0Av53E6F87DMM/8zL3w+3czoRC0MjJFFnN
   gBZXUgzUDLXDNW9SAblJiv9lnNUxgdc7PsYtka7ei7b5eqCwbl3tS0Sbk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="362223041"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="362223041"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 00:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="802247407"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="802247407"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2023 00:47:52 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9hhj-0001ct-1c;
	Thu, 15 Jun 2023 07:47:45 +0000
Date: Thu, 15 Jun 2023 15:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] zsmalloc: charge the zspage's object to
 obj_cgroup
Message-ID: <202306151517.tjkWZm6G-lkp@intel.com>
References: <20230615034905.1362034-1-hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615034905.1362034-1-hezhongkun.hzk@bytedance.com>

Hi Zhongkun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.4-rc6]
[cannot apply to akpm-mm/mm-everything next-20230615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhongkun-He/memcg-export-obj_cgroup-symbol-to-charge-compressed-RAM/20230615-115048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230615034905.1362034-1-hezhongkun.hzk%40bytedance.com
patch subject: [RFC PATCH 3/3] zsmalloc: charge the zspage's object to obj_cgroup
config: mips-randconfig-r022-20230615 (https://download.01.org/0day-ci/archive/20230615/202306151517.tjkWZm6G-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch axboe-block for-next
        git checkout axboe-block/for-next
        b4 shazam https://lore.kernel.org/r/20230615034905.1362034-1-hezhongkun.hzk@bytedance.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151517.tjkWZm6G-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/zsmalloc.c:1567:5: warning: no previous prototype for 'zs_alloc_obj_cgroups' [-Wmissing-prototypes]
    1567 | int zs_alloc_obj_cgroups(struct zspage *zspage, struct size_class *class)
         |     ^~~~~~~~~~~~~~~~~~~~
   mm/zsmalloc.c: In function 'zs_malloc':
>> mm/zsmalloc.c:1714:39: error: passing argument 2 of 'zs_obj_post_alloc_hook' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1714 |         zs_obj_post_alloc_hook(class, zspage, index, objcg);
         |                                       ^~~~~~
         |                                       |
         |                                       struct zspage *
   mm/zsmalloc.c:1579:46: note: expected 'struct page *' but argument is of type 'struct zspage *'
    1579 |                                 struct page *page,
         |                                 ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/zs_obj_post_alloc_hook +1714 mm/zsmalloc.c

  1711	
  1712		spin_unlock(&pool->lock);
  1713	out:
> 1714		zs_obj_post_alloc_hook(class, zspage, index, objcg);
  1715	
  1716		return handle;
  1717	}
  1718	EXPORT_SYMBOL_GPL(zs_malloc);
  1719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
