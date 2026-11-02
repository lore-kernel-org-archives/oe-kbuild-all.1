Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793654691;
	b=4ciZSCjiQlOul134oBoTjj7ZgRCztHA6huWS9qe6BRBonhVGjdnBmRkUQaXPVgvpWq9K
	 GshVxN3ZiMEsvOSfqWR5dxuTlHfzwS/vAa3N7a2wVhE839ra0k5wrKcWX8nJUQN5KhufR
	 jWADP9wDUNESruxSa16fO/hY174x4/jtq/BG1vfLvUWHQ62OlklksfeZixahHeuAHBq0g
	 L3JGfBpBF9Z9z/9Ve3/b9Ayrj0G0aMmnn+gs3js2doaq+DW+5mKBkdCA5ehzkXlxBQCD5
	 9OgawEKBTOgNiAIR+qvT0Dsnn1PyQ89asnwHETHxCWalc5tbzATwk6pmUSTCy4qpagw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654691;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6liDdo9lKlY5CEYvOKAP9FQ0WU8H1YhxctRQK+aoc7I=;
	b=QB0YbEldopYBYJznodKK+Mdph4TywCWu0UDQJ4MwcbZyP7pAZnHs9dhwra52BabpZzan
	 HkhpL8CJInFho4JzvxzGcwxtiMrLb6XVT9gWmlnC7TmDs73cR6OmAvtP3l9bTQ/cRfasM
	 /gFk/aM/tangbZAcEiWAfv+HrhK6TNcGRSqiPzU8QL03CzZBhhN8kMR9JPrmsdh4RwEuJ
	 aWS/oG9gpJOMX+zQKUG2C2N0oV5KunvA2fED1x8zgUtSNxSA6f/LpQsYTs+pdVyP0OoBW
	 UPK9RF5VVCALZ94CIHoJx17SbfYadqtaU+pNxb73KgE2Lfo7M5iwjKC2wzylU7pRQfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nWRFdiFj;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E920606A330
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 21:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E920606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nWRFdiFj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793654689; x=1825190689;
  h=date:from:to:cc:subject:message-id;
  bh=Y2qt5OWQXllkA3hhmo1qOoIPKV0UbXdc5L1XJEF8Y2w=;
  b=nWRFdiFj9qKFF8bsOdus5twd/3KB4sk3Za0gf+TfbkJ/8Z4ONOaJzKZT
   CbSiN3aTPc4Te7IT+V2f70eg+07gOHnHFwAbIbe5yACfN8khmDVwd63A4
   g7URDPKAJbzgER4W1gK1mjwBcB8bFvMBCeNMdWXnESCVBwZvnOqRvOhFo
   G+J+wp80NHv2dVID1kz4AtvoY09PQT0B+vkHbSCuOTesxRWRspvHMitlZ
   W9ayEoV+ITvZWOoYMRkMJS2O7Qdp0wVWPUSscAt3tEHJzJxoJMXTdg+4G
   wxlSb/6Fted3neUyWTHfpPqBacREa9oXy+Vhx/ag/qlCoZNgK66jOuISe
   Q==;
X-CSE-ConnectionGUID: p36O0Ca8RKSVlS7UCgjvEg==
X-CSE-MsgGUID: FjIHlrnjTfOphi2HVp0BAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2377795"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2377795"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:24:48 -0800
X-CSE-ConnectionGUID: Bs/t01W5QsKjbZmVXTUoNQ==
X-CSE-MsgGUID: EuHhmKuAR66lFC+VuRYpcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6092124"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 02 Nov 2026 13:24:47 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNzWG-000000008ip-09iq;
	Mon, 02 Nov 2026 21:24:44 +0000
Date: Mon, 02 Nov 2026 22:23:50 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 20/20]
 fs/fuse/backing.c:156:16: sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202611022212.XB6ehdoC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e92b73070f9a9cf42236e34fdc16537c05349f91
commit: 8be90ef631b70dedc3c43b247aeae296a633dcb2 [20/20] ANDROID: fuse-bpf: fuse-bpf v1.2
config: arm64-randconfig-r2302-20261102 (https://download.01.org/0day-ci/archive/20261102/202611022212.XB6ehdoC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3e5b45eed6c3ec25f4f1cc81ce0be10106a8f31f)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611022212.XB6ehdoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611022212.XB6ehdoC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/backing.c:156:16: sparse: sparse: Using plain integer as NULL pointer
   fs/fuse/backing.c:314:16: sparse: sparse: Using plain integer as NULL pointer
>> fs/fuse/backing.c:861:48: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got int @@
   fs/fuse/backing.c:861:48: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/fuse/backing.c:861:48: sparse:     got int
   fs/fuse/backing.c:949:59: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got int @@
   fs/fuse/backing.c:949:59: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/fuse/backing.c:949:59: sparse:     got int
   fs/fuse/backing.c: note: in included file (through include/linux/alloc_tag.h, include/linux/percpu.h, arch/arm64/include/asm/arch_timer.h, arch/arm64/include/asm/timex.h, ...):
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:127:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> fs/fuse/backing.c:2097:18: sparse: sparse: Initializer entry defined twice
   fs/fuse/backing.c:2098:18: sparse:   also defined here

vim +156 fs/fuse/backing.c

   145	
   146	void *fuse_open_finalize(struct fuse_bpf_args *fa,
   147			       struct inode *inode, struct file *file, bool isdir)
   148	{
   149		struct fuse_file *ff = file->private_data;
   150		struct fuse_open_out *foo = fa->out_args[0].value;
   151	
   152		if (ff) {
   153			ff->fh = foo->fh;
   154			ff->nodeid = get_fuse_inode(inode)->nodeid;
   155		}
 > 156		return 0;
   157	}
   158	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
