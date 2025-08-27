Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A8D1F7586
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 08:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756284460; cv=none; b=iUkkK1SWXXV8ZtKrAEm2x2wSA4NUZKWVCK03ezMO9sxdAi1LeOseSG2zwy7cFUxN7iXx8wAhQRMN7oMDcQnFs6oXQUWWTiLiP0CwdVgf+fwlgLjTQNvZrBBt9NMC87nleBjOipGex12APF8UJFLz++ZGvUGKoe8acpHOCzu8w78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756284460; c=relaxed/simple;
	bh=Opi7hFGUSGYN00f7Q2wTEARKn7/BeM4HRXFyZHPWNkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5KQucQySCnOi7GZH8Yel+uGmptFdzkqIUhVK1J1oX6U+fp5L/QwJw6eMhwjk/lUPVK16xczK6OzBLURNtLfffS4d+1/OkGQgsDi4LeJ3YWIYSfXX1mW0I6wcf3OmgMiuImsp71QO8JXYgZRKDUiBYJHXoymoMFfip7nQplNmJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3KDCQj3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3KDCQj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756284458; x=1787820458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Opi7hFGUSGYN00f7Q2wTEARKn7/BeM4HRXFyZHPWNkk=;
  b=L3KDCQj39aOYvteF06+M6oQYf6f+Wc4aHEux0s1vkodHLLVieqOcmZg8
   5zsfMvb7vw8ZFhw1Ua9fqiAcG0VyIFBJHIZglIFz8sFT8Z9gxcbrC7Ke8
   nOtQr/aMP58KPKhvJyyMtsAh3jIZP07LfeFOsDBHDhKCe7d0TyZuBaP/h
   nJEEdVJX+Ub6WYaoWfE07SABB71OcO+9fbeXzTiiw31aIWfTFLsdX6IkR
   q/EEVDoFYoW8qJ0E/WomaaykiDQT7l0B/WqrX2fld35h5bcEwJjExKwk/
   LHuLfomFa/1MjTdPf3i7rOehDIzOCbWSejGmTI7/QVmpoApEHEeQ4SdrI
   A==;
X-CSE-ConnectionGUID: 54APX1XcQkmotWrnqDEBDg==
X-CSE-MsgGUID: ftPCDslzQjypdB62P39Kvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58590508"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58590508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 01:47:37 -0700
X-CSE-ConnectionGUID: A1zvvXaOQ7aa0ufvun4gYA==
X-CSE-MsgGUID: V08f9LZyTjCdZC88iVg1+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169034275"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Aug 2025 01:47:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urBoM-000SoN-2h;
	Wed, 27 Aug 2025 08:47:22 +0000
Date: Wed, 27 Aug 2025 16:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2752/2752] include/linux/bitfield.h:165:3: error:
 call to '__bad_mask' declared with attribute error: bad bitfield mask
Message-ID: <202508271638.WDlsxoDG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   242365f71d0edaeff9d861d32b639f02170e075d
commit: 9e76624e89d2d5210d25a33749d8989212945735 [2752/2752] [v8-28-43]arm64: RME: Allow checking SVE on VM instance
config: arm64-randconfig-004-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271638.WDlsxoDG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271638.WDlsxoDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271638.WDlsxoDG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/sysreg.h:1065,
                    from arch/arm64/include/asm/percpu.h:13,
                    from arch/arm64/include/asm/smp.h:28,
                    from include/linux/smp.h:113,
                    from include/linux/percpu.h:7,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/arm64/kvm/rme.c:6:
   In function 'field_multiplier',
       inlined from 'u64_get_bits' at include/linux/bitfield.h:201:1,
       inlined from 'rme_has_feature' at arch/arm64/kvm/rme.c:38:11:
>> include/linux/bitfield.h:165:3: error: call to '__bad_mask' declared with attribute error: bad bitfield mask
     165 |   __bad_mask();
         |   ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/__bad_mask +165 include/linux/bitfield.h

