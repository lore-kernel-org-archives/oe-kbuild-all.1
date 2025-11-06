Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4981B1E0DD8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 04:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762405093; cv=none; b=gq+F5f0GtXNSFLKNbUg6imznBH0oGd/2GHHJTXXUazL53ZgpR5udpgesuaPkQIufwGau1+ipctSrzjs0EeQfaNJOWUzcCSJQFbyJHjM0bIQdTbSLBCWaKvyXMV25YWz1pRHpL9oaBW8zBu8iTXDAKEIMOi53V4gogkju0pgvuVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762405093; c=relaxed/simple;
	bh=LTKRVCqC5S2lHDlXvtlHcH4DZkGCyGQ3RfsCiL4CeYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EBX3DXmt5wdB9GbEnxqPP5sh8WOdH3f4OjFyiby3qVZrRdDEjhcg6JQlT52LMWgccgw0Z99kfwVUOSs1LMUP9jIg+Jm2Yf09e7C4/tGViFNaW4n/u0LTpy2YG2szbk0/GhkNKq6es8nQ8x+IMVmYdubjlNhhT95a5KwbHmoauTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9/JU0Qp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9/JU0Qp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762405090; x=1793941090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LTKRVCqC5S2lHDlXvtlHcH4DZkGCyGQ3RfsCiL4CeYk=;
  b=b9/JU0QpRJsOV+o5C4EgUEvo+2mhuCsTidzWtmw34/dZ+sbOugfrquHF
   2PkW8Z8cv6ZD1XnMvcYHQyXsH3IE6fBuTNTFPhgBXF3r5oDHCpKus5eVQ
   JL1Lkr75xx3Lpc55HpCCg1H/4tQaBH/AKNnBULRhGIzRtpUJpckWMalw2
   IPe/fllEN6mR9u3LdQ51e0hB9omk3zt4NVWnQO9gxqjn6CBSGf8noiC8B
   tZ0fVKHdyg/Nt+RiF9MF9YFxdlAVcd8MgQPYymhhmDB9QrM/Lu2/CEXEM
   Wu7Kt/X30Ry9WOaG2AW/9wpY0DUIIsOttF+lr6dN7j9414+fXjB1PO8bp
   w==;
X-CSE-ConnectionGUID: LrxzeTDUTLG9SUo1m/QRgw==
X-CSE-MsgGUID: k+0sDpWSQmGUMmDMNPOSRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64229342"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="64229342"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 20:58:10 -0800
X-CSE-ConnectionGUID: tVCm9V3LTUesDKoZ3Dqerg==
X-CSE-MsgGUID: 3kt0K5mAR3SCMNrawSY0Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="218315908"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2025 20:58:08 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGs4U-000TVA-1E;
	Thu, 06 Nov 2025 04:58:06 +0000
Date: Thu, 6 Nov 2025 12:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/cap.c:12:6: warning:
 no previous prototype for function 'ub_set_cap_bitmap'
Message-ID: <202511061247.kuPODIrY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b2b8512ca97108929f3aca5405875d91577b8c80
commit: c21b483526d766fd97d491f3951433f69fde3ac3 [3075/3075] ub:ubus: Add UBUS capability interfaces
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251106/202511061247.kuPODIrY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061247.kuPODIrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061247.kuPODIrY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/cap.c:12:6: warning: no previous prototype for function 'ub_set_cap_bitmap' [-Wmissing-prototypes]
      12 | void ub_set_cap_bitmap(struct ub_entity *uent)
         |      ^
   drivers/ub/ubus/cap.c:12:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      12 | void ub_set_cap_bitmap(struct ub_entity *uent)
         | ^
         | static 
>> drivers/ub/ubus/cap.c:47:5: warning: no previous prototype for function 'ub_find_capability' [-Wmissing-prototypes]
      47 | u32 ub_find_capability(u32 cap)
         |     ^
   drivers/ub/ubus/cap.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | u32 ub_find_capability(u32 cap)
         | ^
         | static 
>> drivers/ub/ubus/cap.c:52:5: warning: no previous prototype for function 'ub_cap_read_byte' [-Wmissing-prototypes]
      52 | int ub_cap_read_byte(struct ub_entity *uent, u32 cap, u32 off, u8 *val)
         |     ^
   drivers/ub/ubus/cap.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      52 | int ub_cap_read_byte(struct ub_entity *uent, u32 cap, u32 off, u8 *val)
         | ^
         | static 
>> drivers/ub/ubus/cap.c:70:5: warning: no previous prototype for function 'ub_cap_read_word' [-Wmissing-prototypes]
      70 | int ub_cap_read_word(struct ub_entity *uent, u32 cap, u32 off, u16 *val)
         |     ^
   drivers/ub/ubus/cap.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      70 | int ub_cap_read_word(struct ub_entity *uent, u32 cap, u32 off, u16 *val)
         | ^
         | static 
>> drivers/ub/ubus/cap.c:88:5: warning: no previous prototype for function 'ub_cap_read_dword' [-Wmissing-prototypes]
      88 | int ub_cap_read_dword(struct ub_entity *uent, u32 cap, u32 off, u32 *val)
         |     ^
   drivers/ub/ubus/cap.c:88:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      88 | int ub_cap_read_dword(struct ub_entity *uent, u32 cap, u32 off, u32 *val)
         | ^
         | static 
