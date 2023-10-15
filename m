Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B824C17C5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 03:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXsmFgH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697340930; x=1728876930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4On4sqjp7URWPRdw1zVIHJ7dZAfTKYVSbbP0dm87yuM=;
  b=SXsmFgH5VFh0VnSs+bh8cax1mPEvTnhMtHqmathl5k+Gic3GUjCiv0Pi
   +PZ5ZciMSBZesq5YlIYRf4Anzbe3E6ZJk3i3ZpUWpFfhebFQh+SeGhnDf
   K38gmCDrr4dud//Wv4fE0r38JCg4fh6IUL0rJV/Zh+x+8PWYU38jJofyc
   fVcJNGnwriUFK91IEY6EPpFxSowv65SFha0tZ4bt8yWTAvFUaybuL2oRC
   mQhVsiZXYX+j4pc1MoB1vHO4Muzv9NT4iNfZTlUFhQnN3i2CvZCD9wTB8
   7F0eoWqCufHzut7AsWt0lGc7nZtVZhBGncxbCLSXy4+Z4ZtWNhbapUOHT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388219442"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="388219442"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 20:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="845973382"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="845973382"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2023 20:35:28 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrruX-0006zf-1x;
	Sun, 15 Oct 2023 03:35:25 +0000
Date: Sun, 15 Oct 2023 11:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 8/18] include/linux/blkdev.h:1839:67:
 warning: unused parameter 'profile'
Message-ID: <202310151101.nUsdIqLU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   bfeb57ae959355c98e0f24329ed7eb646f53cf7e
commit: 003d924174670b6f1a2994217d9ebe12090859d0 [8/18] BACKPORT: blk-crypto: rename blk_keyslot_manager to blk_crypto_profile
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231015/202310151101.nUsdIqLU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151101.nUsdIqLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151101.nUsdIqLU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   static inline void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
                                                                               ^
   include/linux/highmem.h:128:97: warning: unused parameter 'vmaddr' [-Wunused-parameter]
   static inline void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
                                                                                                   ^
   include/linux/highmem.h:134:50: warning: unused parameter 'vaddr' [-Wunused-parameter]
   static inline void flush_kernel_vmap_range(void *vaddr, int size)
                                                    ^
   include/linux/highmem.h:134:61: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void flush_kernel_vmap_range(void *vaddr, int size)
                                                               ^
   include/linux/highmem.h:137:55: warning: unused parameter 'vaddr' [-Wunused-parameter]
   static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
                                                         ^
   include/linux/highmem.h:137:66: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
                                                                    ^
   include/linux/highmem.h:187:52: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void tag_clear_highpage(struct page *page)
                                                      ^
   include/linux/highmem.h:237:46: warning: unused parameter 'vma' [-Wunused-parameter]
           unsigned long vaddr, struct vm_area_struct *vma)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:17:
   include/linux/bio.h:399:14: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           if (sectors >= bio_sectors(bio))
               ~~~~~~~ ^  ~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   include/linux/blkdev.h:365:60: warning: unused parameter 'disk' [-Wunused-parameter]
   static inline unsigned int blkdev_nr_zones(struct gendisk *disk)
                                                              ^
   include/linux/blkdev.h:370:66: warning: unused parameter 'bdev' [-Wunused-parameter]
   static inline int blkdev_report_zones_ioctl(struct block_device *bdev,
                                                                    ^
   include/linux/blkdev.h:371:18: warning: unused parameter 'mode' [-Wunused-parameter]
                                               fmode_t mode, unsigned int cmd,
                                                       ^
   include/linux/blkdev.h:371:37: warning: unused parameter 'cmd' [-Wunused-parameter]
                                               fmode_t mode, unsigned int cmd,
                                                                          ^
   include/linux/blkdev.h:372:24: warning: unused parameter 'arg' [-Wunused-parameter]
                                               unsigned long arg)
                                                             ^
   include/linux/blkdev.h:377:63: warning: unused parameter 'bdev' [-Wunused-parameter]
   static inline int blkdev_zone_mgmt_ioctl(struct block_device *bdev,
                                                                 ^
   include/linux/blkdev.h:378:15: warning: unused parameter 'mode' [-Wunused-parameter]
                                            fmode_t mode, unsigned int cmd,
                                                    ^
   include/linux/blkdev.h:378:34: warning: unused parameter 'cmd' [-Wunused-parameter]
                                            fmode_t mode, unsigned int cmd,
                                                                       ^
   include/linux/blkdev.h:379:21: warning: unused parameter 'arg' [-Wunused-parameter]
                                            unsigned long arg)
                                                          ^
   include/linux/blkdev.h:754:69: warning: unused parameter 'q' [-Wunused-parameter]
   static inline unsigned int blk_queue_nr_zones(struct request_queue *q)
                                                                       ^
   include/linux/blkdev.h:758:64: warning: unused parameter 'q' [-Wunused-parameter]
   static inline bool blk_queue_zone_is_seq(struct request_queue *q,
                                                                  ^
   include/linux/blkdev.h:759:16: warning: unused parameter 'sector' [-Wunused-parameter]
                                            sector_t sector)
                                                     ^
   include/linux/blkdev.h:763:68: warning: unused parameter 'q' [-Wunused-parameter]
   static inline unsigned int blk_queue_zone_no(struct request_queue *q,
                                                                      ^
   include/linux/blkdev.h:764:20: warning: unused parameter 'sector' [-Wunused-parameter]
                                                sector_t sector)
                                                         ^
   include/linux/blkdev.h:768:77: warning: unused parameter 'q' [-Wunused-parameter]
   static inline unsigned int queue_max_open_zones(const struct request_queue *q)
                                                                               ^
   include/linux/blkdev.h:772:79: warning: unused parameter 'q' [-Wunused-parameter]
   static inline unsigned int queue_max_active_zones(const struct request_queue *q)
                                                                                 ^
   include/linux/blkdev.h:867:58: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline void rq_flush_dcache_pages(struct request *rq)
                                                            ^
