Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A924728B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754570295; cv=none; b=tSrAN1C97+U1QfSG5bNuiGWe9UbKp9WRROelKWcyg785B8xnEuia8qcqGwsKxH1F9daWHA8gYMZCA5vYN6Gq8tD7HSMCzxGg4xW65WRPWXivpC4RC1vE38SFABOYBS2YnQW39VJtY4x/ZBtJEOvEc+6PBFO9TWaeNfJ/KW6ja3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754570295; c=relaxed/simple;
	bh=6pTSb1keoKczH4h4GREJDa9IusqJdx63PbNOyGy7QVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmRTguQ95jiOZKw9K/SDhIYE2f9TUAt15Ge2jj21jUmKUOFEfSSkpfxQUgbdoWjA05qBzvF7Fk2DPsvwbMg1WbOJGaeknwtjBzGRBjt70DfqBK1HFtiZMNrI9xKo1qIzApjbR8JtZEblD62EeMyC78m4e3Gg18o6YA2vJH0xGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=f2pIy5v1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f2pIy5v1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9wyyCeB4WSVJSvXBxmgllZmeyf27OQa7645xwrBtpVM=; b=f2pIy5v1RxQtScQWZfU4bgW2o4
	X2T/KwX6SU1Up2NV9CQG61bZmL9h5MrVjji1Psupd3piIom6jIRO93gbfdenRXoHU2lZJz/l//TZf
	NdbeaCjSwfuxOPvs8IkDJ7aYTj8DDaHFOTmVWSPqZX9viPzfGjeOBN2SWBRL0QDJpp36I9ROjr7h+
	auuQf4dqT8uYThYJ66Xr5bB+iMby9gRMRC0A4JXkjUC4dI+NuO/Dj1wlgQMzGKdqjhZ8A0gjzoUbK
	xdHBZhGWAPwG02/x5RDlpqhwTwHWSPplQvA+3vKC8BihaVyAMgN5GyDZufv57VzJoHg32CPGNd2/u
	5vtNdz/A==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzsm-0000000Fgce-12lk;
	Thu, 07 Aug 2025 12:38:08 +0000
Date: Thu, 7 Aug 2025 13:38:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [linux-next:master 13554/13560] ERROR: modpost:
 __ex_table+0x1560 references non-executable section
 '.data.rel.local.f2fs_attr_sb_encryption'
Message-ID: <aJSeL1pF3Qleih6D@casper.infradead.org>
References: <202508071840.SzIzxq5q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508071840.SzIzxq5q-lkp@intel.com>


This looks like a bug in the riscv toolchain.  forwarding.

