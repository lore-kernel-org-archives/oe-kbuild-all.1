Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B967823D7FB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 22:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765318637; cv=none; b=kRTbXkhqsGLYgITbrNfG47c5X/Sy1HmrEprEFTTJSyx0Ps6brHB2CHgpR+bVHTFxRnghqB1CqEoZ/IcMYLbDGOJBaXB97a3ySfVJLLNDA5RPTTnQMVQNCvc4klq7wnYcBkdFs1TOwrJaL4/mTSDK/s4R2jp4Xm8pyfvkSjo6QHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765318637; c=relaxed/simple;
	bh=Fv54TQIQCjwenyBZsD0EPyO0AQ3r0kjdrxa8bspg6ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sCcbohFJTbrYTBDhTsYaSD+k5G2Kc5QSX9d/qjdR/cW/D18MAp8f0Lh0vLm9xqBBPZM3Nji279djrj/+XgjOzSlbkj/xY1VAMuRSlULIEfvaTuNFq73ob8SMv/yPFUh8y0bQQ7AdI6SCE6uf7sWPp62QlzlQUwVhY5x6k8aOTxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZZ7swQm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZZ7swQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765318635; x=1796854635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fv54TQIQCjwenyBZsD0EPyO0AQ3r0kjdrxa8bspg6ws=;
  b=eZZ7swQm1fOVEUxAAxtrZelXhCr4anoNu+QvRfgbrjb56hghG7jgaDus
   6faDdhDO1axmJ7va4JDD1uRTE6wc4gngTyKYHIZNu+Xxgruf47860klrQ
   D01u4mRnwAeD8p+5Og5hiXIqVe9p3aOJ2Kqy4pQ0SA3viX1cDAWfovhoV
   +LeboMGvOD/tadnEhttI81aQC/4+CYNNT5bxQ7h7hUZ0TtP5T6trISw+G
   PbA29EPkiBeeL9VXtVhSg0is9E2h5+47PibD3Vl+tHm4+yAFZNBYYuzy5
   veyUodVlL8W1Cz+PiziofxgVfDrzlH/jDgH3Rk402gvp4V6HArB7NoZj6
   A==;
X-CSE-ConnectionGUID: Yvd1l+38SVytoDN7U6yvrA==
X-CSE-MsgGUID: LA7GwL4mRMyXvtudbnIqSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67011644"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67011644"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 14:17:15 -0800
X-CSE-ConnectionGUID: 6dMWHunjSDmE3pVkemQ4ow==
X-CSE-MsgGUID: tzHKhZy7SOy/5ijacjlh2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196252590"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2025 14:17:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT619-000000002Ja-2edo;
	Tue, 09 Dec 2025 22:17:11 +0000
Date: Wed, 10 Dec 2025 06:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] include/linux/bitfield.h:165:17:
 error: call to '__bad_mask' declared with attribute error: bad bitfield mask
