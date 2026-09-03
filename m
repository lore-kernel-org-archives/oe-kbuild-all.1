Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685653002A9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 02:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401185; cv=none; b=YR6rv/5FCDZX5moAUXaj5F1SHHIJfAIi8GjMilO7oEHDmk8T917qTnXhJUCuqhZszwR+xHIkwCkmvTv5GKHaW0c5TGzSbPJA8BM+pBGvb+iUXrVWN/m6iSuPKXJ6y1dxcKTqUWjosum4MAePdQxrCDzBG62UsnKTdGz605JQ7xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401185; c=relaxed/simple;
	bh=xPKy/GfKlKmRyyMPVCa02YYMbzNnP5JORg2l3Z3fAzI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pCn5ViMsZBzWUVGi+kKHa2cdFivB2xvPHngtWlWG96+FxU568Bz6ketEpmQqbyGMBqy6Vb8MuFNh0zzPEOZaQ50hbE2qZyHXebOa2F9XtXOqny8gKuNo11f3QfkwV10t94DJ+aXslIRDnIjW6OH5k6iek41BHJcUklQZUA5IH3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9E/qaOS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9E/qaOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788401182; x=1819937182;
  h=date:from:to:cc:subject:message-id;
  bh=xPKy/GfKlKmRyyMPVCa02YYMbzNnP5JORg2l3Z3fAzI=;
  b=h9E/qaOSv8P5g8QzqTF3Ub7QvXVPUoropZquTbd9TAB6oxDjJgm8bfXf
   OcXH6XOwzY1KLmVHDKH3U9PvepX4gH62Qs1cOtITjz19Mlo6JHB70UkhY
   aneMJ0XXdD3+P5Re5H5V4+JOAyu5s+um49V+eUKcDqHV0L7Z9nBln4jGf
   x9qssgVOsM9ukMV9ELbMVzVrWwelzlHuMRPAriVnma0kQUArpBKnhoxz2
   RYoxyBG9t19GXJc14kwxp2Omg2uguVUemsghIO1OhXQaIY8pRtUebtjlW
   XF3bD1SSYZXE0Iz94u1fSXhAlogA8M76rd6LLq/6e23+rAF0WPD/iD59d
   w==;
X-CSE-ConnectionGUID: uXO9Hw20TsCnEPBmjf4I3g==
X-CSE-MsgGUID: AjR2aAffTCac4B/IiETd5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="91383489"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="91383489"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:06:21 -0700
X-CSE-ConnectionGUID: V0nLXJydRZWSV2dQ1xoFiw==
X-CSE-MsgGUID: 7to5NGq8ThmozJgOLtNY0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="294436032"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Sep 2026 19:06:20 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1wqH-000000003cU-18OT;
	Thu, 03 Sep 2026 02:06:17 +0000
Date: Thu, 03 Sep 2026 10:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:feature/subpage 10/11] fs/f2fs/f2fs.h:607:16: error:
 implicit declaration of function 'DEF_ADDRS_PER_INODE'; did you mean
 'DEF_NIDS_PER_INODE'?
