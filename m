Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E732422653F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 18:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717962; cv=none; b=nHd46SW5wam6POcropPf6upeiVjNFtpcO4JnqfITQjUtcAwnZys5Pmz6LnpgO0IZEOPnnSXSYMtsyfOJ4UDifQV4vIB0mXLgtX4ciEZc32mZYzHB3gDJK/Ko3+/RTQM6W+VFq9Zvrq4WUGag1MzKS4rFSndO6VbmKseLjQYz+sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717962; c=relaxed/simple;
	bh=tC3Zmy1drAjkAUHbA0InhDqaOrmyVdKLr0BUSgqz3r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L4LwJ36J1FhNbQ/hEQ2K07ZcoRQ4G2/CVoTmpfpGy55BoBSyNnyXpwCaMY9UQwsXB7EfJt+/9/Zhxi+GAERTHuoKSDXn5Z3HR/YeO0RLIFkc/4Aaz78IGHE4WBODyLIbjdscL3b9JV+9VGA10I8zwP7z+cEgzms4J+ehJc4tnEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzeQ6h3l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzeQ6h3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734717960; x=1766253960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tC3Zmy1drAjkAUHbA0InhDqaOrmyVdKLr0BUSgqz3r4=;
  b=TzeQ6h3lMLDv1X6aegq+OiKkvkB9aGfgukNVUfCEWxwl6XutRN+v0Uve
   C9oKFio2CHqYUZYODJCJTsNudgk2RwNkyUi6sNakeNFYL8jib+v1R0j0V
   38AusG9ei7WGMDwk5wDJU+1bKwm9asdN6+ZagCd4PQr/WzpGS6LycaPbB
   b4zCBdzNCLignTA0mfhGYeBzncUO82r/4x2cY1cfei8tofoFtgqFLazZl
   5qjfA9QTNzeTU955K9w9iIrs0jhgsw9XqwxjHzCNnncI8Oqpmh9+Ho30H
   lZd6b+gf/L2iPi9Mf8PhousDXBAE7cTFuzUcxR2S5k0w1Uo55oQFVCsjv
   g==;
X-CSE-ConnectionGUID: ZwR50TRQQgerAKeBB7WPjA==
X-CSE-MsgGUID: WUQUbSZaS3msNWOBOTexIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57746631"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="57746631"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 10:05:59 -0800
X-CSE-ConnectionGUID: RsBS+tRmQaK4Eo5is94F2g==
X-CSE-MsgGUID: fFmT0y04T4Gc4nm4nFeF/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98967683"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2024 10:05:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOhNr-0001WF-12;
	Fri, 20 Dec 2024 18:05:55 +0000
Date: Sat, 21 Dec 2024 02:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-remove-BLK_MQ_F_SHOULD_MERGE 1/1] error[E0425]:
 cannot find value `BLK_MQ_F_SHOULD_MERGE` in crate `bindings`
Message-ID: <202412210131.s6zSzIfG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git block-remove-BLK_MQ_F_SHOULD_MERGE
head:   c22c6bcd0eb2a789d6af4afae87d1328a019ea29
commit: c22c6bcd0eb2a789d6af4afae87d1328a019ea29 [1/1] block: remove BLK_MQ_F_SHOULD_MERGE
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20241221/202412210131.s6zSzIfG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210131.s6zSzIfG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210131.s6zSzIfG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   505 |                            item];
   |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   512 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   525 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 19.1.3
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   505 |                            item];
   |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   512 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   525 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   4 warnings generated.
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>> error[E0425]: cannot find value `BLK_MQ_F_SHOULD_MERGE` in crate `bindings`
   --> rust/kernel/block/mq/tag_set.rs:55:38
   |
   55 |                     flags: bindings::BLK_MQ_F_SHOULD_MERGE,
   |                                      ^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
