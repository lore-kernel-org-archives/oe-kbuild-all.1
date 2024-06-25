Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33D417E8E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 21:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719352659; cv=none; b=KB9Zesio6KlZXByXvY16OUh4rTJMWDiB/I9MlZyaHNzEJ6BA3V1n4wH8m04F6+om/YCJoXR1Bq+Jc4nGEKOaCiBXj8RoflUWMNcF0Gm8rEoPIJqnuK8TZOnQsWzzHU94RBr2fCdZZcwIMOUOA1nWw+MT98P8/jVyxBOLcSAcgrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719352659; c=relaxed/simple;
	bh=ryHzLngI3IMi0V/eZqd8o2htNFHzbFMsuplZh4pG5uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=No7GM8Cy5H3cknAwbvsMEDrneMX/9p6CMSTlFLrtLa79y1FPdk4SAr1N2iZMEZk3mIczj1l49Jl4Q1GODn38eXUUbGVEHLFmrI2Z25mHHoPDJ4UTopb6pfW3IrF0UgXke8lHbKX6yQlV3pHpqFlSn2tZtRe9AVgkXbk3u/d1sZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASCEA4Wq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASCEA4Wq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719352657; x=1750888657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ryHzLngI3IMi0V/eZqd8o2htNFHzbFMsuplZh4pG5uA=;
  b=ASCEA4Wq7+tJ/PhtcbDUIxAnTII6JxHiIztyppAhATCmVSrD1a8uvYcL
   GdOz2lcH7M/JlNYsv7JQ3nbimdqRXM/uCe64tcMIAfuqEd+UHz1J9kNAo
   fV4/Dk4xMcocv5WKY1mG+FUlCAyghmWnKZ/J+fJBM0GIwTS/F+LO/MG11
   26HiH3cc3HNvjEb/3BZ1cFiqBZci9c9/RAV3/oqOOObEjyQwe+5S3kd4a
   GdKFEynzLf0ruFFt9h9FvOslzbAWQAUO8LeWpd/tfSd5cqsQ0L2i/bzHI
   ZWcMGyyGneFxzSa7iXV06+8ZXiSbpdd9ch7t4Mk/Bt73S7gBTgvAa6KB9
   Q==;
X-CSE-ConnectionGUID: 3ebdxUylQ1q4fio51cPdgA==
X-CSE-MsgGUID: sgUhCdDWRFWvBD3PyK59Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33853868"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="33853868"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 14:57:35 -0700
X-CSE-ConnectionGUID: Xuw19ew4S/GOKPOYFDfCAg==
X-CSE-MsgGUID: zZf3QKPSQja3zxzcmfuwiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="48178279"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jun 2024 14:57:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMEAM-000Ekk-2K;
	Tue, 25 Jun 2024 21:57:30 +0000
Date: Wed, 26 Jun 2024 05:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com
Cc: oe-kbuild-all@lists.linux.dev, linux-btrfs@vger.kernel.org,
	lihongbo22@huawei.com
Subject: Re: [PATCH] btrfs: support STATX_DIOALIGN for statx
Message-ID: <202406260548.6TWVzSdc-lkp@intel.com>
References: <20240620132000.888494-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620132000.888494-1-lihongbo22@huawei.com>