Message-ID: <202512100623.1pjIPxzS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Suzuki,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f3072e528ba53a76e66a34613ecc7b86dc96816d
commit: 9e76624e89d2d5210d25a33749d8989212945735 [3508/3508] [v8-28-43]arm64: RME: Allow checking SVE on VM instance
config: arm64-randconfig-001-20251210 (https://download.01.org/0day-ci/archive/20251210/202512100623.1pjIPxzS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100623.1pjIPxzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100623.1pjIPxzS-lkp@intel.com/

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
>> include/linux/bitfield.h:165:17: error: call to '__bad_mask' declared with attribute error: bad bitfield mask
     165 |                 __bad_mask();
         |                 ^~~~~~~~~~~~


vim +/__bad_mask +165 include/linux/bitfield.h

e2192de59e457ae Johannes Berg   2023-01-18  119  
e2192de59e457ae Johannes Berg   2023-01-18  120  /**
e2192de59e457ae Johannes Berg   2023-01-18  121   * FIELD_PREP_CONST() - prepare a constant bitfield element
e2192de59e457ae Johannes Berg   2023-01-18  122   * @_mask: shifted mask defining the field's length and position
e2192de59e457ae Johannes Berg   2023-01-18  123   * @_val:  value to put in the field
e2192de59e457ae Johannes Berg   2023-01-18  124   *
e2192de59e457ae Johannes Berg   2023-01-18  125   * FIELD_PREP_CONST() masks and shifts up the value.  The result should
e2192de59e457ae Johannes Berg   2023-01-18  126   * be combined with other fields of the bitfield using logical OR.
e2192de59e457ae Johannes Berg   2023-01-18  127   *
e2192de59e457ae Johannes Berg   2023-01-18  128   * Unlike FIELD_PREP() this is a constant expression and can therefore
e2192de59e457ae Johannes Berg   2023-01-18  129   * be used in initializers. Error checking is less comfortable for this
e2192de59e457ae Johannes Berg   2023-01-18  130   * version, and non-constant masks cannot be used.
e2192de59e457ae Johannes Berg   2023-01-18  131   */
e2192de59e457ae Johannes Berg   2023-01-18  132  #define FIELD_PREP_CONST(_mask, _val)					\
e2192de59e457ae Johannes Berg   2023-01-18  133  	(								\
e2192de59e457ae Johannes Berg   2023-01-18  134  		/* mask must be non-zero */				\
e2192de59e457ae Johannes Berg   2023-01-18  135  		BUILD_BUG_ON_ZERO((_mask) == 0) +			\
e2192de59e457ae Johannes Berg   2023-01-18  136  		/* check if value fits */				\
e2192de59e457ae Johannes Berg   2023-01-18  137  		BUILD_BUG_ON_ZERO(~((_mask) >> __bf_shf(_mask)) & (_val)) + \
e2192de59e457ae Johannes Berg   2023-01-18  138  		/* check if mask is contiguous */			\
e2192de59e457ae Johannes Berg   2023-01-18  139  		__BF_CHECK_POW2((_mask) + (1ULL << __bf_shf(_mask))) +	\
e2192de59e457ae Johannes Berg   2023-01-18  140  		/* and create the value */				\
e2192de59e457ae Johannes Berg   2023-01-18  141  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
e2192de59e457ae Johannes Berg   2023-01-18  142  	)
e2192de59e457ae Johannes Berg   2023-01-18  143  
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  144  /**
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  145   * FIELD_GET() - extract a bitfield element
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  146   * @_mask: shifted mask defining the field's length and position
7240767450d6d83 Masahiro Yamada 2017-10-03  147   * @_reg:  value of entire bitfield
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  148   *
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  149   * FIELD_GET() extracts the field specified by @_mask from the
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  150   * bitfield passed in as @_reg by masking and shifting it down.
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  151   */
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  152  #define FIELD_GET(_mask, _reg)						\
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  153  	({								\
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  154  		__BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");	\
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  155  		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  156  	})
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  157  
e7d4a95da86e0b0 Johannes Berg   2018-06-20  158  extern void __compiletime_error("value doesn't fit into mask")
00b0c9b82663ac4 Al Viro         2017-12-14  159  __field_overflow(void);
00b0c9b82663ac4 Al Viro         2017-12-14  160  extern void __compiletime_error("bad bitfield mask")
00b0c9b82663ac4 Al Viro         2017-12-14  161  __bad_mask(void);
00b0c9b82663ac4 Al Viro         2017-12-14  162  static __always_inline u64 field_multiplier(u64 field)
00b0c9b82663ac4 Al Viro         2017-12-14  163  {
00b0c9b82663ac4 Al Viro         2017-12-14  164  	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
00b0c9b82663ac4 Al Viro         2017-12-14 @165  		__bad_mask();
00b0c9b82663ac4 Al Viro         2017-12-14  166  	return field & -field;
00b0c9b82663ac4 Al Viro         2017-12-14  167  }
00b0c9b82663ac4 Al Viro         2017-12-14  168  static __always_inline u64 field_mask(u64 field)
00b0c9b82663ac4 Al Viro         2017-12-14  169  {
00b0c9b82663ac4 Al Viro         2017-12-14  170  	return field / field_multiplier(field);
00b0c9b82663ac4 Al Viro         2017-12-14  171  }
e31a50162feb352 Alex Elder      2020-03-12  172  #define field_max(field)	((typeof(field))field_mask(field))
00b0c9b82663ac4 Al Viro         2017-12-14  173  #define ____MAKE_OP(type,base,to,from)					\
00b0c9b82663ac4 Al Viro         2017-12-14  174  static __always_inline __##type type##_encode_bits(base v, base field)	\
00b0c9b82663ac4 Al Viro         2017-12-14  175  {									\
e7d4a95da86e0b0 Johannes Berg   2018-06-20  176  	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
00b0c9b82663ac4 Al Viro         2017-12-14  177  		__field_overflow();					\
00b0c9b82663ac4 Al Viro         2017-12-14  178  	return to((v & field_mask(field)) * field_multiplier(field));	\
00b0c9b82663ac4 Al Viro         2017-12-14  179  }									\
00b0c9b82663ac4 Al Viro         2017-12-14  180  static __always_inline __##type type##_replace_bits(__##type old,	\
00b0c9b82663ac4 Al Viro         2017-12-14  181  					base val, base field)		\
00b0c9b82663ac4 Al Viro         2017-12-14  182  {									\
00b0c9b82663ac4 Al Viro         2017-12-14  183  	return (old & ~to(field)) | type##_encode_bits(val, field);	\
00b0c9b82663ac4 Al Viro         2017-12-14  184  }									\
00b0c9b82663ac4 Al Viro         2017-12-14  185  static __always_inline void type##p_replace_bits(__##type *p,		\
00b0c9b82663ac4 Al Viro         2017-12-14  186  					base val, base field)		\
00b0c9b82663ac4 Al Viro         2017-12-14  187  {									\
00b0c9b82663ac4 Al Viro         2017-12-14  188  	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
00b0c9b82663ac4 Al Viro         2017-12-14  189  }									\
00b0c9b82663ac4 Al Viro         2017-12-14  190  static __always_inline base type##_get_bits(__##type v, base field)	\
00b0c9b82663ac4 Al Viro         2017-12-14  191  {									\
00b0c9b82663ac4 Al Viro         2017-12-14  192  	return (from(v) & field)/field_multiplier(field);		\
00b0c9b82663ac4 Al Viro         2017-12-14  193  }
00b0c9b82663ac4 Al Viro         2017-12-14  194  #define __MAKE_OP(size)							\
00b0c9b82663ac4 Al Viro         2017-12-14  195  	____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
00b0c9b82663ac4 Al Viro         2017-12-14  196  	____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
00b0c9b82663ac4 Al Viro         2017-12-14  197  	____MAKE_OP(u##size,u##size,,)
37a3862e1238262 Johannes Berg   2018-06-20  198  ____MAKE_OP(u8,u8,,)
00b0c9b82663ac4 Al Viro         2017-12-14  199  __MAKE_OP(16)
00b0c9b82663ac4 Al Viro         2017-12-14  200  __MAKE_OP(32)
00b0c9b82663ac4 Al Viro         2017-12-14  201  __MAKE_OP(64)
00b0c9b82663ac4 Al Viro         2017-12-14  202  #undef __MAKE_OP
00b0c9b82663ac4 Al Viro         2017-12-14  203  #undef ____MAKE_OP
00b0c9b82663ac4 Al Viro         2017-12-14  204  

:::::: The code at line 165 was first introduced by commit
:::::: 00b0c9b82663ac42e5a09f58ce960f81f29d64ee Add primitives for manipulating bitfields both in host- and fixed-endian.

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
