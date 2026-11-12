Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505962;
	b=hxd0hAFUA7zdkVg8k6b0O7gBU5518YSZqgLtxCZDn9FBSS8W8evTp4bBQEBa77htUMQN
	 OyQTx67RWUgdrZfLNmc0a0/JSIin0KS+pNmwe9JrFNGKwZF5ITJgWMbl/R3Sna5DjzGJw
	 Kq6uO8dVN8bH9OilBAJ3/AtStIIPn/PwqegHdjYRaDLhwiJb0YNJF7TCU/9dJhZoMCKYO
	 byqhRTeWgdb1Aiw6aE/be9WrofeJqjlvSQKlG3j0B4uH9I3VUfSLQROA8SxeeCySOkwaS
	 xSzIi/DMs4V4Xb0PzCjfqm+SCVvjK3gE4c5lVkIArdQ/5+aL+2ChIuNT0m9uvn9EYtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505962;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=szL2LslxavqAtmAjIVyV5r7S7ebkfHEV0IsPNU4jNyM=;
	b=ASE2k0zTzox6Y/JHxxE5eO1QdTdWM6QdW5Buret7d+4XN4LbfkYR3H75o2EBxwc1cmhZ
	 fmu/Puz+v3NtR6UyN0wbfViI9gQmSUvq/px30IFLsMuUWVxJXXX5CEsmtFmVQ9RaJYxKW
	 h1GivC8/tpeWyzThFrZbMlhSclHbQo2JN7iyc9rXdXsTd8aR/6yfBgNJSNbYzmwOh55uN
	 MaSSMKxD6U0zxw9PdvtqJmIoMDyvgXwLoS8a00P2GsU+6gB1mfyjyGeU4kVac9mDYLoeX
	 lFbYzTn8yT5VB6zE8aEkUglDHwvhY3bmNXk1J32spjaSiC+MY1xzJqoWEmC1gEB/6lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X+wce0r1;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C389F606A333
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 17:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C389F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X+wce0r1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794505962; x=1826041962;
  h=date:from:to:cc:subject:message-id;
  bh=evUZnARAxnpdd98TuEwcCWtzZjBanQq6NjU4Pc/SUEk=;
  b=X+wce0r1FCtHqiAKCCp+EtdxCvwZEdLKP/d1JEg6ZzQbYQG63Ks5hlhS
   yvWq9eeYyulNkpiJ1+tOWcVqVguTF3PhOqYpBk9/Mehdt8t/g72VQD+TJ
   I/3TlLeU1v+rsgHOiEOsWX0/eeYiSU7ZT0WZZNTklieFxRevbc0ZBXX0Z
   djbTO8j1bmu8oKSjplsCPqbA3MBMKVqDyckGTv5TBfaQ/r9ARU7p6hTYO
   Knp5nptrnFmcz0vunhGQf+eRlk+LIqxqQ8V+PuTJNyLfoZt+66aSUL/D1
   R8iU6asflBy5CNJpjy027xPyzut8iKftgntJZEv+Z1Y5evwrDegE1KMpO
   A==;
X-CSE-ConnectionGUID: nIvpdNz2Q4KBZRa5bVQTAw==
X-CSE-MsgGUID: ryWSMBGKSIuUS5jcrflKqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3222594"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3222594"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 09:52:41 -0800
X-CSE-ConnectionGUID: 43ZkAcR0RsyMNEs/EWhZrA==
X-CSE-MsgGUID: rtzAgKoFT0OXcq6VlSSs7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8583334"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Nov 2026 09:52:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRYyS-000000011sZ-2oY9;
	Thu, 12 Nov 2026 17:52:36 +0000
Date: Fri, 13 Nov 2026 01:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/2]
 include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used