>> drivers/ub/ubus/cap.c:106:5: warning: no previous prototype for function 'ub_cap_write_byte' [-Wmissing-prototypes]
     106 | int ub_cap_write_byte(struct ub_entity *uent, u32 cap, u32 off, u8 val)
         |     ^
   drivers/ub/ubus/cap.c:106:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     106 | int ub_cap_write_byte(struct ub_entity *uent, u32 cap, u32 off, u8 val)
         | ^
         | static 
>> drivers/ub/ubus/cap.c:117:5: warning: no previous prototype for function 'ub_cap_write_word' [-Wmissing-prototypes]
     117 | int ub_cap_write_word(struct ub_entity *uent, u32 cap, u32 off, u16 val)
         |     ^
   drivers/ub/ubus/cap.c:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     117 | int ub_cap_write_word(struct ub_entity *uent, u32 cap, u32 off, u16 val)
         | ^
         | static 
>> drivers/ub/ubus/cap.c:128:5: warning: no previous prototype for function 'ub_cap_write_dword' [-Wmissing-prototypes]
     128 | int ub_cap_write_dword(struct ub_entity *uent, u32 cap, u32 off, u32 val)
         |     ^
   drivers/ub/ubus/cap.c:128:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     128 | int ub_cap_write_dword(struct ub_entity *uent, u32 cap, u32 off, u32 val)
         | ^
         | static 