On Thu, Aug 07, 2025 at 06:14:29PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   442d93313caebc8ccd6d53f4572c50732a95bc48
> commit: 495bbad443e5d730527ea3dd232e4aaec3462dc6 [13554/13560] Merge branch 'main' of git://git.infradead.org/users/willy/xarray.git
> config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071840.SzIzxq5q-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071840.SzIzxq5q-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508071840.SzIzxq5q-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: vmlinux: section mismatch in reference: ___ratelimit+0x108 (section: .text.___ratelimit) -> tps6594_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: ___ratelimit+0x18a (section: .text.___ratelimit) -> tps6594_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x10e (section: .text.vsnprintf) -> bd9571mwv_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x164 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x16c (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x18a (section: .text.vsnprintf) -> bd9571mwv_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x18e (section: .text.vsnprintf) -> cs42l43_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x1a6 (section: .text.vsnprintf) -> cs42l43_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x1b2 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x1d0 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x1e0 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x216 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x24c (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x262 (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: vsnprintf+0x2ee (section: .text.vsnprintf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0xb6 (section: .text.bstr_printf) -> bd9571mwv_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0xe0 (section: .text.bstr_printf) -> bd9571mwv_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x106 (section: .text.bstr_printf) -> bd9571mwv_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x138 (section: .text.bstr_printf) -> bd9571mwv_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x17e (section: .text.bstr_printf) -> cs42l43_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x186 (section: .text.bstr_printf) -> bd9571mwv_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x1be (section: .text.bstr_printf) -> bd9571mwv_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x1c6 (section: .text.bstr_printf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: bstr_printf+0x33a (section: .text.bstr_printf) -> cs42l43_i2c_driver_exit (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: xas_destroy+0x16 (section: .text.xas_destroy) -> tps65912_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: __xas_nomem+0x20 (section: .text.__xas_nomem) -> tps65912_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: xas_nomem+0x20 (section: .text.xas_nomem) -> tps65912_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: xas_free_nodes+0x2a (section: .text.xas_free_nodes) -> tps65912_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: xas_store+0x2f2 (section: .text.xas_store) -> tps65912_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: xas_store+0x4ba (section: .text.xas_store) -> tps65912_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: xas_store+0x54c (section: .text.xas_store) -> tps65912_i2c_driver_init (section: .init.text)
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1494 (section: __ex_table) -> f2fs_attr_gc_idle (section: .data.rel.local.f2fs_attr_gc_idle)
> ERROR: modpost: __ex_table+0x1494 references non-executable section '.data.rel.local.f2fs_attr_gc_idle'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1498 (section: __ex_table) -> f2fs_attr_gc_max_sleep_time (section: .data.rel.local.f2fs_attr_gc_max_sleep_time)
> ERROR: modpost: __ex_table+0x1498 references non-executable section '.data.rel.local.f2fs_attr_gc_max_sleep_time'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14a0 (section: __ex_table) -> f2fs_attr_gc_mode (section: .data.rel.local.f2fs_attr_gc_mode)
> ERROR: modpost: __ex_table+0x14a0 references non-executable section '.data.rel.local.f2fs_attr_gc_mode'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14a4 (section: __ex_table) -> f2fs_attr_gc_no_zoned_gc_percent (section: .data.rel.local.f2fs_attr_gc_no_zoned_gc_percent)
> ERROR: modpost: __ex_table+0x14a4 references non-executable section '.data.rel.local.f2fs_attr_gc_no_zoned_gc_percent'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14ac (section: __ex_table) -> f2fs_attr_gc_reclaimed_segments (section: .data.rel.local.f2fs_attr_gc_reclaimed_segments)
> ERROR: modpost: __ex_table+0x14ac references non-executable section '.data.rel.local.f2fs_attr_gc_reclaimed_segments'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14b0 (section: __ex_table) -> f2fs_attr_gc_segment_mode (section: .data.rel.local.f2fs_attr_gc_segment_mode)
> ERROR: modpost: __ex_table+0x14b0 references non-executable section '.data.rel.local.f2fs_attr_gc_segment_mode'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14b8 (section: __ex_table) -> f2fs_attr_gc_urgent_sleep_time (section: .data.rel.local.f2fs_attr_gc_urgent_sleep_time)
> ERROR: modpost: __ex_table+0x14b8 references non-executable section '.data.rel.local.f2fs_attr_gc_urgent_sleep_time'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14bc (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> ERROR: modpost: __ex_table+0x14bc references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14c4 (section: __ex_table) -> f2fs_attr_ipu_policy (section: .data.rel.local.f2fs_attr_ipu_policy)
> ERROR: modpost: __ex_table+0x14c4 references non-executable section '.data.rel.local.f2fs_attr_ipu_policy'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14c8 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> ERROR: modpost: __ex_table+0x14c8 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14d0 (section: __ex_table) -> f2fs_attr_lifetime_write_kbytes (section: .data.rel.local.f2fs_attr_lifetime_write_kbytes)
> ERROR: modpost: __ex_table+0x14d0 references non-executable section '.data.rel.local.f2fs_attr_lifetime_write_kbytes'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14d4 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> ERROR: modpost: __ex_table+0x14d4 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14dc (section: __ex_table) -> f2fs_attr_max_discard_request (section: .data.rel.local.f2fs_attr_max_discard_request)
> ERROR: modpost: __ex_table+0x14dc references non-executable section '.data.rel.local.f2fs_attr_max_discard_request'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14e0 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> ERROR: modpost: __ex_table+0x14e0 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14e8 (section: __ex_table) -> f2fs_attr_max_io_bytes (section: .data.rel.local.f2fs_attr_max_io_bytes)
> ERROR: modpost: __ex_table+0x14e8 references non-executable section '.data.rel.local.f2fs_attr_max_io_bytes'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14ec (section: __ex_table) -> f2fs_attr_max_read_extent_count (section: .data.rel.local.f2fs_attr_max_read_extent_count)
> ERROR: modpost: __ex_table+0x14ec references non-executable section '.data.rel.local.f2fs_attr_max_read_extent_count'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14f4 (section: __ex_table) -> f2fs_attr_max_small_discards (section: .data.rel.local.f2fs_attr_max_small_discards)
> ERROR: modpost: __ex_table+0x14f4 references non-executable section '.data.rel.local.f2fs_attr_max_small_discards'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x14f8 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> ERROR: modpost: __ex_table+0x14f8 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1500 (section: __ex_table) -> f2fs_attr_migration_granularity (section: .data.rel.local.f2fs_attr_migration_granularity)
> ERROR: modpost: __ex_table+0x1500 references non-executable section '.data.rel.local.f2fs_attr_migration_granularity'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1504 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> ERROR: modpost: __ex_table+0x1504 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x150c (section: __ex_table) -> f2fs_attr_min_fsync_blocks (section: .data.rel.local.f2fs_attr_min_fsync_blocks)
> ERROR: modpost: __ex_table+0x150c references non-executable section '.data.rel.local.f2fs_attr_min_fsync_blocks'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1510 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> ERROR: modpost: __ex_table+0x1510 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1518 (section: __ex_table) -> f2fs_attr_min_seq_blocks (section: .data.rel.local.f2fs_attr_min_seq_blocks)
> ERROR: modpost: __ex_table+0x1518 references non-executable section '.data.rel.local.f2fs_attr_min_seq_blocks'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x151c (section: __ex_table) -> f2fs_attr_mounted_time_sec (section: .data.rel.local.f2fs_attr_mounted_time_sec)
> ERROR: modpost: __ex_table+0x151c references non-executable section '.data.rel.local.f2fs_attr_mounted_time_sec'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1524 (section: __ex_table) -> f2fs_attr_moved_blocks_foreground (section: .data.rel.local.f2fs_attr_moved_blocks_foreground)
> ERROR: modpost: __ex_table+0x1524 references non-executable section '.data.rel.local.f2fs_attr_moved_blocks_foreground'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1528 (section: __ex_table) -> f2fs_attr_ovp_segments (section: .data.rel.local.f2fs_attr_ovp_segments)
> ERROR: modpost: __ex_table+0x1528 references non-executable section '.data.rel.local.f2fs_attr_ovp_segments'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1530 (section: __ex_table) -> f2fs_attr_pending_discard (section: .data.rel.local.f2fs_attr_pending_discard)
> ERROR: modpost: __ex_table+0x1530 references non-executable section '.data.rel.local.f2fs_attr_pending_discard'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1534 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> ERROR: modpost: __ex_table+0x1534 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x153c (section: __ex_table) -> f2fs_attr_ram_thresh (section: .data.rel.local.f2fs_attr_ram_thresh)
> ERROR: modpost: __ex_table+0x153c references non-executable section '.data.rel.local.f2fs_attr_ram_thresh'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1540 (section: __ex_table) -> f2fs_attr_reclaim_segments (section: .data.rel.local.f2fs_attr_reclaim_segments)
> ERROR: modpost: __ex_table+0x1540 references non-executable section '.data.rel.local.f2fs_attr_reclaim_segments'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1548 (section: __ex_table) -> f2fs_attr_reserved_pin_section (section: .data.rel.local.f2fs_attr_reserved_pin_section)
> ERROR: modpost: __ex_table+0x1548 references non-executable section '.data.rel.local.f2fs_attr_reserved_pin_section'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x154c (section: __ex_table) -> f2fs_attr_revoked_atomic_block (section: .data.rel.local.f2fs_attr_revoked_atomic_block)
> ERROR: modpost: __ex_table+0x154c references non-executable section '.data.rel.local.f2fs_attr_revoked_atomic_block'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1554 (section: __ex_table) -> f2fs_attr_sb_casefold (section: .data.rel.local.f2fs_attr_sb_casefold)
> ERROR: modpost: __ex_table+0x1554 references non-executable section '.data.rel.local.f2fs_attr_sb_casefold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1558 (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> ERROR: modpost: __ex_table+0x1558 references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section: __ex_table) -> f2fs_attr_sb_encryption (section: .data.rel.local.f2fs_attr_sb_encryption)
> >> ERROR: modpost: __ex_table+0x1560 references non-executable section '.data.rel.local.f2fs_attr_sb_encryption'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1564 (section: __ex_table) -> f2fs_attr_sb_flexible_inline_xattr (section: .data.rel.local.f2fs_attr_sb_flexible_inline_xattr)
> >> ERROR: modpost: __ex_table+0x1564 references non-executable section '.data.rel.local.f2fs_attr_sb_flexible_inline_xattr'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x156c (section: __ex_table) -> f2fs_attr_sb_inode_crtime (section: .data.rel.local.f2fs_attr_sb_inode_crtime)
> >> ERROR: modpost: __ex_table+0x156c references non-executable section '.data.rel.local.f2fs_attr_sb_inode_crtime'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1570 (section: __ex_table) -> f2fs_attr_sb_project_quota (section: .data.rel.local.f2fs_attr_sb_project_quota)
> >> ERROR: modpost: __ex_table+0x1570 references non-executable section '.data.rel.local.f2fs_attr_sb_project_quota'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1578 (section: __ex_table) -> f2fs_attr_sb_readonly (section: .data.rel.local.f2fs_attr_sb_readonly)
> ERROR: modpost: __ex_table+0x1578 references non-executable section '.data.rel.local.f2fs_attr_sb_readonly'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x157c (section: __ex_table) -> f2fs_attr_hot_data_age_threshold (section: .data.rel.local.f2fs_attr_hot_data_age_threshold)
> ERROR: modpost: __ex_table+0x157c references non-executable section '.data.rel.local.f2fs_attr_hot_data_age_threshold'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> f2fs_attr_sb_verity (section: .data.rel.local.f2fs_attr_sb_verity)
> ERROR: modpost: __ex_table+0x1584 references non-executable section '.data.rel.local.f2fs_attr_sb_verity'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> f2fs_attr_umount_discard_timeout (section: .data.rel.local.f2fs_attr_umount_discard_timeout)
> ERROR: modpost: __ex_table+0x1588 references non-executable section '.data.rel.local.f2fs_attr_umount_discard_timeout'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> __text (section: .data.rel.ro.local.__text.41490)
> ERROR: modpost: __ex_table+0x1590 references non-executable section '.data.rel.ro.local.__text.41490'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> __text (section: .data.rel.ro.local.__text.41514)
> ERROR: modpost: __ex_table+0x1594 references non-executable section '.data.rel.ro.local.__text.41514'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x15fc (section: __ex_table) -> .LASF965 (section: .debug_str)
> ERROR: modpost: __ex_table+0x15fc references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1600 (section: __ex_table) -> .LASF967 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1600 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1608 (section: __ex_table) -> .LASF969 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1608 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x160c (section: __ex_table) -> .LASF971 (section: .debug_str)
> ERROR: modpost: __ex_table+0x160c references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1614 (section: __ex_table) -> .LASF973 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1614 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1618 (section: __ex_table) -> .LASF975 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1618 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1620 (section: __ex_table) -> .LASF977 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1620 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1624 (section: __ex_table) -> .LASF979 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1624 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x162c (section: __ex_table) -> .LASF981 (section: .debug_str)
> ERROR: modpost: __ex_table+0x162c references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1630 (section: __ex_table) -> .LASF983 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1630 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1638 (section: __ex_table) -> .LASF985 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1638 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x163c (section: __ex_table) -> .LASF987 (section: .debug_str)
> ERROR: modpost: __ex_table+0x163c references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1644 (section: __ex_table) -> .LASF989 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1644 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1648 (section: __ex_table) -> .LASF991 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1648 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1650 (section: __ex_table) -> .LASF993 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1650 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1654 (section: __ex_table) -> .LASF991 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1654 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x165c (section: __ex_table) -> .LASF996 (section: .debug_str)
> ERROR: modpost: __ex_table+0x165c references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1660 (section: __ex_table) -> .LASF991 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1660 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1668 (section: __ex_table) -> .LASF999 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1668 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x166c (section: __ex_table) -> .LASF1001 (section: .debug_str)
> ERROR: modpost: __ex_table+0x166c references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LASF1003 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1678 (section: __ex_table) -> .LASF1005 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1678 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x16ec (section: __ex_table) -> .LASF1510 (section: .debug_str)
> ERROR: modpost: __ex_table+0x16ec references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x16f0 (section: __ex_table) -> .LASF1512 (section: .debug_str)
> ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x16f8 (section: __ex_table) -> .LASF1514 (section: .debug_str)
> ERROR: modpost: __ex_table+0x16f8 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x16fc (section: __ex_table) -> .LASF1512 (section: .debug_str)
> ERROR: modpost: __ex_table+0x16fc references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1704 (section: __ex_table) -> .LASF1517 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1704 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1708 (section: __ex_table) -> .LASF1512 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1708 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1710 (section: __ex_table) -> .LASF1520 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1710 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1714 (section: __ex_table) -> .LASF1512 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1714 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x171c (section: __ex_table) -> .LASF1523 (section: .debug_str)
> ERROR: modpost: __ex_table+0x171c references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1720 (section: __ex_table) -> .LASF1512 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1728 (section: __ex_table) -> .LASF1526 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x172c (section: __ex_table) -> .LASF1512 (section: .debug_str)
> ERROR: modpost: __ex_table+0x172c references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1734 (section: __ex_table) -> .LASF1529 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1734 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1738 (section: __ex_table) -> .LASF1531 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1740 (section: __ex_table) -> .LASF1533 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1740 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1744 (section: __ex_table) -> .LASF1535 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1744 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x174c (section: __ex_table) -> .LASF1537 (section: .debug_str)
> ERROR: modpost: __ex_table+0x174c references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1750 (section: __ex_table) -> .LASF1539 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .LASF1541 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x175c (section: __ex_table) -> .LASF2868 (section: .debug_str)
> ERROR: modpost: __ex_table+0x175c references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1764 (section: __ex_table) -> .LASF1544 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1764 references non-executable section '.debug_str'
> WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .LASF1546 (section: .debug_str)
> ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
