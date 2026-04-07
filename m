Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25533EAE6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 06:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544060; cv=none; b=cdHDGCr7uQ8AeYZmmlGpdMO2Gt0RC3M5RPT1ISnA3+lpDghPmBAyXoVQ7kX0BlITofn8eUaYKOL3HeAFPOFi0fZ4Rpw23I72insNETQyHz762i+4cqxNwKJ1TlvrYKCCqc32zxAjXxrD3GCk8rZjYFTT2WTdIuoxku0034o1wgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544060; c=relaxed/simple;
	bh=bEclXngicJ6Hr178VPanS1DxpexMUB7yxhPcJBry3CQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FH0Zbij5D4p6qgh9a3U430oJMaf1HSDIpBgDoCVC8jyW9dQwiUufl17tcKL4uaDfzoQbl+Icq4hafLM6xs65dPsZvdE0PWIVyg7KwTt5AP89FrdBpvclsi8C/gXfVflHo9Mo/BEpJZ+tJ0jVAIPoAnONQqhuuvo0ROHgTA908Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEvDmfXi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEvDmfXi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775544059; x=1807080059;
  h=date:from:to:cc:subject:message-id;
  bh=bEclXngicJ6Hr178VPanS1DxpexMUB7yxhPcJBry3CQ=;
  b=JEvDmfXizihQhFy/1vsYCE7r5wwmdvIeL/Y8EW8jeNfrXIKzESnaNAaw
   TGTwOZK2gZUQkmr+7UjPg0eR0Z3P7V70TRIKNo094UTB8mCrp2EYhTUgl
   DaT9dcv3TyRa8UrUAD2FAyVUcSwyozKS8HgAuKJ6gEygXYcVRFSStKxiO
   d9PaWIe2h8T7xCRiE12RXlZYXT4jRzEDEobLpmQnQ5XynpVZwlJTz/dX8
   OBHI/fWjz6rGRNYTTDzkJUzWuJCOwI7y2XQh3rGEtKgoY2Wi6tDffRU0o
   2Bek3g20BvgXbCrv7HKObzhvZZ/4dmIM1V8G+KgJ8FE71hZ7WEfv00/ah
   Q==;
X-CSE-ConnectionGUID: MFnCSZ12TGi2Ks89czUShA==
X-CSE-MsgGUID: s5wiNQlKQzCplon4+jjOxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="86792559"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="86792559"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 23:40:59 -0700
X-CSE-ConnectionGUID: MhggU4RsSjCCnMjb5TSSIA==
X-CSE-MsgGUID: jfLtJFwHTLan954E+BmWTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227080023"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Apr 2026 23:40:56 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA07H-000000000Gf-1t1W;
	Tue, 07 Apr 2026 06:40:51 +0000
Date: Tue, 07 Apr 2026 14:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 41/51] fs/rpdfs/place.h:41:1:
 warning: control reaches end of non-void function
