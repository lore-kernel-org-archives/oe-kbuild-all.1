Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76D429A9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 15:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677426062; x=1708962062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G7zHWvX+1EYU+T4Zpl5H+qY9j+QRoPVvlgjx5WWyKvA=;
  b=UoDWAcKOy1vCKwPwh4UJpKmPTWhxuGOMfMnqiIh+fV4sw4kcS82ZJGRX
   DBc3km2li2jyL4ByZq3IP9APaKfjydT1FBoQHlWYiPLDPi9SXtA9t63lG
   w70tCqVT3hl8kuOAKDU41W4m3bTdUlEsI/n0kgSBXe74EGHV1JtPAQT9E
   J/GOXUk6GM/nBRV1UAq+Q6pVCFIpNdJZYUPi1V+aJXg+eSJoj8UjbggPg
   097vXiatptfFuGxjahZ9A362E/JTzWekpNYOA1hyswc1SpCug3/cpKJDS
   PtU4WXlQRaPkAQgvEoiXnh0qnXLHXfdXG05Bvhqw1wqIjWB9mQWrSvY7i
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="314145984"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="314145984"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 07:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="797302837"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="797302837"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Feb 2023 07:41:00 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWJ91-0003nj-2N;
	Sun, 26 Feb 2023 15:40:59 +0000
Date: Sun, 26 Feb 2023 23:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 13810/14003]
 drivers/block/zram/zram_drv.c:1236:44: error: passing argument 1 of
 'atomic64_read' from incompatible pointer type
Message-ID: <202302262324.Xemtp2Zk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8232539f864ca60474e38eb42d451f5c26415856
commit: b7d89654a988a2a4e6181397b8d05690b5758508 [13810/14003] zram: show zsmalloc objs_moved stat in mm_stat
config: openrisc-randconfig-r021-20230226 (https://download.01.org/0day-ci/archive/20230226/202302262324.Xemtp2Zk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b7d89654a988a2a4e6181397b8d05690b5758508
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b7d89654a988a2a4e6181397b8d05690b5758508
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/block/zram/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302262324.Xemtp2Zk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/zram/zram_drv.c: In function 'mm_stat_show':
>> drivers/block/zram/zram_drv.c:1236:44: error: passing argument 1 of 'atomic64_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1236 |                         (u64)atomic64_read(&pool_stats.objs_moved));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
         |                                            |
         |                                            atomic_long_t * {aka atomic_t *}
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/openrisc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/block/zram/zram_drv.c:18:
   include/linux/atomic/atomic-instrumented.h:644:33: note: expected 'const atomic64_t *' but argument is of type 'atomic_long_t *' {aka 'atomic_t *'}
     644 | atomic64_read(const atomic64_t *v)
         |               ~~~~~~~~~~~~~~~~~~^
   cc1: some warnings being treated as errors


vim +/atomic64_read +1236 drivers/block/zram/zram_drv.c

  1204	
  1205	static ssize_t mm_stat_show(struct device *dev,
  1206			struct device_attribute *attr, char *buf)
  1207	{
  1208		struct zram *zram = dev_to_zram(dev);
  1209		struct zs_pool_stats pool_stats;
  1210		u64 orig_size, mem_used = 0;
  1211		long max_used;
  1212		ssize_t ret;
  1213	
  1214		memset(&pool_stats, 0x00, sizeof(struct zs_pool_stats));
  1215	
  1216		down_read(&zram->init_lock);
  1217		if (init_done(zram)) {
  1218			mem_used = zs_get_total_pages(zram->mem_pool);
  1219			zs_pool_stats(zram->mem_pool, &pool_stats);
  1220		}
  1221	
  1222		orig_size = atomic64_read(&zram->stats.pages_stored);
  1223		max_used = atomic_long_read(&zram->stats.max_used_pages);
  1224	
  1225		ret = scnprintf(buf, PAGE_SIZE,
  1226				"%8llu %8llu %8llu %8lu %8ld %8llu %8lu %8llu %8llu %8llu\n",
  1227				orig_size << PAGE_SHIFT,
  1228				(u64)atomic64_read(&zram->stats.compr_data_size),
  1229				mem_used << PAGE_SHIFT,
  1230				zram->limit_pages << PAGE_SHIFT,
  1231				max_used << PAGE_SHIFT,
  1232				(u64)atomic64_read(&zram->stats.same_pages),
  1233				atomic_long_read(&pool_stats.pages_compacted),
  1234				(u64)atomic64_read(&zram->stats.huge_pages),
  1235				(u64)atomic64_read(&zram->stats.huge_pages_since),
> 1236				(u64)atomic64_read(&pool_stats.objs_moved));
  1237		up_read(&zram->init_lock);
  1238	
  1239		return ret;
  1240	}
  1241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
