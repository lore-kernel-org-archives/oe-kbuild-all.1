Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEC274404
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 17:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715276663; cv=none; b=igfL7DWLTd1dtQ2fxlYYmAvk6ECXE/62LKP2PAeVmKCYRLEKkGIE5C/Gfpzpf4bTw3rKhYpZrIiGbj8/mXaiBKXDKw+cpZsa7ZoZarCbOZkbxwM8l3mxv4BRrvXx1OdeZBO+FjB1Y+cH9Ogf7fUXdGvdSIrGKjKp8Pf9o8+nDss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715276663; c=relaxed/simple;
	bh=T734+fGMcFEXDOMr8+ThMeZV68+YMWpPVAZv3dT/aSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQEi4slJ55DLCvZ6Y63tQRop8aLCWGr/hTwoEQfKuVBWyt+Kg4N0cO7XkTf2f+yCitiF88qONffup22TrIqRBJncYc4gG+lNX/eWV1UZgL88K6X/7FkPbrgygDFjvxq+0qWOhe+FVZEld80HQpcIEHhhfS/cem1xQsJVmNkdG50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSa2NCFf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSa2NCFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715276660; x=1746812660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T734+fGMcFEXDOMr8+ThMeZV68+YMWpPVAZv3dT/aSk=;
  b=DSa2NCFfh7gH7mdY9jM1GHRlSOYls2F1GYgNOVGyBEmx7pVy8Csso2Wv
   r7PneSyr6SDdrAPWc/dBE2TyRc1WAlU5B7hMVZYQxphueJWNZcVGqDeAL
   KfJSLztsKKgnTqklr5bI+/58cdf+oFUzDPn34kTe+m87KcLO5dw7BvvX6
   2V1PCgQDEJ7HhqiYHvLIdgZdymZVOMvcfo38wW3fKlK2l0V51/atR8hZF
   cSjGByp9TN6HtLVwILCbjedeuQR082vMgSaw4PHxAnTmfxnUBSm3FQ6WZ
   7JXtEm4F88b77I+w8nzCkfsr6lmy9aDxjQnVhNBzodviq6jwjBGe2gb0e
   Q==;
X-CSE-ConnectionGUID: 76yThVq8Q+yuxXm8FTnP+w==
X-CSE-MsgGUID: rpMwf4gCRH6rJ+MoR52J3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22614021"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="22614021"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 10:44:17 -0700
X-CSE-ConnectionGUID: mi5PDhhhTC+lJU0jpdVfoQ==
X-CSE-MsgGUID: SaREn44TQH2ZISxEhJAD6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="29382812"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2024 10:44:16 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s57oT-0005C3-1n;
	Thu, 09 May 2024 17:44:13 +0000
Date: Fri, 10 May 2024 01:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:zii 91/102] drivers/net/dsa/b53/b53_common.c:1487:15: error:
 non-static declaration of 'b53_vlan_filtering' follows static declaration
Message-ID: <202405100109.5colSJxZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git zii
head:   e9436a5c3f1e8dc9d425f51b98e96e185a20704d
commit: 7e7e7c670675ac436d82b2c0ab183ba0b6c65a21 [91/102] net: use phylink_mode_*() helpers
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240510/202405100109.5colSJxZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100109.5colSJxZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100109.5colSJxZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/dsa/b53/b53_common.c: In function 'b53_phylink_mac_link_up':
   drivers/net/dsa/b53/b53_common.c:1452:34: error: initialization of 'struct ethtool_keee *' from incompatible pointer type 'struct ethtool_eee *' [-Werror=incompatible-pointer-types]
    1452 |         struct ethtool_keee *p = &dev->ports[dp->index].eee;
         |                                  ^
   drivers/net/dsa/b53/b53_common.c:1457:18: error: invalid use of undefined type 'struct ethtool_keee'
    1457 |                 p->eee_enabled = b53_eee_init(ds, port, phydev);
         |                  ^~
   In file included from arch/arm64/include/asm/lse.h:12,
                    from arch/arm64/include/asm/cmpxchg.h:14,
                    from arch/arm64/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:25,
                    from include/linux/bitops.h:68,
                    from arch/arm64/include/asm/cache.h:40,
                    from include/linux/cache.h:6,
                    from arch/arm64/include/asm/processor.h:29,
                    from include/linux/sched.h:13,
                    from include/linux/delay.h:23,
                    from drivers/net/dsa/b53/b53_common.c:20:
