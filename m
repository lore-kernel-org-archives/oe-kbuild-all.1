Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533DF2F4A14
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766730112; cv=none; b=tvZo9lk3/ffbffYaYwxB+cMau6qmazQBR2hxzAMNjm6LyNGRHO0igtrsH6XUGIddLeIei31kTr0YIgBRz6EvgOrNNWmWAnYq4JMkg7mJkefE4+A7K8oRbkSxPN8AqBPvhP4qVXz5sLIQv5r9+99zirPrmr0aALh5CkvKwbvpDeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766730112; c=relaxed/simple;
	bh=kaaw2UwwYEz+KD2kbelHHdIruz64Jjsq7wxsek3qmv0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fX4tznU0So2PoUYSajBqYQjx9iF/V8Unb+Eaj2hpipr3HKvEyaj22MLrBm86EGEpxGcHaFrRAOQgpI/+iZHuPqTYYChpWrFT7UzpO7JKy+MtF0aB3ts2zJUroKw/muMTvxR+9JsxB35VnrRx3NPs61ZW1NpvTjGVw48sz6CgzSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYlp87xA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYlp87xA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766730107; x=1798266107;
  h=date:from:to:cc:subject:message-id;
  bh=kaaw2UwwYEz+KD2kbelHHdIruz64Jjsq7wxsek3qmv0=;
  b=ZYlp87xAX6kI+cRwk0ji2T/DV3VE38QfpdzKGM3uCXYaYYuJbqCSNiJZ
   06bxDvnIWumy+KagG7emIu9umo+BBrFmtzPXbhRDYW6AZhQ7XoFL21/I0
   tRhxL1arFeQxBwdD5Mx0kf04r2EGGxAwnBQRhP8O+btgxbVmUlEOKwbh7
   D5INwAcnFtmlvGvOmC4oA6RBCWEDHRyfERc/eM+BUiSPtiTByk8AqmYn8
   4iiAJEJGkj0ZhuD+3dPB1tdIvY0kiSk6XrFQacPRsKyXpnuxaGJ2Awzjt
   ExQrHVxzBkLKXXLsOj+zDTiYeiFcfDzU8RzHWWFoQcHeELEIhwNXi6t2G
   A==;
X-CSE-ConnectionGUID: qlFrcqQuSP67yI897CQmlQ==
X-CSE-MsgGUID: ZC3GW6M0Tyqqaq3ZJRWt7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="72355069"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="72355069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 22:21:46 -0800
X-CSE-ConnectionGUID: K7Fco8XTSZS0XzzdRO5SkQ==
X-CSE-MsgGUID: HXCS0LNDQzmoDjxZkLL84w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="231000422"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Dec 2025 22:21:46 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ1Cp-000000004kx-2077;
	Fri, 26 Dec 2025 06:21:43 +0000
Date: Fri, 26 Dec 2025 14:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13] drivers/ub/ubus/cap.c:12:6:
 warning: no previous prototype for 'ub_set_cap_bitmap'
Message-ID: <202512261449.EGuzfA3r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   03c9c649e6f28e26260d276ce755f785b2435da3
commit: c21b483526d766fd97d491f3951433f69fde3ac3 [13/13] ub:ubus: Add UBUS capability interfaces
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261449.EGuzfA3r-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261449.EGuzfA3r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261449.EGuzfA3r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/cap.c:12:6: warning: no previous prototype for 'ub_set_cap_bitmap' [-Wmissing-prototypes]
      12 | void ub_set_cap_bitmap(struct ub_entity *uent)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:47:5: warning: no previous prototype for 'ub_find_capability' [-Wmissing-prototypes]
      47 | u32 ub_find_capability(u32 cap)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:52:5: warning: no previous prototype for 'ub_cap_read_byte' [-Wmissing-prototypes]
      52 | int ub_cap_read_byte(struct ub_entity *uent, u32 cap, u32 off, u8 *val)
         |     ^~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:70:5: warning: no previous prototype for 'ub_cap_read_word' [-Wmissing-prototypes]
      70 | int ub_cap_read_word(struct ub_entity *uent, u32 cap, u32 off, u16 *val)
         |     ^~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:88:5: warning: no previous prototype for 'ub_cap_read_dword' [-Wmissing-prototypes]
      88 | int ub_cap_read_dword(struct ub_entity *uent, u32 cap, u32 off, u32 *val)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:106:5: warning: no previous prototype for 'ub_cap_write_byte' [-Wmissing-prototypes]
     106 | int ub_cap_write_byte(struct ub_entity *uent, u32 cap, u32 off, u8 val)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:117:5: warning: no previous prototype for 'ub_cap_write_word' [-Wmissing-prototypes]
     117 | int ub_cap_write_word(struct ub_entity *uent, u32 cap, u32 off, u16 val)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:128:5: warning: no previous prototype for 'ub_cap_write_dword' [-Wmissing-prototypes]
     128 | int ub_cap_write_dword(struct ub_entity *uent, u32 cap, u32 off, u32 val)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:139:5: warning: no previous prototype for 'ub_cap_clear_and_set_word' [-Wmissing-prototypes]
     139 | int ub_cap_clear_and_set_word(struct ub_entity *dev, u32 cap, u32 off,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:155:5: warning: no previous prototype for 'ub_cap_clear_and_set_dword' [-Wmissing-prototypes]
     155 | int ub_cap_clear_and_set_dword(struct ub_entity *dev, u32 cap, u32 off,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:224:6: warning: no previous prototype for 'ub_init_capabilities' [-Wmissing-prototypes]
     224 | void ub_init_capabilities(struct ub_entity *uent)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/cap.c:238:6: warning: no previous prototype for 'ub_uninit_capabilities' [-Wmissing-prototypes]
     238 | void ub_uninit_capabilities(struct ub_entity *uent)
         |      ^~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


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
