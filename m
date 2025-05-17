Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD4C78F20
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499759; cv=none; b=B0S0g1P3ChN2ILIEw9eIl021coc5V65H4hJyuHroFRD/PRGEOvrxFKL0gZg+734tAImfY+mQGg56GOXAk5nqcXvmAtv9vqBvGRKy4+CYIvr9j5/b8/Ye88xUNOHxxBSVnTtndkq+lOBbxEh5zNn+T+8YABKz9FdnegEg8KgcXq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499759; c=relaxed/simple;
	bh=RKOXgERJiXOLT70NHnwOnV+uhPjbEGgP4rLXiH/e9XU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCVxmbUqYx4OfLBDOKsYFc01B5e7jOhDLg8H6EirNloDggR7aRG5jI1TfziVBmswRNtXHYk5AQYLc7A8jZJjA9ce9O1GMXH9I55rio45AMJ7ICQW1B/t9VNiZ0G2YxUMUDxQ16EzQrVTUaqyBVKME5ta9Tv2+ZkW0X9hIrGJq3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRkx7Qdp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRkx7Qdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747499757; x=1779035757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RKOXgERJiXOLT70NHnwOnV+uhPjbEGgP4rLXiH/e9XU=;
  b=jRkx7QdpKc0ON2YL9ES4EG7/1TqbhyID47lol96Fc3TOTDb3WeG3BWlj
   0rG9swgVA5+HsRKpfGn7iVClr+hkvlHKjx4ZVpQRObUvrveCtK+w4WLxG
   TnonodQNmRI7k5QAkM3YqwQQ1y44xatUl7//57oHpkru+3sTtBmlV4Dkp
   5J6BaOu5WHBcEO2geU3vHvxa9n/9FnKIIHQKBG6cRUGse5rY6Bp6v3Vch
   oprYFaPqyeoNhR0H8teYXnz86EAsGBIGKditEscSjua5etxaw3sGMf6bB
   S9xxkwP3ij6wyySfwjyj4tg5zVrqgTDBwZEXlXiilkiQ14WirYIP8PN5b
   A==;
X-CSE-ConnectionGUID: RdSK0StARQipYVtXjWEZFw==
X-CSE-MsgGUID: HC7H3f/hQ1CeYYzW+FXHqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="48562675"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="48562675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 09:35:56 -0700
X-CSE-ConnectionGUID: E5uohtkLQjes1QNfJ1BFNA==
X-CSE-MsgGUID: TryeDFzTRyqm7lA2c4QQEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="144094429"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 May 2025 09:35:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGKVt-000KG3-0Y;
	Sat, 17 May 2025 16:35:53 +0000
Date: Sun, 18 May 2025 00:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.15-rc4/famnae 2/17] include/linux/stddef.h:105:62:
 error: expected ',' before ')' token
