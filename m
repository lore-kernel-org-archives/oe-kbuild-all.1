Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E48C19882B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754289111; cv=none; b=sT4DmN1vwSdhVx94bgf4qEKPK1KeH900uRwJoLfmjHwMeoI0R7QOVGePNF7vf8W/z8gPWgI1vw5jxIT2Gb/FXEOeFWPQvHh/zdlQfgiz8ThAsO5KcMQGugnqF9qWdzCRCvljKy5hCaZFy5hpzC8lbA87PYkSrSCzDEtkL+Sd2rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754289111; c=relaxed/simple;
	bh=UafZemI0paeQt21oiQixqcdq1hdOjsoDRhhXm49OSbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pevgHJJLcS6z6TQSjlDckBJAEdrJnS6DzzVhVAyB69Ft+FFcT4jfYcrn97JcDdJfNLRlSc5szgJkn4wIbJ/dal7bELb48agkTENx8RbSA1K17/ZTwoXC10JhcsDPPJUTu9fztk+cBDuwfRWEemRbh70caK37tRfEaAP7Q/dO5mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWw3u/Lv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWw3u/Lv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754289108; x=1785825108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UafZemI0paeQt21oiQixqcdq1hdOjsoDRhhXm49OSbs=;
  b=JWw3u/LvrlDiE07TOiJtJWcpaM+nXsQL6VkAE1K+VVHXgAwliygrZFk/
   R7oEWbTBVMB4/zReTtbZmURKtOXYwMnBFYjrqEEXY1D10cq26IkBLe7zg
   zKD7i9jPVQDIGBuj82NUAKUPlraQlmD13g4swQZyLzbpIvu/kyUe2uds8
   1izydN49i4u8yaqot9xFsRHXhyo4IQvyOCJ7quIfVaJtAmen6yqovN8g7
   hdWZjT1bYUMrw/jDPWWBuxQ/AlqfJ/mCQvDF82B68nhwwhRCn+D7Qa/E/
   aBqiMPL3bFu4wUHzd7+CKua8oyXWM0bkEntg5zH7Tuw2fc1qYv6HIsLq3
   A==;
X-CSE-ConnectionGUID: 7ridLnBpQhyDQU2gi9DK/w==
X-CSE-MsgGUID: LJWZ2GnwQmmQ47n3jKA1DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="44129487"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44129487"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 23:31:47 -0700
X-CSE-ConnectionGUID: RiB5jqrMTF6n0tfQrawbGg==
X-CSE-MsgGUID: jOSq2yRsTAiDehlN9t1INQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164069740"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 03 Aug 2025 23:31:46 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiojX-0001jv-2z;
	Mon, 04 Aug 2025 06:31:43 +0000
Date: Mon, 4 Aug 2025 08:30:48 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 arch/x86/mm/cpu_entry_area.c:155:5: warning: no previous prototype for
 'arch_get_kallsym'
Message-ID: <202508040829.QB64jfaH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ba07135cf74b1424e2f7f0c60e59c5b206ab320c
commit: d83212d5dd6761625fe87cc23016bbaa47303271 [1743/1743] kallsyms, x86: Export addresses of PTI entry trampolines
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250804/202508040829.QB64jfaH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040829.QB64jfaH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040829.QB64jfaH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/cpu_entry_area.c:155:5: warning: no previous prototype for 'arch_get_kallsym' [-Wmissing-prototypes]
     155 | int arch_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
         |     ^~~~~~~~~~~~~~~~


vim +/arch_get_kallsym +155 arch/x86/mm/cpu_entry_area.c

   153	
   154	#ifdef CONFIG_X86_64
 > 155	int arch_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
   156			     char *name)
   157	{
   158		unsigned int cpu, ncpu = 0;
   159	
   160		if (symnum >= num_possible_cpus())
   161			return -EINVAL;
   162	
   163		for_each_possible_cpu(cpu) {
   164			if (ncpu++ >= symnum)
   165				break;
   166		}
   167	
   168		*value = (unsigned long)&get_cpu_entry_area(cpu)->entry_trampoline;
   169		*type = 't';
   170		strlcpy(name, "__entry_SYSCALL_64_trampoline", KSYM_NAME_LEN);
   171	
   172		return 0;
   173	}
   174	#endif
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
