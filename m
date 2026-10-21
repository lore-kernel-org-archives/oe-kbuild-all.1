Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566659;
	b=EoQ4Gv4o3z+VNsxOPWni5o5x2nhVjUTV1XsHnfx07lbHyTeNltf3J5ElIxpJ0E/JJDgV
	 Vem1Yofhui642wwYoFLFcbNHft2j2g+hf3Cx37OrP2cYfHbLukdt7jXYfTm3Kydn+aPN8
	 +YUZLBnCHE1jL+X825JvleBhotPja+qg9i8+qE6IcYrKherpopeT754J3uqDnhMztKw7j
	 YedWmiASUSEDgxeFPFnu+qZxi+oQoOWKidDti/4S7fqXaHnbD7tGSAIu2pvNvjMu0DrJW
	 Tl921QAfG1v3qtKPs0JMuB8UMnba2N6vQHyqcIv6gCicrmge9/of3IlpRz63rQCX3AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566659;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gKY+wN99+EQDHwj5keMdigrrGw6VSwTariSsP6enGUI=;
	b=tQ01wAGFtDUPUTVk7hpQKJoYJnXFhVp9REcxj1ArtB38xdhsb8MRIYCp7LlbsP9G4evO
	 szkbPiuuUjINCjb5szcWkV3ruGVpqKXAO39d0kCtnOD9QZJ7tQwpgQptBvy5c1yfO9Iy9
	 9sI9tqRguxRJta2+Xh9bCFn5O0c5infe9dIysVq+GnFMTtJjfts+ZNyO6hsrNluA4UYQ+
	 XSzyucm9qZF4l/crFwpTAUk0G4NFIkZ0PUbhB6z90S+EsFFt5P54Ni9t9ZRTSIFUyI4ep
	 4k8p8dfEko2fXdfO8Ky0LPFpN1Ntjn6KAsQ4+zrprvmYz3FaGC9aGQW7LfC2mmG0iYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LEqn9Lpt;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC7C606A319
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 07:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC7C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LEqn9Lpt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792566659; x=1824102659;
  h=date:from:to:cc:subject:message-id;
  bh=9xz6YIpLd6Kyk2rAuWwU2zaX38wbunakOKqUifLfRTY=;
  b=LEqn9LptQWy2x1oRffvyb7oo0ALWijpmlHEb6H2aW2FSuU0hqUzaRjA4
   YrxH2NU72nzAtdhH6n9fqakCkSdwrdQayHrWukZsbFbWfdTqLFf8G+t4i
   2RWw3fDP/HMpSYAozrEMbYvrw86+d6a925OuFKV1gO0LWpa2BXkOH1hxl
   C+WrVfxBYwWNhLcr8yGIAlzEQ8seniFmYjUkQDALGVZv4ME9ou9dckEv1
   GJ/PSS9ZtAEwoz9r7S97GAVLdSIx9jWsymXMQ/KVBUf6j6O+T9Doaptnm
   efDrIGlbmu67Isjqf+kDnpTGsLKfZ36TLD2bBzzOdz8u/y/7vqjkw6MDP
   Q==;
X-CSE-ConnectionGUID: +9ZeWpA3QXK44rgH9KA90A==
X-CSE-MsgGUID: dtEPF+PRSnWDb9Q3szF7UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1299655"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1299655"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 00:10:58 -0700
X-CSE-ConnectionGUID: ftcQU8ZSTdKLOb73peQOzw==
X-CSE-MsgGUID: t7QjW/SQSQOFEv1HQdBg6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3372492"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2026 00:10:56 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJQTO-00000000P6s-1VMP;
	Wed, 21 Oct 2026 07:10:54 +0000
Date: Wed, 21 Oct 2026 15:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4 10/22] arch/x86/kernel/kvm.o: warning:
 objtool: __raw_callee_save___kvm_vcpu_is_preempted+0x1a: unreachable
 instruction
Message-ID: <202610211540.PkFsNgT1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4
head:   6a0fa5d8e005033f0d73c2cbabb5e555ea8575d2
commit: 60aee4318ce34e68540772a2cdb3f57b04d4c9d1 [10/22] x86/kvm: Use RIP-relative addressing
config: x86_64-randconfig-1015-20261021 (https://download.01.org/0day-ci/archive/20261021/202610211540.PkFsNgT1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610211540.PkFsNgT1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610211540.PkFsNgT1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/kvm.o: warning: objtool: __raw_callee_save___kvm_vcpu_is_preempted+0x1a: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
