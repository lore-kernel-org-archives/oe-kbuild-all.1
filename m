Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADE570830
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 08:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762073570; cv=none; b=dH9Y1F08HDoJQu8/Yyw/vz3vDGSsausY2HZF8n34sBOcVU2+NG22oI1JlpVRHjBu2Sug9v00en8yUVxvQwjnZmHRy7Nsla/m3lwj/eBtjmae2F5qbCAZpJmT07gHVVUYi2MzbG8g8iQ/lPjPnx5uiTMUOQnIPJkwoRUm8rf+rw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762073570; c=relaxed/simple;
	bh=fXxi4KW+BeNpP61ba3stAfSvlHp5+fiDs26Yzyfdqi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLxJMDR93+PMpORLhyE0uIV44MMwJgJIwueY+xMP0SS46/+YuXbrSfrJoli36sTosPzIwJoIaflIqRRWyercx0GdXlmuCft4GRI4EHyzhk+S5rfsH3QvsMLuYVEVyeKyDs+udGGzoSPW3vRVnqylYzkPjgRLNtizVQm81fuhYVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bB3fePeS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bB3fePeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762073569; x=1793609569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXxi4KW+BeNpP61ba3stAfSvlHp5+fiDs26Yzyfdqi0=;
  b=bB3fePeS4+8i8sVjJEaZbliUakn2Si7h9ZIfRW4hR2y4tRnb70WdnAgU
   pk8GGI1snICHrC3dKp5dDvO2HHco3UWlWTnTtJxVJ2WmvBL/mc9psZSoN
   YGUzuu6gZYdmddFoXcBiR6ev2KIlw101WzidEoSLM+PSuJS2Bb0mjvjkl
   5U+T5Wo3X9Mz2WtGRYikBuZF850BWPV/LHkNsYys5A9gAimt9JIPtgsiG
   aRb8l2dOxyN70e/iyJbGaiFfnjm4zGTvjd4qqzhQYm5K4sZG0gx5J/QER
   +mUXg43JRY0zHL/YQpJiTl4n1Z4BQ60Cv81G4bBLBnRgfab2/lE9rej6i
   g==;
X-CSE-ConnectionGUID: hn6mT85uRdWGzwKEr7KWmQ==
X-CSE-MsgGUID: 5akGN/X9RHmYnAkPskajYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="51748275"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="51748275"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 01:52:47 -0700
X-CSE-ConnectionGUID: mJIvjZCaTxWsxUOcdbaQ+w==
X-CSE-MsgGUID: tQydeQx1R5+/kSq9BZJZMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="191727299"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 02 Nov 2025 01:52:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFTpM-000P66-01;
	Sun, 02 Nov 2025 08:52:44 +0000
Date: Sun, 2 Nov 2025 16:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/port.c:31:5: warning:
 no previous prototype for function 'ub_port_read_byte'
Message-ID: <202511021607.J0DIAU9X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5394cae209c4a4990d81be436ba17ae56fb09d16
commit: 210be966e79360fac509e7d66f9adb1712146c14 [3075/3075] ub:ubus: Support for UB port sysfs attribute files
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251102/202511021607.J0DIAU9X-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021607.J0DIAU9X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021607.J0DIAU9X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/port.c:31:5: warning: no previous prototype for function 'ub_port_read_byte' [-Wmissing-prototypes]
      31 | int ub_port_read_byte(struct ub_port *port, u32 pos, u8 *val)
         |     ^
   drivers/ub/ubus/port.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | int ub_port_read_byte(struct ub_port *port, u32 pos, u8 *val)
         | ^
         | static 
>> drivers/ub/ubus/port.c:38:5: warning: no previous prototype for function 'ub_port_read_word' [-Wmissing-prototypes]
      38 | int ub_port_read_word(struct ub_port *port, u32 pos, u16 *val)
         |     ^
   drivers/ub/ubus/port.c:38:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      38 | int ub_port_read_word(struct ub_port *port, u32 pos, u16 *val)
         | ^
         | static 
