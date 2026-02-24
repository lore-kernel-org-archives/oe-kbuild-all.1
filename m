Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD09366815
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923844; cv=none; b=ANnad+VVftcH/istwb64JfdGnSNT+YniEH/lHwWkEfaufjJ8l79PUfkWRr69ThdlBqJ4yFrnKDAtGJ4VmGZbrYkcPiU8A9ywOBh3/468HXQb+E6OEX1PDEBfCUtqqx+jqcgwtQZwP5LVTdIy3esnRfcl3LsIMeBEUSRmM4/I0mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923844; c=relaxed/simple;
	bh=+8l5L0H/ojsjjrmSKSEie7KNIn3mw2arWnNAj71Vv3k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J1f4r32rera4MVQ71E1g6JlCCOBYsqEvu6TUMZAceZjqEJMOjzpyqfZseGMTGqWpc2Vb3EzyoN4paw6DbW9PuswHnXixATF4RmVkHf+OTOVGQTptlkPaF1Rp9GnRKid9L9AlegKTqMoll6r4QyiCc7C/tK9FD6+GcbYpRtMqWrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfpXnPuZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfpXnPuZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771923843; x=1803459843;
  h=date:from:to:cc:subject:message-id;
  bh=+8l5L0H/ojsjjrmSKSEie7KNIn3mw2arWnNAj71Vv3k=;
  b=VfpXnPuZm1OM0LW+R88QwXeyeIcZiFDCGWu6cTOwMiceRlILw3m2iTJc
   IsSSFQoOHecgRMzIl1udjOlW46vYDRfFs0y5YPXrlqN9gPerThggGMrdj
   n0tR8g6Z6qFDeovlPpK0yNPQo/ne90NsIOzl0J+noDtZUb8++EH2Z6sbw
   s5M3CnHbMlZzWJTWmai2PoMQwpJr2W6QG9pZ/ryIQYOtq8ikAx7G+y3j0
   MWGkJnq+F1/DYg6VqP3b6QZcNVRQNYBrL/wEG424zZ8Mxv3fMHXDbtb/Y
   OADql2lmBcluyegBBnkqB4Ww7sagidBYQ2gpytWC3DHZJXlJl4HE2TfGU
   w==;
X-CSE-ConnectionGUID: I0mPRlOHRiOvOYKDD+fS6g==
X-CSE-MsgGUID: x8fiduDlQ02jaIlxMBh3yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="71964105"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="71964105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:04:02 -0800
X-CSE-ConnectionGUID: 4S5Jb4TITQ2gZcEN2iCCrg==
X-CSE-MsgGUID: A760p3NtRHemPQg79Sfszw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214932705"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Feb 2026 01:04:00 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuoKY-000000001in-0E20;
	Tue, 24 Feb 2026 09:03:46 +0000
Date: Tue, 24 Feb 2026 17:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 82/83] /tmp/cc8gnjpB.s:25: Error:
 invalid operands (*ABS* and *UND* sections) for `|'
Message-ID: <202602241701.xls0tz6F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   e7a25f132866607711789424623976accda88e82
commit: 4051a03679bdf19232f8e02c09ea7284050ef9d3 [82/83] fuse: add kfuncs for iomap bpf programs to manage the cache
config: riscv-randconfig-002-20260224 (https://download.01.org/0day-ci/archive/20260224/202602241701.xls0tz6F-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241701.xls0tz6F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241701.xls0tz6F-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/fuse/fuse_iomap_bpf.c:7:
   fs/fuse/fuse_iomap_bpf.c: In function 'fuse_iomap_init_bpf':
   include/linux/bpf.h:2142:50: warning: statement with no effect [-Wunused-value]
    #define register_bpf_struct_ops(st_ops, type) ({ (void *)(st_ops); 0; })
                                                     ^~~~~~~~~~~~~~~~
   fs/fuse/fuse_iomap_bpf.c:366:9: note: in expansion of macro 'register_bpf_struct_ops'
     return register_bpf_struct_ops(&fuse_iomap_bpf_struct_ops,
            ^~~~~~~~~~~~~~~~~~~~~~~
   /tmp/cc8gnjpB.s: Assembler messages:
>> /tmp/cc8gnjpB.s:25: Error: invalid operands (*ABS* and *UND* sections) for `|'
   /tmp/cc8gnjpB.s:34: Error: invalid operands (*ABS* and *UND* sections) for `|'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
