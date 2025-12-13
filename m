Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B7223C4F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765665512; cv=none; b=fHDReIFUL0uvQDqy+MRb21CUPXTXrfffBXa+HXXudOXDEdKmGa/g1s1JueVv9iYy+OLPcCHq4bUvaZywtlh9TSo2mqzntZw+VLy1ClMSSnSJzXNd4mH7RZomoKySWm51uIbszXJY2lzURzHRWZpQOgvoiiPhziucHyXptZmkzFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765665512; c=relaxed/simple;
	bh=iekURkgX9ryVJcZ4gVqBnP+gdTNWzL5/HckhugrOmX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nx6Gi1VshKQdYrWeBrAhmydO/qSni9XKFDp0y8lgHaYOQbPnZRAoT4PERuYjqOXQfXoBNRhLIDjmaYeSsSAcIQCeyZQAZkFIAUfyITp1sqBCy8Qa7O21EFkC44ecxjj0P5eJaNK4xD9MZ7uNQPPSCegXR1aTaXmkiCjzvfKNWPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFHkiS3h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFHkiS3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765665510; x=1797201510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iekURkgX9ryVJcZ4gVqBnP+gdTNWzL5/HckhugrOmX4=;
  b=cFHkiS3h8zHvkquAzQo+x5Um1gO/RAeX3TIv8SgEheV73Xa6WL6t/sqN
   GwgpzFIlAPo9zTMqGTU41kM2FwB74ojtQhk1dp6AruxaFZy8BxTBklwai
   wqVlb37QNc9G6OwnEvNF2G5+be6UfNbtd1Em05Th4s9e+4dxDAAbuzE7c
   c7P0hQNUOMiF1Z/8oX2FB2W2A1CDhQ5T/zIrOn7rG3UKc3x8nZJGsgNRJ
   STBpd4r9lzCDG4omzgaE8XfJYM19XbsjvqN+ajMbJzdcRJ0ohyVDap7AB
   E3P92JIJ94rbuGSLwNXq0UzupBKql0ij5EKm869xdFcMxRvipGaiIH3vz
   A==;
X-CSE-ConnectionGUID: qJIydj6DQqCc0hXrlu1cxg==
X-CSE-MsgGUID: Oyx3I01ASzuveBd62e8duA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67584989"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67584989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:38:27 -0800
X-CSE-ConnectionGUID: X2lI5/75Tgy9CTiOwg9wkw==
X-CSE-MsgGUID: FQorP1XpTZ6nqRr9J+zZbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202300261"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 14:38:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYFr-000000008HI-47vH;
	Sat, 13 Dec 2025 22:38:23 +0000
Date: Sun, 14 Dec 2025 06:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/md/bcache/btree.h:386:14: warning: redefinition of typedef
 'btree_map_keys_fn' is a C11 feature
