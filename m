Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427CC2FFDEB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 23:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761519607; cv=none; b=FajJWOvP5XY4mTh/L17l+tr7QD6Oj5S29WFZqSlWfFrEWBZ0GNougtbUe0N8Lkc4RVd5L03Yxa3HASjO4qieTnMqhv8hudiajJwWiJWBCyRSSsLEFVLq7qPjlAp7GRKkIr/Mmf8xfETD1ldZ7uhFNnD5h8Pfjuhy1mmEiUF08DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761519607; c=relaxed/simple;
	bh=B23eF+Zqk9KbGekZD85UaLt8Pqp9XgShSIqMmq+ScW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VJfuK7ntR5XngkTEqTgAJb8OGTHbxUh7eR2lsqpvsXH+30SK0lk+y9Wqa/yfuHKiv2G5a5KDLMfAc7EPLbi7imKolUtuuhCqY6pl9oUKm2xWZUw6vbaDgGkk5jTeHQxFChYEAEAL2T/cl6Z9Q1hQ2vHYLHdlZWdb1QBIfw0QbAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiGI8bX9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiGI8bX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761519606; x=1793055606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B23eF+Zqk9KbGekZD85UaLt8Pqp9XgShSIqMmq+ScW8=;
  b=EiGI8bX9/J8C+YrlO5WMh1T0TT7VtmmTvGZ9yGuDGpa+1zec90wS9l4l
   qB4PcxsAdJJkJaboch1csS0ZMBJmUq+apyPPaF1HzZbdorASEWfyJI8Fi
   70wq1hXDPTjA5zK9LkTnd/VdMoUb8+qLzSks59EKvX2/9vb+8NLQ3BysU
   iSWTeFqNPe72T4QdLGV56ILAWy3CX75dhvAoOj+TWl8iKJjhqFC04To2k
   +4Y0enOV0pJxfTgzEPmuchdLeSSEExLUuiO+DAcezqhmXdQy/vrajpWJa
   /HCN6bBKO1oFMHaNN5H0HlgvjvytOEo8O/Aae/VF1TAc+L0X9S6nlid48
   w==;
X-CSE-ConnectionGUID: KtRJcZ2oTiiAhF+a+rV7SA==
X-CSE-MsgGUID: 18o0RBo9RrSwePiJAV8YNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67433353"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67433353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 16:00:05 -0700
X-CSE-ConnectionGUID: YqDkmydtT2WT31/69/G62g==
X-CSE-MsgGUID: SmIYPanfQkOv1IH9VUjV9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="185253037"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Oct 2025 16:00:03 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD9iT-000GNb-1L;
	Sun, 26 Oct 2025 23:00:01 +0000
Date: Mon, 27 Oct 2025 07:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 462/694] fs/bcachefs/sb/io.c:582:19:
 sparse: sparse: cast to restricted __le32
Message-ID: <202510270636.D3xzIrLQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   86ce62d7b3a79e326ccfa11d5aa365f62ee88d47
commit: 30f7c327a5b2201012ff856bc95040e2ec3fad6b [462/694] bcachefs: move sb code to subdir
config: powerpc-randconfig-r112-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270636.D3xzIrLQ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270636.D3xzIrLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510270636.D3xzIrLQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/sb/io.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/sb/downgrade_format.h:14:52: sparse: sparse: array of flexible structures
>> fs/bcachefs/sb/io.c:582:19: sparse: sparse: cast to restricted __le32
>> fs/bcachefs/sb/io.c:581:19: sparse: sparse: cast to restricted __le64

vim +582 fs/bcachefs/sb/io.c

1c6fdbd8f2465d fs/bcachefs/super-io.c Kent Overstreet 2017-03-16  577  
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  578  static unsigned long le_ulong_to_cpu(unsigned long v)
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  579  {
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  580  	return sizeof(unsigned long) == 8
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29 @581  		? le64_to_cpu(v)
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29 @582  		: le32_to_cpu(v);
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  583  }
8b16413cda7c46 fs/bcachefs/super-io.c Kent Overstreet 2023-12-29  584  

:::::: The code at line 582 was first introduced by commit
:::::: 8b16413cda7c46d47f8071165b3071f8a9369199 bcachefs: bch_sb.recovery_passes_required

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