>> drivers/ub/ubus/port.c:45:5: warning: no previous prototype for function 'ub_port_read_dword' [-Wmissing-prototypes]
      45 | int ub_port_read_dword(struct ub_port *port, u32 pos, u32 *val)
         |     ^
   drivers/ub/ubus/port.c:45:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      45 | int ub_port_read_dword(struct ub_port *port, u32 pos, u32 *val)
         | ^
         | static 
>> drivers/ub/ubus/port.c:52:5: warning: no previous prototype for function 'ub_port_write_byte' [-Wmissing-prototypes]
      52 | int ub_port_write_byte(struct ub_port *port, u32 pos, u8 val)
         |     ^
   drivers/ub/ubus/port.c:52:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      52 | int ub_port_write_byte(struct ub_port *port, u32 pos, u8 val)
         | ^
         | static 
>> drivers/ub/ubus/port.c:59:5: warning: no previous prototype for function 'ub_port_write_word' [-Wmissing-prototypes]
      59 | int ub_port_write_word(struct ub_port *port, u32 pos, u16 val)
         |     ^
   drivers/ub/ubus/port.c:59:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      59 | int ub_port_write_word(struct ub_port *port, u32 pos, u16 val)
         | ^
         | static 
   drivers/ub/ubus/port.c:66:5: warning: no previous prototype for function 'ub_port_write_dword' [-Wmissing-prototypes]
      66 | int ub_port_write_dword(struct ub_port *port, u32 pos, u32 val)
         |     ^
   drivers/ub/ubus/port.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      66 | int ub_port_write_dword(struct ub_port *port, u32 pos, u32 val)
         | ^
         | static 
   6 warnings generated.


vim +/ub_port_read_byte +31 drivers/ub/ubus/port.c

    21	
    22	#define UB_PORT_ATTR_RO(field) \
    23		static struct ub_port_attribute ub_port_attr_##field = __ATTR_RO(field)
    24	
    25	#define UB_PORT_ATTR_RW(field) \
    26		static struct ub_port_attribute ub_port_attr_##field = __ATTR_RW(field)
    27	
    28	#define UB_PORT_ATTR_WO(field) \
    29		static struct ub_port_attribute ub_port_attr_##field = __ATTR_WO(field)
    30	
  > 31	int ub_port_read_byte(struct ub_port *port, u32 pos, u8 *val)
    32	{
    33		u64 base = UB_PORT_SLICE_START + port->index * UB_PORT_SLICE_SIZE;
    34	
    35		return ub_cfg_read_byte(port->uent, base + pos, val);
    36	}
    37	
  > 38	int ub_port_read_word(struct ub_port *port, u32 pos, u16 *val)
    39	{
    40		u64 base = UB_PORT_SLICE_START + port->index * UB_PORT_SLICE_SIZE;
    41	
    42		return ub_cfg_read_word(port->uent, base + pos, val);
    43	}
    44	
  > 45	int ub_port_read_dword(struct ub_port *port, u32 pos, u32 *val)
    46	{
    47		u64 base = UB_PORT_SLICE_START + port->index * UB_PORT_SLICE_SIZE;
    48	
    49		return ub_cfg_read_dword(port->uent, base + pos, val);
    50	}
    51	
  > 52	int ub_port_write_byte(struct ub_port *port, u32 pos, u8 val)
    53	{
    54		u64 base = UB_PORT_SLICE_START + port->index * UB_PORT_SLICE_SIZE;
    55	
    56		return ub_cfg_write_byte(port->uent, base + pos, val);
    57	}
    58	
  > 59	int ub_port_write_word(struct ub_port *port, u32 pos, u16 val)
    60	{
    61		u64 base = UB_PORT_SLICE_START + port->index * UB_PORT_SLICE_SIZE;
    62	
    63		return ub_cfg_write_word(port->uent, base + pos, val);
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