Hi Hongbo,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.10-rc5 next-20240625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongbo-Li/btrfs-support-STATX_DIOALIGN-for-statx/20240625-141147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20240620132000.888494-1-lihongbo22%40huawei.com
patch subject: [PATCH] btrfs: support STATX_DIOALIGN for statx
config: i386-buildonly-randconfig-002-20240626 (https://download.01.org/0day-ci/archive/20240626/202406260548.6TWVzSdc-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260548.6TWVzSdc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260548.6TWVzSdc-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'btrfs_getattr':
>> fs/btrfs/inode.c:8561:3: error: unknown type name 'btrfs_fs_info'; use 'struct' keyword to refer to the type
      btrfs_fs_info *fs_info = inode_to_fs_info(inode);
      ^~~~~~~~~~~~~
      struct 
   In file included from fs/btrfs/ctree.h:20,
                    from fs/btrfs/inode.c:38:
>> fs/btrfs/fs.h:882:34: error: initialization of 'int *' from incompatible pointer type 'struct btrfs_fs_info *' [-Werror=incompatible-pointer-types]
    #define inode_to_fs_info(_inode) (BTRFS_I(_Generic((_inode),   \
                                     ^
   fs/btrfs/inode.c:8561:28: note: in expansion of macro 'inode_to_fs_info'
      btrfs_fs_info *fs_info = inode_to_fs_info(inode);
                               ^~~~~~~~~~~~~~~~
>> fs/btrfs/inode.c:8562:38: error: request for member 'fs_devices' in something not a structure or union
      struct block_device *bdev = fs_info->fs_devices->latest_dev->bdev;
                                         ^~
   In file included from arch/x86/include/asm/atomic.h:5,
                    from include/linux/atomic.h:7,
                    from include/crypto/hash.h:11,
                    from fs/btrfs/inode.c:6:
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/compiler.h:284:48: note: in definition of macro '__is_constexpr'
     (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                   ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/hash.h:12,
                    from fs/btrfs/inode.c:6:
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/minmax.h:46:45: note: in definition of macro '__cmp'
    #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
                                                ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/minmax.h:46:57: note: in definition of macro '__cmp'
    #define __cmp(op, x, y) ((x) __cmp_op_##op (y) ? (x) : (y))
                                                            ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/minmax.h:50:9: note: in definition of macro '__cmp_once'
     typeof(y) unique_y = (y);   \
            ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/minmax.h:50:24: note: in definition of macro '__cmp_once'
     typeof(y) unique_y = (y);   \
                           ^
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
   In file included from include/linux/atomic/atomic-instrumented.h:15,
                    from include/linux/atomic.h:82,
                    from include/crypto/hash.h:11,
                    from fs/btrfs/inode.c:6:
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:31:24: note: in expansion of macro '__is_constexpr'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:31:39: note: in expansion of macro 'is_signed_type'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                                          ^~~~~~~~~~~~~~
   include/linux/minmax.h:39:21: note: in expansion of macro '__is_signed'
     (__is_signed(x) == __is_signed(y) ||   \
                        ^~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:31:24: note: in expansion of macro '__is_constexpr'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:31:39: note: in expansion of macro 'is_signed_type'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                                          ^~~~~~~~~~~~~~
   include/linux/minmax.h:39:21: note: in expansion of macro '__is_signed'
     (__is_signed(x) == __is_signed(y) ||   \
                        ^~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:32:3: note: in expansion of macro 'is_signed_type'
      is_signed_type(typeof(x)), 0)
      ^~~~~~~~~~~~~~
   include/linux/minmax.h:39:21: note: in expansion of macro '__is_signed'
     (__is_signed(x) == __is_signed(y) ||   \
                        ^~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:32:3: note: in expansion of macro 'is_signed_type'
      is_signed_type(typeof(x)), 0)
      ^~~~~~~~~~~~~~
   include/linux/minmax.h:39:21: note: in expansion of macro '__is_signed'
     (__is_signed(x) == __is_signed(y) ||   \
                        ^~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
   include/linux/minmax.h:31:2: error: first argument to '__builtin_choose_expr' not a constant
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:39:21: note: in expansion of macro '__is_signed'
     (__is_signed(x) == __is_signed(y) ||   \
                        ^~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:31:24: note: in expansion of macro '__is_constexpr'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:31:39: note: in expansion of macro 'is_signed_type'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                                          ^~~~~~~~~~~~~~
   include/linux/minmax.h:40:27: note: in expansion of macro '__is_signed'
      __is_signed((x) + 0) == __is_signed((y) + 0) || \
                              ^~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:31:24: note: in expansion of macro '__is_constexpr'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:31:39: note: in expansion of macro 'is_signed_type'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                                          ^~~~~~~~~~~~~~
   include/linux/minmax.h:40:27: note: in expansion of macro '__is_signed'
      __is_signed((x) + 0) == __is_signed((y) + 0) || \
                              ^~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:32:3: note: in expansion of macro 'is_signed_type'
      is_signed_type(typeof(x)), 0)
      ^~~~~~~~~~~~~~
   include/linux/minmax.h:40:27: note: in expansion of macro '__is_signed'
      __is_signed((x) + 0) == __is_signed((y) + 0) || \
                              ^~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:32:3: note: in expansion of macro 'is_signed_type'
      is_signed_type(typeof(x)), 0)
      ^~~~~~~~~~~~~~
   include/linux/minmax.h:40:27: note: in expansion of macro '__is_signed'
      __is_signed((x) + 0) == __is_signed((y) + 0) || \
                              ^~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
   include/linux/minmax.h:31:2: error: first argument to '__builtin_choose_expr' not a constant
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:40:27: note: in expansion of macro '__is_signed'
      __is_signed((x) + 0) == __is_signed((y) + 0) || \
                              ^~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:36:25: note: in expansion of macro '__is_constexpr'
     (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
                            ^~~~~~~~~~~~~~
   include/linux/minmax.h:41:24: note: in expansion of macro '__is_noneg_int'
      __is_noneg_int(x) || __is_noneg_int(y))
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:31:24: note: in expansion of macro '__is_constexpr'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:31:39: note: in expansion of macro 'is_signed_type'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                                          ^~~~~~~~~~~~~~
   include/linux/minmax.h:36:46: note: in expansion of macro '__is_signed'
     (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
                                                 ^~~~~~~~~~~
   include/linux/minmax.h:41:24: note: in expansion of macro '__is_noneg_int'
      __is_noneg_int(x) || __is_noneg_int(y))
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:31:24: note: in expansion of macro '__is_constexpr'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:31:39: note: in expansion of macro 'is_signed_type'
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
                                          ^~~~~~~~~~~~~~
   include/linux/minmax.h:36:46: note: in expansion of macro '__is_signed'
     (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
                                                 ^~~~~~~~~~~
   include/linux/minmax.h:41:24: note: in expansion of macro '__is_noneg_int'
      __is_noneg_int(x) || __is_noneg_int(y))
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
>> fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:32:3: note: in expansion of macro 'is_signed_type'
      is_signed_type(typeof(x)), 0)
      ^~~~~~~~~~~~~~
   include/linux/minmax.h:36:46: note: in expansion of macro '__is_signed'
     (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
                                                 ^~~~~~~~~~~
   include/linux/minmax.h:41:24: note: in expansion of macro '__is_noneg_int'
      __is_noneg_int(x) || __is_noneg_int(y))
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
   fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:32:3: note: in expansion of macro 'is_signed_type'
      is_signed_type(typeof(x)), 0)
      ^~~~~~~~~~~~~~
   include/linux/minmax.h:36:46: note: in expansion of macro '__is_signed'
     (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
                                                 ^~~~~~~~~~~
   include/linux/minmax.h:41:24: note: in expansion of macro '__is_noneg_int'
      __is_noneg_int(x) || __is_noneg_int(y))
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
   include/linux/minmax.h:31:2: error: first argument to '__builtin_choose_expr' not a constant
     __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))), \
     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:36:46: note: in expansion of macro '__is_signed'
     (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
                                                 ^~~~~~~~~~~
   include/linux/minmax.h:41:24: note: in expansion of macro '__is_noneg_int'
      __is_noneg_int(x) || __is_noneg_int(y))
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \
                   ^~~~~~~~~~
   include/linux/minmax.h:58:3: note: in expansion of macro '__cmp_once'
      __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
      ^~~~~~~~~~
   include/linux/minmax.h:169:27: note: in expansion of macro '__careful_cmp'
    #define max_t(type, x, y) __careful_cmp(max, (type)(x), (type)(y))
                              ^~~~~~~~~~~~~
   fs/btrfs/inode.c:8565:25: note: in expansion of macro 'max_t'
      stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
                            ^~~~~
   fs/btrfs/inode.c:8566:11: error: request for member 'sectorsize' in something not a structure or union
       fs_info->sectorsize);
              ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/minmax.h:51:2: note: in expansion of macro 'static_assert'
     static_assert(__types_ok(x, y),   \
     ^~~~~~~~~~~~~
   include/linux/minmax.h:41:24: note: in expansion of macro '__is_noneg_int'
      __is_noneg_int(x) || __is_noneg_int(y))
                           ^~~~~~~~~~~~~~
   include/linux/minmax.h:51:16: note: in expansion of macro '__types_ok'
     static_assert(__types_ok(x, y),   \


vim +8561 fs/btrfs/inode.c

  8544	
  8545	static int btrfs_getattr(struct mnt_idmap *idmap,
  8546				 const struct path *path, struct kstat *stat,
  8547				 u32 request_mask, unsigned int flags)
  8548	{
  8549		u64 delalloc_bytes;
  8550		u64 inode_bytes;
  8551		struct inode *inode = d_inode(path->dentry);
  8552		u32 blocksize = btrfs_sb(inode->i_sb)->sectorsize;
  8553		u32 bi_flags = BTRFS_I(inode)->flags;
  8554		u32 bi_ro_flags = BTRFS_I(inode)->ro_flags;
  8555	
  8556		stat->result_mask |= STATX_BTIME;
  8557		stat->btime.tv_sec = BTRFS_I(inode)->i_otime_sec;
  8558		stat->btime.tv_nsec = BTRFS_I(inode)->i_otime_nsec;
  8559	
  8560		if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode)) {
> 8561			btrfs_fs_info *fs_info = inode_to_fs_info(inode);
> 8562			struct block_device *bdev = fs_info->fs_devices->latest_dev->bdev;
  8563	
  8564			stat->result_mask |= STATX_DIOALIGN;
  8565			stat->dio_mem_align = max_t(u32, (bdev_dma_alignment(bdev) + 1),
> 8566				fs_info->sectorsize);
  8567			stat->dio_offset_align = max_t(u32, bdev_logical_block_size(bdev),
  8568				fs_info->sectorsize);
  8569		}
  8570	
  8571		if (bi_flags & BTRFS_INODE_APPEND)
  8572			stat->attributes |= STATX_ATTR_APPEND;
  8573		if (bi_flags & BTRFS_INODE_COMPRESS)
  8574			stat->attributes |= STATX_ATTR_COMPRESSED;
  8575		if (bi_flags & BTRFS_INODE_IMMUTABLE)
  8576			stat->attributes |= STATX_ATTR_IMMUTABLE;
  8577		if (bi_flags & BTRFS_INODE_NODUMP)
  8578			stat->attributes |= STATX_ATTR_NODUMP;
  8579		if (bi_ro_flags & BTRFS_INODE_RO_VERITY)
  8580			stat->attributes |= STATX_ATTR_VERITY;
  8581	
  8582		stat->attributes_mask |= (STATX_ATTR_APPEND |
  8583					  STATX_ATTR_COMPRESSED |
  8584					  STATX_ATTR_IMMUTABLE |
  8585					  STATX_ATTR_NODUMP);
  8586	
  8587		generic_fillattr(idmap, request_mask, inode, stat);
  8588		stat->dev = BTRFS_I(inode)->root->anon_dev;
  8589	
  8590		stat->subvol = BTRFS_I(inode)->root->root_key.objectid;
  8591		stat->result_mask |= STATX_SUBVOL;
  8592	
  8593		spin_lock(&BTRFS_I(inode)->lock);
  8594		delalloc_bytes = BTRFS_I(inode)->new_delalloc_bytes;
  8595		inode_bytes = inode_get_bytes(inode);
  8596		spin_unlock(&BTRFS_I(inode)->lock);
  8597		stat->blocks = (ALIGN(inode_bytes, blocksize) +
  8598				ALIGN(delalloc_bytes, blocksize)) >> SECTOR_SHIFT;
  8599		return 0;
  8600	}
  8601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
