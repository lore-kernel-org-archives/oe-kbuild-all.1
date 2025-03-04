Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2291F281522
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107911; cv=none; b=TB++jyTpOeAOfQr4Akkolp9drJig1u/QrMiAm9byPf2ynGHXlO193BEaspWrFkKyzVwVL0T3RSSTa63/Al5NbBVmfjpI3VFTD9yOISPnVykfoNMxEbr4vabyC//MAwaX5r4WmsA8N+jv/cALuZMHY4oZF+Ysl2eNp9Nxa62E5Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107911; c=relaxed/simple;
	bh=Nu4X59cI9P5fbtyKUuwM/sS5UYFJ4sQtiD6qn62hGNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkZS+nbVMxY63/Y+gzadsCregC1MgzHqbEY18UkuySI2SIt+PqBFNspWQ9ePpBwiZarZezuO4HH95xKOikVvj6n3xfyFEH4PDUbQ1ydN0SKW6ai8HRvyjemcjS+vkqgBgR20dnvDfi2e4pu09pOlZwAEA8JMVZgqfGqyeOCe8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4xR1DCP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4xR1DCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741107908; x=1772643908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nu4X59cI9P5fbtyKUuwM/sS5UYFJ4sQtiD6qn62hGNo=;
  b=B4xR1DCPtGBSH2q+roQgKLAGwIJn60wdVsE5bYUH6WX/K2TUdO8ZA16K
   Ni9ChiS3In0rgdL+ciiEViCw5I6uJHhFyWHWkwrg5EoTHCO+1/T7HVxay
   K0G8aPjuqz53QE/i6v5g1x7hTD204Ujzg5lptizYNq8v9uV3TUxwPfDBu
   JrCfSorSJ7eQUvzBetM00QAGJNTHr6Jp/qKPmYXrIhMqvAj2wMc4XS/uu
   bwE5dynulDfsUiPSdNdBTOhCNSWyIlmPXcca5wKGS8A9aMeTzJq5N5N90
   zXlkzJHiHOQ7vQ+xaupDjgkfEzmnc7cys4F4OsI2cz5VzbZ+tubuzVzd5
   g==;
X-CSE-ConnectionGUID: CTWE/y7WTIOcG6uZwcjO/g==
X-CSE-MsgGUID: 90d5iqt/QiGc8UyxpwZ54w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52679573"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="52679573"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 09:05:07 -0800
X-CSE-ConnectionGUID: 9IrIVAMCTFq+71r78jaTGg==
X-CSE-MsgGUID: pAFfChYOSx+HtqUn3i/gXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123633175"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2025 09:05:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpVhY-000K32-0L;
	Tue, 04 Mar 2025 17:05:04 +0000
Date: Wed, 5 Mar 2025 01:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH -tip 3/5] x86/irq/32: Add ASM_CALL_CONSTRAINT to inline
 asm using CALL_NOSPEC
Message-ID: <202503050048.Fh0HfhoQ-lkp@intel.com>
References: <20250303155446.112769-3-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303155446.112769-3-ubizjak@gmail.com>

Hi Uros,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/auto-latest linus/master v6.14-rc5 next-20250304]
[cannot apply to tip/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/x86-irq-32-Add-missing-clobber-to-inline-asm/20250303-235755
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250303155446.112769-3-ubizjak%40gmail.com
patch subject: [PATCH -tip 3/5] x86/irq/32: Add ASM_CALL_CONSTRAINT to inline asm using CALL_NOSPEC
config: i386-buildonly-randconfig-003-20250304 (https://download.01.org/0day-ci/archive/20250305/202503050048.Fh0HfhoQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050048.Fh0HfhoQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050048.Fh0HfhoQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/irq_32.c: In function 'call_on_stack':
>> arch/x86/kernel/irq_32.c:62:24: error: expected ':' or ')' before 'COMMA'
      62 |                        COMMA(ASM_CALL_CONSTRAINT)
         |                        ^~~~~
   arch/x86/kernel/irq_32.c: In function 'execute_on_irq_stack':
   arch/x86/kernel/irq_32.c:102:24: error: expected ':' or ')' before 'COMMA'
     102 |                        COMMA(ASM_CALL_CONSTRAINT)
         |                        ^~~~~


vim +62 arch/x86/kernel/irq_32.c

    54	
    55	static void call_on_stack(void *func, void *stack)
    56	{
    57		asm volatile("xchgl %[sp], %%esp\n"
    58			     CALL_NOSPEC
    59			     "movl %[sp], %%esp"
    60			     : [sp] "+b" (stack)
    61			     : [thunk_target] "D" (func)
  > 62			       COMMA(ASM_CALL_CONSTRAINT)
    63			     : "memory", "cc", "edx", "ecx", "eax");
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
