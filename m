Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A11199949
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 05:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761974269; cv=none; b=GZMuAfQh+jBpt7Bew3t/lA7/tF0KS/68ej0QOnS66dN/FpmF0h5zsbg+6sT4OuzKX/BIDkJKUSk0E6A4ycLzqcqdGpoe/OC4/hrpDCIP2aZw6zcUZcstUemvxwDahboAlzBNxUGv0gR6DxArwefx0tl4jsKFDaLAK9MmBubMRCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761974269; c=relaxed/simple;
	bh=VinF4BPRjQ7SOCYZaJyj+NFcl5dr47/XG5JFMKVBj1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h6k79kOZib9XOQAVKz9SYh1lnRb7/o+6eIV8QPmUmq9YkIfiTKGUq40jFdCbZe8RHg7xhX23YJ7W+Fl/JcAVNuV5sWYTJCXq6vi7OIiwtZCYfMyWE6KkqkNEZicbplGq9cAorSO9Jde0+oqZNq2BlEInImiEB8xqOD2hEgKhyfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CorBMGtA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CorBMGtA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761974267; x=1793510267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VinF4BPRjQ7SOCYZaJyj+NFcl5dr47/XG5JFMKVBj1s=;
  b=CorBMGtAIgtavm5H9EX/Jk94gqBV9iHPjJw6vBtLHHtGMzv9vRePFBpT
   ihEms2n7nT93+MvznMSAnTYL2IrOuBpRcjtEkfn3ybMzdnuiwetSfFjso
   WulyEPWWTiREVUI64v5adE4wiVIsTTLT9p+eFGUjGRpaC0Brh1/KjmJt9
   3VwX0Rx8c+1o0XQ/2MAqTgmPGRO+x1fl7bS2Zfiu7o+eeswvlV2nGVKNy
   04/Y1ZYS4BihSB7mcRoc6pELPSXunpIs4TRfdKbC9bbqocTRCcZpgewxQ
   s4FENfEGY9SfE+5BfYRmftnQ+uWuqEndjDda5RsQOrSyF7OrUIJHtEx6U
   w==;
X-CSE-ConnectionGUID: C6sDyxm2Sse6iUbL9RmCeA==
X-CSE-MsgGUID: ctq9WSMmRxupmX9D/tchBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67970832"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67970832"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 22:17:47 -0700
X-CSE-ConnectionGUID: hjL4vleSQ0iGDBQm5Onc7g==
X-CSE-MsgGUID: CX9OD0VzTjWs2rXBKGLJbw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2025 22:17:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF3zj-000Nvw-2u;
	Sat, 01 Nov 2025 05:17:43 +0000
Date: Sat, 1 Nov 2025 13:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/config.c:15:3:
 warning: unused variable 'cfg_ops_t'
Message-ID: <202511011352.x6bDn1G2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6a5b2f9a14178b13fe5efc52ba6575f5294c1270
commit: 8733e7995bd92d8159ba0df49df547f4b9c4862b [3075/3075] ub:ubus: Add Ubus setting configuration space function
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251101/202511011352.x6bDn1G2-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011352.x6bDn1G2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011352.x6bDn1G2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/ubus/config.c:51:5: warning: no previous prototype for function 'ub_cfg_read_byte' [-Wmissing-prototypes]
      51 | int ub_cfg_read_byte(struct ub_entity *uent, u64 pos, u8 *val)
         |     ^
   drivers/ub/ubus/config.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      51 | int ub_cfg_read_byte(struct ub_entity *uent, u64 pos, u8 *val)
         | ^
         | static 
   drivers/ub/ubus/config.c:60:5: warning: no previous prototype for function 'ub_cfg_read_word' [-Wmissing-prototypes]
      60 | int ub_cfg_read_word(struct ub_entity *uent, u64 pos, u16 *val)
         |     ^
   drivers/ub/ubus/config.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      60 | int ub_cfg_read_word(struct ub_entity *uent, u64 pos, u16 *val)
         | ^
         | static 
   drivers/ub/ubus/config.c:69:5: warning: no previous prototype for function 'ub_cfg_read_dword' [-Wmissing-prototypes]
      69 | int ub_cfg_read_dword(struct ub_entity *uent, u64 pos, u32 *val)
         |     ^
   drivers/ub/ubus/config.c:69:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      69 | int ub_cfg_read_dword(struct ub_entity *uent, u64 pos, u32 *val)
         | ^
         | static 
   drivers/ub/ubus/config.c:78:5: warning: no previous prototype for function 'ub_cfg_write_byte' [-Wmissing-prototypes]
      78 | int ub_cfg_write_byte(struct ub_entity *uent, u64 pos, u8 val)
         |     ^
   drivers/ub/ubus/config.c:78:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      78 | int ub_cfg_write_byte(struct ub_entity *uent, u64 pos, u8 val)
         | ^
         | static 
   drivers/ub/ubus/config.c:87:5: warning: no previous prototype for function 'ub_cfg_write_word' [-Wmissing-prototypes]
      87 | int ub_cfg_write_word(struct ub_entity *uent, u64 pos, u16 val)
         |     ^
   drivers/ub/ubus/config.c:87:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      87 | int ub_cfg_write_word(struct ub_entity *uent, u64 pos, u16 val)
         | ^
         | static 
   drivers/ub/ubus/config.c:96:5: warning: no previous prototype for function 'ub_cfg_write_dword' [-Wmissing-prototypes]
      96 | int ub_cfg_write_dword(struct ub_entity *uent, u64 pos, u32 val)
         |     ^
   drivers/ub/ubus/config.c:96:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      96 | int ub_cfg_write_dword(struct ub_entity *uent, u64 pos, u32 val)
         | ^
         | static 
