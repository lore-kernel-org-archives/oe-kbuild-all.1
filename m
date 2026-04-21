Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121623BC667
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776775799; cv=none; b=Pq+Yqqjh5lNoTeWciDXSqVMP6x2eX6ImGxHDO/opGXuIupLWCMANprfYOuu2U+Lih2U+5kxrMdHPPzgU5aXoVEiPa+ICqpG7tPriFIUuOOwn3ICKztw2CdkZ6+OGHqc8h9seNXUMto326O4TlOJR9cfjj1Mxz7esBIU+1227k/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776775799; c=relaxed/simple;
	bh=NTCmfB7wl2mEw08/r67jIcwUwGBHlqQPfpvxeOxvLNY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KYZmXQfASgxlijB5HBOz/TEnvjNV4xaOEOZl1CDA76PYGvKmOV2DKSygJajG/mdn4lbZlmhNlh7HhgU+pGBa8/aw2H/it7myo291sSOQA2AwiVBOM04JS8Y0yPJo0D/fL2Ri0sgsGP8DvhFGU3XKrSEqD3prGMxsFdOHxdgj+3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQvdrod7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQvdrod7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776775798; x=1808311798;
  h=date:from:to:cc:subject:message-id;
  bh=NTCmfB7wl2mEw08/r67jIcwUwGBHlqQPfpvxeOxvLNY=;
  b=bQvdrod7M3H/Wt15/hvDmXzlth6bXQqw50gs97DU9F2bKJAfGjUwvbpo
   v2LHPSWyjHP5i/3X5tJ4V2K9IKyL+Sx/l/9fz1NJDbRHi8s8UaDQIsecs
   HOQcbCvjggfj+TYLSy78XTvO5rDBYq6mCOUZ2gacO0A6ENtvjlvyybv19
   9Pqb5oFNSnTD4wRUSRdbVLXLJyenUAUxVh0Dyv+Ai1oNzGDr/QrRnCIKT
   mv9oXYAggK0Q+ItP/UD+jypXakuhrB5BB1PNV9OlvDY+8Sqx1Sm+99Max
   lRkZ9O/hvR+NTVBfGCF++OxBxLPAIaUS7GL0NvjsRSBjpFU++clsR83I4
   w==;
X-CSE-ConnectionGUID: Yu97LhiwTBOWIoxxzlnHVw==
X-CSE-MsgGUID: H5dvw06ARCu9Q1jYkKY/OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77407794"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77407794"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 05:49:57 -0700
X-CSE-ConnectionGUID: IcckFumtTJqA6VtujmWuKw==
X-CSE-MsgGUID: KoE838YPQIeMGn+ve9jAng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="262418918"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Apr 2026 05:49:54 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFAY2-000000003UG-3UHZ;
	Tue, 21 Apr 2026 12:49:50 +0000
Date: Tue, 21 Apr 2026 20:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:for-next 14/19] WARNING: modpost: vmlinux:
 section mismatch in reference: __traceiter_ext4_sync_fs+0x30 (section:
 .text.__traceiter_ext4_sync_fs) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE
 (section: .init.data)