>> include/linux/blkdev.h:1839:67: warning: unused parameter 'profile' [-Wunused-parameter]
   static inline bool blk_crypto_register(struct blk_crypto_profile *profile,
                                                                     ^
   include/linux/blkdev.h:1840:34: warning: unused parameter 'q' [-Wunused-parameter]
                                          struct request_queue *q)
                                                                ^
   include/linux/blkdev.h:1845:64: warning: unused parameter 'q' [-Wunused-parameter]
   static inline void blk_crypto_unregister(struct request_queue *q) { }
                                                                  ^
   include/linux/blkdev.h:1923:66: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline bool blk_req_needs_zone_write_lock(struct request *rq)
                                                                    ^
   include/linux/blkdev.h:1928:60: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline void blk_req_zone_write_lock(struct request *rq)
                                                              ^
   include/linux/blkdev.h:1932:62: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline void blk_req_zone_write_unlock(struct request *rq)
                                                                ^
   include/linux/blkdev.h:1935:65: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline bool blk_req_zone_is_write_locked(struct request *rq)
                                                                   ^
   include/linux/blkdev.h:1940:65: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline bool blk_req_can_dispatch_to_zone(struct request *rq)
                                                                   ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   include/linux/blk-cgroup.h:740:44: warning: unused parameter 'buf' [-Wunused-parameter]
   static inline int blkcg_set_fc_appid(char *buf, u64 id, size_t len) { return -EINVAL; }
                                              ^
   include/linux/blk-cgroup.h:740:53: warning: unused parameter 'id' [-Wunused-parameter]
   static inline int blkcg_set_fc_appid(char *buf, u64 id, size_t len) { return -EINVAL; }
                                                       ^
   include/linux/blk-cgroup.h:740:64: warning: unused parameter 'len' [-Wunused-parameter]
   static inline int blkcg_set_fc_appid(char *buf, u64 id, size_t len) { return -EINVAL; }
                                                                  ^
   include/linux/blk-cgroup.h:741:52: warning: unused parameter 'bio' [-Wunused-parameter]
   static inline char *blkcg_get_fc_appid(struct bio *bio) { return NULL; }
                                                      ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:790:54: warning: unused parameter 'lruvec' [-Wunused-parameter]
   static inline void lruvec_memcg_debug(struct lruvec *lruvec, struct page *page)
                                                        ^
   include/linux/memcontrol.h:790:75: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void lruvec_memcg_debug(struct lruvec *lruvec, struct page *page)
                                                                             ^
   include/linux/memcontrol.h:1019:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_possible_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_possible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                    ~~~  ^ ~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:13:
   include/linux/pagemap.h:135:57: warning: unused parameter 'mapping' [-Wunused-parameter]
   static inline int filemap_nr_thps(struct address_space *mapping)
                                                           ^
   include/linux/pagemap.h:144:62: warning: unused parameter 'mapping' [-Wunused-parameter]
   static inline void filemap_nr_thps_inc(struct address_space *mapping)
                                                                ^
   include/linux/pagemap.h:154:62: warning: unused parameter 'mapping' [-Wunused-parameter]
   static inline void filemap_nr_thps_dec(struct address_space *mapping)
                                                                ^
   In file included from drivers/gpu/drm/i915/i915_drv.c:39:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:7:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:18:
   include/linux/regulator/consumer.h:317:75: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline struct regulator *__must_check regulator_get(struct device *dev,
                                                                             ^
   include/linux/regulator/consumer.h:318:14: warning: unused parameter 'id' [-Wunused-parameter]
           const char *id)
                       ^
   include/linux/regulator/consumer.h:332:35: warning: unused parameter 'dev' [-Wunused-parameter]
   devm_regulator_get(struct device *dev, const char *id)
                                     ^
   include/linux/regulator/consumer.h:332:52: warning: unused parameter 'id' [-Wunused-parameter]
