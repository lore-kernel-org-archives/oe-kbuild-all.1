Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A7523AD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738156922; cv=none; b=C1ornj5BWnupXDEHeIZYgkdwvB3C6SzYRqOBwbYT/uoqWMh3VjUz2zLtSGnQGHVFfW5Uksamh4HYSBh7GYWBM96ugISCobE4Z/8bOtb469cHZ7RBsEk7++sCZYaoIpStM+/2NJl3x0w9znvoSrhw5x1m1rZ63AH+eWVHiA4k5O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738156922; c=relaxed/simple;
	bh=cAdeKhVmfbKhX+NcknZBaa1sj4yD1YsDTeFwxCEeAkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dyvtCGgYgtLSB0ZPf7V/Rx+qOm159uz71jCfhc9466uams7G+qMxPggdTPXNpU0sA79//OP8OZfy6PfwiMaozKInqxIMbL1YfkZP858j25eIgZJM/lSMsh/4XeWDAQI9o9Qy0iSVLP7NMrhSHNjMA2DFqWV39vHalXLrw0jNcOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahtjkSEL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahtjkSEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738156920; x=1769692920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cAdeKhVmfbKhX+NcknZBaa1sj4yD1YsDTeFwxCEeAkA=;
  b=ahtjkSELisgDKXgYJNVOC5rU3t6pUR3vnZFhKAMg8Om964pvFsTTxpSe
   S76To0jaqVyP5t4Z3hF3TQVp1Lyj0Z9lEWm9bPpy8aSCBVUjG/pPFlRCe
   qpT7BO6kdgeenU4ea3gZjZcZd25vED6OEMCx6Cs+PPbw06vy2lrf4Omvp
   52QCvqE0aW/xzGYnj7gD2n3gJhdzqckCYEzTSvTBHinRj1jMyovjOqXAK
   4desS1ZKgZGocfMqrvuN2V7mphT5yww5Gi8Rl9H+rGrvV/7UyY/QJiCvr
   4R0F2Oz5K4IPhpiDJAvQF/9OoD0ENKZDbI1lsaOTHB9g4xQgnkPlHCHBE
   A==;
X-CSE-ConnectionGUID: /QwxbnypSg69nEzpdsZFuA==
X-CSE-MsgGUID: r767pL8cTQGRUGND0Boqvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50083239"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50083239"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 05:22:00 -0800
X-CSE-ConnectionGUID: JEybQh7wSgKvS5YzdjNq2A==
X-CSE-MsgGUID: A0oWZsR9QvyjStyaY/l2tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109945380"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jan 2025 05:21:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td80y-000iyh-2U;
	Wed, 29 Jan 2025 13:21:56 +0000
Date: Wed, 29 Jan 2025 21:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_13 12/18]
 arch/x86/kernel/uprobes.c:317:12: warning: 'is_call_insn' defined but not
 used
Message-ID: <202501292124.eb934HOp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_13
head:   a264266ebd33899155a0cf37feac0ef4e300cec0
commit: 4f491bb5453694500c4681edd76e1843c8f4de4e [12/18] uprobes/x86: Add support to optimize uprobes
config: i386-randconfig-r063-20250129 (https://download.01.org/0day-ci/archive/20250129/202501292124.eb934HOp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501292124.eb934HOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501292124.eb934HOp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:317:12: warning: 'is_call_insn' defined but not used [-Wunused-function]
     317 | static int is_call_insn(uprobe_opcode_t *insn)
         |            ^~~~~~~~~~~~
   arch/x86/kernel/uprobes.c:312:12: warning: 'is_nop5_insn' defined but not used [-Wunused-function]
     312 | static int is_nop5_insn(uprobe_opcode_t *insn)
         |            ^~~~~~~~~~~~


vim +/is_call_insn +317 arch/x86/kernel/uprobes.c

   316	
 > 317	static int is_call_insn(uprobe_opcode_t *insn)
   318	{
   319		return *insn == CALL_INSN_OPCODE;
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
