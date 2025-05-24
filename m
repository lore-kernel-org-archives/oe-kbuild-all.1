Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673CA3234
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 00:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748046716; cv=none; b=JVLHvSAuAIrTFEcBvT8CNlConMu7fk75Za+l9slE5LAApkZ3kj2snshG9ny+89qr5eBF85PmdNZX6K5nrH6loEtBCMABpxW0JYCTYYj4Qp7Yl48oIJul4goKjdzxUE83kl1zPomviXK+8VttC37ImKOdDDSlKueAr7joIXT+yFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748046716; c=relaxed/simple;
	bh=hZUAKBjby+qpL7m749B3bYT5GEwLfgowGyTCOXhPPV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=umnNdKb+hG/8XKDtRh3x+1m2db1C+0TlbmxqbbVpyewL5/3gFyS7KL2QKNRqEnug+ODz+WeLUmFY6foStlqnKKVZ3Mphn9KWDz6W7ROgJoZQlPaHSWfijjRpBjjTW0SrghbevUUeRZ3webqSCAs6d1ImAjJWiVx0ba8TCI8oM00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRwqcOju; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRwqcOju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748046714; x=1779582714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hZUAKBjby+qpL7m749B3bYT5GEwLfgowGyTCOXhPPV0=;
  b=GRwqcOjuL3CsYVlVxm+Q6xTRbrFozu/1FCFBcXg4sX4IIASEyCf0CfUw
   q0y42eMBu2Vxr42TFIJp9fb5STYGza8r6OnapvbBTZBTN/NevTZ/SluAh
   9zFvS21xaS5XRh0fRBXjt1J3OVycazSmD6qbdTSs1PYBX+WPf4Oc14QS5
   tDVhC1QbkVnhEnbokE2SQ459i5T43qNras6CvxLR5IikqoohGGPEmDsfx
   r6ek0ifhF58Syh+NsM9W0mgCEzXt+Ap63pRj3RAJs8Yi9dw8NB1HpQ1eY
   MUKvrPCinkDAcSTW3onOvKw8tEG2HYGV5vQAbSygXYC4gHys2kVcBfpFH
   Q==;
X-CSE-ConnectionGUID: PxVbTDIoSnuA/cUW7z0vtA==
X-CSE-MsgGUID: 8+V6xrXXTWyrNCjVjwVmnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61461796"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="61461796"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 17:31:53 -0700
X-CSE-ConnectionGUID: gP0dQJp1R5Ci5yvsjmO8uQ==
X-CSE-MsgGUID: 1UqWgl50SS2yCZXCKoOMnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="146554277"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 May 2025 17:31:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIcnh-000Qpe-1u;
	Sat, 24 May 2025 00:31:45 +0000
Date: Sat, 24 May 2025 08:31:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:stream 5/11] xtensa-linux-ld: core.c:undefined reference
 to `bpf_stream_stage_init'
Message-ID: <202505240850.yC8Fqnus-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux stream
head:   3dcd536f09c7c94c71fb689be70c52d4ef6b8356
commit: 00e293262973c492f394f9f5171e1b2c54001d75 [5/11] bpf: Report may_goto timeout to BPF stderr
config: xtensa-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505240850.yC8Fqnus-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505240850.yC8Fqnus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505240850.yC8Fqnus-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: kernel/bpf/core.o: in function `bpf_internal_load_pointer_neg_helper':
   core.c:(.text+0x854c): undefined reference to `bpf_prog_stream_error_limit'
>> xtensa-linux-ld: core.c:(.text+0x8550): undefined reference to `bpf_stream_stage_init'
>> xtensa-linux-ld: core.c:(.text+0x8554): undefined reference to `bpf_stream_stage_printk'
>> xtensa-linux-ld: core.c:(.text+0x8558): undefined reference to `bpf_stream_stage_dump_stack'
>> xtensa-linux-ld: core.c:(.text+0x855c): undefined reference to `bpf_stream_stage_commit'
>> xtensa-linux-ld: core.c:(.text+0x8560): undefined reference to `bpf_stream_stage_free'
>> xtensa-linux-ld: core.c:(.text+0x85aa): undefined reference to `bpf_prog_stream_error_limit'
   xtensa-linux-ld: core.c:(.text+0x85b7): undefined reference to `bpf_stream_stage_init'
   xtensa-linux-ld: kernel/bpf/core.o: in function `bpf_prog_alloc_no_stats':
>> core.c:(.text+0x85c2): undefined reference to `bpf_stream_stage_printk'
   xtensa-linux-ld: core.c:(.text+0x85ca): undefined reference to `bpf_stream_stage_dump_stack'
   xtensa-linux-ld: core.c:(.text+0x85d6): undefined reference to `bpf_stream_stage_commit'
   xtensa-linux-ld: core.c:(.text+0x85de): undefined reference to `bpf_stream_stage_free'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
