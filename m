Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D833820C461
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768790346; cv=none; b=sue0sp/vDT2JM8XA1IltWIueCUSCrK2uXLhRDwHvBkDspL7jOpmVRp+Ia009UeiKghZ1kh1hd44/HuWF3fS1pTY8SyzNOJJVDG05yWdFlZ0xQsxr/LMZDi9jCXUymvm0w1Y2nR2ycNjFzc2CEWG7pgQWC7llmIO9jJNbkWPlqaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768790346; c=relaxed/simple;
	bh=QR1PXBzDWi4vbTFCJhF0/hWnAjz0exywD1KJw/ScFN4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SoPY6Iv8QOe3pTQel4Q6MkxOJnkvYPZqOB3sH9VGLcNIem+fAB/sUOoM3NCCpfhfOe1fDbEp7O1ZL3j3lwJyzYmOoriyf1DPVVOITkCR5mjTgfo0AoiYHxJ88dhvp0K4st+Qseti04Xo/MDKw+C5x48zTzeXl0PL8r2ETzCgmdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgNRkful; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgNRkful"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768790344; x=1800326344;
  h=date:from:to:cc:subject:message-id;
  bh=QR1PXBzDWi4vbTFCJhF0/hWnAjz0exywD1KJw/ScFN4=;
  b=fgNRkfulMsFYwnLFaxc5uxr3wMK2gLh11vO5l7fxG9a1oiANjknLczaq
   JcDYMlErOuTmaHwaIxehtkvUvO3kgqmDfm3x3kJdgm+jCh7/cQumifKl7
   HUd+6gQyHPcZBcwwtqzPNCquLHMlfHRmYrhNMpZAZUa8FU3B3WmxzYYxb
   gf/90OneO8vy07MTCrT6q1/ogz+bzbJy+Ea2f/U/AO20/Hf0T7Uac0K6/
   pdg0+0Mk2R3QVQZLE63mW4DB4G3O3UL5NVER0si9HS/hcROls0pXH+JA/
   7GhxxLllUd/ge+6whY4vbwv+vOXFp2OY1jjnYXXo62cfudZToJY/w8Z0M
   Q==;
X-CSE-ConnectionGUID: AuPCE0vNTx6zIQ7KULM4dg==
X-CSE-MsgGUID: OKMESxhjSH2C2gWpS6AleQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81113480"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="81113480"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 18:39:03 -0800
X-CSE-ConnectionGUID: Vj0dpXIwQfWOX8TkXpHHbA==
X-CSE-MsgGUID: auo5HuvDTTSG8IACL/hxNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="236437860"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jan 2026 18:39:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhfAR-00000000NMf-06sR;
	Mon, 19 Jan 2026 02:38:59 +0000
Date: Mon, 19 Jan 2026 10:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-restrictions 14/19] syscall.c:undefined
 reference to `io_uring_filter_prog_ops'
Message-ID: <202601191017.PEqGkQFz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions
head:   1bb06e1cce910a14f4cd5f5b6b0e428269d0b26e
commit: 3edf6ee38b9d12d13d5eea1a00efaf9ce87a5a01 [14/19] io_uring: add support for BPF filtering for opcode restrictions
config: loongarch-randconfig-r051-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191017.PEqGkQFz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191017.PEqGkQFz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191017.PEqGkQFz-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: kernel/bpf/syscall.o: in function `.LANCHOR5':
>> syscall.c:(.data.rel.ro+0x468): undefined reference to `io_uring_filter_prog_ops'
   loongarch64-linux-ld: kernel/bpf/verifier.o: in function `.LANCHOR6':
>> verifier.c:(.data.rel.ro+0x1e8): undefined reference to `io_uring_filter_verifier_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