Message-ID: <202505180007.6Ysd3sJ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.15-rc4/famnae
head:   285522439aeea637ff1ae3f98148865b4351ccd8
commit: fb8c4d9f70b684b4e007aecd159705dc1a327786 [2/17] cgroup: -Wfamnae for struct cgroup_root
config: mips-randconfig-r073-20250517 (https://download.01.org/0day-ci/archive/20250518/202505180007.6Ysd3sJ6-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180007.6Ysd3sJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180007.6Ysd3sJ6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/compat.h:9,
                    from arch/mips/kernel/asm-offsets.c:12:
>> include/linux/stddef.h:105:62: error: expected ',' before ')' token
     _Static_assert(offsetof(TYPE, FLEX) == offsetof(TYPE, FIRST))
                                                                 ^
   include/linux/cgroup-defs.h:612:1: note: in expansion of macro 'TRAILING_OVERLAP_ASSERT'
    TRAILING_OVERLAP_ASSERT(struct cgroup_root, cgrp.ancestors, cgrp_ancestor_storage);
    ^~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:98: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +105 include/linux/stddef.h

4229a470175be1 Kees Cook      2018-01-10   25  
3876488444e712 Denys Vlasenko 2015-03-09   26  /**
e7f18c22e6bea2 Kees Cook      2021-08-19   27   * offsetofend() - Report the offset of a struct field within the struct
3876488444e712 Denys Vlasenko 2015-03-09   28   *
3876488444e712 Denys Vlasenko 2015-03-09   29   * @TYPE: The type of the structure
3876488444e712 Denys Vlasenko 2015-03-09   30   * @MEMBER: The member within the structure to get the end offset of
3876488444e712 Denys Vlasenko 2015-03-09   31   */
3876488444e712 Denys Vlasenko 2015-03-09   32  #define offsetofend(TYPE, MEMBER) \
4229a470175be1 Kees Cook      2018-01-10   33  	(offsetof(TYPE, MEMBER)	+ sizeof_field(TYPE, MEMBER))
8c7fbe5795a016 Joe Perches    2015-06-25   34  
50d7bd38c3aafc Kees Cook      2021-05-17   35  /**
50d7bd38c3aafc Kees Cook      2021-05-17   36   * struct_group() - Wrap a set of declarations in a mirrored struct
50d7bd38c3aafc Kees Cook      2021-05-17   37   *
50d7bd38c3aafc Kees Cook      2021-05-17   38   * @NAME: The identifier name of the mirrored sub-struct
50d7bd38c3aafc Kees Cook      2021-05-17   39   * @MEMBERS: The member declarations for the mirrored structs
50d7bd38c3aafc Kees Cook      2021-05-17   40   *
50d7bd38c3aafc Kees Cook      2021-05-17   41   * Used to create an anonymous union of two structs with identical
50d7bd38c3aafc Kees Cook      2021-05-17   42   * layout and size: one anonymous and one named. The former can be
50d7bd38c3aafc Kees Cook      2021-05-17   43   * used normally without sub-struct naming, and the latter can be
50d7bd38c3aafc Kees Cook      2021-05-17   44   * used to reason about the start, end, and size of the group of
50d7bd38c3aafc Kees Cook      2021-05-17   45   * struct members.
50d7bd38c3aafc Kees Cook      2021-05-17   46   */
50d7bd38c3aafc Kees Cook      2021-05-17   47  #define struct_group(NAME, MEMBERS...)	\
50d7bd38c3aafc Kees Cook      2021-05-17   48  	__struct_group(/* no tag */, NAME, /* no attrs */, MEMBERS)
50d7bd38c3aafc Kees Cook      2021-05-17   49  
50d7bd38c3aafc Kees Cook      2021-05-17   50  /**
50d7bd38c3aafc Kees Cook      2021-05-17   51   * struct_group_attr() - Create a struct_group() with trailing attributes
50d7bd38c3aafc Kees Cook      2021-05-17   52   *
50d7bd38c3aafc Kees Cook      2021-05-17   53   * @NAME: The identifier name of the mirrored sub-struct
50d7bd38c3aafc Kees Cook      2021-05-17   54   * @ATTRS: Any struct attributes to apply
50d7bd38c3aafc Kees Cook      2021-05-17   55   * @MEMBERS: The member declarations for the mirrored structs
50d7bd38c3aafc Kees Cook      2021-05-17   56   *
50d7bd38c3aafc Kees Cook      2021-05-17   57   * Used to create an anonymous union of two structs with identical
50d7bd38c3aafc Kees Cook      2021-05-17   58   * layout and size: one anonymous and one named. The former can be
50d7bd38c3aafc Kees Cook      2021-05-17   59   * used normally without sub-struct naming, and the latter can be
50d7bd38c3aafc Kees Cook      2021-05-17   60   * used to reason about the start, end, and size of the group of
50d7bd38c3aafc Kees Cook      2021-05-17   61   * struct members. Includes structure attributes argument.
50d7bd38c3aafc Kees Cook      2021-05-17   62   */
50d7bd38c3aafc Kees Cook      2021-05-17   63  #define struct_group_attr(NAME, ATTRS, MEMBERS...) \
50d7bd38c3aafc Kees Cook      2021-05-17   64  	__struct_group(/* no tag */, NAME, ATTRS, MEMBERS)
50d7bd38c3aafc Kees Cook      2021-05-17   65  
50d7bd38c3aafc Kees Cook      2021-05-17   66  /**
50d7bd38c3aafc Kees Cook      2021-05-17   67   * struct_group_tagged() - Create a struct_group with a reusable tag
50d7bd38c3aafc Kees Cook      2021-05-17   68   *
50d7bd38c3aafc Kees Cook      2021-05-17   69   * @TAG: The tag name for the named sub-struct
50d7bd38c3aafc Kees Cook      2021-05-17   70   * @NAME: The identifier name of the mirrored sub-struct
50d7bd38c3aafc Kees Cook      2021-05-17   71   * @MEMBERS: The member declarations for the mirrored structs
50d7bd38c3aafc Kees Cook      2021-05-17   72   *
50d7bd38c3aafc Kees Cook      2021-05-17   73   * Used to create an anonymous union of two structs with identical
50d7bd38c3aafc Kees Cook      2021-05-17   74   * layout and size: one anonymous and one named. The former can be
50d7bd38c3aafc Kees Cook      2021-05-17   75   * used normally without sub-struct naming, and the latter can be
50d7bd38c3aafc Kees Cook      2021-05-17   76   * used to reason about the start, end, and size of the group of
50d7bd38c3aafc Kees Cook      2021-05-17   77   * struct members. Includes struct tag argument for the named copy,
50d7bd38c3aafc Kees Cook      2021-05-17   78   * so the specified layout can be reused later.
50d7bd38c3aafc Kees Cook      2021-05-17   79   */
50d7bd38c3aafc Kees Cook      2021-05-17   80  #define struct_group_tagged(TAG, NAME, MEMBERS...) \
50d7bd38c3aafc Kees Cook      2021-05-17   81  	__struct_group(TAG, NAME, /* no attrs */, MEMBERS)
50d7bd38c3aafc Kees Cook      2021-05-17   82  
3080ea5553cc90 Kees Cook      2021-08-09   83  /**
3080ea5553cc90 Kees Cook      2021-08-09   84   * DECLARE_FLEX_ARRAY() - Declare a flexible array usable in a union
3080ea5553cc90 Kees Cook      2021-08-09   85   *
3080ea5553cc90 Kees Cook      2021-08-09   86   * @TYPE: The type of each flexible array element
3080ea5553cc90 Kees Cook      2021-08-09   87   * @NAME: The name of the flexible array member
3080ea5553cc90 Kees Cook      2021-08-09   88   *
3080ea5553cc90 Kees Cook      2021-08-09   89   * In order to have a flexible array member in a union or alone in a
3080ea5553cc90 Kees Cook      2021-08-09   90   * struct, it needs to be wrapped in an anonymous struct with at least 1
3080ea5553cc90 Kees Cook      2021-08-09   91   * named member, but that member can be empty.
3080ea5553cc90 Kees Cook      2021-08-09   92   */
3080ea5553cc90 Kees Cook      2021-08-09   93  #define DECLARE_FLEX_ARRAY(TYPE, NAME) \
3080ea5553cc90 Kees Cook      2021-08-09   94  	__DECLARE_FLEX_ARRAY(TYPE, NAME)
3080ea5553cc90 Kees Cook      2021-08-09   95  
0e12ba78bf7002 Kees Cook      2025-05-16   96  #define TRAILING_OVERLAP(TYPE, NAME, FLEX, MEMBERS)			\
0e12ba78bf7002 Kees Cook      2025-05-16   97  	union {								\
0e12ba78bf7002 Kees Cook      2025-05-16   98  		TYPE NAME;						\
0e12ba78bf7002 Kees Cook      2025-05-16   99  		struct {						\
0e12ba78bf7002 Kees Cook      2025-05-16  100  			unsigned char __##NAME[offsetof(TYPE, FLEX)];	\
0e12ba78bf7002 Kees Cook      2025-05-16  101  			MEMBERS						\
0e12ba78bf7002 Kees Cook      2025-05-16  102  		};							\
0e12ba78bf7002 Kees Cook      2025-05-16  103  	}
0e12ba78bf7002 Kees Cook      2025-05-16  104  #define TRAILING_OVERLAP_ASSERT(TYPE, FLEX, FIRST)			\
0e12ba78bf7002 Kees Cook      2025-05-16 @105  	_Static_assert(offsetof(TYPE, FLEX) == offsetof(TYPE, FIRST))
0e12ba78bf7002 Kees Cook      2025-05-16  106  

:::::: The code at line 105 was first introduced by commit
:::::: 0e12ba78bf7002a6ed41fc2d721286a920544148 stddef.h: Provide helper for trailing flex array member overlap

:::::: TO: Kees Cook <kees@kernel.org>
:::::: CC: Kees Cook <kees@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