Message-ID: <202604212032.Ezeg1gpu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/nvme.git for-next
head:   0514a1379e11c6b8038674f43a478b0857d47a5e
commit: 736f81bd474d83c6af18ebb27730479f3fd187e5 [14/19] nvme/ioctl: don't warn on vectorized uring_cmd with fixed buffer
config: mips-randconfig-r071-20260419 (https://download.01.org/0day-ci/archive/20260421/202604212032.Ezeg1gpu-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9007-gcf3ea02b
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604212032.Ezeg1gpu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604212032.Ezeg1gpu-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: 0x16f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x16f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x16f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1700 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1700 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1708 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1708 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1710 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1710 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1718 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1718 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1720 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1720 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1728 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1728 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1730 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1730 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1738 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1738 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1740 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1740 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1748 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1748 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1750 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1750 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1758 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1758 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1760 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1760 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1768 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1768 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1770 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1770 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1778 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1778 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1780 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1780 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1788 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1788 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1790 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1790 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1798 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1798 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17e0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17e8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f0 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17f8 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x17f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1800 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1800 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1808 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1808 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1810 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1810 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1818 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1818 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1820 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1820 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1828 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1828 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1830 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1830 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1838 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1838 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1840 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1840 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1848 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1848 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1850 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1850 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1858 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1858 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1860 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1860 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1868 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1868 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1870 (section: __ex_table) -> .L0  (section: .debug_str)
ERROR: modpost: __ex_table+0x1870 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: swap_inode_boot_loader+0x434 (section: .text.swap_inode_boot_loader) -> start_dirtytime_writeback (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: swap_inode_boot_loader+0x43c (section: .text.swap_inode_boot_loader) -> start_dirtytime_writeback (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_ext4_sync_fs+0x30 (section: .text.__traceiter_ext4_sync_fs) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_ext4_sync_fs+0x34 (section: .text.__traceiter_ext4_sync_fs) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: ext4_sync_fs+0x22c (section: .text.ext4_sync_fs) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: ext4_sync_fs+0x230 (section: .text.ext4_sync_fs) -> __TRACE_SYSTEM_WB_REASON_FS_FREE_SPACE (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: ext4_fc_replay+0x14ac (section: .text.ext4_fc_replay) -> start_dirtytime_writeback (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: status_show+0x98 (section: .text.status_show) -> __TRACE_SYSTEM_LRU_ACTIVE_FILE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: status_show+0x9c (section: .text.status_show) -> __TRACE_SYSTEM_LRU_ACTIVE_FILE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: status_show+0xd0 (section: .text.status_show) -> __TRACE_SYSTEM_LRU_UNEVICTABLE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: status_show+0xd4 (section: .text.status_show) -> __TRACE_SYSTEM_LRU_UNEVICTABLE (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: fttmr010_timer_set_next_event+0x74 (section: .text.fttmr010_timer_set_next_event) -> cpu_latency_qos_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ti_msgmgr_probe+0x3a0 (section: .text.ti_msgmgr_probe) -> __TRACE_SYSTEM_RPM_SUSPENDING (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: ti_msgmgr_probe+0x3a4 (section: .text.ti_msgmgr_probe) -> __TRACE_SYSTEM_RPM_SUSPENDING (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: ti_msgmgr_of_xlate+0xa8 (section: .text.ti_msgmgr_of_xlate) -> __TRACE_SYSTEM_RPM_SUSPENDING (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: ti_msgmgr_of_xlate+0xc4 (section: .text.ti_msgmgr_of_xlate) -> __TRACE_SYSTEM_RPM_SUSPENDING (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: ti_msgmgr_of_xlate+0xf4 (section: .text.ti_msgmgr_of_xlate) -> __TRACE_SYSTEM_RPM_SUSPENDING (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: ti_msgmgr_of_xlate+0x10c (section: .text.ti_msgmgr_of_xlate) -> __TRACE_SYSTEM_RPM_SUSPENDING (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: ti_msgmgr_of_xlate+0x114 (section: .text.ti_msgmgr_of_xlate) -> __TRACE_SYSTEM_RPM_SUSPENDING (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: ti_msgmgr_of_xlate+0x120 (section: .text.ti_msgmgr_of_xlate) -> __TRACE_SYSTEM_RPM_SUSPENDING (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: tb_test_credit_alloc_all+0x2d30 (section: .text.tb_test_credit_alloc_all) -> oom_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tb_test_credit_alloc_all+0x2d34 (section: .text.tb_test_credit_alloc_all) -> oom_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tb_test_property_copy+0x1d8 (section: .text.tb_test_property_copy) -> __TRACE_SYSTEM____GFP_HIGHMEM_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: tb_test_property_copy+0x1dc (section: .text.tb_test_property_copy) -> __TRACE_SYSTEM____GFP_HIGHMEM_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: tb_test_property_copy+0x3d8 (section: .text.tb_test_property_copy) -> __TRACE_SYSTEM____GFP_DMA_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: tb_test_property_copy+0x3dc (section: .text.tb_test_property_copy) -> __TRACE_SYSTEM____GFP_DMA_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0x738 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_FS_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0x73c (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_FS_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0x864 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_IO_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0x868 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_IO_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0x91c (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_ZERO_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0x920 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_ZERO_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0x99c (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_DIRECT_RECLAIM_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0x9a0 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_DIRECT_RECLAIM_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xa10 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_KSWAPD_RECLAIM_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xa14 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_KSWAPD_RECLAIM_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xa44 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_NOFAIL_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xa48 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_NOFAIL_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xa9c (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_NOWARN_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xaa0 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_NOWARN_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xb10 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_RETRY_MAYFAIL_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xb14 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_RETRY_MAYFAIL_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xb8c (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_WRITE_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xb90 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_WRITE_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xc0c (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_RECLAIMABLE_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xc10 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_RECLAIMABLE_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xcac (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_HIGH_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xcb0 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_HIGH_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xcf8 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_DMA32_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xcfc (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_DMA32_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xd4c (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_MOVABLE_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: compare_dirs+0xd50 (section: .text.compare_dirs) -> __TRACE_SYSTEM____GFP_MOVABLE_BIT (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: dma_test_probe+0xe4 (section: .text.dma_test_probe) -> __TRACE_SYSTEM____GFP_ZEROTAGS_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: dma_test_probe+0xe8 (section: .text.dma_test_probe) -> __TRACE_SYSTEM____GFP_ZEROTAGS_BIT (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: dma_test_probe+0x15c (section: .text.dma_test_probe) -> __TRACE_SYSTEM____GFP_UNUSED_BIT (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: dma_test_probe+0x160 (section: .text.dma_test_probe) -> __TRACE_SYSTEM____GFP_UNUSED_BIT (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: u_boot_env_parse+0x138 (section: .text.u_boot_env_parse) -> __setup_str_early_init_on_free (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: u_boot_env_parse+0x13c (section: .text.u_boot_env_parse) -> __setup_str_early_init_on_free (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
