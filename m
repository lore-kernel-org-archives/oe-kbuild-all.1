Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5AFAD51
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 00:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964911; cv=none; b=HiPPFYalEQZFRwlooz4A77GuHiTv7f8E+nKNDzJFaKB7zcPjxkRZsN+J5ui5b1thxdS6GXF9hwA2IasrquO2VffqbUcNYtZpWb7LvZMt0Fx63LmBhQiXJUrK1WZoBjThHmQ2S5D68Ke3rJOGQt/0GbPCs/9qLb7EBxW4WsVDjIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964911; c=relaxed/simple;
	bh=UU8NKO3i6Opffnd/ZzFUJ8EgWaGQKg8LmRWjSObqWoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXMfxr/uYvJWN/i340srl1Y/xs/u3VDh8tCwGn4Qe/UPEap9fM2GMEG69eTEtch03pFBpzGKds8pNb0Dm2N6+t9/dQoQzfYadvraH7RgKvcUIH4/PyFQHJ5rGhymV4HYqnhmOzD6ApPJVAQqKWrRXWEr4qHAgupMSqnQb+zCD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KerkRlHe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KerkRlHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733964908; x=1765500908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UU8NKO3i6Opffnd/ZzFUJ8EgWaGQKg8LmRWjSObqWoU=;
  b=KerkRlHeB0JsoHJJ0CmscCXzRxVN6ooiDy4zdjwt/OmKjUvmyxZKLNuk
   Ia7/gWsev3revTTiVjb58/BdlKOdx5R4BPBqqP2DUKKvlP3+OgqHuqgwM
   wVlbmi3yL93ZwMcDhW1R1qJxNQSGSklFVT9WaTvh6rNyHV1l9knjXXxiR
   GL3Qb9/qckQMX+JK9t6E1GV9Ac0ca6SVwROjdLm2Hxzp3voNuH0b/ufSg
   RWz+eJUaPiBavRSKGqOpgsEfETsud8ApV6eRRryQiwhmOAeq7arEV4LQk
   DOrfppa4rW3neyJ7yhvZOsaiK6uWTiWZFuZHqW7FPA+FjxbVW/+o3hx6v
   Q==;
X-CSE-ConnectionGUID: eLM0DuoBSOi2zBlrXz3fDQ==
X-CSE-MsgGUID: ABRdUxRMS/yp7NzeLSHyoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34610360"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34610360"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 16:55:08 -0800
X-CSE-ConnectionGUID: J2YV//YbS5m3VOr84ABLxg==
X-CSE-MsgGUID: GQic+KjxSem3hCX/dKipvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100564227"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2024 16:55:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLXTs-0007Gr-1G;
	Thu, 12 Dec 2024 00:55:04 +0000
Date: Thu, 12 Dec 2024 08:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 07/10] net: mvneta: convert to phylink EEE
 implementation