Message-ID: <202611130109.6KxeAUpi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Feng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   1fff066d713e51b675a78a9d50b68af5f108220d
commit: c65b1bd0af076fa5a1da26b9cf780097b14b1543 [2/2] mm/page_alloc: detect allocation forbidden by cpuset and bail out early
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20261113/202611130109.6KxeAUpi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130109.6KxeAUpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130109.6KxeAUpi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/linux/tracehook.h:47,
                    from include/linux/entry-common.h:5,
                    from arch/x86/entry/common.c:13:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/entry/common.c: At top level:
   arch/x86/entry/common.c:82:24: warning: no previous prototype for 'do_int80_syscall_32' [-Wmissing-prototypes]
      82 | __visible noinstr void do_int80_syscall_32(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~~~~~~
   arch/x86/entry/common.c:148:24: warning: no previous prototype for 'do_fast_syscall_32' [-Wmissing-prototypes]
     148 | __visible noinstr long do_fast_syscall_32(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~~~~~
   arch/x86/entry/common.c:200:24: warning: no previous prototype for 'do_SYSENTER_32' [-Wmissing-prototypes]
     200 | __visible noinstr long do_SYSENTER_32(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/x86/kernel/head32.c:11:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/kernel/head32.c: At top level:
   arch/x86/kernel/head32.c:72:13: warning: no previous prototype for 'mk_early_pgtbl_32' [-Wmissing-prototypes]
      72 | void __init mk_early_pgtbl_32(void)
         |             ^~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:97,
                    from arch/x86/kernel/static_call.c:2:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/kernel/static_call.c: At top level:
   arch/x86/kernel/static_call.c:20:17: warning: 'tramp_ud' defined but not used [-Wunused-const-variable=]
      20 | static const u8 tramp_ud[] = { 0x0f, 0xb9, 0xcc };
         |                 ^~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/x86/kernel/process.c:6:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/kernel/process.c: At top level:
   arch/x86/kernel/process.c:884:13: warning: no previous prototype for 'arch_post_acpi_subsys_init' [-Wmissing-prototypes]
     884 | void __init arch_post_acpi_subsys_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/x86/kernel/doublefault_32.c:2:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/kernel/doublefault_32.c: At top level:
   arch/x86/kernel/doublefault_32.c:23:36: warning: no previous prototype for 'doublefault_shim' [-Wmissing-prototypes]
      23 | asmlinkage noinstr void __noreturn doublefault_shim(void)
         |                                    ^~~~~~~~~~~~~~~~
   arch/x86/kernel/doublefault_32.c:117:6: warning: no previous prototype for 'doublefault_init_cpu_tss' [-Wmissing-prototypes]
     117 | void doublefault_init_cpu_tss(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/memblock.h:13,
                    from arch/x86/mm/ioremap.c:10:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/mm/ioremap.c: At top level:
   arch/x86/mm/ioremap.c:492:12: warning: no previous prototype for 'arch_ioremap_p4d_supported' [-Wmissing-prototypes]
     492 | int __init arch_ioremap_p4d_supported(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/ioremap.c:497:12: warning: no previous prototype for 'arch_ioremap_pud_supported' [-Wmissing-prototypes]
     497 | int __init arch_ioremap_pud_supported(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/ioremap.c:506:12: warning: no previous prototype for 'arch_ioremap_pmd_supported' [-Wmissing-prototypes]
     506 | int __init arch_ioremap_pmd_supported(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/ioremap.c:792:17: warning: no previous prototype for 'early_memremap_pgprot_adjust' [-Wmissing-prototypes]
     792 | pgprot_t __init early_memremap_pgprot_adjust(resource_size_t phys_addr,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/fs.h:15,
                    from include/linux/compat.h:17,
                    from arch/x86/include/asm/fpu/internal.h:14,
                    from arch/x86/mm/extable.c:7:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/mm/extable.c: At top level:
   arch/x86/mm/extable.c:27:16: warning: no previous prototype for 'ex_handler_default' [-Wmissing-prototypes]
      27 | __visible bool ex_handler_default(const struct exception_table_entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:37:16: warning: no previous prototype for 'ex_handler_fault' [-Wmissing-prototypes]
      37 | __visible bool ex_handler_fault(const struct exception_table_entry *fixup,
         |                ^~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:58:16: warning: no previous prototype for 'ex_handler_fprestore' [-Wmissing-prototypes]
      58 | __visible bool ex_handler_fprestore(const struct exception_table_entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:72:16: warning: no previous prototype for 'ex_handler_uaccess' [-Wmissing-prototypes]
      72 | __visible bool ex_handler_uaccess(const struct exception_table_entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:83:16: warning: no previous prototype for 'ex_handler_copy' [-Wmissing-prototypes]
      83 | __visible bool ex_handler_copy(const struct exception_table_entry *fixup,
         |                ^~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:95:16: warning: no previous prototype for 'ex_handler_rdmsr_unsafe' [-Wmissing-prototypes]
      95 | __visible bool ex_handler_rdmsr_unsafe(const struct exception_table_entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:112:16: warning: no previous prototype for 'ex_handler_wrmsr_unsafe' [-Wmissing-prototypes]
     112 | __visible bool ex_handler_wrmsr_unsafe(const struct exception_table_entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/extable.c:128:16: warning: no previous prototype for 'ex_handler_clear_fs' [-Wmissing-prototypes]
     128 | __visible bool ex_handler_clear_fs(const struct exception_table_entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/fs.h:15,
                    from include/linux/highmem.h:5,
                    from arch/x86/mm/highmem_32.c:2:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/mm/highmem_32.c: At top level:
   arch/x86/mm/highmem_32.c:66:13: warning: no previous prototype for 'set_highmem_pages_init' [-Wmissing-prototypes]
      66 | void __init set_highmem_pages_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/x86/entry/vdso/vma.c:7:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/entry/vdso/vma.c: At top level:
   arch/x86/entry/vdso/vma.c:35:19: warning: no previous prototype for 'arch_get_vdso_data' [-Wmissing-prototypes]
      35 | struct vdso_data *arch_get_vdso_data(void *vvar_page)
         |                   ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/clocksource.h:19,
                    from include/clocksource/hyperv_timer.h:16,
                    from arch/x86/include/asm/vdso/gettimeofday.h:21,
                    from include/vdso/datapage.h:137,
                    from arch/x86/entry/vdso/vdso32/../../../../../lib/vdso/gettimeofday.c:5,
                    from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:15,
                    from arch/x86/entry/vdso/vdso32/vclock_gettime.c:29:
   include/linux/mmzone.h: In function 'movable_only_nodes':
>> include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^~~
   arch/x86/entry/vdso/vdso32/../vclock_gettime.c: At top level:
   arch/x86/entry/vdso/vdso32/../vclock_gettime.c:70:5: warning: no previous prototype for '__vdso_clock_gettime64' [-Wmissing-prototypes]
      70 | int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts)
         |     ^~~~~~~~~~~~~~~~~~~~~~
..


vim +/nid +1136 include/linux/mmzone.h

  1094	
  1095	/**
  1096	 * for_each_zone_zonelist_nodemask - helper macro to iterate over valid zones in a zonelist at or below a given zone index and within a nodemask
  1097	 * @zone - The current zone in the iterator
  1098	 * @z - The current pointer within zonelist->_zonerefs being iterated
  1099	 * @zlist - The zonelist being iterated
  1100	 * @highidx - The zone index of the highest zone to return
  1101	 * @nodemask - Nodemask allowed by the allocator
  1102	 *
  1103	 * This iterator iterates though all zones at or below a given zone index and
  1104	 * within a given nodemask
  1105	 */
  1106	#define for_each_zone_zonelist_nodemask(zone, z, zlist, highidx, nodemask) \
  1107		for (z = first_zones_zonelist(zlist, highidx, nodemask), zone = zonelist_zone(z);	\
  1108			zone;							\
  1109			z = next_zones_zonelist(++z, highidx, nodemask),	\
  1110				zone = zonelist_zone(z))
  1111	
  1112	#define for_next_zone_zonelist_nodemask(zone, z, highidx, nodemask) \
  1113		for (zone = z->zone;	\
  1114			zone;							\
  1115			z = next_zones_zonelist(++z, highidx, nodemask),	\
  1116				zone = zonelist_zone(z))
  1117	
  1118	
  1119	/**
  1120	 * for_each_zone_zonelist - helper macro to iterate over valid zones in a zonelist at or below a given zone index
  1121	 * @zone - The current zone in the iterator
  1122	 * @z - The current pointer within zonelist->zones being iterated
  1123	 * @zlist - The zonelist being iterated
  1124	 * @highidx - The zone index of the highest zone to return
  1125	 *
  1126	 * This iterator iterates though all zones at or below a given zone index.
  1127	 */
  1128	#define for_each_zone_zonelist(zone, z, zlist, highidx) \
  1129		for_each_zone_zonelist_nodemask(zone, z, zlist, highidx, NULL)
  1130	
  1131	/* Whether the 'nodes' are all movable nodes */
  1132	static inline bool movable_only_nodes(nodemask_t *nodes)
  1133	{
  1134		struct zonelist *zonelist;
  1135		struct zoneref *z;
> 1136		int nid;
  1137	
  1138		if (nodes_empty(*nodes))
  1139			return false;
  1140	
  1141		/*
  1142		 * We can chose arbitrary node from the nodemask to get a
  1143		 * zonelist as they are interlinked. We just need to find
  1144		 * at least one zone that can satisfy kernel allocations.
  1145		 */
  1146		nid = first_node(*nodes);
  1147		zonelist = &NODE_DATA(nid)->node_zonelists[ZONELIST_FALLBACK];
  1148		z = first_zones_zonelist(zonelist, ZONE_NORMAL,	nodes);
  1149		return (!z->zone) ? true : false;
  1150	}
  1151	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