--
   include/linux/highmem.h:128:59: warning: unused parameter 'vma' [-Wunused-parameter]
   static inline void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
                                                             ^
   include/linux/highmem.h:128:77: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
                                                                               ^
   include/linux/highmem.h:128:97: warning: unused parameter 'vmaddr' [-Wunused-parameter]
   static inline void flush_anon_page(struct vm_area_struct *vma, struct page *page, unsigned long vmaddr)
                                                                                                   ^
   include/linux/highmem.h:134:50: warning: unused parameter 'vaddr' [-Wunused-parameter]
   static inline void flush_kernel_vmap_range(void *vaddr, int size)
                                                    ^
   include/linux/highmem.h:134:61: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void flush_kernel_vmap_range(void *vaddr, int size)
                                                               ^
   include/linux/highmem.h:137:55: warning: unused parameter 'vaddr' [-Wunused-parameter]
   static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
                                                         ^
   include/linux/highmem.h:137:66: warning: unused parameter 'size' [-Wunused-parameter]
   static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
                                                                    ^
   include/linux/highmem.h:187:52: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void tag_clear_highpage(struct page *page)
                                                      ^
   include/linux/highmem.h:237:46: warning: unused parameter 'vma' [-Wunused-parameter]
           unsigned long vaddr, struct vm_area_struct *vma)
                                                       ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   In file included from include/linux/blkdev.h:17:
   include/linux/bio.h:399:14: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           if (sectors >= bio_sectors(bio))
               ~~~~~~~ ^  ~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   In file included from include/linux/blk-cgroup.h:23:
   include/linux/blkdev.h:365:60: warning: unused parameter 'disk' [-Wunused-parameter]
   static inline unsigned int blkdev_nr_zones(struct gendisk *disk)
                                                              ^
   include/linux/blkdev.h:370:66: warning: unused parameter 'bdev' [-Wunused-parameter]
   static inline int blkdev_report_zones_ioctl(struct block_device *bdev,
                                                                    ^
   include/linux/blkdev.h:371:18: warning: unused parameter 'mode' [-Wunused-parameter]
                                               fmode_t mode, unsigned int cmd,
                                                       ^
   include/linux/blkdev.h:371:37: warning: unused parameter 'cmd' [-Wunused-parameter]
                                               fmode_t mode, unsigned int cmd,
                                                                          ^
   include/linux/blkdev.h:372:24: warning: unused parameter 'arg' [-Wunused-parameter]
                                               unsigned long arg)
                                                             ^
   include/linux/blkdev.h:377:63: warning: unused parameter 'bdev' [-Wunused-parameter]
   static inline int blkdev_zone_mgmt_ioctl(struct block_device *bdev,
                                                                 ^
   include/linux/blkdev.h:378:15: warning: unused parameter 'mode' [-Wunused-parameter]
                                            fmode_t mode, unsigned int cmd,
                                                    ^
   include/linux/blkdev.h:378:34: warning: unused parameter 'cmd' [-Wunused-parameter]
                                            fmode_t mode, unsigned int cmd,
                                                                       ^
   include/linux/blkdev.h:379:21: warning: unused parameter 'arg' [-Wunused-parameter]
                                            unsigned long arg)
                                                          ^
   include/linux/blkdev.h:754:69: warning: unused parameter 'q' [-Wunused-parameter]
   static inline unsigned int blk_queue_nr_zones(struct request_queue *q)
                                                                       ^
   include/linux/blkdev.h:758:64: warning: unused parameter 'q' [-Wunused-parameter]
   static inline bool blk_queue_zone_is_seq(struct request_queue *q,
                                                                  ^
   include/linux/blkdev.h:759:16: warning: unused parameter 'sector' [-Wunused-parameter]
                                            sector_t sector)
                                                     ^
   include/linux/blkdev.h:763:68: warning: unused parameter 'q' [-Wunused-parameter]
   static inline unsigned int blk_queue_zone_no(struct request_queue *q,
                                                                      ^
   include/linux/blkdev.h:764:20: warning: unused parameter 'sector' [-Wunused-parameter]
                                                sector_t sector)
                                                         ^
   include/linux/blkdev.h:768:77: warning: unused parameter 'q' [-Wunused-parameter]
   static inline unsigned int queue_max_open_zones(const struct request_queue *q)
                                                                               ^
   include/linux/blkdev.h:772:79: warning: unused parameter 'q' [-Wunused-parameter]
   static inline unsigned int queue_max_active_zones(const struct request_queue *q)
                                                                                 ^
   include/linux/blkdev.h:867:58: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline void rq_flush_dcache_pages(struct request *rq)
                                                            ^
