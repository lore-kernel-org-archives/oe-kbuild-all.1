Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67DF2AD11
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 20:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754164902; cv=none; b=PplKHPQpA2bH79uvP8M1pEvt9zbgl7DSFgRCagAHLxUUQNJoCYjzBuan/jbj2b8bzTmJElWUzebxCh5nH7MbO8cfleGB82c3FLEk96uQm0+Bo6rH3CvamNNubnV1WlJusP5R9S7rgQEgoQc2DSTGd1VlMElQRZn4UAQrxKluUg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754164902; c=relaxed/simple;
	bh=8LAIbOuCiAGIw2goitBlkmNCKAXbooEs4ZgMEria/PI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDtVLhmJDkiyP1Zf8JJjI5MJVZbEwci8le0Zk2EmIMKKgiApnptQCJXxuI+QrA7G/Qbrl9dr6a8A8UB4sdb2ftGBpL5cnQFJJBVC1lD/z+v4pkq6hW8RQ+rjSoBUzEn66Rjkmn+bHCoGs8ygFDUshmTk8f4z/SQvmCbO/fMhpyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzCIB4Ao; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzCIB4Ao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754164900; x=1785700900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8LAIbOuCiAGIw2goitBlkmNCKAXbooEs4ZgMEria/PI=;
  b=bzCIB4AoEmxH3FUqQ9nOPILtnyEERVKFBLiBctM0wxqEajPYOZyfJiL4
   wWdlc8NiNrZkJ8UKkzwawAbhTWvdhJhpj4YziPTUOUFDSBwgJ9XH1Jr+z
   BKUphh4LdDOB2CnUDsh5Lo2wStKV2zA6nkUs7kMSXjuXSSCTbyjuLd5kj
   ErsrhWQXN/pd1585roIhONhHd/ju857fXR5szESpvTw0NegH5AimF1ScD
   glt4B851KEcp5zNX134M1iZuNEZnIO9x6KMmZv8nGEQpRB/fa9zRhkrxe
   f/YxhdK8MJmkqvG2CesKiW8M+4+Jgz5XSgPGtqRgiagedbpqMbjwUuwQ+
   w==;
X-CSE-ConnectionGUID: diSZKiWeRYmPM4EIfEil+A==
X-CSE-MsgGUID: UZrpc61/SNCBdnn4em3mBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56350023"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56350023"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 13:01:39 -0700
X-CSE-ConnectionGUID: 2rF6ICkJSpCHz1iaP68HkA==
X-CSE-MsgGUID: eLQHIQGLTJOwhJOpTwtw0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168089579"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Aug 2025 13:01:38 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiIQC-0005aH-1G;
	Sat, 02 Aug 2025 20:01:36 +0000
Date: Sun, 3 Aug 2025 04:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 29/33] WARNING: modpost:
 "rhashtable_insert_slow" [fs/dlm/dlm.ko] has no CRC!
Message-ID: <202508030357.cyyMARnD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   fdd3a307f8bbbf8727a633b44c3d6a31103e1938
commit: 6d0490237dee99dbf103074a64ee81a057caa964 [29/33] rhashtable: Enable capability analysis
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250803/202508030357.cyyMARnD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030357.cyyMARnD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508030357.cyyMARnD-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "rhashtable_insert_slow" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_insert_slow" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "rhashtable_walk_start_check" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_walk_start_check" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save_flags" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save_flags" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "stack_depot_save" [vmlinux] version generation failed, symbol will not be versioned.
Is "stack_depot_save" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "rhashtable_insert_slow" [fs/dlm/dlm.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [fs/nfsd/nfsd.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [fs/nfsd/nfsd.ko] has no CRC!
WARNING: modpost: "rhashtable_insert_slow" [fs/gfs2/gfs2.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [fs/gfs2/gfs2.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [fs/bcachefs/bcachefs.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [drivers/net/vxlan/vxlan.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/sched/act_ct.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/sched/cls_flower.ko] has no CRC!
WARNING: modpost: "rhashtable_walk_start_check" [net/netlink/netlink_diag.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_tables.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_tables.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/netfilter/nf_flow_table.ko] has no CRC!
>> WARNING: modpost: "rhashtable_walk_start_check" [net/netfilter/nf_flow_table.ko] has no CRC!
>> WARNING: modpost: "rhashtable_insert_slow" [net/rds/rds.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
