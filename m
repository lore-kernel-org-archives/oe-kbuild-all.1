Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22E238FA7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQg2yNbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699569524; x=1731105524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yguK5rz7hXUo99zF2zcnO3ClgIZT1lkI/iQz0FmXchw=;
  b=fQg2yNbDy/vNwDMRNLYMNpRf6NulDykvCnUdjbNXxNhcuM31hTieQ58S
   iIfUVD3fAvo6JX0iV7AZIO2eFTQv+tPzkPoKTDXR2Eh8WCbxpJsi7vTPN
   SFErTmD9qZVRKNdhQORt2Dx9SFksbd69HVsEvtuLoW5j4fIANfnmRfpW4
   m74+ffAiK3uph2TJfn4psqPyFdoVsTcg1ut+rlBJ5ISAMoF+H/fhaAFNF
   bYwFNdsRyjaOcFQGgv3kXNw7n7VTbyyXTSYmC3BnAqk+v9IsSbrDrU/AV
   20dx4/QtKwC1I7el3YgEJNmZSZexuAF5N9vDdfaQQz6kH8gVaGq9wVx7B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392960468"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="392960468"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792694530"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="792694530"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Nov 2023 14:38:42 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Dfc-0009DY-0k;
	Thu, 09 Nov 2023 22:38:40 +0000
Date: Fri, 10 Nov 2023 06:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/bcachefs/util.h:867:9: sparse: sparse: incorrect type in argument
 1 (different address spaces)
Message-ID: <202311100645.stmxM9O8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bc986ab839c844e78a2333a02e55f02c9e57935
commit: 3598c56eb93b9774d3aa06b3e3c0eab0bbbc26f0 bcachefs: Consolidate trigger code a bit
date:   3 weeks ago
config: loongarch-randconfig-r132-20231107 (https://download.01.org/0day-ci/archive/20231110/202311100645.stmxM9O8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231110/202311100645.stmxM9O8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100645.stmxM9O8-lkp@intel.com/

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

4c97e04aa8818da Kent Overstreet 2019-02-06  860  
4c97e04aa8818da Kent Overstreet 2019-02-06  861  static inline void percpu_u64_set(u64 __percpu *dst, u64 src)
4c97e04aa8818da Kent Overstreet 2019-02-06  862  {
4c97e04aa8818da Kent Overstreet 2019-02-06  863  	int cpu;
4c97e04aa8818da Kent Overstreet 2019-02-06  864  
4c97e04aa8818da Kent Overstreet 2019-02-06  865  	for_each_possible_cpu(cpu)
4c97e04aa8818da Kent Overstreet 2019-02-06  866  		*per_cpu_ptr(dst, cpu) = 0;
109a4277124ca1a Kent Overstreet 2021-06-10 @867  	this_cpu_write(*dst, src);
4c97e04aa8818da Kent Overstreet 2019-02-06  868  }
4c97e04aa8818da Kent Overstreet 2019-02-06  869  

:::::: The code at line 867 was first introduced by commit
:::::: 109a4277124ca1a0ff670b519315c4f381c83ad3 bcachefs: Don't disable preemption unnecessarily

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