>> include/linux/blkdev.h:1839:67: warning: unused parameter 'profile' [-Wunused-parameter]
   static inline bool blk_crypto_register(struct blk_crypto_profile *profile,
                                                                     ^
   include/linux/blkdev.h:1840:34: warning: unused parameter 'q' [-Wunused-parameter]
                                          struct request_queue *q)
                                                                ^
   include/linux/blkdev.h:1845:64: warning: unused parameter 'q' [-Wunused-parameter]
   static inline void blk_crypto_unregister(struct request_queue *q) { }
                                                                  ^
   include/linux/blkdev.h:1923:66: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline bool blk_req_needs_zone_write_lock(struct request *rq)
                                                                    ^
   include/linux/blkdev.h:1928:60: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline void blk_req_zone_write_lock(struct request *rq)
                                                              ^
   include/linux/blkdev.h:1932:62: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline void blk_req_zone_write_unlock(struct request *rq)
                                                                ^
   include/linux/blkdev.h:1935:65: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline bool blk_req_zone_is_write_locked(struct request *rq)
                                                                   ^
   include/linux/blkdev.h:1940:65: warning: unused parameter 'rq' [-Wunused-parameter]
   static inline bool blk_req_can_dispatch_to_zone(struct request *rq)
                                                                   ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:22:
   In file included from include/linux/writeback.h:14:
   include/linux/blk-cgroup.h:740:44: warning: unused parameter 'buf' [-Wunused-parameter]
   static inline int blkcg_set_fc_appid(char *buf, u64 id, size_t len) { return -EINVAL; }
                                              ^
   include/linux/blk-cgroup.h:740:53: warning: unused parameter 'id' [-Wunused-parameter]
   static inline int blkcg_set_fc_appid(char *buf, u64 id, size_t len) { return -EINVAL; }
                                                       ^
   include/linux/blk-cgroup.h:740:64: warning: unused parameter 'len' [-Wunused-parameter]
   static inline int blkcg_set_fc_appid(char *buf, u64 id, size_t len) { return -EINVAL; }
                                                                  ^
   include/linux/blk-cgroup.h:741:52: warning: unused parameter 'bio' [-Wunused-parameter]
   static inline char *blkcg_get_fc_appid(struct bio *bio) { return NULL; }
                                                      ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:790:54: warning: unused parameter 'lruvec' [-Wunused-parameter]
   static inline void lruvec_memcg_debug(struct lruvec *lruvec, struct page *page)
                                                        ^
   include/linux/memcontrol.h:790:75: warning: unused parameter 'page' [-Wunused-parameter]
   static inline void lruvec_memcg_debug(struct lruvec *lruvec, struct page *page)
                                                                             ^
   include/linux/memcontrol.h:1019:2: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_possible_cpu(cpu)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:788:36: note: expanded from macro 'for_each_possible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:243:9: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                    ~~~  ^ ~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:13:
   include/linux/pagemap.h:135:57: warning: unused parameter 'mapping' [-Wunused-parameter]
   static inline int filemap_nr_thps(struct address_space *mapping)
                                                           ^
   include/linux/pagemap.h:144:62: warning: unused parameter 'mapping' [-Wunused-parameter]
   static inline void filemap_nr_thps_inc(struct address_space *mapping)
                                                                ^
   include/linux/pagemap.h:154:62: warning: unused parameter 'mapping' [-Wunused-parameter]
   static inline void filemap_nr_thps_dec(struct address_space *mapping)
                                                                ^
   In file included from drivers/gpu/drm/i915/i915_config.c:6:
   In file included from drivers/gpu/drm/i915/i915_drv.h:39:
   In file included from include/linux/i2c.h:18:
   include/linux/regulator/consumer.h:317:75: warning: unused parameter 'dev' [-Wunused-parameter]
   static inline struct regulator *__must_check regulator_get(struct device *dev,
                                                                             ^
   include/linux/regulator/consumer.h:318:14: warning: unused parameter 'id' [-Wunused-parameter]
           const char *id)
                       ^
   include/linux/regulator/consumer.h:332:35: warning: unused parameter 'dev' [-Wunused-parameter]
   devm_regulator_get(struct device *dev, const char *id)
                                     ^
   include/linux/regulator/consumer.h:332:52: warning: unused parameter 'id' [-Wunused-parameter]
   devm_regulator_get(struct device *dev, const char *id)
                                                      ^
   include/linux/regulator/consumer.h:338:40: warning: unused parameter 'dev' [-Wunused-parameter]
   regulator_get_exclusive(struct device *dev, const char *id)
                                          ^
   include/linux/regulator/consumer.h:338:57: warning: unused parameter 'id' [-Wunused-parameter]
   regulator_get_exclusive(struct device *dev, const char *id)
                                                           ^
..


vim +/profile +1839 include/linux/blkdev.h

  1838	
> 1839	static inline bool blk_crypto_register(struct blk_crypto_profile *profile,
  1840					       struct request_queue *q)
  1841	{
  1842		return true;
  1843	}
  1844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