>> drivers/net/dsa/b53/b53_common.c:1487:15: error: non-static declaration of 'b53_vlan_filtering' follows static declaration
    1487 | EXPORT_SYMBOL(b53_vlan_filtering);
         |               ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1487:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1487 | EXPORT_SYMBOL(b53_vlan_filtering);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1478:5: note: previous definition of 'b53_vlan_filtering' with type 'int(struct dsa_switch *, int,  bool,  struct netlink_ext_ack *)' {aka 'int(struct dsa_switch *, int,  _Bool,  struct netlink_ext_ack *)'}
    1478 | int b53_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1489:12: error: invalid storage class for function 'b53_vlan_prepare'
    1489 | static int b53_vlan_prepare(struct dsa_switch *ds, int port,
         |            ^~~~~~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1551:15: error: non-static declaration of 'b53_vlan_add' follows static declaration
    1551 | EXPORT_SYMBOL(b53_vlan_add);
         |               ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1551:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1551 | EXPORT_SYMBOL(b53_vlan_add);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1513:5: note: previous definition of 'b53_vlan_add' with type 'int(struct dsa_switch *, int,  const struct switchdev_obj_port_vlan *, struct netlink_ext_ack *)'
    1513 | int b53_vlan_add(struct dsa_switch *ds, int port,
         |     ^~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1583:15: error: non-static declaration of 'b53_vlan_del' follows static declaration
    1583 | EXPORT_SYMBOL(b53_vlan_del);
         |               ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1583:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1583 | EXPORT_SYMBOL(b53_vlan_del);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1553:5: note: previous definition of 'b53_vlan_del' with type 'int(struct dsa_switch *, int,  const struct switchdev_obj_port_vlan *)'
    1553 | int b53_vlan_del(struct dsa_switch *ds, int port,
         |     ^~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1586:12: error: invalid storage class for function 'b53_arl_op_wait'
    1586 | static int b53_arl_op_wait(struct b53_device *dev)
         |            ^~~~~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1604:12: error: invalid storage class for function 'b53_arl_rw_op'
    1604 | static int b53_arl_rw_op(struct b53_device *dev, unsigned int op)
         |            ^~~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1626:12: error: invalid storage class for function 'b53_arl_read'
    1626 | static int b53_arl_read(struct b53_device *dev, u64 mac,
         |            ^~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1667:12: error: invalid storage class for function 'b53_arl_op'
    1667 | static int b53_arl_op(struct b53_device *dev, int op, int port,
         |            ^~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1761:15: error: non-static declaration of 'b53_fdb_add' follows static declaration
    1761 | EXPORT_SYMBOL(b53_fdb_add);
         |               ^~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1761:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1761 | EXPORT_SYMBOL(b53_fdb_add);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1742:5: note: previous definition of 'b53_fdb_add' with type 'int(struct dsa_switch *, int,  const unsigned char *, u16,  struct dsa_db)' {aka 'int(struct dsa_switch *, int,  const unsigned char *, short unsigned int,  struct dsa_db)'}
    1742 | int b53_fdb_add(struct dsa_switch *ds, int port,
         |     ^~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1776:15: error: non-static declaration of 'b53_fdb_del' follows static declaration
    1776 | EXPORT_SYMBOL(b53_fdb_del);
         |               ^~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1776:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1776 | EXPORT_SYMBOL(b53_fdb_del);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1763:5: note: previous definition of 'b53_fdb_del' with type 'int(struct dsa_switch *, int,  const unsigned char *, u16,  struct dsa_db)' {aka 'int(struct dsa_switch *, int,  const unsigned char *, short unsigned int,  struct dsa_db)'}
    1763 | int b53_fdb_del(struct dsa_switch *ds, int port,
         |     ^~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1778:12: error: invalid storage class for function 'b53_arl_search_wait'
    1778 | static int b53_arl_search_wait(struct b53_device *dev)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1797:13: error: invalid storage class for function 'b53_arl_search_rd'
    1797 | static void b53_arl_search_rd(struct b53_device *dev, u8 idx,
         |             ^~~~~~~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1810:12: error: invalid storage class for function 'b53_fdb_copy'
    1810 | static int b53_fdb_copy(int port, const struct b53_arl_entry *ent,
         |            ^~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1863:15: error: non-static declaration of 'b53_fdb_dump' follows static declaration
    1863 | EXPORT_SYMBOL(b53_fdb_dump);
         |               ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1863:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1863 | EXPORT_SYMBOL(b53_fdb_dump);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1822:5: note: previous definition of 'b53_fdb_dump' with type 'int(struct dsa_switch *, int,  int (*)(const unsigned char *, u16,  bool,  void *), void *)' {aka 'int(struct dsa_switch *, int,  int (*)(const unsigned char *, short unsigned int,  _Bool,  void *), void *)'}
    1822 | int b53_fdb_dump(struct dsa_switch *ds, int port,
         |     ^~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1884:15: error: non-static declaration of 'b53_mdb_add' follows static declaration
    1884 | EXPORT_SYMBOL(b53_mdb_add);
         |               ^~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1884:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1884 | EXPORT_SYMBOL(b53_mdb_add);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1865:5: note: previous definition of 'b53_mdb_add' with type 'int(struct dsa_switch *, int,  const struct switchdev_obj_port_mdb *, struct dsa_db)'
    1865 | int b53_mdb_add(struct dsa_switch *ds, int port,
         |     ^~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1901:15: error: non-static declaration of 'b53_mdb_del' follows static declaration
    1901 | EXPORT_SYMBOL(b53_mdb_del);
         |               ^~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1901:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1901 | EXPORT_SYMBOL(b53_mdb_del);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1886:5: note: previous definition of 'b53_mdb_del' with type 'int(struct dsa_switch *, int,  const struct switchdev_obj_port_mdb *, struct dsa_db)'
    1886 | int b53_mdb_del(struct dsa_switch *ds, int port,
         |     ^~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1953:15: error: non-static declaration of 'b53_br_join' follows static declaration
    1953 | EXPORT_SYMBOL(b53_br_join);
         |               ^~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1953:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1953 | EXPORT_SYMBOL(b53_br_join);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1903:5: note: previous definition of 'b53_br_join' with type 'int(struct dsa_switch *, int,  struct dsa_bridge,  bool *, struct netlink_ext_ack *)' {aka 'int(struct dsa_switch *, int,  struct dsa_bridge,  _Bool *, struct netlink_ext_ack *)'}
    1903 | int b53_br_join(struct dsa_switch *ds, int port, struct dsa_bridge bridge,
         |     ^~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:1999:15: error: non-static declaration of 'b53_br_leave' follows static declaration
    1999 | EXPORT_SYMBOL(b53_br_leave);
         |               ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1999:1: note: in expansion of macro 'EXPORT_SYMBOL'
    1999 | EXPORT_SYMBOL(b53_br_leave);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1955:6: note: previous definition of 'b53_br_leave' with type 'void(struct dsa_switch *, int,  struct dsa_bridge)'
    1955 | void b53_br_leave(struct dsa_switch *ds, int port, struct dsa_bridge bridge)
         |      ^~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:2033:15: error: non-static declaration of 'b53_br_set_stp_state' follows static declaration
    2033 | EXPORT_SYMBOL(b53_br_set_stp_state);
         |               ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2033:1: note: in expansion of macro 'EXPORT_SYMBOL'
    2033 | EXPORT_SYMBOL(b53_br_set_stp_state);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2001:6: note: previous definition of 'b53_br_set_stp_state' with type 'void(struct dsa_switch *, int,  u8)' {aka 'void(struct dsa_switch *, int,  unsigned char)'}
    2001 | void b53_br_set_stp_state(struct dsa_switch *ds, int port, u8 state)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/b53/b53_common.c:2042:15: error: non-static declaration of 'b53_br_fast_age' follows static declaration
    2042 | EXPORT_SYMBOL(b53_br_fast_age);
         |               ^~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2042:1: note: in expansion of macro 'EXPORT_SYMBOL'
    2042 | EXPORT_SYMBOL(b53_br_fast_age);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2035:6: note: previous definition of 'b53_br_fast_age' with type 'void(struct dsa_switch *, int)'
    2035 | void b53_br_fast_age(struct dsa_switch *ds, int port)
         |      ^~~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2053:15: error: non-static declaration of 'b53_br_flags_pre' follows static declaration
    2053 | EXPORT_SYMBOL(b53_br_flags_pre);
         |               ^~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2053:1: note: in expansion of macro 'EXPORT_SYMBOL'
    2053 | EXPORT_SYMBOL(b53_br_flags_pre);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2044:5: note: previous definition of 'b53_br_flags_pre' with type 'int(struct dsa_switch *, int,  struct switchdev_brport_flags,  struct netlink_ext_ack *)'
    2044 | int b53_br_flags_pre(struct dsa_switch *ds, int port,
         |     ^~~~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2071:15: error: non-static declaration of 'b53_br_flags' follows static declaration
    2071 | EXPORT_SYMBOL(b53_br_flags);
         |               ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2071:1: note: in expansion of macro 'EXPORT_SYMBOL'
    2071 | EXPORT_SYMBOL(b53_br_flags);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2055:5: note: previous definition of 'b53_br_flags' with type 'int(struct dsa_switch *, int,  struct switchdev_brport_flags,  struct netlink_ext_ack *)'
    2055 | int b53_br_flags(struct dsa_switch *ds, int port,
         |     ^~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2073:13: error: invalid storage class for function 'b53_possible_cpu_port'
    2073 | static bool b53_possible_cpu_port(struct dsa_switch *ds, int port)
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2088:13: error: invalid storage class for function 'b53_can_enable_brcm_tags'
    2088 | static bool b53_can_enable_brcm_tags(struct dsa_switch *ds, int port,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2142:15: error: non-static declaration of 'b53_get_tag_protocol' follows static declaration
    2142 | EXPORT_SYMBOL(b53_get_tag_protocol);
         |               ^~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2142:1: note: in expansion of macro 'EXPORT_SYMBOL'
    2142 | EXPORT_SYMBOL(b53_get_tag_protocol);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2114:23: note: previous definition of 'b53_get_tag_protocol' with type 'enum dsa_tag_protocol(struct dsa_switch *, int,  enum dsa_tag_protocol)'
    2114 | enum dsa_tag_protocol b53_get_tag_protocol(struct dsa_switch *ds, int port,
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2168:15: error: non-static declaration of 'b53_mirror_add' follows static declaration
    2168 | EXPORT_SYMBOL(b53_mirror_add);
         |               ^~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2168:1: note: in expansion of macro 'EXPORT_SYMBOL'
    2168 | EXPORT_SYMBOL(b53_mirror_add);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2144:5: note: previous definition of 'b53_mirror_add' with type 'int(struct dsa_switch *, int,  struct dsa_mall_mirror_tc_entry *, bool,  struct netlink_ext_ack *)' {aka 'int(struct dsa_switch *, int,  struct dsa_mall_mirror_tc_entry *, _Bool,  struct netlink_ext_ack *)'}
    2144 | int b53_mirror_add(struct dsa_switch *ds, int port,
         |     ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2207:15: error: non-static declaration of 'b53_mirror_del' follows static declaration
    2207 | EXPORT_SYMBOL(b53_mirror_del);
         |               ^~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:68:41: note: in expansion of macro '_EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2207:1: note: in expansion of macro 'EXPORT_SYMBOL'
    2207 | EXPORT_SYMBOL(b53_mirror_del);
         | ^~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2170:6: note: previous definition of 'b53_mirror_del' with type 'void(struct dsa_switch *, int,  struct dsa_mall_mirror_tc_entry *)'
    2170 | void b53_mirror_del(struct dsa_switch *ds, int port,
         |      ^~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:2223:15: error: non-static declaration of 'b53_eee_init' follows static declaration
    2223 | EXPORT_SYMBOL(b53_eee_init);
         |               ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \


vim +/b53_vlan_filtering +1487 drivers/net/dsa/b53/b53_common.c

a8e8b98531369c Florian Fainelli      2018-09-05  1441  
630f81edcbf1a8 Florian Fainelli      2024-05-05 @1442  static void b53_phylink_mac_link_up(struct phylink_config *config,
630f81edcbf1a8 Florian Fainelli      2024-05-05  1443  				    struct phy_device *phydev,
a8e8b98531369c Florian Fainelli      2018-09-05  1444  				    unsigned int mode,
a8e8b98531369c Florian Fainelli      2018-09-05  1445  				    phy_interface_t interface,
5b502a7b299200 Russell King          2020-02-26  1446  				    int speed, int duplex,
5b502a7b299200 Russell King          2020-02-26  1447  				    bool tx_pause, bool rx_pause)
a8e8b98531369c Florian Fainelli      2018-09-05  1448  {
630f81edcbf1a8 Florian Fainelli      2024-05-05  1449  	struct dsa_port *dp = dsa_phylink_to_port(config);
630f81edcbf1a8 Florian Fainelli      2024-05-05  1450  	struct dsa_switch *ds = dp->ds;
a8e8b98531369c Florian Fainelli      2018-09-05  1451  	struct b53_device *dev = ds->priv;
630f81edcbf1a8 Florian Fainelli      2024-05-05  1452  	struct ethtool_keee *p = &dev->ports[dp->index].eee;
630f81edcbf1a8 Florian Fainelli      2024-05-05  1453  	int port = dp->index;
a8e8b98531369c Florian Fainelli      2018-09-05  1454  
7e7e7c670675ac Russell King (Oracle  2021-11-27  1455) 	if (phylink_mode_phy(mode)) {
7e189be0111c72 Florian Fainelli      2024-05-05  1456  		/* Re-negotiate EEE if it was enabled already */
7e189be0111c72 Florian Fainelli      2024-05-05  1457  		p->eee_enabled = b53_eee_init(ds, port, phydev);
a8e8b98531369c Florian Fainelli      2018-09-05  1458  		return;
7e189be0111c72 Florian Fainelli      2024-05-05  1459  	}
a8e8b98531369c Florian Fainelli      2018-09-05  1460  
7e7e7c670675ac Russell King (Oracle  2021-11-27  1461) 	if (phylink_mode_fixed(mode)) {
a8e8b98531369c Florian Fainelli      2018-09-05  1462  	if (mode == MLO_AN_FIXED) {
a6b9753fcb98a6 Florian Fainelli      2024-05-05  1463  		/* Force flow control on BCM5301x's CPU port */
a6b9753fcb98a6 Florian Fainelli      2024-05-05  1464  		if (is5301x(dev) && dsa_is_cpu_port(ds, port))
a6b9753fcb98a6 Florian Fainelli      2024-05-05  1465  			tx_pause = rx_pause = true;
a6b9753fcb98a6 Florian Fainelli      2024-05-05  1466  
ab017b7921d324 Russell King          2020-06-30  1467  		b53_force_port_config(dev, port, speed, duplex,
ab017b7921d324 Russell King          2020-06-30  1468  				      tx_pause, rx_pause);
a8e8b98531369c Florian Fainelli      2018-09-05  1469  		b53_force_link(dev, port, true);
a8e8b98531369c Florian Fainelli      2018-09-05  1470  		return;
a8e8b98531369c Florian Fainelli      2018-09-05  1471  	}
0e01491de64600 Florian Fainelli      2018-09-05  1472  
0e01491de64600 Florian Fainelli      2018-09-05  1473  	if (phy_interface_mode_is_8023z(interface) &&
0e01491de64600 Florian Fainelli      2018-09-05  1474  	    dev->ops->serdes_link_set)
0e01491de64600 Florian Fainelli      2018-09-05  1475  		dev->ops->serdes_link_set(dev, port, mode, interface, true);
a8e8b98531369c Florian Fainelli      2018-09-05  1476  }
a8e8b98531369c Florian Fainelli      2018-09-05  1477  
89153ed6ebc148 Vladimir Oltean       2021-02-13  1478  int b53_vlan_filtering(struct dsa_switch *ds, int port, bool vlan_filtering,
89153ed6ebc148 Vladimir Oltean       2021-02-13  1479  		       struct netlink_ext_ack *extack)
a2482d2ce34986 Florian Fainelli      2016-06-09  1480  {
dad8d7c6452b5b Florian Fainelli      2019-02-15  1481  	struct b53_device *dev = ds->priv;
dad8d7c6452b5b Florian Fainelli      2019-02-15  1482  
ee47ed08d75e8f Florian Fainelli      2021-03-10  1483  	b53_enable_vlan(dev, port, dev->vlan_enabled, vlan_filtering);
dad8d7c6452b5b Florian Fainelli      2019-02-15  1484  
a2482d2ce34986 Florian Fainelli      2016-06-09  1485  	return 0;
a2482d2ce34986 Florian Fainelli      2016-06-09  1486  }
3117455dd6c16d Florian Fainelli      2017-01-08 @1487  EXPORT_SYMBOL(b53_vlan_filtering);
a2482d2ce34986 Florian Fainelli      2016-06-09  1488  
1958d5815c9135 Vladimir Oltean       2021-01-09 @1489  static int b53_vlan_prepare(struct dsa_switch *ds, int port,
80e023607982fa Vivien Didelot        2017-11-30  1490  			    const struct switchdev_obj_port_vlan *vlan)
a2482d2ce34986 Florian Fainelli      2016-06-09  1491  {
04bed1434df256 Vivien Didelot        2016-08-31  1492  	struct b53_device *dev = ds->priv;
a2482d2ce34986 Florian Fainelli      2016-06-09  1493  
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1494  	if ((is5325(dev) || is5365(dev)) && vlan->vid == 0)
a2482d2ce34986 Florian Fainelli      2016-06-09  1495  		return -EOPNOTSUPP;
a2482d2ce34986 Florian Fainelli      2016-06-09  1496  
88631864da0933 Florian Fainelli      2020-03-30  1497  	/* Port 7 on 7278 connects to the ASP's UniMAC which is not capable of
88631864da0933 Florian Fainelli      2020-03-30  1498  	 * receiving VLAN tagged frames at all, we can still allow the port to
88631864da0933 Florian Fainelli      2020-03-30  1499  	 * be configured for egress untagged.
88631864da0933 Florian Fainelli      2020-03-30  1500  	 */
88631864da0933 Florian Fainelli      2020-03-30  1501  	if (dev->chip_id == BCM7278_DEVICE_ID && port == 7 &&
88631864da0933 Florian Fainelli      2020-03-30  1502  	    !(vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED))
88631864da0933 Florian Fainelli      2020-03-30  1503  		return -EINVAL;
88631864da0933 Florian Fainelli      2020-03-30  1504  
0fe2f273ab892b Jakub Kicinski        2021-01-20  1505  	if (vlan->vid >= dev->num_vlans)
a2482d2ce34986 Florian Fainelli      2016-06-09  1506  		return -ERANGE;
a2482d2ce34986 Florian Fainelli      2016-06-09  1507  
ee47ed08d75e8f Florian Fainelli      2021-03-10  1508  	b53_enable_vlan(dev, port, true, ds->vlan_filtering);
a2482d2ce34986 Florian Fainelli      2016-06-09  1509  
a2482d2ce34986 Florian Fainelli      2016-06-09  1510  	return 0;
a2482d2ce34986 Florian Fainelli      2016-06-09  1511  }
a2482d2ce34986 Florian Fainelli      2016-06-09  1512  
1958d5815c9135 Vladimir Oltean       2021-01-09  1513  int b53_vlan_add(struct dsa_switch *ds, int port,
31046a5fd92c57 Vladimir Oltean       2021-02-13  1514  		 const struct switchdev_obj_port_vlan *vlan,
31046a5fd92c57 Vladimir Oltean       2021-02-13  1515  		 struct netlink_ext_ack *extack)
a2482d2ce34986 Florian Fainelli      2016-06-09  1516  {
04bed1434df256 Vivien Didelot        2016-08-31  1517  	struct b53_device *dev = ds->priv;
a2482d2ce34986 Florian Fainelli      2016-06-09  1518  	bool untagged = vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED;
a2482d2ce34986 Florian Fainelli      2016-06-09  1519  	bool pvid = vlan->flags & BRIDGE_VLAN_INFO_PVID;
a2482d2ce34986 Florian Fainelli      2016-06-09  1520  	struct b53_vlan *vl;
1958d5815c9135 Vladimir Oltean       2021-01-09  1521  	int err;
1958d5815c9135 Vladimir Oltean       2021-01-09  1522  
1958d5815c9135 Vladimir Oltean       2021-01-09  1523  	err = b53_vlan_prepare(ds, port, vlan);
1958d5815c9135 Vladimir Oltean       2021-01-09  1524  	if (err)
1958d5815c9135 Vladimir Oltean       2021-01-09  1525  		return err;
a2482d2ce34986 Florian Fainelli      2016-06-09  1526  
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1527  	vl = &dev->vlans[vlan->vid];
a2482d2ce34986 Florian Fainelli      2016-06-09  1528  
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1529  	b53_get_vlan_entry(dev, vlan->vid, vl);
a2482d2ce34986 Florian Fainelli      2016-06-09  1530  
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1531  	if (vlan->vid == 0 && vlan->vid == b53_default_pvid(dev))
d965a5432d4c3e Florian Fainelli      2020-02-14  1532  		untagged = true;
d965a5432d4c3e Florian Fainelli      2020-02-14  1533  
c499696e7901bd Florian Fainelli      2017-11-10  1534  	vl->members |= BIT(port);
2c32a3d3c233b8 Florian Fainelli      2021-06-08  1535  	if (untagged && !b53_vlan_port_needs_forced_tagged(ds, port))
e47112d9d6009b Florian Fainelli      2016-11-15  1536  		vl->untag |= BIT(port);
a2482d2ce34986 Florian Fainelli      2016-06-09  1537  	else
e47112d9d6009b Florian Fainelli      2016-11-15  1538  		vl->untag &= ~BIT(port);
a2482d2ce34986 Florian Fainelli      2016-06-09  1539  
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1540  	b53_set_vlan_entry(dev, vlan->vid, vl);
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1541  	b53_fast_age_vlan(dev, vlan->vid);
a2482d2ce34986 Florian Fainelli      2016-06-09  1542  
10163aaee9671b Florian Fainelli      2019-02-15  1543  	if (pvid && !dsa_is_cpu_port(ds, port)) {
a2482d2ce34986 Florian Fainelli      2016-06-09  1544  		b53_write16(dev, B53_VLAN_PAGE, B53_VLAN_PORT_DEF_TAG(port),
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1545  			    vlan->vid);
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1546  		b53_fast_age_vlan(dev, vlan->vid);
a2482d2ce34986 Florian Fainelli      2016-06-09  1547  	}
1958d5815c9135 Vladimir Oltean       2021-01-09  1548  
1958d5815c9135 Vladimir Oltean       2021-01-09  1549  	return 0;
a2482d2ce34986 Florian Fainelli      2016-06-09  1550  }
3117455dd6c16d Florian Fainelli      2017-01-08 @1551  EXPORT_SYMBOL(b53_vlan_add);
a2482d2ce34986 Florian Fainelli      2016-06-09  1552  
3117455dd6c16d Florian Fainelli      2017-01-08  1553  int b53_vlan_del(struct dsa_switch *ds, int port,
a2482d2ce34986 Florian Fainelli      2016-06-09  1554  		 const struct switchdev_obj_port_vlan *vlan)
a2482d2ce34986 Florian Fainelli      2016-06-09  1555  {
04bed1434df256 Vivien Didelot        2016-08-31  1556  	struct b53_device *dev = ds->priv;
a2482d2ce34986 Florian Fainelli      2016-06-09  1557  	bool untagged = vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED;
a2482d2ce34986 Florian Fainelli      2016-06-09  1558  	struct b53_vlan *vl;
a2482d2ce34986 Florian Fainelli      2016-06-09  1559  	u16 pvid;
a2482d2ce34986 Florian Fainelli      2016-06-09  1560  
a2482d2ce34986 Florian Fainelli      2016-06-09  1561  	b53_read16(dev, B53_VLAN_PAGE, B53_VLAN_PORT_DEF_TAG(port), &pvid);
a2482d2ce34986 Florian Fainelli      2016-06-09  1562  
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1563  	vl = &dev->vlans[vlan->vid];
a2482d2ce34986 Florian Fainelli      2016-06-09  1564  
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1565  	b53_get_vlan_entry(dev, vlan->vid, vl);
a2482d2ce34986 Florian Fainelli      2016-06-09  1566  
a2482d2ce34986 Florian Fainelli      2016-06-09  1567  	vl->members &= ~BIT(port);
a2482d2ce34986 Florian Fainelli      2016-06-09  1568  
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1569  	if (pvid == vlan->vid)
fea83353177a55 Florian Fainelli      2019-02-15  1570  		pvid = b53_default_pvid(dev);
a2482d2ce34986 Florian Fainelli      2016-06-09  1571  
2c32a3d3c233b8 Florian Fainelli      2021-06-08  1572  	if (untagged && !b53_vlan_port_needs_forced_tagged(ds, port))
a2482d2ce34986 Florian Fainelli      2016-06-09  1573  		vl->untag &= ~(BIT(port));
a2482d2ce34986 Florian Fainelli      2016-06-09  1574  
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1575  	b53_set_vlan_entry(dev, vlan->vid, vl);
b7a9e0da2d1c95 Vladimir Oltean       2021-01-09  1576  	b53_fast_age_vlan(dev, vlan->vid);
a2482d2ce34986 Florian Fainelli      2016-06-09  1577  
a2482d2ce34986 Florian Fainelli      2016-06-09  1578  	b53_write16(dev, B53_VLAN_PAGE, B53_VLAN_PORT_DEF_TAG(port), pvid);
a2482d2ce34986 Florian Fainelli      2016-06-09  1579  	b53_fast_age_vlan(dev, pvid);
a2482d2ce34986 Florian Fainelli      2016-06-09  1580  
a2482d2ce34986 Florian Fainelli      2016-06-09  1581  	return 0;
a2482d2ce34986 Florian Fainelli      2016-06-09  1582  }
3117455dd6c16d Florian Fainelli      2017-01-08 @1583  EXPORT_SYMBOL(b53_vlan_del);
a2482d2ce34986 Florian Fainelli      2016-06-09  1584  
f7eb4a1c086482 Vladimir Oltean       2021-10-24  1585  /* Address Resolution Logic routines. Caller must hold &dev->arl_mutex. */
1da6df85c6fbed Florian Fainelli      2016-06-09 @1586  static int b53_arl_op_wait(struct b53_device *dev)
1da6df85c6fbed Florian Fainelli      2016-06-09  1587  {
1da6df85c6fbed Florian Fainelli      2016-06-09  1588  	unsigned int timeout = 10;
1da6df85c6fbed Florian Fainelli      2016-06-09  1589  	u8 reg;
1da6df85c6fbed Florian Fainelli      2016-06-09  1590  
1da6df85c6fbed Florian Fainelli      2016-06-09  1591  	do {
1da6df85c6fbed Florian Fainelli      2016-06-09  1592  		b53_read8(dev, B53_ARLIO_PAGE, B53_ARLTBL_RW_CTRL, &reg);
1da6df85c6fbed Florian Fainelli      2016-06-09  1593  		if (!(reg & ARLTBL_START_DONE))
1da6df85c6fbed Florian Fainelli      2016-06-09  1594  			return 0;
1da6df85c6fbed Florian Fainelli      2016-06-09  1595  
1da6df85c6fbed Florian Fainelli      2016-06-09  1596  		usleep_range(1000, 2000);
1da6df85c6fbed Florian Fainelli      2016-06-09  1597  	} while (timeout--);
1da6df85c6fbed Florian Fainelli      2016-06-09  1598  
1da6df85c6fbed Florian Fainelli      2016-06-09  1599  	dev_warn(dev->dev, "timeout waiting for ARL to finish: 0x%02x\n", reg);
1da6df85c6fbed Florian Fainelli      2016-06-09  1600  
1da6df85c6fbed Florian Fainelli      2016-06-09  1601  	return -ETIMEDOUT;
1da6df85c6fbed Florian Fainelli      2016-06-09  1602  }
1da6df85c6fbed Florian Fainelli      2016-06-09  1603  
1da6df85c6fbed Florian Fainelli      2016-06-09 @1604  static int b53_arl_rw_op(struct b53_device *dev, unsigned int op)
1da6df85c6fbed Florian Fainelli      2016-06-09  1605  {
1da6df85c6fbed Florian Fainelli      2016-06-09  1606  	u8 reg;
1da6df85c6fbed Florian Fainelli      2016-06-09  1607  
1da6df85c6fbed Florian Fainelli      2016-06-09  1608  	if (op > ARLTBL_RW)
1da6df85c6fbed Florian Fainelli      2016-06-09  1609  		return -EINVAL;
1da6df85c6fbed Florian Fainelli      2016-06-09  1610  
1da6df85c6fbed Florian Fainelli      2016-06-09  1611  	b53_read8(dev, B53_ARLIO_PAGE, B53_ARLTBL_RW_CTRL, &reg);
1da6df85c6fbed Florian Fainelli      2016-06-09  1612  	reg |= ARLTBL_START_DONE;
1da6df85c6fbed Florian Fainelli      2016-06-09  1613  	if (op)
1da6df85c6fbed Florian Fainelli      2016-06-09  1614  		reg |= ARLTBL_RW;
1da6df85c6fbed Florian Fainelli      2016-06-09  1615  	else
1da6df85c6fbed Florian Fainelli      2016-06-09  1616  		reg &= ~ARLTBL_RW;
64fec9493f7dc9 Florian Fainelli      2020-04-20  1617  	if (dev->vlan_enabled)
64fec9493f7dc9 Florian Fainelli      2020-04-20  1618  		reg &= ~ARLTBL_IVL_SVL_SELECT;
64fec9493f7dc9 Florian Fainelli      2020-04-20  1619  	else
64fec9493f7dc9 Florian Fainelli      2020-04-20  1620  		reg |= ARLTBL_IVL_SVL_SELECT;
1da6df85c6fbed Florian Fainelli      2016-06-09  1621  	b53_write8(dev, B53_ARLIO_PAGE, B53_ARLTBL_RW_CTRL, reg);
1da6df85c6fbed Florian Fainelli      2016-06-09  1622  
1da6df85c6fbed Florian Fainelli      2016-06-09  1623  	return b53_arl_op_wait(dev);
1da6df85c6fbed Florian Fainelli      2016-06-09  1624  }
1da6df85c6fbed Florian Fainelli      2016-06-09  1625  
1da6df85c6fbed Florian Fainelli      2016-06-09 @1626  static int b53_arl_read(struct b53_device *dev, u64 mac,
ef2a0bd99b1549 Florian Fainelli      2020-04-30  1627  			u16 vid, struct b53_arl_entry *ent, u8 *idx)
1da6df85c6fbed Florian Fainelli      2016-06-09  1628  {
6344dbde6a27d1 Florian Fainelli      2020-04-20  1629  	DECLARE_BITMAP(free_bins, B53_ARLTBL_MAX_BIN_ENTRIES);
1da6df85c6fbed Florian Fainelli      2016-06-09  1630  	unsigned int i;
1da6df85c6fbed Florian Fainelli      2016-06-09  1631  	int ret;
1da6df85c6fbed Florian Fainelli      2016-06-09  1632  
1da6df85c6fbed Florian Fainelli      2016-06-09  1633  	ret = b53_arl_op_wait(dev);
1da6df85c6fbed Florian Fainelli      2016-06-09  1634  	if (ret)
1da6df85c6fbed Florian Fainelli      2016-06-09  1635  		return ret;
1da6df85c6fbed Florian Fainelli      2016-06-09  1636  
673e69a67dd63f Florian Fainelli      2020-04-30  1637  	bitmap_zero(free_bins, dev->num_arl_bins);
6344dbde6a27d1 Florian Fainelli      2020-04-20  1638  
1da6df85c6fbed Florian Fainelli      2016-06-09  1639  	/* Read the bins */
673e69a67dd63f Florian Fainelli      2020-04-30  1640  	for (i = 0; i < dev->num_arl_bins; i++) {
1da6df85c6fbed Florian Fainelli      2016-06-09  1641  		u64 mac_vid;
1da6df85c6fbed Florian Fainelli      2016-06-09  1642  		u32 fwd_entry;
1da6df85c6fbed Florian Fainelli      2016-06-09  1643  
1da6df85c6fbed Florian Fainelli      2016-06-09  1644  		b53_read64(dev, B53_ARLIO_PAGE,
1da6df85c6fbed Florian Fainelli      2016-06-09  1645  			   B53_ARLTBL_MAC_VID_ENTRY(i), &mac_vid);
1da6df85c6fbed Florian Fainelli      2016-06-09  1646  		b53_read32(dev, B53_ARLIO_PAGE,
1da6df85c6fbed Florian Fainelli      2016-06-09  1647  			   B53_ARLTBL_DATA_ENTRY(i), &fwd_entry);
1da6df85c6fbed Florian Fainelli      2016-06-09  1648  		b53_arl_to_entry(ent, mac_vid, fwd_entry);
1da6df85c6fbed Florian Fainelli      2016-06-09  1649  
6344dbde6a27d1 Florian Fainelli      2020-04-20  1650  		if (!(fwd_entry & ARLTBL_VALID)) {
6344dbde6a27d1 Florian Fainelli      2020-04-20  1651  			set_bit(i, free_bins);
1da6df85c6fbed Florian Fainelli      2016-06-09  1652  			continue;
6344dbde6a27d1 Florian Fainelli      2020-04-20  1653  		}
1da6df85c6fbed Florian Fainelli      2016-06-09  1654  		if ((mac_vid & ARLTBL_MAC_MASK) != mac)
1da6df85c6fbed Florian Fainelli      2016-06-09  1655  			continue;
2e97b0cd1651a2 Florian Fainelli      2020-04-20  1656  		if (dev->vlan_enabled &&
2e97b0cd1651a2 Florian Fainelli      2020-04-20  1657  		    ((mac_vid >> ARLTBL_VID_S) & ARLTBL_VID_MASK) != vid)
2e97b0cd1651a2 Florian Fainelli      2020-04-20  1658  			continue;
1da6df85c6fbed Florian Fainelli      2016-06-09  1659  		*idx = i;
6344dbde6a27d1 Florian Fainelli      2020-04-20  1660  		return 0;
1da6df85c6fbed Florian Fainelli      2016-06-09  1661  	}
1da6df85c6fbed Florian Fainelli      2016-06-09  1662  
673e69a67dd63f Florian Fainelli      2020-04-30  1663  	*idx = find_first_bit(free_bins, dev->num_arl_bins);
e18e5cbc70f170 Yury Norov            2022-01-23  1664  	return *idx >= dev->num_arl_bins ? -ENOSPC : -ENOENT;
1da6df85c6fbed Florian Fainelli      2016-06-09  1665  }
1da6df85c6fbed Florian Fainelli      2016-06-09  1666  
1da6df85c6fbed Florian Fainelli      2016-06-09 @1667  static int b53_arl_op(struct b53_device *dev, int op, int port,
1da6df85c6fbed Florian Fainelli      2016-06-09  1668  		      const unsigned char *addr, u16 vid, bool is_valid)
1da6df85c6fbed Florian Fainelli      2016-06-09  1669  {
1da6df85c6fbed Florian Fainelli      2016-06-09  1670  	struct b53_arl_entry ent;
1da6df85c6fbed Florian Fainelli      2016-06-09  1671  	u32 fwd_entry;
1da6df85c6fbed Florian Fainelli      2016-06-09  1672  	u64 mac, mac_vid = 0;
1da6df85c6fbed Florian Fainelli      2016-06-09  1673  	u8 idx = 0;
1da6df85c6fbed Florian Fainelli      2016-06-09  1674  	int ret;
1da6df85c6fbed Florian Fainelli      2016-06-09  1675  
1da6df85c6fbed Florian Fainelli      2016-06-09  1676  	/* Convert the array into a 64-bit MAC */
4b92ea81cca38e Florian Fainelli      2017-01-05  1677  	mac = ether_addr_to_u64(addr);
1da6df85c6fbed Florian Fainelli      2016-06-09  1678  
1da6df85c6fbed Florian Fainelli      2016-06-09  1679  	/* Perform a read for the given MAC and VID */
1da6df85c6fbed Florian Fainelli      2016-06-09  1680  	b53_write48(dev, B53_ARLIO_PAGE, B53_MAC_ADDR_IDX, mac);
1da6df85c6fbed Florian Fainelli      2016-06-09  1681  	b53_write16(dev, B53_ARLIO_PAGE, B53_VLAN_ID_IDX, vid);
1da6df85c6fbed Florian Fainelli      2016-06-09  1682  
1da6df85c6fbed Florian Fainelli      2016-06-09  1683  	/* Issue a read operation for this MAC */
1da6df85c6fbed Florian Fainelli      2016-06-09  1684  	ret = b53_arl_rw_op(dev, 1);
1da6df85c6fbed Florian Fainelli      2016-06-09  1685  	if (ret)
1da6df85c6fbed Florian Fainelli      2016-06-09  1686  		return ret;
1da6df85c6fbed Florian Fainelli      2016-06-09  1687  
ef2a0bd99b1549 Florian Fainelli      2020-04-30  1688  	ret = b53_arl_read(dev, mac, vid, &ent, &idx);
ef2a0bd99b1549 Florian Fainelli      2020-04-30  1689  
1da6df85c6fbed Florian Fainelli      2016-06-09  1690  	/* If this is a read, just finish now */
1da6df85c6fbed Florian Fainelli      2016-06-09  1691  	if (op)
1da6df85c6fbed Florian Fainelli      2016-06-09  1692  		return ret;
1da6df85c6fbed Florian Fainelli      2016-06-09  1693  
6344dbde6a27d1 Florian Fainelli      2020-04-20  1694  	switch (ret) {
774d977abfd024 Tom Rix               2020-08-21  1695  	case -ETIMEDOUT:
774d977abfd024 Tom Rix               2020-08-21  1696  		return ret;
6344dbde6a27d1 Florian Fainelli      2020-04-20  1697  	case -ENOSPC:
6344dbde6a27d1 Florian Fainelli      2020-04-20  1698  		dev_dbg(dev->dev, "{%pM,%.4d} no space left in ARL\n",
6344dbde6a27d1 Florian Fainelli      2020-04-20  1699  			addr, vid);
6344dbde6a27d1 Florian Fainelli      2020-04-20  1700  		return is_valid ? ret : 0;
6344dbde6a27d1 Florian Fainelli      2020-04-20  1701  	case -ENOENT:
1da6df85c6fbed Florian Fainelli      2016-06-09  1702  		/* We could not find a matching MAC, so reset to a new entry */
6344dbde6a27d1 Florian Fainelli      2020-04-20  1703  		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
6344dbde6a27d1 Florian Fainelli      2020-04-20  1704  			addr, vid, idx);
1da6df85c6fbed Florian Fainelli      2016-06-09  1705  		fwd_entry = 0;
6344dbde6a27d1 Florian Fainelli      2020-04-20  1706  		break;
6344dbde6a27d1 Florian Fainelli      2020-04-20  1707  	default:
6344dbde6a27d1 Florian Fainelli      2020-04-20  1708  		dev_dbg(dev->dev, "{%pM,%.4d} found, using idx: %d\n",
6344dbde6a27d1 Florian Fainelli      2020-04-20  1709  			addr, vid, idx);
6344dbde6a27d1 Florian Fainelli      2020-04-20  1710  		break;
1da6df85c6fbed Florian Fainelli      2016-06-09  1711  	}
1da6df85c6fbed Florian Fainelli      2016-06-09  1712  
5d65b64a3d9701 Florian Fainelli      2019-10-24  1713  	/* For multicast address, the port is a bitmask and the validity
5d65b64a3d9701 Florian Fainelli      2019-10-24  1714  	 * is determined by having at least one port being still active
5d65b64a3d9701 Florian Fainelli      2019-10-24  1715  	 */
5d65b64a3d9701 Florian Fainelli      2019-10-24  1716  	if (!is_multicast_ether_addr(addr)) {
1da6df85c6fbed Florian Fainelli      2016-06-09  1717  		ent.port = port;
1da6df85c6fbed Florian Fainelli      2016-06-09  1718  		ent.is_valid = is_valid;
5d65b64a3d9701 Florian Fainelli      2019-10-24  1719  	} else {
5d65b64a3d9701 Florian Fainelli      2019-10-24  1720  		if (is_valid)
5d65b64a3d9701 Florian Fainelli      2019-10-24  1721  			ent.port |= BIT(port);
5d65b64a3d9701 Florian Fainelli      2019-10-24  1722  		else
5d65b64a3d9701 Florian Fainelli      2019-10-24  1723  			ent.port &= ~BIT(port);
5d65b64a3d9701 Florian Fainelli      2019-10-24  1724  
5d65b64a3d9701 Florian Fainelli      2019-10-24  1725  		ent.is_valid = !!(ent.port);
5d65b64a3d9701 Florian Fainelli      2019-10-24  1726  	}
5d65b64a3d9701 Florian Fainelli      2019-10-24  1727  
1da6df85c6fbed Florian Fainelli      2016-06-09  1728  	ent.vid = vid;
1da6df85c6fbed Florian Fainelli      2016-06-09  1729  	ent.is_static = true;
5d65b64a3d9701 Florian Fainelli      2019-10-24  1730  	ent.is_age = false;
1da6df85c6fbed Florian Fainelli      2016-06-09  1731  	memcpy(ent.mac, addr, ETH_ALEN);
1da6df85c6fbed Florian Fainelli      2016-06-09  1732  	b53_arl_from_entry(&mac_vid, &fwd_entry, &ent);
1da6df85c6fbed Florian Fainelli      2016-06-09  1733  
1da6df85c6fbed Florian Fainelli      2016-06-09  1734  	b53_write64(dev, B53_ARLIO_PAGE,
1da6df85c6fbed Florian Fainelli      2016-06-09  1735  		    B53_ARLTBL_MAC_VID_ENTRY(idx), mac_vid);
1da6df85c6fbed Florian Fainelli      2016-06-09  1736  	b53_write32(dev, B53_ARLIO_PAGE,
1da6df85c6fbed Florian Fainelli      2016-06-09  1737  		    B53_ARLTBL_DATA_ENTRY(idx), fwd_entry);
1da6df85c6fbed Florian Fainelli      2016-06-09  1738  
1da6df85c6fbed Florian Fainelli      2016-06-09  1739  	return b53_arl_rw_op(dev, 0);
1da6df85c6fbed Florian Fainelli      2016-06-09  1740  }
1da6df85c6fbed Florian Fainelli      2016-06-09  1741  

:::::: The code at line 1487 was first introduced by commit
:::::: 3117455dd6c16dae13ad7425384bed045e98e63d net: dsa: b53: Export most operations to other drivers

:::::: TO: Florian Fainelli <f.fainelli@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