Message-ID: <202604071407.jaPX7Fpt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   9a0627207ad856d2a5eb09f3458afb1e34ac10a3
commit: 7db9f9d6d7cd9f1130ec06063f679a26a17d9fc0 [41/51] rpdfs: add place details metadata
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260407/202604071407.jaPX7Fpt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071407.jaPX7Fpt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071407.jaPX7Fpt-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |               ^~~~
   fs/rpdfs/place.h: In function 'rpdfs_place_full':
   fs/rpdfs/place.h:19:18: error: 'u128' undeclared (first use in this function)
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                  ^~~~
   fs/rpdfs/place.h:19:18: note: each undeclared identifier is reported only once for each function it appears in
   fs/rpdfs/place.h:19:23: error: expected ')' before 'rpdfs_place_hi'
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                ~      ^~~~~~~~~~~~~~
         |                       )
   fs/rpdfs/place.h: At top level:
   fs/rpdfs/place.h:32:65: error: unknown type name 'u128'
      32 | static inline void rpdfs_place_split_le(__le64 *lo, __le64 *hi, u128 full)
         |                                                                 ^~~~
   fs/rpdfs/place.h:38:15: error: unknown type name 'u128'
      38 | static inline u128 rpdfs_place_combine_le(__le64 lo, __le64 hi)
         |               ^~~~
   fs/rpdfs/place.h: In function 'rpdfs_place_combine_le':
   fs/rpdfs/place.h:40:18: error: 'u128' undeclared (first use in this function)
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                  ^~~~
   In file included from fs/rpdfs/txn.h:7,
                    from fs/rpdfs/balloc.h:10,
                    from fs/rpdfs/block.c:9:
   fs/rpdfs/block.h: At top level:
   fs/rpdfs/block.h:79:9: error: unknown type name 'u128'
      79 |         u128 place;
         |         ^~~~
   fs/rpdfs/block.c: In function 'send_block_write':
   fs/rpdfs/block.c:614:9: error: implicit declaration of function 'rpdfs_place_split_le'; did you mean 'rpdfs_place_combine_le'? [-Werror=implicit-function-declaration]
     614 |         rpdfs_place_split_le(&wr.det.place_lo, &wr.det.place_hi, bk->hnd.place);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         rpdfs_place_combine_le
   In file included from fs/rpdfs/block.h:8,
                    from fs/rpdfs/txn.h:7,
                    from fs/rpdfs/balloc.h:10,
                    from fs/rpdfs/block.c:9:
   fs/rpdfs/block.c: In function 'rpdfs_block_acquire':
   fs/rpdfs/place.h:8:39: warning: right shift count >= width of type [-Wshift-count-overflow]
       8 | #define RPA(place)      (u64)((place) >> 64), (u64)(place)
         |                                       ^~
   fs/rpdfs/block.c:189:63: note: in expansion of macro 'RPA'
     189 |         (bk)->hnd.bnr, (bk)->hnd.alloc_ctr, (bk)->hnd.wcount, RPA((bk)->hnd.place), \
         |                                                               ^~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'RBA'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:631:9: note: in expansion of macro 'dynamic_pr_debug'
     631 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   fs/rpdfs/pr.h:19:9: note: in expansion of macro 'pr_debug'
      19 |         pr_debug("rpdfs: %s:%u: "fmt"\n", __func__, __LINE__, ##args); \
         |         ^~~~~~~~
   fs/rpdfs/pr.h:26:9: note: in expansion of macro '_rpdfs_pr_debug'
      26 |         _rpdfs_pr_debug(fmt, ##args)
         |         ^~~~~~~~~~~~~~~
   fs/rpdfs/block.c:1233:17: note: in expansion of macro 'rpdfs_prd_rfi'
    1233 |                 rpdfs_prd_rfi(rfi, "acquire mode %u rbaf %x wait "RBF,
         |                 ^~~~~~~~~~~~~
   fs/rpdfs/block.c: In function 'recv_block_grant_mode':
   fs/rpdfs/place.h:8:39: warning: right shift count >= width of type [-Wshift-count-overflow]
       8 | #define RPA(place)      (u64)((place) >> 64), (u64)(place)
         |                                       ^~
   fs/rpdfs/block.c:189:63: note: in expansion of macro 'RPA'
     189 |         (bk)->hnd.bnr, (bk)->hnd.alloc_ctr, (bk)->hnd.wcount, RPA((bk)->hnd.place), \
         |                                                               ^~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'RBA'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:631:9: note: in expansion of macro 'dynamic_pr_debug'
     631 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   fs/rpdfs/pr.h:19:9: note: in expansion of macro 'pr_debug'
      19 |         pr_debug("rpdfs: %s:%u: "fmt"\n", __func__, __LINE__, ##args); \
         |         ^~~~~~~~
   fs/rpdfs/pr.h:22:9: note: in expansion of macro '_rpdfs_pr_debug'
      22 |         _rpdfs_pr_debug(fmt, ##args)
         |         ^~~~~~~~~~~~~~~
   fs/rpdfs/block.c:1610:9: note: in expansion of macro 'rpdfs_prd'
    1610 |         rpdfs_prd("mode %u "RBF, cm->mode, RBA(bk));
         |         ^~~~~~~~~
   fs/rpdfs/place.h: In function 'rpdfs_place_combine_le':
>> fs/rpdfs/place.h:41:1: warning: control reaches end of non-void function [-Wreturn-type]
      41 | }
         | ^
   cc1: some warnings being treated as errors


vim +41 fs/rpdfs/place.h

    37	
    38	static inline u128 rpdfs_place_combine_le(__le64 lo, __le64 hi)
    39	{
    40		return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
  > 41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