e2192de59e457a Johannes Berg   2023-01-18  119  
e2192de59e457a Johannes Berg   2023-01-18  120  /**
e2192de59e457a Johannes Berg   2023-01-18  121   * FIELD_PREP_CONST() - prepare a constant bitfield element
e2192de59e457a Johannes Berg   2023-01-18  122   * @_mask: shifted mask defining the field's length and position
e2192de59e457a Johannes Berg   2023-01-18  123   * @_val:  value to put in the field
e2192de59e457a Johannes Berg   2023-01-18  124   *
e2192de59e457a Johannes Berg   2023-01-18  125   * FIELD_PREP_CONST() masks and shifts up the value.  The result should
e2192de59e457a Johannes Berg   2023-01-18  126   * be combined with other fields of the bitfield using logical OR.
e2192de59e457a Johannes Berg   2023-01-18  127   *
e2192de59e457a Johannes Berg   2023-01-18  128   * Unlike FIELD_PREP() this is a constant expression and can therefore
e2192de59e457a Johannes Berg   2023-01-18  129   * be used in initializers. Error checking is less comfortable for this
e2192de59e457a Johannes Berg   2023-01-18  130   * version, and non-constant masks cannot be used.
e2192de59e457a Johannes Berg   2023-01-18  131   */
e2192de59e457a Johannes Berg   2023-01-18  132  #define FIELD_PREP_CONST(_mask, _val)					\
e2192de59e457a Johannes Berg   2023-01-18  133  	(								\
e2192de59e457a Johannes Berg   2023-01-18  134  		/* mask must be non-zero */				\
e2192de59e457a Johannes Berg   2023-01-18  135  		BUILD_BUG_ON_ZERO((_mask) == 0) +			\
e2192de59e457a Johannes Berg   2023-01-18  136  		/* check if value fits */				\
e2192de59e457a Johannes Berg   2023-01-18  137  		BUILD_BUG_ON_ZERO(~((_mask) >> __bf_shf(_mask)) & (_val)) + \
e2192de59e457a Johannes Berg   2023-01-18  138  		/* check if mask is contiguous */			\
e2192de59e457a Johannes Berg   2023-01-18  139  		__BF_CHECK_POW2((_mask) + (1ULL << __bf_shf(_mask))) +	\
e2192de59e457a Johannes Berg   2023-01-18  140  		/* and create the value */				\
e2192de59e457a Johannes Berg   2023-01-18  141  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
e2192de59e457a Johannes Berg   2023-01-18  142  	)
e2192de59e457a Johannes Berg   2023-01-18  143  
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  144  /**
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  145   * FIELD_GET() - extract a bitfield element
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  146   * @_mask: shifted mask defining the field's length and position
7240767450d6d8 Masahiro Yamada 2017-10-03  147   * @_reg:  value of entire bitfield
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  148   *
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  149   * FIELD_GET() extracts the field specified by @_mask from the
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  150   * bitfield passed in as @_reg by masking and shifting it down.
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  151   */
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  152  #define FIELD_GET(_mask, _reg)						\
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  153  	({								\
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  154  		__BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");	\
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  155  		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  156  	})
3e9b3112ec74f1 Jakub Kicinski  2016-08-31  157  
e7d4a95da86e0b Johannes Berg   2018-06-20  158  extern void __compiletime_error("value doesn't fit into mask")
00b0c9b82663ac Al Viro         2017-12-14  159  __field_overflow(void);
00b0c9b82663ac Al Viro         2017-12-14  160  extern void __compiletime_error("bad bitfield mask")
00b0c9b82663ac Al Viro         2017-12-14  161  __bad_mask(void);
00b0c9b82663ac Al Viro         2017-12-14  162  static __always_inline u64 field_multiplier(u64 field)
00b0c9b82663ac Al Viro         2017-12-14  163  {
00b0c9b82663ac Al Viro         2017-12-14  164  	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
00b0c9b82663ac Al Viro         2017-12-14 @165  		__bad_mask();
00b0c9b82663ac Al Viro         2017-12-14  166  	return field & -field;
00b0c9b82663ac Al Viro         2017-12-14  167  }
00b0c9b82663ac Al Viro         2017-12-14  168  static __always_inline u64 field_mask(u64 field)
00b0c9b82663ac Al Viro         2017-12-14  169  {
00b0c9b82663ac Al Viro         2017-12-14  170  	return field / field_multiplier(field);
00b0c9b82663ac Al Viro         2017-12-14  171  }
e31a50162feb35 Alex Elder      2020-03-12  172  #define field_max(field)	((typeof(field))field_mask(field))
00b0c9b82663ac Al Viro         2017-12-14  173  #define ____MAKE_OP(type,base,to,from)					\
00b0c9b82663ac Al Viro         2017-12-14  174  static __always_inline __##type type##_encode_bits(base v, base field)	\
00b0c9b82663ac Al Viro         2017-12-14  175  {									\
e7d4a95da86e0b Johannes Berg   2018-06-20  176  	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
00b0c9b82663ac Al Viro         2017-12-14  177  		__field_overflow();					\
00b0c9b82663ac Al Viro         2017-12-14  178  	return to((v & field_mask(field)) * field_multiplier(field));	\
00b0c9b82663ac Al Viro         2017-12-14  179  }									\
00b0c9b82663ac Al Viro         2017-12-14  180  static __always_inline __##type type##_replace_bits(__##type old,	\
00b0c9b82663ac Al Viro         2017-12-14  181  					base val, base field)		\
00b0c9b82663ac Al Viro         2017-12-14  182  {									\
00b0c9b82663ac Al Viro         2017-12-14  183  	return (old & ~to(field)) | type##_encode_bits(val, field);	\
00b0c9b82663ac Al Viro         2017-12-14  184  }									\
00b0c9b82663ac Al Viro         2017-12-14  185  static __always_inline void type##p_replace_bits(__##type *p,		\
00b0c9b82663ac Al Viro         2017-12-14  186  					base val, base field)		\
00b0c9b82663ac Al Viro         2017-12-14  187  {									\
00b0c9b82663ac Al Viro         2017-12-14  188  	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
00b0c9b82663ac Al Viro         2017-12-14  189  }									\
00b0c9b82663ac Al Viro         2017-12-14  190  static __always_inline base type##_get_bits(__##type v, base field)	\
00b0c9b82663ac Al Viro         2017-12-14  191  {									\
00b0c9b82663ac Al Viro         2017-12-14  192  	return (from(v) & field)/field_multiplier(field);		\
00b0c9b82663ac Al Viro         2017-12-14  193  }
00b0c9b82663ac Al Viro         2017-12-14  194  #define __MAKE_OP(size)							\
00b0c9b82663ac Al Viro         2017-12-14  195  	____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
00b0c9b82663ac Al Viro         2017-12-14  196  	____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
00b0c9b82663ac Al Viro         2017-12-14  197  	____MAKE_OP(u##size,u##size,,)
37a3862e123826 Johannes Berg   2018-06-20  198  ____MAKE_OP(u8,u8,,)
00b0c9b82663ac Al Viro         2017-12-14  199  __MAKE_OP(16)
00b0c9b82663ac Al Viro         2017-12-14  200  __MAKE_OP(32)
00b0c9b82663ac Al Viro         2017-12-14  201  __MAKE_OP(64)
00b0c9b82663ac Al Viro         2017-12-14  202  #undef __MAKE_OP
00b0c9b82663ac Al Viro         2017-12-14  203  #undef ____MAKE_OP
00b0c9b82663ac Al Viro         2017-12-14  204  

:::::: The code at line 165 was first introduced by commit
:::::: 00b0c9b82663ac42e5a09f58ce960f81f29d64ee Add primitives for manipulating bitfields both in host- and fixed-endian.

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
