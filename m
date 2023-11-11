Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1339014AA9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LznXTjr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699709590; x=1731245590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrU6aC1tDBy136+Qu1na6xZXMIdDQuWTpdq2jHAuDVI=;
  b=LznXTjr+SzGTp/skfn5TRrq1M9bim2Hm/SlnS32rKeWRp5z4bcbBKkHz
   UUXLz2VBtLiQ1XM1Cub7fVe4ysu9RSvLHyGjwqg8brheKbVwJrOZw1+Nq
   maNYqkQyHKsJQLg/F0Hps5NSrfXQ8wgsnMvi+QKwj5nh/njQ9U/GhW5dB
   PFYj8PUK6XWGSxsisn5yIcPYNJQf5bAQ02WDzh+Y5MukIjdxo95cP/2L+
   q2ajHNoIHezi/G3d2IWhBxQhnxRq+rf40SbYx7Fc6XjYsH3UU6jo98/kx
   YtA8bxxWtL7kYvkoCqxPeiKk2fjtJiUPmAU5PZEGJYi/TMjFWPlUcUFUO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="456771927"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="456771927"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 05:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="887550870"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="887550870"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Nov 2023 05:33:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1o6i-000ATn-03;
	Sat, 11 Nov 2023 13:33:04 +0000
Date: Sat, 11 Nov 2023 21:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/util.h:867:9: sparse: sparse: incorrect type in argument
 1 (different address spaces)
Message-ID: <202311112141.R7ZXwhYf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: 3598c56eb93b9774d3aa06b3e3c0eab0bbbc26f0 bcachefs: Consolidate trigger code a bit
date:   3 weeks ago
config: loongarch-randconfig-r132-20231107 (https://download.01.org/0day-ci/archive/20231111/202311112141.R7ZXwhYf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311112141.R7ZXwhYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311112141.R7ZXwhYf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/buckets.c: note: in included file:
   fs/bcachefs/bcachefs.h:845:9: sparse: sparse: array of flexible structures
   fs/bcachefs/buckets.c: note: in included file:
   fs/bcachefs/replicas.h:42:34: sparse: sparse: array of flexible structures
   fs/bcachefs/buckets.c:1125:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bch_fs_usage [noderef] __percpu *fs_usage @@     got struct bch_fs_usage * @@
   fs/bcachefs/buckets.c:1125:26: sparse:     expected struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:1125:26: sparse:     got struct bch_fs_usage *
   fs/bcachefs/buckets.c:1154:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bch_fs_usage [noderef] __percpu *fs_usage @@     got struct bch_fs_usage * @@
   fs/bcachefs/buckets.c:1154:18: sparse:     expected struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:1154:18: sparse:     got struct bch_fs_usage *
   fs/bcachefs/buckets.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/seqlock.h:269:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/seqlock.h:269:9: sparse:     expected void *ptr
   include/linux/seqlock.h:269:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/seqlock.h:269:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/seqlock.h:269:9: sparse:     expected void *ptr
   include/linux/seqlock.h:269:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/seqlock.h:269:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/seqlock.h:269:9: sparse:     expected void *ptr
   include/linux/seqlock.h:269:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/seqlock.h:269:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   include/linux/seqlock.h:269:9: sparse:     expected void *ptr
   include/linux/seqlock.h:269:9: sparse:     got unsigned int [noderef] __percpu *
   include/linux/seqlock.h:269:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/seqlock.h:269:9: sparse:     expected void *ptr
   include/linux/seqlock.h:269:9: sparse:     got int [noderef] __percpu *
   include/linux/seqlock.h:269:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/seqlock.h:269:9: sparse:     expected void *ptr
   include/linux/seqlock.h:269:9: sparse:     got int [noderef] __percpu *
   include/linux/seqlock.h:269:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/seqlock.h:269:9: sparse:     expected void *ptr
   include/linux/seqlock.h:269:9: sparse:     got int [noderef] __percpu *
   include/linux/seqlock.h:269:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   include/linux/seqlock.h:269:9: sparse:     expected void *ptr
   include/linux/seqlock.h:269:9: sparse:     got int [noderef] __percpu *
   fs/bcachefs/buckets.c:403:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bch_fs_usage [noderef] __percpu *fs_usage @@     got struct bch_fs_usage * @@
   fs/bcachefs/buckets.c:403:18: sparse:     expected struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:403:18: sparse:     got struct bch_fs_usage *
   fs/bcachefs/buckets.c:404:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct bch_fs_usage *fs_usage @@     got struct bch_fs_usage [noderef] __percpu *fs_usage @@
   fs/bcachefs/buckets.c:404:36: sparse:     expected struct bch_fs_usage *fs_usage
   fs/bcachefs/buckets.c:404:36: sparse:     got struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:405:27: sparse: sparse: dereference of noderef expression
   fs/bcachefs/buckets.c:403:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bch_fs_usage [noderef] __percpu *fs_usage @@     got struct bch_fs_usage * @@
   fs/bcachefs/buckets.c:403:18: sparse:     expected struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:403:18: sparse:     got struct bch_fs_usage *
   fs/bcachefs/buckets.c:404:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct bch_fs_usage *fs_usage @@     got struct bch_fs_usage [noderef] __percpu *fs_usage @@
   fs/bcachefs/buckets.c:404:36: sparse:     expected struct bch_fs_usage *fs_usage
   fs/bcachefs/buckets.c:404:36: sparse:     got struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:405:27: sparse: sparse: dereference of noderef expression
   fs/bcachefs/buckets.c: note: in included file (through fs/bcachefs/super.h, fs/bcachefs/buckets.h, fs/bcachefs/alloc_background.h):
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/buckets.c:403:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bch_fs_usage [noderef] __percpu *fs_usage @@     got struct bch_fs_usage * @@
   fs/bcachefs/buckets.c:403:18: sparse:     expected struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:403:18: sparse:     got struct bch_fs_usage *
   fs/bcachefs/buckets.c:404:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct bch_fs_usage *fs_usage @@     got struct bch_fs_usage [noderef] __percpu *fs_usage @@
   fs/bcachefs/buckets.c:404:36: sparse:     expected struct bch_fs_usage *fs_usage
   fs/bcachefs/buckets.c:404:36: sparse:     got struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:405:27: sparse: sparse: dereference of noderef expression
   fs/bcachefs/buckets.c:403:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bch_fs_usage [noderef] __percpu *fs_usage @@     got struct bch_fs_usage * @@
   fs/bcachefs/buckets.c:403:18: sparse:     expected struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:403:18: sparse:     got struct bch_fs_usage *
   fs/bcachefs/buckets.c:404:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct bch_fs_usage *fs_usage @@     got struct bch_fs_usage [noderef] __percpu *fs_usage @@
   fs/bcachefs/buckets.c:404:36: sparse:     expected struct bch_fs_usage *fs_usage
   fs/bcachefs/buckets.c:404:36: sparse:     got struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:405:27: sparse: sparse: dereference of noderef expression
   fs/bcachefs/buckets.c:403:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bch_fs_usage [noderef] __percpu *fs_usage @@     got struct bch_fs_usage * @@
   fs/bcachefs/buckets.c:403:18: sparse:     expected struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:403:18: sparse:     got struct bch_fs_usage *
   fs/bcachefs/buckets.c:404:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct bch_fs_usage *fs_usage @@     got struct bch_fs_usage [noderef] __percpu *fs_usage @@
   fs/bcachefs/buckets.c:404:36: sparse:     expected struct bch_fs_usage *fs_usage
   fs/bcachefs/buckets.c:404:36: sparse:     got struct bch_fs_usage [noderef] __percpu *fs_usage
   fs/bcachefs/buckets.c:405:27: sparse: sparse: dereference of noderef expression
   fs/bcachefs/buckets.c:1126:17: sparse: sparse: dereference of noderef expression
   fs/bcachefs/buckets.c:1127:17: sparse: sparse: dereference of noderef expression
   fs/bcachefs/buckets.c:1158:9: sparse: sparse: dereference of noderef expression
   fs/bcachefs/buckets.c:1159:38: sparse: sparse: dereference of noderef expression
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/extents.h:145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int const [usertype] csum @@
   fs/bcachefs/extents.h:145:44: sparse:     expected restricted __le32 [usertype]
   fs/bcachefs/extents.h:145:44: sparse:     got unsigned int const [usertype] csum
   fs/bcachefs/extents.h:159:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned long long const [usertype] csum_hi:16 @@
   fs/bcachefs/extents.h:159:44: sparse:     expected restricted __le16 [usertype]
   fs/bcachefs/extents.h:159:44: sparse:     got unsigned long long const [usertype] csum_hi:16
   fs/bcachefs/buckets.c: note: in included file (through fs/bcachefs/vstructs.h, fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/util.h:867:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] [usertype] __percpu *dst @@
   fs/bcachefs/util.h:867:9: sparse:     expected void *ptr
   fs/bcachefs/util.h:867:9: sparse:     got unsigned long long [noderef] [usertype] __percpu *dst
>> fs/bcachefs/util.h:867:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] [usertype] __percpu *dst @@
   fs/bcachefs/util.h:867:9: sparse:     expected void *ptr
   fs/bcachefs/util.h:867:9: sparse:     got unsigned long long [noderef] [usertype] __percpu *dst
