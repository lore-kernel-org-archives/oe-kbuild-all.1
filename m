Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4AA7494
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 03:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766720729; cv=none; b=X8OpQ7KVbmbLxA+88u2jzezJTUuLk5lKS7tTLT94k2TWzYvhOe77g8FOmGJZishRUjDMOXweusMXwNf8xklXb8+a8udOYRFtUO3np+R4NOik4od31rC80Bb/Ptz2wEAHjzHytnwyg5kJu8/pyA51KGE5ByBHP+QHSROLjPNsY2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766720729; c=relaxed/simple;
	bh=TQGRwWSCZRYWNWD5eB/Rwv7kXUUlpu/FezdB6BYPpK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pyvA/kua6KpsnvI4McqukR8N7lbumRjWkupJeOeOns/aZwuIdOYBY7Zp9DPrCjF6INiWo05ztYxQ8NzdWvGhtmNs6x9L9nATUybloQytO9JsOfMkwwYBPc0APwzbpK9NbcCKIsRTg6sJGCiNfDsfCh52cwh3oFRJvL5WjAo/5pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NE8F4ivI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NE8F4ivI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766720727; x=1798256727;
  h=date:from:to:cc:subject:message-id;
  bh=TQGRwWSCZRYWNWD5eB/Rwv7kXUUlpu/FezdB6BYPpK0=;
  b=NE8F4ivIATuN03vQVh8P3rBm+KNF+bS3W//lI3yskWXxpHLP3EDJRyi+
   r3h7BbF3LB2QEQlufXnZ/n6xmD1aV43wm8g2xMHmpwB08LjuRisQfiqGq
   4zsauRrQJWRnMXpoGMDsGjBy+KVBk5Z2Kz5bAbXkGxdWcoZfC1NkFBQ2N
   TnK7f6JLvWql3AX7IO8UWSBNowfRhhxjZxmAbgew1MPg3wPA9/VtvpxVZ
   Q/qjFG063nOzONkw1Xo2H9qaj71xgdyBf+fCRPbXmzMGHNbcUV8cTunLb
   hHNIHA7pUp76KY31b1ALqH76A/wrMNJkBTrF6rZz3hhecAh76ShhbzHtm
   Q==;
X-CSE-ConnectionGUID: B+GKXrZVToun2jSYN1c8YQ==
X-CSE-MsgGUID: 1EorIy+WT8Wfka+mLfYZtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68475757"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68475757"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 19:45:27 -0800
X-CSE-ConnectionGUID: O0BCvzhUQiOT+BcLLzSMbQ==
X-CSE-MsgGUID: KRkJLjcDRyyz37i4nt86iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="204853312"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Dec 2025 19:45:25 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYylW-000000004fr-1hg4;
	Fri, 26 Dec 2025 03:45:22 +0000
Date: Fri, 26 Dec 2025 11:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13] drivers/ub/ubus/port.c:31:5:
 warning: no previous prototype for 'ub_port_read_byte'
Message-ID: <202512261132.sMR3WqA2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: 210be966e79360fac509e7d66f9adb1712146c14 [13/13] ub:ubus: Support for UB port sysfs attribute files
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261132.sMR3WqA2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261132.sMR3WqA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261132.sMR3WqA2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/port.c:31:5: warning: no previous prototype for 'ub_port_read_byte' [-Wmissing-prototypes]
      31 | int ub_port_read_byte(struct ub_port *port, u32 pos, u8 *val)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/port.c:38:5: warning: no previous prototype for 'ub_port_read_word' [-Wmissing-prototypes]
      38 | int ub_port_read_word(struct ub_port *port, u32 pos, u16 *val)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/port.c:45:5: warning: no previous prototype for 'ub_port_read_dword' [-Wmissing-prototypes]
      45 | int ub_port_read_dword(struct ub_port *port, u32 pos, u32 *val)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/port.c:52:5: warning: no previous prototype for 'ub_port_write_byte' [-Wmissing-prototypes]
      52 | int ub_port_write_byte(struct ub_port *port, u32 pos, u8 val)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ub/ubus/port.c:59:5: warning: no previous prototype for 'ub_port_write_word' [-Wmissing-prototypes]
      59 | int ub_port_write_word(struct ub_port *port, u32 pos, u16 val)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/ub/ubus/port.c:66:5: warning: no previous prototype for 'ub_port_write_dword' [-Wmissing-prototypes]
      66 | int ub_port_write_dword(struct ub_port *port, u32 pos, u32 val)
         |     ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


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
