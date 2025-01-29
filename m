Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025CF186615
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 11:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738150103; cv=none; b=S4Ce7vNvWNlbxWp3QYTqcsOmVcRRKoT6Ge/wSogXNTTN+0PtJc5/J6O0FfW1QD+0VC6QfV2yeYchyxttSQVPAkyeg/jP8Qrazxd1+/mHxfqSxQ/C18adhJpWkFY8EmYjmakxQKZxrwkRTbdeJQub7UUZ/PhHTc1tM0JGC/1AQ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738150103; c=relaxed/simple;
	bh=qElnD67VIjri+JIJuOGpqWtyMFKqFXllHDFdJr/uQes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iai1w1xUsC2v7kzGfCGRji59KEgBGfD2TgH3gkyxuHqKzyzSY0xsSOKEsKgmKXB2GHKdvwOnuizqZsu68mf3hJkwwa4YK+xpXbWEAqE1D4NPiW6DWiltJCFWoEm/EjAfEMDuANuYNDvZnAY/aiIl2HOjH33Fu4L2P9ECf0GxWsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzlO3+Oo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzlO3+Oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738150102; x=1769686102;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qElnD67VIjri+JIJuOGpqWtyMFKqFXllHDFdJr/uQes=;
  b=XzlO3+OoeHRAUy7aUGbhfA3Pbs84wPmlVHjSIcClwvesonTR2+7Fr0iS
   TmYudMIy5M7NaBDaorcrZVu7E7oTITmnQRcgxqZVpJMf0xI1MZbIsFOXW
   xQAt+Xt85LwTAjbB9E/wf153jXNkTcO8ZW5kPRf3KDiAhovvlQ5vdbkzW
   GrUXp9mCjBjYm3kRysKkN9fLKmG/4dIPw42Tq66EiuwkylbgK/XIauwM4
   tB5pOqliflWURwDobhHzADvrxKjJdtfEZv9vMnMKbCzGHjmA7wJSEzemB
   bIeMh2NFhKmSraP4sVEZvhsxgwzD5jcbmDK/OEtwJ+8faRCr+OAvghEEv
   Q==;
X-CSE-ConnectionGUID: ieLuVmGrRQ6UqE0nXk0ZQA==
X-CSE-MsgGUID: Lt7aW2o9TuGnBqdlfryWww==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38545226"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="38545226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 03:26:50 -0800
X-CSE-ConnectionGUID: 6XthRaatQXS+DamaGlg3Yg==
X-CSE-MsgGUID: vXv8cd21SNSoN7L/jIZFDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146203155"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2025 03:26:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td6DW-000itj-2y;
	Wed, 29 Jan 2025 11:26:46 +0000
Date: Wed, 29 Jan 2025 19:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_13 11/18]
 arch/x86/kernel/uprobes.c:311:12: warning: 'is_nop5_insn' defined but not
 used
Message-ID: <202501291935.QSeSWl6R-lkp@intel.com>
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
commit: f64d5d0ca0ec641579cbf42a9d3cdd33b75db717 [11/18] uprobes/x86: Add support to emulate nop5 instruction
config: i386-randconfig-r063-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291935.QSeSWl6R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291935.QSeSWl6R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291935.QSeSWl6R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:311:12: warning: 'is_nop5_insn' defined but not used [-Wunused-function]
     311 | static int is_nop5_insn(uprobe_opcode_t *insn)
         |            ^~~~~~~~~~~~


vim +/is_nop5_insn +311 arch/x86/kernel/uprobes.c

   310	
 > 311	static int is_nop5_insn(uprobe_opcode_t *insn)
   312	{
   313		return !memcmp(insn, x86_nops[5], 5);
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