Message-ID: <202512140641.mYQpHQXV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: b4a620ff5be6873f1669fa06c90cd15a0d569021 [1942/1942] make bch_btree_check() to be multiple threads
config: x86_64-randconfig-006-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140641.mYQpHQXV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140641.mYQpHQXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140641.mYQpHQXV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/md/bcache/super.c:12:
>> drivers/md/bcache/btree.h:386:14: warning: redefinition of typedef 'btree_map_keys_fn' is a C11 feature [-Wtypedef-redefinition]
     386 | typedef int (btree_map_keys_fn)(struct btree_op *op, struct btree *b,
         |              ^
   drivers/md/bcache/btree.h:288:14: note: previous definition is here
     288 | typedef int (btree_map_keys_fn)(struct btree_op *op, struct btree *b,
         |              ^
   2 warnings generated.
--
   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/md/bcache/acache.c:18:
   In file included from drivers/md/bcache/request.h:4:
>> drivers/md/bcache/btree.h:386:14: warning: redefinition of typedef 'btree_map_keys_fn' is a C11 feature [-Wtypedef-redefinition]
     386 | typedef int (btree_map_keys_fn)(struct btree_op *op, struct btree *b,
         |              ^
   drivers/md/bcache/btree.h:288:14: note: previous definition is here
     288 | typedef int (btree_map_keys_fn)(struct btree_op *op, struct btree *b,
         |              ^
   drivers/md/bcache/acache.c:73:5: warning: no previous prototype for function 'acache_open' [-Wmissing-prototypes]
      73 | int acache_open(struct inode *inode, struct file *filp)
         |     ^
   drivers/md/bcache/acache.c:73:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      73 | int acache_open(struct inode *inode, struct file *filp)
         | ^
         | static 
   drivers/md/bcache/acache.c:91:5: warning: no previous prototype for function 'acache_release' [-Wmissing-prototypes]
      91 | int acache_release(struct inode *inode, struct file *filp)
         |     ^
   drivers/md/bcache/acache.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | int acache_release(struct inode *inode, struct file *filp)
         | ^
         | static 
   drivers/md/bcache/acache.c:97:9: warning: no previous prototype for function 'read_circ_slice' [-Wmissing-prototypes]
      97 | ssize_t read_circ_slice(struct acache_circ *circ, struct acache_info *buf,
         |         ^
   drivers/md/bcache/acache.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | ssize_t read_circ_slice(struct acache_circ *circ, struct acache_info *buf,
         | ^
         | static 
   drivers/md/bcache/acache.c:232:6: warning: no previous prototype for function 'init_acache_circ' [-Wmissing-prototypes]
     232 | void init_acache_circ(struct acache_circ **circ, void *startaddr)
         |      ^
   drivers/md/bcache/acache.c:232:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     232 | void init_acache_circ(struct acache_circ **circ, void *startaddr)
         | ^
         | static 
   drivers/md/bcache/acache.c:261:5: warning: no previous prototype for function 'acache_prefetch_init' [-Wmissing-prototypes]
     261 | int acache_prefetch_init(struct acache_device *adev)
         |     ^
   drivers/md/bcache/acache.c:261:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     261 | int acache_prefetch_init(struct acache_device *adev)
         | ^
         | static 
   drivers/md/bcache/acache.c:514:20: warning: no previous prototype for function 'get_cached_device_by_dev' [-Wmissing-prototypes]
     514 | struct cached_dev *get_cached_device_by_dev(dev_t dev)
         |                    ^
   drivers/md/bcache/acache.c:514:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     514 | struct cached_dev *get_cached_device_by_dev(dev_t dev)
         | ^
         | static 
   drivers/md/bcache/acache.c:527:13: warning: no previous prototype for function 'get_bio_by_item' [-Wmissing-prototypes]
     527 | struct bio *get_bio_by_item(struct cached_dev *dc, struct acache_info *item)
         |             ^
   drivers/md/bcache/acache.c:527:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     527 | struct bio *get_bio_by_item(struct cached_dev *dc, struct acache_info *item)
         | ^
         | static 
   9 warnings generated.
--
   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/md/bcache/journal.c:9:
>> drivers/md/bcache/btree.h:386:14: warning: redefinition of typedef 'btree_map_keys_fn' is a C11 feature [-Wtypedef-redefinition]
     386 | typedef int (btree_map_keys_fn)(struct btree_op *op, struct btree *b,
         |              ^
   drivers/md/bcache/btree.h:288:14: note: previous definition is here
     288 | typedef int (btree_map_keys_fn)(struct btree_op *op, struct btree *b,
         |              ^
   drivers/md/bcache/journal.c:320:6: warning: no previous prototype for function 'is_discard_enabled' [-Wmissing-prototypes]
     320 | bool is_discard_enabled(struct cache_set *s)
         |      ^
   drivers/md/bcache/journal.c:320:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     320 | bool is_discard_enabled(struct cache_set *s)
         | ^
         | static 
   3 warnings generated.


vim +/btree_map_keys_fn +386 drivers/md/bcache/btree.h

48dad8baf92fe8 Kent Overstreet 2013-09-10  385  
fc2d5988b5972b Coly Li         2018-08-11 @386  typedef int (btree_map_keys_fn)(struct btree_op *op, struct btree *b,
fc2d5988b5972b Coly Li         2018-08-11  387  				struct bkey *k);
fc2d5988b5972b Coly Li         2018-08-11  388  int bch_btree_map_keys(struct btree_op *op, struct cache_set *c,
fc2d5988b5972b Coly Li         2018-08-11  389  		       struct bkey *from, btree_map_keys_fn *fn, int flags);
fc2d5988b5972b Coly Li         2018-08-11  390  

:::::: The code at line 386 was first introduced by commit
:::::: fc2d5988b5972bced859944986fb36d902ac3698 bcache: add identifier names to arguments of function definitions

:::::: TO: Coly Li <colyli@suse.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
