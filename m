Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8532E3391
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741117390; cv=none; b=dMrkeBm/aIfLhm+obUkpol0oUf5/XvaaAqHGHyHhTZyMzqt86CW5z7ZUbG1sGNX+zLmFgvJJ7L0Kye+oe5hK2atTciv8xrtf1lV0p0IbyePynAv8LGsUKFZ/YDQ5aZCXDm5chQtL8VuT1nyJiApFC5OJlLxcJaJrrhYEDSnO/lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741117390; c=relaxed/simple;
	bh=cxvVl8uNQyXsdxaEaeISZkmb7MskJmYb6iw/n2yCE+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XHi84WWYvHKnrNnXTbwyF6QPEWGpCsoO1tGY6hEkzYO+v5q2UYhwBUbr5SAwZFPKEBSITuiCWxodeXRT6FZ1Ptp4RnaaS05HPLvptTVeGpf8VozxV0Uw6jLpB+U+voD8sEgNkI7LKjjjyG80VOLdg226zG99TnUE733xmnFt1fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQGsyZRN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQGsyZRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741117389; x=1772653389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cxvVl8uNQyXsdxaEaeISZkmb7MskJmYb6iw/n2yCE+E=;
  b=mQGsyZRNLZgW2Ykdd1iszMuNQrpm5Fa05CEK1/94Bnj2e26oKw+xf52U
   n3YmkPa5C3hh7NZ3WjTGpHkl8vm9rROOkPoXXdtDOmzBHddvFKw50BpMT
   lA0sTp6y1sKLt+5fk+u4cvxyo15VLV6MgYhiVI6tsmzXoF29PJRtI9rQt
   e0Q4PmXcCf4cdEpjrkBnrxjvNm3fvyew+DD4DdCvabOm8GtE7o5+g7dwZ
   z+0UVtbGmFnfMDr3bEGmnqz4QxDzo7mxBzGFmZUWNZWnhXdWNZJcOWUMn
   vH8RBnAGt1psqMqlVlSVgBun1chFJYUq1qg9WX91o8YndOT0awexxZaDB
   w==;
X-CSE-ConnectionGUID: B08nZLRyRdCaMIgJErv4+g==
X-CSE-MsgGUID: ppSKsRQqT92xTs3AzkOjfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53042521"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="53042521"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 11:43:08 -0800
X-CSE-ConnectionGUID: U0z98xLiSTe1NVXFt5v76Q==
X-CSE-MsgGUID: gc+5CopVSpOJuvPiAu2jag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118201943"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 11:43:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpYAS-000KCs-1L;
	Tue, 04 Mar 2025 19:43:04 +0000
Date: Wed, 5 Mar 2025 03:42:46 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:syscon-rework-2 11/11] include/linux/clk-provider.h:1091:1:
 warning: multi-line comment
