Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2EB1D63E4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 04:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754540035; cv=none; b=qKAxkQNdtp0yuFBuuu80KAAVCwbuONXu9n2xr4rR3bhstuUfBrZlrExjAFGDV+4VFcOBy+LUfbjZKCZ+MBPZ7nc/yNAz/jbIFd1LGX17UL/5+16jcyKIjFVX6QfpO0vv8q4lhyezEhhlG6gpRkSFQYX8yN3q9oRemV8qEveJhQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754540035; c=relaxed/simple;
	bh=PStXduBA9idAz6acD5BOYjirkbWATPI+NP+4ZSOgePA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dv4qcnJoGUbpaVO1nC0YxNoHxtsi5t6hPR12jzf1XmYrv6HDZX1bHWTs8FWF77NHnJB9kgxqjg27zahx5sl7bMMkZcdWk3irwP89FPisbvUL3iEKUBHDYz+gkfNotaIl5MqAPGgfIypjtPo+VvDSw+oQgnDCfO8lHxqkXpHGjbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdBcbvYO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdBcbvYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754540033; x=1786076033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PStXduBA9idAz6acD5BOYjirkbWATPI+NP+4ZSOgePA=;
  b=AdBcbvYOk29o9mqqqay7aJgJv0B70cINiqxEYl4vfdjucHl/SkKxkkDL
   tGq2unirYkdIsyPwAD9OhkOYrbosr0T+5BEu82y1oVJjNajeVRUga/Ha/
   o5t9Xsj+BnOfTc3YbntutZ69IFd78taeRtGGuCgGrPyWo4+m2ZVkY44AD
   /YcqhWcOt53OKCfSlNq1frdpFDPDLrq7flG0mPMcIM0jQ5kNOZN7mMZbJ
   oWM1+mPDZGSsjqpJxsuJ8wZjhRW3DBOl2UaNv9rDsYKHBxPS3JSHImZHF
   QwsgBrqMuaceGFkvBeCZXth8xK320tihrsNMBS/owCJdM5auFxPCViuNs
   g==;
X-CSE-ConnectionGUID: pBHoe9sFSTKcHpIrxaMPLQ==
X-CSE-MsgGUID: VkI3Ij3CS0aJeDVX5Kx7nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="55902513"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="55902513"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 21:13:51 -0700
X-CSE-ConnectionGUID: RFdTZXWcQWC0dpuqo9v/JA==
X-CSE-MsgGUID: ZAGytQ1bRc+jZaOL9bnvDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164851036"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Aug 2025 21:13:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujs0h-0002MI-2n;
	Thu, 07 Aug 2025 04:13:47 +0000
Date: Thu, 7 Aug 2025 12:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10998/13338] ERROR: modpost: __ex_table+0x15f4
 references non-executable section '__ex_table'
Message-ID: <202508071244.4O5qIp52-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b7d4e259682caccb51a25283655f2c8f02e32d23
commit: 66639db858112bf6b0f76677f7517643d586e575 [10998/13338] Merge branch 'vfs-6.17.iomap' into vfs.all
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071244.4O5qIp52-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071244.4O5qIp52-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071244.4O5qIp52-lkp@intel.com/

