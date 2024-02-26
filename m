Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D603EADD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 05:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708924261; cv=none; b=s1yFiiAcNjqAhBqSFBrc9uI0SO45oUUeiZjor3A/XSSbgrGGcPBSD94kTiPFVCN8IOywdQrb9QbVI61QuQuBc7GtYF3jPUuzebhZrkG4qEQFTwE/2c4+dkmsmL/1F1/zUaGWSyOuOQ1z69/YzyTbuCuaJ9xLAVSDCIfQAJLmoSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708924261; c=relaxed/simple;
	bh=851C1k8Yk88ehxx8mOYYZ7muyghPfifkKnmhqQRh38Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gF2aLLb7GKE7IBrnGruLqUwrtk9afdY1WwcxM8Wxfek5yN7QFuvg1zrrXv+Q6msg4XID2MNBgm7Q4l+qBVdP5pEZFr1Xf6IcJHriDS2SIREsVKzHy3BsnkcKN4rznvlti6fj598RWoS6QRfdQQ65nodjFXzU5PREJ6QbjZ8pKXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGa9eCwC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGa9eCwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708924258; x=1740460258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=851C1k8Yk88ehxx8mOYYZ7muyghPfifkKnmhqQRh38Q=;
  b=KGa9eCwCbV2nZLgBPVhgffQUYUEnXf6wq2/pFDmAJkAAkGOyS/bv3pC6
   OcvuK7/YiqTdY5h8idTx/ncfobw+Mb6RV65TnLyscqQIAk1svElFSylKN
   sHh3BaegFoA/81lG0jwOMwo3ku8oZ9MBrLhcd+elVj99Mg1CrWkL3dl97
   uibjtg7npJBWsVeX8kO3BWQCYaOabcC5MfzK0AnhIhmZHCcT5zjOgqWka
   k4HJf0ifrtpXHjYbV0TxRZ5ecyKVkZI6QTcYu3E31lf0uVp5jCGnaFrpI
   9NYGk9LvExVo+Mz5jQEy1525A5ORC1IjZY6digasFc3/7vzpEkNUFr3Ri
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="20735835"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="20735835"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 21:10:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6686589"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Feb 2024 21:10:26 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reTFp-000A5N-2o;
	Mon, 26 Feb 2024 05:10:19 +0000
Date: Mon, 26 Feb 2024 13:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Subject: [kees:devel/fortify/kunit 14/31] WARNING: modpost: vmlinux: section
 mismatch in reference: mtree_alloc_rrange+0x15a (section: .text) ->
 (unknown) (section: .init.text)