>> drivers/ub/ubus/config.c:15:3: warning: unused variable 'cfg_ops_t' [-Wunused-const-variable]
      15 | } cfg_ops_t;
         |   ^~~~~~~~~
   7 warnings generated.


vim +/cfg_ops_t +15 drivers/ub/ubus/config.c

     7	
     8	static const struct cfg_ops {
     9		read_byte_f cfg_read_byte;
    10		read_word_f cfg_read_word;
    11		read_dword_f cfg_read_dword;
    12		write_byte_f cfg_write_byte;
    13		write_word_f cfg_write_word;
    14		write_dword_f cfg_write_dword;
  > 15	} cfg_ops_t;
    16	
    17	static struct cfg_ops ub_cfg_ops = {};
    18	
    19	int register_ub_cfg_read_ops(read_byte_f rb, read_word_f rw, read_dword_f rdw)
    20	{
    21		if (rb && rw && rdw) {
    22			ub_cfg_ops.cfg_read_byte = rb;
    23			ub_cfg_ops.cfg_read_word = rw;
    24			ub_cfg_ops.cfg_read_dword = rdw;
    25			return 0;
    26		}
    27	
    28		return -EINVAL;
    29	}
    30	EXPORT_SYMBOL_GPL(register_ub_cfg_read_ops);
    31	
    32	int register_ub_cfg_write_ops(write_byte_f wb, write_word_f ww, write_dword_f wdw)
    33	{
    34		if (wb && ww && wdw) {
    35			ub_cfg_ops.cfg_write_byte = wb;
    36			ub_cfg_ops.cfg_write_word = ww;
    37			ub_cfg_ops.cfg_write_dword = wdw;
    38			return 0;
    39		}
    40	
    41		return -EINVAL;
    42	}
    43	EXPORT_SYMBOL_GPL(register_ub_cfg_write_ops);
    44	
    45	void unregister_ub_cfg_ops(void)
    46	{
    47		memset(&ub_cfg_ops, 0, sizeof(struct cfg_ops));
    48	}
    49	EXPORT_SYMBOL_GPL(unregister_ub_cfg_ops);
    50	
    51	int ub_cfg_read_byte(struct ub_entity *uent, u64 pos, u8 *val)
    52	{
    53		if (!ub_cfg_ops.cfg_read_byte)
    54			return -ENODEV;
    55	
    56		return ub_cfg_ops.cfg_read_byte(uent, pos, val);
    57	}
    58	EXPORT_SYMBOL_GPL(ub_cfg_read_byte);
    59	
    60	int ub_cfg_read_word(struct ub_entity *uent, u64 pos, u16 *val)
    61	{
    62		if (!ub_cfg_ops.cfg_read_word)
    63			return -ENODEV;
    64	
    65		return ub_cfg_ops.cfg_read_word(uent, pos, val);
    66	}
    67	EXPORT_SYMBOL_GPL(ub_cfg_read_word);
    68	
    69	int ub_cfg_read_dword(struct ub_entity *uent, u64 pos, u32 *val)
    70	{
    71		if (!ub_cfg_ops.cfg_read_dword)
    72			return -ENODEV;
    73	
    74		return ub_cfg_ops.cfg_read_dword(uent, pos, val);
    75	}
    76	EXPORT_SYMBOL_GPL(ub_cfg_read_dword);
    77	
    78	int ub_cfg_write_byte(struct ub_entity *uent, u64 pos, u8 val)
    79	{
    80		if (!ub_cfg_ops.cfg_write_byte)
    81			return -ENODEV;
    82	
    83		return ub_cfg_ops.cfg_write_byte(uent, pos, val);
    84	}
    85	EXPORT_SYMBOL_GPL(ub_cfg_write_byte);
    86	
    87	int ub_cfg_write_word(struct ub_entity *uent, u64 pos, u16 val)
    88	{
    89		if (!ub_cfg_ops.cfg_write_word)
    90			return -ENODEV;
    91	
    92		return ub_cfg_ops.cfg_write_word(uent, pos, val);
    93	}
    94	EXPORT_SYMBOL_GPL(ub_cfg_write_word);
    95	
  > 96	int ub_cfg_write_dword(struct ub_entity *uent, u64 pos, u32 val)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