Note: the linux-next/master HEAD b7d4e259682caccb51a25283655f2c8f02e32d23 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: hsr_nl_nodedown+0x1c4 (section: .text.hsr_nl_nodedown) -> hx8357d_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_nl_nodedown+0x1dc (section: .text.hsr_nl_nodedown) -> hx8357d_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_nl_nodedown+0x204 (section: .text.hsr_nl_nodedown) -> hx8357d_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_out_of_sequence+0x15e (section: .text.prp_dup_discard_out_of_sequence) -> ili9486_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_out_of_sequence+0x1d6 (section: .text.prp_dup_discard_out_of_sequence) -> ili9486_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_out_of_sequence+0x21a (section: .text.prp_dup_discard_out_of_sequence) -> ili9486_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_out_of_sequence+0x266 (section: .text.prp_dup_discard_out_of_sequence) -> ili9486_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_out_of_sequence+0x2ae (section: .text.prp_dup_discard_out_of_sequence) -> ili9486_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_out_of_sequence+0x2f2 (section: .text.prp_dup_discard_out_of_sequence) -> mi0283qt_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: prp_dup_discard_out_of_sequence+0x33e (section: .text.prp_dup_discard_out_of_sequence) -> mi0283qt_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0xa0 (section: .text.ida_free) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0xba (section: .text.ida_free) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_free+0xdc (section: .text.ida_free) -> devices_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x4c (section: .text.ida_alloc_range) -> devices_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x9c (section: .text.ida_alloc_range) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ida_alloc_range+0x31a (section: .text.ida_alloc_range) -> devices_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kobj_kset_leave+0x2 (section: .text.kobj_kset_leave) -> save_async_options (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __kobject_del+0x18 (section: .text.__kobject_del) -> .LVL39 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x2aa (section: .text.mas_empty_area_rev) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x2ba (section: .text.mas_empty_area_rev) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x2c0 (section: .text.mas_empty_area_rev) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x2d0 (section: .text.mas_empty_area_rev) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x2da (section: .text.mas_empty_area_rev) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x2ec (section: .text.mas_empty_area_rev) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x2fe (section: .text.mas_empty_area_rev) -> __platform_driver_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x314 (section: .text.mas_empty_area_rev) -> __platform_driver_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x328 (section: .text.mas_empty_area_rev) -> __platform_driver_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x34c (section: .text.mas_empty_area_rev) -> __platform_driver_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x398 (section: .text.mas_empty_area_rev) -> __platform_driver_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x39e (section: .text.mas_empty_area_rev) -> __platform_driver_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x3d4 (section: .text.mas_empty_area_rev) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x400 (section: .text.mas_empty_area_rev) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area_rev+0x42a (section: .text.mas_empty_area_rev) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump_node+0x230 (section: .text.mt_dump_node) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump_node+0x24a (section: .text.mt_dump_node) -> __platform_driver_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x20 (section: .text.mt_dump) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x32 (section: .text.mt_dump) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x42 (section: .text.mt_dump) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x4c (section: .text.mt_dump) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x56 (section: .text.mt_dump) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0x7c (section: .text.mt_dump) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_dump+0xd4 (section: .text.mt_dump) -> __platform_driver_probe (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x43e (section: .text.mas_empty_area) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x454 (section: .text.mas_empty_area) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x466 (section: .text.mas_empty_area) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x4b2 (section: .text.mas_empty_area) -> platform_bus_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x4ba (section: .text.mas_empty_area) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x4d2 (section: .text.mas_empty_area) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x532 (section: .text.mas_empty_area) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x548 (section: .text.mas_empty_area) -> __platform_create_bundle (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x572 (section: .text.mas_empty_area) -> .L461 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x574 (section: .text.mas_empty_area) -> __platform_create_bundle (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x57a (section: .text.mas_empty_area) -> __platform_create_bundle (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x592 (section: .text.mas_empty_area) -> .L459 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x5de (section: .text.mas_empty_area) -> .L457 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x5e4 (section: .text.mas_empty_area) -> .L458 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_empty_area+0x5f0 (section: .text.mas_empty_area) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_root_expand+0x84 (section: .text.mas_root_expand) -> .L495 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_root_expand+0x98 (section: .text.mas_root_expand) -> cpu_dev_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_range+0x18 (section: .text.mas_prev_range) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev+0x18 (section: .text.mas_prev) -> classes_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rb_insert_augmented+0xc8 (section: .text.__rb_insert_augmented) -> auxiliary_bus_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rb_insert_augmented+0xe8 (section: .text.__rb_insert_augmented) -> auxiliary_bus_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rb_insert_augmented+0xf8 (section: .text.__rb_insert_augmented) -> auxiliary_bus_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rb_insert_augmented+0x102 (section: .text.__rb_insert_augmented) -> auxiliary_bus_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rb_insert_augmented+0x114 (section: .text.__rb_insert_augmented) -> mount_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_first+0x8 (section: .text.rb_first) -> mount_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_first+0xa (section: .text.rb_first) -> mount_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_first+0x10 (section: .text.rb_first) -> mount_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_last+0x8 (section: .text.rb_last) -> mount_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_last+0xa (section: .text.rb_last) -> mount_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_last+0x10 (section: .text.rb_last) -> mount_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rb_erase_color+0xda (section: .text.__rb_erase_color) -> auxiliary_bus_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rb_erase_color+0xf8 (section: .text.__rb_erase_color) -> mount_param (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rb_erase_color+0x188 (section: .text.__rb_erase_color) -> auxiliary_bus_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a8 (section: __ex_table) -> .LASF2557 (section: .debug_str)
ERROR: modpost: __ex_table+0x15a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15ac (section: __ex_table) -> .LASF2559 (section: .debug_str)
ERROR: modpost: __ex_table+0x15ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b4 (section: __ex_table) -> .LASF2561 (section: .debug_str)
ERROR: modpost: __ex_table+0x15b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b8 (section: __ex_table) -> .LASF2563 (section: .debug_str)
ERROR: modpost: __ex_table+0x15b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c0 (section: __ex_table) -> .LASF2565 (section: .debug_str)
ERROR: modpost: __ex_table+0x15c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c4 (section: __ex_table) -> .LASF2567 (section: .debug_str)
ERROR: modpost: __ex_table+0x15c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15cc (section: __ex_table) -> .LASF2569 (section: .debug_str)
ERROR: modpost: __ex_table+0x15cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d0 (section: __ex_table) -> .LASF2563 (section: .debug_str)
ERROR: modpost: __ex_table+0x15d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d8 (section: __ex_table) -> .LASF2572 (section: .debug_str)
ERROR: modpost: __ex_table+0x15d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15dc (section: __ex_table) -> .LASF2563 (section: .debug_str)
ERROR: modpost: __ex_table+0x15dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15e4 (section: __ex_table) -> .LASF2575 (section: .debug_str)
ERROR: modpost: __ex_table+0x15e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15e8 (section: __ex_table) -> .LASF2577 (section: .debug_str)
ERROR: modpost: __ex_table+0x15e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15f4 (section: __ex_table) -> .L0  (section: __ex_table)
>> ERROR: modpost: __ex_table+0x15f4 references non-executable section '__ex_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15fc (section: __ex_table) -> .L0  (section: __ex_table)
ERROR: modpost: __ex_table+0x15fc references non-executable section '__ex_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1600 (section: __ex_table) -> .L0  (section: __ex_table)
ERROR: modpost: __ex_table+0x1600 references non-executable section '__ex_table'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1614 (section: __ex_table) -> .LASF219 (section: .debug_str)
ERROR: modpost: __ex_table+0x1614 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1618 (section: __ex_table) -> .LASF221 (section: .debug_str)
ERROR: modpost: __ex_table+0x1618 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1620 (section: __ex_table) -> .LASF223 (section: .debug_str)
ERROR: modpost: __ex_table+0x1620 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1624 (section: __ex_table) -> .LASF221 (section: .debug_str)
ERROR: modpost: __ex_table+0x1624 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x162c (section: __ex_table) -> .LASF226 (section: .debug_str)
ERROR: modpost: __ex_table+0x162c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1630 (section: __ex_table) -> .LASF221 (section: .debug_str)
ERROR: modpost: __ex_table+0x1630 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> .LASF229 (section: .debug_str)
ERROR: modpost: __ex_table+0x1638 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x163c (section: __ex_table) -> .LASF221 (section: .debug_str)
ERROR: modpost: __ex_table+0x163c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1644 (section: __ex_table) -> .LASF232 (section: .debug_str)
ERROR: modpost: __ex_table+0x1644 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1648 (section: __ex_table) -> .LASF221 (section: .debug_str)
ERROR: modpost: __ex_table+0x1648 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1650 (section: __ex_table) -> .LASF235 (section: .debug_str)
ERROR: modpost: __ex_table+0x1650 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1654 (section: __ex_table) -> .LASF221 (section: .debug_str)
ERROR: modpost: __ex_table+0x1654 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x165c (section: __ex_table) -> .LASF238 (section: .debug_str)
ERROR: modpost: __ex_table+0x165c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1660 (section: __ex_table) -> .LASF240 (section: .debug_str)
ERROR: modpost: __ex_table+0x1660 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF242 (section: .debug_str)
ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF244 (section: .debug_str)
ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF246 (section: .debug_str)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF248 (section: .debug_str)
ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1680 (section: __ex_table) -> .LASF250 (section: .debug_str)
ERROR: modpost: __ex_table+0x1680 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1684 (section: __ex_table) -> .LASF252 (section: .debug_str)
ERROR: modpost: __ex_table+0x1684 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x168c (section: __ex_table) -> .LASF254 (section: .debug_str)
ERROR: modpost: __ex_table+0x168c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1690 (section: __ex_table) -> .LASF256 (section: .debug_str)
ERROR: modpost: __ex_table+0x1690 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1698 (section: __ex_table) -> .LASF258 (section: .debug_str)
ERROR: modpost: __ex_table+0x1698 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x169c (section: __ex_table) -> .LASF260 (section: .debug_str)
ERROR: modpost: __ex_table+0x169c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a4 (section: __ex_table) -> .LASF262 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a8 (section: __ex_table) -> .LASF264 (section: .debug_str)
ERROR: modpost: __ex_table+0x16a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b0 (section: __ex_table) -> .LASF266 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> .LASF268 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> .LASF270 (section: .debug_str)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> .LASF272 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c8 (section: __ex_table) -> .LASF274 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16cc (section: __ex_table) -> .LASF276 (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16d4 (section: __ex_table) -> .LASF278 (section: .debug_str)
ERROR: modpost: __ex_table+0x16d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16d8 (section: __ex_table) -> .LASF280 (section: .debug_str)
ERROR: modpost: __ex_table+0x16d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16e0 (section: __ex_table) -> .LLST24 (section: .debug_loc)
ERROR: modpost: __ex_table+0x16e0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16e4 (section: __ex_table) -> .LLST26 (section: .debug_loc)
ERROR: modpost: __ex_table+0x16e4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16ec (section: __ex_table) -> .LLST28 (section: .debug_loc)
ERROR: modpost: __ex_table+0x16ec references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f0 (section: __ex_table) -> .LLST26 (section: .debug_loc)
ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f8 (section: __ex_table) -> .LLST30 (section: .debug_loc)
ERROR: modpost: __ex_table+0x16f8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16fc (section: __ex_table) -> .LLST26 (section: .debug_loc)
ERROR: modpost: __ex_table+0x16fc references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1704 (section: __ex_table) -> .LASF4983 (section: .debug_str)
ERROR: modpost: __ex_table+0x1704 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1714 (section: __ex_table) -> .LLST26 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1714 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x171c (section: __ex_table) -> .LASF259 (section: .debug_str)
ERROR: modpost: __ex_table+0x171c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1720 (section: __ex_table) -> .LASF261 (section: .debug_str)
ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x174c (section: __ex_table) -> .LASF1790 (section: .debug_str)
ERROR: modpost: __ex_table+0x174c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1750 (section: __ex_table) -> .LASF1792 (section: .debug_str)
ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .LASF1794 (section: .debug_str)
ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x175c (section: __ex_table) -> .LASF1796 (section: .debug_str)
ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