Message-ID: <202609031021.5XwyQs1E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/subpage
head:   05dd03eec5caa963c1e263a691bf1dbf8a000ab0
commit: 13ae07d70b3d764b22c03ede8cfd66d8c94cebdf [10/11] f2fs: describe node tree geometry dynamically
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609031021.5XwyQs1E-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031021.5XwyQs1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031021.5XwyQs1E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:10:
   include/linux/f2fs_fs.h:347:49: warning: '/*' within comment [-Wcomment]
     347 |          * __le32 i_nid[DEF_NIDS_PER_INODE];    /* direct(2), indirect(2),
   include/linux/f2fs_fs.h:349:10: error: expected specifier-qualifier-list before '*' token
     349 |          *
         |          ^
   In file included from fs/f2fs/dir.c:15:
   fs/f2fs/f2fs.h: In function 'cur_addrs_per_inode':
>> fs/f2fs/f2fs.h:607:16: error: implicit declaration of function 'DEF_ADDRS_PER_INODE'; did you mean 'DEF_NIDS_PER_INODE'? [-Wimplicit-function-declaration]
     607 |         return DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) - get_extra_isize(inode);
         |                ^~~~~~~~~~~~~~~~~~~
         |                DEF_NIDS_PER_INODE
>> fs/f2fs/f2fs.h:607:36: error: implicit declaration of function 'F2FS_I_SB' [-Wimplicit-function-declaration]
     607 |         return DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) - get_extra_isize(inode);
         |                                    ^~~~~~~~~
   fs/f2fs/f2fs.h: At top level:
>> fs/f2fs/f2fs.h:2241:36: error: conflicting types for 'F2FS_I_SB'; have 'struct f2fs_sb_info *(struct inode *)'
    2241 | static inline struct f2fs_sb_info *F2FS_I_SB(struct inode *inode)
         |                                    ^~~~~~~~~
   fs/f2fs/f2fs.h:607:36: note: previous implicit declaration of 'F2FS_I_SB' with type 'int()'
     607 |         return DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) - get_extra_isize(inode);
         |                                    ^~~~~~~~~
--
   In file included from fs/f2fs/inode.c:9:
   include/linux/f2fs_fs.h:347:49: warning: '/*' within comment [-Wcomment]
     347 |          * __le32 i_nid[DEF_NIDS_PER_INODE];    /* direct(2), indirect(2),
   include/linux/f2fs_fs.h:349:10: error: expected specifier-qualifier-list before '*' token
     349 |          *
         |          ^
   In file included from fs/f2fs/inode.c:17:
   fs/f2fs/f2fs.h: In function 'cur_addrs_per_inode':
>> fs/f2fs/f2fs.h:607:16: error: implicit declaration of function 'DEF_ADDRS_PER_INODE'; did you mean 'DEF_NIDS_PER_INODE'? [-Wimplicit-function-declaration]
     607 |         return DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) - get_extra_isize(inode);
         |                ^~~~~~~~~~~~~~~~~~~
         |                DEF_NIDS_PER_INODE
>> fs/f2fs/f2fs.h:607:36: error: implicit declaration of function 'F2FS_I_SB' [-Wimplicit-function-declaration]
     607 |         return DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) - get_extra_isize(inode);
         |                                    ^~~~~~~~~
   fs/f2fs/f2fs.h: At top level:
>> fs/f2fs/f2fs.h:2241:36: error: conflicting types for 'F2FS_I_SB'; have 'struct f2fs_sb_info *(struct inode *)'
    2241 | static inline struct f2fs_sb_info *F2FS_I_SB(struct inode *inode)
         |                                    ^~~~~~~~~
   fs/f2fs/f2fs.h:607:36: note: previous implicit declaration of 'F2FS_I_SB' with type 'int()'
     607 |         return DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) - get_extra_isize(inode);
         |                                    ^~~~~~~~~
   In file included from include/linux/printk.h:7,
                    from include/asm-generic/bug.h:31,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/random.h:6,
                    from include/linux/nodemask.h:94,
                    from include/linux/list_lru.h:12,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from fs/f2fs/inode.c:8:
   fs/f2fs/inode.c: In function 'sanity_check_inode':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   fs/f2fs/f2fs.h:2121:33: note: in expansion of macro 'KERN_WARNING'
    2121 |         f2fs_printk(sbi, false, KERN_WARNING fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~~
   fs/f2fs/inode.c:343:17: note: in expansion of macro 'f2fs_warn'
     343 |                 f2fs_warn(sbi, "%s: inode (ino=%llx) has corrupted i_inline_xattr_size: %d, min: %zu, max: %lu",
         |                 ^~~~~~~~~


vim +607 fs/f2fs/f2fs.h

   600	
   601	/* for inline stuff */
   602	#define DEF_INLINE_RESERVED_SIZE	1
   603	static inline int get_extra_isize(struct inode *inode);
   604	static inline int get_inline_xattr_addrs(struct inode *inode);
   605	static inline unsigned int cur_addrs_per_inode(struct inode *inode)
   606	{
 > 607		return DEF_ADDRS_PER_INODE(F2FS_I_SB(inode)) - get_extra_isize(inode);
   608	}
   609	#define CUR_ADDRS_PER_INODE(inode)	cur_addrs_per_inode(inode)
   610	#define MAX_INLINE_DATA(inode)	(sizeof(__le32) *			\
   611					(cur_addrs_per_inode(inode) -		\
   612					get_inline_xattr_addrs(inode) -	\
   613					DEF_INLINE_RESERVED_SIZE))
   614	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