>> fs/bcachefs/util.h:867:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] [usertype] __percpu *dst @@
   fs/bcachefs/util.h:867:9: sparse:     expected void *ptr
   fs/bcachefs/util.h:867:9: sparse:     got unsigned long long [noderef] [usertype] __percpu *dst
>> fs/bcachefs/util.h:867:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned long long [noderef] [usertype] __percpu *dst @@
   fs/bcachefs/util.h:867:9: sparse:     expected void *ptr
   fs/bcachefs/util.h:867:9: sparse:     got unsigned long long [noderef] [usertype] __percpu *dst

vim +867 fs/bcachefs/util.h

4c97e04aa8818d Kent Overstreet 2019-02-06  860  
4c97e04aa8818d Kent Overstreet 2019-02-06  861  static inline void percpu_u64_set(u64 __percpu *dst, u64 src)
4c97e04aa8818d Kent Overstreet 2019-02-06  862  {
4c97e04aa8818d Kent Overstreet 2019-02-06  863  	int cpu;
4c97e04aa8818d Kent Overstreet 2019-02-06  864  
4c97e04aa8818d Kent Overstreet 2019-02-06  865  	for_each_possible_cpu(cpu)
4c97e04aa8818d Kent Overstreet 2019-02-06  866  		*per_cpu_ptr(dst, cpu) = 0;
109a4277124ca1 Kent Overstreet 2021-06-10 @867  	this_cpu_write(*dst, src);
4c97e04aa8818d Kent Overstreet 2019-02-06  868  }
4c97e04aa8818d Kent Overstreet 2019-02-06  869  

:::::: The code at line 867 was first introduced by commit
:::::: 109a4277124ca1a0ff670b519315c4f381c83ad3 bcachefs: Don't disable preemption unnecessarily

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