Message-ID: <202412120802.VcALKEWs-lkp@intel.com>
References: <E1tKefs-006SN1-PG@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tKefs-006SN1-PG@rmk-PC.armlinux.org.uk>

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-mdio-add-definition-for-clock-stop-capable-bit/20241210-022608
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tKefs-006SN1-PG%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 07/10] net: mvneta: convert to phylink EEE implementation
config: arm-randconfig-002-20241210 (https://download.01.org/0day-ci/archive/20241212/202412120802.VcALKEWs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120802.VcALKEWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120802.VcALKEWs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/include/asm/ptrace.h:13,
                    from arch/arm/include/asm/irqflags.h:7,
                    from include/linux/irqflags.h:18,
                    from arch/arm/include/asm/bitops.h:28,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/net/ethernet/marvell/mvneta.c:14:
   In function 'u32_encode_bits',
       inlined from 'u32_replace_bits' at include/linux/bitfield.h:201:1,
       inlined from 'mvneta_mac_enable_tx_lpi' at drivers/net/ethernet/marvell/mvneta.c:4333:9:
>> include/linux/bitfield.h:178:17: error: call to '__field_overflow' declared with attribute error: value doesn't fit into mask
     178 |                 __field_overflow();                                     \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:198:9: note: in expansion of macro '____MAKE_OP'
     198 |         ____MAKE_OP(u##size,u##size,,)
         |         ^~~~~~~~~~~
   include/linux/bitfield.h:201:1: note: in expansion of macro '__MAKE_OP'
     201 | __MAKE_OP(32)
         | ^~~~~~~~~
   In function 'field_multiplier',
       inlined from 'field_mask' at include/linux/bitfield.h:171:17,
       inlined from 'u32_encode_bits' at include/linux/bitfield.h:201:1,
       inlined from 'u32_replace_bits' at include/linux/bitfield.h:201:1,
       inlined from 'mvneta_mac_enable_tx_lpi' at drivers/net/ethernet/marvell/mvneta.c:4333:9:
>> include/linux/bitfield.h:166:17: error: call to '__bad_mask' declared with attribute error: bad bitfield mask
     166 |                 __bad_mask();
         |                 ^~~~~~~~~~~~
   In function 'u32_encode_bits',
       inlined from 'u32_replace_bits' at include/linux/bitfield.h:201:1,
       inlined from 'mvneta_mac_enable_tx_lpi' at drivers/net/ethernet/marvell/mvneta.c:4333:9:
>> include/linux/bitfield.h:178:17: error: call to '__field_overflow' declared with attribute error: value doesn't fit into mask
     178 |                 __field_overflow();                                     \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:198:9: note: in expansion of macro '____MAKE_OP'
     198 |         ____MAKE_OP(u##size,u##size,,)
         |         ^~~~~~~~~~~
   include/linux/bitfield.h:201:1: note: in expansion of macro '__MAKE_OP'
     201 | __MAKE_OP(32)
         | ^~~~~~~~~
   In function 'field_multiplier',
       inlined from 'field_mask' at include/linux/bitfield.h:171:17,
       inlined from 'u32_encode_bits' at include/linux/bitfield.h:201:1,
       inlined from 'u32_replace_bits' at include/linux/bitfield.h:201:1,
       inlined from 'mvneta_mac_enable_tx_lpi' at drivers/net/ethernet/marvell/mvneta.c:4333:9:
>> include/linux/bitfield.h:166:17: error: call to '__bad_mask' declared with attribute error: bad bitfield mask
     166 |                 __bad_mask();
         |                 ^~~~~~~~~~~~
   In function 'field_multiplier',
       inlined from 'u32_encode_bits' at include/linux/bitfield.h:201:1,
       inlined from 'u32_replace_bits' at include/linux/bitfield.h:201:1,
       inlined from 'mvneta_mac_enable_tx_lpi' at drivers/net/ethernet/marvell/mvneta.c:4333:9:
>> include/linux/bitfield.h:166:17: error: call to '__bad_mask' declared with attribute error: bad bitfield mask
     166 |                 __bad_mask();
         |                 ^~~~~~~~~~~~
   In function 'field_multiplier',
       inlined from 'field_mask' at include/linux/bitfield.h:171:17,
       inlined from 'u32_encode_bits' at include/linux/bitfield.h:201:1,
       inlined from 'u32_replace_bits' at include/linux/bitfield.h:201:1,
       inlined from 'mvneta_mac_enable_tx_lpi' at drivers/net/ethernet/marvell/mvneta.c:4338:9:
>> include/linux/bitfield.h:166:17: error: call to '__bad_mask' declared with attribute error: bad bitfield mask
     166 |                 __bad_mask();
         |                 ^~~~~~~~~~~~
   In function 'u32_encode_bits',
       inlined from 'u32_replace_bits' at include/linux/bitfield.h:201:1,
       inlined from 'mvneta_mac_enable_tx_lpi' at drivers/net/ethernet/marvell/mvneta.c:4338:9:
>> include/linux/bitfield.h:178:17: error: call to '__field_overflow' declared with attribute error: value doesn't fit into mask
     178 |                 __field_overflow();                                     \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:198:9: note: in expansion of macro '____MAKE_OP'
     198 |         ____MAKE_OP(u##size,u##size,,)
         |         ^~~~~~~~~~~
   include/linux/bitfield.h:201:1: note: in expansion of macro '__MAKE_OP'
     201 | __MAKE_OP(32)
         | ^~~~~~~~~
   In function 'field_multiplier',
       inlined from 'field_mask' at include/linux/bitfield.h:171:17,
       inlined from 'u32_encode_bits' at include/linux/bitfield.h:201:1,
       inlined from 'u32_replace_bits' at include/linux/bitfield.h:201:1,
       inlined from 'mvneta_mac_enable_tx_lpi' at drivers/net/ethernet/marvell/mvneta.c:4338:9:
>> include/linux/bitfield.h:166:17: error: call to '__bad_mask' declared with attribute error: bad bitfield mask
     166 |                 __bad_mask();
         |                 ^~~~~~~~~~~~
   In function 'field_multiplier',
       inlined from 'u32_encode_bits' at include/linux/bitfield.h:201:1,
       inlined from 'u32_replace_bits' at include/linux/bitfield.h:201:1,
       inlined from 'mvneta_mac_enable_tx_lpi' at drivers/net/ethernet/marvell/mvneta.c:4338:9:
>> include/linux/bitfield.h:166:17: error: call to '__bad_mask' declared with attribute error: bad bitfield mask
     166 |                 __bad_mask();
         |                 ^~~~~~~~~~~~


vim +178 include/linux/bitfield.h

e2192de59e457ae Johannes Berg   2023-01-18  120  
e2192de59e457ae Johannes Berg   2023-01-18  121  /**
e2192de59e457ae Johannes Berg   2023-01-18  122   * FIELD_PREP_CONST() - prepare a constant bitfield element
e2192de59e457ae Johannes Berg   2023-01-18  123   * @_mask: shifted mask defining the field's length and position
e2192de59e457ae Johannes Berg   2023-01-18  124   * @_val:  value to put in the field
e2192de59e457ae Johannes Berg   2023-01-18  125   *
e2192de59e457ae Johannes Berg   2023-01-18  126   * FIELD_PREP_CONST() masks and shifts up the value.  The result should
e2192de59e457ae Johannes Berg   2023-01-18  127   * be combined with other fields of the bitfield using logical OR.
e2192de59e457ae Johannes Berg   2023-01-18  128   *
e2192de59e457ae Johannes Berg   2023-01-18  129   * Unlike FIELD_PREP() this is a constant expression and can therefore
e2192de59e457ae Johannes Berg   2023-01-18  130   * be used in initializers. Error checking is less comfortable for this
e2192de59e457ae Johannes Berg   2023-01-18  131   * version, and non-constant masks cannot be used.
e2192de59e457ae Johannes Berg   2023-01-18  132   */
e2192de59e457ae Johannes Berg   2023-01-18  133  #define FIELD_PREP_CONST(_mask, _val)					\
e2192de59e457ae Johannes Berg   2023-01-18  134  	(								\
e2192de59e457ae Johannes Berg   2023-01-18  135  		/* mask must be non-zero */				\
e2192de59e457ae Johannes Berg   2023-01-18  136  		BUILD_BUG_ON_ZERO((_mask) == 0) +			\
e2192de59e457ae Johannes Berg   2023-01-18  137  		/* check if value fits */				\
e2192de59e457ae Johannes Berg   2023-01-18  138  		BUILD_BUG_ON_ZERO(~((_mask) >> __bf_shf(_mask)) & (_val)) + \
e2192de59e457ae Johannes Berg   2023-01-18  139  		/* check if mask is contiguous */			\
e2192de59e457ae Johannes Berg   2023-01-18  140  		__BF_CHECK_POW2((_mask) + (1ULL << __bf_shf(_mask))) +	\
e2192de59e457ae Johannes Berg   2023-01-18  141  		/* and create the value */				\
e2192de59e457ae Johannes Berg   2023-01-18  142  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
e2192de59e457ae Johannes Berg   2023-01-18  143  	)
e2192de59e457ae Johannes Berg   2023-01-18  144  
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  145  /**
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  146   * FIELD_GET() - extract a bitfield element
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  147   * @_mask: shifted mask defining the field's length and position
7240767450d6d83 Masahiro Yamada 2017-10-03  148   * @_reg:  value of entire bitfield
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  149   *
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  150   * FIELD_GET() extracts the field specified by @_mask from the
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  151   * bitfield passed in as @_reg by masking and shifting it down.
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  152   */
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  153  #define FIELD_GET(_mask, _reg)						\
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  154  	({								\
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  155  		__BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");	\
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  156  		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  157  	})
3e9b3112ec74f19 Jakub Kicinski  2016-08-31  158  
e7d4a95da86e0b0 Johannes Berg   2018-06-20  159  extern void __compiletime_error("value doesn't fit into mask")
00b0c9b82663ac4 Al Viro         2017-12-14  160  __field_overflow(void);
00b0c9b82663ac4 Al Viro         2017-12-14  161  extern void __compiletime_error("bad bitfield mask")
00b0c9b82663ac4 Al Viro         2017-12-14  162  __bad_mask(void);
00b0c9b82663ac4 Al Viro         2017-12-14  163  static __always_inline u64 field_multiplier(u64 field)
00b0c9b82663ac4 Al Viro         2017-12-14  164  {
00b0c9b82663ac4 Al Viro         2017-12-14  165  	if ((field | (field - 1)) & ((field | (field - 1)) + 1))
00b0c9b82663ac4 Al Viro         2017-12-14 @166  		__bad_mask();
00b0c9b82663ac4 Al Viro         2017-12-14  167  	return field & -field;
00b0c9b82663ac4 Al Viro         2017-12-14  168  }
00b0c9b82663ac4 Al Viro         2017-12-14  169  static __always_inline u64 field_mask(u64 field)
00b0c9b82663ac4 Al Viro         2017-12-14  170  {
00b0c9b82663ac4 Al Viro         2017-12-14  171  	return field / field_multiplier(field);
00b0c9b82663ac4 Al Viro         2017-12-14  172  }
e31a50162feb352 Alex Elder      2020-03-12  173  #define field_max(field)	((typeof(field))field_mask(field))
00b0c9b82663ac4 Al Viro         2017-12-14  174  #define ____MAKE_OP(type,base,to,from)					\
00b0c9b82663ac4 Al Viro         2017-12-14  175  static __always_inline __##type type##_encode_bits(base v, base field)	\
00b0c9b82663ac4 Al Viro         2017-12-14  176  {									\
e7d4a95da86e0b0 Johannes Berg   2018-06-20  177  	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
00b0c9b82663ac4 Al Viro         2017-12-14 @178  		__field_overflow();					\
00b0c9b82663ac4 Al Viro         2017-12-14  179  	return to((v & field_mask(field)) * field_multiplier(field));	\
00b0c9b82663ac4 Al Viro         2017-12-14  180  }									\
00b0c9b82663ac4 Al Viro         2017-12-14  181  static __always_inline __##type type##_replace_bits(__##type old,	\
00b0c9b82663ac4 Al Viro         2017-12-14  182  					base val, base field)		\
00b0c9b82663ac4 Al Viro         2017-12-14  183  {									\
00b0c9b82663ac4 Al Viro         2017-12-14  184  	return (old & ~to(field)) | type##_encode_bits(val, field);	\
00b0c9b82663ac4 Al Viro         2017-12-14  185  }									\
00b0c9b82663ac4 Al Viro         2017-12-14  186  static __always_inline void type##p_replace_bits(__##type *p,		\
00b0c9b82663ac4 Al Viro         2017-12-14  187  					base val, base field)		\
00b0c9b82663ac4 Al Viro         2017-12-14  188  {									\
00b0c9b82663ac4 Al Viro         2017-12-14  189  	*p = (*p & ~to(field)) | type##_encode_bits(val, field);	\
00b0c9b82663ac4 Al Viro         2017-12-14  190  }									\
00b0c9b82663ac4 Al Viro         2017-12-14  191  static __always_inline base type##_get_bits(__##type v, base field)	\
00b0c9b82663ac4 Al Viro         2017-12-14  192  {									\
00b0c9b82663ac4 Al Viro         2017-12-14  193  	return (from(v) & field)/field_multiplier(field);		\
00b0c9b82663ac4 Al Viro         2017-12-14  194  }
00b0c9b82663ac4 Al Viro         2017-12-14  195  #define __MAKE_OP(size)							\
00b0c9b82663ac4 Al Viro         2017-12-14  196  	____MAKE_OP(le##size,u##size,cpu_to_le##size,le##size##_to_cpu)	\
00b0c9b82663ac4 Al Viro         2017-12-14  197  	____MAKE_OP(be##size,u##size,cpu_to_be##size,be##size##_to_cpu)	\
00b0c9b82663ac4 Al Viro         2017-12-14  198  	____MAKE_OP(u##size,u##size,,)
37a3862e1238262 Johannes Berg   2018-06-20  199  ____MAKE_OP(u8,u8,,)
00b0c9b82663ac4 Al Viro         2017-12-14  200  __MAKE_OP(16)
00b0c9b82663ac4 Al Viro         2017-12-14  201  __MAKE_OP(32)
00b0c9b82663ac4 Al Viro         2017-12-14  202  __MAKE_OP(64)
00b0c9b82663ac4 Al Viro         2017-12-14  203  #undef __MAKE_OP
00b0c9b82663ac4 Al Viro         2017-12-14  204  #undef ____MAKE_OP
00b0c9b82663ac4 Al Viro         2017-12-14  205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