Message-ID: <202503050312.YrqcqBRw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git syscon-rework-2
head:   693e8380bf26aff27b02f92eb938dc56d7da2577
commit: 693e8380bf26aff27b02f92eb938dc56d7da2577 [11/11] clk-gate-regmap.c
config: x86_64-buildonly-randconfig-002-20250305 (https://download.01.org/0day-ci/archive/20250305/202503050312.YrqcqBRw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050312.YrqcqBRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050312.YrqcqBRw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/vsprintf.c:23:
>> include/linux/clk-provider.h:1091:1: warning: multi-line comment [-Wcomment]
    1091 | //#define clk_register_divider_regmap(dev, name, parent_name, flags, regmap, map_offset, \
         | ^
   include/linux/clk-provider.h:1097:1: warning: multi-line comment [-Wcomment]
    1097 | //#define clk_hw_register_divider_regmap(dev, name, parent_name, flags, regmap, map_offset, \
         | ^
   include/linux/clk-provider.h:1103:1: warning: multi-line comment [-Wcomment]
    1103 | //#define clk_hw_register_divider_regmap_parent_hw(dev, name, parent_hw, flags, regmap,    \
         | ^
   include/linux/clk-provider.h:1110:1: warning: multi-line comment [-Wcomment]
    1110 | //#define clk_hw_register_divider_regmap_parent_data(dev, name, parent_data, flags,        \
         | ^
   include/linux/clk-provider.h:1117:1: warning: multi-line comment [-Wcomment]
    1117 | //#define clk_hw_register_divider_regmap_table(dev, name, parent_name, flags, regmap,         \
         | ^
   include/linux/clk-provider.h:1124:1: warning: multi-line comment [-Wcomment]
    1124 | //#define clk_hw_register_divider_regmap_table_parent_hw(dev, name, parent_hw, flags,      \
         | ^
   include/linux/clk-provider.h:1131:1: warning: multi-line comment [-Wcomment]
    1131 | //#define clk_hw_register_divider_regmap_table_parent_data(dev, name, parent_data,            \
         | ^
   include/linux/clk-provider.h:1138:1: warning: multi-line comment [-Wcomment]
    1138 | //#define devm_clk_hw_register_divider_regmap(dev, name, parent_name, flags, regmap,         \
         | ^
   include/linux/clk-provider.h:1145:1: warning: multi-line comment [-Wcomment]
    1145 | //#define devm_clk_hw_register_divider_regmap_parent_hw(dev, name, parent_hw, flags,      \
         | ^
   include/linux/clk-provider.h:1153:1: warning: multi-line comment [-Wcomment]
    1153 | //#define devm_clk_hw_register_divider_regmap_table(dev, name, parent_name, flags,           \
         | ^
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1718:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1718 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~


vim +1091 include/linux/clk-provider.h

  1067	
  1068	#ifdef CONFIG_COMMON_CLK_DIVIDER_REGMAP
  1069	struct clk_hw *__clk_hw_register_divider_regmap(struct device *dev,
  1070			struct device_node *np, const char *name,
  1071			const char *parent_name, const struct clk_hw *parent_hw,
  1072			const struct clk_parent_data *parent_data, unsigned long flags,
  1073			struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
  1074			u8 clk_divider_flags, const struct clk_div_table *table,
  1075			spinlock_t *lock);
  1076	
  1077	struct clk_hw *__devm_clk_hw_register_divider_regmap(struct device *dev,
  1078			struct device_node *np, const char *name,
  1079			const char *parent_name, const struct clk_hw *parent_hw,
  1080			const struct clk_parent_data *parent_data, unsigned long flags,
  1081			struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
  1082			u8 clk_divider_flags, const struct clk_div_table *table,
  1083			spinlock_t *lock);
  1084	
  1085	struct clk *clk_register_divider_regmap_table(struct device *dev,
  1086			const char *name, const char *parent_name, unsigned long flags,
  1087			struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
  1088			u8 clk_divider_flags, const struct clk_div_table *table,
  1089			spinlock_t *lock);
  1090	
> 1091	//#define clk_register_divider_regmap(dev, name, parent_name, flags, regmap, map_offset, \
  1092	//				    shift, width, clk_divider_flags, lock)             \
  1093	//	clk_register_divider_regmap_table((dev), (name), (parent_name), (flags),       \
  1094	//					  (regmap), (shift), (width), (map_offset)     \
  1095	//					  (clk_divider_flags), NULL, (lock))
  1096	//
  1097	//#define clk_hw_register_divider_regmap(dev, name, parent_name, flags, regmap, map_offset, \
  1098	//				       shift, width, clk_divider_flags, lock)             \
  1099	//	__clk_hw_register_divider_regmap((dev), NULL, (name), (parent_name), NULL,        \
  1100	//					 NULL, (flags), (regmap), (map_offset), (shift),  \
  1101	//					 (width), (clk_divider_flags), NULL, (lock))
  1102	//
  1103	//#define clk_hw_register_divider_regmap_parent_hw(dev, name, parent_hw, flags, regmap,    \
  1104	//						 map_offset, shift, width,               \
  1105	//						 clk_divider_flags, lock)                \
  1106	//	__clk_hw_register_divider_regmap((dev), NULL, (name), NULL, (parent_hw),         \
  1107	//					 NULL, (flags), (regmap), (map_offset), (shift), \
  1108	//					 (width), (clk_divider_flags), NULL, (lock))
  1109	//
  1110	//#define clk_hw_register_divider_regmap_parent_data(dev, name, parent_data, flags,        \
  1111	//						   regmap, map_offset, shift, width,     \
  1112	//						   clk_divider_flags, lock)              \
  1113	//	__clk_hw_register_divider_regmap((dev), NULL, (name), NULL, NULL, (parent_data), \
  1114	//					 (flags), (regmap), (map_offset), (shift),       \
  1115	//					 (width), (clk_divider_flags), NULL, (lock))
  1116	//
  1117	//#define clk_hw_register_divider_regmap_table(dev, name, parent_name, flags, regmap,         \
  1118	//					     map_offset, shift, width, clk_divider_flags,   \
  1119	//					     table, lock)                                   \
  1120	//	__clk_hw_register_divider_regmap((dev), NULL, (name), (parent_name), NULL, NULL,    \
  1121	//					 (flags), (regmap), (map_offset), (shift), (width), \
  1122	//					 (clk_divider_flags), (table), (lock))
  1123	//
  1124	//#define clk_hw_register_divider_regmap_table_parent_hw(dev, name, parent_hw, flags,      \
  1125	//						       regmap, map_offset, shift, width, \
  1126	//						       clk_divider_flags, table, lock)   \
  1127	//	__clk_hw_register_divider_regmap((dev), NULL, (name), NULL, (parent_hw),         \
  1128	//					 NULL, (flags), (regmap), (map_offset), (shift), \
  1129	//					 (width), (clk_divider_flags), (table), (lock))
  1130	//
  1131	//#define clk_hw_register_divider_regmap_table_parent_data(dev, name, parent_data,            \
  1132	//						  flags, regmap, map_offset, shift, width,  \
  1133	//						  clk_divider_flags, table, lock)           \
  1134	//	__clk_hw_register_divider_regmap((dev), NULL, (name), NULL, NULL, (parent_data),    \
  1135	//					 (flags), (regmap), (map_offset), (shift), (width), \
  1136	//					 (clk_divider_flags), (table), (lock))
  1137	//
  1138	//#define devm_clk_hw_register_divider_regmap(dev, name, parent_name, flags, regmap,         \
  1139	//					    map_offset, shift, width, clk_divider_flags,   \
  1140	//					    lock)                                          \
  1141	//	__devm_clk_hw_register_divider_regmap((dev), NULL, (name), (parent_name), NULL,    \
  1142	//				  NULL, (flags), (regmap), (map_offset), (shift), (width), \
  1143	//				  (clk_divider_flags), NULL, (lock))
  1144	//
  1145	//#define devm_clk_hw_register_divider_regmap_parent_hw(dev, name, parent_hw, flags,      \
  1146	//						      regmap, map_offset, shift, width, \
  1147	//						      clk_divider_flags, lock)          \
  1148	//	__devm_clk_hw_register_divider_regmap((dev), NULL, (name), NULL, (parent_hw),   \
  1149	//					      NULL, (flags), (regmap), (map_offset),    \
  1150	//					      (shift), (width), (clk_divider_flags),    \
  1151	//					       NULL, (lock))
  1152	//
  1153	//#define devm_clk_hw_register_divider_regmap_table(dev, name, parent_name, flags,           \
  1154	//						  regmap, map_offset, shift, width,        \
  1155	//						  clk_divider_flags, table, lock)          \
  1156	//	__devm_clk_hw_register_divider_regmap((dev), NULL, (name), (parent_name),          \
  1157	//					      NULL, NULL, (flags), (regmap), (map_offset), \
  1158	//					      (shift), (width), (clk_divider_flags),       \
  1159	//					      (table), (lock))
  1160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