Message-ID: <202402261324.tbHb4IaQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/fortify/kunit
head:   184348d43ed3b40b760f3ecdcfbda2f0b1a0729d
commit: 8a05fa1fd114b2e274e43829ce64d3fbea16a283 [14/31] string: Redefine strscpy_pad() as a macro
config: riscv-randconfig-r002-20220920 (https://download.01.org/0day-ci/archive/20240226/202402261324.tbHb4IaQ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402261324.tbHb4IaQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402261324.tbHb4IaQ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: mas_dup_alloc.isra.0+0x19c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_dup_alloc.isra.0+0x1a4 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_state_walk+0x7c (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_state_walk+0x80 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_state_walk+0x8e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_state_walk+0x9c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_load+0x126 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_load+0x12a (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_load+0x138 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_load+0x146 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0xea (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0xee (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0xfc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0x10a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0x346 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0x34a (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0x358 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0x366 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0x3fc (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0x400 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0x40e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_slot+0x41c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_find+0x13e (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_find+0x142 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_find+0x150 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_find+0x15e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x78 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x7c (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x86 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x8a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x90 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x98 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x116 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x11a (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x124 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x128 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x12e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x136 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x1fc (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x200 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x20a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x20e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x214 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_slot_store+0x21c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_destroy+0x8a (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_destroy+0x8e (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_destroy+0x9c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_destroy+0xaa (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_preallocate+0xca (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_preallocate+0xce (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_preallocate+0xdc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_preallocate+0xea (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0xea (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0xee (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0xfc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x10a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x1fe (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x202 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x210 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x21e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x388 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x38c (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x39a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x3a8 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x43e (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x442 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x450 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_prev_slot+0x45e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_store_b_node+0x178 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_store_b_node+0x17c (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_store_b_node+0x186 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_store_b_node+0x18a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_store_b_node+0x190 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_store_b_node+0x198 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry.isra.0+0x80 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry.isra.0+0x84 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry.isra.0+0x92 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry.isra.0+0xa0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_erase+0xa8 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_erase+0xac (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_erase+0xba (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_erase+0xc8 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_erase+0x1f8 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_erase+0x1fc (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_erase+0x20a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_erase+0x218 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_store_range+0x180 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_store_range+0x184 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_store_range+0x192 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_store_range+0x1a0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_insert_range+0x11c (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_insert_range+0x120 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_insert_range+0x12e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_insert_range+0x13c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_alloc_range+0x148 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_alloc_range+0x14c (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_alloc_range+0x15a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_alloc_range+0x168 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_alloc_rrange+0x148 (section: .text) -> audit_register_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_alloc_rrange+0x14c (section: .text) -> audit_register_class (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mtree_alloc_rrange+0x15a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtree_alloc_rrange+0x168 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: radix_tree_insert+0x11e (section: .text) -> delayacct_setup_enable (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: radix_tree_insert+0x148 (section: .text) -> taskstats_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___ratelimit+0x7a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___ratelimit+0x82 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___ratelimit+0x8c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ___ratelimit+0xba (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fourcc_string+0x1d8 (section: .text) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fourcc_string+0x1e8 (section: .text) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: fourcc_string+0x200 (section: .text) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0x6 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0x68 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0x6e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0x8c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0xbc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0xcc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0xda (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0xea (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0x102 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0x14a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0x16e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_csum+0x180 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: run_init_process+0xde (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: try_to_freeze_tasks+0x5a (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: try_to_freeze_tasks+0x6e (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: try_to_freeze_tasks+0x11c (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: enter_state+0x3a (section: .text.unlikely) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_early_boot_tests+0xca (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: shutdown_time_arrived+0x1c (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: shutdown_time_arrived+0x20 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_torture_fwd_prog_cr+0x76 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_torture_fwd_prog_cr+0x7e (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_torture_fwd_prog_cr+0x146 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_torture_fwd_prog_cr+0x16e (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_torture_fwd_prog_cr+0x1f4 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_torture_fwd_prog_nr+0xb4 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_torture_fwd_prog_nr+0xf8 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_torture_fwd_prog_nr+0x148 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rcu_torture_fwd_prog_nr+0x162 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_random_u32_below+0x8 (section: .text.unlikely) -> event_trace_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_random_u32_below+0x8 (section: .text.unlikely) -> event_trace_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_random_u32_below+0x8 (section: .text.unlikely) -> event_trace_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: run_exercise+0x406 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: try_to_generate_entropy+0x10a (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: try_to_generate_entropy+0x10e (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_dev_info+0x54 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_dev_info+0x72 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_FORTIFY_MEM_OBJECT+0xaa (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: lkdtm_FORTIFY_STR_OBJECT+0x42 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: download_firmware+0x16a (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: download_firmware+0x272 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: download_firmware+0x2c8 (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: download_firmware+0x2da (section: .text.unlikely) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pn544_hci_i2c_fw_download+0x44 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nfcmrvl_suspend+0x70 (section: .text.unlikely) -> event_trace_enable_again (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nfcmrvl_suspend+0x7c (section: .text.unlikely) -> event_trace_enable_again (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: st21nfca_hci_start_poll+0x196 (section: .text.unlikely) -> event_trace_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_dump_vol_info+0x170 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ubi_dump_vtbl_record+0x1a0 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: emi26_load_firmware.isra.0+0x1f8 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __ffs_data_got_strings+0x1cc (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uvc_copy_descriptors+0x190 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uvc_register_video+0x92 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uvc_register_video+0xb8 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tda1004x_do_upload+0x92 (section: .text.unlikely) -> setup_trace_event (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: out_of_line_wait_on_bit_lock+0x60 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: out_of_line_wait_on_bit_timeout+0x34 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: out_of_line_wait_on_bit_timeout+0x38 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bit_wait_timeout+0x0 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bit_wait_timeout+0x4 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bit_wait_io_timeout+0x0 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bit_wait_io_timeout+0x4 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_read_slowpath+0xca (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_read_slowpath+0xce (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_write_slowpath+0x1e (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_write_slowpath+0x22 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rwsem_down_write_slowpath+0x192 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: schedule_timeout+0x82 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: schedule_timeout+0x86 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: schedule_timeout+0x130 (section: .sched.text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adnp_i2c_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gw_pld_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max7300_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max732x_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pca953x_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pca9570_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: pcf857x_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tpic2810_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: adp8870_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bd6107_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: arcxcnn_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ssd1307fb_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ipmb_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: cs2000_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: max9485_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: si5341_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: si5351_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: si570_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rs9_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vc5_driver_exit+0x10 (section: .exit.text) -> trace_event_init (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