>> drivers/ub/ubus/cap.c:139:5: warning: no previous prototype for function 'ub_cap_clear_and_set_word' [-Wmissing-prototypes]
     139 | int ub_cap_clear_and_set_word(struct ub_entity *dev, u32 cap, u32 off,
         |     ^
   drivers/ub/ubus/cap.c:139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     139 | int ub_cap_clear_and_set_word(struct ub_entity *dev, u32 cap, u32 off,
         | ^
         | static 
>> drivers/ub/ubus/cap.c:155:5: warning: no previous prototype for function 'ub_cap_clear_and_set_dword' [-Wmissing-prototypes]
     155 | int ub_cap_clear_and_set_dword(struct ub_entity *dev, u32 cap, u32 off,
         |     ^
   drivers/ub/ubus/cap.c:155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     155 | int ub_cap_clear_and_set_dword(struct ub_entity *dev, u32 cap, u32 off,
         | ^
         | static 
>> drivers/ub/ubus/cap.c:224:6: warning: no previous prototype for function 'ub_init_capabilities' [-Wmissing-prototypes]
     224 | void ub_init_capabilities(struct ub_entity *uent)
         |      ^
   drivers/ub/ubus/cap.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | void ub_init_capabilities(struct ub_entity *uent)
         | ^
         | static 
>> drivers/ub/ubus/cap.c:238:6: warning: no previous prototype for function 'ub_uninit_capabilities' [-Wmissing-prototypes]
     238 | void ub_uninit_capabilities(struct ub_entity *uent)
         |      ^
   drivers/ub/ubus/cap.c:238:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     238 | void ub_uninit_capabilities(struct ub_entity *uent)
         | ^
         | static 
   drivers/ub/ubus/cap.c:171:19: warning: unused function 'ub_cap_set_word' [-Wunused-function]
     171 | static inline int ub_cap_set_word(struct ub_entity *dev, u32 cap, u32 off,
         |                   ^~~~~~~~~~~~~~~
   drivers/ub/ubus/cap.c:177:19: warning: unused function 'ub_cap_set_dword' [-Wunused-function]
     177 | static inline int ub_cap_set_dword(struct ub_entity *dev, u32 cap, u32 off,
         |                   ^~~~~~~~~~~~~~~~
   drivers/ub/ubus/cap.c:183:19: warning: unused function 'ub_cap_clear_word' [-Wunused-function]
     183 | static inline int ub_cap_clear_word(struct ub_entity *dev, u32 cap, u32 off,
         |                   ^~~~~~~~~~~~~~~~~
   drivers/ub/ubus/cap.c:189:19: warning: unused function 'ub_cap_clear_dword' [-Wunused-function]
     189 | static inline int ub_cap_clear_dword(struct ub_entity *dev, u32 cap, u32 off,
         |                   ^~~~~~~~~~~~~~~~~~
   16 warnings generated.


vim +/ub_set_cap_bitmap +12 drivers/ub/ubus/cap.c

    11	
  > 12	void ub_set_cap_bitmap(struct ub_entity *uent)
    13	{
    14		int ret;
    15		u32 i;
    16	
    17		for (i = 0; i < SZ_8; i++) {
    18			ret = ub_cfg_read_dword(uent, UB_CFG1_CAP_BITMAP + (i << SZ_2),
    19						&uent->cfg1_bitmap[i]);
    20			if (ret)
    21				ub_err(uent, "Read cfg1 cap bitmap failed, ret=%d\n",
    22				       ret);
    23		}
    24	
    25		if (is_p_device(uent))
    26			return;
    27	
    28		for (i = 0; i < SZ_8; i++) {
    29			ret = ub_cfg_read_dword(uent, UB_CFG0_CAP_BITMAP + (i << SZ_2),
    30						&uent->cfg0_bitmap[i]);
    31			if (ret)
    32				ub_err(uent, "Read cfg0 cap bitmap failed, ret=%d\n",
    33				       ret);
    34		}
    35	}
    36	
    37	/* Check whether the capbility register is implemented. */
    38	static bool ub_cap_reg_implemented(struct ub_entity *uent, u32 cap)
    39	{
    40		u32 i = (cap & 0xFF) / SZ_32;
    41		u32 val = (cap >> SZ_8) ? uent->cfg1_bitmap[i] : uent->cfg0_bitmap[i];
    42	
    43		return val & BIT((cap & 0xFF) % SZ_32);
    44	}
    45	
    46	/* find the start address of capability */
  > 47	u32 ub_find_capability(u32 cap)
    48	{
    49		return (cap << BITS_PER_BYTE) << SZ_2;
    50	}
    51	
  > 52	int ub_cap_read_byte(struct ub_entity *uent, u32 cap, u32 off, u8 *val)
    53	{
    54		int ret;
    55	
    56		*val = 0;
    57		if (off >= SZ_1K)
    58			return -EFAULT;
    59	
    60		if (!ub_cap_reg_implemented(uent, cap))
    61			return -ENXIO;
    62	
    63		ret = ub_cfg_read_byte(uent, ub_find_capability(cap) + off, val);
    64		if (ret)
    65			*val = 0;
    66	
    67		return ret;
    68	}
    69	
  > 70	int ub_cap_read_word(struct ub_entity *uent, u32 cap, u32 off, u16 *val)
    71	{
    72		int ret;
    73	
    74		*val = 0;
    75		if (off & 1 || off >= SZ_1K)
    76			return -EFAULT;
    77	
    78		if (!ub_cap_reg_implemented(uent, cap))
    79			return -ENXIO;
    80	
    81		ret = ub_cfg_read_word(uent, ub_find_capability(cap) + off, val);
    82		if (ret)
    83			*val = 0;
    84	
    85		return ret;
    86	}
    87	
  > 88	int ub_cap_read_dword(struct ub_entity *uent, u32 cap, u32 off, u32 *val)
    89	{
    90		int ret;
    91	
    92		*val = 0;
    93		if (off & DW_CHECK || off >= SZ_1K)
    94			return -EFAULT;
    95	
    96		if (!ub_cap_reg_implemented(uent, cap))
    97			return -ENXIO;
    98	
    99		ret = ub_cfg_read_dword(uent, ub_find_capability(cap) + off, val);
   100		if (ret)
   101			*val = 0;
   102	
   103		return ret;
   104	}
   105	
 > 106	int ub_cap_write_byte(struct ub_entity *uent, u32 cap, u32 off, u8 val)
   107	{
   108		if (off >= SZ_1K)
   109			return -EFAULT;
   110	
   111		if (!ub_cap_reg_implemented(uent, cap))
   112			return -ENXIO;
   113	
   114		return ub_cfg_write_byte(uent, ub_find_capability(cap) + off, val);
   115	}
   116	
 > 117	int ub_cap_write_word(struct ub_entity *uent, u32 cap, u32 off, u16 val)
   118	{
   119		if (off & 1 || off >= SZ_1K)
   120			return -EFAULT;
   121	
   122		if (!ub_cap_reg_implemented(uent, cap))
   123			return -ENXIO;
   124	
   125		return ub_cfg_write_word(uent, ub_find_capability(cap) + off, val);
   126	}
   127	
 > 128	int ub_cap_write_dword(struct ub_entity *uent, u32 cap, u32 off, u32 val)
   129	{
   130		if (off & DW_CHECK || off >= SZ_1K)
   131			return -EFAULT;
   132	
   133		if (!ub_cap_reg_implemented(uent, cap))
   134			return -ENXIO;
   135	
   136		return ub_cfg_write_dword(uent, ub_find_capability(cap) + off, val);
   137	}
   138	
 > 139	int ub_cap_clear_and_set_word(struct ub_entity *dev, u32 cap, u32 off,
   140				      u16 clear, u16 set)
   141	{
   142		u16 val;
   143		int ret;
   144	
   145		ret = ub_cap_read_word(dev, cap, off, &val);
   146		if (!ret) {
   147			val &= ~clear;
   148			val |= set;
   149			ret = ub_cap_write_word(dev, cap, off, val);
   150		}
   151	
   152		return ret;
   153	}
   154	
 > 155	int ub_cap_clear_and_set_dword(struct ub_entity *dev, u32 cap, u32 off,
   156				       u32 clear, u32 set)
   157	{
   158		u32 val;
   159		int ret;
   160	
   161		ret = ub_cap_read_dword(dev, cap, off, &val);
   162		if (!ret) {
   163			val &= ~clear;
   164			val |= set;
   165			ret = ub_cap_write_dword(dev, cap, off, val);
   166		}
   167	
   168		return ret;
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
